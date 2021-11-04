`timescale 1ns / 1ps
/*
    Top Module:  linear_network_multicast_comb
    Data:        Only data width matters.
    Format:      keeping the input format unchange
    Timing:      Combinational Logic
    Dummy Data:  {DATA_WIDTH{1'b0}}

    Function:    Unicast  or  Multicast(arbitrary Multicast)
    
                                   i_data_bus & i_valid     i_data_bus & i_valid
    i_data_bus & i_valid  -->|¯¯¯|------------------>|¯¯¯|------------------>|¯¯¯|--> i_data_bus & i_valid
            i_cmd[N-1:0]  -->|___|------------------>|___|------------------>|___|--> i_cmd[N-4:0]
             (one-hot)         |     i_cmd[N-2:0]      |     i_cmd[N-3:0]      |
                               v                       v                       v
                           o_data_bus              o_data_bus              o_data_bus
            [0*DATA_WIDTH+:DATA_WIDTH]     [1*DATA_WIDTH+:DATA_WIDTH]   [2*DATA_WIDTH+:DATA_WIDTH]
 control signal:            i_cmd[0]                i_cmd[1]                i_cmd[2]

    Author:      Jianming Tong (jianming.tong@gatech.edu)
*/


module linear_network_multicast_comb#(
    parameter DATA_WIDTH = 32,     // could be arbitrary number
    parameter NUM_NODE = 4         // could be arbitrary integer.
)(
    // data signals
    i_valid,        // valid input data signal
    i_data_bus,     // input data bus coming into distribute switch

    o_valid,        // output valid
    o_data_bus,     // output data

    // control signals
    i_en,           // distribute switch enable
    i_cmd           // command
);
    //parameter
    localparam COMMAND_WIDTH = NUM_NODE;    // each node consume 1-bit command.

    localparam WIDTH_OUTPUT_DATA = DATA_WIDTH * NUM_NODE;

    // interface
    input                                        i_valid;
    input  [DATA_WIDTH-1:0]                      i_data_bus;

    output [NUM_NODE-1:0]                        o_valid;
    output [WIDTH_OUTPUT_DATA-1:0]               o_data_bus; // Node 0 output [0+:DATA_WIDTH]; Node max# output [(NUM_NODE-1)*DATA_WIDTH+:DATA_WIDTH]

    input                                        i_en;
    input  [COMMAND_WIDTH-1:0]                   i_cmd;
                                    // For each switch
                                    // 1 --> output to Node & Pass to the next node
                                    // 0 --> Pass to the next node

    // inner logic
    wire   [DATA_WIDTH-1:0]                      connection_data[0:NUM_NODE-1];
    wire                                         connection_valid[0:NUM_NODE-1];

    genvar i;
    generate
        for(i=0; i<NUM_NODE-1;i=i+1)
        begin:connection_cmd
            localparam CONNECTION_COMMAND_WIDTH = COMMAND_WIDTH-i-1;
            wire  [CONNECTION_COMMAND_WIDTH-1:0] wire_cmd; // pipeline_i_cmd_reg[0][x] stores the i_cmd for stage 1 instead of stage 0.
        end


        // first switch
        distribute_1x2_one_hot_comb #(
            .DATA_WIDTH(DATA_WIDTH),
            .IN_COMMAND_WIDTH(COMMAND_WIDTH)
        ) first_switch(
            .i_valid(i_valid),
            .i_data_bus(i_data_bus),
            .o_valid({o_valid[0], connection_valid[0]}),
            .o_data_bus({o_data_bus[0+:DATA_WIDTH], connection_data[0]}),
            .i_en(i_en),
            .i_cmd(i_cmd),
            .o_cmd(connection_cmd[0].wire_cmd)
        );

        // middle switch
        for(i=1; i<NUM_NODE-1; i=i+1)
        begin:middle_1x2_switch
            distribute_1x2_one_hot_comb #(
                .DATA_WIDTH(DATA_WIDTH),
                .IN_COMMAND_WIDTH(COMMAND_WIDTH-i)
            ) network_switch_per_node(
                .i_valid(connection_valid[i-1]),
                .i_data_bus(connection_data[i-1]),
                .o_valid({o_valid[i], connection_valid[i]}),
                .o_data_bus({o_data_bus[i*DATA_WIDTH+:DATA_WIDTH], connection_data[i]}),
                .i_en(i_en),
                .i_cmd(connection_cmd[i-1].wire_cmd),
                .o_cmd(connection_cmd[i].wire_cmd)
            );
        end

        // last switch
        distribute_1x2_one_hot_comb #(
            .DATA_WIDTH(DATA_WIDTH),
            .IN_COMMAND_WIDTH(COMMAND_WIDTH-(NUM_NODE-1))
        ) last_switch(
            .i_valid(connection_valid[NUM_NODE-2]),
            .i_data_bus(connection_data[NUM_NODE-2]),
            .o_valid({o_valid[NUM_NODE-1], connection_valid[NUM_NODE-1]}),
            .o_data_bus({o_data_bus[(NUM_NODE-1)*DATA_WIDTH+:DATA_WIDTH], connection_data[NUM_NODE-1]}),
            .i_en(i_en),
            .i_cmd(connection_cmd[NUM_NODE-2].wire_cmd),
            .o_cmd()
        );

    endgenerate

endmodule

