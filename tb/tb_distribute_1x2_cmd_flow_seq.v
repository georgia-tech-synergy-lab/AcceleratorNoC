`timescale 1ns / 1ps
/*
   Top Module:  tb_distribute_1x2_cmd_flow_seq
   Data:        Only data width matters.
   Format:      keeping the input format unchange
   Timing:      Sequential Logic
   Latency:     1 cycle
   Dummy Data:  {DATA_WIDTH{1'b0}}

   [SINGLE_BIT_CONTROL Version]
    Function:         Branch_high                                      Branch_low

                      i_data_bus                                       i_data_bus
                          |                                                |
                          v                                                v
                        |¯¯¯| <--i_valid=1'b1                            |¯¯¯| <--i_valid=1'b1
    o_cmd=(n-1)b'??? <--|___| <--i_cmd=n'b1???      o_cmd=(n-1)b'??? <-- |___| <--i_cmd=n'b0???
                       /                                                      \
              o_data_high                                         		 o_data_low

         o_data_high = o_data_bus[2*DATA_WIDTH-1: DATA_WIDTH]
         o_data_low  = o_data_bus[DATA_WIDTH-1: 0]
         i_valid = 2'b1?; where ? indicates that we don't care about this bit

   Author:      Jianming Tong (jianming.tong@gatech.edu)
*/

// `define MULTIPLE_STAGE_COMMAND_INPUT_TEST
`define LAST_STAGE_TEST


`ifdef MULTIPLE_STAGE_COMMAND_INPUT_TEST

