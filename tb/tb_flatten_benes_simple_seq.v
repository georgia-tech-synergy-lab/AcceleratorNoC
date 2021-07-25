`timescale 1ns / 1ps
/*
    Top Module:  tb_flatten_benes_simple_seq
    Data:        Only data width matters.
    Format:      keeping the reg format unchange
    Timing:      Sequential Logic
    Reset:       Asynchronized Reset [Low Reset]
    Pipeline:    For benes constructed with sequential switches, every stage is a pipeline stage
                 Total latency = # stages (cycle)
    Dummy Data:  {DATA_WIDTH{1'b0}}

    Function:    Unicast  or  Multicast(Not arbitrary Multicast)

        i_data_bus[0*DATA_WIDTH+:DATA_WIDTH]  -->|¯¯¯|-------->|¯¯¯|------->|¯¯¯|------->|¯¯¯|-------->|¯¯¯|-->
        i_data_bus[1*DATA_WIDTH+:DATA_WIDTH]  -->|___|-\ /---->|___|--\ /-->|___|--\ /-->|___|----\ /->|___|-->
                                                        X              X            X              X
        i_data_bus[2*DATA_WIDTH+:DATA_WIDTH]  -->|¯¯¯|-/ \/--->|¯¯¯|--/ \-->|¯¯¯|--/ \-->|¯¯¯|---\/ \->|¯¯¯|-->
        i_data_bus[3*DATA_WIDTH+:DATA_WIDTH]  -->|___|-\ /\ /->|___|------->|___|------->|___|-\ /\ /->|___|-->
                                                        X  X                                    X  X
        i_data_bus[4*DATA_WIDTH+:DATA_WIDTH]  -->|¯¯¯|-/ \/ \->|¯¯¯|------->|¯¯¯|------->|¯¯¯|-/ \/ \->|¯¯¯|-->
        i_data_bus[5*DATA_WIDTH+:DATA_WIDTH]  -->|___|-\ /\--->|___|--\ /-->|___|--\ /-->|___|---/\ /->|___|-->
                                                        X              X            X              X
        i_data_bus[6*DATA_WIDTH+:DATA_WIDTH]  -->|¯¯¯|-/ \---->|¯¯¯|--/ \-->|¯¯¯|--/ \-->|¯¯¯|----/ \->|¯¯¯|-->
        i_data_bus[7*DATA_WIDTH+:DATA_WIDTH]  -->|___|-------->|___|------->|___|------->|___|-------->|___|-->

           CONNECTION FUNCTION                   INVERSE SHUFFLE      ,,         SHUFFLE       SHUFFLE
          CONNECTION GROUP SIZE                         8             4             4             8

    Control Signal
        i_valid[0]-->|¯¯¯|<--ctrl[2:0]
        i_valid[1]-->|___|

    Author:      Jianming Tong (jianming.tong@gatech.edu)
*/

// design the following testbench for 2^n inputs. n could be any integer.
// Note: Only 8 input are valid.

// `define TEST_4_INPUT_FLATTEN_BENES
`define TEST_8_INPUT_FLATTEN_BENES  //change #30 into #20
// `define TEST_16_INPUT_FLATTEN_BENES //change #30 into #40
// `define TEST_32_INPUT_FLATTEN_BENES    //change #30 into #80


`ifdef TEST_4_INPUT_FLATTEN_BENES
module tb_flatten_benes_simple_seq();
    parameter DATA_WIDTH = 4;
    parameter COMMAND_WIDTH  = 2;
    parameter NUM_INPUT_DATA = 4;

    //parameter
    localparam NUM_SWITCH_IN = NUM_INPUT_DATA >> 1;
    localparam LEVEL = $clog2(NUM_SWITCH_IN);
    localparam TOTAL_STAGE = 2*LEVEL+1;

    localparam TOTAL_COMMAND = TOTAL_STAGE*NUM_SWITCH_IN*COMMAND_WIDTH;

    localparam WIDTH_INPUT_DATA = NUM_INPUT_DATA*DATA_WIDTH;

    // interface
    reg                                        clk;
    reg                                        rst_n;

    reg  [NUM_INPUT_DATA-1:0]                  i_valid;
    reg  [WIDTH_INPUT_DATA-1:0]                i_data_bus;

    wire [NUM_INPUT_DATA-1:0]                  o_valid;
    wire [WIDTH_INPUT_DATA-1:0]                o_data_bus; //{o_data_a, o_data_b}

    reg                                        i_en;
    reg  [TOTAL_COMMAND-1:0]                  i_cmd;

    // Test case declaration
    // all cases for control
    initial
    begin
        clk = 1'b0;
        // not enable at start
        #30
        rst_n = 1'b1;
        i_valid = {NUM_INPUT_DATA{1'b1}};
        i_data_bus = {{(DATA_WIDTH>>2){4'h3}},{(DATA_WIDTH>>2){4'h2}},{(DATA_WIDTH>>2){4'h1}},{(DATA_WIDTH>>2){4'h0}}};
        i_en = 1'b1;
        i_cmd = {(TOTAL_COMMAND>>1){2'b10}};

        // rst_n active;
        #30
        rst_n = 1'b0;
        i_valid = {NUM_INPUT_DATA{1'b1}};
        i_data_bus = {{(DATA_WIDTH>>2){4'h3}},{(DATA_WIDTH>>2){4'h2}},{(DATA_WIDTH>>2){4'h1}},{(DATA_WIDTH>>2){4'h0}}};
        i_en = 1'b1;
        i_cmd = {(TOTAL_COMMAND>>1){2'b00}};

        // reg active -- Multicast_HighIn
        #30
        rst_n = 1'b1;
        i_valid = {NUM_INPUT_DATA{1'b1}};
        i_data_bus = {{(DATA_WIDTH>>2){4'h3}},{(DATA_WIDTH>>2){4'h2}},{(DATA_WIDTH>>2){4'h1}},{(DATA_WIDTH>>2){4'h0}}};
        i_en = 1'b1;
        i_cmd = {(TOTAL_COMMAND>>1){2'b11}};

        // reg active -- Multicast_LowIn
        #30
        rst_n = 1'b1;
        i_valid = {NUM_INPUT_DATA{1'b1}};
        i_data_bus = {{(DATA_WIDTH>>2){4'h3}},{(DATA_WIDTH>>2){4'h2}},{(DATA_WIDTH>>2){4'h1}},{(DATA_WIDTH>>2){4'h0}}};
        i_en = 1'b1;
        i_cmd = {(TOTAL_COMMAND>>1){2'b00}};

        // reg active -- Pass Through
        #30
        rst_n = 1'b1;
        i_valid = {NUM_INPUT_DATA{1'b1}};
        i_data_bus = {{(DATA_WIDTH>>2){4'h3}},{(DATA_WIDTH>>2){4'h2}},{(DATA_WIDTH>>2){4'h1}},{(DATA_WIDTH>>2){4'h0}}};
        i_en = 1'b1;
        i_cmd = {(TOTAL_COMMAND>>1){2'b10}};

        // reg active -- Pass Switch
        #30
        rst_n = 1'b1;
        i_valid = {NUM_INPUT_DATA{1'b1}};
        i_data_bus = {{(DATA_WIDTH>>2){4'h3}},{(DATA_WIDTH>>2){4'h2}},{(DATA_WIDTH>>2){4'h1}},{(DATA_WIDTH>>2){4'h0}}};
        i_en = 1'b1;
        i_cmd = {(TOTAL_COMMAND>>1){2'b01}};

        // disable in progress
        #30
        rst_n = 1'b1;
        i_valid = {NUM_INPUT_DATA{1'b1}};
        i_data_bus = {{(DATA_WIDTH>>2){4'h3}},{(DATA_WIDTH>>2){4'h2}},{(DATA_WIDTH>>2){4'h1}},{(DATA_WIDTH>>2){4'h0}}};
        i_en = 1'b0;
        i_cmd = {(TOTAL_COMMAND>>1){2'b10}};

        // enable in progress -- Pass Through
        #30
        rst_n = 1'b1;
        i_valid = {NUM_INPUT_DATA{1'b1}};
        i_data_bus = {{(DATA_WIDTH>>2){4'h3}},{(DATA_WIDTH>>2){4'h2}},{(DATA_WIDTH>>2){4'h1}},{(DATA_WIDTH>>2){4'h0}}};
        i_en = 1'b1;
        i_cmd = {(TOTAL_COMMAND>>1){2'b10}};

        // reset half way  -- Pass Swtich
        #30
        rst_n = 1'b1;
        i_valid = {NUM_INPUT_DATA{1'b1}};
        i_data_bus = {{(DATA_WIDTH>>2){4'h3}},{(DATA_WIDTH>>2){4'h2}},{(DATA_WIDTH>>2){4'h1}},{(DATA_WIDTH>>2){4'h0}}};
        i_en = 1'b1;
        i_cmd = {(TOTAL_COMMAND>>1){2'b10}};

        // reg active -- No Pass
        #30
        rst_n = 1'b1;
        i_valid = {NUM_INPUT_DATA{1'b1}};
        i_data_bus = {{(DATA_WIDTH>>2){4'h3}},{(DATA_WIDTH>>2){4'h2}},{(DATA_WIDTH>>2){4'h1}},{(DATA_WIDTH>>2){4'h0}}};
        i_en = 1'b1;
        i_cmd = {(TOTAL_COMMAND>>1){2'b10}};

        // change data half way  -- Pass Through
        #30
        rst_n = 1'b1;
        i_valid = {NUM_INPUT_DATA{1'b1}};
        i_data_bus = {{(DATA_WIDTH>>2){4'hb}},{(DATA_WIDTH>>2){4'ha}},{(DATA_WIDTH>>2){4'h9}},{(DATA_WIDTH>>2){4'h8}}};
        i_en = 1'b1;
        i_cmd = {(TOTAL_COMMAND>>1){2'b10}};

        // invalid high output -- Pass Through
        #30
        rst_n = 1'b1;
        i_valid = {NUM_INPUT_DATA{1'b1}};
        i_data_bus = {{(DATA_WIDTH>>2){4'hb}},{(DATA_WIDTH>>2){4'ha}},{(DATA_WIDTH>>2){4'h9}},{(DATA_WIDTH>>2){4'h8}}};
        i_en = 1'b1;
        i_cmd = {(TOTAL_COMMAND>>1){2'b10}};

        // invalid low output  -- Pass Through
        #30
        rst_n = 1'b1;
        i_valid = {NUM_INPUT_DATA{1'b1}};
        i_data_bus = {{(DATA_WIDTH>>2){4'hb}},{(DATA_WIDTH>>2){4'ha}},{(DATA_WIDTH>>2){4'h9}},{(DATA_WIDTH>>2){4'h8}}};
        i_en = 1'b1;
        i_cmd = {(TOTAL_COMMAND>>1){2'b10}};
        #30
        $stop;
    end

    // instantiate DUT (device under test)
    flatten_benes_simple_seq #(
        .DATA_WIDTH(DATA_WIDTH),
        .COMMAND_WIDTH(COMMAND_WIDTH),
        .NUM_INPUT_DATA(NUM_INPUT_DATA)
      ) dut(
        .clk(clk),
        .rst_n(rst_n),
        .i_valid(i_valid),
        .i_data_bus(i_data_bus),
        .o_valid(o_valid),
        .o_data_bus(o_data_bus),
        .i_en(i_en),
        .i_cmd(i_cmd)
    );

    always#5 clk=~clk;
endmodule
`endif

