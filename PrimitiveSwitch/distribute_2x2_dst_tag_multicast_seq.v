`timescale 1ns / 1ps
/////////////////////////////////////////////////////////////
// Top Module:  distribute_2x2_dst_tag_multicast_seq
// Data:        Only data width matters.
// Format:      keeping the input format unchange
// Timing:      Sequential Logic
// Reset:       Synchronized Reset [High Reset]
// Latency:     1 cycle
// Dummy Data:  {DATA_WIDTH{1'b0}}
//
// ----------------------------------------------
// DESTINATION_TAG verion: 
// 2 bit control for each data.
// Each data has 1-bit valid signal.
// 
//
// Unicast Function: (lower 2 bits)
//                  Both_Contention_Highout                                               Both_Contention_Lowout
//                     
//       i_data_bus_inner(high)          i_data_bus_inner(low)                              i_data_bus_inner(high)          i_data_bus_inner(low)
//    [DATA_WIDTH+:DATA_WIDTH]    [DATA_WIDTH-1:0]                           [DATA_WIDTH+:DATA_WIDTH]    [DATA_WIDTH-1:0]
//                           \     /                                                              \     /
//                            v   v                                                                v   v
//                            |¯¯¯| <--i_valid=2'b11                                               |¯¯¯| <--i_valid=2'b11
//      o_cmd=(n-2)b'???? <-- |___| <--i_cmd=n'b1010???                      o_cmd=(n-2)b'???? <-- |___| <--i_cmd=n'b0000???
//                           /     \            ||||                                              /     \            ||||
//                          v       v           vvvv                                             v       v           vvvv
//                  o_data_high   Invalid       used                                        Invalid   o_data_high    used
//    When both input compete for the same output port,                     then the highIn has higher priority 
//                    
//                    
//                         Pass Through                                                        Pass Switch
//                    
//       i_data_bus_inner(high)          i_data_bus_inner(low)                             i_data_bus_inner(high)          i_data_bus_inner(low)
//    [DATA_WIDTH+:DATA_WIDTH]    [DATA_WIDTH-1:0]                           [DATA_WIDTH+:DATA_WIDTH]    [DATA_WIDTH-1:0]
//                           \     /                                                              \     /
//                            v   v                                                                v   v
//                            |¯¯¯| <--i_valid=2'b11                                               |¯¯¯| <--i_valid=2'b11
//      o_cmd=(n-2)b'???? <-- |___| <--i_cmd=n'b1001??? or n'b1011???        o_cmd=(n-2)b'???? <-- |___| <--i_cmd=n'b0110??? or n'b0111???
//                           /     \            ||||          ||||                                /     \            ||||          |||| 
//                          v       v           vvvv          vvvv                               v       v           vvvv          vvvv
//                  o_data_high   o_data_low    used   (both content HighOut)            o_data_low   o_data_high    used     both content LowOut 
//
//
// Multicast Function:
//                      
//                     Multicast_HighIn                                                      Multicast_LowIn
//                    
//       i_data_bus_inner(high)          i_data_bus_inner(low)                              i_data_bus_inner(high)          i_data_bus_inner(low)
//    [DATA_WIDTH+:DATA_WIDTH]    [DATA_WIDTH-1:0]                           [DATA_WIDTH+:DATA_WIDTH]    [DATA_WIDTH-1:0]
//                           \     /                                                               \     /
//                            v   v                                                                 v   v
//                            |¯¯¯| <--i_valid=2'b1?    or i_valid=2'b10                            |¯¯¯| <--i_valid=2'b?1     or   i_valid=2'b11
//      o_cmd=(n-2)b'???? <-- |___| <--i_cmd=n'b1100??? or i_cmd=n'b11?????   o_cmd=(n-2)b'???? <-- |___| <--i_cmd=n'b0011???  or   i_cmd=n'b0011??
//                           /     \            ||||                ||||                           /     \            ||||                   ||||
//                          v       v           vvvv                vvvv                          v       v           vvvv                   vvvv 
//                o_data_high     o_data_high   used                used                 o_data_low     o_data_low    used                   used
//  
//
// Note: If both Input want to be multicasted, highIn has the higher priority.
// Note: the output port is Invalid when corresponding input data is invalid
//
//
// Special Function:      No Pass   
//                 
//       i_data_bus_inner(high)          i_data_bus_inner(low)
//    [DATA_WIDTH+:DATA_WIDTH]    [DATA_WIDTH-1:0]
//                        \     /
//                         v   v
//                         |¯¯¯| <-- any i_valid       or    I_valid=2'b00
//    o_cmd=(n-2)b'???? <--|___| <--i_cmd=n'b0000??    or     any i_cmd
//                        /     \            ||||
//                       v       v           vvvv
//                  Invalid    Invalid       used
//
// Author:      Jianming Tong (jianming.tong@gatech.edu)
/////////////////////////////////////////////////////////////


module distribute_2x2_dst_tag_multicast_seq#(
	parameter DATA_WIDTH = 32,
	parameter DESTINATION_TAG_WIDTH = 2,
	parameter IN_COMMAND_WIDTH = 4
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
	parameter NUM_DATA_IN = 2;
	parameter CONSUME_COMMAND_WIDTH = NUM_DATA_IN * DESTINATION_TAG_WIDTH;
	parameter OUT_COMMAND_WIDTH = (IN_COMMAND_WIDTH>CONSUME_COMMAND_WIDTH)?(IN_COMMAND_WIDTH-CONSUME_COMMAND_WIDTH):CONSUME_COMMAND_WIDTH;
	parameter OUT_COMMAND_WIDTH_PER_DATA = ((IN_COMMAND_WIDTH - CONSUME_COMMAND_WIDTH) >> 1);
	parameter MSB_COMMAND_HIGHIN_DATA = IN_COMMAND_WIDTH;
	parameter MSB_COMMAND_LOWIN_DATA = IN_COMMAND_WIDTH>>1;

	// interface
	input                           clk;
	input                           rst;

	input  [1:0]                    i_valid;             
	input  [2*DATA_WIDTH-1:0]       i_data_bus;
	
	output [1:0]                    o_valid;             
	output [2*DATA_WIDTH-1:0]       o_data_bus; //{o_data_a, o_data_b}
	    
	input                           i_en;
	input  [IN_COMMAND_WIDTH-1:0]   i_cmd;
		// If both input want to be multicasted, high input has the higher priority.
		// both input want to be multicasted should not appear in input.  
		//
		// 11??      --> Multicast HighOut
		// 0011      --> Multicast LowOut
		// 1001,4'b1011 --> Pass Through
		// 0110,4'b0111 --> Pass Switch
		// 1010,4'b1000 --> HighIn HighOut
		// 0101,4'b0100 --> HighIn LowOut
		// 0010      --> LowIn HighOut
		// 0001      --> LowIn LowOut
		// 0000      --> No Pass
		// when both input choose the same output port
		// HighIn has higher priority.
		// ? means any signal
	
	output [OUT_COMMAND_WIDTH-1:0]  o_cmd;   

	// inner logic 
	reg    [IN_COMMAND_WIDTH-1:0]   i_cmd_inner;
	reg    [2*DATA_WIDTH-1:0]       i_data_bus_inner;
	reg    [1:0]                    i_valid_inner;

	reg    [2*DATA_WIDTH-1:0]       o_data_bus_inner;
	reg    [1:0]                    o_valid_inner;
	reg    [OUT_COMMAND_WIDTH-1:0]  o_cmd_inner;

	always@(*)
	begin
		i_cmd_inner = i_cmd;
		i_data_bus_inner = i_data_bus;
		i_valid_inner = i_valid;
	end

	if(IN_COMMAND_WIDTH<=NUM_DATA_IN*DESTINATION_TAG_WIDTH)
	begin:LAST_STAGE
		// output data
		always@(posedge clk)
		begin
			if(i_en && (~rst))
			begin
				o_cmd_inner <= {(OUT_COMMAND_WIDTH){1'b0}};

				case(i_valid_inner)
				2'b11:
				begin
					case({i_cmd_inner})
						4'b1010,4'b1000: // HighIn HighOut
						begin
							o_data_bus_inner <= {i_data_bus_inner[DATA_WIDTH+:DATA_WIDTH], {DATA_WIDTH{1'b0}}};
							o_valid_inner <= 2'b10;
						end
						4'b0101,4'b0100: // HighIn LowOut
						begin
							o_data_bus_inner <= {{DATA_WIDTH{1'b0}}, i_data_bus_inner[DATA_WIDTH+:DATA_WIDTH]};
							o_valid_inner <= 2'b01;
						end
						4'b0010: // LowIn HighOut
						begin
							o_data_bus_inner <= {i_data_bus_inner[0+:DATA_WIDTH], {DATA_WIDTH{1'b0}}};
							o_valid_inner <= 2'b10;
						end
						4'b0001: // LowIn LowOut
						begin
							o_data_bus_inner <= {{DATA_WIDTH{1'b0}}, i_data_bus_inner[0+:DATA_WIDTH]};
							o_valid_inner <= 2'b01;
						end
						4'b1001,4'b1011: // Pass Through
						begin
							o_data_bus_inner <= i_data_bus_inner;
							o_valid_inner <= 2'b11;
						end
						4'b0110,4'b0111: // Pass Switch
						begin
							o_data_bus_inner <= {i_data_bus_inner[0+:DATA_WIDTH], i_data_bus_inner[DATA_WIDTH+:DATA_WIDTH]};
							o_valid_inner <= 2'b11;
						end
						4'b0011: // Multicast LowIn
						begin
							o_data_bus_inner <= {i_data_bus_inner[0+:DATA_WIDTH], i_data_bus_inner[0+:DATA_WIDTH]};
							o_valid_inner <= 2'b11;
						end
						4'b1111,4'b1100,4'b1101,4'b1110: // Multicast HighIn
						begin
							o_data_bus_inner <= {i_data_bus_inner[DATA_WIDTH+:DATA_WIDTH], i_data_bus_inner[DATA_WIDTH+:DATA_WIDTH]};
							o_valid_inner <= 2'b11;
						end
						default: // No Pass
						begin
							o_data_bus_inner <= {(2*DATA_WIDTH){1'b0}};
							o_valid_inner <= 2'b00;
						end
					endcase
				end
				2'b10:
				begin
					case({i_cmd_inner})
						4'b1010,4'b1000,4'b1001,4'b1011: // HighIn HighOut
						begin
							o_data_bus_inner <= {i_data_bus_inner[DATA_WIDTH+:DATA_WIDTH], {DATA_WIDTH{1'b0}}};
							o_valid_inner <= 2'b10;
						end
						4'b0101,4'b0100,4'b0110,4'b0111: // HighIn LowOut
						begin
							o_data_bus_inner <= {{DATA_WIDTH{1'b0}}, i_data_bus_inner[DATA_WIDTH+:DATA_WIDTH]};
							o_valid_inner <= 2'b01;
						end
						4'b1111,4'b1100,4'b1101,4'b1110: // Multicast HighIn
						begin
							o_data_bus_inner <= {i_data_bus_inner[DATA_WIDTH+:DATA_WIDTH], i_data_bus_inner[DATA_WIDTH+:DATA_WIDTH]};
							o_valid_inner <= 2'b11;
						end
						default: // No Pass
						begin
							o_data_bus_inner <= {(2*DATA_WIDTH){1'b0}};
							o_valid_inner <= 2'b00;
						end
					endcase
				end
				2'b01:
				begin
					case({i_cmd_inner})
						4'b1010,4'b0110,4'b1110,4'b0010: // LowIn HighOut
						begin
							o_data_bus_inner <= {i_data_bus_inner[0+:DATA_WIDTH], {DATA_WIDTH{1'b0}}};
							o_valid_inner <= 2'b10;
						end
						4'b1001,4'b0101,4'b1101,4'b0001: // LowIn LowOut
						begin
							o_data_bus_inner <= {{DATA_WIDTH{1'b0}}, i_data_bus_inner[0+:DATA_WIDTH]};
							o_valid_inner <= 2'b01;
						end
						4'b0011,4'b1011,4'b1111,4'b0111: // Multicast LowIn
						begin
							o_data_bus_inner <= {i_data_bus_inner[0+:DATA_WIDTH], i_data_bus_inner[0+:DATA_WIDTH]};
							o_valid_inner <= 2'b11;
						end
						default: // No Pass
						begin
							o_data_bus_inner <= {(2*DATA_WIDTH){1'b0}};
							o_valid_inner <= 2'b00;
						end
					endcase
				end
				default: // No Pass
				begin
					o_data_bus_inner <= {(2*DATA_WIDTH){1'b0}};
					o_valid_inner <= 2'b00;
				end
				endcase
			end
			else
			begin
				o_valid_inner <= 2'b00;
				o_data_bus_inner <= {2*DATA_WIDTH{1'b0}};	
			end
		end
	end
	else
	begin: NOT_LAST_STAGE
		// output data & command
		always@(posedge clk)
		begin
			if(i_en & (~rst))
			begin
				case(i_valid_inner)
				2'b11:
				begin
					case({i_cmd_inner[MSB_COMMAND_HIGHIN_DATA-1:MSB_COMMAND_HIGHIN_DATA-DESTINATION_TAG_WIDTH], i_cmd_inner[MSB_COMMAND_LOWIN_DATA-1:MSB_COMMAND_LOWIN_DATA-DESTINATION_TAG_WIDTH]})
						4'b1010,4'b1000: // HighIn HighOut
						begin
							o_data_bus_inner <= {i_data_bus_inner[DATA_WIDTH+:DATA_WIDTH], {DATA_WIDTH{1'b0}}};
							o_valid_inner <= 2'b10;
							
							o_cmd_inner <= {i_cmd_inner[MSB_COMMAND_HIGHIN_DATA-DESTINATION_TAG_WIDTH-1:MSB_COMMAND_LOWIN_DATA], {(OUT_COMMAND_WIDTH_PER_DATA){1'b0}}};
						end
						4'b0101,4'b0100: // HighIn LowOut
						begin
							o_data_bus_inner <= {{DATA_WIDTH{1'b0}}, i_data_bus_inner[DATA_WIDTH+:DATA_WIDTH]};
							o_valid_inner <= 2'b01;

							o_cmd_inner <= {{(OUT_COMMAND_WIDTH_PER_DATA){1'b0}}, i_cmd_inner[MSB_COMMAND_HIGHIN_DATA-DESTINATION_TAG_WIDTH-1:MSB_COMMAND_LOWIN_DATA]};
						end
						4'b0010: // LowIn HighOut
						begin
							o_data_bus_inner <= {i_data_bus_inner[0+:DATA_WIDTH], {DATA_WIDTH{1'b0}}};
							o_valid_inner <= 2'b10;
						
							o_cmd_inner <= {i_cmd_inner[MSB_COMMAND_LOWIN_DATA-DESTINATION_TAG_WIDTH-1:0], {(OUT_COMMAND_WIDTH_PER_DATA){1'b0}}};
						end
						4'b0001: // LowIn LowOut
						begin
							o_data_bus_inner <= {{DATA_WIDTH{1'b0}}, i_data_bus_inner[0+:DATA_WIDTH]};
							o_valid_inner <= 2'b01;
						
							o_cmd_inner <= {{(OUT_COMMAND_WIDTH_PER_DATA){1'b0}}, i_cmd_inner[MSB_COMMAND_LOWIN_DATA-DESTINATION_TAG_WIDTH-1:0]};
						end
						4'b1001,4'b1011: // Pass Through
						begin
							o_data_bus_inner <= i_data_bus_inner;
							o_valid_inner <= 2'b11;
						
							o_cmd_inner <= {i_cmd_inner[MSB_COMMAND_HIGHIN_DATA-DESTINATION_TAG_WIDTH-1:MSB_COMMAND_LOWIN_DATA], i_cmd_inner[MSB_COMMAND_LOWIN_DATA-DESTINATION_TAG_WIDTH-1:0]};
						end
						4'b0110,4'b0111: // Pass Switch
						begin
							o_data_bus_inner <= {i_data_bus_inner[0+:DATA_WIDTH], i_data_bus_inner[DATA_WIDTH+:DATA_WIDTH]};
							o_valid_inner <= 2'b11;
						
							o_cmd_inner <= {i_cmd_inner[MSB_COMMAND_LOWIN_DATA-DESTINATION_TAG_WIDTH-1:0], i_cmd_inner[MSB_COMMAND_HIGHIN_DATA-DESTINATION_TAG_WIDTH-1:MSB_COMMAND_LOWIN_DATA]};
						end
						4'b0011: // Multicast LowIn
						begin
							o_data_bus_inner <= {i_data_bus_inner[0+:DATA_WIDTH], i_data_bus_inner[0+:DATA_WIDTH]};
							o_valid_inner <= 2'b11;

							o_cmd_inner <= {i_cmd_inner[MSB_COMMAND_LOWIN_DATA-DESTINATION_TAG_WIDTH-1:0], i_cmd_inner[MSB_COMMAND_LOWIN_DATA-DESTINATION_TAG_WIDTH-1:0]};
						end
						4'b1111,4'b1100,4'b1101,4'b1110: // Multicast HighIn
						begin
							o_data_bus_inner <= {i_data_bus_inner[DATA_WIDTH+:DATA_WIDTH], i_data_bus_inner[DATA_WIDTH+:DATA_WIDTH]};
							o_valid_inner <= 2'b11;
							
							o_cmd_inner <= {i_cmd_inner[MSB_COMMAND_HIGHIN_DATA-DESTINATION_TAG_WIDTH-1:MSB_COMMAND_LOWIN_DATA], i_cmd_inner[MSB_COMMAND_HIGHIN_DATA-DESTINATION_TAG_WIDTH-1:MSB_COMMAND_LOWIN_DATA]};
						end
						default: // No Pass
						begin
							o_data_bus_inner <= {(2*DATA_WIDTH){1'b0}};
							o_valid_inner <= 2'b00;

							o_cmd_inner <= {(OUT_COMMAND_WIDTH){1'b0}};
						end
					endcase
				end
				2'b10:
				begin
					case({i_cmd_inner[MSB_COMMAND_HIGHIN_DATA-1:MSB_COMMAND_HIGHIN_DATA-DESTINATION_TAG_WIDTH], i_cmd_inner[MSB_COMMAND_LOWIN_DATA-1:MSB_COMMAND_LOWIN_DATA-DESTINATION_TAG_WIDTH]})
						4'b1010,4'b1000,4'b1001,4'b1011: // HighIn HighOut
						begin
							o_data_bus_inner <= {i_data_bus_inner[DATA_WIDTH+:DATA_WIDTH], {DATA_WIDTH{1'b0}}};
							o_valid_inner <= 2'b10;
						
							o_cmd_inner <= {i_cmd_inner[MSB_COMMAND_HIGHIN_DATA-DESTINATION_TAG_WIDTH-1:MSB_COMMAND_LOWIN_DATA], {(OUT_COMMAND_WIDTH_PER_DATA){1'b0}}};
						end
						4'b0101,4'b0100,4'b0110,4'b0111: // HighIn LowOut
						begin
							o_data_bus_inner <= {{DATA_WIDTH{1'b0}}, i_data_bus_inner[DATA_WIDTH+:DATA_WIDTH]};
							o_valid_inner <= 2'b01;
						
							o_cmd_inner <= {{(OUT_COMMAND_WIDTH_PER_DATA){1'b0}}, i_cmd_inner[MSB_COMMAND_HIGHIN_DATA-DESTINATION_TAG_WIDTH-1:MSB_COMMAND_LOWIN_DATA]};
						end
						4'b1111,4'b1100,4'b1101,4'b1110: // Multicast HighIn
						begin
							o_data_bus_inner <= {i_data_bus_inner[DATA_WIDTH+:DATA_WIDTH], i_data_bus_inner[DATA_WIDTH+:DATA_WIDTH]};
							o_valid_inner <= 2'b11;
						
							o_cmd_inner <= {i_cmd_inner[MSB_COMMAND_HIGHIN_DATA-DESTINATION_TAG_WIDTH-1:MSB_COMMAND_LOWIN_DATA], i_cmd_inner[MSB_COMMAND_HIGHIN_DATA-DESTINATION_TAG_WIDTH-1:MSB_COMMAND_LOWIN_DATA]};
						end
						default: // No Pass
						begin
							o_data_bus_inner <= {(2*DATA_WIDTH){1'b0}};
							o_valid_inner <= 2'b00;
						
							o_cmd_inner <= {(OUT_COMMAND_WIDTH){1'b0}};
						end
					endcase
				end
				2'b01:
				begin
					case({i_cmd_inner[MSB_COMMAND_HIGHIN_DATA-1:MSB_COMMAND_HIGHIN_DATA-DESTINATION_TAG_WIDTH], i_cmd_inner[MSB_COMMAND_LOWIN_DATA-1:MSB_COMMAND_LOWIN_DATA-DESTINATION_TAG_WIDTH]})
						4'b1010,4'b0110,4'b1110,4'b0010: // LowIn HighOut
						begin
							o_data_bus_inner <= {i_data_bus_inner[0+:DATA_WIDTH], {DATA_WIDTH{1'b0}}};
							o_valid_inner <= 2'b10;
						
							o_cmd_inner <= {i_cmd_inner[MSB_COMMAND_LOWIN_DATA-DESTINATION_TAG_WIDTH-1:0], {(OUT_COMMAND_WIDTH_PER_DATA){1'b0}}};
						end
						4'b1001,4'b0101,4'b1101,4'b0001: // LowIn LowOut
						begin
							o_data_bus_inner <= {{DATA_WIDTH{1'b0}}, i_data_bus_inner[0+:DATA_WIDTH]};
							o_valid_inner <= 2'b01;
						
							o_cmd_inner <= {{(OUT_COMMAND_WIDTH_PER_DATA){1'b0}}, i_cmd_inner[MSB_COMMAND_LOWIN_DATA-DESTINATION_TAG_WIDTH-1:0]};
						end
						4'b0011,4'b1011,4'b1111,4'b0111: // Multicast LowIn
						begin
							o_data_bus_inner <= {i_data_bus_inner[0+:DATA_WIDTH], i_data_bus_inner[0+:DATA_WIDTH]};
							o_valid_inner <= 2'b11;
						
							o_cmd_inner <= {i_cmd_inner[MSB_COMMAND_LOWIN_DATA-DESTINATION_TAG_WIDTH-1:0], i_cmd_inner[MSB_COMMAND_LOWIN_DATA-DESTINATION_TAG_WIDTH-1:0]};
						end
						default: // No Pass
						begin
							o_data_bus_inner <= {(2*DATA_WIDTH){1'b0}};
							o_valid_inner <= 2'b00;
						
							o_cmd_inner <= {(OUT_COMMAND_WIDTH){1'b0}};
						end
					endcase
				end
				default: // No Pass
					begin
						o_data_bus_inner <= {(2*DATA_WIDTH){1'b0}};
						o_valid_inner <= 2'b00;
					
						o_cmd_inner <= {(OUT_COMMAND_WIDTH){1'b0}};
					end
				endcase
			end
			else
			begin
				o_valid_inner <= 2'b00;
				o_data_bus_inner <= {2*DATA_WIDTH{1'b0}};
				
				o_cmd_inner <= {(OUT_COMMAND_WIDTH){1'b0}};
			end
		end
	end

	// output data & command
	assign o_valid = o_valid_inner;
	assign o_data_bus = o_data_bus_inner;

	assign o_cmd = o_cmd_inner;

endmodule

