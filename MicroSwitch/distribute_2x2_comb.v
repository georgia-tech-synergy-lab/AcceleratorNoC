`timescale 1ns / 1ps
/////////////////////////////////////////////////////////////
// Top Module:  distribute_2x2_comb
// Data:        Only data width matters.
// Format:      keeping the input format unchange
// Dummy Data:  {DATA_WIDTH{1'b0}}
//
// Unicast Function:
//                         Pass_Through                                   Pass_High                                        Pass_Low
//            
//       i_data_bus(high)          i_data_bus(low)      i_data_bus(high)          i_data_bus(low)      i_data_bus(high)          i_data_bus(low)              
//    [DATA_WIDTH+:DATA_WIDTH]    [DATA_WIDTH-1:0]    [DATA_WIDTH+:DATA_WIDTH]    [DATA_WIDTH-1:0]   [DATA_WIDTH+:DATA_WIDTH]    [DATA_WIDTH-1:0]      
//                           \     /                                       \     /                                         \     /                                                                  
//                            v   v                                         v   v                                           v   v                             
//                            |¯¯¯| <--i_valid=2'b11                        |¯¯¯| <--i_valid=2'b1x                          |¯¯¯| <--i_valid=2'bx1 
//                            |___| <--i_cmd=3'b011                         |___| <--i_cmd=3'b010                           |___| <--i_cmd=3'b001     
//                           /     \                                       /     \                                         /     \
//                          v       v                                     v       v                                       v       v
//                  o_data_high   o_data_low                      o_data_high   Invalid                              Invalid   o_data_low
//
//
// 			               Pass_Switch                                Pass_HighIn_LowOut                              Pass_LowIn_HighOut
//                 
//       i_data_bus(high)          i_data_bus(low)      i_data_bus(high)          i_data_bus(low)      i_data_bus(high)          i_data_bus(low)              
//    [DATA_WIDTH+:DATA_WIDTH]    [DATA_WIDTH-1:0]    [DATA_WIDTH+:DATA_WIDTH]    [DATA_WIDTH-1:0]   [DATA_WIDTH+:DATA_WIDTH]    [DATA_WIDTH-1:0]      
//                           \     /                                       \     /                                         \     /                                                                  
//                            v   v                                         v   v                                           v   v                             
//                            |¯¯¯| <--i_valid=2'b11                        |¯¯¯| <--i_valid=2'b10                          |¯¯¯| <--i_valid=2'b01  
//                            |___| <--i_cmd=3'b111                         |___| <--i_cmd=3'b110                           |___| <--i_cmd=3'b101      
//                           /     \                                       /     \                                         /     \
//                          v       v                                     v       v                                       v       v
//                  o_data_low   o_data_high                         Invalid     o_data_high                       o_data_low  Invalid
//
//
// Multicast Function:   Pass_HighIn_BothOut                          Pass_LowIn_BothOut                                   No Pass   
//                 
//       i_data_bus(high)          i_data_bus(low)      i_data_bus(high)          i_data_bus(low)      i_data_bus(high)          i_data_bus(low)              
//    [DATA_WIDTH+:DATA_WIDTH]    [DATA_WIDTH-1:0]    [DATA_WIDTH+:DATA_WIDTH]    [DATA_WIDTH-1:0]   [DATA_WIDTH+:DATA_WIDTH]    [DATA_WIDTH-1:0]      
//                           \     /                                       \     /                                         \     /                                                                  
//                            v   v                                         v   v                                           v   v                             
//                            |¯¯¯| <--i_valid=2'b11                        |¯¯¯| <--i_valid=2'b01                          |¯¯¯| <--i_valid=2'b00
//                            |___| <--i_cmd=3'b000                         |___| <--i_cmd=3'b100                           |___| <--i_cmd=3'bxxx      
//                           /     \                                       /     \                                         /     \
//                          v       v                                     v       v                                       v       v
//                  o_data_high   o_data_high                      o_data_low    o_data_low                            Invalid  Invalid               
//
//       o_data_high = o_data_bus[2*DATA_WIDTH-1: DATA_WIDTH]
//       o_data_low  = o_data_bus[DATA_WIDTH-1: 0]
//
// Author:      Jianming Tong (jianming.tong@gatech.edu)
/////////////////////////////////////////////////////////////

module distribute_2x2_comb#(
	parameter DATA_WIDTH = 32,
	parameter COMMMAND_WIDTH  = 3
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
	// interface
	input  [1:0]                  i_valid;             
	input  [2*DATA_WIDTH-1:0]     i_data_bus;
	
	output [1:0]                  o_valid;             
	output [2*DATA_WIDTH-1:0]     o_data_bus; //{o_data_a, o_data_b}
	    
	input                         i_en;
	input  [COMMMAND_WIDTH-1:0]   i_cmd;
		// 000 --> Pass HighIn BothOut
		// 100 --> Pass_LowIn_BothOut
		// 011 --> Pass Through
		// 010 --> Pass High
		// 001 --> Pass Low
		// 111 --> Pass Switch 
		// 110 --> Pass HighIn LowOut
		// 101 --> Pass LowIn HighOut
	

	// inner logic
	reg     [1:0]                 i_valid_inner;
	reg     [2*DATA_WIDTH-1:0]    i_data_bus_inner;
	reg     [1:0]                 dis_i_data_high_ctrl;
	wire    [2*DATA_WIDTH-1:0]    dis_o_data_high_data;
	wire    [1:0]                 dis_o_data_high_valid;
	
	reg     [1:0]                 dis_i_data_low_ctrl;
	wire    [2*DATA_WIDTH-1:0]    dis_o_data_low_data;
	wire    [1:0]                 dis_o_data_low_valid;
	
	reg                           merge_i_data_high_ctrl;

	reg                           merge_i_data_low_ctrl;

	always@(*)
	begin
		i_valid_inner = i_valid;
	end
	
	// control generation
	// Note: generated control for merge swtich will be used 1 cycle after distribute switch
	always @(*) begin
		if(i_en)
		begin	
			if( (~i_valid_inner[0]) & (~i_valid_inner[1]) )
			begin //No Pass
				dis_i_data_high_ctrl <= 2'b00; 
				dis_i_data_low_ctrl  <= 2'b11; 

				merge_i_data_high_ctrl <= 1'b0; 
				merge_i_data_low_ctrl <= 1'b0;
			end
			else
			begin
				case(i_cmd)
					3'b000: //Pass HighIn BothOut
					begin
						dis_i_data_high_ctrl <= 2'b11;
						dis_i_data_low_ctrl  <= 2'b00;  //don't care, could be arbitrary signals

						merge_i_data_high_ctrl <= 1'b1; 
						merge_i_data_low_ctrl <= 1'b1;

					end
					3'b100: //Pass_LowIn_BothOut
					begin
						dis_i_data_high_ctrl <= 2'b00; //don't care, could be arbitrary signals
						dis_i_data_low_ctrl  <= 2'b11; 

						merge_i_data_high_ctrl <= 1'b0; 
						merge_i_data_low_ctrl <= 1'b0;
					end
					3'b011: //Pass Through
					begin
						dis_i_data_high_ctrl <= 2'b10; 
						dis_i_data_low_ctrl  <= 2'b01; 

						merge_i_data_high_ctrl <= 1'b1; 
						merge_i_data_low_ctrl <= 1'b0;
					end
					3'b010: //Pass High
					begin
						dis_i_data_high_ctrl <= 2'b10; 
						dis_i_data_low_ctrl  <= 2'b00; 

						merge_i_data_high_ctrl <= 1'b1; 
						merge_i_data_low_ctrl <= 1'b0;
					end
					3'b001: //Pass Low
					begin
						dis_i_data_high_ctrl <= 2'b00; 
						dis_i_data_low_ctrl  <= 2'b01; 

						merge_i_data_high_ctrl <= 1'b0; 
						merge_i_data_low_ctrl <= 1'b0;
					end
					3'b111: //Pass Switch 
					begin
						dis_i_data_high_ctrl <= 2'b01; 
						dis_i_data_low_ctrl  <= 2'b10; 

						merge_i_data_high_ctrl <= 1'b0; 
						merge_i_data_low_ctrl <= 1'b1;
					end
					3'b110: //Pass HighIn LowOut
					begin
						dis_i_data_high_ctrl <= 2'b01; 
						dis_i_data_low_ctrl  <= 2'b00;  //don't care, could be arbitrary signals

						merge_i_data_high_ctrl <= 1'b0; 
						merge_i_data_low_ctrl <= 1'b1;
					end
					3'b101: // Pass LowIn HighOut
					begin
						dis_i_data_high_ctrl <= 2'b00;  //don't care, could be arbitrary signals
						dis_i_data_low_ctrl  <= 2'b10; 

						merge_i_data_high_ctrl <= 1'b0; 
						merge_i_data_low_ctrl <= 1'b0;
					end
					default: // No Pass
					begin
						dis_i_data_high_ctrl <= 2'b00; 
						dis_i_data_low_ctrl  <= 2'b11; 

						merge_i_data_high_ctrl <= 1'b0; 
						merge_i_data_low_ctrl <= 1'b0;
					end
				endcase	
			end	
		end
		else
		begin // No Pass
			dis_i_data_high_ctrl <= 2'b00; 
			dis_i_data_low_ctrl  <= 2'b11; 

			merge_i_data_high_ctrl <= 1'b0; 
			merge_i_data_low_ctrl <= 1'b0;
		end
	end


	// distribute level
	distribute_1x2_comb #(
		.DATA_WIDTH(DATA_WIDTH),
		.COMMMAND_WIDTH(COMMMAND_WIDTH-1)
	) dis_i_data_high(
		.i_valid(i_valid_inner[1]),
		.i_data_bus(i_data_bus[DATA_WIDTH+:DATA_WIDTH]),
		.o_valid(dis_o_data_high_valid),
		.o_data_bus(dis_o_data_high_data),
		.i_en(i_en),
		.i_cmd(dis_i_data_high_ctrl)
	);

	distribute_1x2_comb #(
		.DATA_WIDTH(DATA_WIDTH),
		.COMMMAND_WIDTH(COMMMAND_WIDTH-1)
	)dis_i_data_low(
		.i_valid(i_valid_inner[0]),
		.i_data_bus(i_data_bus[0+:DATA_WIDTH]),
		.o_valid(dis_o_data_low_valid),
		.o_data_bus(dis_o_data_low_data),
		.i_en(i_en),
		.i_cmd(dis_i_data_low_ctrl)
	);



	// merge level
	merge_2x1_comb#(
		.DATA_WIDTH(DATA_WIDTH),
		.COMMMAND_WIDTH(COMMMAND_WIDTH-2)
	)merge_i_data_high(
		.i_valid({dis_o_data_high_valid[1], dis_o_data_low_valid[1]}),
		.i_data_bus({dis_o_data_high_data[DATA_WIDTH+:DATA_WIDTH],dis_o_data_low_data[DATA_WIDTH+:DATA_WIDTH]}),
		.o_valid(o_valid[1]),
		.o_data_bus(o_data_bus[DATA_WIDTH+:DATA_WIDTH]),
		.i_en(i_en),
		.i_cmd(merge_i_data_high_ctrl)
	);

	merge_2x1_comb#(
		.DATA_WIDTH(DATA_WIDTH),
		.COMMMAND_WIDTH(COMMMAND_WIDTH-2)
	)merge_i_data_low(
		.i_valid({dis_o_data_high_valid[0], dis_o_data_low_valid[0]}),
		.i_data_bus({dis_o_data_high_data[0+:DATA_WIDTH],dis_o_data_low_data[0+:DATA_WIDTH]}),
		.o_valid(o_valid[0]),
		.o_data_bus(o_data_bus[0+:DATA_WIDTH]),
		.i_en(i_en),
		.i_cmd(merge_i_data_low_ctrl)
	);


endmodule