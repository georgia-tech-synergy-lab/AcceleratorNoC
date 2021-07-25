#include "BENES_controller.hpp"
#define generate_config
// #define DEBUG

// global variable
sim_config_t sim_conf;
std::vector<data_t *> data_stage;
std::vector<config_t *> config_stage;
std::vector<int *> BENES_connection;
FILE *i_data = NULL; // i_data file
bool IsMulticasting = false; // global variable to decide whether to implement multicasting.

// Print error usage
static void print_err_usage(const char *err)
{
    printf("%s\n", err);

    fprintf(stderr, "./BENES_controller -i <input file> -n <Number of input data>\n");
    fprintf(stderr, "Look at input_file for example configuration file\n");

    exit(EXIT_FAILURE);
}

void setup_proc(const sim_config_t* sim_conf){
    /*
        Initialize the mode with unicasting
    */
    IsMulticasting = false;

    /*
        data should record both input and output of all stages
        So here we need an extra stage.
    */
    data_stage.resize(sim_conf->num_stage+1);
    for(int i = 0; i<sim_conf->num_stage+1; i++){
        data_t* data_ptr = new data_t [sim_conf->num_in_data];
        for(int j=0; j< sim_conf->num_in_data; j++){
            data_ptr[j].data = INVALID_DATA;
            data_ptr[j].is_config_gen = false;
            data_ptr[j].target_data = INVALID_DATA;
        }
        data_stage[i] = data_ptr;
    }

    /*
        config only need to record configuration for all switches.
    */
    config_stage.resize(sim_conf->num_stage);
    for(int i = 0; i<sim_conf->num_stage; i++){
        config_t* config_ptr = new config_t [sim_conf->num_in_data];
        for(int j=0; j < sim_conf->num_in_switch; j++){
            config_ptr[j] = OP_NOP;
        }
        config_stage[i] = config_ptr;
    }

    // connection function generation -- first half stages
    BENES_connection.resize(sim_conf->num_stage-1);
    for(int i = 0; i<sim_conf->num_half_stage-1; i++){
        int num_data_per_group = (0b1 << sim_conf->num_half_stage) >> i; 
        int data_mask = num_data_per_group - 0b1;
        int* connection_ptr = new int [sim_conf->num_in_data];
        for(int g = 0; g < (0b1 << i); g++){
            for(int j=0; j < num_data_per_group; j++){
                connection_ptr[j+g*num_data_per_group] = ((j >> 1)&data_mask);
                if((j & 0b1) == 0b1){
                    connection_ptr[j+g*num_data_per_group] += (num_data_per_group>>1) ;
                }
                connection_ptr[j+g*num_data_per_group] += num_data_per_group*g;
            }
        }
        BENES_connection[i] = connection_ptr;
    }

    // connection function generation -- second half stages
    // the commented part are specifing the inverse shuffle connection
    for(int i = sim_conf->num_half_stage-1; i<sim_conf->num_stage-1; i++){
        int num_data_per_group = (0b1 << sim_conf->num_half_stage) >> (sim_conf->num_stage-2-i); 
        int data_mask = num_data_per_group - 0b1;
        int* connection_ptr = new int [sim_conf->num_in_data];
        // int MSB_mask = num_data_per_group >> 1;
        for(int g = 0; g < (0b1 << (sim_conf->num_stage-2-i)); g++){
            // for(int j=0; j < num_data_per_group; j++){
            //     connection_ptr[j+g*num_data_per_group] = ((j << 1)&data_mask);
            //     if((j & MSB_mask) == MSB_mask){
            //         connection_ptr[j+g*num_data_per_group] += 0b1;
            //     }
            //     connection_ptr[j+g*num_data_per_group] += num_data_per_group*g;
            // }
            for(int j=0; j < num_data_per_group; j++){
                connection_ptr[j+g*num_data_per_group] = ((j >> 1)&data_mask);
                if((j & 0b1) == 0b1){
                    connection_ptr[j+g*num_data_per_group] += (num_data_per_group>>1) ;
                }
                connection_ptr[j+g*num_data_per_group] += num_data_per_group*g;
            }
        }
        BENES_connection[i] = connection_ptr;
    }

    // for debug -- print the connection functions  
#ifdef DEBUG
    for(int i=0; i<sim_conf->num_stage-1; i++){
        for(int j=0; j<sim_conf->num_in_data; j++){
            std::cout <<BENES_connection[i][j] << " ";
        }
        std::cout << std::endl;
    }
#endif
}

