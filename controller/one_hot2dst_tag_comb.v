`timescale 1ns / 1ps
/*
    Top Module:  one_hot2dst_tag_comb
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
            |¯¯¯|        ...      |¯¯¯|       ---> OR all inputs of this level -> the LSB multicasting bit.
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
                       |¯¯¯|                  ---> OR all iuputs of this level -> the MSB-1 multicasting bit.
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

module one_hot2dst_tag_comb#(
    parameter DATA_WIDTH = 32,     // could be arbitrary number
    parameter NUM_INPUT_DATA = 1,  // must be 2^n
    parameter NUM_OUTPUT_DATA = 8, // must be 2^n
    parameter DST_TAG_WIDTH = 2  // length of the destination tag consumed per data per stage.
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
    i_en,           // distribute switch enable.
    i_cmd,          // Input one-hot command.
    o_cmd           // output destination tag command.
);
    // parameter
    localparam CMD_WIDTH_PER_DATA = DST_TAG_WIDTH*$clog2(NUM_OUTPUT_DATA); // Note: inner ceiling: e.g. $clog2(18) = 5, (2^5=32).
    localparam DST_TAG_PER_DATA = $clog2(NUM_OUTPUT_DATA); // Note: inner ceiling: e.g. $clog2(18) = 5, (2^5=32).
    localparam MULTICAST_TAG_PER_DATA = $clog2(NUM_OUTPUT_DATA); // Note: inner ceiling: e.g. $clog2(18) = 5, (2^5=32).
    localparam NUM_LEVEL = $clog2(NUM_OUTPUT_DATA); // Note: inner ceiling: e.g. $clog2(18) = 5, (2^5=32).

    // interface
    input                                        clk;
    input                                        rst_n;

    input  [NUM_INPUT_DATA-1:0]                  i_valid;
    input  [NUM_INPUT_DATA*DATA_WIDTH-1:0]       i_data_bus;

    output [NUM_INPUT_DATA-1:0]                  o_valid;
    output [NUM_INPUT_DATA*DATA_WIDTH-1:0]       o_data_bus; //{o_data_a, o_data_b}

    input                                        i_en;
    input  [NUM_OUTPUT_DATA-1:0]                 i_cmd;
    output [CMD_WIDTH_PER_DATA-1:0]              o_cmd;

    // inner logic
    reg    [NUM_INPUT_DATA-1:0]                  o_valid_reg;
    reg    [NUM_INPUT_DATA*DATA_WIDTH-1:0]       o_data_bus_reg;

    // ---- destination tag bit generation.
    wire   [MULTICAST_TAG_PER_DATA-1:0]          dst_tag_valid;
    wire                                         dst_tag_done;

    genvar i,j;
    generate
    for (i =0; i< NUM_LEVEL+1; i=i+1)
    begin: OR_Tree_level
        // calculate # of switch in level i
        // non power of 2 version is also taken into consideration
        localparam NUM_GATE_SHIFT =  NUM_OUTPUT_DATA >> i;
        localparam NOT_ADD_EXTRA_SWITCH_THIS_LEVEL = ((NUM_OUTPUT_DATA - ((NUM_OUTPUT_DATA >> i) << i)) == 0);
        localparam NUM_GATE_LEVEL = (NOT_ADD_EXTRA_SWITCH_THIS_LEVEL)? NUM_GATE_SHIFT: (NUM_GATE_SHIFT + 1);

        // define the output wire for switches of level i
        reg      [NUM_GATE_LEVEL-1:0]         i_cmd_latch;
        reg      [NUM_GATE_LEVEL-1:0]         i_valid_latch;
    end

    for (i =0; i< NUM_LEVEL; i=i+1)
    begin: OR_Tree_odd_num_level
        localparam NUM_GATE_LEVEL_HALF =  OR_Tree_level[i].NUM_GATE_LEVEL >> 1;

        wire     [NUM_GATE_LEVEL_HALF-1:0]    i_data_odd_wire;
        wire     [NUM_GATE_LEVEL_HALF-1:0]    i_valid_odd_wire;
    end

    // connect i_data_bus to input of OR_gate tree.
    for (j = 0; j< NUM_OUTPUT_DATA; j=j+1)
    begin: assign_first_stage_wire_or_tree
        always@(*)
        begin
            OR_Tree_level[0].i_cmd_latch[j] = i_cmd[j];
            OR_Tree_level[0].i_valid_latch[j] = i_valid;
        end
    end

    //instantiate OR_gate tree
    for (i = 0; i< NUM_LEVEL; i=i+1)
    begin: OR_tree_level
        for (j = 0; j< OR_Tree_level[i+1].NUM_GATE_LEVEL; j=j+1)
        begin: OR_gate_in_level
            if( j==(OR_Tree_level[i+1].NUM_GATE_LEVEL -1) && ((OR_Tree_level[i].NUM_GATE_LEVEL >> 1) != OR_Tree_level[i+1].NUM_GATE_LEVEL) )
            begin
                always@(*)
                begin:OR_GATE_edge
                    if(OR_Tree_level[i].i_valid_latch[2*j])
                    begin
                        OR_Tree_level[i+1].i_valid_latch[j] = 1'b1;
                        OR_Tree_level[i+1].i_cmd_latch[j] = OR_Tree_level[i].i_cmd_latch[2*j];
                    end
                    else
                    begin
                        OR_Tree_level[i+1].i_valid_latch[j] = 1'b0;
                        OR_Tree_level[i+1].i_cmd_latch[j] = 1'b0;
                    end
                end
            end
            else
            begin
                always@(*)
                begin:OR_GATE
                    if(OR_Tree_level[i].i_valid_latch[2*j+1] & OR_Tree_level[i].i_valid_latch[2*j])
                    begin
                        OR_Tree_level[i+1].i_valid_latch[j] = 1'b1;
                        OR_Tree_level[i+1].i_cmd_latch[j] = OR_Tree_level[i].i_cmd_latch[2*j+1] | OR_Tree_level[i].i_cmd_latch[2*j];
                    end
                    else
                    begin
                        OR_Tree_level[i+1].i_valid_latch[j] = 1'b0;
                        OR_Tree_level[i+1].i_cmd_latch[j] = 1'b0;
                    end
                end
            end
        end
    end

    for (i = 0; i< NUM_LEVEL; i=i+1)
    begin: OR_tree_level_odd_num
        for (j = 0; j< OR_Tree_odd_num_level[i].NUM_GATE_LEVEL_HALF; j=j+1)
        begin: OR_gate_in_level_odd_num
            assign OR_Tree_odd_num_level[i].i_data_odd_wire[j] =  OR_Tree_level[i].i_cmd_latch[2*j+1];
            assign OR_Tree_odd_num_level[i].i_valid_odd_wire[j] =  OR_Tree_level[i].i_valid_latch[2*j+1];
        end
    end

    for (i=0; i<NUM_LEVEL;i=i+1)
    begin:dst_tag_gen
        localparam NUM_GATE_SHIFT =  NUM_INPUT_DATA >> i;

        or_tree_comb#(
            .NUM_INPUT_DATA(OR_Tree_odd_num_level[i].NUM_GATE_LEVEL_HALF),
            .DATA_WIDTH(1))
        dst_bit(
            .i_valid(OR_Tree_odd_num_level[i].i_valid_odd_wire),
            .i_data_bus(OR_Tree_odd_num_level[i].i_data_odd_wire),
            .o_valid(dst_tag_valid[i]),
            .o_data_bus(o_cmd[i*DST_TAG_WIDTH]),
            .i_en(i_en)
        );
    end
    endgenerate

    or_tree_comb#(
        .NUM_INPUT_DATA(DST_TAG_PER_DATA),
        .DATA_WIDTH(1))
    dst_tag_finish_detection(
        .i_valid(dst_tag_valid),
        .i_data_bus({DST_TAG_PER_DATA{1'b1}}),
        .o_valid(dst_tag_done), // dst_tag_done indicates dst tag of o_cmd has been successfully generated.
        .o_data_bus(),
        .i_en(i_en)
    );

    // ---- multicasting bit generation.
    wire   [MULTICAST_TAG_PER_DATA-1:0]          multicast_valid;
    wire                                         multicast_done;

    // define output wire for all switches of different level.
    generate
    for (i =0; i< NUM_LEVEL+1; i=i+1)
    begin: AND_Tree_level
        // calculate # of switch in level i
        // non power of 2 version is also taken into consideration
        localparam NUM_GATE_SHIFT =  NUM_OUTPUT_DATA >> i;
        localparam NOT_ADD_EXTRA_SWITCH_THIS_LEVEL = ((NUM_OUTPUT_DATA - ((NUM_OUTPUT_DATA >> i) << i)) == 0);
        localparam NUM_GATE_LEVEL = (NOT_ADD_EXTRA_SWITCH_THIS_LEVEL)? NUM_GATE_SHIFT: (NUM_GATE_SHIFT + 1);

        // define the output wire for switches of level i
        reg  [NUM_GATE_LEVEL-1:0]              i_cmd_latch;
        reg  [NUM_GATE_LEVEL-1:0]              i_valid_latch;
    end

    // connect i_data_bus to input of AND_gate tree.
    for (j = 0; j< NUM_OUTPUT_DATA; j=j+1)
    begin: assign_first_stage_wire_and_tree
        always@(*)
        begin
            AND_Tree_level[0].i_cmd_latch[j] = i_cmd[j];
            AND_Tree_level[0].i_valid_latch[j] = i_valid;
        end
    end

    //instantiate AND_gate tree
    for (i = 0; i< NUM_LEVEL; i=i+1)
    begin: AND_tree_level
        for (j = 0; j< AND_Tree_level[i+1].NUM_GATE_LEVEL; j=j+1)
        begin: AND_gate_in_level
            if( j==(AND_Tree_level[i+1].NUM_GATE_LEVEL -1) && ((AND_Tree_level[i].NUM_GATE_LEVEL >> 1) != AND_Tree_level[i+1].NUM_GATE_LEVEL) )
            begin
                always@(*)
                begin:AND_GATE_edge
                    if(AND_Tree_level[i].i_valid_latch[2*j])
                    begin
                        AND_Tree_level[i+1].i_valid_latch[j] = 1'b1;
                        AND_Tree_level[i+1].i_cmd_latch[j] = AND_Tree_level[i].i_cmd_latch[2*j];
                    end
                    else
                    begin
                        AND_Tree_level[i+1].i_valid_latch[j] = 1'b0;
                        AND_Tree_level[i+1].i_cmd_latch[j] = 1'b0;
                    end
                end
            end
            else
            begin
                always@(*)
                begin:AND_GATE
                    if(AND_Tree_level[i].i_valid_latch[2*j+1] & AND_Tree_level[i].i_valid_latch[2*j])
                    begin
                        AND_Tree_level[i+1].i_valid_latch[j] = 1'b1;
                        AND_Tree_level[i+1].i_cmd_latch[j] = AND_Tree_level[i].i_cmd_latch[2*j+1] & AND_Tree_level[i].i_cmd_latch[2*j];
                    end
                    else
                    begin
                        AND_Tree_level[i+1].i_valid_latch[j] = 1'b0;
                        AND_Tree_level[i+1].i_cmd_latch[j] = 1'b0;
                    end
                end
            end
        end
    end

    for (i=0; i<NUM_LEVEL;i=i+1)
    begin:multicast_bit_gen
        or_tree_comb#(
            .NUM_INPUT_DATA(AND_Tree_level[i+1].NUM_GATE_LEVEL),
            .DATA_WIDTH(1))
        multicast_bit(
            .i_valid(AND_Tree_level[i+1].i_valid_latch),
            .i_data_bus(AND_Tree_level[i+1].i_cmd_latch),
            .o_valid(multicast_valid[i]),
            .o_data_bus(o_cmd[i*DST_TAG_WIDTH+1]),
            .i_en(i_en)
        );
    end
    endgenerate

    and_tree_comb#(
        .NUM_INPUT_DATA(MULTICAST_TAG_PER_DATA),
        .DATA_WIDTH(1))
    multicast_finish_detection(
        .i_valid(multicast_valid),
        .i_data_bus({MULTICAST_TAG_PER_DATA{1'b1}}),
        .o_valid(multicast_done), // multicast_done indicates multicasting tag of o_cmd has been successfully generated.
        .o_data_bus(),
        .i_en(i_en)
    );

    // i_data latch
    always@(*)
    begin
        if(i_en && multicast_done && dst_tag_done)
        begin
            o_valid_reg = i_valid;
            o_data_bus_reg = i_data_bus;
        end
    end

    assign o_valid = o_valid_reg;
    assign o_data_bus = o_data_bus_reg;
endmodule
