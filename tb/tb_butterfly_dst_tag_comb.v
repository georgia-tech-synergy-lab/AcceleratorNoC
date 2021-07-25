`timescale 1ns / 1ps
/*
    Top Module:  tb_butterfly_dst_tag_comb
    Data:        Only data width matters.
    Format:      keeping the input format unchange
    Timing:      Combinational Logic
    Dummy Data:  {DATA_WIDTH{1'b0}}
    Control:     Use destination tag

    Function:    Unicast  or  Multicast(Not arbitrary Multicast)

        i_data_bus[0*DATA_WIDTH+:DATA_WIDTH]  -->|¯¯¯|-------->|¯¯¯|----->|¯¯¯|-->
        i_data_bus[1*DATA_WIDTH+:DATA_WIDTH]  -->|___|-\    /->|___|-\ /->|___|-->
                                                        \  /          X
        i_data_bus[2*DATA_WIDTH+:DATA_WIDTH]  -->|¯¯¯|---\/--->|¯¯¯|-/ \->|¯¯¯|-->
        i_data_bus[3*DATA_WIDTH+:DATA_WIDTH]  -->|___|-\ /\ /->|___|----->|___|-->
                                                        X  X
        i_data_bus[4*DATA_WIDTH+:DATA_WIDTH]  -->|¯¯¯|-/ \/ \->|¯¯¯|----->|¯¯¯|-->
        i_data_bus[5*DATA_WIDTH+:DATA_WIDTH]  -->|___|---/\--->|___|-\ /->|___|-->
                                                        /  \          X
        i_data_bus[6*DATA_WIDTH+:DATA_WIDTH]  -->|¯¯¯|-/    \->|¯¯¯|-/ \->|¯¯¯|-->
        i_data_bus[7*DATA_WIDTH+:DATA_WIDTH]  -->|___|-------->|___|----->|___|-->


           CONNECTION FUNCTION                        BUTTERFLY    BUTTERFLY
          CONNECTION GROUP SIZE                          8            4

    Control Signal
        i_valid[0]-->|¯¯¯|<--i_cmd[2:0]
        i_valid[1]-->|___|

    Author:      Jianming Tong (jianming.tong@gatech.edu)
*/


// `define TEST_4_butterfly
// `define TEST_8_butterfly


