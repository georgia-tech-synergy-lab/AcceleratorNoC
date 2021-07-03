`timescale 1ns / 1ps
/////////////////////////////////////////////////////////////
// Top Module:  multiplier_seq
// Data:        Only data width matters.
// Format:      keeping the input format unchange
// Timing:      Sequential Logic, each switch takes one clock cycle
// Dummy Data:  {DATA_WIDTH{1'b0}}
// 
// Function:    Multiplier with forwarding link for data local reuse
// 
//                             first clock posedge
// 
// 1'b0 & i_valid -> data_dynamic_wire = i_data_fwd_latch
// 1'b1 & i_valid -> data_dynamic_wire = data_stream_reg                                    1'b1 & valid_dynamic_wire ->  o_fwd_bus = data_dynamic_wire
//                       serve as the input selection --  i_cmd[2]                   i_cmd[3] -- serve as output fwd enable
//                                                           |                          |  
//                                 i_data_fwd_latch          |                          v  
//                                   ______               |\ v                         ____
//  i_fwd_bus & i_fwd_valid -------->_|_|_|-------------->| \                     |---|   |---> o_fwd_bus & o_fwd_valid
//                              /|                        |  |                    |   |___|     
//                             / |   ______               |  |     ______         |    ___
//                            |  |-->_|_|_|-------------->|  |---->_|_|_|------------>|   | 
//    i_data_bus & i_valid -->|  |  data_stream_latch     | /  data_dynamic_reg       | X |----> o_data_bus & o_valid
//                             \ |   ______               |/                          |   | 
//                              \|-->_|_|_|------------------------------------------>|___|     
//                              ^   data_stationary_reg
//                              |   
//                           i_cmd[1] -- serve as reg selection
//                              |        1'b0 & i_valid -> data_stationary_reg = i_data_bus
//                              |        1'b1 & i_valid -> data_stream_reg = i_data_bus
//                              |
//                           i_cmd[0] -- serve as input gate control
//                                       1'b0 -> data_stationary_reg remain unchanged
//                                       1'b0 -> data_stream_reg remain unchanged
// 
// Note: there might be some demand for changing data_stream_reg & data_stationary_reg & data_dynamic_wire into FIFO
// 1. pattern to remember the configurations: 1 is always used to select data_stream_reg e.g. i_cmd[1] & i_cmd[2]
// 2. o_fwd_bus only has 1 cycle latency 
//
// Author:      Jianming Tong (jianming.tong@gatech.edu)
/////////////////////////////////////////////////////////////

module multiplier_seq#(
	parameter DATA_WIDTH = 16,                            // specify the datawidht of input data.
	parameter COMMAND_WIDTH = 4 + $clog2(DATA_WIDTH) +1   // total input command bits. 
						// 4 bits for functionality specification; 
						// extra $clog2(DATA_WIDTH) + 1 bits are used for bit selection 
)(
    // data signals
	clk,
	rst,
	
	i_valid,        // valid input data signal
	i_data_bus,     // input data
	
	i_fwd_valid,    // valid forward data signal
	i_fwd_bus,      // data forward input from neighbor multiplier
	
	o_valid,        // output valid
    o_data_bus,     // output data 

	o_fwd_valid,    // output valid forward data signal
	o_fwd_bus,      // output data forward output to neighbor multiplier
	
	// control signals
	i_en,           // distribute switch enable
	i_cmd           // command 
);

    // data signals
	input                            clk;
	input                            rst;
	
	input  [DATA_WIDTH-1:0]          i_data_bus;
	input                            i_valid;             

	input  [DATA_WIDTH-1:0]          i_fwd_bus;
	input                            i_fwd_valid;

	output [DATA_WIDTH-1:0]          o_data_bus;
	output                           o_valid;             
	
	output [DATA_WIDTH-1:0]          o_fwd_bus;
	output                           o_fwd_valid;     
	
	input                            i_en;
	input  [COMMAND_WIDTH-1:0]       i_cmd;

	/*
	   first stage var definition
	*/

	// first stage latch (combinational assignment)
	reg    [DATA_WIDTH-1:0]          i_data_fwd_latch;
	reg    [DATA_WIDTH-1:0]          i_data_stream_latch;
	reg    [DATA_WIDTH-1:0]          i_data_stationary_latch;
  
	reg                              i_valid_fwd_latch;
	reg                              i_valid_stream_latch;
	reg                              i_valid_stationary_latch;

	// first stage reg (sequential assignment)
	reg    [DATA_WIDTH-1:0]          data_dynamic_reg;
	reg    [DATA_WIDTH-1:0]          data_stationary_reg;

	reg                              valid_dynamic_reg;
	reg                              valid_stationary_reg;

	// first stage module output connection wire
	wire   [DATA_WIDTH-1:0]          data_dynamic_wire;
	wire                             valid_dynamic_wire;
	
	/*
		second stage var definition
	*/

	// second stage latch (combinational assignment)
	reg    [2*DATA_WIDTH-1:0]        o_data_full_latch;
	reg                              o_valid_latch;	
	
	// second stage reg (sequential assignment)
	reg    [DATA_WIDTH-1:0]          o_fwd_bus_reg;
	reg                              o_valid_fwd_reg;

	// stored control of first stages for usage in the second stage.
	reg    [$clog2(DATA_WIDTH)+1:0]  cmd_second_stage_reg;     // store 2 bits in the first stage for second stage usage &
															   // ($clog2(DATA_WIDTH) + 1) bits for bit selection
															   // ($clog2(DATA_WIDTH) + 2) in total

	always @(posedge clk) begin
		if(i_en & (~rst))
		begin
			cmd_second_stage_reg <= i_cmd[3 +: ($clog2(DATA_WIDTH)+2)];
		end
		else
		begin
			cmd_second_stage_reg <= {($clog2(DATA_WIDTH)+2){1'b0}};
		end
	end

	/*
		first stage (1 cycle)
	*/

	initial begin
		i_data_fwd_latch <= {DATA_WIDTH{1'b0}};
		data_stationary_reg <= {DATA_WIDTH{1'b0}};

		i_valid_fwd_latch <= 1'b0;
		valid_stationary_reg <= 1'b0;
	end

	// data_stationary_reg 
	always @(*) begin
		if(i_en & ~rst)
		begin
			i_data_stationary_latch <= (i_cmd[0] & (~i_cmd[1]) & i_valid)?i_data_bus:data_stationary_reg;
			i_valid_stationary_latch <= (i_cmd[0] & (~i_cmd[1]) & i_valid)?i_valid:valid_stationary_reg;
		end
		else
		begin
			i_data_stationary_latch <= {DATA_WIDTH{1'b0}};
			i_valid_stationary_latch <= 1'b0;
		end
	end
	
	// data_stream_reg
	always @(*) begin
		if(i_en & ~rst)
		begin
			i_data_stream_latch <= (i_cmd[0] & i_cmd[1] & i_valid)?i_data_bus:{DATA_WIDTH{1'b0}};
			i_valid_stream_latch <= (i_cmd[0] & i_cmd[1] & i_valid)?i_valid:1'b0;
		end
		else
		begin
			i_data_stream_latch <= {DATA_WIDTH{1'b0}};
			i_valid_stream_latch <= 1'b0;
		end
	end

	// i_data_fwd_latch
	always @(*) begin
		i_data_fwd_latch <= (i_fwd_valid)?i_fwd_bus:{DATA_WIDTH{1'b0}};
		i_valid_fwd_latch <= i_fwd_valid;
	end

	// data_dynamic_wire
	mux_2x1_simple_comb#(
		.DATA_WIDTH(DATA_WIDTH)
	) i_data_mux(
		.i_valid({i_valid_stream_latch, i_valid_fwd_latch}),
		.i_data_bus({i_data_stream_latch, i_data_fwd_latch}),
		.o_valid(valid_dynamic_wire),
		.o_data_bus(data_dynamic_wire),
		.i_en(i_en),
		.i_cmd(i_cmd[2])
	);

	always @(posedge clk)
	begin
		if(i_en & ~rst)
		begin
			data_stationary_reg <= i_data_stationary_latch;
			valid_stationary_reg <= i_valid_stationary_latch;
			
			data_dynamic_reg <= data_dynamic_wire;
			valid_dynamic_reg <= valid_dynamic_wire;
		end
		else
		begin
			data_stationary_reg <= {DATA_WIDTH{1'b0}};
			valid_stationary_reg <= 1'b0;
			
			data_dynamic_reg <= {DATA_WIDTH{1'b0}};
			valid_dynamic_reg <= 1'b0;
		end
	end

	// o_fwd_data
	always @(posedge clk) begin
		if(i_en & ~rst)
		begin
			o_fwd_bus_reg <= (cmd_second_stage_reg[0] & valid_dynamic_wire)?data_dynamic_wire:{DATA_WIDTH{1'b0}};
			o_valid_fwd_reg <= cmd_second_stage_reg[0] & valid_dynamic_wire;
		end
		else
		begin
			o_fwd_bus_reg <= {DATA_WIDTH{1'b0}};
			o_valid_fwd_reg <= 1'b0;
		end
	end

	assign o_fwd_bus = o_fwd_bus_reg;
	assign o_fwd_valid = o_valid_fwd_reg;
	

	/*
		second stage
	*/

	//  perform multiplication on two input data of the multiplier 
	//  Note: there might need dedicated DSP to handle the operation of multiplier.
	always @(*) begin
		if(i_en & ~rst)
		begin
			o_data_full_latch <= ( valid_dynamic_reg & valid_stationary_reg)?(data_dynamic_reg * data_stationary_reg):{DATA_WIDTH{1'b0}};
			o_valid_latch <= valid_dynamic_reg & valid_stationary_reg;
		end
		else
		begin
			o_data_full_latch <= {DATA_WIDTH{1'b0}};
			o_valid_latch <= 1'b0;
		end
	end

	// perform bits selection on multiplcation results
 	bit_selection_16x8_seq #(
		.DATA_WIDTH((DATA_WIDTH<<1)),
        .COMMAND_WIDTH($clog2(DATA_WIDTH)+1)
	) bit_selector(
        .clk(clk),
        .rst(rst),
		.i_valid(o_valid_latch),
		.i_data_bus(o_data_full_latch),
		.o_valid(o_valid),
		.o_data_bus(o_data_bus),
		.i_en(i_en),
		.i_cmd(cmd_second_stage_reg[1+:($clog2(DATA_WIDTH)+1)])
	);


endmodule
