`timescale 1ns / 1ps
/////////////////////////////////////////////////////////////
// Top Module:  benes_comb
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

module benes_comb#(
	parameter DATA_WIDTH = 32,     // could be arbitrary number
	parameter COMMMAND_WIDTH  = 2, // 2 when using simple distribute_2x2; 3 when using complex distribute_2x2;
	parameter NUM_SWITCH_IN = 8    // multiple be 2^n
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
	localparam NUM_INPUT_DATA = 2*NUM_SWITCH_IN;

	localparam LEVEL = $clog2(NUM_INPUT_DATA);
	localparam TOTAL_STAGE = 2*LEVEL-1;

	localparam TOTAL_COMMMAND = TOTAL_STAGE*NUM_SWITCH_IN*COMMMAND_WIDTH;
	
	localparam WIDTH_INPUT_DATA = NUM_INPUT_DATA*DATA_WIDTH;
	
	// interface
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

	genvar i,j,k,s;
	
	generate
		// first stage
		for(i=0; i<NUM_SWITCH_IN; i=i+1)
		begin:first_stage_switch
			distribute_2x2_comb #(
				.DATA_WIDTH(DATA_WIDTH),
				.COMMMAND_WIDTH(COMMMAND_WIDTH)
			) first_stage(
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

					distribute_2x2_comb #(
						.DATA_WIDTH(DATA_WIDTH),
						.COMMMAND_WIDTH(COMMMAND_WIDTH)
					) third_stage(
						.i_valid({connection_valid[s][h_idx_loop_left_shift_group], connection_valid[s][l_idx_loop_left_shift_group]}),
						.i_data_bus({connection[s][h_idx_loop_left_shift_group], connection[s][l_idx_loop_left_shift_group]}),
						.o_valid({connection_valid[s+1][2*(i+group_switch_offset)+1], connection_valid[s+1][2*(i+group_switch_offset)]}),
						.o_data_bus({connection[s+1][2*(i+group_switch_offset)+1], connection[s+1][2*(i+group_switch_offset)]}),
						.i_en(i_en),
						.i_cmd(i_cmd[((s+1)*NUM_SWITCH_IN + group_switch_offset + i)*COMMMAND_WIDTH+:COMMMAND_WIDTH ])
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

					distribute_2x2_comb #(
						.DATA_WIDTH(DATA_WIDTH),
						.COMMMAND_WIDTH(COMMMAND_WIDTH)
					) third_stage(
						.i_valid({connection_valid[s][h_idx_loop_right_shift_group], connection_valid[s][l_idx_loop_right_shift_group]}),
						.i_data_bus({connection[s][h_idx_loop_right_shift_group], connection[s][l_idx_loop_right_shift_group]}),
						.o_valid({connection_valid[s+1][2*(i+group_switch_offset)+1], connection_valid[s+1][2*(i+group_switch_offset)]}),
						.o_data_bus({connection[s+1][2*(i+group_switch_offset)+1], connection[s+1][2*(i+group_switch_offset)]}),
						.i_en(i_en),
						.i_cmd(i_cmd[((s+1)*NUM_SWITCH_IN + group_switch_offset + i)*COMMMAND_WIDTH+:COMMMAND_WIDTH ])
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