void read_input(const sim_config_t* sim_conf){
    std::vector<int> in_data;
    in_data.resize(sim_conf->num_in_data);

    for(int i=0; i<sim_conf->num_in_data;i++){
        fscanf(i_data, "%d", &data_stage[0][i].data);
        in_data[i] = data_stage[0][i].data;
    }

    for(int i =0; i<sim_conf->num_in_data-1; i++){
        if(in_data[i] == in_data[i+1])
            IsMulticasting = true;
    }

    // for debug -- print the content read from the input file.  
#ifdef DEBUG
    for(int i=0; i< sim_conf->num_in_data; i++){
        std::cout << data_stage[0][i].data << " ";
    }
    std::cout << std::endl;
    if(IsMulticasting)
        std::cout << "Multicasting" << std::endl;
#endif
}

void run_multicasting_configuration(const sim_config_t* sim_conf){
    /*
        Var: the data_stage records the data where 
        1. fill destination into the last stage of the BENES network.
        2. reset input data into 0~7, and put the data read from input file into target_data
        Loop of all stages 
            3. generate the config for the external stage of the BENES network based
            Essential idea: replace data by target data if data and target_data is different.  
            4. pass the data into the next stage
            5. pass the target_data into the next stage
    */

    // connection function generation -- second half stages
    // the commented part are specifing the inverse shuffle connection
    for(int i = sim_conf->num_half_stage-1; i<sim_conf->num_stage-1; i++){
        int num_data_per_group = (0b1 << sim_conf->num_half_stage) >> (sim_conf->num_stage-2-i); 
        int data_mask = num_data_per_group - 0b1;
        int* connection_ptr = new int [sim_conf->num_in_data];
        int MSB_mask = num_data_per_group >> 1;
        for(int g = 0; g < (0b1 << (sim_conf->num_stage-2-i)); g++){
            for(int j=0; j < num_data_per_group; j++){
                connection_ptr[j+g*num_data_per_group] = ((j << 1)&data_mask);
                if((j & MSB_mask) == MSB_mask){
                    connection_ptr[j+g*num_data_per_group] += 0b1;
                }
                connection_ptr[j+g*num_data_per_group] += num_data_per_group*g;
            }
        }
        BENES_connection[i] = connection_ptr;
    }

    // 1 & 2
    for(int i=0; i<sim_conf->num_in_data; i++){
        data_stage[sim_conf->num_stage][i].data = data_stage[0][i].data;
        data_stage[sim_conf->num_stage][i].target_data = data_stage[0][i].data;
        data_stage[0][i].target_data = data_stage[0][i].data;
        data_stage[0][i].data = i;
        data_stage[sim_conf->num_stage][i].is_config_gen = false;
    }

    for(int i=0; i< sim_conf->num_in_data; i++){
        std::cout << data_stage[0][i].data << " ";
    }
    std::cout << std::endl;

    for(int i=0; i< sim_conf->num_in_data; i++){
        std::cout << data_stage[0][i].target_data << " ";
    }
    std::cout << std::endl;

    // 3
    for(int stage_idx=0; stage_idx<sim_conf->num_stage; stage_idx++){
        for (int sw_idx=0; sw_idx < sim_conf->num_in_switch; sw_idx++ ){
            
            if(data_stage[stage_idx][sw_idx<<1].data !=  data_stage[stage_idx][sw_idx<<1].target_data && data_stage[stage_idx][(sw_idx<<1)+1].data ==  data_stage[stage_idx][sw_idx<<1].target_data )
                config_stage[stage_idx][sw_idx] = OP_MH;
            else if(data_stage[stage_idx][(sw_idx<<1)+1].data !=  data_stage[stage_idx][(sw_idx<<1)+1].target_data && data_stage[stage_idx][sw_idx<<1].data ==  data_stage[stage_idx][(sw_idx<<1)+1].target_data )
                config_stage[stage_idx][sw_idx] = OP_ML;
            else
                config_stage[stage_idx][sw_idx] = OP_PT;

            if(stage_idx <sim_conf->num_stage-1){
                if(config_stage[stage_idx][sw_idx] == OP_MH){
                    data_stage[stage_idx+1][BENES_connection[stage_idx][(sw_idx<<1)]].data = data_stage[stage_idx][(sw_idx<<1)+1].data;
                    data_stage[stage_idx+1][BENES_connection[stage_idx][(sw_idx<<1)+1]].data = data_stage[stage_idx][(sw_idx<<1)+1].data;
                    
                    data_stage[stage_idx+1][BENES_connection[stage_idx][(sw_idx<<1)]].target_data = data_stage[stage_idx][(sw_idx<<1)+1].target_data;
                    data_stage[stage_idx+1][BENES_connection[stage_idx][(sw_idx<<1)+1]].target_data = data_stage[stage_idx][(sw_idx<<1)+1].target_data;   
                }
                else if(config_stage[stage_idx][sw_idx] == OP_ML){
                    data_stage[stage_idx+1][BENES_connection[stage_idx][(sw_idx<<1)]].data = data_stage[stage_idx][(sw_idx<<1)].data;
                    data_stage[stage_idx+1][BENES_connection[stage_idx][(sw_idx<<1)+1]].data = data_stage[stage_idx][(sw_idx<<1)].data;

                    data_stage[stage_idx+1][BENES_connection[stage_idx][(sw_idx<<1)]].target_data = data_stage[stage_idx][(sw_idx<<1)].target_data;
                    data_stage[stage_idx+1][BENES_connection[stage_idx][(sw_idx<<1)+1]].target_data = data_stage[stage_idx][(sw_idx<<1)].target_data;   
                }
                else{
                    data_stage[stage_idx+1][BENES_connection[stage_idx][(sw_idx<<1)]].data = data_stage[stage_idx][(sw_idx<<1)].data;
                    data_stage[stage_idx+1][BENES_connection[stage_idx][(sw_idx<<1)+1]].data = data_stage[stage_idx][(sw_idx<<1)+1].data;

                    data_stage[stage_idx+1][BENES_connection[stage_idx][(sw_idx<<1)]].target_data = data_stage[stage_idx][(sw_idx<<1)].target_data;
                    data_stage[stage_idx+1][BENES_connection[stage_idx][(sw_idx<<1)+1]].target_data = data_stage[stage_idx][(sw_idx<<1)+1].target_data;
                } 
            }
        }
    }
}

