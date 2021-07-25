#include <cinttypes>
#include <cstdio>
#include <cstdlib>
#include <getopt.h>
#include <unistd.h>
#include <cstring>
#include <cmath>
#include <vector>
#include <iostream>
#include <algorithm>
#define INVALID_DATA -1

// Struct for tracking the simulation parameters
struct sim_config_t {
    uint64_t num_in_data;           // Number of input data = Number of multipliers
};

/* 
    List of opcodes:
    The opcodes are the set in the hardware design.
    Please refer to the hardware verilog module for more details.
*/

typedef enum {
    OP_FillStationaryVal = 5,       // Fill stationary value -- the function named "ms_initSteadyVal" in Bluespec implementation
    OP_StreamInMulForwardOut = 15,  // Multiply stationary value with Stream-In value -> forward out the Streamed-In value -- the function named "ms_runLEdgeFirst"/"ms_runLEdge"/"ms_runMiddleFirst" in Bluespec implementation
    OP_ForwardInMulForwardOut = 8,  // Multiply stationary value with Forward-In value  -> forward out the Forward-In value -- the function named "ms_runMiddle" in Bluespec implementation
    OP_StreamInMul = 7,             // Multiply stationary value with Stream-In value -> no forward output -- the function named "ms_runREdgeFirst" in Bluespec implementation
    OP_ForwardInMul = 0,            // Multiply stationary value with Forward-In value -> no forward output -- the function named "ms_runREdge" in Bluespec implementation
    OP_NOP = 6                      // No operation.
} config_t;

struct data_t{
    int target_data;   
    int data;
};

struct vn_t{
    int size;
};

void setup_proc(const sim_config_t* sim_conf);
void read_input(const sim_config_t* sim_conf, char *const argv[]);
void run_proc(const sim_config_t* sim_conf);
void complete_proc(const sim_config_t* sim_conf);
