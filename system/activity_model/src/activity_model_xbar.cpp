#include "activity_model_xbar.hpp"

// global variable
sim_config_t sim_conf;
sim_statistic_t sim_stats;

std::vector<int> i_cmd_out;    // store the index of input data at each output port.
std::vector<target_t* > i_cmd; // store the multi-hot command for each input data.
std::vector<int> i_valid;      // 
std::vector<int> i_data_bus;   // 
std::vector<int> o_valid;      // 
std::vector<int> o_data_bus;   // 
FILE *fin_data = NULL;         // input data file
FILE *fin_cmd = NULL;          // input command file

std::vector<target_t*> o_cmd_biary_tree; // the output command bits of binary tree -> input command of the mux tree.

std::vector<data_t**> binary_tree; // the first level tree
std::vector<data_cmd_t**> mux_tree;    // the second level tree

std::ofstream outfile;


// Print error usage
static void print_err_usage(const char *err)
{
    printf("%s\n", err);
    exit(EXIT_FAILURE);
}

void setup_proc(const sim_config_t* sim_conf, sim_statistic_t* sim_stats){
    /*
        initialize the data structure
    */
    sim_stats->num_router_binary_tree = 0;
    sim_stats->num_router_mux_tree = 0;

    i_cmd.resize(sim_conf->num_in_data);
    for(int i = 0; i<sim_conf->num_in_data; i++){
        target_t* is_target_this_single_out = new target_t [sim_conf->num_out_data];
        for(int j=0; j< sim_conf->num_out_data; j++){
            is_target_this_single_out[j] = no;
        }
        i_cmd[i] = is_target_this_single_out;
    }

    i_cmd_out.resize(sim_conf->num_out_data);
    i_valid.resize(sim_conf->num_in_data);
    i_data_bus.resize(sim_conf->num_in_data);

    o_valid.resize(sim_conf->num_in_data);
    o_data_bus.resize(sim_conf->num_in_data);

    /*
        construct the two-level tree

    Example: A 5:4 crossbar. For a hierarchy version [2 pipeline stages: first stage = 8* 8:1 mux -- second stage = 1* 8:1 mux;]
             The following is the hierarchy crossbar for a single output data.
             And the whole hierarachy crossbar needs to instantiate the following logic multiple times.
   
        ---     i_data_bus[0*DATA_WIDTH+:DATA_WIDTH]  ------------------------------------------------------------------------------------------------->
         ^                                              |                                                           |                    
         |      i_data_bus[1*DATA_WIDTH+:DATA_WIDTH]  ------------------------------------------------------------------------------------------------->
         |                                              ||                                                          ||                       
         |      i_data_bus[2*DATA_WIDTH+:DATA_WIDTH]  ------------------------------------------------------------------------------------------------->
         |                                              |||                                                         |||                   
         |  first_level         ....                    ...                                                         ...                    
         |                                              ||||||||                                                    ||||||||               
         |      i_data_bus[63*DATA_WIDTH+:DATA_WIDTH]  ------------------------------------------------------------------------------------------------->
         |                                              ||||||||                                                    ||||||||               
         |                                              ||||||||     ...   i_data_bus[0*DATA_WIDTH+:DATA_WIDTH] ->  |||||||| <- i_data_bus[7*DATA_WIDTH+:DATA_WIDTH]        
         |                                              ||||||||                                                    ||||||||         
         |      i_data_bus[56*DATA_WIDTH+:DATA_WIDTH]-> |||||||| <- i_data_bus[63*DATA_WIDTH+:DATA_WIDTH]   ...     ||||||||         
         v                                             __________                                                  __________            
        ---   5-bit one-hot control to each of mux ->  \________/                                                  \________/             
         ^                                                 |                                                           |                   
         |                                                 v                                                           v                     
         |                                      inner_first_stage_data_reg[7]                            inner_first_stage_data_reg[0]
         |                                                 |                                                           |                                       
         |                                                 ---------------------------  ... ----------------------------
         |  second level                                                             ||||||||
         |                                                                          __________ 
         |                                                                          \________/          same logic repeats for 8 times.
         |                                                                              |             
         v                                                                              v              
        ---                                                                        o_data_bus[7]    ...  o_data_bus[0]

        The first level is termed as "binary_tree", which replicates input data into different inport of second level
        The second level is termed as "mux_tree", which selects a single valid input value and send it to the output port
    */

    // define the data structure of the binary tree and mux tree.

    /*
       Note: the i_cmd is not transferred as the hardware do because the bit split is not easy to manipulate in software.
            But the overall input and output are the same as the hardware does.
    */  

    /*
        binary tree
        k -- input data index 
        i -- level index 
        j -- # of elements index 
        binary_tree[k][i][j] = yes -> valid input i should be sent to the output j  
        otherwise no.
    */

    binary_tree.resize(sim_conf->num_in_data);
    for(int k=0; k< sim_conf->num_in_data; k++){
        data_t ** tree_ptr = new data_t * [sim_conf->num_lvl_log_output + 1];
        for(int i=0; i< (sim_conf->num_lvl_log_output + 1); i++){
            data_t* lvl_ptr = new data_t [int(0b1 << i)];
            for(int j=0; j<int(0b1 << i); j++){
                lvl_ptr[j].value = 0; 
                lvl_ptr[j].valid = 0; 
                sim_stats->num_router_binary_tree++;
            }
            tree_ptr[i] = lvl_ptr;
        }
        binary_tree[k] = tree_ptr;
    }

    mux_tree.resize(sim_conf->num_out_data);
    for(int k=0; k< sim_conf->num_out_data; k++){
        data_cmd_t ** tree_ptr = new data_cmd_t * [sim_conf->num_lvl_log_input + 1];
        for(int i=0; i< (sim_conf->num_lvl_log_input + 1); i++){
            data_cmd_t* lvl_ptr = new data_cmd_t [int(sim_conf->num_in_data >> i)];
            for(int j=0; j<int(sim_conf->num_in_data >> i); j++){
                lvl_ptr[j].value = 0; 
                lvl_ptr[j].valid = 0; 
                lvl_ptr[j].cmd = no; 
                sim_stats->num_router_mux_tree++;
            }
            tree_ptr[i] = lvl_ptr;
        }
        mux_tree[k] = tree_ptr;
    }

    o_cmd_biary_tree.resize(sim_conf->num_out_data);
    for(int k=0; k< sim_conf->num_out_data; k++){
        target_t * cmd_for_single_out = new target_t [sim_conf->num_in_data];
        for(int i=0; i< sim_conf->num_in_data; i++){
            cmd_for_single_out[i] = no;
        }
        o_cmd_biary_tree[k] = cmd_for_single_out;
    }

    sim_stats->num_access_binary_tree = 0;
    sim_stats->num_access_mux_tree = 0;

}


