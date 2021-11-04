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

#define POWER_CONSUMP 2         // the power consumption for a single router

// Struct for tracking the simulation parameters
struct sim_config_t {
    uint64_t num_in_data;       // Number of input data = Number of multipliers
    uint64_t num_out_data;      // Number of output data = Number of multipliers
    uint64_t power_comsumption; // Number of power consumption for a single router
    uint64_t num_cases;         // Number of cases in need of execution
};

struct sim_statistic_t {
    uint64_t num_access;        // Number of activated router
};

enum target_t {yes=1, no=0};

void setup_proc(const sim_config_t* sim_conf);
void read_input(const sim_config_t* sim_conf, char *const argv[]);
void read_cmd(const sim_config_t* sim_conf, char *const argv[]);
void run_proc(const sim_config_t* sim_conf);
void complete_proc(const sim_config_t* sim_conf);
