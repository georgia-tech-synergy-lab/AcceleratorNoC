`timescale 1ns / 1ps
/////////////////////////////////////////////////////////////
// Top Module:  unfoldedbutterfly_merge_comb
// Data:        Only data width matters.
// Format:      keeping the input format unchange
// Timing:      Combinational Logic
// Pipeline:    every stage is a pipeline stage
//              Total latency = # stages (cycle)  
// Dummy Data:  {DATA_WIDTH{1'bz}}
// 
// Function:    Unicast  or  Multicast(Not arbitrary Multicast)
//                                              
//     i_data_bus[0*DATA_WIDTH+:DATA_WIDTH]  -->|¯¯¯|-------------->|¯¯¯|-------->|¯¯¯|-\
//                                              |___|-\          /->|___|-\    /->|___|  \-->|¯¯¯|
//                                                     \        /          \  /          /-->|___|-->            
//     i_data_bus[1*DATA_WIDTH+:DATA_WIDTH]  -->|¯¯¯|---\------/--->|¯¯¯|---\/--->|¯¯¯|-/
//                                              |___|-\  \    /  /->|___|-\ /\ /->|___|
//                                                     \  \  /  /          X  X               
//     i_data_bus[2*DATA_WIDTH+:DATA_WIDTH]  -->|¯¯¯|---\--\/--/--->|¯¯¯|-/ \/ \->|¯¯¯|-\
//                                              |___|-\  \ /\ /  /->|___|---/\--->|___|  \-->|¯¯¯|
//                                                     \  X  X  /          /  \          /-->|___|-->               
//     i_data_bus[3*DATA_WIDTH+:DATA_WIDTH]  -->|¯¯¯|---\/-\/-\/--->|¯¯¯|-/    \->|¯¯¯|-/
//                                              |___|-\ /\ /\ /\ /->|___|-------->|___|
//                                                     X  X  X  X
//     i_data_bus[4*DATA_WIDTH+:DATA_WIDTH]  -->|¯¯¯|-/ \/ \/ \/ \->|¯¯¯|-------->|¯¯¯|-\
//                                              |___|---/\-/\-/\--->|___|-\    /->|___|  \-->|¯¯¯|
//                                                     /  X  X  \          \  /          /-->|___|-->           
//     i_data_bus[5*DATA_WIDTH+:DATA_WIDTH]  -->|¯¯¯|-/  / \/ \  \->|¯¯¯|---\/--->|¯¯¯|-/
//                                              |___|---/--/\--\--->|___|-\ /\ /->|___|
//                                                     /  /  \  \          X  X              
//     i_data_bus[6*DATA_WIDTH+:DATA_WIDTH]  -->|¯¯¯|-/  /    \  \->|¯¯¯|-/ \/ \->|¯¯¯|-\
//                                              |___|---/------\--->|___|---/\--->|___|  \-->|¯¯¯|
//                                                     /        \          /  \          /-->|___|-->      
//     i_data_bus[7*DATA_WIDTH+:DATA_WIDTH]  -->|¯¯¯|-/          \->|¯¯¯|-/    \->|¯¯¯|-/
//                                              |___|-------------->|___|-------->|___|
//
//        CONNECTION FUNCTION                           BUTTERFLY       BUTTERFLY           Merge stage
//       CONNECTION GROUP SIZE                             16               8 
//
// Control Signal
//     i_valid[0]-->|¯¯¯|<--i_cmd[2:0] 
//     i_valid[1]-->|___|
//     
// Author:      Jianming Tong (jianming.tong@gatech.edu)
/////////////////////////////////////////////////////////////


module unfoldedbutterfly_merge_comb#(
	parameter DATA_WIDTH = 32,     // could be arbitrary number
	parameter NUM_INPUT_DATA = 8,  // must be 2^n
	parameter NUM_OUTPUT_DATA = 4, // must be 2^n
    parameter COMMMAND_WIDTH = $clog2(NUM_OUTPUT_DATA), // destination tag, each level consumes 1 bit.
    parameter DESTINATION_TAG_WIDTH = COMMMAND_WIDTH    // destination tag, each level consumes 1 bit.
)(
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
	// --- Global parameter 
	localparam  WIDTH_INPUT_DATA = DATA_WIDTH * NUM_INPUT_DATA;
	localparam  WIDTH_OUTPUT_DATA = DATA_WIDTH * NUM_OUTPUT_DATA;
	
	// --- parameter for butterfly
	localparam  NUM_STAGE = $clog2(NUM_OUTPUT_DATA);       // note: # of stage in distribute noc depends on num_output_data instead of input.
	localparam  NUM_INPUT_DATA_BUTTERFLY = NUM_INPUT_DATA << 1;
	localparam  NUM_SWITCH_IN = NUM_INPUT_DATA_BUTTERFLY >> 1;

	// --- parameter for merge tree
	localparam  NUM_LEVEL = $clog2(NUM_INPUT_DATA) - $clog2(NUM_OUTPUT_DATA);

	// interface
	input  [NUM_INPUT_DATA-1:0]                                i_valid;             
	input  [WIDTH_INPUT_DATA-1:0]                              i_data_bus;
	
	output [NUM_OUTPUT_DATA-1:0]                               o_valid;             
	output [WIDTH_OUTPUT_DATA-1:0]                             o_data_bus;

	input                                                      i_en;
	input  [NUM_INPUT_DATA*DESTINATION_TAG_WIDTH-1:0]          i_cmd;
									// For each data with COMMAND_WIDTH destination tag. 
									// e.g. For 8-data input cube
									// 4-th input data has destination tag = 010 
									// 010 -> goes the 3th destination.

	// inner logic
	// --- wire data & valid inside the butterfly
	wire                                                       wire_valid_butterfly_inner[0:NUM_STAGE-1][0:NUM_INPUT_DATA_BUTTERFLY-1];
	wire   [DATA_WIDTH-1:0]                                    wire_data_butterfly_inner[0:NUM_STAGE-1][0:NUM_INPUT_DATA_BUTTERFLY-1];
	
	// --- wire data & valid inside the merge tree
	genvar i,g,s;
	generate
	wire   [NUM_INPUT_DATA_BUTTERFLY*DATA_WIDTH-1:0]           i_data_merge_tree_inner;
	wire   [NUM_INPUT_DATA_BUTTERFLY-1:0]                      i_data_valid_merge_tree_inner;

	
	// --- command wire in butterfly
	for (s=0; s<NUM_STAGE-1; s=s+1)
	begin:o_cmd_stage	 
	    // index 0 is for the output wire of the first stage
		wire [DESTINATION_TAG_WIDTH-2-s:0]                     o_cmd_data_wire_inner[0:NUM_INPUT_DATA_BUTTERFLY-1];       
		wire                                                   o_cmd_valid_wire_inner[0:NUM_INPUT_DATA_BUTTERFLY-1];
	end

	// first butterfly stage
	for(i=0; i< NUM_INPUT_DATA; i=i+1)
	begin:switch_first_stage			
		distribute_1x2_dst_tag_multicast_comb #(
			.DATA_WIDTH(DATA_WIDTH),
			.DESTINATION_TAG_WIDTH(DESTINATION_TAG_WIDTH)
		) first_stage(
			.i_valid(i_valid[i+:1]),
			.i_data_bus(i_data_bus[i*DATA_WIDTH+:DATA_WIDTH]),
			.o_valid({wire_valid_butterfly_inner[0][2*i+1], wire_valid_butterfly_inner[0][2*i]}),
			.o_data_bus({wire_data_butterfly_inner[0][2*i+1], wire_data_butterfly_inner[0][2*i]}),
			.i_en(i_en),
			.i_cmd(i_cmd[i*DESTINATION_TAG_WIDTH+:DESTINATION_TAG_WIDTH]),
			.o_cmd({o_cmd_stage[0].o_cmd_data_wire_inner[2*i+1], o_cmd_stage[0].o_cmd_data_wire_inner[2*i]})
		);
	end

	// butterfly stages afterward
	for(s=0; s<NUM_STAGE; s=s+1)
	begin:stage_afterwards
		for(g=0; g<(1<<s); g=g+1)
		begin:group
			for(i=0; i< (NUM_SWITCH_IN >> s); i=i+1)
			begin:switch
				localparam [$clog2(NUM_INPUT_DATA_BUTTERFLY)-1:0]   group_data_offset = g*(NUM_INPUT_DATA_BUTTERFLY>>s);
				localparam [$clog2(NUM_INPUT_DATA_BUTTERFLY)-1:0]   group_switch_offset = g*(NUM_SWITCH_IN>>s);
				localparam [$clog2(NUM_INPUT_DATA_BUTTERFLY)-1-s:0] idx = i[$clog2(NUM_INPUT_DATA_BUTTERFLY)-1-s:0];  // store the index of switch inside the group
				
				// inverse the MSB of the index of switch inside the group
				// For low input [Inverse MSB [$clog2(NUM_INPUT_DATA_BUTTERFLY)-1-s] ]
				localparam [$clog2(NUM_INPUT_DATA_BUTTERFLY)-1-s:0] HighDataInIdx =  (idx << 1) + 1;
				localparam [$clog2(NUM_INPUT_DATA_BUTTERFLY)-1-s:0] HighDataInIdxLSB2MSB = {HighDataInIdx[0], HighDataInIdx[$clog2(NUM_INPUT_DATA_BUTTERFLY)-2-s:0]};
				localparam [$clog2(NUM_INPUT_DATA_BUTTERFLY)-1-s:0] HighDataInIdxLSB_MSB_SWAP = {HighDataInIdxLSB2MSB[$clog2(NUM_INPUT_DATA_BUTTERFLY)-1-s:1], HighDataInIdx[$clog2(NUM_INPUT_DATA_BUTTERFLY)-1-s]};
				localparam [$clog2(NUM_INPUT_DATA_BUTTERFLY)-1:0] HighDataInIdxMSBInverseOffset = HighDataInIdxLSB_MSB_SWAP + group_data_offset;
				
				// For high input [Inverse MSB [$clog2(NUM_INPUT_DATA_BUTTERFLY)-1-s] ]
				localparam [$clog2(NUM_INPUT_DATA_BUTTERFLY)-1-s:0] LowDataInIdx =  (idx << 1);
				localparam [$clog2(NUM_INPUT_DATA_BUTTERFLY)-1-s:0] LowDataInIdxLSB2MSB = {LowDataInIdx[0], LowDataInIdx[$clog2(NUM_INPUT_DATA_BUTTERFLY)-2-s:0]};
				localparam [$clog2(NUM_INPUT_DATA_BUTTERFLY)-1-s:0] LowDataInIdxLSB_MSB_SWAP = {LowDataInIdxLSB2MSB[$clog2(NUM_INPUT_DATA_BUTTERFLY)-1-s:1], LowDataInIdx[$clog2(NUM_INPUT_DATA_BUTTERFLY)-1-s]};
				localparam [$clog2(NUM_INPUT_DATA_BUTTERFLY)-1:0] LowDataInIdxMSBInverseOffset = LowDataInIdxLSB_MSB_SWAP + group_data_offset;	
				
				if(s==(NUM_STAGE-1))
				begin: first_stage_of_merge_tree
					assign i_data_merge_tree_inner[((2*(i+group_switch_offset)+1)*DATA_WIDTH)+:DATA_WIDTH] = wire_data_butterfly_inner[s][HighDataInIdxMSBInverseOffset];
					assign i_data_merge_tree_inner[(2*(i+group_switch_offset)*DATA_WIDTH)+:DATA_WIDTH] = wire_data_butterfly_inner[s][LowDataInIdxMSBInverseOffset];
					assign i_data_valid_merge_tree_inner[(2*(i+group_switch_offset)+1)+:1] = wire_valid_butterfly_inner[s][HighDataInIdxMSBInverseOffset];
					assign i_data_valid_merge_tree_inner[(2*(i+group_switch_offset))+:1] = wire_valid_butterfly_inner[s][LowDataInIdxMSBInverseOffset];
				end
				else
				begin
					if(s==(NUM_STAGE-2))
					begin: last_stage_of_butterfly
						distribute_2x2_dst_tag_multicast_comb #(
							.DATA_WIDTH(DATA_WIDTH),
							.DESTINATION_TAG_WIDTH(DESTINATION_TAG_WIDTH - s - 1)
						) dis_2x2(
							.i_valid( {wire_valid_butterfly_inner[s][HighDataInIdxMSBInverseOffset], wire_valid_butterfly_inner[s][LowDataInIdxMSBInverseOffset]} ),
							.i_data_bus({wire_data_butterfly_inner[s][HighDataInIdxMSBInverseOffset], wire_data_butterfly_inner[s][LowDataInIdxMSBInverseOffset]}),
							.o_valid({wire_valid_butterfly_inner[s+1][2*(i+group_switch_offset)+1], wire_valid_butterfly_inner[s+1][2*(i+group_switch_offset)]}),
							.o_data_bus({wire_data_butterfly_inner[s+1][2*(i+group_switch_offset)+1], wire_data_butterfly_inner[s+1][2*(i+group_switch_offset)]}),
							.i_en(i_en),
							.i_cmd({o_cmd_stage[s].o_cmd_data_wire_inner[HighDataInIdxMSBInverseOffset], o_cmd_stage[s].o_cmd_data_wire_inner[LowDataInIdxMSBInverseOffset]}),
							.o_cmd()
						);
					end
					else
					begin: stage_of_butterfly
						distribute_2x2_dst_tag_multicast_comb #(
							.DATA_WIDTH(DATA_WIDTH),
							.DESTINATION_TAG_WIDTH(DESTINATION_TAG_WIDTH - s - 1)
						) dis_2x2(
							.i_valid( {wire_valid_butterfly_inner[s][HighDataInIdxMSBInverseOffset], wire_valid_butterfly_inner[s][LowDataInIdxMSBInverseOffset]} ),
							.i_data_bus({wire_data_butterfly_inner[s][HighDataInIdxMSBInverseOffset], wire_data_butterfly_inner[s][LowDataInIdxMSBInverseOffset]}),
							.o_valid({wire_valid_butterfly_inner[s+1][2*(i+group_switch_offset)+1], wire_valid_butterfly_inner[s+1][2*(i+group_switch_offset)]}),
							.o_data_bus({wire_data_butterfly_inner[s+1][2*(i+group_switch_offset)+1], wire_data_butterfly_inner[s+1][2*(i+group_switch_offset)]}),
							.i_en(i_en),
							.i_cmd({o_cmd_stage[s].o_cmd_data_wire_inner[HighDataInIdxMSBInverseOffset], o_cmd_stage[s].o_cmd_data_wire_inner[LowDataInIdxMSBInverseOffset]}),
							.o_cmd({o_cmd_stage[s+1].o_cmd_data_wire_inner[2*i+1], o_cmd_stage[s+1].o_cmd_data_wire_inner[2*i]})
						);
					end
				end
			end
		end
	end
	
	// merge stage
	merge_tree_autopick_multi_output_comb #(
		.NUM_INPUT_DATA(NUM_INPUT_DATA_BUTTERFLY),
		.NUM_OUTPUT_DATA(NUM_OUTPUT_DATA),
		.DATA_WIDTH(DATA_WIDTH)
	) merge_autopick(
		.i_valid(i_data_valid_merge_tree_inner),
		.i_data_bus(i_data_merge_tree_inner),
		.o_valid(o_valid),
		.o_data_bus(o_data_bus),
		.i_en(i_en)
	);
	endgenerate

endmodule