void read_input(const sim_config_t* sim_conf, char *const argv[]){
    for(int i=0; i<sim_conf->num_in_data; i++){
        fscanf(fin_data, "%d", &i_data_bus[i]);
    }

    for (int i=0; i< sim_conf->num_in_data; i++){
        if( i < sim_conf->num_in_valid)
            i_valid[i] = 1;
        else
            i_valid[i] = 0;
    }
}


void read_cmd(const sim_config_t* sim_conf, char *const argv[]){
    for(int i=0; i<sim_conf->num_out_data; i++){
        fscanf(fin_cmd, "%d", &i_cmd_out[i]);
    }

    /*
        i -- input data index 
        o -- output data index 
        i_cmd[i][j] = yes -> valid input i should be sent to the output j  
        otherwise no.
    */
    for (int i=0; i<sim_conf->num_in_data; i++){
        for (int j=0; j<sim_conf->num_out_data; j++){
            if(i_cmd_out[j] == i)
                i_cmd[i][j] = yes; 
            else
                i_cmd[i][j] = no;
        }
    }
}


void run_proc(const sim_config_t* sim_conf){
    /*
        transfer i_cmd through the binary tree
    */
    for (int i = 0; i<sim_conf->num_in_data; i++){
        for (int j = 0; j<sim_conf->num_out_data; j++){
            o_cmd_biary_tree[j][i] = i_cmd[i][j];
        }
    }

    /*
        transfer input data through the binary tree
    */
    // send input to the first registers.
    for(int k=0; k< sim_conf->num_in_data; k++){
        binary_tree[k][0][0].value = i_data_bus[k];
        binary_tree[k][0][0].valid = i_valid[k];
    }

    // transfer input through the binary tree.
    for(int k=0; k<sim_conf->num_in_data; k++){
        for(int i=1; i<(sim_conf->num_lvl_log_output + 1); i++){
            for(int j=0; j<int(0b1 << i); j++){
                binary_tree[k][i][j].value = binary_tree[k][i-1][(j>>1)].value; 
                binary_tree[k][i][j].valid = binary_tree[k][i-1][(j>>1)].valid; 
            }
        }
    }

    // transfer the output data from binary tree into mux tree.
    for (int i=0; i < sim_conf->num_out_data; i++){
        for (int j=0; j < sim_conf->num_in_data; j++){
            mux_tree[i][0][j].value = binary_tree[j][sim_conf->num_lvl_log_output][i].value;
            mux_tree[i][0][j].valid = binary_tree[j][sim_conf->num_lvl_log_output][i].valid;
            mux_tree[i][0][j].cmd = o_cmd_biary_tree[i][j];
        }
    }

    // data transfer from input to output
    for(int k=0; k< sim_conf->num_out_data; k++){
        for(int i=1; i< (sim_conf->num_lvl_log_input+1); i++){
            for(int j=0; j<int(sim_conf->num_in_data >> i); j++){
                if(mux_tree[k][i-1][(j<<1)].cmd == yes){
                    mux_tree[k][i][j].value = mux_tree[k][i-1][(j<<1)].value; 
                    mux_tree[k][i][j].valid = mux_tree[k][i-1][(j<<1)].valid; 
                    mux_tree[k][i][j].cmd = yes; 
                }
                else if(mux_tree[k][i-1][(j<<1)+1].cmd == yes){
                    mux_tree[k][i][j].value = mux_tree[k][i-1][(j<<1)+1].value; 
                    mux_tree[k][i][j].valid = mux_tree[k][i-1][(j<<1)+1].valid; 
                    mux_tree[k][i][j].cmd = yes; 
                }
                else{
                    mux_tree[k][i][j].value = 0; 
                    mux_tree[k][i][j].valid = 0; 
                    mux_tree[k][i][j].cmd = no; 
                }
            }
        }
    }
}

