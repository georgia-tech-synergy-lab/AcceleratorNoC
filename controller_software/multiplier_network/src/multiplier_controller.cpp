#include "multiplier_controller.hpp"
#define generate_config
#include <fstream>
// #define DEBUG

// global variable
sim_config_t sim_conf;
std::vector<data_t *> config_stage;
vn_t * vn;
int num_mul;          // stores the number of multiplier used in the design
int num_mul_required; // stores the number of multiplier required by the input.

// Print error usage
static void print_err_usage(const char *err)
{
    printf("%s\n", err);

    fprintf(stderr, "./multiplier_controller <Number_of_multiplier> <Virtual Neuron Size 1> <Virtual Neuron Size 2> ... <Virtual Neuron Size N>\n");
    fprintf(stderr, "E.g. for 4 non-uniform virtual neurons on 16 multipliers Run './multiplier_controller 16 2 3 5 6' \n");
    fprintf(stderr, "E.g. for 4 uniform virtual neurons on 32 multipliers. Run './multiplier_controller 32 4 4 4 4' \n");
    exit(EXIT_FAILURE);
}


void setup_proc(const sim_config_t* sim_conf){
    /*
        data should record both input and output of all stages
        So here we need an extra stage.
    */

    // 
    num_mul_required = 0;

    // initialize virtual neuron with size
    vn_t* vn_ptr = new vn_t [sim_conf->num_in_data];
    for(int i=0;i<sim_conf->num_in_data;i++){
		vn_ptr[i].size = 0;
        num_mul_required = num_mul_required + vn_ptr[i].size;
    }
    vn = vn_ptr;

    num_mul = 0;
}

void read_input(const sim_config_t* sim_conf, char *const argv[]){
    for(int i=0;i<sim_conf->num_in_data;i++){
		vn[i].size = (int) std::atoi(argv[i+2]);
    }

    num_mul = (int) std::atoi(argv[1]);
}

void run_proc(const sim_config_t* sim_conf){
    #ifdef DEBUG
    // for(int i=0;i<sim_conf->num_in_data;i++){
	// 	std:: cout << vn[i].size << std::endl;
    // }

    // std::cout << num_mul << std::endl;
    #endif

    if(num_mul_required > num_mul)
        fprintf(stderr, "The number of multipliers should be larger \
        than the number of multipliers that are demanded by all virtual neurons.");

    for(int i=0; i< sim_conf->num_in_data; i++){

    }
}

void complete_proc(const sim_config_t* sim_conf){
    delete [] vn;
}

// Drive the cache simulator
int main(int argc, char *const argv[])
{
    if (argc < 2) {
        print_err_usage("Need to specify size of at least 1 virtual neuron");
    }
    // initialize the configuration.
    memset(&sim_conf, 0, sizeof(sim_conf));
    
    // set number of input data (also the number of multiplier)
    sim_conf.num_in_data = argc - 2;

    setup_proc(&sim_conf);
    read_input(&sim_conf, argv);
    run_proc(&sim_conf);
    complete_proc(&sim_conf);

}
