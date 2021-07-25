`timescale 1ns / 1ps
/*
    Top Module:  tb_one_hot2dst_tag_comb
    Data:        Only data width matters.
    Format:      keeping the input format unchange
    Timing:      Combinational Logic
    Latency:     Total latency = processing delay of an single control
    Dummy Data:  {DATA_WIDTH{1'b0}}

    Function:    Expand input destination tags to support multicasting.
    Example:     4 cores in total -> 4-bit one hots -> 2log2(4) = 4-bit dst-tag control, each switch consume 2 bit dst tags.
       input one-hot dst  ->           multiple dst-tags          -> dst-tag contorl for unfolded butterfly
          unicasting
           4'b0001        ->                 2'b00                -> {2'b00, 2'b00}
           4'b0010        ->                 2'b01                -> {2'b00, 2'b01}
           4'b0100        ->                 2'b10                -> {2'b01, 2'b00}
           4'b1000        ->                 2'b11                -> {2'b01, 2'b01}
         multicasting
           4'b0011        ->               2'b00,2'b01            -> {2'b00, 2'b11}
           4'b1100        ->               2'b11,2'b10            -> {2'b01, 2'b11}
           4'b1111        ->        2'b00,2'b01,2'b10,2'b11       -> {2'b11, 2'b11}

         unicasting
         8'b00000001      ->                3'b000                -> {2'b00, 2'b00, 2'b00}
         8'b00000010      ->                3'b001                -> {2'b00, 2'b00, 2'b01}
         8'b00000100      ->                3'b010                -> {2'b00, 2'b10, 2'b00}
         8'b00001000      ->                3'b011                -> {2'b00, 2'b01, 2'b01}
         8'b00010000      ->                3'b100                -> {2'b01, 2'b00, 2'b00}
         8'b00100000      ->                3'b101                -> {2'b01, 2'b00, 2'b01}
         8'b01000000      ->                3'b110                -> {2'b01, 2'b01, 2'b00}
         8'b10000000      ->                3'b111                -> {2'b01, 2'b01, 2'b01}

         multicasting
         8'b11000000      ->            3'b111,3'b110             -> {2'b01, 2'b01, 2'b11}
         8'b00110000      ->            3'b101,3'b100             -> {2'b01, 2'b00, 2'b11}
         8'b00001100      ->            3'b011,3'b010             -> {2'b00, 2'b01, 2'b11}
         8'b00000011      ->            3'b001,3'b000             -> {2'b00, 2'b00, 2'b11}
         8'b11110000      ->        3'b{111,110,101,100}          -> {2'b01, 2'b11, 2'b11}
         8'b00001111      ->        3'b{011,010,001,000}          -> {2'b00, 2'b11, 2'b11}
         8'b11111111      -> 3'b{111,110,101,100,011,010,001,000} -> {2'b11, 2'b11, 2'b11}

    Illustartion: Take input 8'b11111111 as an example.

            multicasting bit: whether a 2x2 switch should multicast this input data. 1 indicates multicast.
             |      |      |
         {2'b11, 2'b11, 2'b11}
              |      |      |
              v      v      v
            original dst tag bit. here it is 3'b111, the highest destination tag of the group 3'b{111,110,101,100,011,010,001,000}.

    Multicasting bit generation: The one-hot("oh" below) is sent to an AND Tree with [$clog2(NUM_OUTPUT_DATA)] level.
    oh[MSB]                        oh[LSB+1] oh[LSB]
      \     /   \     / ...  |   |    \     /
       v   v     v   v  ...  v   v     v   v
       |¯¯¯|     |¯¯¯|  ...  |¯¯¯|     |¯¯¯|
       |___|     |___|  ...  |___|     |___|
         v         v    ...    v         v
         |         |    ...    |         |
          \       /      ...    \       /
           \     /       ...     \     /
            v   v        ...      v   v
            |¯¯¯|        ...      |¯¯¯|       ---> AND all inputs of this level -> the LSB multicasting bit.
            |___|        ...      |___|
              v                     v
              |                     |
               \                   /             .
                ...              ...             .
                 ...           ...               .
                  ...        ...                 .
                     \       /
                      \     /
                       v   v
                       |¯¯¯|                  ---> AND all iuputs of this level -> the MSB-1 multicasting bit.
                       |___|
                         |
                         v
                MSB multicasting bit.

    Destination Bit generation: The one-hot("oh" below) is sent to an OR Tree with [$clog2(NUM_OUTPUT_DATA)-1] level.
    oh[MSB]                       oh[LSB+1]oh[LSB]
       |   |     |   |  ...  |   |     |   |
       v   v     v   v  ...  v   v     v   v
       |¯¯¯|     |¯¯¯|  ...  |¯¯¯|     |¯¯¯|  ---> OR all odd number (LSB starts at 0) input ->the LSB dstination bit.
       |___|     |___|  ...  |___|     |___|
         v         v    ...    v         v
         |         |    ...    |         |
          \       /      ...    \       /
           \     /       ...     \     /
            v   v        ...      v   v
            |¯¯¯|        ...      |¯¯¯|       ---> OR all odd number (LSB starts at 0) input ->the LSB+1 dstination bit.
            |___|        ...      |___|
              v                     v
              |                     |
               \                   /
                ...              ...
                 ...           ...
                  ...        ...
                   |          |
                   v          v               ---> OR all odd number input (starts at 0) ->the MSB dstination bit.
            MSB of dst tag

    Intuitive Understanding:
         1. dst tag is the largest dst tag among all targets.
         2. multicasting depend on the length of the consecutive 1 -- add all 1 in the one-hot vector. assume all 1s are consecutive.

    Critical Path: the generation of the multicasting bit -- #$clog2(NUM_OUTPUT_DATA) level + 1 logic.

    Author:      Jianming Tong (jianming.tong@gatech.edu)
*/

// `define NUM_OUTPUT_4_NUM_INPUT_4
`define NUM_OUTPUT_8_NUM_INPUT_4

`ifdef NUM_OUTPUT_4_NUM_INPUT_4
module tb_multiple_one_hot2dst_tag_comb();

    parameter NUM_INPUT_DATA = 1;
    parameter NUM_OUTPUT_DATA = 4;
    parameter DATA_WIDTH = 8;
    localparam DST_TAG_WIDTH = 2; // Note: inner ceiling: e.g. $clog2(18) = 5, (2^5=32).
    localparam CMD_WIDTH_PER_DATA = DST_TAG_WIDTH*$clog2(NUM_OUTPUT_DATA); // Note: inner ceiling: e.g. $clog2(18) = 5, (2^5=32).

    // timing signals
    reg                                                clk;

    // interface
    reg   [NUM_INPUT_DATA-1:0]                         i_valid;
    reg   [NUM_INPUT_DATA*DATA_WIDTH-1:0]              i_data_bus;

    wire  [NUM_INPUT_DATA-1:0]                         o_valid;
    wire  [NUM_INPUT_DATA*DATA_WIDTH-1:0]              o_data_bus; //{o_data_a, o_data_b}

    reg                                                i_en;
    reg   [NUM_INPUT_DATA*NUM_OUTPUT_DATA-1:0]         i_cmd;

    wire  [NUM_INPUT_DATA*CMD_WIDTH_PER_DATA-1:0]      o_cmd;

    // inner logic
    integer i;
    initial begin
        i_en = 1'b1;
        i_valid = {NUM_INPUT_DATA{1'b1}};
        clk = 0;
        i_data_bus = {NUM_INPUT_DATA{8'b11111111}};
        // disable
        i_en = 1'b1;
        #20

        // enable
        // brute force test
        //    input one-hot dst  -> dst-tag contorl for unfolded butterfly
        //       unicasting
        //        4'b0001        -> {2'b00, 2'b00}
        //        4'b0010        -> {2'b00, 2'b01}
        //        4'b0100        -> {2'b01, 2'b00}
        //        4'b1000        -> {2'b01, 2'b01}
        //      multicasting
        //        4'b0011        -> {2'b00, 2'b11}
        //        4'b1100        -> {2'b01, 2'b11}
        //        4'b1111        -> {2'b11, 2'b11}
        //
        // Test in the reverse order.
        // case 1 broadcasting to all outputs
        i_cmd = {NUM_INPUT_DATA{4'b1111}};
        #20

        // case 2
        i_cmd = {NUM_INPUT_DATA{4'b1100}};
        #20

        // case 3
        i_cmd = {NUM_INPUT_DATA{4'b0011}};
        #20

        // case 4
        i_cmd = {NUM_INPUT_DATA{4'b1000}};
        #20

        // case 5
        i_cmd = {NUM_INPUT_DATA{4'b0100}};
        #20

        // case 6
        i_cmd = {NUM_INPUT_DATA{4'b0010}};
        #20

        // case 7
        i_cmd = {NUM_INPUT_DATA{4'b0001}};
        #20
        $stop;
    end


    // instantiate DUT (device under test)
    multiple_one_hot2dst_tag_comb#(
        .NUM_INPUT_DATA(NUM_INPUT_DATA),
        .DATA_WIDTH(DATA_WIDTH),
        .NUM_OUTPUT_DATA(NUM_OUTPUT_DATA),
        .DST_TAG_WIDTH(DST_TAG_WIDTH)
    ) dut(
        .i_valid(i_valid),
        .i_data_bus(i_data_bus),
        .o_valid(o_valid),
        .o_data_bus(o_data_bus),
        .i_en(i_en),
        .i_cmd(i_cmd),
        .o_cmd(o_cmd)
    );

    always #5 clk=~clk;


endmodule
`endif

`ifdef NUM_OUTPUT_8_NUM_INPUT_4
module tb_multiple_one_hot2dst_tag_comb();

    parameter NUM_INPUT_DATA = 4;
    parameter NUM_OUTPUT_DATA = 8;
    parameter DATA_WIDTH = 8;
    localparam DST_TAG_WIDTH = 2; // Note: inner ceiling: e.g. $clog2(18) = 5, (2^5=32).
    localparam CMD_WIDTH_PER_DATA = DST_TAG_WIDTH*$clog2(NUM_OUTPUT_DATA); // Note: inner ceiling: e.g. $clog2(18) = 5, (2^5=32).

    // timing signals
    reg                                                clk;

    // interface
    reg   [NUM_INPUT_DATA-1:0]                         i_valid;
    reg   [NUM_INPUT_DATA*DATA_WIDTH-1:0]              i_data_bus;

    wire  [NUM_INPUT_DATA-1:0]                         o_valid;
    wire  [NUM_INPUT_DATA*DATA_WIDTH-1:0]              o_data_bus; //{o_data_a, o_data_b}

    reg                                                i_en;
    reg   [NUM_INPUT_DATA*NUM_OUTPUT_DATA-1:0]         i_cmd;

    wire  [NUM_INPUT_DATA*CMD_WIDTH_PER_DATA-1:0]      o_cmd;

    // inner logic
    reg signed [DATA_WIDTH-1:0] i_data_bus_inner[NUM_INPUT_DATA-1:0];

    integer i;
    initial begin
        i_en = 1'b1;
        i_valid = {NUM_INPUT_DATA{1'b1}};
        clk = 0;
        i_data_bus = {NUM_INPUT_DATA{8'b11111111}};
        // disable
        i_en = 1'b0;
        #20

        // enable
        // brute force test
        //    input one-hot dst  -> dst-tag contorl for unfolded butterfly
        //      unicasting
        //      8'b00000001      ->                3'b000                -> {2'b00, 2'b00, 2'b00}
        //      8'b00000010      ->                3'b001                -> {2'b00, 2'b00, 2'b01}
        //      8'b00000100      ->                3'b010                -> {2'b00, 2'b10, 2'b00}
        //      8'b00001000      ->                3'b011                -> {2'b00, 2'b01, 2'b01}
        //      8'b00010000      ->                3'b100                -> {2'b01, 2'b00, 2'b00}
        //      8'b00100000      ->                3'b101                -> {2'b01, 2'b00, 2'b01}
        //      8'b01000000      ->                3'b110                -> {2'b01, 2'b01, 2'b00}
        //      8'b10000000      ->                3'b111                -> {2'b01, 2'b01, 2'b01}
        //
        //      multicasting
        //      8'b11000000      ->            3'b111,3'b110             -> {2'b01, 2'b01, 2'b11}
        //      8'b00110000      ->            3'b101,3'b100             -> {2'b01, 2'b00, 2'b11}
        //      8'b00001100      ->            3'b011,3'b010             -> {2'b00, 2'b01, 2'b11}
        //      8'b00000011      ->            3'b001,3'b000             -> {2'b00, 2'b00, 2'b11}
        //      8'b11110000      ->        3'b{111,110,101,100}          -> {2'b01, 2'b11, 2'b11}
        //      8'b00001111      ->        3'b{011,010,001,000}          -> {2'b00, 2'b11, 2'b11}
        //      8'b11111111      -> 3'b{111,110,101,100,011,010,001,000} -> {2'b11, 2'b11, 2'b11}
        //
        // Test in the reverse order.
        // case 1 broadcasting to all outputs
        i_en = 1'b1;
        i_cmd = {NUM_INPUT_DATA{8'b11111111}};
        #20

        // case 2
        i_cmd = {NUM_INPUT_DATA{8'b11110000}};
        #20

        // case 3
        i_cmd = {NUM_INPUT_DATA{8'b00001111}};
        #20

        // case 4
        i_cmd = {NUM_INPUT_DATA{8'b11000000}};
        #20

        // case 5
        i_cmd = {NUM_INPUT_DATA{8'b00110000}};
        #20

        // case 6
        i_cmd = {NUM_INPUT_DATA{8'b00001100}};
        #20

        // case 7
        i_cmd = {NUM_INPUT_DATA{8'b00000011}};
        #20

        // case 8
        i_cmd = {NUM_INPUT_DATA{8'b10000000}};
        #20

        // case 9
        i_cmd = {NUM_INPUT_DATA{8'b01000000}};
        #20

        // case 10
        i_cmd = {NUM_INPUT_DATA{8'b00100000}};
        #20

        // case 11
        i_cmd = {NUM_INPUT_DATA{8'b00010000}};
        #20

        // case 12
        i_cmd = {NUM_INPUT_DATA{8'b00001000}};
        #20

        // case 13
        i_cmd = {NUM_INPUT_DATA{8'b00000100}};
        #20

        // case 14
        i_cmd = {NUM_INPUT_DATA{8'b00000010}};
        #20

        // case 15
        i_cmd = {NUM_INPUT_DATA{8'b00000001}};
        #20
        $stop;
    end


    // instantiate DUT (device under test)
    multiple_one_hot2dst_tag_comb#(
        .NUM_INPUT_DATA(NUM_INPUT_DATA),
        .DATA_WIDTH(DATA_WIDTH),
        .NUM_OUTPUT_DATA(NUM_OUTPUT_DATA),
        .DST_TAG_WIDTH(DST_TAG_WIDTH)
    ) dut(
        .i_valid(i_valid),
        .i_data_bus(i_data_bus),
        .o_valid(o_valid),
        .o_data_bus(o_data_bus),
        .i_en(i_en),
        .i_cmd(i_cmd),
        .o_cmd(o_cmd)
    );

    always #5 clk=~clk;

endmodule
`endif