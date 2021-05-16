#include "BENES_controller.hpp"
#define generate_config

// global variable
sim_config_t sim_conf;
std::vector<data_t *> data_stage;
std::vector<config_t *> config_stage;
std::vector<int *> BENES_connection;
FILE *fin = stdin; // config file
FILE *i_data = NULL; // i_data file

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
        data should record both input and output of all stages
        So here we need an extra stage.
    */
    data_stage.resize(sim_conf->num_stage+1);
    for(int i = 0; i<sim_conf->num_stage+1; i++){
        data_t* data_ptr = new data_t [sim_conf->num_in_data];
        for(int j=0; j< sim_conf->num_in_data; j++){
            data_ptr[j].data = INVALID_DATA;
            data_ptr[j].is_config_gen = false;
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
    // /*
    for(int i=0; i<sim_conf->num_stage-1; i++){
        for(int j=0; j<sim_conf->num_in_data; j++){
            std::cout <<BENES_connection[i][j] << " ";
        }
        std::cout << std::endl;
    }
    // */
}

void read_input(const sim_config_t* sim_conf){
    for(int i=0; i<sim_conf->num_in_data;i++){
        fscanf(i_data, "%d", &data_stage[0][i].data);
    }
 
    // for debug -- print the content read from the input file.  
    /*
    for(int i=0; i< sim_conf->num_in_data; i++){
        std::cout << data_stage[0][i] << " ";
    }
    std::cout << std::endl;
    */
}

void run_proc(const sim_config_t* sim_conf){
    /*
    Var: the data_stage records the data where 
    1. fill destination into the last stage of the BENES network.
    2. generate the config for the external stagae of the BENES network.
    3. .
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
            std::cout << "first index in = " << idx_in << " next_served_data = " << next_served_data << std::endl;
            
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
                std::cout << "pair_idx = " << pair_idx << " idx_out = " << idx_out << " next_served_data = " << next_served_data << std::endl;

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
                if(config_stage[sim_conf->num_stage-1-pair_idx][idx_in>>1] == OP_PT){
                    data_stage[sim_conf->num_stage-pair_idx-1][BENES_connection[sim_conf->num_stage-pair_idx-2][((idx_in>>1)<<1)]].data = data_stage[sim_conf->num_stage-pair_idx][((idx_in>>1)<<1)].data;
                    data_stage[sim_conf->num_stage-pair_idx-1][BENES_connection[sim_conf->num_stage-pair_idx-2][((idx_in>>1)<<1)+1]].data = data_stage[sim_conf->num_stage-pair_idx][((idx_in>>1)<<1)+1].data;
                }
                else{
                    data_stage[sim_conf->num_stage-pair_idx-1][BENES_connection[sim_conf->num_stage-pair_idx-2][((idx_in>>1)<<1)]].data = data_stage[sim_conf->num_stage-pair_idx][((idx_in>>1)<<1)+1].data;
                    data_stage[sim_conf->num_stage-pair_idx-1][BENES_connection[sim_conf->num_stage-pair_idx-2][((idx_in>>1)<<1)+1]].data = data_stage[sim_conf->num_stage-pair_idx][((idx_in>>1)<<1)].data;
                }
                
                // 9 
                for(int j=0; j<sim_conf->num_in_data; j++){
                    if(data_stage[pair_idx][j].data == next_served_data){
                        idx_in = j;
                    }
                }
                std::cout << "pair_idx = " << pair_idx << " idx_in = " << idx_in << " data = " << data_stage[pair_idx][idx_in].data << " next_served_data = " << next_served_data;
                if( data_stage[pair_idx][idx_in].is_config_gen){
                    std::cout << " is_config_gen == true" << std::endl << std::endl;
                }
                else{
                    std::cout << " is_config_gen == false" << std::endl << std::endl;
                }
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
#endif
}

void complete_proc(const sim_config_t* sim_conf){
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
    
    setup_proc(&sim_conf);
    read_input(&sim_conf);
    run_proc(&sim_conf);
    complete_proc(&sim_conf);
    
}