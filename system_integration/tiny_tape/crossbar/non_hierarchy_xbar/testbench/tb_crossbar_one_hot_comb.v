`timescale 1ns / 1ps
/////////////////////////////////////////////////////////////
// Top Module:  tb_crossbar_one_hot_comb
// Data:        Only data width matters.
// Format:      keeping the input format unchange
// Timing:      Combinational Logic
// Dummy Data:  {DATA_WIDTH{1'b0}}
// Command:     Each data comes with a NUM_OUTPUT_DATA-bit one-hot destination command.
//              i_data_bus[0*DATA_WIDTH+:DATA_WIDTH] is corresponding to i_cmd
// Function:    Arbitrary Unicast  or  Arbitrary Multicast
// Note: this file is not parameterizable.
// 
// Example: A 5:4 crossbar. 
//     i_data_bus[0*DATA_WIDTH+:DATA_WIDTH]  ------------------------------------>
//                                            |        |        |        |
//     i_data_bus[1*DATA_WIDTH+:DATA_WIDTH]  ------------------------------------>
//                                            ||       ||       ||       ||
//     i_data_bus[2*DATA_WIDTH+:DATA_WIDTH]  ------------------------------------>
//                                            |||      |||      |||      |||
//     i_data_bus[3*DATA_WIDTH+:DATA_WIDTH]  ------------------------------------>
//                                            ||||     ||||     ||||     ||||
//     i_data_bus[4*DATA_WIDTH+:DATA_WIDTH]  ------------------------------------>
//                                            |||||    |||||    |||||    |||||
//                                            ______   ______   ______   ______
//   5-bit one-hot control to each of mux ->  \____/   \____/   \____/   \____/
//                                              |        |        |        |
//                                              v        v        v        v 
//                                       o_data_bus o_data_bus o_data_bus o_data_bus
//                       [0*DATA_WIDTH+:DATA_WIDTH]           ...         [3*DATA_WIDTH+:DATA_WIDTH]
//
// Example: A 64:8 hierarchy crossbar. For a hierarchy version [2 pipeline stages: first stage = 8* 8:1 mux -- second stage = 1* 8:1 mux;]
//          The following is the hierarchy crossbar for a single output data. 
//          And the whole hierarachy crossbar needs to instantiate the following logic multiple times.
//
//     i_data_bus[0*DATA_WIDTH+:DATA_WIDTH]  ------------------------------------------------------------------------------------------------->
//                                             |                                                           |                    
//     i_data_bus[1*DATA_WIDTH+:DATA_WIDTH]  ------------------------------------------------------------------------------------------------->
//                                             ||                                                          ||                       
//     i_data_bus[2*DATA_WIDTH+:DATA_WIDTH]  ------------------------------------------------------------------------------------------------->
//                                             |||                                                         |||                   
//           ....                              ...                                                         ...                    
//                                             ||||||||                                                    ||||||||               
//     i_data_bus[63*DATA_WIDTH+:DATA_WIDTH]  ------------------------------------------------------------------------------------------------->
//                                             ||||||||                                                    ||||||||               
//                                             ||||||||     ...   i_data_bus[0*DATA_WIDTH+:DATA_WIDTH] ->  |||||||| <- i_data_bus[7*DATA_WIDTH+:DATA_WIDTH]        
//                                             ||||||||                                                    ||||||||         
//     i_data_bus[56*DATA_WIDTH+:DATA_WIDTH]-> |||||||| <- i_data_bus[63*DATA_WIDTH+:DATA_WIDTH]   ...     ||||||||         
//                                            __________                                                  __________            
//   5-bit one-hot control to each of mux ->  \________/                                                  \________/             
//                                                |                                                           |                   
//                                                v                                                           v                     
//                                     inner_first_stage_data_reg[7]                            inner_first_stage_data_reg[0]
//                                                |                                                           |                                       
//                                                ---------------------------  ... ----------------------------
//                                                                          ||||||||
//                                                                         __________ 
//                                                                         \________/          same logic repeats for 8 times.
//                                                                             |             
//                                                                             v              
//                                                                        o_data_bus[7]    ...  o_data_bus[0]
//
//
// Author:      Jianming Tong (jianming.tong@gatech.edu)
/////////////////////////////////////////////////////////////

// `define In16_Out8 
`define In64_Out8

`ifdef In16_Out8
module tb_crossbar_one_hot_comb();
	parameter DATA_WIDTH = 4;      // could be arbitrary number
	parameter NUM_OUTPUT_DATA  = 8; // must be power of 2.
	parameter NUM_INPUT_DATA = 16;  

	localparam TOTAL_COMMMAND = NUM_INPUT_DATA*NUM_OUTPUT_DATA;
	
	localparam WIDTH_INPUT_DATA = NUM_INPUT_DATA*DATA_WIDTH;
	localparam WIDTH_OUTPUT_DATA = NUM_OUTPUT_DATA*DATA_WIDTH;

    // timing signals
    reg                                         clk;

    // interface
	reg   [NUM_INPUT_DATA-1:0]                  i_valid;             
	reg   [WIDTH_INPUT_DATA-1:0]                i_data_bus;
	
	wire  [NUM_OUTPUT_DATA-1:0]                 o_valid;             
	wire  [WIDTH_OUTPUT_DATA-1:0]               o_data_bus; //{o_data_a, o_data_b}

	reg                                         i_en;
    reg   [TOTAL_COMMMAND-1:0]                  i_cmd;

    initial begin
        i_en = 1'b1;
        clk = 0;

        // input valid & correct input command (No conflict) with multicasting.  
        i_valid = {NUM_INPUT_DATA{1'b1}};
        i_data_bus = {{(DATA_WIDTH>>2){4'hf}},{(DATA_WIDTH>>2){4'he}},{(DATA_WIDTH>>2){4'hd}},{(DATA_WIDTH>>2){4'hc}},{(DATA_WIDTH>>2){4'hb}},{(DATA_WIDTH>>2){4'ha}},{(DATA_WIDTH>>2){4'h9}},{(DATA_WIDTH>>2){4'h8}},{(DATA_WIDTH>>2){4'h7}},{(DATA_WIDTH>>2){4'h6}},{(DATA_WIDTH>>2){4'h5}},{(DATA_WIDTH>>2){4'h4}},{(DATA_WIDTH>>2){4'h3}},{(DATA_WIDTH>>2){4'h2}},{(DATA_WIDTH>>2){4'h1}},{(DATA_WIDTH>>2){4'h0}}};
        i_cmd = {8'b10010000, 8'b00100000, 8'b01000100, 104'b0};
        
        // input valid & wrong input command (has conflict at i_cmd[5]).  
        #20
        i_data_bus = {{(DATA_WIDTH>>2){4'hf}},{(DATA_WIDTH>>2){4'he}},{(DATA_WIDTH>>2){4'hd}},{(DATA_WIDTH>>2){4'hc}},{(DATA_WIDTH>>2){4'hb}},{(DATA_WIDTH>>2){4'ha}},{(DATA_WIDTH>>2){4'h9}},{(DATA_WIDTH>>2){4'h8}},{(DATA_WIDTH>>2){4'h7}},{(DATA_WIDTH>>2){4'h6}},{(DATA_WIDTH>>2){4'h5}},{(DATA_WIDTH>>2){4'h4}},{(DATA_WIDTH>>2){4'h3}},{(DATA_WIDTH>>2){4'h2}},{(DATA_WIDTH>>2){4'h1}},{(DATA_WIDTH>>2){4'h0}}};
        i_cmd = {8'b10010000, 8'b00100000, 8'b00100010, 104'b0};
        
        // input valid & correct input command (unicasting).  
        #20
        i_data_bus = {{(DATA_WIDTH>>2){4'hf}},{(DATA_WIDTH>>2){4'he}},{(DATA_WIDTH>>2){4'hd}},{(DATA_WIDTH>>2){4'hc}},{(DATA_WIDTH>>2){4'hb}},{(DATA_WIDTH>>2){4'ha}},{(DATA_WIDTH>>2){4'h9}},{(DATA_WIDTH>>2){4'h8}},{(DATA_WIDTH>>2){4'h7}},{(DATA_WIDTH>>2){4'h6}},{(DATA_WIDTH>>2){4'h5}},{(DATA_WIDTH>>2){4'h4}},{(DATA_WIDTH>>2){4'h3}},{(DATA_WIDTH>>2){4'h2}},{(DATA_WIDTH>>2){4'h1}},{(DATA_WIDTH>>2){4'h0}}};
        i_cmd = {8'b10000000, 8'b01000000, 8'b00100000, 104'b0};
        #20
        $stop;
    end
    
    // instantiate DUT (device under test)
    crossbar_one_hot_comb#(
        .NUM_INPUT_DATA(NUM_INPUT_DATA), 
        .NUM_OUTPUT_DATA(NUM_OUTPUT_DATA),
        .DATA_WIDTH(DATA_WIDTH)) 
    dut(
		.i_valid(i_valid),
		.i_data_bus(i_data_bus),
		.o_valid(o_valid),
		.o_data_bus(o_data_bus),
		.i_en(i_en),
        .i_cmd(i_cmd)
	);

    always #5 clk=~clk;
    
endmodule
`endif

`ifdef In64_Out8
module tb_crossbar_one_hot_comb();
	parameter DATA_WIDTH = 4;      // could be arbitrary number
	parameter NUM_OUTPUT_DATA  = 8; // must be power of 2.
	parameter NUM_INPUT_DATA = 64;  

	localparam TOTAL_COMMMAND = NUM_INPUT_DATA*NUM_OUTPUT_DATA;
	
	localparam WIDTH_INPUT_DATA = NUM_INPUT_DATA*DATA_WIDTH;
	localparam WIDTH_OUTPUT_DATA = NUM_OUTPUT_DATA*DATA_WIDTH;

    // timing signals
    reg                                         clk;

    // interface
	reg   [NUM_INPUT_DATA-1:0]                  i_valid;             
	reg   [WIDTH_INPUT_DATA-1:0]                i_data_bus;
	
	wire  [NUM_OUTPUT_DATA-1:0]                 o_valid;             
	wire  [WIDTH_OUTPUT_DATA-1:0]               o_data_bus; //{o_data_a, o_data_b}

	reg                                         i_en;
    reg   [TOTAL_COMMMAND-1:0]                  i_cmd;

    initial begin
        i_en = 1'b1;
        clk = 0;

        // input valid & correct input command (No conflict) with multicasting.  
        i_valid = {NUM_INPUT_DATA{1'b1}};
        i_data_bus = {{(DATA_WIDTH>>2){4'hf}},{(DATA_WIDTH>>2){4'he}},{(DATA_WIDTH>>2){4'hd}},{(DATA_WIDTH>>2){4'hc}},{(DATA_WIDTH>>2){4'hb}},{(DATA_WIDTH>>2){4'ha}},{(DATA_WIDTH>>2){4'h9}},{(DATA_WIDTH>>2){4'h8}},{(DATA_WIDTH>>2){4'h7}},{(DATA_WIDTH>>2){4'h6}},{(DATA_WIDTH>>2){4'h5}},{(DATA_WIDTH>>2){4'h4}},{(DATA_WIDTH>>2){4'h3}},{(DATA_WIDTH>>2){4'h2}},{(DATA_WIDTH>>2){4'h1}},{(DATA_WIDTH>>2){4'h0}},{(DATA_WIDTH>>2){4'hf}},{(DATA_WIDTH>>2){4'he}},{(DATA_WIDTH>>2){4'hd}},{(DATA_WIDTH>>2){4'hc}},{(DATA_WIDTH>>2){4'hb}},{(DATA_WIDTH>>2){4'ha}},{(DATA_WIDTH>>2){4'h9}},{(DATA_WIDTH>>2){4'h8}},{(DATA_WIDTH>>2){4'h7}},{(DATA_WIDTH>>2){4'h6}},{(DATA_WIDTH>>2){4'h5}},{(DATA_WIDTH>>2){4'h4}},{(DATA_WIDTH>>2){4'h3}},{(DATA_WIDTH>>2){4'h2}},{(DATA_WIDTH>>2){4'h1}},{(DATA_WIDTH>>2){4'h0}},{(DATA_WIDTH>>2){4'hf}},{(DATA_WIDTH>>2){4'he}},{(DATA_WIDTH>>2){4'hd}},{(DATA_WIDTH>>2){4'hc}},{(DATA_WIDTH>>2){4'hb}},{(DATA_WIDTH>>2){4'ha}},{(DATA_WIDTH>>2){4'h9}},{(DATA_WIDTH>>2){4'h8}},{(DATA_WIDTH>>2){4'h7}},{(DATA_WIDTH>>2){4'h6}},{(DATA_WIDTH>>2){4'h5}},{(DATA_WIDTH>>2){4'h4}},{(DATA_WIDTH>>2){4'h3}},{(DATA_WIDTH>>2){4'h2}},{(DATA_WIDTH>>2){4'h1}},{(DATA_WIDTH>>2){4'h0}},{(DATA_WIDTH>>2){4'hf}},{(DATA_WIDTH>>2){4'he}},{(DATA_WIDTH>>2){4'hd}},{(DATA_WIDTH>>2){4'hc}},{(DATA_WIDTH>>2){4'hb}},{(DATA_WIDTH>>2){4'ha}},{(DATA_WIDTH>>2){4'h9}},{(DATA_WIDTH>>2){4'h8}},{(DATA_WIDTH>>2){4'h7}},{(DATA_WIDTH>>2){4'h6}},{(DATA_WIDTH>>2){4'h5}},{(DATA_WIDTH>>2){4'h4}},{(DATA_WIDTH>>2){4'h3}},{(DATA_WIDTH>>2){4'h2}},{(DATA_WIDTH>>2){4'h1}},{(DATA_WIDTH>>2){4'h0}}};
        i_cmd = {8'b10010000, 8'b00100000, 8'b01000100, 488'b0};
        
        // input valid & wrong input command (has conflict at i_cmd[5]).  
        #20
        i_data_bus = {{(DATA_WIDTH>>2){4'hf}},{(DATA_WIDTH>>2){4'he}},{(DATA_WIDTH>>2){4'hd}},{(DATA_WIDTH>>2){4'hc}},{(DATA_WIDTH>>2){4'hb}},{(DATA_WIDTH>>2){4'ha}},{(DATA_WIDTH>>2){4'h9}},{(DATA_WIDTH>>2){4'h8}},{(DATA_WIDTH>>2){4'h7}},{(DATA_WIDTH>>2){4'h6}},{(DATA_WIDTH>>2){4'h5}},{(DATA_WIDTH>>2){4'h4}},{(DATA_WIDTH>>2){4'h3}},{(DATA_WIDTH>>2){4'h2}},{(DATA_WIDTH>>2){4'h1}},{(DATA_WIDTH>>2){4'h0}},{(DATA_WIDTH>>2){4'hf}},{(DATA_WIDTH>>2){4'he}},{(DATA_WIDTH>>2){4'hd}},{(DATA_WIDTH>>2){4'hc}},{(DATA_WIDTH>>2){4'hb}},{(DATA_WIDTH>>2){4'ha}},{(DATA_WIDTH>>2){4'h9}},{(DATA_WIDTH>>2){4'h8}},{(DATA_WIDTH>>2){4'h7}},{(DATA_WIDTH>>2){4'h6}},{(DATA_WIDTH>>2){4'h5}},{(DATA_WIDTH>>2){4'h4}},{(DATA_WIDTH>>2){4'h3}},{(DATA_WIDTH>>2){4'h2}},{(DATA_WIDTH>>2){4'h1}},{(DATA_WIDTH>>2){4'h0}},{(DATA_WIDTH>>2){4'hf}},{(DATA_WIDTH>>2){4'he}},{(DATA_WIDTH>>2){4'hd}},{(DATA_WIDTH>>2){4'hc}},{(DATA_WIDTH>>2){4'hb}},{(DATA_WIDTH>>2){4'ha}},{(DATA_WIDTH>>2){4'h9}},{(DATA_WIDTH>>2){4'h8}},{(DATA_WIDTH>>2){4'h7}},{(DATA_WIDTH>>2){4'h6}},{(DATA_WIDTH>>2){4'h5}},{(DATA_WIDTH>>2){4'h4}},{(DATA_WIDTH>>2){4'h3}},{(DATA_WIDTH>>2){4'h2}},{(DATA_WIDTH>>2){4'h1}},{(DATA_WIDTH>>2){4'h0}},{(DATA_WIDTH>>2){4'hf}},{(DATA_WIDTH>>2){4'he}},{(DATA_WIDTH>>2){4'hd}},{(DATA_WIDTH>>2){4'hc}},{(DATA_WIDTH>>2){4'hb}},{(DATA_WIDTH>>2){4'ha}},{(DATA_WIDTH>>2){4'h9}},{(DATA_WIDTH>>2){4'h8}},{(DATA_WIDTH>>2){4'h7}},{(DATA_WIDTH>>2){4'h6}},{(DATA_WIDTH>>2){4'h5}},{(DATA_WIDTH>>2){4'h4}},{(DATA_WIDTH>>2){4'h3}},{(DATA_WIDTH>>2){4'h2}},{(DATA_WIDTH>>2){4'h1}},{(DATA_WIDTH>>2){4'h0}}};
        i_cmd = {8'b10010000, 8'b00100000, 8'b00100010, 488'b0};
        
        // input valid & correct input command (unicasting).  
        #20
        i_data_bus = {{(DATA_WIDTH>>2){4'hf}},{(DATA_WIDTH>>2){4'he}},{(DATA_WIDTH>>2){4'hd}},{(DATA_WIDTH>>2){4'hc}},{(DATA_WIDTH>>2){4'hb}},{(DATA_WIDTH>>2){4'ha}},{(DATA_WIDTH>>2){4'h9}},{(DATA_WIDTH>>2){4'h8}},{(DATA_WIDTH>>2){4'h7}},{(DATA_WIDTH>>2){4'h6}},{(DATA_WIDTH>>2){4'h5}},{(DATA_WIDTH>>2){4'h4}},{(DATA_WIDTH>>2){4'h3}},{(DATA_WIDTH>>2){4'h2}},{(DATA_WIDTH>>2){4'h1}},{(DATA_WIDTH>>2){4'h0}},{(DATA_WIDTH>>2){4'hf}},{(DATA_WIDTH>>2){4'he}},{(DATA_WIDTH>>2){4'hd}},{(DATA_WIDTH>>2){4'hc}},{(DATA_WIDTH>>2){4'hb}},{(DATA_WIDTH>>2){4'ha}},{(DATA_WIDTH>>2){4'h9}},{(DATA_WIDTH>>2){4'h8}},{(DATA_WIDTH>>2){4'h7}},{(DATA_WIDTH>>2){4'h6}},{(DATA_WIDTH>>2){4'h5}},{(DATA_WIDTH>>2){4'h4}},{(DATA_WIDTH>>2){4'h3}},{(DATA_WIDTH>>2){4'h2}},{(DATA_WIDTH>>2){4'h1}},{(DATA_WIDTH>>2){4'h0}},{(DATA_WIDTH>>2){4'hf}},{(DATA_WIDTH>>2){4'he}},{(DATA_WIDTH>>2){4'hd}},{(DATA_WIDTH>>2){4'hc}},{(DATA_WIDTH>>2){4'hb}},{(DATA_WIDTH>>2){4'ha}},{(DATA_WIDTH>>2){4'h9}},{(DATA_WIDTH>>2){4'h8}},{(DATA_WIDTH>>2){4'h7}},{(DATA_WIDTH>>2){4'h6}},{(DATA_WIDTH>>2){4'h5}},{(DATA_WIDTH>>2){4'h4}},{(DATA_WIDTH>>2){4'h3}},{(DATA_WIDTH>>2){4'h2}},{(DATA_WIDTH>>2){4'h1}},{(DATA_WIDTH>>2){4'h0}},{(DATA_WIDTH>>2){4'hf}},{(DATA_WIDTH>>2){4'he}},{(DATA_WIDTH>>2){4'hd}},{(DATA_WIDTH>>2){4'hc}},{(DATA_WIDTH>>2){4'hb}},{(DATA_WIDTH>>2){4'ha}},{(DATA_WIDTH>>2){4'h9}},{(DATA_WIDTH>>2){4'h8}},{(DATA_WIDTH>>2){4'h7}},{(DATA_WIDTH>>2){4'h6}},{(DATA_WIDTH>>2){4'h5}},{(DATA_WIDTH>>2){4'h4}},{(DATA_WIDTH>>2){4'h3}},{(DATA_WIDTH>>2){4'h2}},{(DATA_WIDTH>>2){4'h1}},{(DATA_WIDTH>>2){4'h0}}};
        i_cmd = {8'b10000000, 8'b01000000, 8'b00100000, 488'b0};
        #20
        $stop;
    end
    
    // instantiate DUT (device under test)
    crossbar_one_hot_comb#(
        .NUM_INPUT_DATA(NUM_INPUT_DATA), 
        .NUM_OUTPUT_DATA(NUM_OUTPUT_DATA),
        .DATA_WIDTH(DATA_WIDTH)) 
    dut(
		.i_valid(i_valid),
		.i_data_bus(i_data_bus),
		.o_valid(o_valid),
		.o_data_bus(o_data_bus),
		.i_en(i_en),
        .i_cmd(i_cmd)
	);

    always #5 clk=~clk;
    
endmodule
`endif