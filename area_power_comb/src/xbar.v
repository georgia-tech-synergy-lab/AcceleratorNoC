/////////////////////////////////////////////////////////////////////////

// Design: xbar.v
// Author: Eric Qin

// Basic Crossbar implmenetation for the distribution network.

/////////////////////////////////////////////////////////////////////////

module xbar # (
	parameter DATA_TYPE = 16,
	parameter NUM_PES = 16,
	parameter INPUT_BW = 16,
	parameter LOG2_PES = 4) (
	clk,
	rst,
	i_data_bus, // input data bus
	i_mux_bus, // mux select control bus
	o_dist_bus // output bus to the multipliers
);

	input clk;
	input rst;
	input [NUM_PES*DATA_TYPE-1 : 0] i_data_bus;
	input [LOG2_PES * NUM_PES -1 : 0] i_mux_bus;
	
	output reg [NUM_PES * DATA_TYPE -1 : 0] o_dist_bus;
	
	wire [NUM_PES * DATA_TYPE -1 : 0] w_dist_bus;
	
	genvar i;
	generate
		for (i=0; i < NUM_PES; i=i+1) begin : gen_out
			mux # (
				.DATA_TYPE(DATA_TYPE),
				.INPUT_BW(INPUT_BW),
				.SEL_SIZE(LOG2_PES)) my_mux (
				.i_data_bus(i_data_bus),
				.i_mux_sel(i_mux_bus[i*LOG2_PES+:LOG2_PES]),
				.o_dist(w_dist_bus[i*DATA_TYPE+:DATA_TYPE])
			);
		end
	endgenerate
	
	always @ (posedge clk or negedge rst) begin
		if (rst == 1'b0) begin
			o_dist_bus = 'd0;
		end else begin
			o_dist_bus = w_dist_bus;
		end
	end
	
endmodule

module mux # (
	parameter DATA_TYPE = 16,
	parameter INPUT_BW = 128,
	parameter SEL_SIZE = 7) (
	i_data_bus,
	i_mux_sel,
	o_dist
);
	input [INPUT_BW*DATA_TYPE-1 : 0] i_data_bus;
	input [SEL_SIZE-1 : 0] i_mux_sel;
	
	output reg [DATA_TYPE-1 : 0] o_dist;
	
	always @ (*) begin
		o_dist = i_data_bus[i_mux_sel*DATA_TYPE+:DATA_TYPE];
	end
	
endmodule
	

