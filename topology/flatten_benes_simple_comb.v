`timescale 1ns / 1ps
/////////////////////////////////////////////////////////////
// Top Module:  flatten_benes_simple_comb
// Data:        Only data width matters.
// Format:      keeping the input format unchange
// Timing:      Combinational Logic
// Dummy Data:  {DATA_WIDTH{1'b0}}
// 
// Function:    Unicast  or  Multicast(Not arbitrary Multicast)
//   The following diagram is a benes network, the flatten_BENES network 
//   is a topology which encompass the **connection function** into the switch
//   to trade the logic inside switch for long wire.
//  
//   Note: Please take a look at the slides of the repo to take a look at the flatten butterfly
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
//        CONNECTION FUNCTION                   INVERSE SHUFFLE      ,,         SHUFFLE       SHUFFLE
//       CONNECTION GROUP SIZE                         8             4             4             8
//        
// Control Signal
//     i_valid[0]-->|¯¯¯|<--i_cmd[2:0] 
//     i_valid[1]-->|___|
//     
// Author:      Jianming Tong (jianming.tong@gatech.edu)
/////////////////////////////////////////////////////////////

// Note: use the SIMPLE_MODULAR version distribute_2x2_simple_comb.
// Need to set "`define SIMPLE_MODULAR in distribute_2x2_simple_comb.v"

