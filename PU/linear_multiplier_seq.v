`timescale 1ns / 1ps
/////////////////////////////////////////////////////////////
// Top Module:  linear_multiplier_seq
// Data:        Only data width matters.
// Format:      keeping the input format unchange
// Timing:      Sequential Logic, each switch takes one clock cycle
//              Different nodes have different latency.
//              i-th Node has i-cycle latency.
// Dummy Data:  {DATA_WIDTH{1'b0}}
// 
// Function:    Unicast  or  Multicast(arbitrary Multicast)
//
// [0+:DATA_WIDTH]
// i_data_bus & i_valid  i_data_bus & i_valid       i_data_bus & i_valid
//     |                       |
//     v                       v        
//   |¯¯¯|------------------>|¯¯¯|-------> ... ----------->|¯¯¯|--> i_data_bus & i_valid
//   |___|------------------>|___|-------> ... ----------->|___|--> i_dest[N-4:0]     
//     |                       |                             |    
//     v                       v                             v                       v
// o_data_bus                 ...                       o_data_bus
// [0*DATA_WIDTH+:DATA_WIDTH]     [1*DATA_WIDTH+:DATA_WIDTH]    [2*DATA_WIDTH+:DATA_WIDTH]
//
// Control:
// Each stage takes one destination bit. 
// If destination bit is set high, pass input port to the 
//     
// Author:      Jianming Tong (jianming.tong@gatech.edu)
/////////////////////////////////////////////////////////////


module linear_multiplier_seq#(
	parameter DATA_WIDTH = 32,     // could be arbitrary number
	parameter NUM_NODE = 4,        // could be arbitrary integer.
	parameter NUM_NODE = 4         // could be arbitrary integer.
)(
    // data signals
	clk,
	rst,
	
	i_valid,        // valid input data signal
	i_data_bus,     // input data bus coming into distribute switch
	
	o_valid,        // output valid
    o_data_bus,     // output data 

	// control signals
	i_en,           // distribute switch enable
	i_cmd           // command 
);



endmodule