`timescale 1ns / 1ps
/////////////////////////////////////////////////////////////
// Top Module:  dst_tag_expand4multicast_comb
// Data:        Only data width matters.
// Format:      keeping the input format unchange
// Timing:      Combinational Logic
// Latency:     Total latency = processing delay of an single control
// Dummy Data:  {DATA_WIDTH{1'b0}}
// 
// Function:    Expand input destination tags to support multicasting.
//           
//              2'b00 -> {2'b01, 2'b01}
//              2'b01 -> {2'b01, 2'b10}
//              2'b10 -> {2'b10, 2'b01}
//              2'b11 -> {2'b10, 2'b10}
//              2'bx1 -> {2'b11, 2'b10}
//              2'b1x -> {2'b10, 2'b11}
//              2'bx0 -> {2'b11, 2'b00}
//              2'b0x -> {2'b00, 2'b11}
//              2'bzz -> {2'b00, 2'b00}
//              2'bz1 -> {2'b00, 2'b10}
//              2'b1z -> {2'b10, 2'b00}
//              2'bz0 -> {2'b00, 2'b01}
//              2'b0z -> {2'b01, 2'b00}
//
// Control Signal
//     i_valid[0]-->|¯¯¯|<--i_cmd[2:0] 
//     i_valid[1]-->|___|
//     
// Author:      Jianming Tong (jianming.tong@gatech.edu)
/////////////////////////////////////////////////////////////

module dst_tag_expand4multicast_comb#(
	parameter DATA_WIDTH = 32,     // could be arbitrary number
	parameter NUM_INPUT_DATA = 8,  // must be 2^n
	parameter NUM_OUTPUT_DATA = 4, // must be 2^n
	parameter DESTINATION_TAG_WIDTH = 2  // length of the destination tag consumed per data per stage.
)(
	// timeing signals
	clk,
	
    // data signals
	i_valid,        // valid input data signal
	i_data_bus,     // input data bus coming into distribute switch
	
	o_valid,        // output valid
    o_data_bus,     // output data 

	// control signals
	i_en,           // distribute switch enable
	i_cmd           // !Note: The control here should be the index of destination in binary.
	                // Each input data has its own destination tag.
);


endmodule