`ifdef TEST_8_INPUT_FLATTEN_BENES
module tb_flatten_benes_simple_seq();
    parameter DATA_WIDTH = 4;
    parameter COMMAND_WIDTH  = 5;
    parameter NUM_INPUT_DATA = 8;

    //parameter
    localparam NUM_SWITCH_IN = NUM_INPUT_DATA >> 1;
    localparam LEVEL = $clog2(NUM_SWITCH_IN);
    localparam TOTAL_STAGE = 2*LEVEL+1;

    localparam TOTAL_COMMAND = TOTAL_STAGE*NUM_SWITCH_IN*COMMAND_WIDTH;

    localparam WIDTH_INPUT_DATA = NUM_INPUT_DATA*DATA_WIDTH;

    // interface
    reg                                        clk;
    reg                                        rst_n;

    reg  [NUM_INPUT_DATA-1:0]                  i_valid;
    reg  [WIDTH_INPUT_DATA-1:0]                i_data_bus;

    wire [NUM_INPUT_DATA-1:0]                  o_valid;
    wire [WIDTH_INPUT_DATA-1:0]                o_data_bus; //{o_data_a, o_data_b}

    reg                                        i_en;
    reg  [TOTAL_COMMAND-1:0]                  i_cmd;
                                    // 11 --> Multicast_HighIn
                                    // 00 --> Multicast_LowIn
                                    // 10 --> Pass Through
                                    // 01 --> Pass Switch

    // Test case declaration
    // all cases for control
    initial
    begin
        clk = 1'b0;
        // not enable at start
        #30
        rst_n = 1'b1;
        i_valid = {NUM_INPUT_DATA{1'b1}};
        i_data_bus = {{(DATA_WIDTH>>2){4'h7}},{(DATA_WIDTH>>2){4'h6}},{(DATA_WIDTH>>2){4'h5}},{(DATA_WIDTH>>2){4'h4}},{(DATA_WIDTH>>2){4'h3}},{(DATA_WIDTH>>2){4'h2}},{(DATA_WIDTH>>2){4'h1}},{(DATA_WIDTH>>2){4'h0}}};
        i_en = 1'b1;
        // i_cmd = TOTAL_COMMAND'b10101_10101_10010_10010__10101_10010_10101_01010__10_10_10_10__10101_10010_10101_01101__10101_01010_10010_10010;
        // i_cmd = 100'b10101_10101_10010_10010__10101_10010_10101_01010__10000_10000_10000_10000__10101_10010_10101_01101__10101_01010_10010_10010;
        i_cmd = 100'b10010_10010_01010_10101__01101_10101_10010_10101__00001_00010_00010_00010__01010_10101_10010_10101__10010_10010_10101_10101;

        // rst_n active;
        #30
        rst_n = 1'b0;
        i_valid = {NUM_INPUT_DATA{1'b1}};
        i_data_bus = {{(DATA_WIDTH>>2){4'h7}},{(DATA_WIDTH>>2){4'h6}},{(DATA_WIDTH>>2){4'h5}},{(DATA_WIDTH>>2){4'h4}},{(DATA_WIDTH>>2){4'h3}},{(DATA_WIDTH>>2){4'h2}},{(DATA_WIDTH>>2){4'h1}},{(DATA_WIDTH>>2){4'h0}}};
        i_en = 1'b1;
        i_cmd = 100'b10010_10010_01010_10101__01101_10101_10010_10101__00001_00010_00010_00010__01010_10101_10010_10101__10010_10010_10101_10101;
        // i_cmd = 100'b10101_10101_10010_10010__10101_10010_10101_01010__10_10_10_10__10101_10010_10101_01101__10101_01010_10010_10010;

        // reg active -- Multicast_HighIn
        #30
        rst_n = 1'b1;
        i_valid = {NUM_INPUT_DATA{1'b1}};
        i_data_bus = {{(DATA_WIDTH>>2){4'h7}},{(DATA_WIDTH>>2){4'h6}},{(DATA_WIDTH>>2){4'h2}},{(DATA_WIDTH>>2){4'h4}},{(DATA_WIDTH>>2){4'h5}},{(DATA_WIDTH>>2){4'h3}},{(DATA_WIDTH>>2){4'h1}},{(DATA_WIDTH>>2){4'h0}}};
        i_en = 1'b1;
        i_cmd = 100'b10010_10010_01010_10101__01101_10101_10010_10101__00001_00010_00010_00010__01010_10101_10010_10101__10010_10010_10101_10101;

        // // reg active -- Multicast_LowIn
        // #30
        // rst_n = 1'b1;
        // i_valid = {NUM_INPUT_DATA{1'b1}};
        // i_data_bus = {{(DATA_WIDTH>>2){4'h7}},{(DATA_WIDTH>>2){4'h6}},{(DATA_WIDTH>>2){4'h5}},{(DATA_WIDTH>>2){4'h4}},{(DATA_WIDTH>>2){4'h3}},{(DATA_WIDTH>>2){4'h2}},{(DATA_WIDTH>>2){4'h1}},{(DATA_WIDTH>>2){4'h0}}};
        // i_en = 1'b1;
        // i_cmd = {(TOTAL_COMMAND>>1){2'b00}};

        // // reg active -- Pass Through
        // #30
        // rst_n = 1'b1;
        // i_valid = {NUM_INPUT_DATA{1'b1}};
        // i_data_bus = {{(DATA_WIDTH>>2){4'h7}},{(DATA_WIDTH>>2){4'h6}},{(DATA_WIDTH>>2){4'h5}},{(DATA_WIDTH>>2){4'h4}},{(DATA_WIDTH>>2){4'h3}},{(DATA_WIDTH>>2){4'h2}},{(DATA_WIDTH>>2){4'h1}},{(DATA_WIDTH>>2){4'h0}}};
        // i_en = 1'b1;
        // i_cmd = {(TOTAL_COMMAND>>1){2'b10}};

        // // reg active -- Pass Switch
        // #30
        // rst_n = 1'b1;
        // i_valid = {NUM_INPUT_DATA{1'b1}};
        // i_data_bus = {{(DATA_WIDTH>>2){4'h7}},{(DATA_WIDTH>>2){4'h6}},{(DATA_WIDTH>>2){4'h5}},{(DATA_WIDTH>>2){4'h4}},{(DATA_WIDTH>>2){4'h3}},{(DATA_WIDTH>>2){4'h2}},{(DATA_WIDTH>>2){4'h1}},{(DATA_WIDTH>>2){4'h0}}};
        // i_en = 1'b1;
        // i_cmd = {(TOTAL_COMMAND>>1){2'b01}};

        // // disable in progress
        // #30
        // rst_n = 1'b1;
        // i_valid = {NUM_INPUT_DATA{1'b1}};
        // i_data_bus = {{(DATA_WIDTH>>2){4'h7}},{(DATA_WIDTH>>2){4'h6}},{(DATA_WIDTH>>2){4'h5}},{(DATA_WIDTH>>2){4'h4}},{(DATA_WIDTH>>2){4'h3}},{(DATA_WIDTH>>2){4'h2}},{(DATA_WIDTH>>2){4'h1}},{(DATA_WIDTH>>2){4'h0}}};
        // i_en = 1'b0;
        // i_cmd = {(TOTAL_COMMAND>>1){2'b10}};

        // // enable in progress -- Pass Through
        // #30
        // rst_n = 1'b1;
        // i_valid = {NUM_INPUT_DATA{1'b1}};
        // i_data_bus = {{(DATA_WIDTH>>2){4'h7}},{(DATA_WIDTH>>2){4'h6}},{(DATA_WIDTH>>2){4'h5}},{(DATA_WIDTH>>2){4'h4}},{(DATA_WIDTH>>2){4'h3}},{(DATA_WIDTH>>2){4'h2}},{(DATA_WIDTH>>2){4'h1}},{(DATA_WIDTH>>2){4'h0}}};
        // i_en = 1'b1;
        // i_cmd = {(TOTAL_COMMAND>>1){2'b10}};

        // // reset half way  -- Pass Swtich
        // #30
        // rst_n = 1'b1;
        // i_valid = {NUM_INPUT_DATA{1'b1}};
        // i_data_bus = {{(DATA_WIDTH>>2){4'h7}},{(DATA_WIDTH>>2){4'h6}},{(DATA_WIDTH>>2){4'h5}},{(DATA_WIDTH>>2){4'h4}},{(DATA_WIDTH>>2){4'h3}},{(DATA_WIDTH>>2){4'h2}},{(DATA_WIDTH>>2){4'h1}},{(DATA_WIDTH>>2){4'h0}}};
        // i_en = 1'b1;
        // i_cmd = {(TOTAL_COMMAND>>1){2'b10}};

        // // reg active -- No Pass
        // #30
        // rst_n = 1'b1;
        // i_valid = {NUM_INPUT_DATA{1'b1}};
        // i_data_bus = {{(DATA_WIDTH>>2){4'h7}},{(DATA_WIDTH>>2){4'h6}},{(DATA_WIDTH>>2){4'h5}},{(DATA_WIDTH>>2){4'h4}},{(DATA_WIDTH>>2){4'h3}},{(DATA_WIDTH>>2){4'h2}},{(DATA_WIDTH>>2){4'h1}},{(DATA_WIDTH>>2){4'h0}}};
        // i_en = 1'b1;
        // i_cmd = {(TOTAL_COMMAND>>1){2'b10}};

        // // change data half way -- Pass Through
        // #30
        // rst_n = 1'b1;
        // i_valid = {NUM_INPUT_DATA{1'b1}};
        // i_data_bus = {{(DATA_WIDTH>>2){4'hf}},{(DATA_WIDTH>>2){4'he}},{(DATA_WIDTH>>2){4'hd}},{(DATA_WIDTH>>2){4'hc}},{(DATA_WIDTH>>2){4'hb}},{(DATA_WIDTH>>2){4'ha}},{(DATA_WIDTH>>2){4'h9}},{(DATA_WIDTH>>2){4'h8}}};
        // i_en = 1'b1;
        // i_cmd = {(TOTAL_COMMAND>>1){2'b10}};

        // // invalid high output -- Pass Through
        // #30
        // rst_n = 1'b1;
        // i_valid = {NUM_INPUT_DATA{1'b1}};
        // i_data_bus = {{(DATA_WIDTH>>2){4'hf}},{(DATA_WIDTH>>2){4'he}},{(DATA_WIDTH>>2){4'hd}},{(DATA_WIDTH>>2){4'hc}},{(DATA_WIDTH>>2){4'hb}},{(DATA_WIDTH>>2){4'ha}},{(DATA_WIDTH>>2){4'h9}},{(DATA_WIDTH>>2){4'h8}}};
        // i_en = 1'b1;
        // i_cmd = {(TOTAL_COMMAND>>1){2'b10}};

        // // invalid low output -- Pass Through
        // #30
        // rst_n = 1'b1;
        // i_valid = {NUM_INPUT_DATA{1'b1}};
        // i_data_bus = {{(DATA_WIDTH>>2){4'hf}},{(DATA_WIDTH>>2){4'he}},{(DATA_WIDTH>>2){4'hd}},{(DATA_WIDTH>>2){4'hc}},{(DATA_WIDTH>>2){4'hb}},{(DATA_WIDTH>>2){4'ha}},{(DATA_WIDTH>>2){4'h9}},{(DATA_WIDTH>>2){4'h8}}};
        // i_en = 1'b1;
        // i_cmd = {(TOTAL_COMMAND>>1){2'b10}};
        #180
        $stop;
    end

    // instantiate DUT (device under test)
    flatten_benes_simple_seq #(
        .DATA_WIDTH(DATA_WIDTH),
        .COMMAND_WIDTH(COMMAND_WIDTH),
        .NUM_INPUT_DATA(NUM_INPUT_DATA)
      ) dut(
        .clk(clk),
        .rst_n(rst_n),
        .i_valid(i_valid),
        .i_data_bus(i_data_bus),
        .o_valid(o_valid),
        .o_data_bus(o_data_bus),
        .i_en(i_en),
        .i_cmd(i_cmd)
    );

    always#5 clk=~clk;

endmodule

`endif



