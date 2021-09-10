#include <cinttypes>
#include <cstdio>
#include <cstdlib>
#include <getopt.h>
#include <unistd.h>
#include <cstring>
#include <cmath>
#include <vector>
#include <iostream>
#include <fstream>
#include <algorithm>
#include <bitset>
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
    OP_ML = 0,      // Mutlicast Low
    OP_MH = 3,      // Mutlicast High
    OP_CROSS = 1,   // Cross
    OP_PT = 2,      // Pass through
    OP_NOP = 9      // No operation
} config_t;

struct data_t{
    bool is_config_gen;
    int target_data;   //only used for multicasting, because this data will be replaced by target_data somewhere
    int data;
};

void setup_proc(const sim_config_t* sim_conf);
void read_input(const sim_config_t* sim_conf);
void run_proc(const sim_config_t* sim_conf);
void run_multicasting_configuration(const sim_config_t* sim_conf);
void run_unicasting_configuration(const sim_config_t* sim_conf);
void test_config(const sim_config_t* sim_conf);
void write_config(const sim_config_t* sim_conf);
void complete_proc(const sim_config_t* sim_conf);
