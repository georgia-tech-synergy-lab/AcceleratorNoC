`timescale 1ns / 1ps
/*
    Top Module:  tb_benes_simple_cmd_flow_seq
    Data:        Only data width matters.
    Format:      keeping the reg format unchange
    Timing:      Sequential Logic
    Reset:       Synchronized Reset [High Reset]
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

                         2) for Configuration transmission
                 Note: (1) configurtion also traverse the BENES network to keep pace with data.
                       (2) This is for pre-generated configuration that are generated offline and used online,
                       (3) The o_cmd is for other design which is also configured in the cmd_flow manner.

              COMMAND_WIDTH is the command length for a single switch.
              ROW_COMMAND_WIDTH is specified by the input
              OUT_COMMAND_WIDTH = ROW_COMMAND_WIDTH - COMMAND_WIDTH * TOTAL_STAGE

        i_cmd[0*ROW_COMMAND_WIDTH+:ROW_COMMAND_WIDTH]  -->|¯¯¯|-------->|¯¯¯|------->|¯¯¯|------->|¯¯¯|-------->|¯¯¯|--> o_cmd[0*OUT_COMMAND_WIDTH+:OUT_COMMAND_WIDTH]
        i_cmd[1*ROW_COMMAND_WIDTH+:ROW_COMMAND_WIDTH]  -->|___|-------->|___|------->|___|------->|___|-------->|___|--> o_cmd[1*OUT_COMMAND_WIDTH+:OUT_COMMAND_WIDTH]
                                                            0             4            8            12            16
        i_cmd[2*ROW_COMMAND_WIDTH+:ROW_COMMAND_WIDTH]  -->|¯¯¯|-------->|¯¯¯|------->|¯¯¯|------->|¯¯¯|-------->|¯¯¯|--> o_cmd[2*OUT_COMMAND_WIDTH+:OUT_COMMAND_WIDTH]
        i_cmd[3*ROW_COMMAND_WIDTH+:ROW_COMMAND_WIDTH]  -->|___|-------->|___|------->|___|------->|___|-------->|___|--> o_cmd[3*OUT_COMMAND_WIDTH+:OUT_COMMAND_WIDTH]
                                                            1             5            9            13            17
        i_cmd[4*ROW_COMMAND_WIDTH+:ROW_COMMAND_WIDTH]  -->|¯¯¯|-------->|¯¯¯|------->|¯¯¯|------->|¯¯¯|-------->|¯¯¯|--> o_cmd[4*OUT_COMMAND_WIDTH+:OUT_COMMAND_WIDTH]
        i_cmd[5*ROW_COMMAND_WIDTH+:ROW_COMMAND_WIDTH]  -->|___|-------->|___|------->|___|------->|___|-------->|___|--> o_cmd[5*OUT_COMMAND_WIDTH+:OUT_COMMAND_WIDTH]
                                                            2             6            10           14            18
        i_cmd[6*ROW_COMMAND_WIDTH+:ROW_COMMAND_WIDTH]  -->|¯¯¯|-------->|¯¯¯|------->|¯¯¯|------->|¯¯¯|-------->|¯¯¯|--> o_cmd[6*OUT_COMMAND_WIDTH+:OUT_COMMAND_WIDTH]
        i_cmd[7*ROW_COMMAND_WIDTH+:ROW_COMMAND_WIDTH]  -->|___|-------->|___|------->|___|------->|___|-------->|___|--> o_cmd[7*OUT_COMMAND_WIDTH+:OUT_COMMAND_WIDTH]
                                                            3             7            11           15            19
    Configuration:
         The command lay out is shown below: Note: switch ID is specified in the diagram above.
         !!!! Note: the command layout is different from BENES_simple.

         i_cmd: MSB [ ------------------------------------------------------------------------------------- ] LSB
          cmd for   SW3 SW7 SW11 SW15 SW19|SW2 SW6 SW10 SW14 SW18|SW1 SW5 SW9 SW13 SW17|SW0 SW4 SW8 SW12 SW16
                                          |                      |                     |
                             row4         |        row3          |        row2         |        row1
                                          |                      |                     |

    Author:      Jianming Tong (jianming.tong@gatech.edu)
*/

// design the following testbench for 2^n inputs. n could be any integer.
`define TEST_16_INPUT_BENES_PRE_INTEGRATION //change #30 into #40
// `define Basic_testing_16pe //change #30 into #40