void run_unicasting_configuration(const sim_config_t* sim_conf){
    /*
        Var: the data_stage records the data where 
        1. fill destination into the last stage of the BENES network.
        2. generate the config for the external stagae of the BENES network.
    */

    // 1 
    for(int i=0; i<sim_conf->num_in_data; i++){
        data_stage[sim_conf->num_stage][i].data = i;
        data_stage[sim_conf->num_stage][i].is_config_gen = false;
    }

#ifdef generate_config
    // 2 
    for(int pair_idx=0; pair_idx<sim_conf->num_half_stage-1; pair_idx++){
        // loop for all pairs of external stages. 
        int num_processed = 0;
        int next_served_data = 0;
        while(num_processed < sim_conf->num_in_switch){
            /*
                1. find one and start there
                2. define destination half variable
                3. generate configuration until forming a loop
            */

            // 1 
            int idx_in = 0;
            for(int j=0; j<sim_conf->num_in_data; j++){
                if(data_stage[pair_idx][j].is_config_gen == false){
                    next_served_data = data_stage[pair_idx][j].data;
                    idx_in = j;
                    break;
                }
            }
#ifdef DEBUG
            std::cout << "first index in = " << idx_in << " next_served_data = " << next_served_data << std::endl;
#endif      
            // 2 
            // Need to decide which data of a single switch go through the upper part of BENES
            // initially, pick the first unassigned switch & make the lower input go to the upper half of inner BENES
            bool should_top = true; 

            // 3
            while(!data_stage[pair_idx][idx_in].is_config_gen){
                /*
                    1. [input stage] generate configuration for the switch, 
                        (a) Let the lower input data of the switch go througth the upper part of BENES
                            which means that let another input data of the same switch go through the lower part of BENES
                        (b) update control var (should_top & next_served_data ) for controlling the output stages.
                    2. [input stage] Set config_gen bit to true for data sharing the same input switch
                    3. [input stage] Pass the data into the next stage.
                    4. [outer loop iteration var] increase the num_processed to record 
                        the number of data that have been served
                    5. [output stage] find the index of served_data in the output stage
                    6. [output stage] Set config_gen bit to true for data sharing the same output switch
                    7. [output stage] Set corresponding connection in the output, the data going through upper half
                                    in the input stage should also come from upper part of BENES in output stage. 
                    8. [output stage] back trace the data into the previous stage.
                    9. [output stage] Update next_served_data
                */
            
                // 1 
                if(should_top){
                    should_top = false;
                    if(idx_in & 0b1 == 0b1){
                        config_stage[pair_idx][idx_in>>1] = OP_CROSS;
                        next_served_data = data_stage[pair_idx][((idx_in>>1)<<1)].data;
                    }
                    else{    
                        config_stage[pair_idx][idx_in>>1] = OP_PT;
                        next_served_data = data_stage[pair_idx][((idx_in>>1)<<1)+1].data;
                    }
                }
                else{
                    should_top = true;
                    if(idx_in & 0b1 == 0b1){
                        config_stage[pair_idx][idx_in>>1] = OP_PT;
                        next_served_data = data_stage[pair_idx][((idx_in>>1)<<1)].data;
                    }
                    else{    
                        config_stage[pair_idx][idx_in>>1] = OP_CROSS;
                        next_served_data = data_stage[pair_idx][((idx_in>>1)<<1)+1].data;
                    }                
                }

                // 2 
                data_stage[pair_idx][((idx_in>>1)<<1)].is_config_gen = true;
                data_stage[pair_idx][((idx_in>>1)<<1)+1].is_config_gen = true;

                // 3
                if(config_stage[pair_idx][idx_in>>1] == OP_PT){
                    data_stage[pair_idx+1][BENES_connection[pair_idx][((idx_in>>1)<<1)]].data = data_stage[pair_idx][((idx_in>>1)<<1)].data;
                    data_stage[pair_idx+1][BENES_connection[pair_idx][((idx_in>>1)<<1)+1]].data = data_stage[pair_idx][((idx_in>>1)<<1)+1].data;
                }
                else{
                    data_stage[pair_idx+1][BENES_connection[pair_idx][((idx_in>>1)<<1)]].data = data_stage[pair_idx][((idx_in>>1)<<1)+1].data;
                    data_stage[pair_idx+1][BENES_connection[pair_idx][((idx_in>>1)<<1)+1]].data = data_stage[pair_idx][((idx_in>>1)<<1)].data;
                }

                // 4
                num_processed+=1;

                // 5
                int idx_out = 0;
                for(int j=0; j<sim_conf->num_in_data; j++){
                    if(data_stage[sim_conf->num_stage - pair_idx][j].data == next_served_data){
                        idx_out = j;
                    }
                }
#ifdef DEBUG 
                std::cout << "pair_idx = " << pair_idx << " idx_out = " << idx_out << " next_served_data = " << next_served_data << std::endl;
#endif
                // 5 
                data_stage[sim_conf->num_stage - pair_idx][((idx_out>>1)<<1)].is_config_gen = true;
                data_stage[sim_conf->num_stage - pair_idx][((idx_out>>1)<<1)+1].is_config_gen = true;
                
                // 6 & 7
                if(should_top){
                    should_top = false;
                    if( idx_out & 0b1 == 0b1){
                        config_stage[sim_conf->num_stage-1-pair_idx][idx_out>>1] = OP_CROSS;
                        next_served_data = data_stage[sim_conf->num_stage - pair_idx][idx_out-1].data;
                    }
                    else{
                        config_stage[sim_conf->num_stage-1-pair_idx][idx_out>>1] = OP_PT;
                        next_served_data = data_stage[sim_conf->num_stage - pair_idx][idx_out+1].data;
                    }
                }
                else{
                    should_top = true;
                    if( idx_out & 0b1 == 0b1){
                        config_stage[sim_conf->num_stage-1-pair_idx][idx_out>>1] = OP_PT;
                        next_served_data = data_stage[sim_conf->num_stage - pair_idx][idx_out-1].data;
                    }
                    else{
                        config_stage[sim_conf->num_stage-1-pair_idx][idx_out>>1] = OP_CROSS;
                        next_served_data = data_stage[sim_conf->num_stage - pair_idx][idx_out+1].data;
                    }           
                }

                // 8
                if(config_stage[sim_conf->num_stage-1-pair_idx][idx_out>>1] == OP_PT){
                    data_stage[sim_conf->num_stage-pair_idx-1][BENES_connection[((sim_conf->num_half_stage-1)<<1)-1-pair_idx][((idx_out>>1)<<1)]].data = data_stage[sim_conf->num_stage-pair_idx][((idx_out>>1)<<1)].data;
                    data_stage[sim_conf->num_stage-pair_idx-1][BENES_connection[((sim_conf->num_half_stage-1)<<1)-1-pair_idx][((idx_out>>1)<<1)+1]].data = data_stage[sim_conf->num_stage-pair_idx][((idx_out>>1)<<1)+1].data;
                }
                else{
                    data_stage[sim_conf->num_stage-pair_idx-1][BENES_connection[((sim_conf->num_half_stage-1)<<1)-1-pair_idx][((idx_out>>1)<<1)]].data = data_stage[sim_conf->num_stage-pair_idx][((idx_out>>1)<<1)+1].data;
                    data_stage[sim_conf->num_stage-pair_idx-1][BENES_connection[((sim_conf->num_half_stage-1)<<1)-1-pair_idx][((idx_out>>1)<<1)+1]].data = data_stage[sim_conf->num_stage-pair_idx][((idx_out>>1)<<1)].data;
                }
                
                // 9 
                for(int j=0; j<sim_conf->num_in_data; j++){
                    if(data_stage[pair_idx][j].data == next_served_data){
                        idx_in = j;
                    }
                }
#ifdef DEBUG 
                std::cout << "pair_idx = " << pair_idx << " idx_in = " << idx_in << " data = " << data_stage[pair_idx][idx_in].data << " next_served_data = " << next_served_data;
                if( data_stage[pair_idx][idx_in].is_config_gen){
                    std::cout << " is_config_gen == true" << std::endl << std::endl;
                }
                else{
                    std::cout << " is_config_gen == false" << std::endl << std::endl;
                }
#endif
            }
        }

        // the most inner stage
        for(int i=0; i<sim_conf->num_stage; i++){
            if(data_stage[sim_conf->num_half_stage-1][i<<1].data == data_stage[sim_conf->num_half_stage][i<<1].data)
                config_stage[sim_conf->num_half_stage-1][i] = OP_PT;
            else
                config_stage[sim_conf->num_half_stage-1][i] = OP_CROSS;
        }
    }
}
#endif

