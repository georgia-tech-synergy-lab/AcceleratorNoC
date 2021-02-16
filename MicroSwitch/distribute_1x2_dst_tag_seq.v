`timescale 1ns / 1ps
/////////////////////////////////////////////////////////////
// Top Module:  distribute_1x2_dst_tag_seq
// Data:        Only data width matters.
// Format:      keeping the input format unchange
// Timing:      Sequential Logic
// Latency:     1 cycle
// Dummy Data:  {DATA_WIDTH{1'bz}}
// 
// [SINGLE_BIT_CONTROL Version]
//  Function:         Branch_high                                      Branch_low
//                    
//                    i_data_bus                                       i_data_bus
//                        |                                                |
//                        v                                                v        
//                      |¯¯¯| <--i_valid=1'b1                            |¯¯¯| <--i_valid=1'b1 
//  o_cmd=(n-1)b'??? <--|___| <--i_cmd=n'b1???      o_cmd=(n-1)b'??? <-- |___| <--i_cmd=n'b0???    
//                     /                                                      \    
//            o_data_high                                          		 o_data_low
//
//       o_data_high = o_data_bus[2*DATA_WIDTH-1: DATA_WIDTH]
//       o_data_low  = o_data_bus[DATA_WIDTH-1: 0]
//       i_valid = 2'b1?; where ? indicates that we don't care about this bit
//
// Author:      Jianming Tong (jianming.tong@gatech.edu)
/////////////////////////////////////////////////////////////

`define SINGLE_BIT_CONTROL  // If define, then use 1 bit control to select function of distribute_1x2 switch

`ifdef SINGLE_BIT_CONTROL
module distribute_1x2_dst_tag_seq#(
	parameter DATA_WIDTH = 32,
	parameter DESTINATION_TAG_WIDTH = 1
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
	i_cmd,          // input destination tag 

	o_cmd           // output destination tag 
);
	// localparam
	parameter NUM_DATA_IN = 1;
	parameter IN_COMMAND_WIDTH = NUM_DATA_IN * DESTINATION_TAG_WIDTH;
	parameter NUM_DATA_OUT = 2;
	parameter OUT_COMMAND_WIDTH = (IN_COMMAND_WIDTH>1)?(NUM_DATA_OUT*(IN_COMMAND_WIDTH-1)):2;

	// interface
	input                           clk;
	input                           rst;

	input                           i_valid;             
	input  [DATA_WIDTH-1:0]         i_data_bus;
	
	output [1:0]                    o_valid;             
	output [2*DATA_WIDTH-1:0]       o_data_bus; //{o_data_a, o_data_b}
	    
	input                           i_en;
	input  [IN_COMMAND_WIDTH-1:0]   i_cmd;
		// 1 --> In chooses HighOut
		// 0 --> In chooses LowOut
	
	output [OUT_COMMAND_WIDTH-1:0]  o_cmd;   

	// inner logic 
	reg    [2*DATA_WIDTH-1:0]       o_data_bus_inner;
	reg    [1:0]                    o_valid_inner;
	reg    [OUT_COMMAND_WIDTH-1:0]  o_cmd_inner;

	if(DESTINATION_TAG_WIDTH==1)
	begin
		// output data
		always@(posedge clk)
		begin
			if(i_en & (~rst))
			begin
				case({i_cmd[IN_COMMAND_WIDTH-1]})
					1'b1: // In chooses HighOut
					begin
						o_data_bus_inner[DATA_WIDTH+:DATA_WIDTH] = (i_valid)?i_data_bus:{DATA_WIDTH{1'bz}};
						o_data_bus_inner[0+:DATA_WIDTH] = {DATA_WIDTH{1'bz}};
						o_valid_inner = (i_valid)?2'b10:2'b00;
					end
					1'b0: // In chooses LowOut
					begin
						o_data_bus_inner[DATA_WIDTH+:DATA_WIDTH] = {DATA_WIDTH{1'bz}};
						o_data_bus_inner[0+:DATA_WIDTH] = (i_valid)?i_data_bus:{DATA_WIDTH{1'bz}};
						o_valid_inner = (i_valid)?2'b01:2'b00;
					end
					default:
					begin
						o_valid_inner = 2'b00;
						o_data_bus_inner = {2*DATA_WIDTH{1'bz}};
					end
				endcase
			end
			else
			begin
				o_valid_inner = 2'b00;
				o_data_bus_inner = {2*DATA_WIDTH{1'bz}};	
			end
		end
		
		// output command
		always@(posedge clk)
		begin
			o_cmd_inner = {1'bz, 1'bz};
		end
	end
	else
	begin
		// output data & command
		always@(posedge clk)
		begin
			if(i_en & (~rst))
			begin
				case(i_cmd[IN_COMMAND_WIDTH-1])
					1'b1: // In chooses HighOut
					begin
						o_data_bus_inner[DATA_WIDTH+:DATA_WIDTH] = (i_valid)?i_data_bus:{DATA_WIDTH{1'bz}};
						o_data_bus_inner[0+:DATA_WIDTH] = {DATA_WIDTH{1'bz}};
						o_valid_inner = (i_valid)?2'b10:2'b00;

						o_cmd_inner = {i_cmd[DESTINATION_TAG_WIDTH-2:0], {(DESTINATION_TAG_WIDTH-1){1'bz}}};
					end
					1'b0: // In chooses LowOut
					begin
						o_data_bus_inner[DATA_WIDTH+:DATA_WIDTH] = {DATA_WIDTH{1'bz}};
						o_data_bus_inner[0+:DATA_WIDTH] = (i_valid)?i_data_bus:{DATA_WIDTH{1'bz}};
						o_valid_inner = (i_valid)?2'b01:2'b00;

						o_cmd_inner = { {(DESTINATION_TAG_WIDTH-1){1'bz}}, i_cmd[DESTINATION_TAG_WIDTH-2:0]};
					end
					default:
					begin
						o_valid_inner = 2'b00;
						o_data_bus_inner = {2*DATA_WIDTH{1'bz}};

						o_cmd_inner = {{(DESTINATION_TAG_WIDTH-1){1'bz}}, {(DESTINATION_TAG_WIDTH-1){1'bz}}};
					end
				endcase
			end
			else
			begin
				o_valid_inner = 2'b00;
				o_data_bus_inner = {2*DATA_WIDTH{1'bz}};
				o_cmd_inner = {{(DESTINATION_TAG_WIDTH-1){1'bz}},{(DESTINATION_TAG_WIDTH-1){1'bz}}};
			end
		end
	end

	// output data & command
	assign o_valid = o_valid_inner;
	assign o_data_bus = o_data_bus_inner;

	assign o_cmd = o_cmd_inner;

endmodule

`endif