void update_statistic(const sim_config_t* sim_conf, sim_statistic_t* sim_stats){
    // collect statistics in binary tree.
    for(int k=0; k<sim_conf->num_in_data; k++){
        for(int i=0; i<(sim_conf->num_lvl_log_output + 1); i++){
            for(int j=0; j<int(0b1 << i); j++){
                if(binary_tree[k][i][j].valid)
                    sim_stats->num_access_binary_tree ++;
            }
        }
    }

    // collect statistics in mux tree.
    for(int k=0; k< sim_conf->num_out_data; k++){
        for(int i=0; i< (sim_conf->num_lvl_log_input + 1); i++){
            for(int j=0; j<int(sim_conf->num_in_data >> i); j++){
                if(mux_tree[k][i][j].valid)
                    sim_stats->num_access_mux_tree ++;
            }
        }
    }

    // write to output file and clear the statistics.
    outfile << "number of activated router in binary tree = " << int(sim_stats->num_access_binary_tree) \
     <<  " number of activated router in mux tree = " << int(sim_stats->num_access_mux_tree) << std::endl;

    outfile << "active percentage of activated routers in binary tree = " << std::setw(2) << double(sim_stats->num_access_binary_tree)/double(sim_stats->num_router_binary_tree) \
     <<  " active percentage of activated routers in mux tree = " <<  std::setw(2) << double(sim_stats->num_access_mux_tree)/double(sim_stats->num_router_mux_tree) << std::endl;

    sim_stats->num_access_binary_tree = 0;
    sim_stats->num_access_mux_tree = 0;
}

