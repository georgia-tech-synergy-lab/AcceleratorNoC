`timescale 1ns / 1ps
/////////////////////////////////////////////////////////////
// Top Module:  merge_2x1_comb
// Data:        Only data width matters.
// Format:      keeping the input format unchange
// Function:                Branch Low                                    Branch High                                       
// 
//       i_data_bus(high)          i_data_bus(low)      i_data_bus(high)          i_data_bus(low)       
//    [DATA_WIDTH+:DATA_WIDTH]    [DATA_WIDTH-1:0]    [DATA_WIDTH+:DATA_WIDTH]    [DATA_WIDTH-1:0]      
//                           \     /                                       \     /                                 
//                            v   v                                         v   v                             
//                           |¯¯¯¯¯|                                       |¯¯¯¯¯|                                
//                           |_____| <--- i_cmd                            |_____| <--- i_cmd                 
//                              |                                             |
//                              v                                             v                                                   
//                          i_data_bus(low)                             i_data_bus(high)                      
//
//       o_data_high = o_data_bus[2*DATA_WIDTH-1: DATA_WIDTH]
//       o_data_low  = o_data_bus[DATA_WIDTH-1: 0]
//
// Author:      Jianming Tong (jianming.tong@gatech.edu)
/////////////////////////////////////////////////////////////


module merge_2x1_comb#(
	parameter DATA_WIDTH = 32,
	parameter COMMMAND_WIDTH = 1 // todo 
)(
    // data signals
	i_valid,        // valid input data signal
	i_data_bus,     // input data bus coming into distribute switch
	
	o_valid,        // output valid
    o_data_bus,     // output data 

	// control signals
	i_en,           // distribute switch enable
	i_cmd           // command 
);
	// interface
	input  [1:0]                i_valid;             
	input  [2*DATA_WIDTH-1:0]   i_data_bus;
	
	output [1:0]                o_valid;             
	output [DATA_WIDTH-1:0]     o_data_bus;
	    
	input                       i_en;
	input  [COMMMAND_WIDTH-1:0] i_cmd;
		// 0 --> Branch Low
		// 1 --> Branch High
	
	mux_2x1_seq_comb #(
		.DATA_WIDTH(DATA_WIDTH),
		.COMMMAND_WIDTH(COMMMAND_WIDTH)
	)data_mux(
		.i_valid(i_valid),
		.i_data_bus(i_data_bus),
		.o_valid(o_valid),
		.o_data_bus(o_data_bus),
		.i_en(i_en),
		.i_cmd(i_cmd)
	);


endmodule