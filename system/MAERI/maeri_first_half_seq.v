`timescale 1ns / 1ps
/*
    Top Module:  maeri_first_half_seq
    Data:        Only data width matters.
    Format:      keeping the reg format unchange
    Timing:      Sequential Logic
    Reset:       Asynchronized Reset [Low Reset]
    Pipeline:    the system consist of three separate parts
                 For benes constructed with sequential switches, every stage is a pipeline stage
                 Total latency = # stages (cycle)
    Dummy Data:  {DATA_WIDTH{1'b0}}

    Function:     The first half of MAERI consist of BENES network and 1D Multipliers (Here is an example for 8 multiplier)

                                                                                                            |------->|¯¯¯|
                                                                                                            |        |_x_|---o_data_bus
                                                                                                            |          |     [0*DW+:DW]
                                                                                                            |          v
                                                                                                            | |----->|¯¯¯|
                                                                                                            | |      |_x_|---o_data_bus
                                                                                                            | |        |     [1*DW+:DW]
                                                                                                            | |        v
                                             LSB                                                            | | |--->|¯¯¯|
                                                                                                            | | |    |_x_|---o_data_bus
       i_data_bus[0*DATA_WIDTH+:DATA_WIDTH]  -->|¯¯¯|-------->|¯¯¯|------->|¯¯¯|------->|¯¯¯|-------->|¯¯¯|-| | |      |     [2*DW+:DW]
       i_data_bus[1*DATA_WIDTH+:DATA_WIDTH]  -->|___|-\ /---->|___|--\ /-->|___|--\ /-->|___|----\ /->|___|---| |      v
                                        ID:       0    X        4     X      8     X      12      X     16      | |->|¯¯¯|
       i_data_bus[2*DATA_WIDTH+:DATA_WIDTH]  -->|¯¯¯|-/ \/--->|¯¯¯|--/ \-->|¯¯¯|--/ \-->|¯¯¯|---\/ \->|¯¯¯|-----| |  |_x_|---o_data_bus
       i_data_bus[3*DATA_WIDTH+:DATA_WIDTH]  -->|___|-\ /\ /->|___|------->|___|------->|___|-\ /\ /->|___|-------|    |     [3*DW+:DW]
                                        ID:       1    X  X     5            9            13   X  X     17             |
       i_data_bus[4*DATA_WIDTH+:DATA_WIDTH]  -->|¯¯¯|-/ \/ \->|¯¯¯|------->|¯¯¯|------->|¯¯¯|-/ \/ \->|¯¯¯|-------|    v
       i_data_bus[5*DATA_WIDTH+:DATA_WIDTH]  -->|___|-\ /\--->|___|--\ /-->|___|--\ /-->|___|---/\ /->|___|-----| |  |¯¯¯|
                                        ID:       2    X        6     X      10    X      14      X     18      | |->|_x_|---o_data_bus
       i_data_bus[6*DATA_WIDTH+:DATA_WIDTH]  -->|¯¯¯|-/ \---->|¯¯¯|--/ \-->|¯¯¯|--/ \-->|¯¯¯|----/ \->|¯¯¯|---| |      |     [4*DW+:DW]
       i_data_bus[7*DATA_WIDTH+:DATA_WIDTH]  -->|___|-------->|___|------->|___|------->|___|-------->|___|-| | |      v
                                        ID:       3             7            11           15            19  | | |    |¯¯¯|
          CONNECTION FUNCTION                   INVERSE SHUFFLE      ,,         SHUFFLE       SHUFFLE       | | |--->|_x_|---o_data_bus
         CONNECTION GROUP SIZE                         8             4             4             8          | |        |     [5*DW+:DW]
                                             MSB                                                            | |        v
                                                                                                            | |      |¯¯¯|
                                                                                                            | |----->|_x_|---o_data_bus
                                                                                                            |          |     [6*DW+:DW]
                                                                                                            |          v
                                                                                                            |        |¯¯¯|
                                                                                                            |------->|_x_|---o_data_bus
                                                                                                                             [7*DW+:DW]


                                                               BENES Network                                   1D Multiplier                   Augmented Reduction Tree
                                                                                                        DW stands for MAX_DATA_WIDTH




                                                                                    |     |¯¯¯|
                                                                                    v     |_+_|
               |¯¯¯|                    |¯¯¯|                 |¯¯¯|               |¯¯¯|     |
               |___|                    |_x_|                 |_+_|               |_+_|     v
       distribute_2x2_simple       multiplier_seq       single_reduce_seq      single_reduce_forward_seq

    Author:      Jianming Tong (jianming.tong@gatech.edu)
*/


module maeri_first_half_seq#(
    parameter DATA_WIDTH = 8,        // could be arbitrary number
    parameter COMMAND_WIDTH  = 2,    // specify the command needed for a single switch of BENES
    parameter NUM_INPUT_DATA = 16,   // the number of input data should be power of 2.
    parameter IN_COMMAND_WIDTH = 30  // Total length of command for a single row of BENES network + a single multiplier
)(
    // timeing signals
    clk,
    rst_n,

    // data signals
    i_valid,        // valid input data signal
    i_data_bus,     // input data bus coming into distribute switch

    o_valid,        // output valid
    o_data_bus,     // output data

    // control signals
    i_en,           // distribute switch enable
    i_cmd,          // input command
);

    // parameter
    localparam NUM_SWITCH_IN = NUM_INPUT_DATA >> 1;

    localparam LEVEL = $clog2(NUM_INPUT_DATA);
    localparam TOTAL_STAGE = 2*LEVEL-1;

    localparam TOTAL_COMMAND = NUM_SWITCH_IN*IN_COMMAND_WIDTH;

    localparam WIDTH_INPUT_DATA = NUM_INPUT_DATA*DATA_WIDTH;

    localparam IN_MUL_COMMAND_WIDTH = IN_COMMAND_WIDTH - TOTAL_STAGE*COMMAND_WIDTH;
    localparam TOTAL_MUL_COMMAND_WIDTH = IN_MUL_COMMAND_WIDTH * NUM_SWITCH_IN;

    localparam TOTAL_MUL_DATA_WIDTH = NUM_INPUT_DATA * DATA_WIDTH;

    // interface
    input                                        clk;
    input                                        rst_n;

    input  [NUM_INPUT_DATA-1:0]                  i_valid;
    input  [WIDTH_INPUT_DATA-1:0]                i_data_bus;

    output [NUM_INPUT_DATA-1:0]                  o_valid;
    output [WIDTH_INPUT_DATA-1:0]                o_data_bus; //{o_data_a, o_data_b}

    input                                        i_en;
    input  [TOTAL_COMMAND-1:0]                   i_cmd;


    // inner wire
    wire        [TOTAL_MUL_COMMAND_WIDTH-1:0]     inner_cmd_wire;
    wire        [TOTAL_MUL_DATA_WIDTH-1:0]        inner_data_wire;
    wire        [NUM_INPUT_DATA-1:0]              inner_valid_wire;


    benes_simple_cmd_flow_seq #(
        .DATA_WIDTH(DATA_WIDTH),
        .COMMAND_WIDTH(COMMAND_WIDTH),
        .NUM_INPUT_DATA(NUM_INPUT_DATA),
        .IN_COMMAND_WIDTH(IN_COMMAND_WIDTH)
    ) benes(
        .clk(clk),
        .rst_n(rst_n),
        .i_valid(i_valid),
        .i_data_bus(i_data_bus),
        .o_valid(inner_valid_wire),
        .o_data_bus(inner_data_wire),
        .i_en(i_en),
        .i_cmd(i_cmd),
        .o_cmd(inner_cmd_wire)
    );

    linear_multiplier_seq#(
        .DATA_WIDTH(DATA_WIDTH),              // could be arbitrary number
        .COMMAND_WIDTH((IN_MUL_COMMAND_WIDTH>>1)), // even though the input command is parameterized, it should be fixed, pls refer the 1d multiplier design.
        .NUM_NODE(NUM_INPUT_DATA)
    ) multiplier_1d(
        .clk(clk),
        .rst_n(rst_n),
        .i_valid(inner_valid_wire),           // valid input data signal
        .i_data_bus(inner_data_wire),         // input data
        .o_valid(o_valid),                    // output valid
        .o_data_bus(o_data_bus),              // output data
        .i_en(i_en),                          // multiplier enable
        .i_cmd(inner_cmd_wire)                // command
    );

endmodule
