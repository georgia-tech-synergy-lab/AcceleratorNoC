`timescale 1ns / 1ps
/*
    Top Module:  tb_distribute_2x2_cmd_flow_seq
    Data:        Only data width matters.
    Format:      keeping the input format unchange
    Timing:      Sequential Logic
    Reset:       Asynchronized Reset [Low Reset]
    Latency:     1 cycle for Simple
    Dummy Data:  {DATA_WIDTH{1'b0}}
    Note:        This distribute_2x2 switch is specially designed for
                 destination-tag-based routing topology like cube_dst_tag

    ----------------------------------------------
    DESTINATION_TAG verion: 1 bit control for each data.

    Unicast Function:
                     Both_Contention_Highout                          Both_Contention_Lowout

          i_data_bus(high)          i_data_bus(low)         i_data_bus(high)          i_data_bus(low)
       [DATA_WIDTH+:DATA_WIDTH]    [DATA_WIDTH-1:0]      [DATA_WIDTH+:DATA_WIDTH]    [DATA_WIDTH-1:0]
                              \     /                                         \     /
                               v   v                                           v   v
                               |¯¯¯| <--i_valid=2'b11                          |¯¯¯| <--i_valid=2'b11
         o_cmd=(n-2)b'???? <-- |___| <--i_cmd=n'b11????  o_cmd=(n-2)b'???? <-- |___| <--i_cmd=n'b00????
                              /     \                                         /     \
                             v       v                                       v       v
                     o_data_high   Invalid                               Invalid   o_data_low


                            Pass Through                                    Pass Switch

          i_data_bus(high)          i_data_bus(low)        i_data_bus(high)          i_data_bus(low)
       [DATA_WIDTH+:DATA_WIDTH]    [DATA_WIDTH-1:0]      [DATA_WIDTH+:DATA_WIDTH]    [DATA_WIDTH-1:0]
                              \     /                                         \     /
                               v   v                                           v   v
                               |¯¯¯| <--i_valid=2'b11                          |¯¯¯| <--i_valid=2'b11
         o_cmd=(n-2)b'???? <-- |___| <--i_cmd=n'b10????  o_cmd=(n-2)b'???? <-- |___| <--i_cmd=n'b01????
                              /     \                                         /     \
                             v       v                                       v       v
                     o_data_high   o_data_low                          o_data_low   o_data_high

    Note: the output port is Invalid when corresponding input data is invalid

    Special Function:      No Pass

          i_data_bus(high)          i_data_bus(low)
       [DATA_WIDTH+:DATA_WIDTH]    [DATA_WIDTH-1:0]
                           \     /
                            v   v
                            |¯¯¯| <--i_valid=2'b00
       o_cmd=(n-2)b'???? <--|___| <--i_cmd=n'b????
                           /     \
                          v       v
                     Invalid  Invalid

    Author:      Jianming Tong (jianming.tong@gatech.edu)
*/


// `define MULTIPLE_STAGE_COMMAND_INPUT_TEST
`define LAST_STAGE_TEST


`ifdef MULTIPLE_STAGE_COMMAND_INPUT_TEST

