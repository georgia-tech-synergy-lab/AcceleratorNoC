`timescale 1ns / 1ps
/////////////////////////////////////////////////////////////
// Top Module:  benes_simple_comb
// Data:        Only data width matters.
// Format:      keeping the input format unchange
// Timing:      Combinational Logic
// Dummy Data:  {DATA_WIDTH{1'bz}}
// 
// Function:    Unicast  or  Multicast(Not arbitrary Multicast)
//   
//     i_data_bus[0*DATA_WIDTH+:DATA_WIDTH]  -->|¯¯¯|-------->|¯¯¯|------->|¯¯¯|------->|¯¯¯|-------->|¯¯¯|-->
//     i_data_bus[1*DATA_WIDTH+:DATA_WIDTH]  -->|___|-\ /---->|___|--\ /-->|___|--\ /-->|___|----\ /->|___|-->
//                                      ID:       0    X        4     X      8     X      12      X     16
//     i_data_bus[2*DATA_WIDTH+:DATA_WIDTH]  -->|¯¯¯|-/ \/--->|¯¯¯|--/ \-->|¯¯¯|--/ \-->|¯¯¯|---\/ \->|¯¯¯|-->
//     i_data_bus[3*DATA_WIDTH+:DATA_WIDTH]  -->|___|-\ /\ /->|___|------->|___|------->|___|-\ /\ /->|___|-->
//                                      ID:       1    X  X     5            9            13   X  X     17
//     i_data_bus[4*DATA_WIDTH+:DATA_WIDTH]  -->|¯¯¯|-/ \/ \->|¯¯¯|------->|¯¯¯|------->|¯¯¯|-/ \/ \->|¯¯¯|-->
//     i_data_bus[5*DATA_WIDTH+:DATA_WIDTH]  -->|___|-\ /\--->|___|--\ /-->|___|--\ /-->|___|---/\ /->|___|-->
//                                      ID:       2    X        6     X      10    X      14      X     18
//     i_data_bus[6*DATA_WIDTH+:DATA_WIDTH]  -->|¯¯¯|-/ \---->|¯¯¯|--/ \-->|¯¯¯|--/ \-->|¯¯¯|----/ \->|¯¯¯|-->
//     i_data_bus[7*DATA_WIDTH+:DATA_WIDTH]  -->|___|-------->|___|------->|___|------->|___|-------->|___|-->
//                                      ID:       3             7            11           15            19
//        CONNECTION FUNCTION                   INVERSE SHUFFLE      ,,         SHUFFLE       SHUFFLE
//       CONNECTION GROUP SIZE                         8             4             4             8
//        
// 
// Control Signal
//     i_valid[0]-->|¯¯¯|<--i_cmd[2:0] 
//     i_valid[1]-->|___|
//
//  The command lay out is shown below: Note: switch ID is specified in the diagram above.
// 
//  i_cmd: MSB [ ------------------------------------------------------------------------------------- ] LSB 
//   cmd for   SW19 SW18 SW17 SW16 SW15 SW14 SW13 SW12 SW11 SW10 SW9 SW8 SW7 SW6 SW5 SW4 SW3 SW2 SW1 SW0                
//
// Author:      Jianming Tong (jianming.tong@gatech.edu)
/////////////////////////////////////////////////////////////

// Note: use the SIMPLE_MODULAR version distribute_2x2_simple_comb.
// Need to set "`define in distribute_2x2_simple_comb.v"
module benes_simple_comb#(
	parameter DATA_WIDTH = 32,     // could be arbitrary number
	parameter COMMAND_WIDTH  = 2, // 2 when using simple distribute_2x2; 3 when using complex distribute_2x2;
	parameter NUM_INPUT_DATA = 8    // multiple be 2^n
)(
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

	localparam TOTAL_COMMAND = TOTAL_STAGE*NUM_SWITCH_IN*COMMAND_WIDTH;
	
	localparam WIDTH_INPUT_DATA = NUM_INPUT_DATA*DATA_WIDTH;
	
	// interface
	input  [NUM_INPUT_DATA-1:0]                  i_valid;             
	input  [WIDTH_INPUT_DATA-1:0]                i_data_bus;
	
	output [NUM_INPUT_DATA-1:0]                  o_valid;             
	output [WIDTH_INPUT_DATA-1:0]                o_data_bus; //{o_data_a, o_data_b}

	input                                        i_en;
	input  [TOTAL_COMMAND-1:0]                  i_cmd;
									// For each switch
									// 11 --> Multicast_HighIn
									// 00 --> Multicast_LowIn
									// 10 --> Pass Through
									// 01 --> Pass Switch


	// inner logic
	wire   [DATA_WIDTH-1:0]                      connection[0:TOTAL_STAGE-1][0:NUM_INPUT_DATA-1];
	wire                                         connection_valid[0:TOTAL_STAGE-1][0:NUM_INPUT_DATA-1];

	genvar i,k,s;
	
	generate
		// first stage
		for(i=0; i<NUM_SWITCH_IN; i=i+1)
		begin:first_stage_switch
			distribute_2x2_simple_comb #(
				.DATA_WIDTH(DATA_WIDTH),
				.COMMAND_WIDTH(COMMAND_WIDTH)
			) first_stage(
				.i_valid(i_valid[2*i+:2]),
				.i_data_bus(i_data_bus[i*2*DATA_WIDTH+:2*DATA_WIDTH]),
				.o_valid({connection_valid[0][2*i+1], connection_valid[0][2*i]}),
				.o_data_bus({connection[0][2*i+1], connection[0][2*i]}),
				.i_en(i_en),
				.i_cmd(i_cmd[i*COMMAND_WIDTH+:COMMAND_WIDTH])
			);
		end


		// second stage -> middle stage 
		// inverse shuffle function [loop right shift]:  output of i-th stage    -> input of (i+1)-th stage 
		// shuffle function         [loop left shift]:   input of (i+1)-th stage -> output of i-th stage
		for(s=0;s<(LEVEL-1);s=s+1)
		begin:first_half_stages
			localparam NUM_GROUP = 1<<s;
			localparam NUM_SWITCH_GROUP = NUM_SWITCH_IN>>s;
			localparam LEN_GOURP = $clog2(NUM_INPUT_DATA)-1-s;
			for(k=0;k<NUM_GROUP;k=k+1)
			begin:group_first_half
				for(i=0;i<NUM_SWITCH_GROUP;i=i+1)
				begin:switch_first_half
					localparam [$clog2(NUM_INPUT_DATA)-1:0]   group_switch_offset = k*(NUM_SWITCH_IN>>s);
					localparam [$clog2(NUM_INPUT_DATA)-1:0]   group_offset = k*(NUM_INPUT_DATA>>s);
					localparam                                MASK =  (1 << ($clog2(NUM_INPUT_DATA)-s)) - 1;

					// For low input [Loop left Shift (2*i)]
					localparam                                l_idx = (i << 1) & MASK;
					localparam                                l_idx_left_shift = (l_idx << 1) & MASK;
					localparam                                l_idx_MSB_1 = (1'b1 << LEN_GOURP) & MASK;
					localparam                                l_idx_MSB_is_1 = l_idx & l_idx_MSB_1;
					localparam                                l_idx_MSB_loop_shift = l_idx_MSB_is_1 >> LEN_GOURP;
					localparam                                l_idx_loop_left_shift = l_idx_MSB_loop_shift + l_idx_left_shift;
					localparam [$clog2(NUM_INPUT_DATA)-1:0]   l_idx_loop_left_shift_group = l_idx_loop_left_shift + group_offset;
					
					// For high input [Loop left Shift (2*i)+1]
					localparam                                h_idx = ((i << 1) + 1) & MASK;
					localparam                                h_idx_left_shift = (h_idx << 1) & MASK;
					localparam                                h_idx_MSB_1 = (1'b1 << LEN_GOURP) & MASK;
					localparam                                h_idx_MSB_is_1 =  h_idx&h_idx_MSB_1;
					localparam                                h_idx_MSB_loop_shift = h_idx_MSB_is_1 >> LEN_GOURP;
					localparam                                h_idx_loop_left_shift = h_idx_MSB_loop_shift + h_idx_left_shift;
					localparam [$clog2(NUM_INPUT_DATA)-1:0]   h_idx_loop_left_shift_group = h_idx_loop_left_shift + group_offset;

					distribute_2x2_simple_comb #(
						.DATA_WIDTH(DATA_WIDTH),
						.COMMAND_WIDTH(COMMAND_WIDTH)
					) third_stage(
						.i_valid({connection_valid[s][h_idx_loop_left_shift_group], connection_valid[s][l_idx_loop_left_shift_group]}),
						.i_data_bus({connection[s][h_idx_loop_left_shift_group], connection[s][l_idx_loop_left_shift_group]}),
						.o_valid({connection_valid[s+1][2*(i+group_switch_offset)+1], connection_valid[s+1][2*(i+group_switch_offset)]}),
						.o_data_bus({connection[s+1][2*(i+group_switch_offset)+1], connection[s+1][2*(i+group_switch_offset)]}),
						.i_en(i_en),
						.i_cmd(i_cmd[((s+1)*NUM_SWITCH_IN + group_switch_offset + i)*COMMAND_WIDTH+:COMMAND_WIDTH ])
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
			localparam [$clog2(NUM_INPUT_DATA):0] NUM_GROUP_SEC_HALF = 1 << num_group;
			for(k=0;k<NUM_GROUP_SEC_HALF;k=k+1)
			begin:group_sec_half
				localparam  NUM_SWITCH_IN_GROUP = NUM_SWITCH_IN>>num_group;
				for(i=0;i<NUM_SWITCH_IN_GROUP;i=i+1)
				begin:switch_sec_half
					// For low input [Loop right Shift (2*i)]
					// localparam [$clog2(NUM_INPUT_DATA)-1-num_group:0] idx = i[$clog2(NUM_INPUT_DATA)-1-num_group:0];
					localparam [$clog2(NUM_INPUT_DATA)-1:0]           group_switch_offset = k*(NUM_SWITCH_IN>>num_group);
					localparam [$clog2(NUM_INPUT_DATA)-1:0]           group_offset = k*(NUM_INPUT_DATA>>num_group);
					localparam                                        MASK =  (1 << ($clog2(NUM_INPUT_DATA)-num_group)) - 1;
					
					localparam                                        l_idx = ( i << 1) & MASK;
					localparam                                        l_idx_right_shift = (l_idx >> 1) & MASK;
					localparam                                        l_idx_LSB_is_1 = l_idx&1'b1;
					localparam                                        l_idx_LSB_loop_shift = l_idx_LSB_is_1 <<  ($clog2(NUM_INPUT_DATA)-1-num_group);
					localparam                                        l_idx_loop_right_shift = l_idx_LSB_loop_shift + l_idx_right_shift;
					localparam [$clog2(NUM_INPUT_DATA)-1:0]           l_idx_loop_right_shift_group = l_idx_loop_right_shift + group_offset;

					// For high input [Loop right Shift (2*i+1)]
					localparam                                        h_idx = ((i << 1) + 1) & MASK;
					localparam                                        h_idx_right_shift = (h_idx >> 1) & MASK;
					localparam                                        h_idx_LSB_is_1 = h_idx&1'b1;
					localparam                                        h_idx_LSB_loop_shift = h_idx_LSB_is_1 <<  ($clog2(NUM_INPUT_DATA)-1-num_group);
					localparam                                        h_idx_loop_right_shift = h_idx_LSB_loop_shift + h_idx_right_shift;
					localparam [$clog2(NUM_INPUT_DATA)-1:0]           h_idx_loop_right_shift_group = h_idx_loop_right_shift + group_offset;

					distribute_2x2_simple_comb #(
						.DATA_WIDTH(DATA_WIDTH),
						.COMMAND_WIDTH(COMMAND_WIDTH)
					) third_stage(
						.i_valid({connection_valid[s][h_idx_loop_right_shift_group], connection_valid[s][l_idx_loop_right_shift_group]}),
						.i_data_bus({connection[s][h_idx_loop_right_shift_group], connection[s][l_idx_loop_right_shift_group]}),
						.o_valid({connection_valid[s+1][2*(i+group_switch_offset)+1], connection_valid[s+1][2*(i+group_switch_offset)]}),
						.o_data_bus({connection[s+1][2*(i+group_switch_offset)+1], connection[s+1][2*(i+group_switch_offset)]}),
						.i_en(i_en),
						.i_cmd(i_cmd[((s+1)*NUM_SWITCH_IN + group_switch_offset + i)*COMMAND_WIDTH+:COMMAND_WIDTH ])
					);
				end
			end
		end


		for(i=0;i<NUM_INPUT_DATA;i=i+1)
		begin: output_data
			assign o_data_bus[i*DATA_WIDTH+:DATA_WIDTH] = connection[TOTAL_STAGE-1][i];
			assign o_valid[i+:1] = connection_valid[TOTAL_STAGE-1][i];
		end
		
	endgenerate


endmodule

