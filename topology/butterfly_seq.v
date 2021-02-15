`timescale 1ns / 1ps
/////////////////////////////////////////////////////////////
// Top Module:  butterfly_seq
// Data:        Only data width matters.
// Format:      keeping the input format unchange
// Timing:      Sequential Logic
// Reset:       Synchronized Reset [High Reset]
// Latency:     Every stage is a pipeline stage 
// Dummy Data:  {DATA_WIDTH{1'bx}}
// 
// Function:    Unicast  or  Multicast(Not arbitrary Multicast)
//                                              
//     i_data_bus[0*DATA_WIDTH+:DATA_WIDTH]  -->|¯¯¯|-\     /->|¯¯¯|-\  /->|¯¯¯|-->
//     i_data_bus[1*DATA_WIDTH+:DATA_WIDTH]  -->|___|-\\   //->|___|-\\//->|___|-->
//                                                     \\ //          XX                                  
//     i_data_bus[2*DATA_WIDTH+:DATA_WIDTH]  -->|¯¯¯|-\ \X/ /->|¯¯¯|-//\\->|¯¯¯|-->
//     i_data_bus[3*DATA_WIDTH+:DATA_WIDTH]  -->|___|-\\/X\//->|___|-/  \->|___|-->
//                                                     XX XX                               
//     i_data_bus[4*DATA_WIDTH+:DATA_WIDTH]  -->|¯¯¯|-//\X/\\->|¯¯¯|-\  /->|¯¯¯|-->
//     i_data_bus[5*DATA_WIDTH+:DATA_WIDTH]  -->|___|-/ /X\ \->|___|-\\//->|___|-->
//                                                     // \\          XX              
//     i_data_bus[6*DATA_WIDTH+:DATA_WIDTH]  -->|¯¯¯|-//   \\->|¯¯¯|-//\\->|¯¯¯|-->
//     i_data_bus[7*DATA_WIDTH+:DATA_WIDTH]  -->|___|-/     \->|___|-/  \->|___|-->
//                                                        
//              
//        CONNECTION FUNCTION                          CUBE          CUBE  
//       CONNECTION GROUP SIZE                          8             4 
//
// Control Signal
//     i_valid[0]-->|¯¯¯|<--i_cmd[2:0] 
//     i_valid[1]-->|___|
//     
// Author:      Jianming Tong (jianming.tong@gatech.edu)
/////////////////////////////////////////////////////////////

// Note: use the UNICAST_ONLY version distribute_2x2_seq.
// Need to set "`define UNICAST_ONLY in distribute_2x2_seq.v"

