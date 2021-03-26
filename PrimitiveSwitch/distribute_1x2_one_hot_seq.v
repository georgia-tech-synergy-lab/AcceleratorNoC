`timescale 1ns / 1ps
/////////////////////////////////////////////////////////////
// Top Module:  distribute_1x2_one_hot_seq
// Data:        Only data width matters.
// Format:      keeping the input format unchange
// Timing:      Sequential Logic
// Dummy Data:  {DATA_WIDTH{1'b0}}
// 
// [SINGLE_BIT_CONTROL Version]
//  Function:   output to Node & Pass to the next node             Pass to next node
//                    
//                    i_data_bus                                       i_data_bus
//                        |                                                |
//                        v                                                v        
//                      |¯¯¯| <--i_valid=1'b1                            |¯¯¯| <--i_valid=1'b1 
//  o_cmd=(n-1)b'??? <--|___| <--i_cmd=n'b1???      o_cmd=(n-1)b'??? <-- |___| <--i_cmd=n'b0???    
//                     /     \                                          /     \  
//            o_data_node   i_data_bus                             invalid    i_data_bus
//
//       o_data_node = o_data_bus[2*DATA_WIDTH-1: DATA_WIDTH] -- connect to node
//       o_data_low  = o_data_bus[DATA_WIDTH-1: 0] -- connect to data bus.
//
// Author:      Jianming Tong (jianming.tong@gatech.edu)
/////////////////////////////////////////////////////////////

module distribute_1x2_one_hot_seq#(
	parameter DATA_WIDTH = 32,
	parameter IN_COMMAND_WIDTH = 2
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
	parameter NUM_DATA_OUT = 2;
	parameter OUT_COMMAND_WIDTH = (IN_COMMAND_WIDTH==1)?1:(IN_COMMAND_WIDTH-1);

	// interface
	input                           clk;
	input                           rst;
	
	input                           i_valid;             
	input  [DATA_WIDTH-1:0]         i_data_bus;
	
	output [1:0]                    o_valid;             
	output [2*DATA_WIDTH-1:0]       o_data_bus; //{o_data_a, o_data_b}
	    
	input                           i_en;
	input  [IN_COMMAND_WIDTH-1:0]   i_cmd;
		// 1 --> output to Node & Pass to the next node
		// 0 --> Pass to the next node
	
	output [OUT_COMMAND_WIDTH-1:0]  o_cmd;   

	// inner logic 
	reg    [2*DATA_WIDTH-1:0]       o_data_bus_inner;
	reg    [1:0]                    o_valid_inner;
	reg    [OUT_COMMAND_WIDTH-1:0]  o_cmd_inner;

	// output data & command
	always@(posedge clk)
	begin
		if(i_en && i_valid && (~rst))
		begin
			case(i_cmd[IN_COMMAND_WIDTH-1])
				1'b1: // output to Node & pass to the next node
				begin
					o_data_bus_inner <= {i_data_bus, i_data_bus};
					o_valid_inner <= 2'b11;

					o_cmd_inner <= i_cmd[OUT_COMMAND_WIDTH-1:0];
				end
				1'b0: // Pass to the next node
				begin
					o_data_bus_inner <= {{DATA_WIDTH{1'b0}}, i_data_bus};
					o_valid_inner <= 2'b01;

					o_cmd_inner <= i_cmd[OUT_COMMAND_WIDTH-1:0];
				end
				default:
				begin
					o_valid_inner <= 2'b00;
					o_data_bus_inner <= {2*DATA_WIDTH{1'b0}};

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

	// output data & command
	assign o_valid = o_valid_inner;
	assign o_data_bus = o_data_bus_inner;

	assign o_cmd = o_cmd_inner;

endmodule
