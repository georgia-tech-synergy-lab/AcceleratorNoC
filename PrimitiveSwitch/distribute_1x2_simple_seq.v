`timescale 1ns / 1ps
/////////////////////////////////////////////////////////////
// Top Module:  distribute_1x2_simple_seq
// Data:        Only data width matters.
// Format:      keeping the input format unchange
// Timing:      Sequential Logic
// Reset:       Synchronized Reset [High Reset]
// Dummy Data:  {DATA_WIDTH{1'b0}}
// 
// Function:     Duplicate               Branch_high               Branch_low
//                
//               i_data_bus               i_data_bus               i_data_bus
//                   |                        |                        |
//                   v                        v                        v        
//                 |¯¯¯| <--i_valid=1'b1    |¯¯¯| <--i_valid=1'b1    |¯¯¯| <--i_valid=1'b1 
//                 |___| <--i_cmd=2'b11     |___| <--i_cmd=2'b10     |___| <--i_cmd=2'b01    
//                /     \                  /     \                  /     \
//       o_data_high  o_data_low    o_data_high  Invalid        Invalid  o_data_low
//
//       o_data_high = o_data_bus[2*DATA_WIDTH-1: DATA_WIDTH]
//       o_data_low  = o_data_bus[DATA_WIDTH-1: 0]
//       i_valid = 2'b1x; where x indicates "don't care".
// 
// Author:      Jianming Tong (jianming.tong@gatech.edu)
/////////////////////////////////////////////////////////////


// `define MODULAR // If define, then use mux to construct the distribute switch
                // If not define, use LUT to construct the distribute switch
`define FLATTEN 

`ifdef MODULAR
module distribute_1x2_simple_seq#(
	parameter DATA_WIDTH = 32,
	parameter COMMMAND_WIDTH  = 2
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
	// interface
	input                         clk;
	input                         rst;
	
	input                         i_valid;             
	input  [DATA_WIDTH-1:0]       i_data_bus;
	
	output [1:0]                  o_valid;             
	output [2*DATA_WIDTH-1:0]     o_data_bus; //{o_data_a, o_data_b}
	    
	input                         i_en;
	input  [COMMMAND_WIDTH-1:0]   i_cmd;
		// 00 --> NA
		// 01 --> Branch_low
		// 10 --> Branch_high
		// 11 --> Duplicate
	
	// inner logic
	reg                           i_valid_inner;
	reg    [1:0]                  i_cmd_inner;
	reg    [1:0]                  o_valid_inner;
	wire   [1:0]                  mux_o_valid_inner; 

	always@(*)
	begin
		i_valid_inner = i_valid;
		i_cmd_inner = i_cmd;
	end

	mux_2x1_simple_seq #(
		.DATA_WIDTH(DATA_WIDTH),
		.COMMMAND_WIDTH(COMMMAND_WIDTH-1)
	) o_data_low_mux(
		.clk(clk),
		.rst(rst),
		.i_valid({i_valid_inner,1'b0}),
		.i_data_bus({i_data_bus, {DATA_WIDTH{1'b0}}}),
		.o_valid(mux_o_valid_inner[0]),
		.o_data_bus(o_data_bus[0 +: DATA_WIDTH]),
		.i_en(i_en),
		.i_cmd(i_cmd_inner[0])
	);

	mux_2x1_simple_seq #(
		.DATA_WIDTH(DATA_WIDTH),
		.COMMMAND_WIDTH(COMMMAND_WIDTH-1)
	)o_data_high_mux(
		.clk(clk),
		.rst(rst),
		.i_valid({i_valid_inner,1'b0}),
		.i_data_bus({i_data_bus, {DATA_WIDTH{1'b0}}}),
		.o_valid(mux_o_valid_inner[1]),
		.o_data_bus(o_data_bus[DATA_WIDTH +: DATA_WIDTH]),
		.i_en(i_en),
		.i_cmd(i_cmd_inner[1])
	);
	
	always @(posedge clk) begin
		o_valid_inner[0] <= i_cmd_inner[0] & i_en;
		o_valid_inner[1] <= i_cmd_inner[1] & i_en;
	end

	assign o_valid = o_valid_inner;		


endmodule
`endif 


`ifdef FLATTEN
module distribute_1x2_simple_seq#(
	parameter DATA_WIDTH = 32,
	parameter COMMMAND_WIDTH  = 2
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
	// interface
	input                         clk;
	input                         rst;
	
	input                         i_valid;             
	input  [DATA_WIDTH-1:0]       i_data_bus;
	
	output [1:0]                  o_valid;             
	output [2*DATA_WIDTH-1:0]     o_data_bus; //{o_data_a, o_data_b}
	    
	input                         i_en;
	input  [COMMMAND_WIDTH-1:0]   i_cmd;
		// 00 --> NA
		// 01 --> Branch_low
		// 10 --> Branch_high
		// 11 --> Duplicate
	
	// inner logics
	reg    [2*DATA_WIDTH-1:0] 	  o_data_bus_inner;
	reg    [1:0]                  o_valid_inner;

    always@(posedge clk)
    begin
        if(i_en)
        begin
            if(rst)
			begin
				o_data_bus_inner <= {DATA_WIDTH{1'b0}};
				o_valid_inner <= 2'b00;
			end
			else
			begin
				if(i_valid)
				begin
					case(i_cmd)
						2'b00:
						begin
							o_valid_inner <= 2'b00;
							o_data_bus_inner <= {DATA_WIDTH{1'b0}};
						end						
						2'b01:
						begin
							o_valid_inner <= 2'b01;
							o_data_bus_inner <= {{DATA_WIDTH{1'b0}}, i_data_bus};
						end						
						2'b10:
						begin
							o_valid_inner <= 2'b10;
							o_data_bus_inner <= {i_data_bus, {DATA_WIDTH{1'b0}}};
						end						
						2'b11:
						begin
							o_valid_inner <= 2'b11;
							o_data_bus_inner <= {i_data_bus, i_data_bus};
						end	
						default:
						begin
							o_valid_inner <= 2'b00;
							o_data_bus_inner <= {DATA_WIDTH{1'b0}};
						end											
					endcase
				end
			end

        end
    end

	// output inner logic
	assign  o_data_bus = o_data_bus_inner;
	assign  o_valid = o_valid_inner;

endmodule
`endif 
