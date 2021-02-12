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
//     i_valid[0]-->|¯¯¯|<--i_cmd[2:0] 
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
	wire   [DATA_WIDTH-1:0]                      connection[0:TOTAL_STAGE-1][0:NUM_INPUT_DATA-1];
	wire                                         connection_valid[0:TOTAL_STAGE-1][0:NUM_INPUT_DATA-1];
	// reg    [DATA_WIDTH-1:0]                      connection_reg[0:TOTAL_STAGE-1][0:NUM_INPUT_DATA-1];
	// reg                                          connection_valid_reg[0:TOTAL_STAGE-1][0:NUM_INPUT_DATA-1];

	// logic for control pipeline
	reg    [COMMMAND_WIDTH-1:0]                  i_cmd_reg[0:TOTAL_STAGE-2][0:TOTAL_STAGE*NUM_SWITCH_IN-1]; // i_cmd_reg[0][x] stores the i_cmd for stage 1 instead of stage 0.

	genvar i,j;
	
	generate
		for(i=0; i<(TOTAL_STAGE-1); i=i+1) 
		begin:initialization_stage
			for(j=0; j<(TOTAL_STAGE*NUM_SWITCH_IN); j=j+1) 
			begin: initialization
				initial
				begin
					i_cmd_reg[i][j] <= {COMMMAND_WIDTH{1'bx}};
					// connection_reg[i][j] <= {DATA_WIDTH{1'bx}};
					// connection_valid_reg[i][j] <= {1'bx};
				end
			end
		end
		
		for(j=0; j<(TOTAL_STAGE*NUM_SWITCH_IN); j=j+1) 
		begin:i_cmd_first_stage
			always@(posedge clk)
			begin
				i_cmd_reg[0][j] <= i_cmd[j*COMMMAND_WIDTH+:COMMMAND_WIDTH];	
			end
		end

		for(i=0; i<(TOTAL_STAGE-2); i=i+1) 
		begin: i_cmd_pipeline_stage
			for(j=0; j<(TOTAL_STAGE*NUM_SWITCH_IN); j=j+1) 
			begin: i_cmd_stage
				always@(posedge clk)
				begin
					i_cmd_reg[i+1][j] <= i_cmd_reg[i][j];
				end
			end
		end


		// for(i=0; i<TOTAL_STAGE; i=i+1) 
		// begin: connection_reg_pipeline
		// 	for(j=0; j<NUM_SWITCH_IN; j=j+1) 
		// 	begin: connection_reg_stage
		// 		always@(posedge clk)
		// 		begin
		// 			connection_reg[i][j] <= connection[i][j];
		// 			connection_valid_reg[i][j] <= connection_valid[i][j];
		// 		end
		// 	end
		// end

		// first stage
		for(i=0; i<NUM_SWITCH_IN; i=i+1)
		begin:first_stage
			distribute_2x2_seq #(
				.DATA_WIDTH(DATA_WIDTH),
				.COMMMAND_WIDTH(COMMMAND_WIDTH)
			) first_stage(
				.clk(clk),
				.rst(rst),
				.i_valid(i_valid[2*i+:2]),
				.i_data_bus(i_data_bus[i*2*DATA_WIDTH+:2*DATA_WIDTH]),
				.o_valid({connection_valid[0][2*i+1], connection_valid[0][2*i]}),
				.o_data_bus({connection[0][2*i+1], connection[0][2*i]}),
				.i_en(i_en),
				.i_cmd(i_cmd[i*COMMMAND_WIDTH+:COMMMAND_WIDTH])
			);
		end


		// // afterward stages
		// for(j=0;j< TOTAL_STAGE-1;j=j+1)
		// begin:stage
		// 	for(i=0;i<NUM_SWITCH_IN;i=i+1)
		// 	begin:switch
		// 		// For low input [Loop Right Shift (2*i)]
		// 		localparam [$clog2(NUM_INPUT_DATA)-1:0] idx = i[$clog2(NUM_INPUT_DATA)-1:0];
		// 		localparam [$clog2(NUM_INPUT_DATA)-1:0] l_idx = (idx<<1);
		// 		localparam [$clog2(NUM_INPUT_DATA)-1:0] l_idx_right_shift = l_idx >> 1;
		// 		localparam [$clog2(NUM_INPUT_DATA)-1:0] l_idx_LSB_is_1 = l_idx&1'b1;
		// 		localparam [$clog2(NUM_INPUT_DATA)-1:0] l_idx_LSB_loop_shift = l_idx_LSB_is_1 << 1;
		// 		localparam [$clog2(NUM_INPUT_DATA)-1:0] l_idx_loop_right_shift = l_idx_LSB_loop_shift + l_idx_right_shift;

		// 		// For high input [Loop Right Shift (2*i+1)]
		// 		localparam [$clog2(NUM_INPUT_DATA)-1:0] h_idx = (idx<<1)+1;
		// 		localparam [$clog2(NUM_INPUT_DATA)-1:0] h_idx_right_shift = h_idx >> 1;
		// 		localparam [$clog2(NUM_INPUT_DATA)-1:0] h_idx_LSB_is_1 = h_idx&1'b1;
		// 		localparam [$clog2(NUM_INPUT_DATA)-1:0] h_idx_LSB_loop_shift = h_idx_LSB_is_1 << 1;
		// 		localparam [$clog2(NUM_INPUT_DATA)-1:0] h_idx_loop_right_shift = h_idx_LSB_loop_shift + h_idx_right_shift;

		// 		distribute_2x2_seq #(
		// 			.DATA_WIDTH(DATA_WIDTH),
		// 			.COMMMAND_WIDTH(COMMMAND_WIDTH)
		// 		) second_stage(
		// 			.clk(clk),
		// 			.rst(rst),
		// 			.i_valid({connection_valid[j][h_idx_loop_right_shift], connection_valid[j][l_idx_loop_right_shift]}),
		// 			.i_data_bus({connection[j][h_idx_loop_right_shift], connection[j][l_idx_loop_right_shift]}),
		// 			.o_valid({connection_valid[j+1][2*i+1], connection_valid[j+1][2*i]}),
		// 			.o_data_bus({connection[j+1][2*i+1], connection[j+1][2*i]}),
		// 			.i_en(i_en),
		// 			.i_cmd(i_cmd_reg[j][NUM_SWITCH_IN+i])
		// 		);
		// 	end
		// end

		// // second stages
		// for(i=0;i<NUM_SWITCH_IN;i=i+1)
		// begin:second_stage
		// 	// For low input [Loop Right Shift (2*i)]
		// 	localparam [$clog2(NUM_INPUT_DATA)-1:0] idx = i[$clog2(NUM_INPUT_DATA)-1:0];
		// 	localparam [$clog2(NUM_INPUT_DATA)-1:0] l_idx = (idx<<1);
		// 	localparam [$clog2(NUM_INPUT_DATA)-1:0] l_idx_right_shift = l_idx >> 1;
		// 	localparam [$clog2(NUM_INPUT_DATA)-1:0] l_idx_LSB_is_1 = l_idx&1'b1;
		// 	localparam [$clog2(NUM_INPUT_DATA)-1:0] l_idx_LSB_loop_shift = l_idx_LSB_is_1 << 1;
		// 	localparam [$clog2(NUM_INPUT_DATA)-1:0] l_idx_loop_right_shift = l_idx_LSB_loop_shift + l_idx_right_shift;

		// 	// For high input [Loop Right Shift (2*i+1)]
		// 	localparam [$clog2(NUM_INPUT_DATA)-1:0] h_idx = (idx<<1)+1;
		// 	localparam [$clog2(NUM_INPUT_DATA)-1:0] h_idx_right_shift = h_idx >> 1;
		// 	localparam [$clog2(NUM_INPUT_DATA)-1:0] h_idx_LSB_is_1 = h_idx&1'b1;
		// 	localparam [$clog2(NUM_INPUT_DATA)-1:0] h_idx_LSB_loop_shift = h_idx_LSB_is_1 << 1;
		// 	localparam [$clog2(NUM_INPUT_DATA)-1:0] h_idx_loop_right_shift = h_idx_LSB_loop_shift + h_idx_right_shift;

		// 	distribute_2x2_seq #(
		// 		.DATA_WIDTH(DATA_WIDTH),
		// 		.COMMMAND_WIDTH(COMMMAND_WIDTH)
		// 	) second_stage(
		// 		.clk(clk),
		// 		.rst(rst),
		// 		.i_valid({connection_valid[0][h_idx_loop_right_shift], connection_valid[0][l_idx_loop_right_shift]}),
		// 		.i_data_bus({connection[0][h_idx_loop_right_shift], connection[0][l_idx_loop_right_shift]}),
		// 		.o_valid({connection_valid[1][2*i+1], connection_valid[1][2*i]}),
		// 		.o_data_bus({connection[1][2*i+1], connection[1][2*i]}),
		// 		.i_en(i_en),
		// 		.i_cmd(i_cmd_reg[0][NUM_SWITCH_IN+i])
		// 	);
		// end


		// // third stages
		// for(i=0;i<NUM_SWITCH_IN;i=i+1)
		// begin:third_stage
		// 	// For low input [Loop Right Shift (2*i)]
		// 	localparam [$clog2(NUM_INPUT_DATA)-1:0] idx = i[$clog2(NUM_INPUT_DATA)-1:0];
		// 	localparam [$clog2(NUM_INPUT_DATA)-1:0] l_idx = (idx<<1);
		// 	localparam [$clog2(NUM_INPUT_DATA)-1:0] l_idx_right_shift = l_idx >> 1;
		// 	localparam [$clog2(NUM_INPUT_DATA)-1:0] l_idx_LSB_is_1 = l_idx&1'b1;
		// 	localparam [$clog2(NUM_INPUT_DATA)-1:0] l_idx_LSB_loop_shift = l_idx_LSB_is_1 << 1;
		// 	localparam [$clog2(NUM_INPUT_DATA)-1:0] l_idx_loop_right_shift = l_idx_LSB_loop_shift + l_idx_right_shift;

		// 	// For high input [Loop Right Shift (2*i+1)]
		// 	localparam [$clog2(NUM_INPUT_DATA)-1:0] h_idx = (idx<<1)+1;
		// 	localparam [$clog2(NUM_INPUT_DATA)-1:0] h_idx_right_shift = h_idx >> 1;
		// 	localparam [$clog2(NUM_INPUT_DATA)-1:0] h_idx_LSB_is_1 = h_idx&1'b1;
		// 	localparam [$clog2(NUM_INPUT_DATA)-1:0] h_idx_LSB_loop_shift = h_idx_LSB_is_1 << 1;
		// 	localparam [$clog2(NUM_INPUT_DATA)-1:0] h_idx_loop_right_shift = h_idx_LSB_loop_shift + h_idx_right_shift;

		// 	distribute_2x2_seq #(
		// 		.DATA_WIDTH(DATA_WIDTH),
		// 		.COMMMAND_WIDTH(COMMMAND_WIDTH)
		// 	) third_stage(
		// 		.clk(clk),
		// 		.rst(rst),
		// 		.i_valid({connection_valid[1][h_idx_loop_right_shift], connection_valid[1][l_idx_loop_right_shift]}),
		// 		.i_data_bus({connection[1][h_idx_loop_right_shift], connection[1][l_idx_loop_right_shift]}),
		// 		.o_valid({connection_valid[2][2*i+1], connection_valid[2][2*i]}),
		// 		.o_data_bus({connection[2][2*i+1], connection[2][2*i]}),
		// 		.i_en(i_en),
		// 		.i_cmd(i_cmd_reg[1][NUM_SWITCH_IN+i])
		// 	);
		// end


	for(i=0;i<NUM_INPUT_DATA;i=i+1)
	begin: output_data
		assign o_data_bus[i*DATA_WIDTH+:DATA_WIDTH] = connection[TOTAL_STAGE-1][i];
		assign o_valid[i+:1] = connection_valid[TOTAL_STAGE-1][i];
	end
	 
	endgenerate


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