module tb_distribute_2x2_cmd_flow_seq();

    parameter DATA_WIDTH  = 32;
    parameter DESTINATION_TAG_WIDTH  = 1;

    // variable parameter
    // parameter IN_COMMAND_WIDTH = NUM_DATA_IN * DESTINATION_TAG_WIDTH;
    parameter IN_COMMAND_WIDTH = 4;

    // localparam
    parameter NUM_DATA_IN = 2;
    parameter NUM_DATA_OUT = 2;
    parameter CONSUME_COMMAND_WIDTH = NUM_DATA_IN * DESTINATION_TAG_WIDTH;

    parameter OUT_COMMAND_WIDTH_PER_DATA = ((IN_COMMAND_WIDTH - CONSUME_COMMAND_WIDTH) >> 1);
    parameter OUT_COMMAND_WIDTH = (IN_COMMAND_WIDTH>DESTINATION_TAG_WIDTH)?(NUM_DATA_OUT*OUT_COMMAND_WIDTH_PER_DATA):DESTINATION_TAG_WIDTH;



    // timing signals
    reg                              clk;
    reg                              rst_n;

    // data signals
    reg    [1:0]                     i_valid;        // valid input data signal
    reg    [2*DATA_WIDTH-1:0]        i_data_bus;     // input data bus coming into mux

    wire   [1:0]                     o_valid;        // output valid
    wire   [2*DATA_WIDTH-1:0]        o_data_bus;     // output data

    // control signals
    reg                              i_en;           // mux enable
    reg    [IN_COMMAND_WIDTH-1:0]    i_cmd;
    reg    [OUT_COMMAND_WIDTH_PER_DATA-1:0]   next_cmd;
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
        i_valid = 2'b11;
        i_data_bus = {{(DATA_WIDTH>>2){4'hA}},{(DATA_WIDTH>>2){4'hf}}};
        i_en = 1'b0;
        next_cmd = {OUT_COMMAND_WIDTH_PER_DATA{1'b0}};
        i_cmd = {{1'b1, next_cmd}, {1'b1, next_cmd}};

        // reset
        #20
        rst_n = 1'b0;
        i_valid = 2'b11;
        i_data_bus = {{(DATA_WIDTH>>2){4'hA}},{(DATA_WIDTH>>2){4'hf}}};
        i_en = 1'b1;
        next_cmd = {OUT_COMMAND_WIDTH_PER_DATA{1'b0}};
        i_cmd = {{1'b1, next_cmd}, {1'b1, next_cmd}};

        // input active --  HighIn HighOut
        #20
        rst_n = 1'b1;
        i_valid = 2'b11;
        i_data_bus = {{(DATA_WIDTH>>2){4'hA}},{(DATA_WIDTH>>2){4'hf}}};
        i_en = 1'b1;
        next_cmd = {OUT_COMMAND_WIDTH_PER_DATA{1'b0}};
        i_cmd = {{1'b1, next_cmd}, {1'b1, next_cmd}};

        // input active --  HighIn HighOut (LowIn invalid)
        #20
        i_valid = 2'b10;
        i_data_bus = {{(DATA_WIDTH>>2){4'hA}},{(DATA_WIDTH>>2){4'hf}}};
        i_en = 1'b1;
        next_cmd = {OUT_COMMAND_WIDTH_PER_DATA{1'b0}};
        i_cmd = {{1'b1, next_cmd}, {1'b1, next_cmd}};

        // input active --  HighIn HighOut (LowIn invalid)
        #20
        i_valid = 2'b10;
        i_data_bus = {{(DATA_WIDTH>>2){4'hA}},{(DATA_WIDTH>>2){4'hf}}};
        i_en = 1'b1;
        next_cmd = {OUT_COMMAND_WIDTH_PER_DATA{1'b0}};
        i_cmd = {{1'b1, next_cmd}, {1'b0, next_cmd}};

        // input active --  HighIn LowOut (LowIn invalid)
        #20
        i_valid = 2'b10;
        i_data_bus = {{(DATA_WIDTH>>2){4'hA}},{(DATA_WIDTH>>2){4'hf}}};
        i_en = 1'b1;
        next_cmd = {OUT_COMMAND_WIDTH_PER_DATA{1'b0}};
        i_cmd = {{1'b0, next_cmd}, {1'b0, next_cmd}};

        // input active --  HighIn LowOut (LowIn invalid)
        #20
        i_valid = 2'b10;
        i_data_bus = {{(DATA_WIDTH>>2){4'hA}},{(DATA_WIDTH>>2){4'hf}}};
        i_en = 1'b1;
        next_cmd = {OUT_COMMAND_WIDTH_PER_DATA{1'b0}};
        i_cmd = {{1'b0, next_cmd}, {1'b1, next_cmd}};

        // input active --  LowIn HighOut (HighIn Invalid)
        #20
        i_valid = 2'b01;
        i_data_bus = {{(DATA_WIDTH>>2){4'hA}},{(DATA_WIDTH>>2){4'hf}}};
        i_en = 1'b1;
        next_cmd = {OUT_COMMAND_WIDTH_PER_DATA{1'b0}};
        i_cmd = {{1'b0, next_cmd}, {1'b1, next_cmd}};

        // input active --  LowIn HighOut (HighIn Invalid)
        #20
        i_valid = 2'b01;
        i_data_bus = {{(DATA_WIDTH>>2){4'hA}},{(DATA_WIDTH>>2){4'hf}}};
        i_en = 1'b1;
        next_cmd = {OUT_COMMAND_WIDTH_PER_DATA{1'b0}};
        i_cmd = {{1'b1, next_cmd}, {1'b1, next_cmd}};

        // input active --  LowIn LowOut (HighIn Invalid)
        #20
        i_valid = 2'b01;
        i_data_bus = {{(DATA_WIDTH>>2){4'hA}},{(DATA_WIDTH>>2){4'hf}}};
        i_en = 1'b1;
        next_cmd = {OUT_COMMAND_WIDTH_PER_DATA{1'b0}};
        i_cmd = {{1'b0, next_cmd}, {1'b0, next_cmd}};

        // input active --  LowIn LowOut (HighIn Invalid)
        #20
        i_valid = 2'b01;
        i_data_bus = {{(DATA_WIDTH>>2){4'hA}},{(DATA_WIDTH>>2){4'hf}}};
        i_en = 1'b1;
        next_cmd = {OUT_COMMAND_WIDTH_PER_DATA{1'b0}};
        i_cmd = {{1'b1, next_cmd}, {1'b0, next_cmd}};

        // input active -- Pass Through
        #20
        i_valid = 2'b11;
        i_data_bus = {{(DATA_WIDTH>>2){4'hA}},{(DATA_WIDTH>>2){4'hf}}};
        i_en = 1'b1;
        next_cmd = {OUT_COMMAND_WIDTH_PER_DATA{1'b0}};
        i_cmd = {{1'b1, next_cmd}, {1'b0, next_cmd}};

        // input active -- Pass Switch
        #20
        i_valid = 2'b11;
        i_data_bus = {{(DATA_WIDTH>>2){4'hA}},{(DATA_WIDTH>>2){4'hf}}};
        i_en = 1'b1;
        next_cmd = {OUT_COMMAND_WIDTH_PER_DATA{1'b0}};
        i_cmd = {{1'b0, next_cmd}, {1'b1, next_cmd}};

        // NO PASS ( invalid both input )
        #20
        i_valid = 2'b00;
        i_data_bus = {{(DATA_WIDTH>>2){4'hA}},{(DATA_WIDTH>>2){4'hf}}};
        i_en = 1'b0;
        next_cmd = {OUT_COMMAND_WIDTH_PER_DATA{1'b0}};
        i_cmd = {{1'b0, next_cmd}, {1'b0, next_cmd}};

        // disable
        #20
        i_valid = 2'b11;
        i_data_bus = {{(DATA_WIDTH>>2){4'hA}},{(DATA_WIDTH>>2){4'hf}}};
        i_en = 1'b0;
        next_cmd = {OUT_COMMAND_WIDTH_PER_DATA{1'b0}};
        i_cmd = {{1'b0, next_cmd}, {1'b1, next_cmd}};

        // change data half way -- pass through
        #20
        i_valid = 2'b11;
        i_data_bus = {{(DATA_WIDTH>>2){4'hb}},{(DATA_WIDTH>>2){4'hc}}};
        i_en = 1'b1;
        next_cmd = {OUT_COMMAND_WIDTH_PER_DATA{1'b0}};
        i_cmd = {{1'b1, next_cmd}, {1'b0, next_cmd}};

        $stop;
    end


    // instantiate DUT (device under test)
    distribute_2x2_cmd_flow_seq #(
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

module tb_distribute_2x2_cmd_flow_seq();

    parameter DATA_WIDTH  = 32;
    parameter DESTINATION_TAG_WIDTH  = 2;

    // variable parameter
    // parameter IN_COMMAND_WIDTH = NUM_DATA_IN * DESTINATION_TAG_WIDTH;
    parameter IN_COMMAND_WIDTH = 4;

    // localparam
    parameter NUM_DATA_IN = 2;
    parameter NUM_DATA_OUT = 2;
    parameter CONSUME_COMMAND_WIDTH = NUM_DATA_IN * DESTINATION_TAG_WIDTH;

    parameter OUT_COMMAND_WIDTH_PER_DATA = ((IN_COMMAND_WIDTH - CONSUME_COMMAND_WIDTH) >> 1);
    parameter OUT_COMMAND_WIDTH = (IN_COMMAND_WIDTH>DESTINATION_TAG_WIDTH)?(NUM_DATA_OUT*OUT_COMMAND_WIDTH_PER_DATA):DESTINATION_TAG_WIDTH;



    // timing signals
    reg                              clk;
    reg                              rst_n;

    // data signals
    reg    [1:0]                     i_valid;        // valid input data signal
    reg    [2*DATA_WIDTH-1:0]        i_data_bus;     // input data bus coming into mux

    wire   [1:0]                     o_valid;        // output valid
    wire   [2*DATA_WIDTH-1:0]        o_data_bus;     // output data

    // control signals
    reg                              i_en;           // mux enable
    reg    [IN_COMMAND_WIDTH-1:0]    i_cmd;

    wire   [OUT_COMMAND_WIDTH-1:0]   o_cmd;

   // Test case declaration
    // all cases for control
    initial
    begin
        clk = 1'b0;
        // not enable at start
        rst_n = 1'b1;
        i_valid = 2'b11;
        i_data_bus = {{(DATA_WIDTH>>2){4'hA}},{(DATA_WIDTH>>2){4'hf}}};
        i_en = 1'b0;
        i_cmd = 2'b11;

        // reset
        #20
        rst_n = 1'b0;
        i_valid = 2'b11;
        i_data_bus = {{(DATA_WIDTH>>2){4'hA}},{(DATA_WIDTH>>2){4'hf}}};
        i_en = 1'b1;
        i_cmd = 2'b11;

        // input active --  HighIn HighOut
        #20
        rst_n = 1'b1;
        i_valid = 2'b11;
        i_data_bus = {{(DATA_WIDTH>>2){4'hA}},{(DATA_WIDTH>>2){4'hf}}};
        i_en = 1'b1;
        i_cmd = 2'b11;

        // input active --  HighIn HighOut (LowIn invalid)
        #20
        i_valid = 2'b10;
        i_data_bus = {{(DATA_WIDTH>>2){4'hA}},{(DATA_WIDTH>>2){4'hf}}};
        i_en = 1'b1;
        i_cmd = 2'b11;

        // input active --  HighIn HighOut (LowIn invalid)
        #20
        i_valid = 2'b10;
        i_data_bus = {{(DATA_WIDTH>>2){4'hA}},{(DATA_WIDTH>>2){4'hf}}};
        i_en = 1'b1;
        i_cmd = 2'b10;

        // input active --  HighIn LowOut (LowIn invalid)
        #20
        i_valid = 2'b10;
        i_data_bus = {{(DATA_WIDTH>>2){4'hA}},{(DATA_WIDTH>>2){4'hf}}};
        i_en = 1'b1;
        i_cmd = 2'b00;

        // input active --  HighIn LowOut (LowIn invalid)
        #20
        i_valid = 2'b10;
        i_data_bus = {{(DATA_WIDTH>>2){4'hA}},{(DATA_WIDTH>>2){4'hf}}};
        i_en = 1'b1;
        i_cmd = 2'b01;

        // input active --  LowIn HighOut (HighIn Invalid)
        #20
        i_valid = 2'b01;
        i_data_bus = {{(DATA_WIDTH>>2){4'hA}},{(DATA_WIDTH>>2){4'hf}}};
        i_en = 1'b1;
        i_cmd = 2'b01;

        // input active --  LowIn HighOut (HighIn Invalid)
        #20
        i_valid = 2'b01;
        i_data_bus = {{(DATA_WIDTH>>2){4'hA}},{(DATA_WIDTH>>2){4'hf}}};
        i_en = 1'b1;
        i_cmd = 2'b11;

        // input active --  LowIn LowOut (HighIn Invalid)
        #20
        i_valid = 2'b01;
        i_data_bus = {{(DATA_WIDTH>>2){4'hA}},{(DATA_WIDTH>>2){4'hf}}};
        i_en = 1'b1;
        i_cmd = 2'b00;

        // input active --  LowIn LowOut (HighIn Invalid)
        #20
        i_valid = 2'b01;
        i_data_bus = {{(DATA_WIDTH>>2){4'hA}},{(DATA_WIDTH>>2){4'hf}}};
        i_en = 1'b1;
        i_cmd = 2'b10;

        // input active -- Pass Through
        #20
        i_valid = 2'b11;
        i_data_bus = {{(DATA_WIDTH>>2){4'hA}},{(DATA_WIDTH>>2){4'hf}}};
        i_en = 1'b1;
        i_cmd = 2'b10;

        // input active -- Pass Switch
        #20
        i_valid = 2'b11;
        i_data_bus = {{(DATA_WIDTH>>2){4'hA}},{(DATA_WIDTH>>2){4'hf}}};
        i_en = 1'b1;
        i_cmd = 2'b01;

        // NO PASS ( invalid both input )
        #20
        i_valid = 2'b00;
        i_data_bus = {{(DATA_WIDTH>>2){4'hA}},{(DATA_WIDTH>>2){4'hf}}};
        i_en = 1'b0;
        i_cmd = 2'b00;

        // disable
        #20
        i_valid = 2'b11;
        i_data_bus = {{(DATA_WIDTH>>2){4'hA}},{(DATA_WIDTH>>2){4'hf}}};
        i_en = 1'b0;
        i_cmd = 2'b01;

        // change data half way -- pass through
        #20
        i_valid = 2'b11;
        i_data_bus = {{(DATA_WIDTH>>2){4'hb}},{(DATA_WIDTH>>2){4'hc}}};
        i_en = 1'b1;
        i_cmd = 2'b10;

        $stop;
    end


    // instantiate DUT (device under test)
    distribute_2x2_cmd_flow_seq #(
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