module flatten_benes_simple_comb#(
	parameter DATA_WIDTH = 4,     // could be arbitrary number
	parameter COMMMAND_WIDTH  = 5, // 2 when using simple distribute_2x2; 3 when using complex distribute_2x2;
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
	localparam TOTAL_HALF_STAGE = LEVEL-1;

	localparam TOTAL_COMMMAND = TOTAL_STAGE*NUM_SWITCH_IN*COMMMAND_WIDTH;
	localparam NUM_FWD_LINK_PER_STAGE = NUM_INPUT_DATA>>1;
	
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

	genvar i,j,k,s,p;
	generate
	// inner logic
		wire   [DATA_WIDTH-1:0]                      connection[0:TOTAL_STAGE-1][0:NUM_INPUT_DATA-1];
		wire                                         connection_valid[0:TOTAL_STAGE-1][0:NUM_INPUT_DATA-1];

		wire   [DATA_WIDTH-1:0]                      fwd_connection_frist_half[0:TOTAL_HALF_STAGE-1][0:NUM_FWD_LINK_PER_STAGE-1];
		wire                                         fwd_connection_valid_frist_half[0:TOTAL_HALF_STAGE-1][0:NUM_FWD_LINK_PER_STAGE-1];

		wire   [DATA_WIDTH-1:0]                      fwd_connection_sec_half[0:TOTAL_HALF_STAGE-1][0:NUM_FWD_LINK_PER_STAGE-1];
		wire                                         fwd_connection_valid_sec_half[0:TOTAL_HALF_STAGE-1][0:NUM_FWD_LINK_PER_STAGE-1];

		// logic for control pipeline
		for(i=0; i<TOTAL_STAGE-1;i=i+1)
		begin:cmd_pipeline_stage
			localparam NUM_STAGE = TOTAL_STAGE-i-1;
			reg  [COMMMAND_WIDTH-1:0]            pipeline_i_cmd_reg[0:NUM_STAGE-1][0:NUM_SWITCH_IN-1]; // pipeline_i_cmd_reg[0][x] stores the i_cmd for stage 1 instead of stage 0.    
		end
		
		for(i=0;i<TOTAL_STAGE-1;i=i+1)  // from second stage to the end;
		begin
			for(j=0;j<NUM_SWITCH_IN;j=j+1)
			begin
				always@(*)
				begin
					cmd_pipeline_stage[0].pipeline_i_cmd_reg[i][j] <= i_cmd[((i+1)*NUM_SWITCH_IN+j)*COMMMAND_WIDTH+:COMMMAND_WIDTH];
				end
			end
		end
		
		for(p=0; p<TOTAL_STAGE-2;p=p+1)
		begin
			localparam NUM_STAGE_IN_PIPELINE = TOTAL_STAGE-p-1;
			for(i=0;i<NUM_STAGE_IN_PIPELINE;i=i+1)  // from third stage to the end;
			begin
				for(j=0;j<NUM_SWITCH_IN;j=j+1)
				begin
					always@(*)
					begin
						cmd_pipeline_stage[p+1].pipeline_i_cmd_reg[i][j] <= cmd_pipeline_stage[p].pipeline_i_cmd_reg[i+1][j];
					end
				end
			end
		end


		// first half
		for(i=0; i< TOTAL_HALF_STAGE; i=i+1)
		// for( i=0; i<1; i=i+1)
		begin:first_half_stages
			localparam HALF_GROUP_BASE = NUM_INPUT_DATA>>(2+i);
			localparam GROUP_BASE = NUM_INPUT_DATA>>(1+i);
			localparam NUM_GROUP = 1 << i;
			for(j=0; j< NUM_GROUP;j=j+1)
			begin:sw_group

				// upper half of the group
				for(k=0; k<HALF_GROUP_BASE; k=k+1)
				begin:upper_group
					
					localparam in_top_group_base = 2*(j*GROUP_BASE + k);
					localparam in_bottom_group_base = 2*(j*GROUP_BASE + HALF_GROUP_BASE + k);
					
					localparam top_group_base = j*GROUP_BASE + k;
					localparam bottom_group_base = j*GROUP_BASE + HALF_GROUP_BASE + k;			
					
					if(i==0)
					begin
						distribute_3x3_simple_comb #(
							.DATA_WIDTH(DATA_WIDTH),
							.COMMMAND_WIDTH(COMMMAND_WIDTH)
						) upper_sw_first_stage(
							.i_valid(i_valid[in_top_group_base+:2]),
							.i_data_bus(i_data_bus[in_top_group_base*DATA_WIDTH+:2*DATA_WIDTH]),
							// .o_valid(o_valid[in_top_group_base*2+:2]),
							// .o_data_bus(o_data_bus[in_top_group_base*2*DATA_WIDTH+:2*DATA_WIDTH]),
							.o_valid({connection_valid[i][in_top_group_base+1], connection_valid[i][in_top_group_base]}),
							.o_data_bus({connection[i][in_top_group_base+1], connection[i][in_top_group_base]}),
							.i_en(i_en),
							.i_cmd(i_cmd[top_group_base*COMMMAND_WIDTH+:COMMMAND_WIDTH]),
							.i_fwd_valid(fwd_connection_valid_frist_half[i][top_group_base]),       // input forward valid
							.i_fwd_data_bus(fwd_connection_frist_half[i][top_group_base]),          // input data
							.o_fwd_valid(fwd_connection_valid_frist_half[i][bottom_group_base]),    // output forward valid
							.o_fwd_data_bus(fwd_connection_frist_half[i][bottom_group_base])        // output data
						);
					end
					else
					begin
						distribute_3x3_simple_comb #(
							.DATA_WIDTH(DATA_WIDTH),
							.COMMMAND_WIDTH(COMMMAND_WIDTH)
						) upper_sw(
							.i_valid({connection_valid[i-1][in_top_group_base+1], connection_valid[i-1][in_top_group_base]}),
							.i_data_bus({connection[i-1][in_top_group_base+1], connection[i-1][in_top_group_base]}),
							.o_valid({connection_valid[i][in_top_group_base+1], connection_valid[i][in_top_group_base]}),
							.o_data_bus({connection[i][in_top_group_base+1], connection[i][in_top_group_base]}),
							.i_en(i_en),
							.i_cmd(cmd_pipeline_stage[i-1].pipeline_i_cmd_reg[0][top_group_base]),
							.i_fwd_valid(fwd_connection_valid_frist_half[i][top_group_base]),       // input forward valid
							.i_fwd_data_bus(fwd_connection_frist_half[i][top_group_base]),          // input data
							.o_fwd_valid(fwd_connection_valid_frist_half[i][bottom_group_base]),    // output forward valid
							.o_fwd_data_bus(fwd_connection_frist_half[i][bottom_group_base])        // output data
						);
					end
				end

				// bottom half of the group
				for(k=0; k<HALF_GROUP_BASE; k=k+1)
				begin:bottom_group
					localparam in_top_group_base = 2*(j*GROUP_BASE + k);
					localparam in_bottom_group_base = 2*(j*GROUP_BASE + HALF_GROUP_BASE + k);

					localparam top_group_base = j*GROUP_BASE + k;
					localparam bottom_group_base = j*GROUP_BASE + HALF_GROUP_BASE + k;

					if(i==0)
					begin
						distribute_3x3_simple_comb #(
							.DATA_WIDTH(DATA_WIDTH),
							.COMMMAND_WIDTH(COMMMAND_WIDTH)
						) bottom_sw_first_stage(
							.i_valid(i_valid[in_bottom_group_base+:2]),
							.i_data_bus(i_data_bus[in_bottom_group_base*DATA_WIDTH+:2*DATA_WIDTH]),
							// .o_valid(o_valid[in_bottom_group_base+:2]),
							// .o_data_bus(o_data_bus[in_bottom_group_base*DATA_WIDTH+:2*DATA_WIDTH]),
							.o_valid({connection_valid[i][in_bottom_group_base+1], connection_valid[i][in_bottom_group_base]}),
							.o_data_bus({connection[i][in_bottom_group_base+1], connection[i][in_bottom_group_base]}),
							.i_en(i_en),
							.i_cmd(i_cmd[bottom_group_base*COMMMAND_WIDTH+:COMMMAND_WIDTH]),
							.i_fwd_valid(fwd_connection_valid_frist_half[i][bottom_group_base]),    // input forward valid
							.i_fwd_data_bus(fwd_connection_frist_half[i][bottom_group_base]),       // input data
							.o_fwd_valid(fwd_connection_valid_frist_half[i][top_group_base]),       // output forward valid
							.o_fwd_data_bus(fwd_connection_frist_half[i][top_group_base])           // output data
						);
					end
					else
					begin
						distribute_3x3_simple_comb #(
							.DATA_WIDTH(DATA_WIDTH),
							.COMMMAND_WIDTH(COMMMAND_WIDTH)
						) bottom_sw(
							.i_valid({connection_valid[i-1][in_bottom_group_base+1], connection_valid[i-1][in_bottom_group_base]}),
							.i_data_bus({connection[i-1][in_bottom_group_base+1], connection[i-1][in_bottom_group_base]}),
							.o_valid({connection_valid[i][in_bottom_group_base+1], connection_valid[i][in_bottom_group_base]}),
							.o_data_bus({connection[i][in_bottom_group_base+1], connection[i][in_bottom_group_base]}),
							.i_en(i_en),
							.i_cmd(cmd_pipeline_stage[i-1].pipeline_i_cmd_reg[0][bottom_group_base]),
							.i_fwd_valid(fwd_connection_valid_frist_half[i][bottom_group_base]),    // input forward valid
							.i_fwd_data_bus(fwd_connection_frist_half[i][bottom_group_base]),       // input data
							.o_fwd_valid(fwd_connection_valid_frist_half[i][top_group_base]),       // output forward valid
							.o_fwd_data_bus(fwd_connection_frist_half[i][top_group_base])           // output data
						);
					end
				end
			end		
		end

		// middle stage
		for(i=0; i<NUM_SWITCH_IN; i=i+1)
		begin:middle_stage
			distribute_2x2_simple_comb #(
				.DATA_WIDTH(DATA_WIDTH),
				.COMMMAND_WIDTH(COMMMAND_WIDTH-3)
			) middle_stage(
				.i_valid({connection_valid[TOTAL_HALF_STAGE-1][2*i+1], connection_valid[TOTAL_HALF_STAGE-1][2*i]}),
				.i_data_bus({connection[TOTAL_HALF_STAGE-1][2*i+1], connection[TOTAL_HALF_STAGE-1][2*i]}),
				.o_valid({connection_valid[TOTAL_HALF_STAGE][2*i+1], connection_valid[TOTAL_HALF_STAGE][2*i]}),
				.o_data_bus({connection[TOTAL_HALF_STAGE][2*i+1], connection[TOTAL_HALF_STAGE][2*i]}),
				.i_en(i_en),
				.i_cmd(cmd_pipeline_stage[TOTAL_HALF_STAGE-1].pipeline_i_cmd_reg[0][i])
			);
		end

		// second half
		for(i=TOTAL_HALF_STAGE+1; i<TOTAL_STAGE; i=i+1)
		begin:second_half_stages
			localparam HALF_GROUP_BASE = 1<<(i-TOTAL_HALF_STAGE-1);
			localparam GROUP_BASE = HALF_GROUP_BASE<<1;
			localparam NUM_GROUP = NUM_INPUT_DATA >> (1+i-TOTAL_HALF_STAGE);
			for(j=0; j< NUM_GROUP;j=j+1)
			begin:sw_group

				// upper half of the group
				for(k=0; k<HALF_GROUP_BASE; k=k+1)
				begin:upper_group
					
					localparam in_top_group_base = 2*(j*GROUP_BASE + k);
					localparam in_bottom_group_base = 2*(j*GROUP_BASE + HALF_GROUP_BASE + k);
					
					localparam top_group_base = j*GROUP_BASE + k;
					localparam bottom_group_base = j*GROUP_BASE + HALF_GROUP_BASE + k;			
					
					distribute_3x3_simple_comb #(
						.DATA_WIDTH(DATA_WIDTH),
						.COMMMAND_WIDTH(COMMMAND_WIDTH)
					) upper_sw(
						.i_valid({connection_valid[i-1][in_top_group_base+1], connection_valid[i-1][in_top_group_base]}),
						.i_data_bus({connection[i-1][in_top_group_base+1], connection[i-1][in_top_group_base]}),
						.o_valid({connection_valid[i][in_top_group_base+1], connection_valid[i][in_top_group_base]}),
						.o_data_bus({connection[i][in_top_group_base+1], connection[i][in_top_group_base]}),
						.i_en(i_en),
						.i_cmd(cmd_pipeline_stage[i-1].pipeline_i_cmd_reg[0][top_group_base]),
						.i_fwd_valid(fwd_connection_valid_sec_half[i-TOTAL_HALF_STAGE-1][top_group_base]),       // input forward valid
						.i_fwd_data_bus(fwd_connection_sec_half[i-TOTAL_HALF_STAGE-1][top_group_base]),          // input data
						.o_fwd_valid(fwd_connection_valid_sec_half[i-TOTAL_HALF_STAGE-1][bottom_group_base]),    // output forward valid
						.o_fwd_data_bus(fwd_connection_sec_half[i-TOTAL_HALF_STAGE-1][bottom_group_base])        // output data
					);
				end

				// bottom half of the group
				for(k=0; k<HALF_GROUP_BASE; k=k+1)
				begin:bottom_group
					localparam in_top_group_base = 2*(j*GROUP_BASE + k);
					localparam in_bottom_group_base = 2*(j*GROUP_BASE + HALF_GROUP_BASE + k);

					localparam top_group_base = j*GROUP_BASE + k;
					localparam bottom_group_base = j*GROUP_BASE + HALF_GROUP_BASE + k;

					distribute_3x3_simple_comb #(
						.DATA_WIDTH(DATA_WIDTH),
						.COMMMAND_WIDTH(COMMMAND_WIDTH)
					) bottom_sw(
						.i_valid({connection_valid[i-1][in_bottom_group_base+1], connection_valid[i-1][in_bottom_group_base]}),
						.i_data_bus({connection[i-1][in_bottom_group_base+1], connection[i-1][in_bottom_group_base]}),
						.o_valid({connection_valid[i][in_bottom_group_base+1], connection_valid[i][in_bottom_group_base]}),
						.o_data_bus({connection[i][in_bottom_group_base+1], connection[i][in_bottom_group_base]}),
						.i_en(i_en),
						.i_cmd(cmd_pipeline_stage[i-1].pipeline_i_cmd_reg[0][bottom_group_base]),
						.i_fwd_valid(fwd_connection_valid_sec_half[i-TOTAL_HALF_STAGE-1][bottom_group_base]),    // input forward valid
						.i_fwd_data_bus(fwd_connection_sec_half[i-TOTAL_HALF_STAGE-1][bottom_group_base]),       // input data
						.o_fwd_valid(fwd_connection_valid_sec_half[i-TOTAL_HALF_STAGE-1][top_group_base]),       // output forward valid
						.o_fwd_data_bus(fwd_connection_sec_half[i-TOTAL_HALF_STAGE-1][top_group_base])           // output data
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
