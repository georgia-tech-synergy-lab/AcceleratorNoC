`timescale 1ns / 1ps
/*
    Top Module:  tb_benes_simple_seq
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
                                         ID:       0    X        4     X      8     X      12      X     16
        i_data_bus[2*DATA_WIDTH+:DATA_WIDTH]  -->|¯¯¯|-/ \/--->|¯¯¯|--/ \-->|¯¯¯|--/ \-->|¯¯¯|---\/ \->|¯¯¯|-->
        i_data_bus[3*DATA_WIDTH+:DATA_WIDTH]  -->|___|-\ /\ /->|___|------->|___|------->|___|-\ /\ /->|___|-->
                                         ID:       1    X  X     5            9            13   X  X     17
        i_data_bus[4*DATA_WIDTH+:DATA_WIDTH]  -->|¯¯¯|-/ \/ \->|¯¯¯|------->|¯¯¯|------->|¯¯¯|-/ \/ \->|¯¯¯|-->
        i_data_bus[5*DATA_WIDTH+:DATA_WIDTH]  -->|___|-\ /\--->|___|--\ /-->|___|--\ /-->|___|---/\ /->|___|-->
                                         ID:       2    X        6     X      10    X      14      X     18
        i_data_bus[6*DATA_WIDTH+:DATA_WIDTH]  -->|¯¯¯|-/ \---->|¯¯¯|--/ \-->|¯¯¯|--/ \-->|¯¯¯|----/ \->|¯¯¯|-->
        i_data_bus[7*DATA_WIDTH+:DATA_WIDTH]  -->|___|-------->|___|------->|___|------->|___|-------->|___|-->
                                         ID:       3             7            11           15            19
           CONNECTION FUNCTION                   INVERSE SHUFFLE      ,,         SHUFFLE       SHUFFLE
          CONNECTION GROUP SIZE                         8             4             4             8


    Control Signal
        i_valid[0]-->|¯¯¯|<--i_cmd[2:0]
        i_valid[1]-->|___|

     The command lay out is shown below: Note: switch ID is specified in the diagram above.

     i_cmd: MSB [ ------------------------------------------------------------------------------------- ] LSB
      cmd for   SW19 SW18 SW17 SW16 SW15 SW14 SW13 SW12 SW11 SW10 SW9 SW8 SW7 SW6 SW5 SW4 SW3 SW2 SW1 SW0

    Author:      Jianming Tong (jianming.tong@gatech.edu)
*/

// design the following testbench for 2^n inputs. n could be any integer.
// `define TEST_4_INPUT_BENES
// `define TEST_8_INPUT_BENES  //change #30 into #20
`define TEST_16_INPUT_BENES //change #30 into #40
// `define TEST_32_INPUT_BENES //change #30 into #80
// `define TEST_16_INPUT_BENES_PRE_INTEGRATION //change #30 into #40