`ifdef Basic_testing_16pe
// this testbench is used to test the functionality of integrating BENES network together with 1D Multipliers
// DATA_WIDTH = 8
// Num PE = 16
// Each PE takes   4 + $clog2(DATA_WIDTH) + 1 = 8 bits (configuration)
module tb_benes_simple_cmd_flow_seq();
    parameter DATA_WIDTH = 4;
    parameter COMMAND_WIDTH  = 2;
    parameter IN_COMMAND_WIDTH  = 16; // o_cmd should have 2 bits
    parameter NUM_INPUT_DATA = 16;

    //parameter
    localparam NUM_SWITCH_IN = NUM_INPUT_DATA >> 1;
    localparam LEVEL = $clog2(NUM_SWITCH_IN);
    localparam TOTAL_STAGE = 2*LEVEL+1;

    localparam TOTAL_COMMAND = NUM_SWITCH_IN*IN_COMMAND_WIDTH;
    localparam OUT_COMMAND_WIDTH = TOTAL_COMMAND - NUM_SWITCH_IN*TOTAL_STAGE*COMMAND_WIDTH;

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
    wire [OUT_COMMAND_WIDTH-1:0]               o_cmd;

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
    benes_simple_cmd_flow_seq #(
        .DATA_WIDTH(DATA_WIDTH),
        .COMMAND_WIDTH(COMMAND_WIDTH),
        .NUM_INPUT_DATA(NUM_INPUT_DATA),
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






`ifdef TEST_16_INPUT_BENES_PRE_INTEGRATION
// this testbench is used to test the functionality of integrating BENES network together with 1D Multipliers
// DATA_WIDTH = 8
// Num PE = 16
// Each PE takes   4 + $clog2(DATA_WIDTH) + 1 = 8 bits (configuration) ----> each switch corresponds to 2 PEs -> 16 bits
// Each switch takes 2-bit command, 7 stages in total -> 14-bit command for BENES network.
// Conclude: 8*2 + 14 = 30 bit command for each row. -> IN_COMMAND_WIDTH = 30
module tb_benes_simple_cmd_flow_seq();
    parameter DATA_WIDTH = 8;
    parameter COMMAND_WIDTH  = 2;
    parameter IN_COMMAND_WIDTH  = 30; // o_cmd should have 2 bits
    parameter NUM_INPUT_DATA = 16;

    //parameter
    localparam NUM_SWITCH_IN = NUM_INPUT_DATA >> 1;
    localparam LEVEL = $clog2(NUM_SWITCH_IN);
    localparam TOTAL_STAGE = 2*LEVEL+1;

    localparam TOTAL_COMMAND = NUM_SWITCH_IN*IN_COMMAND_WIDTH;
    localparam BENES_COMMAND_ROW = TOTAL_STAGE*COMMAND_WIDTH;
    localparam OUT_COMMAND_WIDTH = TOTAL_COMMAND - NUM_SWITCH_IN*TOTAL_STAGE*COMMAND_WIDTH;

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
    wire [OUT_COMMAND_WIDTH-1:0]               o_cmd;

    // Test case declaration
    // all cases for control
    initial
    begin
        // disable
        clk = 1'b0;
        rst_n = 1'b1;
        i_data_bus = {{8'h00},{8'h00},{8'h00},{8'h00},{8'h00},{8'h00},{8'h00},{8'h06},{8'h07},{8'h02},{8'h03},{8'h04},{8'h05},{8'h00},{8'h01},{8'h02}};
        i_valid = 16'h01ff;
        i_en = 1'b0;
        i_cmd = {{{(BENES_COMMAND_ROW>>1){2'b10}},{8'b01110101},{8'b01110101}},{{(BENES_COMMAND_ROW>>1){2'b10}},{8'b01110101},{8'b01110101}},{{(BENES_COMMAND_ROW>>1){2'b10}},{8'b01110101},{8'b01110101}},{{(BENES_COMMAND_ROW>>1){2'b10}},{8'b01110101},{8'b01110101}},{{(BENES_COMMAND_ROW>>1){2'b10}},{8'b01110101},{8'b01110101}},{{(BENES_COMMAND_ROW>>1){2'b10}},{8'b01110101},{8'b01110101}},{{(BENES_COMMAND_ROW>>1){2'b10}},{8'b01110101},{8'b01110101}},{{(BENES_COMMAND_ROW>>1){2'b10}},{8'b01110101},{8'b01110101}}};

        // reset
        #10
        rst_n = 1'b0;
        i_data_bus = {{8'h00},{8'h00},{8'h00},{8'h00},{8'h00},{8'h00},{8'h00},{8'h06},{8'h07},{8'h02},{8'h03},{8'h04},{8'h05},{8'h00},{8'h01},{8'h02}};
        i_valid = 16'h01ff;
        i_en = 1'b1;
        i_cmd = {{{(BENES_COMMAND_ROW>>1){2'b10}},{8'b01110101},{8'b01110101}},{{(BENES_COMMAND_ROW>>1){2'b10}},{8'b01110101},{8'b01110101}},{{(BENES_COMMAND_ROW>>1){2'b10}},{8'b01110101},{8'b01110101}},{{(BENES_COMMAND_ROW>>1){2'b10}},{8'b01110101},{8'b01110101}},{{(BENES_COMMAND_ROW>>1){2'b10}},{8'b01110101},{8'b01110101}},{{(BENES_COMMAND_ROW>>1){2'b10}},{8'b01110101},{8'b01110101}},{{(BENES_COMMAND_ROW>>1){2'b10}},{8'b01110101},{8'b01110101}},{{(BENES_COMMAND_ROW>>1){2'b10}},{8'b01110101},{8'b01110101}}};

        /*
            case start!
        */

        // cycle 0
        #10
        $display("o_data_bus: %h\n", o_data_bus);
        rst_n = 1'b1;
        i_data_bus = {{8'h00},{8'h00},{8'h00},{8'h00},{8'h00},{8'h00},{8'h00},{8'h06},{8'h07},{8'h02},{8'h03},{8'h04},{8'h05},{8'h00},{8'h01},{8'h02}};
        i_valid = 16'h01ff;
        i_en = 1'b1;
        i_cmd = {{{(BENES_COMMAND_ROW>>1){2'b10}},{8'b01110101},{8'b01110101}},{{(BENES_COMMAND_ROW>>1){2'b10}},{8'b01110101},{8'b01110101}},{{(BENES_COMMAND_ROW>>1){2'b10}},{8'b01110101},{8'b01110101}},{{(BENES_COMMAND_ROW>>1){2'b10}},{8'b01110101},{8'b01110101}},{{(BENES_COMMAND_ROW>>1){2'b10}},{8'b01110101},{8'b01110101}},{{(BENES_COMMAND_ROW>>1){2'b10}},{8'b01110101},{8'b01110101}},{{(BENES_COMMAND_ROW>>1){2'b10}},{8'b01110101},{8'b01110101}},{{(BENES_COMMAND_ROW>>1){2'b10}},{8'b01110101},{8'b01110101}}};

        // cycle 1
        #10
        $display("o_data_bus: %h\n", o_data_bus);
        rst_n = 1'b1;
        i_data_bus = {{8'h00},{8'h00},{8'h00},{8'h00},{8'h00},{8'h00},{8'h00},{8'h15},{8'h16},{8'h17},{8'h0F},{8'h10},{8'h11},{8'h09},{8'h0A},{8'h0B}};
        i_valid = 16'h01ff;
        i_en = 1'b1;
        i_cmd = {{{(BENES_COMMAND_ROW>>1){2'b10}},{8'b01110101},{8'b01110101}},{{(BENES_COMMAND_ROW>>1){2'b10}},{8'b01110101},{8'b01110101}},{{(BENES_COMMAND_ROW>>1){2'b10}},{8'b01110101},{8'b01110101}},{{(BENES_COMMAND_ROW>>1){2'b10}},{8'b01110101},{8'b01110111}},{{(BENES_COMMAND_ROW>>1){2'b10}},{8'b01111111},{8'b01111111}},{{(BENES_COMMAND_ROW>>1){2'b10}},{8'b01110111},{8'b01111111}},{{(BENES_COMMAND_ROW>>1){2'b10}},{8'b01111111},{8'b01110111}},{{(BENES_COMMAND_ROW>>1){2'b10}},{8'b01111111},{8'b01111111}}};

        // cycle 2
        #10
        $display("o_data_bus: %h\n", o_data_bus);
        rst_n = 1'b1;
        i_data_bus = {{8'h00},{8'h00},{8'h00},{8'h00},{8'h00},{8'h00},{8'h00},{8'h16},{8'h17},{8'h18},{8'h10},{8'h11},{8'h12},{8'h0A},{8'h0B},{8'h0C}};
        i_valid = 16'h0049;
        i_en = 1'b1;
        i_cmd = {{{(BENES_COMMAND_ROW>>1){2'b10}},{8'b01110101},{8'b01110101}},{{(BENES_COMMAND_ROW>>1){2'b10}},{8'b01110101},{8'b01110101}},{{(BENES_COMMAND_ROW>>1){2'b10}},{8'b01110101},{8'b01110101}},{{(BENES_COMMAND_ROW>>1){2'b10}},{8'b01110101},{8'b01110000}},{{(BENES_COMMAND_ROW>>1){2'b10}},{8'b01111000},{8'b01111111}},{{(BENES_COMMAND_ROW>>1){2'b10}},{8'b01110000},{8'b01111000}},{{(BENES_COMMAND_ROW>>1){2'b10}},{8'b01111111},{8'b01110000}},{{(BENES_COMMAND_ROW>>1){2'b10}},{8'b01111000},{8'b01111111}}};

        // cycle 3
        #10
        $display("o_data_bus: %h\n", o_data_bus);
        rst_n = 1'b1;
        i_data_bus = {{8'h00},{8'h00},{8'h00},{8'h00},{8'h00},{8'h00},{8'h00},{8'h17},{8'h18},{8'h19},{8'h11},{8'h12},{8'h13},{8'h0B},{8'h0C},{8'h0D}};
        i_valid = 16'h0049;
        i_en = 1'b1;
        i_cmd = {{{(BENES_COMMAND_ROW>>1){2'b10}},{8'b01110101},{8'b01110101}},{{(BENES_COMMAND_ROW>>1){2'b10}},{8'b01110101},{8'b01110101}},{{(BENES_COMMAND_ROW>>1){2'b10}},{8'b01110101},{8'b01110101}},{{(BENES_COMMAND_ROW>>1){2'b10}},{8'b01110101},{8'b01110000}},{{(BENES_COMMAND_ROW>>1){2'b10}},{8'b01111000},{8'b01111111}},{{(BENES_COMMAND_ROW>>1){2'b10}},{8'b01110000},{8'b01111000}},{{(BENES_COMMAND_ROW>>1){2'b10}},{8'b01111111},{8'b01110000}},{{(BENES_COMMAND_ROW>>1){2'b10}},{8'b01111000},{8'b01111111}}};

        // cycle 4
        #10
        $display("o_data_bus: %h\n", o_data_bus);
        rst_n = 1'b1;
        i_data_bus = {{8'h00},{8'h00},{8'h00},{8'h00},{8'h00},{8'h00},{8'h00},{8'h18},{8'h19},{8'h1A},{8'h12},{8'h13},{8'h14},{8'h0C},{8'h0D},{8'h0E}};
        i_valid = 16'h0049;
        i_en = 1'b1;
        i_cmd = {{{(BENES_COMMAND_ROW>>1){2'b10}},{8'b01110101},{8'b01110101}},{{(BENES_COMMAND_ROW>>1){2'b10}},{8'b01110101},{8'b01110101}},{{(BENES_COMMAND_ROW>>1){2'b10}},{8'b01110101},{8'b01110101}},{{(BENES_COMMAND_ROW>>1){2'b10}},{8'b01110101},{8'b01110000}},{{(BENES_COMMAND_ROW>>1){2'b10}},{8'b01110000},{8'b01110111}},{{(BENES_COMMAND_ROW>>1){2'b10}},{8'b01110000},{8'b01110000}},{{(BENES_COMMAND_ROW>>1){2'b10}},{8'b01110111},{8'b01110000}},{{(BENES_COMMAND_ROW>>1){2'b10}},{8'b01110000},{8'b01110111}}};

        // cycle 5
        #10
        $display("o_data_bus: %h\n", o_data_bus);
        i_data_bus = {{8'h00},{8'h00},{8'h00},{8'h00},{8'h00},{8'h00},{8'h00},{8'h1B},{8'h1C},{8'h1D},{8'h15},{8'h16},{8'h17},{8'h0F},{8'h10},{8'h11}};
        rst_n = 1'b1;
        i_cmd = {{{(BENES_COMMAND_ROW>>1){2'b10}},{8'b01110101},{8'b01110101}},{{(BENES_COMMAND_ROW>>1){2'b10}},{8'b01110101},{8'b01110101}},{{(BENES_COMMAND_ROW>>1){2'b10}},{8'b01110101},{8'b01110101}},{{(BENES_COMMAND_ROW>>1){2'b10}},{8'b01110101},{8'b01110111}},{{(BENES_COMMAND_ROW>>1){2'b10}},{8'b01111111},{8'b01111111}},{{(BENES_COMMAND_ROW>>1){2'b10}},{8'b01110111},{8'b01111111}},{{(BENES_COMMAND_ROW>>1){2'b10}},{8'b01111111},{8'b01110111}},{{(BENES_COMMAND_ROW>>1){2'b10}},{8'b01111111},{8'b01111111}}};
        i_valid = 16'h01ff;
        i_en = 1'b1;

        // cycle 6
        #10
        $display("o_data_bus: %h\n", o_data_bus);
        rst_n = 1'b1;
        i_data_bus = {{8'h00},{8'h00},{8'h00},{8'h00},{8'h00},{8'h00},{8'h00},{8'h1C},{8'h1D},{8'h1E},{8'h16},{8'h17},{8'h18},{8'h10},{8'h11},{8'h12}};
        i_cmd = {{{(BENES_COMMAND_ROW>>1){2'b10}},{8'b01110101},{8'b01110101}},{{(BENES_COMMAND_ROW>>1){2'b10}},{8'b01110101},{8'b01110101}},{{(BENES_COMMAND_ROW>>1){2'b10}},{8'b01110101},{8'b01110101}},{{(BENES_COMMAND_ROW>>1){2'b10}},{8'b01110101},{8'b01110000}},{{(BENES_COMMAND_ROW>>1){2'b10}},{8'b01111000},{8'b01111111}},{{(BENES_COMMAND_ROW>>1){2'b10}},{8'b01110000},{8'b01111000}},{{(BENES_COMMAND_ROW>>1){2'b10}},{8'b01111111},{8'b01110000}},{{(BENES_COMMAND_ROW>>1){2'b10}},{8'b01111000},{8'b01111111}}};
        i_valid = 16'h0049;
        i_en = 1'b1;

        // cycle 7
        #10
        $display("o_data_bus: %h\n", o_data_bus);
        rst_n = 1'b1;
        i_data_bus = {{8'h00},{8'h00},{8'h00},{8'h00},{8'h00},{8'h00},{8'h00},{8'h1D},{8'h1E},{8'h1F},{8'h17},{8'h18},{8'h19},{8'h11},{8'h12},{8'h13}};
        i_cmd = {{{(BENES_COMMAND_ROW>>1){2'b10}},{8'b01110101},{8'b01110101}},{{(BENES_COMMAND_ROW>>1){2'b10}},{8'b01110101},{8'b01110101}},{{(BENES_COMMAND_ROW>>1){2'b10}},{8'b01110101},{8'b01110101}},{{(BENES_COMMAND_ROW>>1){2'b10}},{8'b01110101},{8'b01110000}},{{(BENES_COMMAND_ROW>>1){2'b10}},{8'b01111000},{8'b01111111}},{{(BENES_COMMAND_ROW>>1){2'b10}},{8'b01110000},{8'b01111000}},{{(BENES_COMMAND_ROW>>1){2'b10}},{8'b01111111},{8'b01110000}},{{(BENES_COMMAND_ROW>>1){2'b10}},{8'b01111000},{8'b01111111}}};
        i_valid = 16'h0049;
        i_en = 1'b1;

        // cycle 8
        #10
        $display("o_data_bus: %h\n", o_data_bus);
        rst_n = 1'b1;
        i_data_bus = {{8'h00},{8'h00},{8'h00},{8'h00},{8'h00},{8'h00},{8'h00},{8'h1E},{8'h1F},{8'h20},{8'h18},{8'h19},{8'h1A},{8'h12},{8'h13},{8'h14}};
        i_cmd = {{{(BENES_COMMAND_ROW>>1){2'b10}},{8'b01110101},{8'b01110101}},{{(BENES_COMMAND_ROW>>1){2'b10}},{8'b01110101},{8'b01110101}},{{(BENES_COMMAND_ROW>>1){2'b10}},{8'b01110101},{8'b01110101}},{{(BENES_COMMAND_ROW>>1){2'b10}},{8'b01110101},{8'b01110000}},{{(BENES_COMMAND_ROW>>1){2'b10}},{8'b01110000},{8'b01110111}},{{(BENES_COMMAND_ROW>>1){2'b10}},{8'b01110000},{8'b01110000}},{{(BENES_COMMAND_ROW>>1){2'b10}},{8'b01110111},{8'b01110000}},{{(BENES_COMMAND_ROW>>1){2'b10}},{8'b01110000},{8'b01110111}}};
        i_valid = 16'h0049;
        i_en = 1'b1;

        // cycle 9 -- no valid input
        #10
        $display("o_data_bus: %h\n", o_data_bus);
        rst_n = 1'b1;
        i_data_bus = {{8'h00},{8'h00},{8'h00},{8'h00},{8'h00},{8'h00},{8'h00},{8'h06},{8'h07},{8'h02},{8'h03},{8'h04},{8'h05},{8'h00},{8'h01},{8'h02}};
        i_valid = 16'h0000;
        i_en = 1'b1;
        i_cmd = {{{(BENES_COMMAND_ROW>>1){2'b10}},{8'b01110101},{8'b01110101}},{{(BENES_COMMAND_ROW>>1){2'b10}},{8'b01110101},{8'b01110101}},{{(BENES_COMMAND_ROW>>1){2'b10}},{8'b01110101},{8'b01110101}},{{(BENES_COMMAND_ROW>>1){2'b10}},{8'b01110101},{8'b01110111}},{{(BENES_COMMAND_ROW>>1){2'b10}},{8'b01110000},{8'b01110000}},{{(BENES_COMMAND_ROW>>1){2'b10}},{8'b01110111},{8'b01110000}},{{(BENES_COMMAND_ROW>>1){2'b10}},{8'b01110000},{8'b01110111}},{{(BENES_COMMAND_ROW>>1){2'b10}},{8'b01110000},{8'b01110000}}};


        // cycle 10 -- no valid input
        #10
        $display("o_data_bus: %h\n", o_data_bus);
        rst_n = 1'b1;
        i_data_bus = {{8'h02},{8'h01},{8'h00},{8'h05},{8'h04},{8'h03},{8'h08},{8'h07},{8'h06},{8'h00},{8'h00},{8'h00},{8'h00},{8'h00},{8'h00},{8'h00}};
        i_valid = 16'h0000;
        i_en = 1'b1;
        i_cmd = {{{(BENES_COMMAND_ROW>>1){2'b10}},{8'b01110101},{8'b01110101}},{{(BENES_COMMAND_ROW>>1){2'b10}},{8'b01110101},{8'b01110101}},{{(BENES_COMMAND_ROW>>1){2'b10}},{8'b01110101},{8'b01110101}},{{(BENES_COMMAND_ROW>>1){2'b10}},{8'b01110101},{8'b01110111}},{{(BENES_COMMAND_ROW>>1){2'b10}},{8'b01110000},{8'b01110000}},{{(BENES_COMMAND_ROW>>1){2'b10}},{8'b01110111},{8'b01110000}},{{(BENES_COMMAND_ROW>>1){2'b10}},{8'b01110000},{8'b01110111}},{{(BENES_COMMAND_ROW>>1){2'b10}},{8'b01110000},{8'b01110000}}};

        #10
        $display("o_data_bus: %h\n", o_data_bus);
        #10
        $display("o_data_bus: %h\n", o_data_bus);
        #10
        $display("o_data_bus: %h\n", o_data_bus);
        #10
        $display("o_data_bus: %h\n", o_data_bus);
        #10
        $display("o_data_bus: %h\n", o_data_bus);
        #10
        $display("o_data_bus: %h\n", o_data_bus);
        $stop;
    end

    // instantiate DUT (device under test)
    benes_simple_cmd_flow_seq #(
        .DATA_WIDTH(DATA_WIDTH),
        .COMMAND_WIDTH(COMMAND_WIDTH),
        .NUM_INPUT_DATA(NUM_INPUT_DATA),
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