void complete_proc(const sim_config_t* sim_conf){
    for(int k=0; k< sim_conf->num_in_data; k++){
        for(int i=0; i< sim_conf->num_lvl_log_output; i++){
            delete [] binary_tree[k][i];
        }
        delete [] binary_tree[k];
    }

    for(int k=0; k< sim_conf->num_out_data; k++){
        delete [] mux_tree[k];
    }

    for(int k=0; k<sim_conf->num_out_data; k++){
        delete [] o_cmd_biary_tree[k];
    }

    std::vector<int>().swap(i_cmd_out);
    std::vector<target_t* >().swap(i_cmd);
    std::vector<int>().swap(i_valid);
    std::vector<int>().swap(i_data_bus);
    std::vector<int>().swap(o_valid);
    std::vector<int>().swap(o_data_bus);
}

// Drive the cache simulator
int main(int argc, char *const argv[])
{
    // initialize the configuration.
    memset(&sim_conf, 0, sizeof(sim_conf));
    memset(&sim_stats, 0, sizeof(sim_stats));

    outfile.open("./out_statistics.txt");  
    
    int opt;
    while (-1 != (opt = getopt(argc, argv, "f:F:i:I:v:V:c:C:n:N:p:P:o:O:h"))) {
        switch (opt) {
            case 'f':
            case 'F':
                fin_data = fopen(optarg, "r");
                if (fin_data == NULL) {
                    print_err_usage("Could not open the input data file");
                }
                break;

            case 'c':
            case 'C':
                fin_cmd = fopen(optarg, "r");
                if (fin_cmd == NULL) {
                    print_err_usage("Could not open the input command file");
                }
                break;

            case 'i':
            case 'I':
                sim_conf.num_in_data = (uint64_t) std::atoi(optarg);
                break;

            case 'v':
            case 'V':
                sim_conf.num_in_valid = (uint64_t) std::atoi(optarg);
                break;

            case 'o':
            case 'O':
                sim_conf.num_out_data = (uint64_t) std::atoi(optarg);
                break;

            case 'n':
            case 'N':
                sim_conf.num_cases = (uint64_t) std::atoi(optarg);
                break;

            case 'p':
            case 'P':
                sim_conf.power_comsumption = (uint64_t) std::atoi(optarg);
                break;

            default:
                std::cout << "Invalid argument to program" << std::endl;
                break;
        }
    }

    if (argc < 3) {
        print_err_usage("Need to specify -f <input file> -c <command file> -i <# of input> \
         -v <# of valid input data> -o <# of output> -n <# of cases> No case sensitive. \
         example: ./activity_model_xbar -f ./test/input_file -c ./test/in_cmd_unique.txt -i 8 -v 4 -o 4 -n 330");
    }

    sim_conf.num_lvl_log_input = log2(sim_conf.num_in_data);
    sim_conf.num_lvl_log_output = log2(sim_conf.num_out_data);

    setup_proc(&sim_conf, &sim_stats);
    read_input(&sim_conf, argv);
    for(int n=0; n<sim_conf.num_cases; n++){
        read_cmd(&sim_conf, argv);
        run_proc(&sim_conf);
        update_statistic(&sim_conf, &sim_stats);
    }
    complete_proc(&sim_conf);
}
