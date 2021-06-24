`timescale 1ns / 1ps
/////////////////////////////////////////////////////////////
// Top Module:  bit_selection_32x16_seq
// Data:        Only data width matters.
// Format:      keeping the input format unchange
// Timing:      Sequential Logic, one clock cycle latency
// Dummy Data:  {DATA_WIDTH{1'b0}}
// 
// Function:    select 16 continous bits out of 32 bits --> total 16 cases (if need shift) -> 4-bit command.
// 
// Author:      Jianming Tong (jianming.tong@gatech.edu)
/////////////////////////////////////////////////////////////

module bit_selection_32x16_seq#(
	parameter DATA_WIDTH = 32,                        // could only be 16
	parameter COMMAND_WIDTH = $clog2(DATA_WIDTH) -1   // could only be 3 
)(
    // data signals
	clk,
	rst,
	
	i_valid,        // valid input data signal
	i_data_bus,     // input data
	
	o_valid,        // output valid
    o_data_bus,     // output data 

	// control signals
	i_en,           // distribute switch enable
	i_cmd           // command 
);

	localparam  OUT_DATA_WIDTH = DATA_WIDTH >> 1;

    // data signals
	input                          clk;
	input                          rst;
	
	input  [DATA_WIDTH-1:0]        i_data_bus;
	input                          i_valid;             

	output [OUT_DATA_WIDTH-1:0]    o_data_bus;
	output                         o_valid;             
	
	input                          i_en;
	input  [COMMAND_WIDTH-1:0]     i_cmd;

	reg    [OUT_DATA_WIDTH-1:0]    o_data_bus_reg;
	reg                            o_valid_reg;
    
	always@(posedge clk)
	begin
		if(i_en & (~rst) & i_valid)
		begin
			case(i_cmd)
				4'h0:
				begin
					o_data_bus_reg <= i_data_bus[1+:OUT_DATA_WIDTH];
				end
				4'h1:
				begin
					o_data_bus_reg <= i_data_bus[2+:OUT_DATA_WIDTH];
				end
				4'h2:
				begin
					o_data_bus_reg <= i_data_bus[3+:OUT_DATA_WIDTH];
				end
				4'h3:
				begin
					o_data_bus_reg <= i_data_bus[4+:OUT_DATA_WIDTH];
				end
				4'h4:
				begin
					o_data_bus_reg <= i_data_bus[5+:OUT_DATA_WIDTH];
				end
				4'h5:
				begin
					o_data_bus_reg <= i_data_bus[6+:OUT_DATA_WIDTH];
				end
				4'h6:
				begin
					o_data_bus_reg <= i_data_bus[7+:OUT_DATA_WIDTH];
				end
				4'h7:
				begin
					o_data_bus_reg <= i_data_bus[8+:OUT_DATA_WIDTH];
				end
				4'h8:
				begin
					o_data_bus_reg <= i_data_bus[9+:OUT_DATA_WIDTH];
				end
				4'h9:
				begin
					o_data_bus_reg <= i_data_bus[10+:OUT_DATA_WIDTH];
				end
				4'hA:
				begin
					o_data_bus_reg <= i_data_bus[11+:OUT_DATA_WIDTH];
				end
				4'hB:
				begin
					o_data_bus_reg <= i_data_bus[12+:OUT_DATA_WIDTH];
				end
				4'hC:
				begin
					o_data_bus_reg <= i_data_bus[13+:OUT_DATA_WIDTH];
				end
				4'hD:
				begin
					o_data_bus_reg <= i_data_bus[14+:OUT_DATA_WIDTH];
				end
				4'hE:
				begin
					o_data_bus_reg <= i_data_bus[15+:OUT_DATA_WIDTH];
				end
				4'hF:
				begin
					o_data_bus_reg <= i_data_bus[16+:OUT_DATA_WIDTH];
				end
				default:
				begin
					o_data_bus_reg <= i_data_bus[0+:OUT_DATA_WIDTH];
				end
			endcase
		end
		else
		begin
			o_data_bus_reg <= {OUT_DATA_WIDTH{1'b0}};
		end
	end

  	always@(posedge clk)
	begin
		if(i_en & (~rst) & i_valid)
		begin
		 	o_valid_reg <= 1'b1;
		end
		else 
		begin
			o_valid_reg <= 1'b0;
		end
	end
	
	assign o_data_bus = o_data_bus_reg;
	assign o_valid = o_valid_reg;

endmodule