`define TEST_16_butterfly

`ifdef TEST_16_butterfly
module tb_butterfly_dst_tag_comb();
    parameter DATA_WIDTH = 4;
    parameter NUM_INPUT_DATA = 16;
    parameter COMMAND_WIDTH  = $clog2(NUM_INPUT_DATA);   // = length of index of destination in binary
    parameter DESTINATION_TAG_WIDTH = COMMAND_WIDTH;     // destination tag, each level consumes 1 bit.

    // parameter
    localparam  NUM_STAGE = $clog2(NUM_INPUT_DATA);
    localparam  WIDTH_INPUT_DATA = DATA_WIDTH * NUM_INPUT_DATA;
    localparam  NUM_SWITCH_IN = NUM_INPUT_DATA >> 1;

    // interface
    reg                                                        clk;

    reg    [NUM_INPUT_DATA-1:0]                                i_valid;
    reg    [WIDTH_INPUT_DATA-1:0]                              i_data_bus;

    wire   [NUM_INPUT_DATA-1:0]                                o_valid;
    wire   [WIDTH_INPUT_DATA-1:0]                              o_data_bus; //{o_data_a, o_data_b}

    reg                                                        i_en;
    reg    [NUM_INPUT_DATA*DESTINATION_TAG_WIDTH-1:0]          i_cmd;

    // Test case declaration
    // all cases for control
    initial
    begin
        clk = 1'b0;
        // not enable at start
        #40
        i_valid = {NUM_INPUT_DATA{1'b1}};
        i_data_bus = {{(DATA_WIDTH>>2){4'hf}},{(DATA_WIDTH>>2){4'he}},{(DATA_WIDTH>>2){4'hd}},{(DATA_WIDTH>>2){4'hc}},{(DATA_WIDTH>>2){4'hb}},{(DATA_WIDTH>>2){4'ha}},{(DATA_WIDTH>>2){4'h9}},{(DATA_WIDTH>>2){4'h8}},{(DATA_WIDTH>>2){4'h7}},{(DATA_WIDTH>>2){4'h6}},{(DATA_WIDTH>>2){4'h5}},{(DATA_WIDTH>>2){4'h4}},{(DATA_WIDTH>>2){4'h3}},{(DATA_WIDTH>>2){4'h2}},{(DATA_WIDTH>>2){4'h1}},{(DATA_WIDTH>>2){4'h0}}};
        i_en = 1'b0;
        i_cmd = {4'b1111,4'b0111,4'b1110,4'b0110,4'b1101,4'b0101,4'b1100,4'b0100,4'b1011,4'b0011,4'b1010,4'b0010,4'b1001,4'b0001,4'b1000,4'b0000};

        // reg active -- Pass Through
        #40
        i_valid = {NUM_INPUT_DATA{1'b1}};
        i_data_bus = {{(DATA_WIDTH>>2){4'hf}},{(DATA_WIDTH>>2){4'he}},{(DATA_WIDTH>>2){4'hd}},{(DATA_WIDTH>>2){4'hc}},{(DATA_WIDTH>>2){4'hb}},{(DATA_WIDTH>>2){4'ha}},{(DATA_WIDTH>>2){4'h9}},{(DATA_WIDTH>>2){4'h8}},{(DATA_WIDTH>>2){4'h7}},{(DATA_WIDTH>>2){4'h6}},{(DATA_WIDTH>>2){4'h5}},{(DATA_WIDTH>>2){4'h4}},{(DATA_WIDTH>>2){4'h3}},{(DATA_WIDTH>>2){4'h2}},{(DATA_WIDTH>>2){4'h1}},{(DATA_WIDTH>>2){4'h0}}};
        i_en = 1'b1;
        i_cmd = {4'b1111,4'b0111,4'b1110,4'b0110,4'b1101,4'b0101,4'b1100,4'b0100,4'b1011,4'b0011,4'b1010,4'b0010,4'b1001,4'b0001,4'b1000,4'b0000};

        // reg active -- Pass Switch
        #40
        i_valid = {NUM_INPUT_DATA{1'b1}};
        i_data_bus = {{(DATA_WIDTH>>2){4'hf}},{(DATA_WIDTH>>2){4'he}},{(DATA_WIDTH>>2){4'hd}},{(DATA_WIDTH>>2){4'hc}},{(DATA_WIDTH>>2){4'hb}},{(DATA_WIDTH>>2){4'ha}},{(DATA_WIDTH>>2){4'h9}},{(DATA_WIDTH>>2){4'h8}},{(DATA_WIDTH>>2){4'h7}},{(DATA_WIDTH>>2){4'h6}},{(DATA_WIDTH>>2){4'h5}},{(DATA_WIDTH>>2){4'h4}},{(DATA_WIDTH>>2){4'h3}},{(DATA_WIDTH>>2){4'h2}},{(DATA_WIDTH>>2){4'h1}},{(DATA_WIDTH>>2){4'h0}}};
        i_en = 1'b1;
        i_cmd = {4'b0000,4'b1000,4'b0001,4'b1001,4'b0010,4'b1010,4'b0011,4'b1011,4'b0100,4'b1100,4'b0101,4'b1101,4'b0110,4'b1110,4'b0111,4'b1111};

        // reg active -- No Pass
        #40
        i_valid = {NUM_INPUT_DATA{1'b0}};
        i_data_bus = {{(DATA_WIDTH>>2){4'hf}},{(DATA_WIDTH>>2){4'he}},{(DATA_WIDTH>>2){4'hd}},{(DATA_WIDTH>>2){4'hc}},{(DATA_WIDTH>>2){4'hb}},{(DATA_WIDTH>>2){4'ha}},{(DATA_WIDTH>>2){4'h9}},{(DATA_WIDTH>>2){4'h8}},{(DATA_WIDTH>>2){4'h7}},{(DATA_WIDTH>>2){4'h6}},{(DATA_WIDTH>>2){4'h5}},{(DATA_WIDTH>>2){4'h4}},{(DATA_WIDTH>>2){4'h3}},{(DATA_WIDTH>>2){4'h2}},{(DATA_WIDTH>>2){4'h1}},{(DATA_WIDTH>>2){4'h0}}};
        i_en = 1'b1;
        i_cmd = {4'b0000,4'b1000,4'b0001,4'b1001,4'b0010,4'b1010,4'b0011,4'b1011,4'b0100,4'b1100,4'b0101,4'b1101,4'b0110,4'b1110,4'b0111,4'b1111};

        // change data half way  -- Pass Through
        #40
        i_valid = {NUM_INPUT_DATA{1'b1}};
        i_data_bus = {{(DATA_WIDTH>>2){4'hf}},{(DATA_WIDTH>>2){4'he}},{(DATA_WIDTH>>2){4'hd}},{(DATA_WIDTH>>2){4'hc}},{(DATA_WIDTH>>2){4'hb}},{(DATA_WIDTH>>2){4'ha}},{(DATA_WIDTH>>2){4'h9}},{(DATA_WIDTH>>2){4'h8}},{(DATA_WIDTH>>2){4'h7}},{(DATA_WIDTH>>2){4'h6}},{(DATA_WIDTH>>2){4'h5}},{(DATA_WIDTH>>2){4'h4}},{(DATA_WIDTH>>2){4'h3}},{(DATA_WIDTH>>2){4'h2}},{(DATA_WIDTH>>2){4'h1}},{(DATA_WIDTH>>2){4'h0}}};
        i_en = 1'b1;
        i_cmd =  {4'b1111,4'b0111,4'b1110,4'b0110,4'b1101,4'b0101,4'b1100,4'b0100,4'b1011,4'b0011,4'b1010,4'b0010,4'b1001,4'b0001,4'b1000,4'b000};

        // invalid high output -- Pass Through
        #40
        i_valid = {(NUM_INPUT_DATA>>1){2'b10}};
        i_data_bus = {{(DATA_WIDTH>>2){4'h7}},{(DATA_WIDTH>>2){4'h6}},{(DATA_WIDTH>>2){4'h5}},{(DATA_WIDTH>>2){4'h4}},{(DATA_WIDTH>>2){4'h3}},{(DATA_WIDTH>>2){4'h2}},{(DATA_WIDTH>>2){4'h1}},{(DATA_WIDTH>>2){4'h0}},{(DATA_WIDTH>>2){4'hf}},{(DATA_WIDTH>>2){4'he}},{(DATA_WIDTH>>2){4'hd}},{(DATA_WIDTH>>2){4'hc}},{(DATA_WIDTH>>2){4'hb}},{(DATA_WIDTH>>2){4'ha}},{(DATA_WIDTH>>2){4'h9}},{(DATA_WIDTH>>2){4'h8}}};
        i_en = 1'b1;
        i_cmd =  {4'b1111,4'b0111,4'b1110,4'b0110,4'b1101,4'b0101,4'b1100,4'b0100,4'b1011,4'b0011,4'b1010,4'b0010,4'b1001,4'b0001,4'b1000,4'b000};

        // invalid low output  -- Pass Through
        #40
        i_valid = {(NUM_INPUT_DATA>>1){2'b01}};
        i_data_bus = {{(DATA_WIDTH>>2){4'h7}},{(DATA_WIDTH>>2){4'h6}},{(DATA_WIDTH>>2){4'h5}},{(DATA_WIDTH>>2){4'h4}},{(DATA_WIDTH>>2){4'h3}},{(DATA_WIDTH>>2){4'h2}},{(DATA_WIDTH>>2){4'h1}},{(DATA_WIDTH>>2){4'h0}},{(DATA_WIDTH>>2){4'hf}},{(DATA_WIDTH>>2){4'he}},{(DATA_WIDTH>>2){4'hd}},{(DATA_WIDTH>>2){4'hc}},{(DATA_WIDTH>>2){4'hb}},{(DATA_WIDTH>>2){4'ha}},{(DATA_WIDTH>>2){4'h9}},{(DATA_WIDTH>>2){4'h8}}};
        i_en = 1'b1;
        i_cmd = {4'b1111,4'b0111,4'b1110,4'b0110,4'b1101,4'b0101,4'b1100,4'b0100,4'b1011,4'b0011,4'b1010,4'b0010,4'b1001,4'b0001,4'b1000,4'b000};
        #40
        $stop;
    end

    // instantiate DUT (device under test)
    butterfly_dst_tag_comb #(
        .DATA_WIDTH(DATA_WIDTH),
        .NUM_INPUT_DATA(NUM_INPUT_DATA)
      ) dut(
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



`ifdef TEST_8_butterfly
module tb_butterfly_dst_tag_comb();
    parameter DATA_WIDTH = 4;
    parameter NUM_INPUT_DATA = 8;
    parameter COMMAND_WIDTH  = $clog2(NUM_INPUT_DATA);   // = length of index of destination in binary
    parameter DESTINATION_TAG_WIDTH = COMMAND_WIDTH; // destination tag, each level consumes 1 bit.

    // parameter
    localparam  NUM_STAGE = $clog2(NUM_INPUT_DATA);
    localparam  WIDTH_INPUT_DATA = DATA_WIDTH * NUM_INPUT_DATA;
    localparam  NUM_SWITCH_IN = NUM_INPUT_DATA >> 1;

    // interface
    reg                                                        clk;

    reg    [NUM_INPUT_DATA-1:0]                                i_valid;
    reg    [WIDTH_INPUT_DATA-1:0]                              i_data_bus;

    wire   [NUM_INPUT_DATA-1:0]                                o_valid;
    wire   [WIDTH_INPUT_DATA-1:0]                              o_data_bus; //{o_data_a, o_data_b}

    reg                                                        i_en;
    reg    [NUM_INPUT_DATA*DESTINATION_TAG_WIDTH-1:0]          i_cmd;

    // Test case declaration
    // all cases for control
    initial
    begin
        clk = 1'b0;
        // not enable at start
        #40
        i_valid = {NUM_INPUT_DATA{1'b1}};
        i_data_bus = {{(DATA_WIDTH>>2){4'h7}},{(DATA_WIDTH>>2){4'h6}},{(DATA_WIDTH>>2){4'h5}},{(DATA_WIDTH>>2){4'h4}},{(DATA_WIDTH>>2){4'h3}},{(DATA_WIDTH>>2){4'h2}},{(DATA_WIDTH>>2){4'h1}},{(DATA_WIDTH>>2){4'h0}}};
        i_en = 1'b0;
        i_cmd = {3'b111,3'b011,3'b110,3'b010,3'b101,3'b001,3'b100,3'b000};

        // reg active -- Pass Through
        #40
        i_valid = {NUM_INPUT_DATA{1'b1}};
        i_data_bus = {{(DATA_WIDTH>>2){4'h7}},{(DATA_WIDTH>>2){4'h6}},{(DATA_WIDTH>>2){4'h5}},{(DATA_WIDTH>>2){4'h4}},{(DATA_WIDTH>>2){4'h3}},{(DATA_WIDTH>>2){4'h2}},{(DATA_WIDTH>>2){4'h1}},{(DATA_WIDTH>>2){4'h0}}};
        i_en = 1'b1;
        i_cmd = {3'b111,3'b011,3'b110,3'b010,3'b101,3'b001,3'b100,3'b000};

        // reg active -- Pass Switch
        #40
        i_valid = {NUM_INPUT_DATA{1'b1}};
        i_data_bus = {{(DATA_WIDTH>>2){4'h7}},{(DATA_WIDTH>>2){4'h6}},{(DATA_WIDTH>>2){4'h5}},{(DATA_WIDTH>>2){4'h4}},{(DATA_WIDTH>>2){4'h3}},{(DATA_WIDTH>>2){4'h2}},{(DATA_WIDTH>>2){4'h1}},{(DATA_WIDTH>>2){4'h0}}};
        i_en = 1'b1;
        i_cmd = {3'b000,3'b100,3'b001,3'b101,3'b110,3'b010,3'b011,3'b111};

        // reg active -- No Pass
        #40
        i_valid = {NUM_INPUT_DATA{1'b0}};
        i_data_bus = {{(DATA_WIDTH>>2){4'h7}},{(DATA_WIDTH>>2){4'h6}},{(DATA_WIDTH>>2){4'h5}},{(DATA_WIDTH>>2){4'h4}},{(DATA_WIDTH>>2){4'h3}},{(DATA_WIDTH>>2){4'h2}},{(DATA_WIDTH>>2){4'h1}},{(DATA_WIDTH>>2){4'h0}}};
        i_en = 1'b1;
        i_cmd = {3'b111,3'b011,3'b110,3'b010,3'b101,3'b001,3'b100,3'b000};

        // change data half way  -- Pass Through
        #40
        i_valid = {NUM_INPUT_DATA{1'b1}};
        i_data_bus = {{(DATA_WIDTH>>2){4'h7}},{(DATA_WIDTH>>2){4'h6}},{(DATA_WIDTH>>2){4'h5}},{(DATA_WIDTH>>2){4'h4}},{(DATA_WIDTH>>2){4'h3}},{(DATA_WIDTH>>2){4'h2}},{(DATA_WIDTH>>2){4'h1}},{(DATA_WIDTH>>2){4'h0}}};
        i_en = 1'b1;
        i_cmd = {3'b111,3'b011,3'b110,3'b010,3'b101,3'b001,3'b100,3'b000};

        // invalid high output -- Pass Through
        #40
        i_valid = {(NUM_INPUT_DATA>>1){2'b10}};
        i_data_bus = {{(DATA_WIDTH>>2){4'hb}},{(DATA_WIDTH>>2){4'ha}},{(DATA_WIDTH>>2){4'h9}},{(DATA_WIDTH>>2){4'h8}}};
        i_en = 1'b1;
        i_cmd = {3'b111,3'b011,3'b110,3'b010,3'b101,3'b001,3'b100,3'b000};

        // invalid low output  -- Pass Through
        #40
        i_valid = {(NUM_INPUT_DATA>>1){2'b01}};
        i_data_bus = {{(DATA_WIDTH>>2){4'hb}},{(DATA_WIDTH>>2){4'ha}},{(DATA_WIDTH>>2){4'h9}},{(DATA_WIDTH>>2){4'h8}}};
        i_en = 1'b1;
        i_cmd = {3'b111,3'b011,3'b110,3'b010,3'b101,3'b001,3'b100,3'b000};
        #40
        $stop;
    end

    // instantiate DUT (device under test)
    butterfly_dst_tag_comb #(
        .DATA_WIDTH(DATA_WIDTH),
        .NUM_INPUT_DATA(NUM_INPUT_DATA)
      ) dut(
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




`ifdef TEST_4_butterfly
module tb_butterfly_dst_tag_comb();
    parameter DATA_WIDTH = 4;
    parameter NUM_INPUT_DATA = 4;
    parameter COMMAND_WIDTH  = $clog2(NUM_INPUT_DATA);   // = length of index of destination in binary
    parameter DESTINATION_TAG_WIDTH = COMMAND_WIDTH; // destination tag, each level consumes 1 bit.

    // parameter
    localparam  NUM_STAGE = $clog2(NUM_INPUT_DATA);
    localparam  WIDTH_INPUT_DATA = DATA_WIDTH * NUM_INPUT_DATA;
    localparam  NUM_SWITCH_IN = NUM_INPUT_DATA >> 1;

    // interface
    reg                                                        clk;

    reg    [NUM_INPUT_DATA-1:0]                                i_valid;
    reg    [WIDTH_INPUT_DATA-1:0]                              i_data_bus;

    wire   [NUM_INPUT_DATA-1:0]                                o_valid;
    wire   [WIDTH_INPUT_DATA-1:0]                              o_data_bus; //{o_data_a, o_data_b}

    reg                                                        i_en;
    reg    [NUM_INPUT_DATA*DESTINATION_TAG_WIDTH-1:0]          i_cmd;



    // Test case declaration
    // all cases for control
    initial
    begin
        clk = 1'b0;
        // not enable at start
        #40
        i_valid = {NUM_INPUT_DATA{1'b1}};
        i_data_bus = {{(DATA_WIDTH>>2){4'h3}},{(DATA_WIDTH>>2){4'h2}},{(DATA_WIDTH>>2){4'h1}},{(DATA_WIDTH>>2){4'h0}}};
        i_en = 1'b0;
        i_cmd = {2'b11,2'b01,2'b10,2'b00};

        // reg active -- Pass Through
        #40
        i_valid = {NUM_INPUT_DATA{1'b1}};
        i_data_bus = {{(DATA_WIDTH>>2){4'h3}},{(DATA_WIDTH>>2){4'h2}},{(DATA_WIDTH>>2){4'h1}},{(DATA_WIDTH>>2){4'h0}}};
        i_en = 1'b1;
        i_cmd = {2'b11,2'b01,2'b10,2'b00};

        // reg active -- Pass Switch
        #40
        i_valid = {NUM_INPUT_DATA{1'b1}};
        i_data_bus = {{(DATA_WIDTH>>2){4'h3}},{(DATA_WIDTH>>2){4'h2}},{(DATA_WIDTH>>2){4'h1}},{(DATA_WIDTH>>2){4'h0}}};
        i_en = 1'b1;
        i_cmd = {2'b00,2'b10,2'b01,2'b11};

        // reg active -- No Pass
        #40
        i_valid = {NUM_INPUT_DATA{1'b0}};
        i_data_bus = {{(DATA_WIDTH>>2){4'h3}},{(DATA_WIDTH>>2){4'h2}},{(DATA_WIDTH>>2){4'h1}},{(DATA_WIDTH>>2){4'h0}}};
        i_en = 1'b1;
        i_cmd = {2'b11,2'b01,2'b10,2'b00};

        // change data half way  -- Pass Through
        #40
        i_valid = {NUM_INPUT_DATA{1'b1}};
        i_data_bus = {{(DATA_WIDTH>>2){4'hb}},{(DATA_WIDTH>>2){4'ha}},{(DATA_WIDTH>>2){4'h9}},{(DATA_WIDTH>>2){4'h8}}};
        i_en = 1'b1;
        i_cmd = {2'b11,2'b01,2'b10,2'b00};

        // invalid high output -- Pass Through
        #40
        i_valid = {(NUM_INPUT_DATA>>1){2'b10}};
        i_data_bus = {{(DATA_WIDTH>>2){4'hb}},{(DATA_WIDTH>>2){4'ha}},{(DATA_WIDTH>>2){4'h9}},{(DATA_WIDTH>>2){4'h8}}};
        i_en = 1'b1;
        i_cmd = {2'b11,2'b01,2'b10,2'b00};

        // invalid low output  -- Pass Through
        #40
        i_valid = {(NUM_INPUT_DATA>>1){2'b01}};
        i_data_bus = {{(DATA_WIDTH>>2){4'hb}},{(DATA_WIDTH>>2){4'ha}},{(DATA_WIDTH>>2){4'h9}},{(DATA_WIDTH>>2){4'h8}}};
        i_en = 1'b1;
        i_cmd = {2'b11,2'b01,2'b10,2'b00};
        #40
        $stop;
    end

    // instantiate DUT (device under test)
    butterfly_dst_tag_comb #(
        .DATA_WIDTH(DATA_WIDTH),
        .NUM_INPUT_DATA(NUM_INPUT_DATA)
    ) dut(
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