module butterfly_seq#(
	parameter DATA_WIDTH = 32,    // could be arbitrary number
	parameter NUM_INPUT_DATA = 8,    // multiple be 2^n
    parameter COMMMAND_WIDTH = 1  // destination tag, each level consumes 1 bit.
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
	i_cmd           // dst_tag 
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
	input  [NUM_STAGE*NUM_SWITCH_IN*COMMMAND_WIDTH-1:0]        i_cmd;
									// For each switch
									// 0 --> Pass Through
									// 1 --> Pass Switch


	// inner logic
	reg    [NUM_INPUT_DATA-1:0]                                i_valid_inner;             
	reg    [WIDTH_INPUT_DATA-1:0]                              i_data_bus_inner;	
	reg    [NUM_INPUT_DATA-1:0]                                o_valid_inner;             
	reg    [WIDTH_INPUT_DATA-1:0]                              o_data_bus_inner;	

	always@(*)
	begin
		i_valid_inner = i_valid;
		i_data_bus_inner = i_data_bus;
	end

	wire                                                       wire_valid_inner[0:NUM_STAGE][0:NUM_INPUT_DATA-1];
	wire   [DATA_WIDTH-1:0]                                    wire_data_inner[0:NUM_STAGE][0:NUM_INPUT_DATA-1];

	// input for the first stage
	genvar i,s,g,s_ca;
	generate
	for(i = 0; i< NUM_INPUT_DATA; i=i+1)
	begin: i_wire_first_stage
		assign wire_data_inner[0][i] = i_data_bus_inner[i*DATA_WIDTH+:DATA_WIDTH];
		assign wire_valid_inner[0][i] = i_valid_inner[i+:1];
	end

	// command generation

	// cmd_inner_define; destination tags will be consumed and deleted from command
	// with the stage going on.
	for (s =0; s< NUM_STAGE; s=s+1)
    begin: cmd_stage
		localparam NUM_STAGE_CURR_AFTER = NUM_STAGE - s;
		// only stored cmd of current stage the stages afterwards.
		reg  [COMMMAND_WIDTH-1:0]      reg_cmd_inner[0:NUM_STAGE_CURR_AFTER-1][0:NUM_SWITCH_IN-1];	
	end

	// first stage cmd assignment
	for (s =0; s< NUM_STAGE; s=s+1)
	begin: cmd_frist_stage_assignment
		for(i=0; i<NUM_SWITCH_IN; i=i+1)
		begin:switch_first_stage
			always@(*)
			begin
				if(i_en)
				begin
					if(rst)
					begin
						cmd_stage[0].reg_cmd_inner[s][i] <= {COMMMAND_WIDTH{1'bx}};
					end
					else
					begin
						// only stored cmd of current stage the stages afterwards.
						cmd_stage[0].reg_cmd_inner[s][i] <= i_cmd[(s*NUM_SWITCH_IN+i)*COMMMAND_WIDTH+:COMMMAND_WIDTH];
					end
				end
			end
		end
	end

	// cmd pipeline
	for (s =1; s< NUM_STAGE; s=s+1)
    begin: cmd_pipeline
		localparam NUM_STAGE_CURR_AFTER = NUM_STAGE - s;
		for(s_ca = 0; s_ca < NUM_STAGE_CURR_AFTER ;s_ca=s_ca+1)
		begin:cmd_curr_af_pipeline
			for(i=0; i<NUM_SWITCH_IN; i=i+1)
			begin:switch
				always@(posedge clk)
				begin
					if(i_en)
					begin
						if(rst)
						begin
							cmd_stage[s].reg_cmd_inner[s_ca][i] <= {COMMMAND_WIDTH{1'bx}};
						end
						else
						begin
							// only stored cmd of current stage the stages afterwards.
							cmd_stage[s].reg_cmd_inner[s_ca][i] <= cmd_stage[s-1].reg_cmd_inner[s_ca+1][i];
						end
					end
				end
			end
		end
	end

	// first stage
	for(i=0; i< NUM_SWITCH_IN; i=i+1)
	begin:switch_first_stage			
		distribute_2x2_seq #(
			.DATA_WIDTH(DATA_WIDTH),
			.COMMMAND_WIDTH(COMMMAND_WIDTH)
		) dis_2x2(
			.clk(clk),
			.rst(rst),
			.i_valid({wire_valid_inner[0][2*i+1], wire_valid_inner[0][2*i]}),
			.i_data_bus({wire_data_inner[0][2*i+1], wire_data_inner[0][2*i]}),
			.o_valid({wire_valid_inner[1][2*i+1], wire_valid_inner[1][2*i]}),
			.o_data_bus({wire_data_inner[1][2*i+1], wire_data_inner[1][2*i]}),
			.i_en(i_en),
			.i_cmd(cmd_stage[0].reg_cmd_inner[0][i])
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
				localparam [$clog2(NUM_INPUT_DATA)-1-s:0] HighDataInIdxMSBInverse = {~HighDataInIdx[$clog2(NUM_INPUT_DATA)-1-s], HighDataInIdx[$clog2(NUM_INPUT_DATA)-2-s:0]};
				localparam [$clog2(NUM_INPUT_DATA)-1:0] HighDataInIdxMSBInverseOffset = HighDataInIdxMSBInverse + group_data_offset;
				
				// For high input [Inverse MSB [$clog2(NUM_INPUT_DATA)-1-s] ]
				localparam [$clog2(NUM_INPUT_DATA)-1-s:0] LowDataInIdx =  (idx << 1);
				localparam [$clog2(NUM_INPUT_DATA)-1-s:0] LowDataInIdxMSBInverse = {~LowDataInIdx[$clog2(NUM_INPUT_DATA)-1-s], LowDataInIdx[$clog2(NUM_INPUT_DATA)-2-s:0]};
				localparam [$clog2(NUM_INPUT_DATA)-1:0] LowDataInIdxMSBInverseOffset = LowDataInIdxMSBInverse + group_data_offset;	
				
				distribute_2x2_seq #(
					.DATA_WIDTH(DATA_WIDTH),
					.COMMMAND_WIDTH(COMMMAND_WIDTH)
				) dis_2x2(
					.clk(clk),
					.rst(rst),
					.i_valid({wire_valid_inner[s+1][HighDataInIdxMSBInverseOffset], wire_valid_inner[s+1][LowDataInIdxMSBInverseOffset]}),
					.i_data_bus({wire_data_inner[s+1][HighDataInIdxMSBInverseOffset], wire_data_inner[s+1][LowDataInIdxMSBInverseOffset]}),
					.o_valid({wire_valid_inner[s+2][2*(i+group_switch_offset)+1], wire_valid_inner[s+2][2*(i+group_switch_offset)]}),
					.o_data_bus({wire_data_inner[s+2][2*(i+group_switch_offset)+1], wire_data_inner[s+2][2*(i+group_switch_offset)]}),
					.i_en(i_en),
					.i_cmd(cmd_stage[s+1].reg_cmd_inner[0][i+group_switch_offset])
				);
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