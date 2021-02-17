`timescale 1ns / 1ps
/////////////////////////////////////////////////////////////
// Top Module:  benes_merge_seq
// Data:        Only data width matters.
// Format:      keeping the input format unchange
// Timing:      Sequential Logic
// Reset:       Synchronized Reset [High Reset]
// Latency:     # of stage    
// Dummy Data:  {DATA_WIDTH{1'bz}}
// 
// Function:    Unicast  or  Multicast(Not arbitrary Multicast)
//   
//     i_data_bus[0*DATA_WIDTH+:DATA_WIDTH]  -->|¯¯¯|-------->|¯¯¯|------->|¯¯¯|------->|¯¯¯|-------->|¯¯¯|--\
//     i_data_bus[1*DATA_WIDTH+:DATA_WIDTH]  -->|___|-\ /---->|___|--\ /-->|___|--\ /-->|___|----\ /->|___|   \->|¯¯¯|
//                                                     X              X            X              X           /->|___|-->
//     i_data_bus[2*DATA_WIDTH+:DATA_WIDTH]  -->|¯¯¯|-/ \/--->|¯¯¯|--/ \-->|¯¯¯|--/ \-->|¯¯¯|---\/ \->|¯¯¯|--/
//     i_data_bus[3*DATA_WIDTH+:DATA_WIDTH]  -->|___|-\ /\ /->|___|------->|___|------->|___|-\ /\ /->|___|
//                                                     X  X                                    X  X
//     i_data_bus[4*DATA_WIDTH+:DATA_WIDTH]  -->|¯¯¯|-/ \/ \->|¯¯¯|------->|¯¯¯|------->|¯¯¯|-/ \/ \->|¯¯¯|
//     i_data_bus[5*DATA_WIDTH+:DATA_WIDTH]  -->|___|-\ /\--->|___|--\ /-->|___|--\ /-->|___|---/\ /->|___|--\ 
//                                                     X              X            X              X           \->|¯¯¯|-->
//     i_data_bus[6*DATA_WIDTH+:DATA_WIDTH]  -->|¯¯¯|-/ \---->|¯¯¯|--/ \-->|¯¯¯|--/ \-->|¯¯¯|----/ \->|¯¯¯|   /->|___|
//     i_data_bus[7*DATA_WIDTH+:DATA_WIDTH]  -->|___|-------->|___|------->|___|------->|___|-------->|___|--/
//
//        CONNECTION FUNCTION                   INVERSE SHUFFLE      ,,         SHUFFLE       SHUFFLE        Merge
//       CONNECTION GROUP SIZE                         8             4             4             8
//        
// Control Signal
//     i_valid[0]-->|¯¯¯|<--i_cmd[2:0] 
//     i_valid[1]-->|___|
//     
// Author:      Jianming Tong (jianming.tong@gatech.edu)
/////////////////////////////////////////////////////////////

// Note: use the SIMPLE version distribute_2x2_comb.
// Need to set "`define in distribute_2x2_comb.v"
module benes_merge_seq#(
	parameter DATA_WIDTH = 32,     // could be arbitrary number
	parameter COMMMAND_WIDTH = 2,  // 2 when using simple distribute_2x2; 3 when using complex distribute_2x2;
	parameter NUM_INPUT_DATA = 8,  // multiple be 2^n
	parameter NUM_OUTPUT_DATA = 4  // must be 2^n
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
	i_cmd           // command 
);
	//parameter
	localparam NUM_SWITCH_IN = NUM_INPUT_DATA >> 1;

	localparam LEVEL = $clog2(NUM_INPUT_DATA);
	localparam TOTAL_STAGE = 2*LEVEL-1;

	localparam TOTAL_COMMMAND = TOTAL_STAGE*NUM_SWITCH_IN*COMMMAND_WIDTH;
	
	localparam WIDTH_INPUT_DATA = NUM_INPUT_DATA*DATA_WIDTH;
	localparam WIDTH_OUTPUT_DATA = DATA_WIDTH * NUM_OUTPUT_DATA;

	// interface
	input                                        clk;
	input                                        rst;
	
	input  [NUM_INPUT_DATA-1:0]                  i_valid;             
	input  [WIDTH_INPUT_DATA-1:0]                i_data_bus;
	
	output [NUM_OUTPUT_DATA-1:0]                 o_valid;             
	output [WIDTH_OUTPUT_DATA-1:0]               o_data_bus;

	input                                        i_en;
	input  [TOTAL_COMMMAND-1:0]                  i_cmd;
									// For each switch
									// 11 --> Multicast_HighIn
									// 00 --> Multicast_LowIn
									// 10 --> Pass Through
									// 01 --> Pass Switch


	// inner logic
	wire   [WIDTH_INPUT_DATA-1:0]                connection_data;
	wire   [NUM_INPUT_DATA-1:0]                  connection_valid;
	

	// instantiate benes 
	 benes_seq #(
		.DATA_WIDTH(DATA_WIDTH),
        .COMMMAND_WIDTH(COMMMAND_WIDTH),
        .NUM_INPUT_DATA(NUM_INPUT_DATA)
	 ) benes_network(
		.clk(clk),
		.rst(rst),
		.i_valid(i_valid),
		.i_data_bus(i_data_bus),
		.o_valid(connection_valid),
		.o_data_bus(connection_data),
		.i_en(i_en),
		.i_cmd(i_cmd)
	);

	// merge tree
 	merge_tree_autopick_multi_output_seq#(
        .NUM_INPUT_DATA(NUM_INPUT_DATA), 
        .DATA_WIDTH(DATA_WIDTH),
        .NUM_OUTPUT_DATA(NUM_OUTPUT_DATA))
    merge_network(
		.clk(clk),
		.rst(rst),
		.i_valid(connection_valid),
		.i_data_bus(connection_data),
		.o_valid(o_valid),
		.o_data_bus(o_data_bus),
		.i_en(i_en)
	);

endmodule

