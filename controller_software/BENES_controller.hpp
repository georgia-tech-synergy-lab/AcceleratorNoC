#include <cinttypes>
#include <cstdio>
#include <cstdlib>
#include <getopt.h>
#include <unistd.h>
#include <cstring>
#include <cmath>
#include <vector>
#include <iostream>

#define INVALID_DATA -1

// Struct for tracking the simulation parameters
struct sim_config_t {
    uint64_t num_in_data;           // Number of input data
    uint64_t num_in_switch;         // Number of switches of a single stage
    uint64_t num_stage;             // Number of total stages of network 
    uint64_t num_half_stage;        // Number of Half stages of network
};

// List of opcodes
typedef enum {
    OP_ML = 1,      // Mutlicast Low
    OP_MH = 2,      // Mutlicast High
    OP_CROSS = 3,   // Cross
    OP_PT = 4,      // Pass through
    OP_NOP = 5      // No operation
} config_t;


struct data_t{
    bool is_config_gen;
    int data;
};

void setup_proc(const sim_config_t* sim_conf);
void read_input(const sim_config_t* sim_conf);
void run_proc(const sim_config_t* sim_conf);
void complete_proc(const sim_config_t* sim_conf);