`ifdef TEST_16_INPUT_FLATTEN_BENES
module tb_flatten_benes_simple_seq();
    parameter DATA_WIDTH = 4;
    parameter COMMAND_WIDTH  = 2;
    parameter NUM_INPUT_DATA = 16;

    //parameter
    localparam NUM_SWITCH_IN = NUM_INPUT_DATA >> 1;
    localparam LEVEL = $clog2(NUM_SWITCH_IN);
    localparam TOTAL_STAGE = 2*LEVEL+1;

    localparam TOTAL_COMMAND = TOTAL_STAGE*NUM_SWITCH_IN*COMMAND_WIDTH;

    localparam WIDTH_INPUT_DATA = NUM_INPUT_DATA*DATA_WIDTH;

    // interface
    reg                                        clk;
    reg                                        rst_n;

    reg  [NUM_INPUT_DATA-1:0]                  i_valid;
    reg  [WIDTH_INPUT_DATA-1:0]                i_data_bus;

    wire [NUM_INPUT_DATA-1:0]                  o_valid;
    wire [WIDTH_INPUT_DATA-1:0]                o_data_bus; //{o_data_a, o_data_b}

    reg                                        i_en;
    reg  [TOTAL_COMMAND-1:0]                  i_cmd;
                                    // 11 --> Multicast_HighIn
                                    // 00 --> Multicast_LowIn
                                    // 10 --> Pass Through
                                    // 01 --> Pass Switch

    // Test case declaration
    // all cases for control
    initial
    begin
        clk = 1'b0;
        // not enable at start
        #30
        rst_n = 1'b1;
        i_valid = {NUM_INPUT_DATA{1'b1}};
        i_data_bus = {{(DATA_WIDTH>>2){4'hf}},{(DATA_WIDTH>>2){4'he}},{(DATA_WIDTH>>2){4'hd}},{(DATA_WIDTH>>2){4'hc}},{(DATA_WIDTH>>2){4'hb}},{(DATA_WIDTH>>2){4'ha}},{(DATA_WIDTH>>2){4'h9}},{(DATA_WIDTH>>2){4'h8}},{(DATA_WIDTH>>2){4'h7}},{(DATA_WIDTH>>2){4'h6}},{(DATA_WIDTH>>2){4'h5}},{(DATA_WIDTH>>2){4'h4}},{(DATA_WIDTH>>2){4'h3}},{(DATA_WIDTH>>2){4'h2}},{(DATA_WIDTH>>2){4'h1}},{(DATA_WIDTH>>2){4'h0}}};
        i_en = 1'b1;
        i_cmd = {(TOTAL_COMMAND>>1){2'b10}};

        // rst_n active;
        #30
        rst_n = 1'b0;
        i_valid = {NUM_INPUT_DATA{1'b1}};
        i_data_bus = {{(DATA_WIDTH>>2){4'hf}},{(DATA_WIDTH>>2){4'he}},{(DATA_WIDTH>>2){4'hd}},{(DATA_WIDTH>>2){4'hc}},{(DATA_WIDTH>>2){4'hb}},{(DATA_WIDTH>>2){4'ha}},{(DATA_WIDTH>>2){4'h9}},{(DATA_WIDTH>>2){4'h8}},{(DATA_WIDTH>>2){4'h7}},{(DATA_WIDTH>>2){4'h6}},{(DATA_WIDTH>>2){4'h5}},{(DATA_WIDTH>>2){4'h4}},{(DATA_WIDTH>>2){4'h3}},{(DATA_WIDTH>>2){4'h2}},{(DATA_WIDTH>>2){4'h1}},{(DATA_WIDTH>>2){4'h0}}};
        i_en = 1'b1;
        i_cmd = {(TOTAL_COMMAND>>1){2'b00}};

        // reg active -- Multicast_HighIn
        #30
        rst_n = 1'b1;
        i_valid = {NUM_INPUT_DATA{1'b1}};
        i_data_bus = {{(DATA_WIDTH>>2){4'hf}},{(DATA_WIDTH>>2){4'he}},{(DATA_WIDTH>>2){4'hd}},{(DATA_WIDTH>>2){4'hc}},{(DATA_WIDTH>>2){4'hb}},{(DATA_WIDTH>>2){4'ha}},{(DATA_WIDTH>>2){4'h9}},{(DATA_WIDTH>>2){4'h8}},{(DATA_WIDTH>>2){4'h7}},{(DATA_WIDTH>>2){4'h6}},{(DATA_WIDTH>>2){4'h5}},{(DATA_WIDTH>>2){4'h4}},{(DATA_WIDTH>>2){4'h3}},{(DATA_WIDTH>>2){4'h2}},{(DATA_WIDTH>>2){4'h1}},{(DATA_WIDTH>>2){4'h0}}};
        i_en = 1'b1;
        i_cmd = {(TOTAL_COMMAND>>1){2'b11}};

        // reg active -- Multicast_LowIn
        #30
        rst_n = 1'b1;
        i_valid = {NUM_INPUT_DATA{1'b1}};
        i_data_bus = {{(DATA_WIDTH>>2){4'hf}},{(DATA_WIDTH>>2){4'he}},{(DATA_WIDTH>>2){4'hd}},{(DATA_WIDTH>>2){4'hc}},{(DATA_WIDTH>>2){4'hb}},{(DATA_WIDTH>>2){4'ha}},{(DATA_WIDTH>>2){4'h9}},{(DATA_WIDTH>>2){4'h8}},{(DATA_WIDTH>>2){4'h7}},{(DATA_WIDTH>>2){4'h6}},{(DATA_WIDTH>>2){4'h5}},{(DATA_WIDTH>>2){4'h4}},{(DATA_WIDTH>>2){4'h3}},{(DATA_WIDTH>>2){4'h2}},{(DATA_WIDTH>>2){4'h1}},{(DATA_WIDTH>>2){4'h0}}};
        i_en = 1'b1;
        i_cmd = {(TOTAL_COMMAND>>1){2'b00}};

        // reg active -- Pass Through
        #30
        rst_n = 1'b1;
        i_valid = {NUM_INPUT_DATA{1'b1}};
        i_data_bus = {{(DATA_WIDTH>>2){4'hf}},{(DATA_WIDTH>>2){4'he}},{(DATA_WIDTH>>2){4'hd}},{(DATA_WIDTH>>2){4'hc}},{(DATA_WIDTH>>2){4'hb}},{(DATA_WIDTH>>2){4'ha}},{(DATA_WIDTH>>2){4'h9}},{(DATA_WIDTH>>2){4'h8}},{(DATA_WIDTH>>2){4'h7}},{(DATA_WIDTH>>2){4'h6}},{(DATA_WIDTH>>2){4'h5}},{(DATA_WIDTH>>2){4'h4}},{(DATA_WIDTH>>2){4'h3}},{(DATA_WIDTH>>2){4'h2}},{(DATA_WIDTH>>2){4'h1}},{(DATA_WIDTH>>2){4'h0}}};
        i_en = 1'b1;
        i_cmd = {(TOTAL_COMMAND>>1){2'b10}};

        // reg active -- Pass Switch
        #30
        rst_n = 1'b1;
        i_valid = {NUM_INPUT_DATA{1'b1}};
        i_data_bus = {{(DATA_WIDTH>>2){4'hf}},{(DATA_WIDTH>>2){4'he}},{(DATA_WIDTH>>2){4'hd}},{(DATA_WIDTH>>2){4'hc}},{(DATA_WIDTH>>2){4'hb}},{(DATA_WIDTH>>2){4'ha}},{(DATA_WIDTH>>2){4'h9}},{(DATA_WIDTH>>2){4'h8}},{(DATA_WIDTH>>2){4'h7}},{(DATA_WIDTH>>2){4'h6}},{(DATA_WIDTH>>2){4'h5}},{(DATA_WIDTH>>2){4'h4}},{(DATA_WIDTH>>2){4'h3}},{(DATA_WIDTH>>2){4'h2}},{(DATA_WIDTH>>2){4'h1}},{(DATA_WIDTH>>2){4'h0}}};
        i_en = 1'b1;
        i_cmd = {(TOTAL_COMMAND>>1){2'b01}};

        // disable in progress
        #30
        rst_n = 1'b1;
        i_valid = {NUM_INPUT_DATA{1'b1}};
        i_data_bus = {{(DATA_WIDTH>>2){4'hf}},{(DATA_WIDTH>>2){4'he}},{(DATA_WIDTH>>2){4'hd}},{(DATA_WIDTH>>2){4'hc}},{(DATA_WIDTH>>2){4'hb}},{(DATA_WIDTH>>2){4'ha}},{(DATA_WIDTH>>2){4'h9}},{(DATA_WIDTH>>2){4'h8}},{(DATA_WIDTH>>2){4'h7}},{(DATA_WIDTH>>2){4'h6}},{(DATA_WIDTH>>2){4'h5}},{(DATA_WIDTH>>2){4'h4}},{(DATA_WIDTH>>2){4'h3}},{(DATA_WIDTH>>2){4'h2}},{(DATA_WIDTH>>2){4'h1}},{(DATA_WIDTH>>2){4'h0}}};
        i_en = 1'b0;
        i_cmd = {(TOTAL_COMMAND>>1){2'b10}};

        // enable in progress -- Pass Through
        #30
        rst_n = 1'b1;
        i_valid = {NUM_INPUT_DATA{1'b1}};
        i_data_bus = {{(DATA_WIDTH>>2){4'hf}},{(DATA_WIDTH>>2){4'he}},{(DATA_WIDTH>>2){4'hd}},{(DATA_WIDTH>>2){4'hc}},{(DATA_WIDTH>>2){4'hb}},{(DATA_WIDTH>>2){4'ha}},{(DATA_WIDTH>>2){4'h9}},{(DATA_WIDTH>>2){4'h8}},{(DATA_WIDTH>>2){4'h7}},{(DATA_WIDTH>>2){4'h6}},{(DATA_WIDTH>>2){4'h5}},{(DATA_WIDTH>>2){4'h4}},{(DATA_WIDTH>>2){4'h3}},{(DATA_WIDTH>>2){4'h2}},{(DATA_WIDTH>>2){4'h1}},{(DATA_WIDTH>>2){4'h0}}};
        i_en = 1'b1;
        i_cmd = {(TOTAL_COMMAND>>1){2'b10}};

        // reset half way  -- Pass Swtich
        #30
        rst_n = 1'b1;
        i_valid = {NUM_INPUT_DATA{1'b1}};
        i_data_bus = {{(DATA_WIDTH>>2){4'hf}},{(DATA_WIDTH>>2){4'he}},{(DATA_WIDTH>>2){4'hd}},{(DATA_WIDTH>>2){4'hc}},{(DATA_WIDTH>>2){4'hb}},{(DATA_WIDTH>>2){4'ha}},{(DATA_WIDTH>>2){4'h9}},{(DATA_WIDTH>>2){4'h8}},{(DATA_WIDTH>>2){4'h7}},{(DATA_WIDTH>>2){4'h6}},{(DATA_WIDTH>>2){4'h5}},{(DATA_WIDTH>>2){4'h4}},{(DATA_WIDTH>>2){4'h3}},{(DATA_WIDTH>>2){4'h2}},{(DATA_WIDTH>>2){4'h1}},{(DATA_WIDTH>>2){4'h0}}};
        i_en = 1'b1;
        i_cmd = {(TOTAL_COMMAND>>1){2'b10}};

        // reg active -- No Pass
        #30
        rst_n = 1'b1;
        i_valid = {NUM_INPUT_DATA{1'b1}};
        i_data_bus = {{(DATA_WIDTH>>2){4'hf}},{(DATA_WIDTH>>2){4'he}},{(DATA_WIDTH>>2){4'hd}},{(DATA_WIDTH>>2){4'hc}},{(DATA_WIDTH>>2){4'hb}},{(DATA_WIDTH>>2){4'ha}},{(DATA_WIDTH>>2){4'h9}},{(DATA_WIDTH>>2){4'h8}},{(DATA_WIDTH>>2){4'h7}},{(DATA_WIDTH>>2){4'h6}},{(DATA_WIDTH>>2){4'h5}},{(DATA_WIDTH>>2){4'h4}},{(DATA_WIDTH>>2){4'h3}},{(DATA_WIDTH>>2){4'h2}},{(DATA_WIDTH>>2){4'h1}},{(DATA_WIDTH>>2){4'h0}}};
        i_en = 1'b1;
        i_cmd = {(TOTAL_COMMAND>>1){2'b10}};

        // change data half way  -- Pass Through
        #30
        rst_n = 1'b1;
        i_valid = {NUM_INPUT_DATA{1'b1}};
        i_data_bus = {{(DATA_WIDTH>>2){4'h7}},{(DATA_WIDTH>>2){4'h6}},{(DATA_WIDTH>>2){4'h5}},{(DATA_WIDTH>>2){4'h4}},{(DATA_WIDTH>>2){4'h3}},{(DATA_WIDTH>>2){4'h2}},{(DATA_WIDTH>>2){4'h1}},{(DATA_WIDTH>>2){4'h0}},{(DATA_WIDTH>>2){4'hf}},{(DATA_WIDTH>>2){4'he}},{(DATA_WIDTH>>2){4'hd}},{(DATA_WIDTH>>2){4'hc}},{(DATA_WIDTH>>2){4'hb}},{(DATA_WIDTH>>2){4'ha}},{(DATA_WIDTH>>2){4'h9}},{(DATA_WIDTH>>2){4'h8}}};
        i_en = 1'b1;
        i_cmd = {(TOTAL_COMMAND>>1){2'b10}};

        // invalid high output -- Pass Through
        #30
        rst_n = 1'b1;
        i_valid = {NUM_INPUT_DATA{1'b1}};
        i_data_bus = {{(DATA_WIDTH>>2){4'h7}},{(DATA_WIDTH>>2){4'h6}},{(DATA_WIDTH>>2){4'h5}},{(DATA_WIDTH>>2){4'h4}},{(DATA_WIDTH>>2){4'h3}},{(DATA_WIDTH>>2){4'h2}},{(DATA_WIDTH>>2){4'h1}},{(DATA_WIDTH>>2){4'h0}},{(DATA_WIDTH>>2){4'hf}},{(DATA_WIDTH>>2){4'he}},{(DATA_WIDTH>>2){4'hd}},{(DATA_WIDTH>>2){4'hc}},{(DATA_WIDTH>>2){4'hb}},{(DATA_WIDTH>>2){4'ha}},{(DATA_WIDTH>>2){4'h9}},{(DATA_WIDTH>>2){4'h8}}};
        i_en = 1'b1;
        i_cmd = {(TOTAL_COMMAND>>1){2'b10}};

        // invalid low output  -- Pass Through
        #30
        rst_n = 1'b1;
        i_valid = {NUM_INPUT_DATA{1'b1}};
        i_data_bus = {{(DATA_WIDTH>>2){4'h7}},{(DATA_WIDTH>>2){4'h6}},{(DATA_WIDTH>>2){4'h5}},{(DATA_WIDTH>>2){4'h4}},{(DATA_WIDTH>>2){4'h3}},{(DATA_WIDTH>>2){4'h2}},{(DATA_WIDTH>>2){4'h1}},{(DATA_WIDTH>>2){4'h0}},{(DATA_WIDTH>>2){4'hf}},{(DATA_WIDTH>>2){4'he}},{(DATA_WIDTH>>2){4'hd}},{(DATA_WIDTH>>2){4'hc}},{(DATA_WIDTH>>2){4'hb}},{(DATA_WIDTH>>2){4'ha}},{(DATA_WIDTH>>2){4'h9}},{(DATA_WIDTH>>2){4'h8}}};
        i_en = 1'b1;
        i_cmd = {(TOTAL_COMMAND>>1){2'b10}};
        #30
        $stop;
    end

    // instantiate DUT (device under test)
    flatten_benes_simple_seq #(
        .DATA_WIDTH(DATA_WIDTH),
        .COMMAND_WIDTH(COMMAND_WIDTH),
        .NUM_INPUT_DATA(NUM_INPUT_DATA)
      ) dut(
        .clk(clk),
        .rst_n(rst_n),
        .i_valid(i_valid),
        .i_data_bus(i_data_bus),
        .o_valid(o_valid),
        .o_data_bus(o_data_bus),
        .i_en(i_en),
        .i_cmd(i_cmd)
    );

    always#5 clk=~clk;
endmodule

`endif



