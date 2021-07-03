`timescale 1ns / 1ps
/////////////////////////////////////////////////////////////
// Top Module:  multiplier_first_seq
// Data:        Only data width matters.
// Format:      keeping the input format unchange
// Timing:      Sequential Logic, each switch takes one clock cycle
// Dummy Data:  {DATA_WIDTH{1'b0}}
// 
// Function:    Multiplier with forwarding link for data local reuse
//                                
//                             first clock posedge
//                                                                 1'b1 & i_valid_dynamic_wire ->  o_fwd_bus = data_dynamic_reg
//                                                      i_cmd[3] -- serve as output fwd enable
//                                                         |  
//                                                         v  
//                                                        ____
//                                                   |---|   |---> o_fwd_bus & o_fwd_valid
//                              /|                   |   |___|     
//                             / |    ______         |    ___
//                            |  |--->_|_|_|------------>|   | 
//    i_data_bus & i_valid -->|  |  data_dynamic_reg     | X |----> o_data_bus & o_valid
//                             \ |   ______              |   | 
//                              \|-->_|_|_|------------->|___|     
//                              ^   data_stationary_reg
//                              |   
//                           i_cmd[1] -- serve as reg selection
//                              |        1'b0 & i_valid -> data_stationary_reg = i_data_bus
//                              |        1'b1 & i_valid -> data_dynamic_reg = i_data_bus
//                              |
//                           i_cmd[0] -- serve as input gate control
//                                       1'b0 -> data_stationary_reg remain unchanged
//                                       1'b0 -> data_dynamic_reg remain unchanged
// 
// Note: there might be some demand for changing data_dynamic_reg & data_stationary_reg & data_dynamic_reg into FIFO
// 1. pattern to remember the configurations: 1 is always used to select data_dynamic_reg e.g. i_cmd[1] & i_cmd[2]
// 
// Author:      Jianming Tong (jianming.tong@gatech.edu)
/////////////////////////////////////////////////////////////

module multiplier_first_seq#(
	parameter DATA_WIDTH = 16,                          // could be 8,16,32
	parameter COMMAND_WIDTH = 4 + $clog2(DATA_WIDTH) +1 // total input command bits.
)(
    // data signals
	clk,
	rst,
	
	i_valid,        // valid input data signal
	i_data_bus,     // input data
	
	o_valid,        // output valid
    o_data_bus,     // output data 

	o_fwd_valid,    // output valid forward data signal
	o_fwd_bus,      // output data forward output to neighbor multiplier
	
	// control signals
	i_en,           // distribute switch enable
	i_cmd           // command 
);

    // data signals
	input                          clk;
	input                          rst;
	
	input  [DATA_WIDTH-1:0]        i_data_bus;
	input                          i_valid;             

	output [DATA_WIDTH-1:0]        o_data_bus;
	output                         o_valid;             
	
	output [DATA_WIDTH-1:0]        o_fwd_bus;
	output                         o_fwd_valid;     
	
	input                          i_en;
	input  [COMMAND_WIDTH-1:0]     i_cmd;

	/*
		first stage var definition
	*/

	// first stage reg (sequential assignment)
	reg    [DATA_WIDTH-1:0]        data_stationary_reg;
	reg                            valid_stationary_reg;

	reg    [DATA_WIDTH-1:0]        data_dynamic_reg;
	reg                            valid_dynamic_reg;
	
	/*
		second stage var definition
	*/

	// second stage latch (combinational assignment)
	reg    [2*DATA_WIDTH-1:0]      o_data_full_latch;
	reg                            o_valid_latch;	
	
	// second stage reg (sequential assignment)
	reg    [DATA_WIDTH-1:0]        o_fwd_bus_reg;
	reg                            o_valid_fwd_reg;

	// stored control of first stages for usage in the second stage.
	reg    [$clog2(DATA_WIDTH):0]  cmd_second_stage_reg; // $clog2(DATA_WIDTH) + 1 bits in total

	always @(posedge clk) begin
		if(i_en & (~rst))
		begin
			cmd_second_stage_reg <= i_cmd[4 +: ($clog2(DATA_WIDTH)+1)];
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
		data_stationary_reg <= {DATA_WIDTH{1'b0}};
		data_dynamic_reg <= {DATA_WIDTH{1'b0}};
		
		valid_stationary_reg <= 1'b0;
		valid_dynamic_reg <= 1'b0;
	end

	// data_stationary_reg 
	always @(posedge clk) begin
		if(i_en & ~rst)
		begin
			data_stationary_reg <= (i_cmd[0] & (~i_cmd[1]) & i_valid)?i_data_bus:data_stationary_reg;
			valid_stationary_reg <= (i_cmd[0] & (~i_cmd[1]) & i_valid)?i_valid:valid_stationary_reg;
		end
		else
		begin
			data_stationary_reg <= {DATA_WIDTH{1'b0}};
			valid_stationary_reg <= 1'b0;
		end
	end
	
	// data_dynamic_reg
	always @(posedge clk) begin
		if(i_en & ~rst)
		begin
			data_dynamic_reg <= (i_cmd[0] & i_cmd[1] & i_valid)?i_data_bus:data_dynamic_reg;
			valid_dynamic_reg <= (i_cmd[0] & i_cmd[1] & i_valid)?i_valid:valid_dynamic_reg;
		end
		else
		begin
			data_dynamic_reg <= {DATA_WIDTH{1'b0}};
			valid_dynamic_reg <= 1'b0;
		end
	end

	/*
		second stage
	*/

	//  perform multiplication on two input data of the multiplier 
	//  Note: there might need dedicated DSP to handle the operation of multiplier.
	always @(*) begin
		if(i_en & ~rst)
		begin
			o_data_full_latch <= (valid_dynamic_reg & valid_stationary_reg)?(data_dynamic_reg * data_stationary_reg):{DATA_WIDTH{1'b0}};
			o_valid_latch <= valid_dynamic_reg & valid_stationary_reg;
		end
		else
		begin
			o_data_full_latch <= {DATA_WIDTH{1'b0}};
			o_valid_latch <= 1'b0;
		end
	end

	// o_fwd_data
	always @(posedge clk) begin
		if(i_en & ~rst)
		begin
			o_fwd_bus_reg <= (i_cmd[3] & valid_dynamic_reg)?data_dynamic_reg:{DATA_WIDTH{1'b0}};
			o_valid_fwd_reg <= i_cmd[3] & valid_dynamic_reg;
		end
		else
		begin
			o_fwd_bus_reg <= {DATA_WIDTH{1'b0}};
			o_valid_fwd_reg <= 1'b0;
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
		.i_cmd(cmd_second_stage_reg)
	);

	assign o_fwd_bus = o_fwd_bus_reg;
	assign o_fwd_valid = o_valid_fwd_reg;
	
endmodule
