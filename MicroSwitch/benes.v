`timescale 1ns / 1ps
/////////////////////////////////////////////////////////////
// Top Module:  benes_seq
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
//     i_valid[0]-->|¯¯¯|<--ctrl[2:0] 
//     i_valid[1]-->|___|
//     
// Author:      Jianming Tong (jianming.tong@gatech.edu)
/////////////////////////////////////////////////////////////

module benes#(
	parameter DATA_WIDTH = 32,
	parameter COMMMAND_WIDTH  = 2,
	parameter NUM_SWITCH_IN = 8
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
	localparam LEVEL = $clog2(NUM_SWITCH_IN);
	localparam TOTAL_STAGE = 2*LEVEL+1;

	localparam TOTAL_COMMMAND = TOTAL_STAGE*NUM_SWITCH_IN*COMMMAND_WIDTH;
	
	localparam NUM_INPUT_DATA = 2*NUM_SWITCH_IN;
	localparam WIDTH_INPUT_DATA = NUM_INPUT_DATA*DATA_WIDTH;
	
	localparam NUM_CONNECTION = (TOTAL_STAGE-1)*NUM_INPUT_DATA*DATA_WIDTH;
	localparam NUM_CONNECTION_VALID = NUM_INPUT_DATA*(TOTAL_STAGE-1);

	// interface
	input                                        clk;
	input                                        rst;
	
	input  [NUM_INPUT_DATA-1:0]                  i_valid;             
	input  [WIDTH_INPUT_DATA-1:0]                i_data_bus;
	
	output [NUM_INPUT_DATA-1:0]                  o_valid;             
	output [WIDTH_INPUT_DATA-1:0]                o_data_bus; //{o_data_a, o_data_b}

	input                                        i_en;
	input  [TOTAL_COMMMAND-1:0]                  i_cmd;
									// 11 --> Multicast_HighIn
									// 00 --> Multicast_LowIn
									// 10 --> Pass Through
									// 01 --> Pass Switch


	// inner logic
	wire   [WIDTH_INPUT_DATA-1:0]                connection[0:TOTAL_STAGE-1];
	wire   [NUM_INPUT_DATA-1:0]                  connection_valid[0:TOTAL_STAGE-1];
	reg    [WIDTH_INPUT_DATA-1:0]                connection_reg[0:TOTAL_STAGE-1];
	reg    [NUM_INPUT_DATA-1:0]                  connection_valid_reg[0:TOTAL_STAGE-1];
	// logic for control pipeline
	reg    [TOTAL_COMMMAND-1:0]                  i_cmd_reg[0:TOTAL_STAGE-1];
	genvar k;
	
	always@(posedge clk)
		begin
			i_cmd_reg[0] <= i_cmd;	
		end	
	generate

	for(k=0; k <(TOTAL_STAGE-1); k=k+1) 
	begin: cmd_pipeline
		always@(posedge clk)
		begin
			i_cmd_reg[k+1] <= i_cmd_reg[k];
		end	
	end
	endgenerate

	always@(posedge clk)
	begin
		connection_reg <= connection;
		connection_valid_reg <= connection_valid;
	end

	// first stage
	genvar i;
	generate
		for(i=0;i<NUM_SWITCH_IN;i=i+1)
		begin:first_stage
			distribute_2x2_seq #(
				.DATA_WIDTH(DATA_WIDTH),
				.COMMMAND_WIDTH(COMMMAND_WIDTH)
			) first_stage(
				.clk(clk),
				.rst(rst),
				.i_valid(i_valid[2*i+:2]),
				.i_data_bus(i_data_bus[i*2*DATA_WIDTH+:2*DATA_WIDTH]),
				.o_valid(connection_valid[2*i+:2]),
				.o_data_bus(connection[i*2*DATA_WIDTH+:2*DATA_WIDTH]),
				.i_en(i_en),
				.i_cmd(i_cmd[2*i*COMMMAND_WIDTH+:COMMMAND_WIDTH])
			);
		end
	endgenerate

	// assign o_data_bus = connection[0*DATA_WIDTH+:2*NUM_SWITCH_IN*DATA_WIDTH];
	// assign o_valid = connection_valid[0+:2*NUM_SWITCH_IN];

	// second stages
	generate
		for(i=0;i<NUM_SWITCH_IN;i=i+1)
		begin:second_stage
			distribute_2x2_seq #(
				.DATA_WIDTH(DATA_WIDTH),
				.COMMMAND_WIDTH(COMMMAND_WIDTH)
			) second_stage(
				.clk(clk),
				.rst(rst),
				.i_valid(connection_valid_reg[2*i+NUM_INPUT_DATA+:2]),
				.i_data_bus(connection_reg[i*2*DATA_WIDTH+:2*DATA_WIDTH]),
				.o_valid(connection_valid[NUM_INPUT_DATA+2*i+:2]),
				.o_data_bus(connection[(i+NUM_SWITCH_IN)*2*DATA_WIDTH+:2*DATA_WIDTH]),
				.i_en(i_en),
				// .i_cmd(i_cmd_reg[2*i*COMMMAND_WIDTH+:COMMMAND_WIDTH])
				.i_cmd(i_cmd_reg[0][2*i*COMMMAND_WIDTH+:COMMMAND_WIDTH])
			);
		end
	endgenerate

	// assign o_data_bus = connection[2*NUM_SWITCH_IN*DATA_WIDTH+:2*NUM_SWITCH_IN*DATA_WIDTH];
	// assign o_valid = connection_valid[2*NUM_SWITCH_IN+:2*NUM_SWITCH_IN];

	assign o_data_bus = connection[NUM_INPUT_DATA*DATA_WIDTH+:NUM_INPUT_DATA*DATA_WIDTH];
	assign o_valid = connection_valid[NUM_INPUT_DATA+:NUM_INPUT_DATA];


	// second half stages
	// genvar j;
	// generate
	// 	for(j=0;j<LEVEL;j=j+1)
	// 	begin
	// 		distribute_2x2_seq #(
	// 			.DATA_WIDTH(DATA_WIDTH),
	// 			.COMMMAND_WIDTH(COMMMAND_WIDTH)
	// 		) dut(
	// 			.clk(clk),
	// 			.rst(rst),
	// 			.i_valid(i_valid),
	// 			.i_data_bus(i_data_bus),
	// 			.o_valid(o_valid),
	// 			.o_data_bus(o_data_bus),
	// 			.i_en(i_en),
	// 			.i_cmd(i_cmd)
	// 		);
	// 	end
	// endgenerate


endmodule