`ifdef TEST_32_INPUT_FLATTEN_BENES
module tb_flatten_benes_simple_seq();
    parameter DATA_WIDTH = 4;
    parameter COMMAND_WIDTH  = 2;
    parameter NUM_INPUT_DATA = 32;

    //parameter
    localparam NUM_SWITCH_IN = NUM_INPUT_DATA >> 1;
    localparam LEVEL = $clog2(NUM_SWITCH_IN);
    localparam TOTAL_STAGE = 2*LEVEL+1;

    localparam TOTAL_COMMAND = TOTAL_STAGE*NUM_SWITCH_IN*COMMAND_WIDTH;

    localparam WIDTH_INPUT_DATA = NUM_INPUT_DATA*DATA_WIDTH;

    // interface
    reg                                        clk;
    reg                                        rst_n;

    reg  [NUM_INPUT_DATA-1:0]                  i_valid;
    reg  [WIDTH_INPUT_DATA-1:0]                i_data_bus;

    wire [NUM_INPUT_DATA-1:0]                  o_valid;
    wire [WIDTH_INPUT_DATA-1:0]                o_data_bus; //{o_data_a, o_data_b}

    reg                                        i_en;
    reg  [TOTAL_COMMAND-1:0]                  i_cmd;
                                    // 11 --> Multicast_HighIn
                                    // 00 --> Multicast_LowIn
                                    // 10 --> Pass Through
                                    // 01 --> Pass Switch

    // Test case declaration
    // all cases for control
    initial
    begin
        clk = 1'b0;
        // not enable at start
        #30
        rst_n = 1'b1;
        i_valid = {NUM_INPUT_DATA{1'b1}};
        i_data_bus = {{(DATA_WIDTH>>2){4'hf}},{(DATA_WIDTH>>2){4'he}},{(DATA_WIDTH>>2){4'hd}},{(DATA_WIDTH>>2){4'hc}},{(DATA_WIDTH>>2){4'hb}},{(DATA_WIDTH>>2){4'ha}},{(DATA_WIDTH>>2){4'h9}},{(DATA_WIDTH>>2){4'h8}},{(DATA_WIDTH>>2){4'h7}},{(DATA_WIDTH>>2){4'h6}},{(DATA_WIDTH>>2){4'h5}},{(DATA_WIDTH>>2){4'h4}},{(DATA_WIDTH>>2){4'h3}},{(DATA_WIDTH>>2){4'h2}},{(DATA_WIDTH>>2){4'h1}},{(DATA_WIDTH>>2){4'h0}},{(DATA_WIDTH>>2){4'hf}},{(DATA_WIDTH>>2){4'he}},{(DATA_WIDTH>>2){4'hd}},{(DATA_WIDTH>>2){4'hc}},{(DATA_WIDTH>>2){4'hb}},{(DATA_WIDTH>>2){4'ha}},{(DATA_WIDTH>>2){4'h9}},{(DATA_WIDTH>>2){4'h8}},{(DATA_WIDTH>>2){4'h7}},{(DATA_WIDTH>>2){4'h6}},{(DATA_WIDTH>>2){4'h5}},{(DATA_WIDTH>>2){4'h4}},{(DATA_WIDTH>>2){4'h3}},{(DATA_WIDTH>>2){4'h2}},{(DATA_WIDTH>>2){4'h1}},{(DATA_WIDTH>>2){4'h0}}};
        i_en = 1'b1;
        i_cmd = {(TOTAL_COMMAND>>1){2'b10}};

        // rst_n active;
        #30
        rst_n = 1'b0;
        i_valid = {NUM_INPUT_DATA{1'b1}};
        i_data_bus = {{(DATA_WIDTH>>2){4'hf}},{(DATA_WIDTH>>2){4'he}},{(DATA_WIDTH>>2){4'hd}},{(DATA_WIDTH>>2){4'hc}},{(DATA_WIDTH>>2){4'hb}},{(DATA_WIDTH>>2){4'ha}},{(DATA_WIDTH>>2){4'h9}},{(DATA_WIDTH>>2){4'h8}},{(DATA_WIDTH>>2){4'h7}},{(DATA_WIDTH>>2){4'h6}},{(DATA_WIDTH>>2){4'h5}},{(DATA_WIDTH>>2){4'h4}},{(DATA_WIDTH>>2){4'h3}},{(DATA_WIDTH>>2){4'h2}},{(DATA_WIDTH>>2){4'h1}},{(DATA_WIDTH>>2){4'h0}},{(DATA_WIDTH>>2){4'hf}},{(DATA_WIDTH>>2){4'he}},{(DATA_WIDTH>>2){4'hd}},{(DATA_WIDTH>>2){4'hc}},{(DATA_WIDTH>>2){4'hb}},{(DATA_WIDTH>>2){4'ha}},{(DATA_WIDTH>>2){4'h9}},{(DATA_WIDTH>>2){4'h8}},{(DATA_WIDTH>>2){4'h7}},{(DATA_WIDTH>>2){4'h6}},{(DATA_WIDTH>>2){4'h5}},{(DATA_WIDTH>>2){4'h4}},{(DATA_WIDTH>>2){4'h3}},{(DATA_WIDTH>>2){4'h2}},{(DATA_WIDTH>>2){4'h1}},{(DATA_WIDTH>>2){4'h0}}};
        i_en = 1'b1;
        i_cmd = {(TOTAL_COMMAND>>1){2'b00}};

        // reg active -- Multicast_HighIn
        #30
        rst_n = 1'b1;
        i_valid = {NUM_INPUT_DATA{1'b1}};
        i_data_bus = {{(DATA_WIDTH>>2){4'hf}},{(DATA_WIDTH>>2){4'he}},{(DATA_WIDTH>>2){4'hd}},{(DATA_WIDTH>>2){4'hc}},{(DATA_WIDTH>>2){4'hb}},{(DATA_WIDTH>>2){4'ha}},{(DATA_WIDTH>>2){4'h9}},{(DATA_WIDTH>>2){4'h8}},{(DATA_WIDTH>>2){4'h7}},{(DATA_WIDTH>>2){4'h6}},{(DATA_WIDTH>>2){4'h5}},{(DATA_WIDTH>>2){4'h4}},{(DATA_WIDTH>>2){4'h3}},{(DATA_WIDTH>>2){4'h2}},{(DATA_WIDTH>>2){4'h1}},{(DATA_WIDTH>>2){4'h0}},{(DATA_WIDTH>>2){4'hf}},{(DATA_WIDTH>>2){4'he}},{(DATA_WIDTH>>2){4'hd}},{(DATA_WIDTH>>2){4'hc}},{(DATA_WIDTH>>2){4'hb}},{(DATA_WIDTH>>2){4'ha}},{(DATA_WIDTH>>2){4'h9}},{(DATA_WIDTH>>2){4'h8}},{(DATA_WIDTH>>2){4'h7}},{(DATA_WIDTH>>2){4'h6}},{(DATA_WIDTH>>2){4'h5}},{(DATA_WIDTH>>2){4'h4}},{(DATA_WIDTH>>2){4'h3}},{(DATA_WIDTH>>2){4'h2}},{(DATA_WIDTH>>2){4'h1}},{(DATA_WIDTH>>2){4'h0}}};
        i_en = 1'b1;
        i_cmd = {(TOTAL_COMMAND>>1){2'b11}};

        // reg active -- Multicast_LowIn
        #30
        rst_n = 1'b1;
        i_valid = {NUM_INPUT_DATA{1'b1}};
        i_data_bus = {{(DATA_WIDTH>>2){4'hf}},{(DATA_WIDTH>>2){4'he}},{(DATA_WIDTH>>2){4'hd}},{(DATA_WIDTH>>2){4'hc}},{(DATA_WIDTH>>2){4'hb}},{(DATA_WIDTH>>2){4'ha}},{(DATA_WIDTH>>2){4'h9}},{(DATA_WIDTH>>2){4'h8}},{(DATA_WIDTH>>2){4'h7}},{(DATA_WIDTH>>2){4'h6}},{(DATA_WIDTH>>2){4'h5}},{(DATA_WIDTH>>2){4'h4}},{(DATA_WIDTH>>2){4'h3}},{(DATA_WIDTH>>2){4'h2}},{(DATA_WIDTH>>2){4'h1}},{(DATA_WIDTH>>2){4'h0}},{(DATA_WIDTH>>2){4'hf}},{(DATA_WIDTH>>2){4'he}},{(DATA_WIDTH>>2){4'hd}},{(DATA_WIDTH>>2){4'hc}},{(DATA_WIDTH>>2){4'hb}},{(DATA_WIDTH>>2){4'ha}},{(DATA_WIDTH>>2){4'h9}},{(DATA_WIDTH>>2){4'h8}},{(DATA_WIDTH>>2){4'h7}},{(DATA_WIDTH>>2){4'h6}},{(DATA_WIDTH>>2){4'h5}},{(DATA_WIDTH>>2){4'h4}},{(DATA_WIDTH>>2){4'h3}},{(DATA_WIDTH>>2){4'h2}},{(DATA_WIDTH>>2){4'h1}},{(DATA_WIDTH>>2){4'h0}}};
        i_en = 1'b1;
        i_cmd = {(TOTAL_COMMAND>>1){2'b00}};

        // reg active -- Pass Through
        #30
        rst_n = 1'b1;
        i_valid = {NUM_INPUT_DATA{1'b1}};
        i_data_bus = {{(DATA_WIDTH>>2){4'hf}},{(DATA_WIDTH>>2){4'he}},{(DATA_WIDTH>>2){4'hd}},{(DATA_WIDTH>>2){4'hc}},{(DATA_WIDTH>>2){4'hb}},{(DATA_WIDTH>>2){4'ha}},{(DATA_WIDTH>>2){4'h9}},{(DATA_WIDTH>>2){4'h8}},{(DATA_WIDTH>>2){4'h7}},{(DATA_WIDTH>>2){4'h6}},{(DATA_WIDTH>>2){4'h5}},{(DATA_WIDTH>>2){4'h4}},{(DATA_WIDTH>>2){4'h3}},{(DATA_WIDTH>>2){4'h2}},{(DATA_WIDTH>>2){4'h1}},{(DATA_WIDTH>>2){4'h0}},{(DATA_WIDTH>>2){4'hf}},{(DATA_WIDTH>>2){4'he}},{(DATA_WIDTH>>2){4'hd}},{(DATA_WIDTH>>2){4'hc}},{(DATA_WIDTH>>2){4'hb}},{(DATA_WIDTH>>2){4'ha}},{(DATA_WIDTH>>2){4'h9}},{(DATA_WIDTH>>2){4'h8}},{(DATA_WIDTH>>2){4'h7}},{(DATA_WIDTH>>2){4'h6}},{(DATA_WIDTH>>2){4'h5}},{(DATA_WIDTH>>2){4'h4}},{(DATA_WIDTH>>2){4'h3}},{(DATA_WIDTH>>2){4'h2}},{(DATA_WIDTH>>2){4'h1}},{(DATA_WIDTH>>2){4'h0}}};
        i_en = 1'b1;
        i_cmd = {(TOTAL_COMMAND>>1){2'b10}};

        // reg active -- Pass Switch
        #30
        rst_n = 1'b1;
        i_valid = {NUM_INPUT_DATA{1'b1}};
        i_data_bus = {{(DATA_WIDTH>>2){4'hf}},{(DATA_WIDTH>>2){4'he}},{(DATA_WIDTH>>2){4'hd}},{(DATA_WIDTH>>2){4'hc}},{(DATA_WIDTH>>2){4'hb}},{(DATA_WIDTH>>2){4'ha}},{(DATA_WIDTH>>2){4'h9}},{(DATA_WIDTH>>2){4'h8}},{(DATA_WIDTH>>2){4'h7}},{(DATA_WIDTH>>2){4'h6}},{(DATA_WIDTH>>2){4'h5}},{(DATA_WIDTH>>2){4'h4}},{(DATA_WIDTH>>2){4'h3}},{(DATA_WIDTH>>2){4'h2}},{(DATA_WIDTH>>2){4'h1}},{(DATA_WIDTH>>2){4'h0}},{(DATA_WIDTH>>2){4'hf}},{(DATA_WIDTH>>2){4'he}},{(DATA_WIDTH>>2){4'hd}},{(DATA_WIDTH>>2){4'hc}},{(DATA_WIDTH>>2){4'hb}},{(DATA_WIDTH>>2){4'ha}},{(DATA_WIDTH>>2){4'h9}},{(DATA_WIDTH>>2){4'h8}},{(DATA_WIDTH>>2){4'h7}},{(DATA_WIDTH>>2){4'h6}},{(DATA_WIDTH>>2){4'h5}},{(DATA_WIDTH>>2){4'h4}},{(DATA_WIDTH>>2){4'h3}},{(DATA_WIDTH>>2){4'h2}},{(DATA_WIDTH>>2){4'h1}},{(DATA_WIDTH>>2){4'h0}}};
        i_en = 1'b1;
        i_cmd = {(TOTAL_COMMAND>>1){2'b01}};

        // disable in progress
        #30
        rst_n = 1'b1;
        i_valid = {NUM_INPUT_DATA{1'b1}};
        i_data_bus = {{(DATA_WIDTH>>2){4'hf}},{(DATA_WIDTH>>2){4'he}},{(DATA_WIDTH>>2){4'hd}},{(DATA_WIDTH>>2){4'hc}},{(DATA_WIDTH>>2){4'hb}},{(DATA_WIDTH>>2){4'ha}},{(DATA_WIDTH>>2){4'h9}},{(DATA_WIDTH>>2){4'h8}},{(DATA_WIDTH>>2){4'h7}},{(DATA_WIDTH>>2){4'h6}},{(DATA_WIDTH>>2){4'h5}},{(DATA_WIDTH>>2){4'h4}},{(DATA_WIDTH>>2){4'h3}},{(DATA_WIDTH>>2){4'h2}},{(DATA_WIDTH>>2){4'h1}},{(DATA_WIDTH>>2){4'h0}},{(DATA_WIDTH>>2){4'hf}},{(DATA_WIDTH>>2){4'he}},{(DATA_WIDTH>>2){4'hd}},{(DATA_WIDTH>>2){4'hc}},{(DATA_WIDTH>>2){4'hb}},{(DATA_WIDTH>>2){4'ha}},{(DATA_WIDTH>>2){4'h9}},{(DATA_WIDTH>>2){4'h8}},{(DATA_WIDTH>>2){4'h7}},{(DATA_WIDTH>>2){4'h6}},{(DATA_WIDTH>>2){4'h5}},{(DATA_WIDTH>>2){4'h4}},{(DATA_WIDTH>>2){4'h3}},{(DATA_WIDTH>>2){4'h2}},{(DATA_WIDTH>>2){4'h1}},{(DATA_WIDTH>>2){4'h0}}};
        i_en = 1'b0;
        i_cmd = {(TOTAL_COMMAND>>1){2'b10}};

        // enable in progress -- Pass Through
        #30
        rst_n = 1'b1;
        i_valid = {NUM_INPUT_DATA{1'b1}};
        i_data_bus = {{(DATA_WIDTH>>2){4'hf}},{(DATA_WIDTH>>2){4'he}},{(DATA_WIDTH>>2){4'hd}},{(DATA_WIDTH>>2){4'hc}},{(DATA_WIDTH>>2){4'hb}},{(DATA_WIDTH>>2){4'ha}},{(DATA_WIDTH>>2){4'h9}},{(DATA_WIDTH>>2){4'h8}},{(DATA_WIDTH>>2){4'h7}},{(DATA_WIDTH>>2){4'h6}},{(DATA_WIDTH>>2){4'h5}},{(DATA_WIDTH>>2){4'h4}},{(DATA_WIDTH>>2){4'h3}},{(DATA_WIDTH>>2){4'h2}},{(DATA_WIDTH>>2){4'h1}},{(DATA_WIDTH>>2){4'h0}},{(DATA_WIDTH>>2){4'hf}},{(DATA_WIDTH>>2){4'he}},{(DATA_WIDTH>>2){4'hd}},{(DATA_WIDTH>>2){4'hc}},{(DATA_WIDTH>>2){4'hb}},{(DATA_WIDTH>>2){4'ha}},{(DATA_WIDTH>>2){4'h9}},{(DATA_WIDTH>>2){4'h8}},{(DATA_WIDTH>>2){4'h7}},{(DATA_WIDTH>>2){4'h6}},{(DATA_WIDTH>>2){4'h5}},{(DATA_WIDTH>>2){4'h4}},{(DATA_WIDTH>>2){4'h3}},{(DATA_WIDTH>>2){4'h2}},{(DATA_WIDTH>>2){4'h1}},{(DATA_WIDTH>>2){4'h0}}};
        i_en = 1'b1;
        i_cmd = {(TOTAL_COMMAND>>1){2'b10}};

        // reset half way  -- Pass Swtich
        #30
        rst_n = 1'b1;
        i_valid = {NUM_INPUT_DATA{1'b1}};
        i_data_bus = {{(DATA_WIDTH>>2){4'hf}},{(DATA_WIDTH>>2){4'he}},{(DATA_WIDTH>>2){4'hd}},{(DATA_WIDTH>>2){4'hc}},{(DATA_WIDTH>>2){4'hb}},{(DATA_WIDTH>>2){4'ha}},{(DATA_WIDTH>>2){4'h9}},{(DATA_WIDTH>>2){4'h8}},{(DATA_WIDTH>>2){4'h7}},{(DATA_WIDTH>>2){4'h6}},{(DATA_WIDTH>>2){4'h5}},{(DATA_WIDTH>>2){4'h4}},{(DATA_WIDTH>>2){4'h3}},{(DATA_WIDTH>>2){4'h2}},{(DATA_WIDTH>>2){4'h1}},{(DATA_WIDTH>>2){4'h0}},{(DATA_WIDTH>>2){4'hf}},{(DATA_WIDTH>>2){4'he}},{(DATA_WIDTH>>2){4'hd}},{(DATA_WIDTH>>2){4'hc}},{(DATA_WIDTH>>2){4'hb}},{(DATA_WIDTH>>2){4'ha}},{(DATA_WIDTH>>2){4'h9}},{(DATA_WIDTH>>2){4'h8}},{(DATA_WIDTH>>2){4'h7}},{(DATA_WIDTH>>2){4'h6}},{(DATA_WIDTH>>2){4'h5}},{(DATA_WIDTH>>2){4'h4}},{(DATA_WIDTH>>2){4'h3}},{(DATA_WIDTH>>2){4'h2}},{(DATA_WIDTH>>2){4'h1}},{(DATA_WIDTH>>2){4'h0}}};
        i_en = 1'b1;
        i_cmd = {(TOTAL_COMMAND>>1){2'b10}};

        // reg active -- No Pass
        #30
        rst_n = 1'b1;
        i_valid = {NUM_INPUT_DATA{1'b1}};
        i_data_bus = {{(DATA_WIDTH>>2){4'hf}},{(DATA_WIDTH>>2){4'he}},{(DATA_WIDTH>>2){4'hd}},{(DATA_WIDTH>>2){4'hc}},{(DATA_WIDTH>>2){4'hb}},{(DATA_WIDTH>>2){4'ha}},{(DATA_WIDTH>>2){4'h9}},{(DATA_WIDTH>>2){4'h8}},{(DATA_WIDTH>>2){4'h7}},{(DATA_WIDTH>>2){4'h6}},{(DATA_WIDTH>>2){4'h5}},{(DATA_WIDTH>>2){4'h4}},{(DATA_WIDTH>>2){4'h3}},{(DATA_WIDTH>>2){4'h2}},{(DATA_WIDTH>>2){4'h1}},{(DATA_WIDTH>>2){4'h0}},{(DATA_WIDTH>>2){4'hf}},{(DATA_WIDTH>>2){4'he}},{(DATA_WIDTH>>2){4'hd}},{(DATA_WIDTH>>2){4'hc}},{(DATA_WIDTH>>2){4'hb}},{(DATA_WIDTH>>2){4'ha}},{(DATA_WIDTH>>2){4'h9}},{(DATA_WIDTH>>2){4'h8}},{(DATA_WIDTH>>2){4'h7}},{(DATA_WIDTH>>2){4'h6}},{(DATA_WIDTH>>2){4'h5}},{(DATA_WIDTH>>2){4'h4}},{(DATA_WIDTH>>2){4'h3}},{(DATA_WIDTH>>2){4'h2}},{(DATA_WIDTH>>2){4'h1}},{(DATA_WIDTH>>2){4'h0}}};
        i_en = 1'b1;
        i_cmd = {(TOTAL_COMMAND>>1){2'b10}};

        // change data half way  -- Pass Through
        #30
        rst_n = 1'b1;
        i_valid = {NUM_INPUT_DATA{1'b1}};
        i_data_bus = {{(DATA_WIDTH>>2){4'h7}},{(DATA_WIDTH>>2){4'h6}},{(DATA_WIDTH>>2){4'h5}},{(DATA_WIDTH>>2){4'h4}},{(DATA_WIDTH>>2){4'h3}},{(DATA_WIDTH>>2){4'h2}},{(DATA_WIDTH>>2){4'h1}},{(DATA_WIDTH>>2){4'h0}},{(DATA_WIDTH>>2){4'hf}},{(DATA_WIDTH>>2){4'he}},{(DATA_WIDTH>>2){4'hd}},{(DATA_WIDTH>>2){4'hc}},{(DATA_WIDTH>>2){4'hb}},{(DATA_WIDTH>>2){4'ha}},{(DATA_WIDTH>>2){4'h9}},{(DATA_WIDTH>>2){4'h8}}};
        i_en = 1'b1;
        i_cmd = {(TOTAL_COMMAND>>1){2'b10}};

        // invalid high output -- Pass Through
        #30
        rst_n = 1'b1;
        i_valid = {NUM_INPUT_DATA{1'b1}};
        i_data_bus = {{(DATA_WIDTH>>2){4'h7}},{(DATA_WIDTH>>2){4'h6}},{(DATA_WIDTH>>2){4'h5}},{(DATA_WIDTH>>2){4'h4}},{(DATA_WIDTH>>2){4'h3}},{(DATA_WIDTH>>2){4'h2}},{(DATA_WIDTH>>2){4'h1}},{(DATA_WIDTH>>2){4'h0}},{(DATA_WIDTH>>2){4'hf}},{(DATA_WIDTH>>2){4'he}},{(DATA_WIDTH>>2){4'hd}},{(DATA_WIDTH>>2){4'hc}},{(DATA_WIDTH>>2){4'hb}},{(DATA_WIDTH>>2){4'ha}},{(DATA_WIDTH>>2){4'h9}},{(DATA_WIDTH>>2){4'h8}}};
        i_en = 1'b1;
        i_cmd = {(TOTAL_COMMAND>>1){2'b10}};

        // invalid low output  -- Pass Through
        #30
        rst_n = 1'b1;
        i_valid = {NUM_INPUT_DATA{1'b1}};
        i_data_bus = {{(DATA_WIDTH>>2){4'h7}},{(DATA_WIDTH>>2){4'h6}},{(DATA_WIDTH>>2){4'h5}},{(DATA_WIDTH>>2){4'h4}},{(DATA_WIDTH>>2){4'h3}},{(DATA_WIDTH>>2){4'h2}},{(DATA_WIDTH>>2){4'h1}},{(DATA_WIDTH>>2){4'h0}},{(DATA_WIDTH>>2){4'hf}},{(DATA_WIDTH>>2){4'he}},{(DATA_WIDTH>>2){4'hd}},{(DATA_WIDTH>>2){4'hc}},{(DATA_WIDTH>>2){4'hb}},{(DATA_WIDTH>>2){4'ha}},{(DATA_WIDTH>>2){4'h9}},{(DATA_WIDTH>>2){4'h8}}};
        i_en = 1'b1;
        i_cmd = {(TOTAL_COMMAND>>1){2'b10}};
        #30
        $stop;
    end

    // instantiate DUT (device under test)
    flatten_benes_simple_seq #(
        .DATA_WIDTH(DATA_WIDTH),
        .COMMAND_WIDTH(COMMAND_WIDTH),
        .NUM_INPUT_DATA(NUM_INPUT_DATA)
      ) dut(
        .clk(clk),
        .rst_n(rst_n),
        .i_valid(i_valid),
        .i_data_bus(i_data_bus),
        .o_valid(o_valid),
        .o_data_bus(o_data_bus),
        .i_en(i_en),
        .i_cmd(i_cmd)
    );

    always#5 clk=~clk;

endmodule

`endif