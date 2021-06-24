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
// Function:   1-D Multiplier with forwarding links to reuse the input data.
//
// [0+:DATA_WIDTH]                          [(NUM_NODE-1)*DATA_WIDTH+:DATA_WIDTH]
// i_data_bus & i_valid       ...                    i_data_bus & i_valid
//     |                       |                             |
//     v                       v                             v
//   |¯¯¯|o_fwd_bus&valid    |¯¯¯|o_fwd_bus&valid          |¯¯¯| 
//   |___|--->-------------->|___|-------> ... ----------->|___|     
//     |       i_fwd_bus&valid |            i_fwd_bus&valid  |    
//     v                       v                             v
// o_data_bus                 ...                       o_data_bus
// [0*DATA_WIDTH+:DATA_WIDTH]                    [(NUM_NODE-1)*DATA_WIDTH+:DATA_WIDTH]
//
// Control:(two parts)
// 1. Each Multiplier takes 4-bit control for functionalities
// 2. Each Multiplier takes $clog2(DATA_WIDTH) bits for selecting bits from 2*DATA_WIDTH (result of multiplication)  
//     
// Author:      Jianming Tong (jianming.tong@gatech.edu)
/////////////////////////////////////////////////////////////


module linear_multiplier_seq#(
	parameter DATA_WIDTH = 32,                           // could be arbitrary number
	parameter NUM_NODE = 4,                              // could be arbitrary integer.
	parameter COMMAND_WIDTH = 4 + $clog2(DATA_WIDTH)     // total number of bits for a single multiplier
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

	localparam WIDTH_INPUT_DATA = NUM_NODE * DATA_WIDTH;
	localparam WIDTH_OUTPUT_DATA = NUM_NODE * DATA_WIDTH;
	localparam TOTAL_COMMAND_WIDTH = NUM_NODE * COMMAND_WIDTH;
    
	localparam WIDTH_FWD_DATA = (NUM_NODE-1)* DATA_WIDTH;

	// data signals
	input                                clk;
	input                                rst;
	
	input  [WIDTH_INPUT_DATA-1:0]        i_data_bus;
	input  [NUM_NODE-1:0]                i_valid;

	output [WIDTH_OUTPUT_DATA-1:0]       o_data_bus;
	output [NUM_NODE-1:0]                o_valid;

	input                                i_en;
	input  [TOTAL_COMMAND_WIDTH-1:0]     i_cmd;

	// inner var definition
	wire   [DATA_WIDTH-1:0]              fwd_data_bus[0:NUM_NODE-1];
	wire                                 fwd_valid_bus[0:NUM_NODE-1];

	genvar i;
	generate
		for(i=0; i<NUM_NODE; i=i+1)
		begin:node_id
			if(i==0)
			begin:first_node
				multiplier_first_seq#(
					.DATA_WIDTH(DATA_WIDTH),                  // could be arbitrary number
					.COMMAND_WIDTH(COMMAND_WIDTH)             // total input command bits.
				) first_mul (
					.clk(clk),
					.rst(rst),
					.i_valid(i_valid[0]),                     // valid input data signal
					.i_data_bus(i_data_bus[0+:DATA_WIDTH]),   // input data
					.o_valid(o_valid[0]),                     // output valid
					.o_data_bus(o_data_bus[0+:DATA_WIDTH]),   // output data 
					.o_fwd_valid(fwd_valid_bus[0]),           // output valid forward data signal
					.o_fwd_bus(fwd_data_bus[0]),              // output data forward output to neighbor multiplier
					.i_en(i_en),                              // distribute switch enable
					.i_cmd(i_cmd[0+:COMMAND_WIDTH])           // command 
				);
			end
			else
			begin:following_nodes
				if(i==NUM_NODE-1)
				begin:last_node
					multiplier_last_seq#(
						.DATA_WIDTH(DATA_WIDTH),                                        // could be arbitrary number
						.COMMAND_WIDTH(COMMAND_WIDTH)                                   // total input command bits.
					) last_node (
						.clk(clk),
						.rst(rst),
						.i_valid(i_valid[NUM_NODE-1]),                                  // valid input data signal
						.i_data_bus(i_data_bus[(NUM_NODE-1)*DATA_WIDTH+:DATA_WIDTH]),   // input data
						.i_fwd_valid(fwd_valid_bus[NUM_NODE-2]),                        // valid forward data signal
						.i_fwd_bus(fwd_data_bus[NUM_NODE-2]),                           // data forward input from neighbor multiplier
						.o_valid(o_valid[NUM_NODE-1]),                                  // output valid
						.o_data_bus(o_data_bus[(NUM_NODE-1)*DATA_WIDTH+:DATA_WIDTH]),   // output data 
						.i_en(i_en),                                                    // distribute switch enable
						.i_cmd(i_cmd[(NUM_NODE-1)*COMMAND_WIDTH+:COMMAND_WIDTH])        // command 
					);
				end
				else
				begin:middle_node
					multiplier_seq#(
						.DATA_WIDTH(DATA_WIDTH),                               // could be arbitrary number
						.COMMAND_WIDTH(COMMAND_WIDTH)                          // total input command bits.
					) middle_node (
						.clk(clk),
						.rst(rst),
						.i_valid(i_valid[i]),                                  // valid input data signal
						.i_data_bus(i_data_bus[i*DATA_WIDTH+:DATA_WIDTH]),     // input data
						.i_fwd_valid(fwd_valid_bus[i-1]),                      // valid forward data signal
						.i_fwd_bus(fwd_data_bus[i-1]),                         // data forward input from neighbor multiplier
						.o_valid(o_valid[i]),                                  // output valid
						.o_data_bus(o_data_bus[i*DATA_WIDTH+:DATA_WIDTH]),     // output data 
						.o_fwd_valid(fwd_valid_bus[i]),                        // output valid forward data signal
						.o_fwd_bus(fwd_data_bus[i]),                           // output data forward output to neighbor multiplier
						.i_en(i_en),                                           // distribute switch enable
						.i_cmd(i_cmd[i*COMMAND_WIDTH+:COMMAND_WIDTH])          // command 
					);
				end
			end	
		end		
	endgenerate

endmodule