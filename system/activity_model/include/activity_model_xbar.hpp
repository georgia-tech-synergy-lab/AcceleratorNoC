#include <cinttypes>
#include <cstdio>
#include <cstdlib>
#include <unistd.h>
#include <cstring>
#include <cmath>
#include <vector>
#include <iostream>
#include <algorithm>
#include <fstream>
#include <getopt.h>

#define POWER_CONSUMP 2             // the power consumption for a single router

// Struct for tracking the simulation parameters
struct sim_config_t {
    uint64_t num_in_data;           // Number of input data
    uint64_t num_in_valid;          // Number of valid input data
    uint64_t num_out_data;          // Number of output data 
    uint64_t power_comsumption;     // Number of power consumption for a single router
    uint64_t num_cases;             // Number of cases in need of execution
    uint64_t num_lvl_log_input;     // Number of level of the first-level tree
    uint64_t num_lvl_log_output;    // Number of level of the second-level tree
};

struct sim_statistic_t {
    uint64_t num_access_binary_tree; // Number of activated router in the binary tree
    uint64_t num_access_mux_tree;    // Number of activated router in the mux tree
};

enum target_t {yes=1, no=0};

struct data_t {
    int value;                      // the value of accessed data
    int valid;                      // the valid of accessed data
};

struct data_cmd_t {
    int value;                      // the value of accessed data
    int valid;                      // the valid of accessed data
    target_t cmd;                   // the cmd bit of accessed data
};

void setup_proc(const sim_config_t* sim_conf, sim_statistic_t* sim_stats);
void read_input(const sim_config_t* sim_conf, char *const argv[]);
void read_cmd(const sim_config_t* sim_conf, char *const argv[]);
void run_proc(const sim_config_t* sim_conf);
void update_statistic(const sim_config_t* sim_conf, sim_statistic_t* sim_stats);
void complete_proc(const sim_config_t* sim_conf);
