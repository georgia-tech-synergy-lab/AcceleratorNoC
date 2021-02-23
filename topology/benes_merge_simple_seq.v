`timescale 1ns / 1ps
/////////////////////////////////////////////////////////////
// Top Module:  benes_merge_simple_seq
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
//        CONNECTION FUNCTION                   INVERSE SHUFFLE      ,,         SHUFFLE       SHUFFLE   |    Merge
//       CONNECTION GROUP SIZE                         8             4             4             8      v
//                                                                       this stage is the first stage of Merge tree. So it's 2x1 instead of 2x2 
// Control Signal
//     i_valid[0]-->|¯¯¯|<--i_cmd[2:0] 
//     i_valid[1]-->|___|
//     
// Author:      Jianming Tong (jianming.tong@gatech.edu)
/////////////////////////////////////////////////////////////


// Note: use the SIMPLE_MODULAR version distribute_2x2_simple_seq.
// Need to set "`define SIMPLE_MODULAR in distribute_2x2_simple_seq.v"
module benes_merge_simple_seq#(
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

	localparam TOTAL_COMMMAND = (TOTAL_STAGE-1)*NUM_SWITCH_IN*COMMMAND_WIDTH;
	
	localparam WIDTH_INPUT_DATA = NUM_INPUT_DATA*DATA_WIDTH;
	localparam WIDTH_OUTPUT_DATA = DATA_WIDTH * NUM_OUTPUT_DATA;
	
	// interface
	input                                        clk;
	input                                        rst;
	
	input  [NUM_INPUT_DATA-1:0]                  i_valid;             
	input  [WIDTH_INPUT_DATA-1:0]                i_data_bus;
	
	output [NUM_OUTPUT_DATA-1:0]                 o_valid;             
	output [WIDTH_OUTPUT_DATA-1:0]               o_data_bus; //{o_data_a, o_data_b}

	input                                        i_en;
	input  [TOTAL_COMMMAND-1:0]                  i_cmd;
									// 11 --> Multicast_HighIn
									// 00 --> Multicast_LowIn
									// 10 --> Pass Through
									// 01 --> Pass Switch


	// inner logic
	wire   [DATA_WIDTH-1:0]                      connection[0:TOTAL_STAGE-1][0:NUM_INPUT_DATA-1];
	wire                                         connection_valid[0:TOTAL_STAGE-1][0:NUM_INPUT_DATA-1];

	// logic to connect BENES w/o last stage to merge tree
	wire   [NUM_INPUT_DATA*DATA_WIDTH-1:0]       i_data_merge_tree_inner;
	wire   [NUM_INPUT_DATA-1:0]                  i_data_valid_merge_tree_inner;


	genvar i,j,k,s,p;
	generate

		// logic for control pipeline
		for(i=0; i<TOTAL_STAGE-2;i=i+1)
		begin:cmd_pipeline_stage
			localparam NUM_STAGE = TOTAL_STAGE-i-1;
			reg  [COMMMAND_WIDTH-1:0]                pipeline_i_cmd_reg[0:NUM_STAGE-1][0:NUM_SWITCH_IN-1]; // pipeline_i_cmd_reg[0][x] stores the i_cmd for stage 1 instead of stage 0.    
		end
		
		for(i=0;i<TOTAL_STAGE-2;i=i+1)  // from second stage to the end;
		begin
			for(j=0;j<NUM_SWITCH_IN;j=j+1)
			begin
				always@(posedge clk)
				begin
					cmd_pipeline_stage[0].pipeline_i_cmd_reg[i][j] <= i_cmd[((i+1)*NUM_SWITCH_IN+j)*COMMMAND_WIDTH+:COMMMAND_WIDTH];
				end
			end
		end
		
		for(p=0; p<TOTAL_STAGE-3;p=p+1)
		begin
			localparam NUM_STAGE_IN_PIPELINE = TOTAL_STAGE-p-1;
			for(i=0;i<NUM_STAGE_IN_PIPELINE;i=i+1)  // from second stage to the end;
			begin
				for(j=0;j<NUM_SWITCH_IN;j=j+1)
				begin
					always@(posedge clk)
					begin
						cmd_pipeline_stage[p+1].pipeline_i_cmd_reg[i][j] <= cmd_pipeline_stage[p].pipeline_i_cmd_reg[i+1][j];
					end
				end
			end
		end
		
		// first stage
		for(i=0; i<NUM_SWITCH_IN; i=i+1)
		begin:first_stage_switch
			distribute_2x2_simple_seq #(
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



		// second stage -> middle stage 
		// inverse shuffle function [loop right shift]:  output of i-th stage    -> input of (i+1)-th stage 
		// shuffle function         [loop left shift]:   input of (i+1)-th stage -> output of i-th stage
		for(s=0;s<LEVEL-1;s=s+1)
		begin:first_half_stages
			for(k=0;k<(1<<s);k=k+1)
			begin:group
				for(i=0;i<(NUM_SWITCH_IN>>s);i=i+1)
				begin:switch
					// For low input [Loop left Shift (2*i)]
					localparam [$clog2(NUM_INPUT_DATA)-1-s:0] idx = i[$clog2(NUM_INPUT_DATA)-1-s:0];
					localparam [$clog2(NUM_INPUT_DATA)-1:0]   group_switch_offset = k*(NUM_SWITCH_IN>>s);
					localparam [$clog2(NUM_INPUT_DATA)-1:0]   group_offset = k*(NUM_INPUT_DATA>>s);

					localparam [$clog2(NUM_INPUT_DATA)-1-s:0] l_idx = (idx << 1);
					localparam [$clog2(NUM_INPUT_DATA)-1-s:0] l_idx_left_shift = (l_idx << 1);
					localparam [$clog2(NUM_INPUT_DATA)-1-s:0] l_idx_MSB_1 = 1'b1 << ($clog2(NUM_INPUT_DATA)-1-s);
					localparam [$clog2(NUM_INPUT_DATA)-1-s:0] l_idx_MSB_is_1 = l_idx&l_idx_MSB_1;
					localparam [$clog2(NUM_INPUT_DATA)-1-s:0] l_idx_MSB_loop_shift = l_idx_MSB_is_1 >> ($clog2(NUM_INPUT_DATA)-1-s);
					localparam [$clog2(NUM_INPUT_DATA)-1-s:0] l_idx_loop_left_shift = l_idx_MSB_loop_shift + l_idx_left_shift;
					localparam [$clog2(NUM_INPUT_DATA)-1:0]   l_idx_loop_left_shift_group = l_idx_loop_left_shift + group_offset;

					// For high input [Loop left Shift (2*i+1)]
					localparam [$clog2(NUM_INPUT_DATA)-1-s:0] h_idx = (idx << 1) + 1;
					localparam [$clog2(NUM_INPUT_DATA)-1-s:0] h_idx_left_shift = h_idx << 1;
					localparam [$clog2(NUM_INPUT_DATA)-1-s:0] h_idx_MSB_1 = 1'b1 << ($clog2(NUM_INPUT_DATA)-1-s);
					localparam [$clog2(NUM_INPUT_DATA)-1-s:0] h_idx_MSB_is_1 =  h_idx&h_idx_MSB_1;
					localparam [$clog2(NUM_INPUT_DATA)-1-s:0] h_idx_MSB_loop_shift = h_idx_MSB_is_1 >> ($clog2(NUM_INPUT_DATA)-1-s);
					localparam [$clog2(NUM_INPUT_DATA)-1-s:0] h_idx_loop_left_shift = h_idx_MSB_loop_shift + h_idx_left_shift;
					localparam [$clog2(NUM_INPUT_DATA)-1:0]   h_idx_loop_left_shift_group = h_idx_loop_left_shift + group_offset;

					distribute_2x2_simple_seq #(
						.DATA_WIDTH(DATA_WIDTH),
						.COMMMAND_WIDTH(COMMMAND_WIDTH)
					) third_stage(
						.clk(clk),
						.rst(rst),
						.i_valid({connection_valid[s][h_idx_loop_left_shift_group], connection_valid[s][l_idx_loop_left_shift_group]}),
						.i_data_bus({connection[s][h_idx_loop_left_shift_group], connection[s][l_idx_loop_left_shift_group]}),
						.o_valid({connection_valid[s+1][2*(i+group_switch_offset)+1], connection_valid[s+1][2*(i+group_switch_offset)]}),
						.o_data_bus({connection[s+1][2*(i+group_switch_offset)+1], connection[s+1][2*(i+group_switch_offset)]}),
						.i_en(i_en),
						.i_cmd(cmd_pipeline_stage[s].pipeline_i_cmd_reg[0][group_switch_offset + i])
					);
				end
			end
		end


		// middle stage -> last stage 
		// shuffle function         [loop left shift]:   output of i-th stage    -> input of (i+1)-th stage
		// inverse shuffle function [loop right shift]:  input of (i+1)-th stage -> output of i-th stage 
		for(s=(LEVEL-1);s<(TOTAL_STAGE-1);s=s+1)
		begin:second_half_stages
			localparam [$clog2(NUM_INPUT_DATA):0] num_group = TOTAL_STAGE-2-s;
			for(k=0;k<(1<<num_group);k=k+1)
			begin:group
				for(i=0;i<(NUM_SWITCH_IN>>num_group);i=i+1)
				begin:switch
					// For low input [Loop right Shift (2*i)]
					localparam [$clog2(NUM_INPUT_DATA)-1-num_group:0] idx = i[$clog2(NUM_INPUT_DATA)-1-num_group:0];
					localparam [$clog2(NUM_INPUT_DATA)-1:0]           group_switch_offset = k*(NUM_SWITCH_IN>>num_group);
					localparam [$clog2(NUM_INPUT_DATA)-1:0]           group_offset = k*(NUM_INPUT_DATA>>num_group);
					
					localparam [$clog2(NUM_INPUT_DATA)-1-num_group:0] l_idx = (idx << 1);
					localparam [$clog2(NUM_INPUT_DATA)-1-num_group:0] l_idx_right_shift = l_idx >> 1;
					localparam [$clog2(NUM_INPUT_DATA)-1-num_group:0] l_idx_LSB_is_1 = l_idx&1'b1;
					localparam [$clog2(NUM_INPUT_DATA)-1-num_group:0] l_idx_LSB_loop_shift = l_idx_LSB_is_1 <<  ($clog2(NUM_INPUT_DATA)-1-num_group);
					localparam [$clog2(NUM_INPUT_DATA)-1-num_group:0] l_idx_loop_right_shift = l_idx_LSB_loop_shift + l_idx_right_shift;
					localparam [$clog2(NUM_INPUT_DATA)-1:0]           l_idx_loop_right_shift_group = l_idx_loop_right_shift + group_offset;

					// For high input [Loop right Shift (2*i+1)]
					localparam [$clog2(NUM_INPUT_DATA)-1-num_group:0] h_idx = (idx << 1) + 1;
					localparam [$clog2(NUM_INPUT_DATA)-1-num_group:0] h_idx_right_shift = h_idx >> 1;
					localparam [$clog2(NUM_INPUT_DATA)-1-num_group:0] h_idx_LSB_is_1 = h_idx&1'b1;
					localparam [$clog2(NUM_INPUT_DATA)-1-num_group:0] h_idx_LSB_loop_shift = h_idx_LSB_is_1 <<  ($clog2(NUM_INPUT_DATA)-1-num_group);
					localparam [$clog2(NUM_INPUT_DATA)-1-num_group:0] h_idx_loop_right_shift = h_idx_LSB_loop_shift + h_idx_right_shift;
					localparam [$clog2(NUM_INPUT_DATA)-1:0]           h_idx_loop_right_shift_group = h_idx_loop_right_shift + group_offset;

					if(s==(TOTAL_STAGE-2))
					begin
						assign i_data_merge_tree_inner[((2*(i+group_switch_offset)+1)*DATA_WIDTH)+:DATA_WIDTH] = connection[s][h_idx_loop_right_shift_group];
						assign i_data_merge_tree_inner[(2*(i+group_switch_offset)*DATA_WIDTH)+:DATA_WIDTH] = connection[s][l_idx_loop_right_shift_group];
						assign i_data_valid_merge_tree_inner[(2*(i+group_switch_offset)+1)+:1] = connection_valid[s][h_idx_loop_right_shift_group];
						assign i_data_valid_merge_tree_inner[(2*(i+group_switch_offset))+:1] = connection_valid[s][l_idx_loop_right_shift_group];
					end
					else
					begin
						distribute_2x2_simple_seq #(
							.DATA_WIDTH(DATA_WIDTH),
							.COMMMAND_WIDTH(COMMMAND_WIDTH)
						) third_stage(
							.clk(clk),
							.rst(rst),
							.i_valid({connection_valid[s][h_idx_loop_right_shift_group], connection_valid[s][l_idx_loop_right_shift_group]}),
							.i_data_bus({connection[s][h_idx_loop_right_shift_group], connection[s][l_idx_loop_right_shift_group]}),
							.o_valid({connection_valid[s+1][2*(i+group_switch_offset)+1], connection_valid[s+1][2*(i+group_switch_offset)]}),
							.o_data_bus({connection[s+1][2*(i+group_switch_offset)+1], connection[s+1][2*(i+group_switch_offset)]}),
							.i_en(i_en),
							.i_cmd(cmd_pipeline_stage[s].pipeline_i_cmd_reg[0][group_switch_offset + i])
						);
					end
				end
			end
		end

		// merge tree
		merge_tree_autopick_multi_output_seq#(
			.NUM_INPUT_DATA(NUM_INPUT_DATA), 
			.DATA_WIDTH(DATA_WIDTH),
			.NUM_OUTPUT_DATA(NUM_OUTPUT_DATA))
		merge_network(
			.clk(clk),
			.rst(rst),
			.i_valid(i_data_valid_merge_tree_inner),
			.i_data_bus(i_data_merge_tree_inner),
			.o_valid(o_valid),
			.o_data_bus(o_data_bus),
			.i_en(i_en)
		);

	endgenerate

endmodule
