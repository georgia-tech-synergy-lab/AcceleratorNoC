`timescale 1ns / 1ps
/////////////////////////////////////////////////////////////
// Top Module:  crossbar_one_hot_comb
// Data:        Only data width matters.
// Format:      keeping the input format unchange
// Timing:      Combinational Logic
// Dummy Data:  {DATA_WIDTH{1'b0}}
// Command:     Each data comes with a NUM_OUTPUT_DATA-bit one-hot destination command.
//              i_data_bus[0*DATA_WIDTH+:DATA_WIDTH] is corresponding to i_cmd
// Function:    Arbitrary Unicast  or  Arbitrary Multicast
// Note: this file is not parameterizable.
// 
// Example: A 5:4 crossbar. For a single cycle version
//     i_data_bus[0*DATA_WIDTH+:DATA_WIDTH]  ------------------------------------>
//                                            |        |        |        |
//     i_data_bus[1*DATA_WIDTH+:DATA_WIDTH]  ------------------------------------>
//                                            ||       ||       ||       ||
//     i_data_bus[2*DATA_WIDTH+:DATA_WIDTH]  ------------------------------------>
//                                            |||      |||      |||      |||
//     i_data_bus[3*DATA_WIDTH+:DATA_WIDTH]  ------------------------------------>
//                                            ||||     ||||     ||||     ||||
//     i_data_bus[4*DATA_WIDTH+:DATA_WIDTH]  ------------------------------------>
//                                            |||||    |||||    |||||    |||||
//                                            ______   ______   ______   ______
//   5-bit one-hot control to each of mux ->  \____/   \____/   \____/   \____/
//                                              |        |        |        |
//                                              v        v        v        v 
//                                       o_data_bus o_data_bus o_data_bus o_data_bus
//                       [0*DATA_WIDTH+:DATA_WIDTH]           ...         [3*DATA_WIDTH+:DATA_WIDTH]
//
//
// Example: A 5:4 crossbar. For a hierarchy version [2 pipeline stages: first stage = 8* 8:1 mux -- second stage = 1* 8:1 mux;]
//          The following is the hierarchy crossbar for a single output data. 
//          And the whole hierarachy crossbar needs to instantiate the following logic multiple times.
//
//     i_data_bus[0*DATA_WIDTH+:DATA_WIDTH]  ------------------------------------------------------------------------------------------------->
//                                             |                                                           |                    
//     i_data_bus[1*DATA_WIDTH+:DATA_WIDTH]  ------------------------------------------------------------------------------------------------->
//                                             ||                                                          ||                       
//     i_data_bus[2*DATA_WIDTH+:DATA_WIDTH]  ------------------------------------------------------------------------------------------------->
//                                             |||                                                         |||                   
//           ....                              ...                                                         ...                    
//                                             ||||||||                                                    ||||||||               
//     i_data_bus[63*DATA_WIDTH+:DATA_WIDTH]  ------------------------------------------------------------------------------------------------->
//                                             ||||||||                                                    ||||||||               
//                                             ||||||||     ...   i_data_bus[0*DATA_WIDTH+:DATA_WIDTH] ->  |||||||| <- i_data_bus[7*DATA_WIDTH+:DATA_WIDTH]        
//                                             ||||||||                                                    ||||||||         
//     i_data_bus[56*DATA_WIDTH+:DATA_WIDTH]-> |||||||| <- i_data_bus[63*DATA_WIDTH+:DATA_WIDTH]   ...     ||||||||         
//                                            __________                                                  __________            
//   5-bit one-hot control to each of mux ->  \________/                                                  \________/             
//                                                |                                                           |                   
//                                                v                                                           v                     
//                                     inner_first_stage_data_reg[7]                            inner_first_stage_data_reg[0]
//                                                |                                                           |                                       
//                                                ---------------------------  ... ----------------------------
//                                                                          ||||||||
//                                                                         __________ 
//                                                                         \________/          same logic repeats for 8 times.
//                                                                             |             
//                                                                             v              
//                                                                        o_data_bus[7]    ...  o_data_bus[0]
//
//
// Author:      Jianming Tong (jianming.tong@gatech.edu)
/////////////////////////////////////////////////////////////

module crossbar_one_hot_comb_wrapper_seq#(
	parameter DATA_WIDTH = 32,      // could be arbitrary number
	parameter NUM_OUTPUT_DATA  = 8, // must be power of 2.
	parameter NUM_INPUT_DATA = 32   
)(
    // timing signals
    clk,

    // data signals
	i_valid,        // valid input data signal
	i_data_bus,     // input data bus coming into distribute switch
	
	o_valid,        // output valid
    o_data_bus,     // output data 

	// control signals
	i_en,           // distribute switch enable
	i_cmd           // the input should be one-hot encoded command 
);
	//parameter
	localparam TOTAL_COMMAND = NUM_INPUT_DATA*NUM_OUTPUT_DATA;
	
	localparam WIDTH_INPUT_DATA = NUM_INPUT_DATA*DATA_WIDTH;
	localparam WIDTH_OUTPUT_DATA = NUM_OUTPUT_DATA*DATA_WIDTH;

	localparam NUM_IN_MUX_FIRST_STAGE = 8;
	localparam NUM_MUX_FIRST_STAGE = NUM_INPUT_DATA >> $clog2(NUM_IN_MUX_FIRST_STAGE);

	localparam NUM_IN_MUX_SECOND_STAGE = NUM_MUX_FIRST_STAGE;
	localparam NUM_MUX_SECOND_STAGE = 1;

	input                                        clk;             

	input  [NUM_INPUT_DATA-1:0]                  i_valid;             
	input  [WIDTH_INPUT_DATA-1:0]                i_data_bus;
	
	output [NUM_OUTPUT_DATA-1:0]                 o_valid;             
	output [WIDTH_OUTPUT_DATA-1:0]               o_data_bus; // {o_data_a, o_data_b}

	input                                        i_en;
	input  [TOTAL_COMMAND-1:0]                  i_cmd;

	reg    [NUM_INPUT_DATA-1:0]                  i_valid_reg;             
	reg    [WIDTH_INPUT_DATA-1:0]                i_data_bus_reg;
	reg    [TOTAL_COMMAND-1:0]                  i_cmd_reg;

    wire   [NUM_OUTPUT_DATA-1:0]                 o_valid_wire;
    wire   [WIDTH_OUTPUT_DATA-1:0]               o_data_bus_wire;

    reg    [NUM_OUTPUT_DATA-1:0]                 o_valid_reg;
    reg    [WIDTH_OUTPUT_DATA-1:0]               o_data_bus_reg;

    always@(posedge clk)
    begin
        i_valid_reg <= i_valid;
        i_data_bus_reg <= i_data_bus;
        i_cmd_reg <= i_cmd;
    end

    crossbar_one_hot_comb#(
        .NUM_INPUT_DATA(NUM_INPUT_DATA), 
        .NUM_OUTPUT_DATA(NUM_OUTPUT_DATA),
        .DATA_WIDTH(DATA_WIDTH)) 
    dut(
		.i_valid(i_valid_reg),
		.i_data_bus(i_data_bus_reg),
		.o_valid(o_valid_wire),
		.o_data_bus(o_data_bus_wire),
		.i_en(i_en),
        .i_cmd(i_cmd_reg)
	);

    always @(posedge clk) 
    begin
        o_valid_reg <= o_valid_wire;
        o_data_bus_reg <= o_data_bus_wire;
    end

    assign o_valid = o_valid_reg;
    assign o_data_bus = o_data_bus_reg;

endmodule