void run_proc(const sim_config_t* sim_conf){
    // choose the corresponding configuration generation strategy based on IsMulticasting

    if(IsMulticasting)
        run_multicasting_configuration(sim_conf);
    
    else
        run_unicasting_configuration(sim_conf);
}

void test_config(const sim_config_t* sim_conf){
    /* 
        1. design BENES connection function 
            (second half differ from the original one)
            becuase here we only forward data from input to output
            while in the previous configuration generation stage,
            we need to back trace the data back from the output stage.
        2. initialize the inner variable
        3. process the first stage of switches
        4. process the stages remaining.
    */

    // 1.1 -- connection function generation -- first half stages
    std::vector<int *> test_BENES_connection;
    test_BENES_connection.resize(sim_conf->num_stage-1);
    for(int i = 0; i<sim_conf->num_half_stage-1; i++){
        int num_data_per_group = (0b1 << sim_conf->num_half_stage) >> i; 
        int data_mask = num_data_per_group-0b1;
        int* connection_ptr = new int [sim_conf->num_in_data];
        for(int g = 0; g < (0b1 << i); g++){
            for(int j=0; j < num_data_per_group; j++){
                connection_ptr[j+g*num_data_per_group] = ((j >> 1)&data_mask);
                if((j & 0b1) == 0b1){
                    connection_ptr[j+g*num_data_per_group] += (num_data_per_group>>1) ;
                }
                connection_ptr[j+g*num_data_per_group] += num_data_per_group*g;
            }
        }
        test_BENES_connection[i] = connection_ptr;
    }

    // 1.2 -- connection function generation -- second half stages 
    for(int i = sim_conf->num_half_stage-1; i<sim_conf->num_stage-1; i++){
        int num_data_per_group = (0b1 << sim_conf->num_half_stage) >> (sim_conf->num_stage-2-i); 
        int data_mask = num_data_per_group - 0b1;
        int* connection_ptr = new int [sim_conf->num_in_data];
        int MSB_mask = num_data_per_group >> 1;
        for(int g = 0; g < (0b1 << (sim_conf->num_stage-2-i)); g++){
            for(int j=0; j < num_data_per_group; j++){
                connection_ptr[j+g*num_data_per_group] = ((j << 1)&data_mask);
                if((j & MSB_mask) == MSB_mask){
                    connection_ptr[j+g*num_data_per_group] += 0b1;
                }
                connection_ptr[j+g*num_data_per_group] += num_data_per_group*g;
            }
        }
        test_BENES_connection[i] = connection_ptr;
    }
    
#ifdef DEBUG 
    std::cout << "test test_BENES_connection: " << std::endl;
    for(int i=0; i< sim_conf->num_stage-1; i++){
        for(int j=0; j<sim_conf->num_in_data; j++){
            std::cout << test_BENES_connection[i][j] << " ";
        }
        std::cout << std::endl;
    }
    std::cout << std::endl;
#endif

    // 2 -- initialization
    std::vector<int* > test_data_stage;
    // test_data_stage record the both input and output all stages.
    
    test_data_stage.resize(sim_conf->num_stage+1);
    // initialization -- first stage
    {
        int* data_ptr = new int [sim_conf->num_in_data];
        for(int i=0; i< sim_conf->num_in_data; i++){
            int temp =  data_stage[0][i].data;
            data_ptr[i] = temp;
        }    
        test_data_stage[0] = data_ptr;
    }

    // initialization -- stages afterward
    for(int j=1;j<sim_conf->num_stage+1; j++){
        int* data_ptr = new int [sim_conf->num_in_data];
        for(int i=0; i<sim_conf->num_in_data; i++){
            data_ptr[i] = 0;
        }
        test_data_stage[j] = data_ptr;
    }

    // 3 -- forward data based on the configuration and connection functions.
    // forward the first stage -- calculate the output of the first stage
    for(int i=0; i< sim_conf->num_in_switch; i++){
        if(config_stage[0][i] == OP_PT){
            test_data_stage[1][i<<1] = test_data_stage[0][i<<1];
            test_data_stage[1][(i<<1)+1] = test_data_stage[0][(i<<1)+1];
        } 
        else if(config_stage[0][i] == OP_CROSS){
            test_data_stage[1][i<<1] = test_data_stage[0][(i<<1)+1];
            test_data_stage[1][(i<<1)+1] = test_data_stage[0][(i<<1)];
        }
        else if(config_stage[0][i] == OP_MH){
            test_data_stage[1][i<<1] = test_data_stage[0][(i<<1)+1];
            test_data_stage[1][(i<<1)+1] = test_data_stage[0][(i<<1)+1];
        }
        else if(config_stage[0][i] == OP_ML){
            test_data_stage[1][i<<1] = test_data_stage[0][(i<<1)];
            test_data_stage[1][(i<<1)+1] = test_data_stage[0][(i<<1)];
        }
        else{
            test_data_stage[1][i<<1] = INVALID_DATA;
            test_data_stage[1][(i<<1)+1] = INVALID_DATA;
        }
    }

    // 4 -- forward the stages afterward
    for(int i=1; i< sim_conf->num_stage; i++){
        // forward the data to the input of next stage based on the connection function.
        for(int j=0; j<sim_conf->num_in_switch; j++){
            test_data_stage[i+1][test_BENES_connection[i-1][j<<1]] = test_data_stage[i][j<<1];
            test_data_stage[i+1][test_BENES_connection[i-1][(j<<1)+1]] = test_data_stage[i][(j<<1)+1];
        }

        // forward the data into the output ports of the switches based on the configuration.
        for(int j=0; j<sim_conf->num_in_switch; j++){
            if(config_stage[i][j] == OP_CROSS){
                int temp = test_data_stage[i+1][j<<1];
                test_data_stage[i+1][j<<1] = test_data_stage[i+1][(j<<1) + 1];
                test_data_stage[i+1][(j<<1) + 1] = temp;
            }
            else if(config_stage[i][j] == OP_MH){
                test_data_stage[i+1][j<<1] = test_data_stage[i+1][(j<<1)+1];
            }
            else if(config_stage[i][j] == OP_ML){
                test_data_stage[i+1][(j<<1) + 1] = test_data_stage[i+1][(j<<1)];
            }
        }
    }

#ifdef DEBUG 
    std::cout << "test forward data -- output data: " << std::endl;
    for(int i=0; i< sim_conf->num_stage+1; i++){
        for(int j=0; j<sim_conf->num_in_data; j++){
            std::cout << test_data_stage[i][j] << " ";
        }
        std::cout << std::endl;
    }
    std::cout << std::endl;
#endif

    bool test_pass = true;
    for(int i=0; i<sim_conf->num_in_data; i++){
        if(data_stage[sim_conf->num_stage][i].data != test_data_stage[sim_conf->num_stage][i]){
            test_pass = false;
            break;
        }
    }

    if(!test_pass){
        std::cout << "#############    ERROR case    ###############" << std::endl;
        std::cout << "#############       Input      ###############" << std::endl;
        for(int i=0; i<sim_conf->num_in_data; i++){
            std::cout << data_stage[0][i].data << " ";
        }
        std::cout << std::endl;
        std::cout << "############# expected transfer ###############" << std::endl;
        for(int i=0; i< sim_conf->num_stage+1; i++){
            for(int j=0; j<sim_conf->num_in_data; j++){
                std::cout << data_stage[i][j].data << " ";
            }
            std::cout << std::endl;
        }
        std::cout << "#############  tested transfer  ###############" << std::endl;
        for(int i=0; i< sim_conf->num_stage+1; i++){
            for(int j=0; j<sim_conf->num_in_data; j++){
                std::cout << test_data_stage[i][j] << " ";
            }
            std::cout << std::endl;
        }
        std::cout << std::endl;
        std::cout << "#############   configuration   ###############" << std::endl;
        for(int i=0; i<sim_conf->num_stage;i++){
            for(int j=0; j<sim_conf->num_in_switch; j++){
                std::cout << config_stage[i][j] << " "; 
            }
            std::cout << std::endl; 
        }
    }

    // delete memory 
    for(int i=0; i< test_data_stage.size(); i++){
        delete [] test_data_stage[i];
    }

    for(int i=0; i< test_BENES_connection.size(); i++){
        delete [] test_BENES_connection[i];
    }

    if(!test_pass)
        exit(EXIT_FAILURE);
}

