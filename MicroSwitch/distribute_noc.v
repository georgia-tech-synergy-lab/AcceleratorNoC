`timescale 1ns / 1ps
/////////////////////////////////////////////////////////////
// Top Module:  distribute_noc
// Data:        Only data width matters.
// Format:      keeping the input format unchange
// Timing:      Sequential Logic
// Reset:       Synchronized Reset [High Reset]
// Pipeline:    For benes constructed with sequential switches, every stage is a pipeline stage
//              Total latency = # stages (cycle)  
// Dummy Data:  {DATA_WIDTH{1'b0}}
// 
// Function:    Unicast  or  Multicast(Not arbitrary Multicast)
//   
//     i_data_bus[0*DATA_WIDTH+:DATA_WIDTH]  -->|¯¯¯|-------->|¯¯¯|------->|¯¯¯|------->|¯¯¯|-------->|¯¯¯|-->
//     i_data_bus[1*DATA_WIDTH+:DATA_WIDTH]  -->|___|-\ /---->|___|--\ /-->|___|--\ /-->|___|----\ /->|___|-->
//                                                     X              X            X              X
//     i_data_bus[2*DATA_WIDTH+:DATA_WIDTH]  -->|¯¯¯|-/ \/--->|¯¯¯|--/ \-->|¯¯¯|--/ \-->|¯¯¯|---\/ \->|¯¯¯|-->
//     i_data_bus[3*DATA_WIDTH+:DATA_WIDTH]  -->|___|-\ /\ /->|___|------->|___|------->|___|-\ /\ /->|___|-->
//                                                     X  X                                    X  X
//     i_data_bus[4*DATA_WIDTH+:DATA_WIDTH]  -->|¯¯¯|-/ \/ \->|¯¯¯|------->|¯¯¯|------->|¯¯¯|-/ \/ \->|¯¯¯|-->
//     i_data_bus[5*DATA_WIDTH+:DATA_WIDTH]  -->|___|-\ /\--->|___|--\ /-->|___|--\ /-->|___|---/\ /->|___|-->
//                                                     X              X            X              X 
//     i_data_bus[6*DATA_WIDTH+:DATA_WIDTH]  -->|¯¯¯|-/ \---->|¯¯¯|--/ \-->|¯¯¯|--/ \-->|¯¯¯|----/ \->|¯¯¯|-->
//     i_data_bus[7*DATA_WIDTH+:DATA_WIDTH]  -->|___|-------->|___|------->|___|------->|___|-------->|___|-->
//          
// Control Signal
//     i_valid[0]-->|¯¯¯|<--i_cmd[2:0] 
//     i_valid[1]-->|___|
//     
// Author:      Jianming Tong (jianming.tong@gatech.edu)
/////////////////////////////////////////////////////////////


module distribute_noc#(
	parameter DATA_WIDTH = 32,    // could be arbitrary number
	parameter NUM_DATA_IN = 8,    // multiple be 2^n
    parameter NUM_DATA_OUT = 4,   // one-hot 
    parameter COMMMAND_WIDTH = NUM_DATA_OUT // one-hot -> need to translated to dst tag inside the module
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
	i_en,           // distribute switch enable
	i_cmd           // dst_tag 
);

	// interface
	input                                                      clk;
	input                                                      rst;
	
	input  [NUM_INPUT_DATA-1:0]                                i_valid;             
	input  [WIDTH_INPUT_DATA-1:0]                              i_data_bus;
	
	output [NUM_INPUT_DATA-1:0]                                o_valid;             
	output [WIDTH_INPUT_DATA-1:0]                              o_data_bus; //{o_data_a, o_data_b}

	input                                                      i_en;
	input  [NUM_DATA_IN*COMMMAND_WIDTH-1:0]                    i_cmd;
