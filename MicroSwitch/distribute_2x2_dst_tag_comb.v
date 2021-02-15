`timescale 1ns / 1ps
/////////////////////////////////////////////////////////////
// Top Module:  distribute_2x2_dst_tag_comb
// Data:        Only data width matters.
// Format:      keeping the input format unchange
// Timing:      Combinational Logic
// Dummy Data:  {DATA_WIDTH{1'bx}}
// 
// ----------------------------------------------
// DESTINATION_TAG verion: 1 bit control for each data.
//
// Unicast Function:
//                  Both_Contention_Highout                          Both_Contention_Lowout
//
//       i_data_bus(high)          i_data_bus(low)         i_data_bus(high)          i_data_bus(low)
//    [DATA_WIDTH+:DATA_WIDTH]    [DATA_WIDTH-1:0]      [DATA_WIDTH+:DATA_WIDTH]    [DATA_WIDTH-1:0]
//                           \     /                                         \     /
//                            v   v                                           v   v
//                            |¯¯¯| <--i_valid=2'b11                          |¯¯¯| <--i_valid=2'b11
//      o_cmd=(n-2)b'xxxx <-- |___| <--i_cmd=n'b11xxxx  o_cmd=(n-2)b'xxxx <-- |___| <--i_cmd=n'b00xxxx
//                           /     \                                         /     \
//                          v       v                                       v       v
//                  o_data_high   Invalid                               Invalid   o_data_low
//
//
//                         Pass Through                                    Pass Switch
//
//       i_data_bus(high)          i_data_bus(low)        i_data_bus(high)          i_data_bus(low)
//    [DATA_WIDTH+:DATA_WIDTH]    [DATA_WIDTH-1:0]      [DATA_WIDTH+:DATA_WIDTH]    [DATA_WIDTH-1:0]
//                           \     /                                         \     /
//                            v   v                                           v   v
//                            |¯¯¯| <--i_valid=2'b11                          |¯¯¯| <--i_valid=2'b11
//      o_cmd=(n-2)b'xxxx <-- |___| <--i_cmd=n'b10xxxx  o_cmd=(n-2)b'xxxx <-- |___| <--i_cmd=n'b01xxxx
//                           /     \                                         /     \
//                          v       v                                       v       v
//                  o_data_high   o_data_low                          o_data_low   o_data_high
//
// Note: the output port is Invalid when corresponding input data is invalid
//
// Special Function:      No Pass   
//                 
//       i_data_bus(high)          i_data_bus(low)            
//    [DATA_WIDTH+:DATA_WIDTH]    [DATA_WIDTH-1:0]    
//                        \     /                                                                  
//                         v   v                             
//                         |¯¯¯| <--i_valid=2'b00
//    o_cmd=(n-2)b'xxxx <--|___| <--i_cmd=n'bxxxxxx      
//                        /     \
//                       v       v
//                  Invalid  Invalid    
//
// Author:      Jianming Tong (jianming.tong@gatech.edu)
/////////////////////////////////////////////////////////////

`define DESTINATION_TAG // 2 bit command -- each input data has its own control. 
                        // When both input choose the same output port then HighIn has higher priority