void write_config(const sim_config_t* sim_conf){
    std::ofstream out_config;
    out_config.open ("output/benes_config.vmh");
    for(int i=0; i<sim_conf->num_stage;i++){
        for(int j=0; j<sim_conf->num_in_switch; j++){
            out_config << std::bitset<2>(config_stage[i][j]) << " "; 
        }
        out_config << std::endl; 
    }
    out_config.close();
}

void complete_proc(const sim_config_t* sim_conf){
#ifdef DEBUG
    // output data stage
    for(int i=0; i<sim_conf->num_stage+1; i++){
        for(int j=0; j<sim_conf->num_in_data; j++){
            std::cout << data_stage[i][j].data << " ";
        }
        std::cout << std::endl;
    }

    // output configuration stage
    for(int i=0; i<sim_conf->num_stage; i++){
        for(int j=0; j<sim_conf->num_in_switch; j++){
            std::cout << config_stage[i][j] << " ";
        }
        std::cout << std::endl;
    }
#endif

    // delete all pointer:
    // delete data_stage
    for(int i = 0; i<data_stage.size(); i++){
        delete [] data_stage[i];
    }
    data_stage.clear();

    // delete config_stage
    for(int i = 0; i<config_stage.size(); i++){
        delete [] config_stage[i];
    }
    config_stage.clear();

    // delete BENES_connection
    for(int i = 0; i<BENES_connection.size(); i++){
        delete [] BENES_connection[i];
    }
    BENES_connection.clear();

}

