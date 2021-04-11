`timescale 1ns / 1ps
/////////////////////////////////////////////////////////////
// Top Module:  multiple_one_hot2dst_tag_comb
// Data:        Only data width matters.
// Format:      keeping the input format unchange
// Timing:      Combinational Logic
// Latency:     Total latency = processing delay of an single control
// Dummy Data:  {DATA_WIDTH{1'b0}}
// 
// Function:    Expand input destination tags to support multicasting.
//              Each i_cmd of a single data will be converted as followes.
// Example:     4 output data in total -> 4-bit one hots -> 2log2(4) = 4-bit dst-tag control, each switch consume 2 bit dst tags. 
//    input one-hot dst  ->           multiple dst-tags          -> dst-tag contorl for unfolded butterfly     
//       unicasting
//        4'b0001        ->                 2'b00                -> {2'b00, 2'b00}
//        4'b0010        ->                 2'b01                -> {2'b00, 2'b01}
//        4'b0100        ->                 2'b10                -> {2'b01, 2'b00}
//        4'b1000        ->                 2'b11                -> {2'b01, 2'b01}
//      multicasting  
//        4'b0011        ->               2'b00,2'b01            -> {2'b00, 2'b11}
//        4'b1100        ->               2'b11,2'b10            -> {2'b01, 2'b11}
//        4'b1111        ->        2'b00,2'b01,2'b10,2'b11       -> {2'b11, 2'b11}
//
// Example:     8 output data in total -> 8-bit one hots -> 2log2(8) = 6-bit dst-tag control, each switch consume 2 bit dst tags. 
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
// Illustartion: the above logic will be wrapped as a blackbox with the name as one_hot2dst_tag_comb in the following figure.
//          
//
//
// i_data_bus                                                  -->          latch          -->   o_data_bus
// i_cmd[0*NUM_OUTPUT_DATA+:NUM_OUTPUT_DATA]                   -->   one_hot2dst_tag_comb  -->   o_cmd[0*CMD_WIDTH_PER_DATA+:CMD_WIDTH_PER_DATA]
// i_cmd[1*NUM_OUTPUT_DATA+:NUM_OUTPUT_DATA]                   -->   one_hot2dst_tag_comb  -->   o_cmd[1*CMD_WIDTH_PER_DATA+:CMD_WIDTH_PER_DATA]
// i_cmd[2*NUM_OUTPUT_DATA+:NUM_OUTPUT_DATA]                   -->   one_hot2dst_tag_comb  -->   o_cmd[2*CMD_WIDTH_PER_DATA+:CMD_WIDTH_PER_DATA]
// i_cmd[3*NUM_OUTPUT_DATA+:NUM_OUTPUT_DATA]                   -->   one_hot2dst_tag_comb  -->   o_cmd[3*CMD_WIDTH_PER_DATA+:CMD_WIDTH_PER_DATA]
// i_cmd[6*NUM_OUTPUT_DATA+:NUM_OUTPUT_DATA]                   -->   one_hot2dst_tag_comb  -->   o_cmd[4*CMD_WIDTH_PER_DATA+:CMD_WIDTH_PER_DATA]
//                  ...   
// i_cmd[63*NUM_OUTPUT_DATA+:NUM_OUTPUT_DATA]                  -->   one_hot2dst_tag_comb  -->   o_cmd[63*CMD_WIDTH_PER_DATA+:CMD_WIDTH_PER_DATA]
//
// Note: parameter "CMD_WIDTH_PER_DATA" indicates the width of bits in length.
// Critical Path: the generation of the multicasting bit for i_cmd[i*NUM_OUTPUT_DATA+:NUM_OUTPUT_DATA]
//                of a single data -- #$clog2(NUM_OUTPUT_DATA) level + 1 logic.
//
// Author:      Jianming Tong (jianming.tong@gatech.edu)
/////////////////////////////////////////////////////////////

module multiple_one_hot2dst_tag_comb#(
	parameter DATA_WIDTH = 32,     // could be arbitrary number
	parameter NUM_INPUT_DATA = 4,  // must be 2^n
	parameter NUM_OUTPUT_DATA = 8, // must be 2^n
	parameter DST_TAG_WIDTH = 2  // length of the destination tag consumed per data per stage.
)(
	// timeing signals
	clk,
	rst,

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

	// interface
    input                                              clk;
    input                                              rst;

	input  [NUM_INPUT_DATA-1:0]                        i_valid;             
	input  [NUM_INPUT_DATA*DATA_WIDTH-1:0]             i_data_bus;

	output [NUM_INPUT_DATA-1:0]                        o_valid;             
	output [NUM_INPUT_DATA*DATA_WIDTH-1:0]             o_data_bus; //{o_data_a, o_data_b}

	input                                              i_en;
	input  [NUM_INPUT_DATA*NUM_OUTPUT_DATA-1:0]        i_cmd;
	output [NUM_INPUT_DATA*CMD_WIDTH_PER_DATA-1:0]     o_cmd;

    genvar i;      
	generate
    for (i =0; i< NUM_INPUT_DATA; i=i+1)
    begin: one_hot2dst_tag_comb_gen
        one_hot2dst_tag_comb#(
            .NUM_INPUT_DATA(1'b1), 
            .DATA_WIDTH(DATA_WIDTH),
            .NUM_OUTPUT_DATA(NUM_OUTPUT_DATA),
            .DST_TAG_WIDTH(DST_TAG_WIDTH)
        ) i_single_data(
            .i_valid(i_valid[i]),
            .i_data_bus(i_data_bus[i*DATA_WIDTH+:DATA_WIDTH]),
            .o_valid(o_valid[i]),
            .o_data_bus(o_data_bus[i*DATA_WIDTH+:DATA_WIDTH]),
            .i_en(i_en),
            .i_cmd(i_cmd[i*NUM_OUTPUT_DATA+:NUM_OUTPUT_DATA]),
            .o_cmd(o_cmd[i*CMD_WIDTH_PER_DATA+:CMD_WIDTH_PER_DATA])
        );
    end
    endgenerate

endmodule