module distribute_2x2_dst_tag_comb#(
	parameter DATA_WIDTH = 32,
	parameter DESTINATION_TAG_WIDTH = 2
)(
    // data signals
	i_valid,        // valid input data signal
	i_data_bus,     // input data bus coming into distribute switch
	
	o_valid,        // output valid
    o_data_bus,     // output data 

	// control signals
	i_en,           // distribute switch enable
	i_cmd,          // input destination tag 

	o_cmd,          // output destination tag 
	o_cmd_valid     // indicate validity of output destination tag
);
	// localparam
	parameter NUM_DATA_IN = 2;
	parameter IN_COMMAND_WIDTH = NUM_DATA_IN * DESTINATION_TAG_WIDTH;
	parameter OUT_COMMAND_WIDTH = (IN_COMMAND_WIDTH>2)?(IN_COMMAND_WIDTH-2):1;

	// interface
	input  [1:0]                    i_valid;             
	input  [2*DATA_WIDTH-1:0]       i_data_bus;
	
	output [1:0]                    o_valid;             
	output [2*DATA_WIDTH-1:0]       o_data_bus; //{o_data_a, o_data_b}
	    
	input                           i_en;
	input  [IN_COMMAND_WIDTH-1:0]   i_cmd;
		// 1x --> HighIn chooses HighOut
		// 0x --> HighIn chooses LowOut
		// x1 --> LowIn chooses HighOut
		// x0 --> LowIn chooses LowOut
		// when both input choose the same output port
		// HighIn has higher priority.
	
	output [OUT_COMMAND_WIDTH-1:0]  o_cmd;   
	output [1:0]                    o_cmd_valid;   

	// inner logic 
	reg    [2*DATA_WIDTH-1:0]       o_data_bus_inner;
	reg    [1:0]                    o_valid_inner;
	reg    [OUT_COMMAND_WIDTH-1:0]  o_cmd_inner;
	reg    [1:0]                    o_cmd_valid_inner;



	if(IN_COMMAND_WIDTH==2)
	begin
		// output data
		always@(*)
		begin
			if(i_en)
			begin
				case({i_cmd})
					2'b11: // Both_Contention_Highout
					begin
						o_data_bus_inner[DATA_WIDTH+:DATA_WIDTH] = (i_valid[1])?i_data_bus[DATA_WIDTH+:DATA_WIDTH]:{DATA_WIDTH{1'bx}};
						o_data_bus_inner[0+:DATA_WIDTH] = {DATA_WIDTH{1'bx}};
						o_valid_inner = (i_valid[1])?2'b00:2'b10;
					end
					2'b00: // Both_Contention_Lowout
					begin
						o_data_bus_inner[DATA_WIDTH+:DATA_WIDTH] = {DATA_WIDTH{1'bx}};
						o_data_bus_inner[0+:DATA_WIDTH] = (i_valid[0])?i_data_bus[0+:DATA_WIDTH]:{DATA_WIDTH{1'bx}};
						o_valid_inner = (i_valid[0])?2'b01:2'b00;
					end
					2'b10: // Pass Through
					begin
						o_data_bus_inner[DATA_WIDTH+:DATA_WIDTH] =  (i_valid[1])?i_data_bus[DATA_WIDTH+:DATA_WIDTH]:{DATA_WIDTH{1'bx}};
						o_data_bus_inner[0+:DATA_WIDTH] = (i_valid[0])?i_data_bus[0+:DATA_WIDTH]:{DATA_WIDTH{1'bx}};
						o_valid_inner = (i_valid[0])? ((i_valid[1])?2'b11:2'b01) : ((i_valid[1])?2'b01:2'b00);
					end
					2'b01: // Pass Switch
					begin
						o_data_bus_inner[DATA_WIDTH+:DATA_WIDTH] =  (i_valid[0])?i_data_bus[0+:DATA_WIDTH]:{DATA_WIDTH{1'bx}};
						o_data_bus_inner[0+:DATA_WIDTH] =  (i_valid[1])?i_data_bus[DATA_WIDTH+:DATA_WIDTH]:{DATA_WIDTH{1'bx}};
						o_valid_inner = (i_valid[0])? ((i_valid[1])?2'b11:2'b10) : ((i_valid[1])?2'b01:2'b00);
					end
					default:
					begin
						o_valid_inner = 2'b00;
						o_data_bus_inner = {2*DATA_WIDTH{1'bx}};
					end
				endcase
			end
			else
			begin
				o_valid_inner = 2'b00;
				o_data_bus_inner = {2*DATA_WIDTH{1'bx}};	
			end
		end
		
		// output command
		always@(*)
		begin
			o_cmd_inner = {1'bx, 1'bx};
			o_cmd_valid_inner = {1'b0, 1'b0};
		end
	end
	else
	begin
		// output data & command
		always@(*)
		begin
			if(i_en)
			begin
				case({i_cmd[IN_COMMAND_WIDTH-1],i_cmd[IN_COMMAND_WIDTH-1-DESTINATION_TAG_WIDTH]})
					2'b11: // Both_Contention_Highout
					begin
						o_data_bus_inner[DATA_WIDTH+:DATA_WIDTH] = (i_valid[1])?i_data_bus[DATA_WIDTH+:DATA_WIDTH]:{DATA_WIDTH{1'bx}};
						o_data_bus_inner[0+:DATA_WIDTH] = {DATA_WIDTH{1'bx}};
						o_valid_inner = (i_valid[1])?2'b00:2'b10;

						o_cmd_inner = {i_cmd[DESTINATION_TAG_WIDTH+:(DESTINATION_TAG_WIDTH-1)], {(DESTINATION_TAG_WIDTH-1){1'bx}}};
						o_cmd_valid_inner = {1'b1,1'b0};
					end
					2'b00: // Both_Contention_Lowout
					begin
						o_data_bus_inner[DATA_WIDTH+:DATA_WIDTH] = {DATA_WIDTH{1'bx}};
						o_data_bus_inner[0+:DATA_WIDTH] = (i_valid[0])?i_data_bus[0+:DATA_WIDTH]:{DATA_WIDTH{1'bx}};
						o_valid_inner = (i_valid[0])?2'b01:2'b00;
					
						o_cmd_inner = { {(DESTINATION_TAG_WIDTH-1){1'bx}}, i_cmd[0+:(DESTINATION_TAG_WIDTH-1)]};
						o_cmd_valid_inner = {1'b0,1'b1};
					end
					2'b10: // Pass Through
					begin
						o_data_bus_inner[DATA_WIDTH+:DATA_WIDTH] =  (i_valid[1])?i_data_bus[DATA_WIDTH+:DATA_WIDTH]:{DATA_WIDTH{1'bx}};
						o_data_bus_inner[0+:DATA_WIDTH] = (i_valid[0])?i_data_bus[0+:DATA_WIDTH]:{DATA_WIDTH{1'bx}};
						o_valid_inner = (i_valid[0])? ((i_valid[1])?2'b11:2'b01) : ((i_valid[1])?2'b01:2'b00);

						o_cmd_inner = {i_cmd[DESTINATION_TAG_WIDTH+:(DESTINATION_TAG_WIDTH-1)], i_cmd[0+:(DESTINATION_TAG_WIDTH-1)]};
						o_cmd_valid_inner = {1'b1,1'b1};
					end
					2'b01: // Pass Switch
					begin
						o_data_bus_inner[DATA_WIDTH+:DATA_WIDTH] =  (i_valid[0])?i_data_bus[0+:DATA_WIDTH]:{DATA_WIDTH{1'bx}};
						o_data_bus_inner[0+:DATA_WIDTH] =  (i_valid[1])?i_data_bus[DATA_WIDTH+:DATA_WIDTH]:{DATA_WIDTH{1'bx}};
						o_valid_inner = (i_valid[0])? ((i_valid[1])?2'b11:2'b10) : ((i_valid[1])?2'b01:2'b00);

						o_cmd_inner = {i_cmd[0+:(DESTINATION_TAG_WIDTH-1)], i_cmd[DESTINATION_TAG_WIDTH+:(DESTINATION_TAG_WIDTH-1)]};
						o_cmd_valid_inner = {1'b1,1'b1};
					end
					default:
					begin
						o_valid_inner = 2'b00;
						o_data_bus_inner = {2*DATA_WIDTH{1'bx}};
						
						o_cmd_inner = {{(DESTINATION_TAG_WIDTH-1){1'bx}}, {(DESTINATION_TAG_WIDTH-1){1'bx}}};
						o_cmd_valid_inner = {1'b0, 1'b0};	
					end
				endcase
			end
			else
			begin
				o_valid_inner = 2'b00;
				o_data_bus_inner = {2*DATA_WIDTH{1'bx}};
				o_cmd_inner = {{(DESTINATION_TAG_WIDTH-1){1'bx}},{(DESTINATION_TAG_WIDTH-1){1'bx}}};
				o_cmd_valid_inner = {1'b0, 1'b0};	
			end
		end
	end

	// output data & command
	assign o_valid = o_valid_inner;
	assign o_data_bus = o_data_bus_inner;

	assign o_cmd = o_cmd_inner;
	assign o_cmd_valid = o_cmd_valid_inner;

endmodule