// Drive the cache simulator
int main(int argc, char *const argv[])
{
    if (argc < 3) {
        print_err_usage("Need to specify more parameters");
    }

    // initialize the configuration.
    memset(&sim_conf, 0, sizeof(sim_conf));

    // memset(&sim_stats, 0, sizeof(sim_stats));
    int opt;
    while (-1 != (opt = getopt(argc, argv, "n:N:i:I:h"))) {
        switch (opt) {
            case 'n':
            case 'N':
                sim_conf.num_in_data = (uint64_t) std::atoi(optarg);
                break;

            case 'i':
            case 'I':
                i_data = fopen(optarg, "r");
                if (i_data == NULL) {
                    print_err_usage("Could not open the input file");
                }
                break;

            case 'h':
                print_err_usage("");
                break;

            default:
                print_err_usage("Invalid argument to program");
                break;
        }
    }

    // initialize the configuration
    sim_conf.num_half_stage = (uint64_t) log2(sim_conf.num_in_data);
    sim_conf.num_stage = (uint64_t)(2*sim_conf.num_half_stage-1);
    sim_conf.num_in_switch = sim_conf.num_in_data >> 1;

    for(int k=0; k<1; k++){
        setup_proc(&sim_conf);
        read_input(&sim_conf);
        run_proc(&sim_conf);
        test_config(&sim_conf);
        write_config(&sim_conf);
        complete_proc(&sim_conf);
    }
}
