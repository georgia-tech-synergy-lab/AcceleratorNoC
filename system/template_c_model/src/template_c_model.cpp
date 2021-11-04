#include "activity_model_xbar.hpp"

// global variable
sim_config_t sim_conf;
sim_statistic_t sim_stats;

std::vector<int> i_cmd_out;   // store the index of input data at each output port.
std::vector<target_t* > i_cmd;       // store the index of input data at each output port.
std::vector<int> i_valid;     // 
std::vector<int> i_data_bus;  // 
std::vector<int> o_valid;     // 
std::vector<int> o_data_bus;  // 
FILE *fin_data = NULL;        // input data file
FILE *fin_cmd = NULL;         // input command file

// Print error usage
static void print_err_usage(const char *err)
{
    printf("%s\n", err);
    exit(EXIT_FAILURE);
}

void setup_proc(const sim_config_t* sim_conf){
    /*
        data should record both input and output of all stages
        So here we need an extra stage.
    */

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

    // construct the two-level tree
    
}

void read_input(const sim_config_t* sim_conf, char *const argv[]){
    for(int i=0;i<sim_conf->num_in_data;i++){
        fscanf(fin_data, "%d", &i_data_bus[i]);
    }
}

void read_cmd(const sim_config_t* sim_conf, char *const argv[]){
    for(int i=0; i<sim_conf->num_out_data; i++){
        fscanf(fin_cmd, "%d", &i_cmd_out[i]);
    }

    for (int i=0; i<sim_conf->num_in_data; i++){
        for (int j=0; j<sim_conf->num_out_data; j++){
            if(i_cmd_out[j] == i){
                i_cmd[i][j] = yes; 
            }
        }
    }
}

void run_proc(const sim_config_t* sim_conf){
    for(int i = 0; i<sim_conf->num_in_data; i++){
        target_t* is_target_this_single_out = new target_t [sim_conf->num_out_data];
        for(int j=0; j< sim_conf->num_out_data; j++){
            is_target_this_single_out[j] = yes;
        }
    }

}

void complete_proc(const sim_config_t* sim_conf){
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

    int opt;
    while (-1 != (opt = getopt(argc, argv, "f:F:i:I:c:C:n:N:p:P:o:O:h"))) {
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
         -o <# of output> -n <# of cases> No case sensitive. \
         example: ./activity_model_xbar -f ./test/input_file -c ./test/in_cmd_unique.txt -i 8 -o 4 -n 330");
    }

    setup_proc(&sim_conf);
    read_input(&sim_conf, argv);
    for(int n=0; n<sim_conf.num_cases; n++){
        read_cmd(&sim_conf, argv);
        run_proc(&sim_conf);
    }
    complete_proc(&sim_conf);
}