module tb_distribute_1x2_cmd_flow_seq();

    parameter DATA_WIDTH  = 32;
    parameter DESTINATION_TAG_WIDTH  = 1;

    // variable parameter
    // parameter IN_COMMAND_WIDTH = NUM_DATA_IN * DESTINATION_TAG_WIDTH;
    parameter IN_COMMAND_WIDTH = 2;

    // localparam
    parameter NUM_DATA_IN = 1;
    parameter NUM_DATA_OUT = 2;
    parameter OUT_COMMAND_WIDTH = (IN_COMMAND_WIDTH>DESTINATION_TAG_WIDTH)?(NUM_DATA_OUT*(IN_COMMAND_WIDTH-DESTINATION_TAG_WIDTH)):DESTINATION_TAG_WIDTH;


    // timing signals
    reg                              clk;
    reg                              rst_n;

    // data signals
    reg                              i_valid;        // valid input data signal
    reg    [DATA_WIDTH-1:0]          i_data_bus;     // input data bus coming into mux

    wire   [1:0]                     o_valid;        // output valid
    wire   [2*DATA_WIDTH-1:0]        o_data_bus;     // output data

    // control signals
    reg                              i_en;           // mux enable
    reg    [IN_COMMAND_WIDTH-1:0]    i_cmd;
    reg    [IN_COMMAND_WIDTH-DESTINATION_TAG_WIDTH-1:0]   next_cmd;
        // 10 --> In chooses HighOut
        // 01 --> In chooses LowOut
        // 11 --> Multicasting

    wire   [OUT_COMMAND_WIDTH-1:0]   o_cmd;


    // Test case declaration
    // all cases for control
    initial
    begin
        clk = 1'b0;
        // not enable at start
        rst_n = 1'b1;
        i_valid = 1'b0;
        i_data_bus = {(DATA_WIDTH>>2){4'hA}};
        i_en = 1'b0;
        next_cmd = {(IN_COMMAND_WIDTH-DESTINATION_TAG_WIDTH){1'b1}};
        i_cmd = {1'b1, next_cmd};

        // not enable at start
        #20
        rst_n = 1'b0;
        i_valid = 1'b0;
        i_data_bus = {(DATA_WIDTH>>2){4'hA}};
        i_en = 1'b0;
        next_cmd = {(IN_COMMAND_WIDTH-DESTINATION_TAG_WIDTH){1'b1}};
        i_cmd = {1'b1, next_cmd};

        // input active --  In chooses LowOut
        #20
        rst_n = 1'b1;
        i_valid = 1'b1;
        i_data_bus = {(DATA_WIDTH>>2){4'hA}};
        i_en = 1'b1;
        next_cmd = {(IN_COMMAND_WIDTH-DESTINATION_TAG_WIDTH){1'b1}};
        i_cmd = {1'b0, next_cmd};

        // input active --  In chooses HighOut
        #20
        i_valid = 1'b1;
        i_data_bus = {(DATA_WIDTH>>2){4'hA}};
        i_en = 1'b1;
        next_cmd = {(IN_COMMAND_WIDTH-DESTINATION_TAG_WIDTH){1'b1}};
        i_cmd = {1'b1, next_cmd};

        // disable in progress
        #20
        i_valid = 1'b1;
        i_data_bus = {(DATA_WIDTH>>2){4'hA}};
        i_en = 1'b0;
        next_cmd = {(IN_COMMAND_WIDTH-DESTINATION_TAG_WIDTH){1'b1}};
        i_cmd = {1'b1, next_cmd};

        // enable in progress
        #20
        i_valid = 1'b1;
        i_data_bus = {(DATA_WIDTH>>2){4'hA}};
        i_en = 1'b1;
        next_cmd = {(IN_COMMAND_WIDTH-DESTINATION_TAG_WIDTH){1'b1}};
        i_cmd = {1'b1, next_cmd};

        // change data half way
        #20
        i_valid = 1'b1;
        i_data_bus = {(DATA_WIDTH>>2){4'hB}};
        i_en = 1'b1;
        next_cmd = {(IN_COMMAND_WIDTH-DESTINATION_TAG_WIDTH){1'b1}};
        i_cmd = {1'b1, next_cmd};

        // invalid input
        #20
        i_valid = 1'b0;
        i_data_bus = {(DATA_WIDTH>>2){4'hB}};
        i_en = 1'b1;
        next_cmd = {(IN_COMMAND_WIDTH-DESTINATION_TAG_WIDTH){1'b1}};
        i_cmd = {1'b1, next_cmd};

        $stop;
    end


    // instantiate DUT (device under test)
    distribute_1x2_cmd_flow_seq #(
        .DATA_WIDTH(DATA_WIDTH),
        .DESTINATION_TAG_WIDTH(DESTINATION_TAG_WIDTH),
        .IN_COMMAND_WIDTH(IN_COMMAND_WIDTH)
    ) dut(
        .clk(clk),
        .rst_n(rst_n),
        .i_valid(i_valid),
        .i_data_bus(i_data_bus),
        .o_valid(o_valid),
        .o_data_bus(o_data_bus),
        .i_en(i_en),
        .i_cmd(i_cmd),
        .o_cmd(o_cmd)
    );

    always#5 clk=~clk;

endmodule
`endif


`ifdef LAST_STAGE_TEST
module tb_distribute_1x2_cmd_flow_seq();

    parameter DATA_WIDTH  = 32;
    parameter DESTINATION_TAG_WIDTH  = 1;

    // variable parameter
    // parameter IN_COMMAND_WIDTH = NUM_DATA_IN * DESTINATION_TAG_WIDTH;
    parameter IN_COMMAND_WIDTH = 1;

    // localparam
    parameter NUM_DATA_IN = 1;
    parameter NUM_DATA_OUT = 2;
    parameter OUT_COMMAND_WIDTH = (IN_COMMAND_WIDTH>DESTINATION_TAG_WIDTH)?(NUM_DATA_OUT*(IN_COMMAND_WIDTH-DESTINATION_TAG_WIDTH)):DESTINATION_TAG_WIDTH;



    // timing signals
    reg                              clk;
    reg                              rst_n;

    // data signals
    reg                              i_valid;        // valid input data signal
    reg    [DATA_WIDTH-1:0]          i_data_bus;     // input data bus coming into mux

    wire   [1:0]                     o_valid;        // output valid
    wire   [2*DATA_WIDTH-1:0]        o_data_bus;     // output data

    // control signals
    reg                              i_en;           // mux enable
    reg    [IN_COMMAND_WIDTH-1:0]    i_cmd;
        // 10 --> In chooses HighOut
        // 01 --> In chooses LowOut
        // 11 --> Multicasting

    wire   [OUT_COMMAND_WIDTH-1:0]   o_cmd;


    // Test case declaration
    // all cases for control
    initial
    begin
        clk = 1'b0;
        // not enable at start
        rst_n = 1'b1;
        i_valid = 1'b0;
        i_data_bus = {(DATA_WIDTH>>2){4'hA}};
        i_en = 1'b0;
        i_cmd = 1'b1;

        // reset
        #20
        rst_n = 1'b0;
        i_valid = 1'b1;
        i_data_bus = {(DATA_WIDTH>>2){4'hA}};
        i_en = 1'b1;
        i_cmd = 1'b0;

        // input active --  In chooses LowOut
        #20
        rst_n = 1'b1;
        i_valid = 1'b1;
        i_data_bus = {(DATA_WIDTH>>2){4'hA}};
        i_en = 1'b1;
        i_cmd = 1'b0;

        // input active --  In chooses HighOut
        #20
        i_valid = 1'b1;
        i_data_bus = {(DATA_WIDTH>>2){4'hA}};
        i_en = 1'b1;
        i_cmd = 1'b1;

        // disable in progress
        #20
        i_valid = 1'b1;
        i_data_bus = {(DATA_WIDTH>>2){4'hA}};
        i_en = 1'b0;
        i_cmd = 1'b1;

        // enable in progress
        #20
        i_valid = 1'b1;
        i_data_bus = {(DATA_WIDTH>>2){4'hA}};
        i_en = 1'b1;
        i_cmd = 1'b1;

        // change data half way
        #20
        i_valid = 1'b1;
        i_data_bus = {(DATA_WIDTH>>2){4'hB}};
        i_en = 1'b1;
        i_cmd = 1'b1;

        // invalid input
        #20
        i_valid = 1'b0;
        i_data_bus = {(DATA_WIDTH>>2){4'hB}};
        i_en = 1'b1;
        i_cmd = 1'b1;

        $stop;
    end


    // instantiate DUT (device under test)
    distribute_1x2_cmd_flow_seq #(
        .DATA_WIDTH(DATA_WIDTH),
        .DESTINATION_TAG_WIDTH(DESTINATION_TAG_WIDTH),
        .IN_COMMAND_WIDTH(IN_COMMAND_WIDTH)
    ) dut(
        .clk(clk),
        .rst_n(rst_n),
        .i_valid(i_valid),
        .i_data_bus(i_data_bus),
        .o_valid(o_valid),
        .o_data_bus(o_data_bus),
        .i_en(i_en),
        .i_cmd(i_cmd),
        .o_cmd(o_cmd)
    );

    always#5 clk=~clk;

endmodule
`endif