`timescale 1ns / 1ps
/////////////////////////////////////////////////////////////
// Top Module:  butterfly_seq
// Data:        Only data width matters.
// Format:      keeping the input format unchange
// Timing:      Sequential Logic
// Reset:       Synchronized Reset [High Reset]
// Pipeline:    [full pipeline]every stage is a pipeline stage
// Latency:     Total latency = # stages (cycle)
//              [2 stage pipeline] 0~LEVEL is the first pipeline stage.  
// Control:     Use destination tag
//
// Function:    Unicast  or  Multicast(Not arbitrary Multicast)
//                                              
//     i_data_bus[0*DATA_WIDTH+:DATA_WIDTH]  -->|¯¯¯|-------->|¯¯¯|----->|¯¯¯|-->
//     i_data_bus[1*DATA_WIDTH+:DATA_WIDTH]  -->|___|-\    /->|___|-\ /->|___|-->
//                                                     \  /          X                                  
//     i_data_bus[2*DATA_WIDTH+:DATA_WIDTH]  -->|¯¯¯|---\/--->|¯¯¯|-/ \->|¯¯¯|-->
//     i_data_bus[3*DATA_WIDTH+:DATA_WIDTH]  -->|___|-\ /\ /->|___|----->|___|-->
//                                                     X  X                               
//     i_data_bus[4*DATA_WIDTH+:DATA_WIDTH]  -->|¯¯¯|-/ \/ \->|¯¯¯|----->|¯¯¯|-->
//     i_data_bus[5*DATA_WIDTH+:DATA_WIDTH]  -->|___|---/\--->|___|-\ /->|___|-->
//                                                     /  \          X              
//     i_data_bus[6*DATA_WIDTH+:DATA_WIDTH]  -->|¯¯¯|-/    \->|¯¯¯|-/ \->|¯¯¯|-->
//     i_data_bus[7*DATA_WIDTH+:DATA_WIDTH]  -->|___|-------->|___|----->|___|-->
//                                                        
//              
//        CONNECTION FUNCTION                        BUTTERFLY    BUTTERFLY  
//       CONNECTION GROUP SIZE                          8            4 
//
// Control Signal
//     i_valid[0]-->|¯¯¯|<--i_cmd[2:0] 
//     i_valid[1]-->|___|
//     
// Author:      Jianming Tong (jianming.tong@gatech.edu)
/////////////////////////////////////////////////////////////


module butterfly_seq#(
	parameter DATA_WIDTH = 32,    // could be arbitrary number
	parameter NUM_INPUT_DATA = 8, // multiple be 2^n
    parameter COMMMAND_WIDTH = $clog2(NUM_INPUT_DATA), // destination tag, each level consumes 1 bit.
    parameter DESTINATION_TAG_WIDTH = COMMMAND_WIDTH // destination tag, each level consumes 1 bit.
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
	i_cmd           // !Note: The control here should be the index of destination in binary.
	                // Each input data has its own destination tag.
);
	// parameter
	localparam  NUM_STAGE = $clog2(NUM_INPUT_DATA);
	localparam  WIDTH_INPUT_DATA = DATA_WIDTH * NUM_INPUT_DATA;
	localparam  NUM_SWITCH_IN = NUM_INPUT_DATA >> 1;
	
	// interface
	input                                                      clk;
	input                                                      rst;
	
	input  [NUM_INPUT_DATA-1:0]                                i_valid;             
	input  [WIDTH_INPUT_DATA-1:0]                              i_data_bus;
	
	output [NUM_INPUT_DATA-1:0]                                o_valid;             
	output [WIDTH_INPUT_DATA-1:0]                              o_data_bus; //{o_data_a, o_data_b}

	input                                                      i_en;
	input  [NUM_INPUT_DATA*DESTINATION_TAG_WIDTH-1:0]          i_cmd;
									// For each data with COMMAND_WIDTH destination tag. 
									// e.g. For 8-data input cube
									// 4-th input data has destination tag = 010 
									// 010 -> goes the 3th destination.

	// inner logic
	reg    [NUM_INPUT_DATA-1:0]                                i_valid_inner;             
	reg    [WIDTH_INPUT_DATA-1:0]                              i_data_bus_inner;	
	reg    [NUM_INPUT_DATA-1:0]                                o_valid_inner;             
	reg    [NUM_INPUT_DATA*DATA_WIDTH-1:0]                     o_data_bus_inner;	

	always@(*)
	begin
		i_valid_inner = i_valid;
		i_data_bus_inner = i_data_bus;
	end

	wire                                                       wire_valid_inner[0:NUM_STAGE][0:NUM_INPUT_DATA-1];
	wire   [DATA_WIDTH-1:0]                                    wire_data_inner[0:NUM_STAGE][0:NUM_INPUT_DATA-1];

	// input for the first stage
	genvar i,s,g;
	generate
	for(i = 0; i< NUM_INPUT_DATA; i=i+1)
	begin: i_wire_first_stage
		assign wire_data_inner[0][i] = i_data_bus_inner[i*DATA_WIDTH+:DATA_WIDTH];
		assign wire_valid_inner[0][i] = i_valid_inner[i+:1];
	end

	// command inner stage definition
	for(s=0; s<NUM_STAGE-1; s=s+1)
	begin:o_cmd_stage	 
	    // index 0 is for the output wire of the first stage
		wire [DESTINATION_TAG_WIDTH-2-s:0]                     o_cmd_data_wire_inner[0:NUM_INPUT_DATA-1];       
	end

	// command generation
	reg     [DESTINATION_TAG_WIDTH-1:0]                        reg_cmd_inner[0:NUM_INPUT_DATA-1];

	for(i=0; i<NUM_INPUT_DATA; i=i+1)
	begin: command_in_first_stage
		always@(*)
		begin
			reg_cmd_inner[i] = i_cmd[i*DESTINATION_TAG_WIDTH+:DESTINATION_TAG_WIDTH];
		end
	end

	// first stage
	for(i=0; i< NUM_SWITCH_IN; i=i+1)
	begin:switch_first_stage			
		distribute_2x2_dst_tag_seq #(
			.DATA_WIDTH(DATA_WIDTH),
			.DESTINATION_TAG_WIDTH(DESTINATION_TAG_WIDTH)
		) dis_2x2(
			.clk(clk),
			.rst(rst),
			.i_valid({wire_valid_inner[0][2*i+1], wire_valid_inner[0][2*i]}),
			.i_data_bus({wire_data_inner[0][2*i+1], wire_data_inner[0][2*i]}),
			.o_valid({wire_valid_inner[1][2*i+1], wire_valid_inner[1][2*i]}),
			.o_data_bus({wire_data_inner[1][2*i+1], wire_data_inner[1][2*i]}),
			.i_en(i_en),
			.i_cmd({reg_cmd_inner[2*i+1], reg_cmd_inner[2*i]}),
			.o_cmd({o_cmd_stage[0].o_cmd_data_wire_inner[2*i+1], o_cmd_stage[0].o_cmd_data_wire_inner[2*i]})
		);
	end

	// stages afterward
	for(s=0; s<NUM_STAGE-1; s=s+1)
	begin:stage_afterwards
		for(g=0; g<(1<<s); g=g+1)
		begin:group
			for(i=0; i< (NUM_SWITCH_IN >> s); i=i+1)
			begin:switch
				localparam [$clog2(NUM_INPUT_DATA)-1:0]   group_data_offset = g*(NUM_INPUT_DATA>>s);
				localparam [$clog2(NUM_INPUT_DATA)-1:0]   group_switch_offset = g*(NUM_SWITCH_IN>>s);
				localparam [$clog2(NUM_INPUT_DATA)-1-s:0] idx = i[$clog2(NUM_INPUT_DATA)-1-s:0];  // store the index of switch inside the group
				
				// inverse the MSB of the index of switch inside the group
				// For low input [Inverse MSB [$clog2(NUM_INPUT_DATA)-1-s] ]
				localparam [$clog2(NUM_INPUT_DATA)-1-s:0] HighDataInIdx =  (idx << 1) + 1;
				localparam [$clog2(NUM_INPUT_DATA)-1-s:0] HighDataInIdxLSB2MSB = {HighDataInIdx[0], HighDataInIdx[$clog2(NUM_INPUT_DATA)-2-s:0]};
				localparam [$clog2(NUM_INPUT_DATA)-1-s:0] HighDataInIdxLSB_MSB_SWAP = {HighDataInIdxLSB2MSB[$clog2(NUM_INPUT_DATA)-1-s:1], HighDataInIdx[$clog2(NUM_INPUT_DATA)-1-s]};
				localparam [$clog2(NUM_INPUT_DATA)-1:0] HighDataInIdxMSBInverseOffset = HighDataInIdxLSB_MSB_SWAP + group_data_offset;
				
				// For high input [Inverse MSB [$clog2(NUM_INPUT_DATA)-1-s] ]
				localparam [$clog2(NUM_INPUT_DATA)-1-s:0] LowDataInIdx =  (idx << 1);
				localparam [$clog2(NUM_INPUT_DATA)-1-s:0] LowDataInIdxLSB2MSB = {LowDataInIdx[0], LowDataInIdx[$clog2(NUM_INPUT_DATA)-2-s:0]};
				localparam [$clog2(NUM_INPUT_DATA)-1-s:0] LowDataInIdxLSB_MSB_SWAP = {LowDataInIdxLSB2MSB[$clog2(NUM_INPUT_DATA)-1-s:1], LowDataInIdx[$clog2(NUM_INPUT_DATA)-1-s]};
				localparam [$clog2(NUM_INPUT_DATA)-1:0] LowDataInIdxMSBInverseOffset = LowDataInIdxLSB_MSB_SWAP + group_data_offset;	
				
				if(s==(NUM_STAGE-2))
				begin
					distribute_2x2_dst_tag_seq #(
						.DATA_WIDTH(DATA_WIDTH),
        				.DESTINATION_TAG_WIDTH(DESTINATION_TAG_WIDTH - s - 1)
					) dis_2x2(
						.clk(clk),
						.rst(rst),
						.i_valid( {wire_valid_inner[s+1][HighDataInIdxMSBInverseOffset],  wire_valid_inner[s+1][LowDataInIdxMSBInverseOffset]} ),
						.i_data_bus({wire_data_inner[s+1][HighDataInIdxMSBInverseOffset], wire_data_inner[s+1][LowDataInIdxMSBInverseOffset]}),
						.o_valid({wire_valid_inner[s+2][2*(i+group_switch_offset)+1], wire_valid_inner[s+2][2*(i+group_switch_offset)]}),
						.o_data_bus({wire_data_inner[s+2][2*(i+group_switch_offset)+1], wire_data_inner[s+2][2*(i+group_switch_offset)]}),
						.i_en(i_en),
						.i_cmd({o_cmd_stage[s].o_cmd_data_wire_inner[HighDataInIdxMSBInverseOffset], o_cmd_stage[s].o_cmd_data_wire_inner[LowDataInIdxMSBInverseOffset]}),
						.o_cmd()
					);
				end
				else
				begin
					distribute_2x2_dst_tag_seq #(
						.DATA_WIDTH(DATA_WIDTH),
						.DESTINATION_TAG_WIDTH(DESTINATION_TAG_WIDTH - s - 1)
					) dis_2x2(
						.clk(clk),
						.rst(rst),
						.i_valid( {wire_valid_inner[s+1][HighDataInIdxMSBInverseOffset],  wire_valid_inner[s+1][LowDataInIdxMSBInverseOffset]} ),
						.i_data_bus({wire_data_inner[s+1][HighDataInIdxMSBInverseOffset], wire_data_inner[s+1][LowDataInIdxMSBInverseOffset]}),
						.o_valid({wire_valid_inner[s+2][2*(i+group_switch_offset)+1], wire_valid_inner[s+2][2*(i+group_switch_offset)]}),
						.o_data_bus({wire_data_inner[s+2][2*(i+group_switch_offset)+1], wire_data_inner[s+2][2*(i+group_switch_offset)]}),
						.i_en(i_en),
						.i_cmd({o_cmd_stage[s].o_cmd_data_wire_inner[HighDataInIdxMSBInverseOffset], o_cmd_stage[s].o_cmd_data_wire_inner[LowDataInIdxMSBInverseOffset]}),
						.o_cmd({o_cmd_stage[s+1].o_cmd_data_wire_inner[2*(i+group_switch_offset)+1], o_cmd_stage[s+1].o_cmd_data_wire_inner[2*(i+group_switch_offset)]})
					);
				end
			end
		end
	end
	
	// output of the last stage
	for(i = 0; i< NUM_INPUT_DATA; i=i+1)
	begin: o_wire_last_stage
		always @(*) begin
		 	o_data_bus_inner[i*DATA_WIDTH+:DATA_WIDTH] = wire_data_inner[NUM_STAGE][i];
		 	o_valid_inner[i+:1] = wire_valid_inner[NUM_STAGE][i];
		end
	end
	endgenerate

	assign o_data_bus = o_data_bus_inner;
	assign o_valid = o_valid_inner;

endmodule