`ifdef TEST_4_INPUT_BENES
module tb_benes_simple_seq();
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
    benes_simple_seq #(
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

`ifdef TEST_8_INPUT_BENES
module tb_benes_simple_seq();
    parameter DATA_WIDTH = 4;
    parameter COMMAND_WIDTH  = 2;
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
        i_cmd = {(TOTAL_COMMAND>>1){2'b10}};

        // rst_n active;
        #30
        rst_n = 1'b0;
        i_valid = {NUM_INPUT_DATA{1'b1}};
        i_data_bus = {{(DATA_WIDTH>>2){4'h7}},{(DATA_WIDTH>>2){4'h6}},{(DATA_WIDTH>>2){4'h5}},{(DATA_WIDTH>>2){4'h4}},{(DATA_WIDTH>>2){4'h3}},{(DATA_WIDTH>>2){4'h2}},{(DATA_WIDTH>>2){4'h1}},{(DATA_WIDTH>>2){4'h0}}};
        i_en = 1'b1;
        i_cmd = {(TOTAL_COMMAND>>1){2'b00}};

        // reg active -- Multicast_HighIn
        #30
        rst_n = 1'b1;
        i_valid = {NUM_INPUT_DATA{1'b1}};
        i_data_bus = {{(DATA_WIDTH>>2){4'h7}},{(DATA_WIDTH>>2){4'h6}},{(DATA_WIDTH>>2){4'h5}},{(DATA_WIDTH>>2){4'h4}},{(DATA_WIDTH>>2){4'h3}},{(DATA_WIDTH>>2){4'h2}},{(DATA_WIDTH>>2){4'h1}},{(DATA_WIDTH>>2){4'h0}}};
        i_en = 1'b1;
        i_cmd = {(TOTAL_COMMAND>>1){2'b11}};

        // reg active -- Multicast_LowIn
        #30
        rst_n = 1'b1;
        i_valid = {NUM_INPUT_DATA{1'b1}};
        i_data_bus = {{(DATA_WIDTH>>2){4'h7}},{(DATA_WIDTH>>2){4'h6}},{(DATA_WIDTH>>2){4'h5}},{(DATA_WIDTH>>2){4'h4}},{(DATA_WIDTH>>2){4'h3}},{(DATA_WIDTH>>2){4'h2}},{(DATA_WIDTH>>2){4'h1}},{(DATA_WIDTH>>2){4'h0}}};
        i_en = 1'b1;
        i_cmd = {(TOTAL_COMMAND>>1){2'b00}};

        // reg active -- Pass Through
        #30
        rst_n = 1'b1;
        i_valid = {NUM_INPUT_DATA{1'b1}};
        i_data_bus = {{(DATA_WIDTH>>2){4'h7}},{(DATA_WIDTH>>2){4'h6}},{(DATA_WIDTH>>2){4'h5}},{(DATA_WIDTH>>2){4'h4}},{(DATA_WIDTH>>2){4'h3}},{(DATA_WIDTH>>2){4'h2}},{(DATA_WIDTH>>2){4'h1}},{(DATA_WIDTH>>2){4'h0}}};
        i_en = 1'b1;
        i_cmd = {(TOTAL_COMMAND>>1){2'b10}};

        // reg active -- Pass Switch
        #30
        rst_n = 1'b1;
        i_valid = {NUM_INPUT_DATA{1'b1}};
        i_data_bus = {{(DATA_WIDTH>>2){4'h7}},{(DATA_WIDTH>>2){4'h6}},{(DATA_WIDTH>>2){4'h5}},{(DATA_WIDTH>>2){4'h4}},{(DATA_WIDTH>>2){4'h3}},{(DATA_WIDTH>>2){4'h2}},{(DATA_WIDTH>>2){4'h1}},{(DATA_WIDTH>>2){4'h0}}};
        i_en = 1'b1;
        i_cmd = {(TOTAL_COMMAND>>1){2'b01}};

        // disable in progress
        #30
        rst_n = 1'b1;
        i_valid = {NUM_INPUT_DATA{1'b1}};
        i_data_bus = {{(DATA_WIDTH>>2){4'h7}},{(DATA_WIDTH>>2){4'h6}},{(DATA_WIDTH>>2){4'h5}},{(DATA_WIDTH>>2){4'h4}},{(DATA_WIDTH>>2){4'h3}},{(DATA_WIDTH>>2){4'h2}},{(DATA_WIDTH>>2){4'h1}},{(DATA_WIDTH>>2){4'h0}}};
        i_en = 1'b0;
        i_cmd = {(TOTAL_COMMAND>>1){2'b10}};

        // enable in progress -- Pass Through
        #30
        rst_n = 1'b1;
        i_valid = {NUM_INPUT_DATA{1'b1}};
        i_data_bus = {{(DATA_WIDTH>>2){4'h7}},{(DATA_WIDTH>>2){4'h6}},{(DATA_WIDTH>>2){4'h5}},{(DATA_WIDTH>>2){4'h4}},{(DATA_WIDTH>>2){4'h3}},{(DATA_WIDTH>>2){4'h2}},{(DATA_WIDTH>>2){4'h1}},{(DATA_WIDTH>>2){4'h0}}};
        i_en = 1'b1;
        i_cmd = {(TOTAL_COMMAND>>1){2'b10}};

        // reset half way  -- Pass Swtich
        #30
        rst_n = 1'b1;
        i_valid = {NUM_INPUT_DATA{1'b1}};
        i_data_bus = {{(DATA_WIDTH>>2){4'h7}},{(DATA_WIDTH>>2){4'h6}},{(DATA_WIDTH>>2){4'h5}},{(DATA_WIDTH>>2){4'h4}},{(DATA_WIDTH>>2){4'h3}},{(DATA_WIDTH>>2){4'h2}},{(DATA_WIDTH>>2){4'h1}},{(DATA_WIDTH>>2){4'h0}}};
        i_en = 1'b1;
        i_cmd = {(TOTAL_COMMAND>>1){2'b10}};

        // reg active -- No Pass
        #30
        rst_n = 1'b1;
        i_valid = {NUM_INPUT_DATA{1'b1}};
        i_data_bus = {{(DATA_WIDTH>>2){4'h7}},{(DATA_WIDTH>>2){4'h6}},{(DATA_WIDTH>>2){4'h5}},{(DATA_WIDTH>>2){4'h4}},{(DATA_WIDTH>>2){4'h3}},{(DATA_WIDTH>>2){4'h2}},{(DATA_WIDTH>>2){4'h1}},{(DATA_WIDTH>>2){4'h0}}};
        i_en = 1'b1;
        i_cmd = {(TOTAL_COMMAND>>1){2'b10}};

        // change data half way  -- Pass Through
        #30
        rst_n = 1'b1;
        i_valid = {NUM_INPUT_DATA{1'b1}};
        i_data_bus = {{(DATA_WIDTH>>2){4'hf}},{(DATA_WIDTH>>2){4'he}},{(DATA_WIDTH>>2){4'hd}},{(DATA_WIDTH>>2){4'hc}},{(DATA_WIDTH>>2){4'hb}},{(DATA_WIDTH>>2){4'ha}},{(DATA_WIDTH>>2){4'h9}},{(DATA_WIDTH>>2){4'h8}}};
        i_en = 1'b1;
        i_cmd = {(TOTAL_COMMAND>>1){2'b10}};

        // invalid high output -- Pass Through
        #30
        rst_n = 1'b1;
        i_valid = {NUM_INPUT_DATA{1'b1}};
        i_data_bus = {{(DATA_WIDTH>>2){4'hf}},{(DATA_WIDTH>>2){4'he}},{(DATA_WIDTH>>2){4'hd}},{(DATA_WIDTH>>2){4'hc}},{(DATA_WIDTH>>2){4'hb}},{(DATA_WIDTH>>2){4'ha}},{(DATA_WIDTH>>2){4'h9}},{(DATA_WIDTH>>2){4'h8}}};
        i_en = 1'b1;
        i_cmd = {(TOTAL_COMMAND>>1){2'b10}};

        // invalid low output  -- Pass Through
        #30
        rst_n = 1'b1;
        i_valid = {NUM_INPUT_DATA{1'b1}};
        i_data_bus = {{(DATA_WIDTH>>2){4'hf}},{(DATA_WIDTH>>2){4'he}},{(DATA_WIDTH>>2){4'hd}},{(DATA_WIDTH>>2){4'hc}},{(DATA_WIDTH>>2){4'hb}},{(DATA_WIDTH>>2){4'ha}},{(DATA_WIDTH>>2){4'h9}},{(DATA_WIDTH>>2){4'h8}}};
        i_en = 1'b1;
        i_cmd = {(TOTAL_COMMAND>>1){2'b10}};
        #30
        $stop;
    end

    // instantiate DUT (device under test)
    benes_simple_seq #(
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



`ifdef TEST_16_INPUT_BENES
module tb_benes_simple_seq();
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
    benes_simple_seq #(
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


`ifdef TEST_16_INPUT_BENES_PRE_INTEGRATION
// this testbench is used to test the functionality of integrating BENES network together with 1D Multipliers
// DATA_WIDTH = 8
// Num PE = 16
// Each PE takes   4 + $clog2(DATA_WIDTH) + 1 = 8 bits (configuration)
module tb_benes_simple_seq();
    parameter DATA_WIDTH = 8;
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
    reg  [TOTAL_COMMAND-1:0]                   i_cmd;

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
    benes_simple_seq #(
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

`ifdef TEST_32_INPUT_BENES
module tb_benes_simple_seq();
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
    benes_simple_seq #(
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