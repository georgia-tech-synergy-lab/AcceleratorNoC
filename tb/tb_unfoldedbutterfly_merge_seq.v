`timescale 1ns / 1ps
/////////////////////////////////////////////////////////////
// Top Module:  tb_unfoldedbutterfly_merge_seq
// Data:        Only data width matters.
// Format:      keeping the input format unchange
// Timing:      Combinational Logic
// Pipeline:    every stage is a pipeline stage
//              Total latency = # stages (cycle)  
// Dummy Data:  {DATA_WIDTH{1'bz}}
// 
// Function:    Unicast  or  Multicast(Not arbitrary Multicast)
//                                              
//     i_data_bus[0*DATA_WIDTH+:DATA_WIDTH]  -->|¯¯¯|-------------->|¯¯¯|-------->|¯¯¯|-\
//                                              |___|-\          /->|___|-\    /->|___|  \-->|¯¯¯|
//                                                     \        /          \  /          /-->|___|-->            
//     i_data_bus[1*DATA_WIDTH+:DATA_WIDTH]  -->|¯¯¯|---\------/--->|¯¯¯|---\/--->|¯¯¯|-/
//                                              |___|-\  \    /  /->|___|-\ /\ /->|___|
//                                                     \  \  /  /          X  X               
//     i_data_bus[2*DATA_WIDTH+:DATA_WIDTH]  -->|¯¯¯|---\--\/--/--->|¯¯¯|-/ \/ \->|¯¯¯|-\
//                                              |___|-\  \ /\ /  /->|___|---/\--->|___|  \-->|¯¯¯|
//                                                     \  X  X  /          /  \          /-->|___|-->               
//     i_data_bus[3*DATA_WIDTH+:DATA_WIDTH]  -->|¯¯¯|---\/-\/-\/--->|¯¯¯|-/    \->|¯¯¯|-/
//                                              |___|-\ /\ /\ /\ /->|___|-------->|___|
//                                                     X  X  X  X
//     i_data_bus[4*DATA_WIDTH+:DATA_WIDTH]  -->|¯¯¯|-/ \/ \/ \/ \->|¯¯¯|-------->|¯¯¯|-\
//                                              |___|---/\-/\-/\--->|___|-\    /->|___|  \-->|¯¯¯|
//                                                     /  X  X  \          \  /          /-->|___|-->           
//     i_data_bus[5*DATA_WIDTH+:DATA_WIDTH]  -->|¯¯¯|-/  / \/ \  \->|¯¯¯|---\/--->|¯¯¯|-/
//                                              |___|---/--/\--\--->|___|-\ /\ /->|___|
//                                                     /  /  \  \          X  X              
//     i_data_bus[6*DATA_WIDTH+:DATA_WIDTH]  -->|¯¯¯|-/  /    \  \->|¯¯¯|-/ \/ \->|¯¯¯|-\
//                                              |___|---/------\--->|___|---/\--->|___|  \-->|¯¯¯|
//                                                     /        \          /  \          /-->|___|-->      
//     i_data_bus[7*DATA_WIDTH+:DATA_WIDTH]  -->|¯¯¯|-/          \->|¯¯¯|-/    \->|¯¯¯|-/
//                                              |___|-------------->|___|-------->|___|
//
//        CONNECTION FUNCTION                           BUTTERFLY       BUTTERFLY           Merge stage
//       CONNECTION GROUP SIZE                             16               8 
//
// Control Signal
//     i_valid[0]-->|¯¯¯|<--i_cmd[2:0] 
//     i_valid[1]-->|___|
//     
// Author:      Jianming Tong (jianming.tong@gatech.edu)
/////////////////////////////////////////////////////////////

`define TEST_8_unfoldedbutterfly_merge
// `define TEST_16_unfoldedbutterfly_merge //TODO, current is old verion does not work for new unfoldedbutterfly


`ifdef TEST_16_unfoldedbutterfly_merge
module tb_unfoldedbutterfly_merge_seq();
    parameter DATA_WIDTH = 4;
    parameter NUM_INPUT_DATA = 16;
    parameter NUM_OUTPUT_DATA = 4;
	parameter COMMAND_WIDTH  = $clog2(NUM_OUTPUT_DATA);   // = length of index of destination in binary 
    parameter DESTINATION_TAG_WIDTH = COMMAND_WIDTH;     // destination tag, each level consumes 1 bit.
	
    // parameter
	localparam  WIDTH_INPUT_DATA = DATA_WIDTH * NUM_INPUT_DATA;
	
	// interface
	reg                                                        clk;
	reg                                                        rst;

	reg    [NUM_INPUT_DATA-1:0]                                i_valid;             
	reg    [WIDTH_INPUT_DATA-1:0]                              i_data_bus;
	
	wire   [NUM_INPUT_DATA-1:0]                                o_valid;             
	wire   [WIDTH_INPUT_DATA-1:0]                              o_data_bus; //{o_data_a, o_data_b}

	reg                                                        i_en;
	reg    [NUM_INPUT_DATA*DESTINATION_TAG_WIDTH-1:0]          i_cmd;

    // Test case declaration
    // all cases for control
    initial
    begin
        clk = 1'b0;
        // not enable at start
        #40
        rst =1'b0;
        i_valid = {NUM_INPUT_DATA{1'b1}};
        i_data_bus = {{(DATA_WIDTH>>2){4'hf}},{(DATA_WIDTH>>2){4'he}},{(DATA_WIDTH>>2){4'hd}},{(DATA_WIDTH>>2){4'hc}},{(DATA_WIDTH>>2){4'hb}},{(DATA_WIDTH>>2){4'ha}},{(DATA_WIDTH>>2){4'h9}},{(DATA_WIDTH>>2){4'h8}},{(DATA_WIDTH>>2){4'h7}},{(DATA_WIDTH>>2){4'h6}},{(DATA_WIDTH>>2){4'h5}},{(DATA_WIDTH>>2){4'h4}},{(DATA_WIDTH>>2){4'h3}},{(DATA_WIDTH>>2){4'h2}},{(DATA_WIDTH>>2){4'h1}},{(DATA_WIDTH>>2){4'h0}}};
        i_en = 1'b0;
        i_cmd = {4'b1111,4'b0111,4'b1110,4'b0110,4'b1101,4'b0101,4'b1100,4'b0100,4'b1011,4'b0011,4'b1010,4'b0010,4'b1001,4'b0001,4'b1000,4'b0000};
        
        // reset
        #40
        rst =1'b1;
        i_valid = {NUM_INPUT_DATA{1'b1}};
        i_data_bus = {{(DATA_WIDTH>>2){4'hf}},{(DATA_WIDTH>>2){4'he}},{(DATA_WIDTH>>2){4'hd}},{(DATA_WIDTH>>2){4'hc}},{(DATA_WIDTH>>2){4'hb}},{(DATA_WIDTH>>2){4'ha}},{(DATA_WIDTH>>2){4'h9}},{(DATA_WIDTH>>2){4'h8}},{(DATA_WIDTH>>2){4'h7}},{(DATA_WIDTH>>2){4'h6}},{(DATA_WIDTH>>2){4'h5}},{(DATA_WIDTH>>2){4'h4}},{(DATA_WIDTH>>2){4'h3}},{(DATA_WIDTH>>2){4'h2}},{(DATA_WIDTH>>2){4'h1}},{(DATA_WIDTH>>2){4'h0}}};
        i_en = 1'b0;
        i_cmd = {4'b1111,4'b0111,4'b1110,4'b0110,4'b1101,4'b0101,4'b1100,4'b0100,4'b1011,4'b0011,4'b1010,4'b0010,4'b1001,4'b0001,4'b1000,4'b0000};
          
        // reg active -- Pass Through
        #40
        rst =1'b0;
        i_valid = {NUM_INPUT_DATA{1'b1}};
        i_data_bus = {{(DATA_WIDTH>>2){4'hf}},{(DATA_WIDTH>>2){4'he}},{(DATA_WIDTH>>2){4'hd}},{(DATA_WIDTH>>2){4'hc}},{(DATA_WIDTH>>2){4'hb}},{(DATA_WIDTH>>2){4'ha}},{(DATA_WIDTH>>2){4'h9}},{(DATA_WIDTH>>2){4'h8}},{(DATA_WIDTH>>2){4'h7}},{(DATA_WIDTH>>2){4'h6}},{(DATA_WIDTH>>2){4'h5}},{(DATA_WIDTH>>2){4'h4}},{(DATA_WIDTH>>2){4'h3}},{(DATA_WIDTH>>2){4'h2}},{(DATA_WIDTH>>2){4'h1}},{(DATA_WIDTH>>2){4'h0}}};
        i_en = 1'b1;
        i_cmd = {4'b1111,4'b0111,4'b1110,4'b0110,4'b1101,4'b0101,4'b1100,4'b0100,4'b1011,4'b0011,4'b1010,4'b0010,4'b1001,4'b0001,4'b1000,4'b0000};
    
        // reg active -- Pass Switch
        #40
        i_valid = {NUM_INPUT_DATA{1'b1}};
        i_data_bus = {{(DATA_WIDTH>>2){4'hf}},{(DATA_WIDTH>>2){4'he}},{(DATA_WIDTH>>2){4'hd}},{(DATA_WIDTH>>2){4'hc}},{(DATA_WIDTH>>2){4'hb}},{(DATA_WIDTH>>2){4'ha}},{(DATA_WIDTH>>2){4'h9}},{(DATA_WIDTH>>2){4'h8}},{(DATA_WIDTH>>2){4'h7}},{(DATA_WIDTH>>2){4'h6}},{(DATA_WIDTH>>2){4'h5}},{(DATA_WIDTH>>2){4'h4}},{(DATA_WIDTH>>2){4'h3}},{(DATA_WIDTH>>2){4'h2}},{(DATA_WIDTH>>2){4'h1}},{(DATA_WIDTH>>2){4'h0}}};
        i_en = 1'b1;
        i_cmd = {4'b0000,4'b1000,4'b0001,4'b1001,4'b0010,4'b1010,4'b0011,4'b1011,4'b0100,4'b1100,4'b0101,4'b1101,4'b0110,4'b1110,4'b0111,4'b1111};
                
        // reg active -- No Pass
        #40
        i_valid = {NUM_INPUT_DATA{1'b0}};
        i_data_bus = {{(DATA_WIDTH>>2){4'hf}},{(DATA_WIDTH>>2){4'he}},{(DATA_WIDTH>>2){4'hd}},{(DATA_WIDTH>>2){4'hc}},{(DATA_WIDTH>>2){4'hb}},{(DATA_WIDTH>>2){4'ha}},{(DATA_WIDTH>>2){4'h9}},{(DATA_WIDTH>>2){4'h8}},{(DATA_WIDTH>>2){4'h7}},{(DATA_WIDTH>>2){4'h6}},{(DATA_WIDTH>>2){4'h5}},{(DATA_WIDTH>>2){4'h4}},{(DATA_WIDTH>>2){4'h3}},{(DATA_WIDTH>>2){4'h2}},{(DATA_WIDTH>>2){4'h1}},{(DATA_WIDTH>>2){4'h0}}};
        i_en = 1'b1;
        i_cmd = {4'b0000,4'b1000,4'b0001,4'b1001,4'b0010,4'b1010,4'b0011,4'b1011,4'b0100,4'b1100,4'b0101,4'b1101,4'b0110,4'b1110,4'b0111,4'b1111};

        // change data half way  -- Pass Through
        #40
        i_valid = {NUM_INPUT_DATA{1'b1}};
        i_data_bus = {{(DATA_WIDTH>>2){4'hf}},{(DATA_WIDTH>>2){4'he}},{(DATA_WIDTH>>2){4'hd}},{(DATA_WIDTH>>2){4'hc}},{(DATA_WIDTH>>2){4'hb}},{(DATA_WIDTH>>2){4'ha}},{(DATA_WIDTH>>2){4'h9}},{(DATA_WIDTH>>2){4'h8}},{(DATA_WIDTH>>2){4'h7}},{(DATA_WIDTH>>2){4'h6}},{(DATA_WIDTH>>2){4'h5}},{(DATA_WIDTH>>2){4'h4}},{(DATA_WIDTH>>2){4'h3}},{(DATA_WIDTH>>2){4'h2}},{(DATA_WIDTH>>2){4'h1}},{(DATA_WIDTH>>2){4'h0}}};
        i_en = 1'b1;
        i_cmd =  {4'b1111,4'b0111,4'b1110,4'b0110,4'b1101,4'b0101,4'b1100,4'b0100,4'b1011,4'b0011,4'b1010,4'b0010,4'b1001,4'b0001,4'b1000,4'b000};
        
        // invalid high output -- Pass Through
        #40
        i_valid = {(NUM_INPUT_DATA>>1){2'b10}};
        i_data_bus = {{(DATA_WIDTH>>2){4'h7}},{(DATA_WIDTH>>2){4'h6}},{(DATA_WIDTH>>2){4'h5}},{(DATA_WIDTH>>2){4'h4}},{(DATA_WIDTH>>2){4'h3}},{(DATA_WIDTH>>2){4'h2}},{(DATA_WIDTH>>2){4'h1}},{(DATA_WIDTH>>2){4'h0}},{(DATA_WIDTH>>2){4'hf}},{(DATA_WIDTH>>2){4'he}},{(DATA_WIDTH>>2){4'hd}},{(DATA_WIDTH>>2){4'hc}},{(DATA_WIDTH>>2){4'hb}},{(DATA_WIDTH>>2){4'ha}},{(DATA_WIDTH>>2){4'h9}},{(DATA_WIDTH>>2){4'h8}}};
        i_en = 1'b1;
        i_cmd =  {4'b1111,4'b0111,4'b1110,4'b0110,4'b1101,4'b0101,4'b1100,4'b0100,4'b1011,4'b0011,4'b1010,4'b0010,4'b1001,4'b0001,4'b1000,4'b000};
       
        // invalid low output  -- Pass Through
        #40
        i_valid = {(NUM_INPUT_DATA>>1){2'b01}};
        i_data_bus = {{(DATA_WIDTH>>2){4'h7}},{(DATA_WIDTH>>2){4'h6}},{(DATA_WIDTH>>2){4'h5}},{(DATA_WIDTH>>2){4'h4}},{(DATA_WIDTH>>2){4'h3}},{(DATA_WIDTH>>2){4'h2}},{(DATA_WIDTH>>2){4'h1}},{(DATA_WIDTH>>2){4'h0}},{(DATA_WIDTH>>2){4'hf}},{(DATA_WIDTH>>2){4'he}},{(DATA_WIDTH>>2){4'hd}},{(DATA_WIDTH>>2){4'hc}},{(DATA_WIDTH>>2){4'hb}},{(DATA_WIDTH>>2){4'ha}},{(DATA_WIDTH>>2){4'h9}},{(DATA_WIDTH>>2){4'h8}}};
        i_en = 1'b1;
        i_cmd = {4'b1111,4'b0111,4'b1110,4'b0110,4'b1101,4'b0101,4'b1100,4'b0100,4'b1011,4'b0011,4'b1010,4'b0010,4'b1001,4'b0001,4'b1000,4'b000};
        #40
        $stop;
    end

    // instantiate DUT (device under test)
    unfoldedbutterfly_merge_seq #(
		.DATA_WIDTH(DATA_WIDTH),
        .NUM_INPUT_DATA(NUM_INPUT_DATA)
      ) dut(
        .clk(clk),
        .rst(rst),
		.i_valid(i_valid),
		.i_data_bus(i_data_bus),
		.o_valid(o_valid),
		.o_data_bus(o_data_bus),
		.i_en(i_en),
		.i_cmd(i_cmd)
	);

    always#5 clk=~clk;

endmodule
`endif 



`ifdef TEST_8_unfoldedbutterfly_merge
module tb_unfoldedbutterfly_merge_seq();
    parameter DATA_WIDTH = 4;
    parameter NUM_INPUT_DATA = 8;
    parameter NUM_OUTPUT_DATA = 4;
    parameter NUM_STAGE = $clog2(NUM_OUTPUT_DATA); // note: # of stage in distribute noc depends on num_output_data instead of input.
    parameter DESTINATION_TAG_WIDTH = 2;     // destination tag, each level consumes 1 bit.
    parameter IN_COMMAND_WIDTH = DESTINATION_TAG_WIDTH*NUM_STAGE*NUM_INPUT_DATA; // total width of input command.
	
    // parameter
	localparam  WIDTH_INPUT_DATA = DATA_WIDTH * NUM_INPUT_DATA;
	localparam  WIDTH_OUTPUT_DATA = DATA_WIDTH * NUM_OUTPUT_DATA;

	// interface
	reg                                                        clk;
	reg                                                        rst;

	reg    [NUM_INPUT_DATA-1:0]                                i_valid;             
	reg    [WIDTH_INPUT_DATA-1:0]                              i_data_bus;
	
	wire   [NUM_OUTPUT_DATA-1:0]                               o_valid;             
	wire   [WIDTH_OUTPUT_DATA-1:0]                             o_data_bus; //{o_data_a, o_data_b}

	reg                                                        i_en;
	reg    [IN_COMMAND_WIDTH-1:0]                              i_cmd;

    // Note: method to expand each bit of destination tag into 2 bit for supporting multicasting.
    // 1'b1 -> 2'b10
    // 1'b0 -> 2'b01
    // 1'bx -> 2'b11 (multicast)
    // 1'bz -> 2'b00 (invalid)

    // Therefore
    // destination tag mappings are following:
    // 2'b00 -> {2'b01, 2'b01}
    // 2'b01 -> {2'b01, 2'b10}
    // 2'b10 -> {2'b10, 2'b01}
    // 2'b11 -> {2'b10, 2'b10}
    // 2'bx1 -> {2'b11, 2'b10}
    // 2'b1x -> {2'b10, 2'b11}
    // 2'bx0 -> {2'b11, 2'b00}
    // 2'b0x -> {2'b00, 2'b11}
    // 2'bzz -> {2'b00, 2'b00}
    // 2'bz1 -> {2'b00, 2'b10}
    // 2'b1z -> {2'b10, 2'b00}
    // 2'bz0 -> {2'b00, 2'b01}
    // 2'b0z -> {2'b01, 2'b00}

    // Test case declaration
    // all cases for control
    initial
    begin
        clk = 1'b0;
        // not enable at start
        #40
        rst = 1'b1;
        i_valid = {1'b1,1'b1,1'b0,1'b0,1'b1,1'b0,1'b1,1'b0};
        i_data_bus = {{(DATA_WIDTH>>2){4'h7}},{(DATA_WIDTH>>2){4'h6}},{(DATA_WIDTH>>2){4'h5}},{(DATA_WIDTH>>2){4'h4}},{(DATA_WIDTH>>2){4'h3}},{(DATA_WIDTH>>2){4'h2}},{(DATA_WIDTH>>2){4'h1}},{(DATA_WIDTH>>2){4'h0}}};
        i_en = 1'b0;
        // i_cmd = {2'b00,2'b10,2'bzz,2'bzz,2'b11,2'bzz,2'b01,2'bzz};
        i_cmd = {{2'b01, 2'b01}, {2'b10, 2'b01}, {2'b00, 2'b00}, {2'b00, 2'b00},{2'b10, 2'b10},{2'b00, 2'b00},{2'b01, 2'b10},{2'b00, 2'b00}};

        //  reset 
        #40
        rst = 1'b1;
        i_valid = {1'b1,1'b1,1'b0,1'b0,1'b1,1'b0,1'b1,1'b0};
        i_data_bus = {{(DATA_WIDTH>>2){4'h7}},{(DATA_WIDTH>>2){4'h6}},{(DATA_WIDTH>>2){4'h5}},{(DATA_WIDTH>>2){4'h4}},{(DATA_WIDTH>>2){4'h3}},{(DATA_WIDTH>>2){4'h2}},{(DATA_WIDTH>>2){4'h1}},{(DATA_WIDTH>>2){4'h0}}};
        i_en = 1'b1;
        i_cmd = {{2'b01, 2'b01}, {2'b10, 2'b01}, {2'b00, 2'b00}, {2'b00, 2'b00},{2'b10, 2'b10},{2'b00, 2'b00},{2'b01, 2'b10},{2'b00, 2'b00}};
               
        // reg active -- Test case 1 -- pass 4 data out
        #40
        rst = 1'b0;
        i_valid = {1'b1,1'b1,1'b0,1'b0,1'b1,1'b0,1'b1,1'b0};
        i_data_bus = {{(DATA_WIDTH>>2){4'h7}},{(DATA_WIDTH>>2){4'h6}},{(DATA_WIDTH>>2){4'h5}},{(DATA_WIDTH>>2){4'h4}},{(DATA_WIDTH>>2){4'h3}},{(DATA_WIDTH>>2){4'h2}},{(DATA_WIDTH>>2){4'h1}},{(DATA_WIDTH>>2){4'h0}}};
        i_en = 1'b1;
        i_cmd = {{2'b01, 2'b01}, {2'b10, 2'b01}, {2'b00, 2'b00}, {2'b00, 2'b00},{2'b10, 2'b10},{2'b00, 2'b00},{2'b01, 2'b10},{2'b00, 2'b00}};
                
        // reg active -- test case 1 -- pass 4 data out -- Invalid two valid input
        #40
        i_valid = {1'b1,1'b0,1'b0,1'b0,1'b0,1'b0,1'b1,1'b0};
        i_data_bus = {{(DATA_WIDTH>>2){4'h7}},{(DATA_WIDTH>>2){4'h6}},{(DATA_WIDTH>>2){4'h5}},{(DATA_WIDTH>>2){4'h4}},{(DATA_WIDTH>>2){4'h3}},{(DATA_WIDTH>>2){4'h2}},{(DATA_WIDTH>>2){4'h1}},{(DATA_WIDTH>>2){4'h0}}};
        i_en = 1'b1;
        i_cmd = {{2'b01, 2'b01}, {2'b10, 2'b01}, {2'b00, 2'b00}, {2'b00, 2'b00},{2'b10, 2'b10},{2'b00, 2'b00},{2'b01, 2'b10},{2'b00, 2'b00}};

        // reg active -- Test case 2 -- pass 4 data out
        #40
        i_valid = {1'b0,1'b1,1'b0,1'b1,1'b0,1'b1,1'b0,1'b1};
        i_data_bus = {{(DATA_WIDTH>>2){4'h7}},{(DATA_WIDTH>>2){4'h6}},{(DATA_WIDTH>>2){4'h5}},{(DATA_WIDTH>>2){4'h4}},{(DATA_WIDTH>>2){4'h3}},{(DATA_WIDTH>>2){4'h2}},{(DATA_WIDTH>>2){4'h1}},{(DATA_WIDTH>>2){4'h0}}};
        i_en = 1'b1;
        i_cmd = {{2'b01, 2'b01}, {2'b01, 2'b01}, {2'b00, 2'b00}, {2'b10, 2'b01},{2'b00, 2'b00},{2'b10, 2'b10},{2'b00, 2'b00},{2'b00, 2'b01}};
                
        // reg active -- test case 3 -- multicast two input {1--x0,7--x1}
        #40
        i_valid = {1'b1,1'b0,1'b0,1'b0,1'b0,1'b0,1'b1,1'b0};
        i_data_bus = {{(DATA_WIDTH>>2){4'h7}},{(DATA_WIDTH>>2){4'h6}},{(DATA_WIDTH>>2){4'h5}},{(DATA_WIDTH>>2){4'h4}},{(DATA_WIDTH>>2){4'h3}},{(DATA_WIDTH>>2){4'h2}},{(DATA_WIDTH>>2){4'h1}},{(DATA_WIDTH>>2){4'h0}}};
        i_en = 1'b1;
        i_cmd = {{2'b11, 2'b10},{2'b00, 2'b00},{2'b00, 2'b00},{2'b00, 2'b00},{2'b00, 2'b00},{2'b00, 2'b00},{2'b11, 2'b00},{2'b00, 2'b00}};
                
        // reg active -- test case 4 -- multicast 1 input {2--xx}
        #40
        i_valid = {1'b0,1'b0,1'b0,1'b0,1'b0,1'b1,1'b0,1'b0};
        i_data_bus = {{(DATA_WIDTH>>2){4'h7}},{(DATA_WIDTH>>2){4'h6}},{(DATA_WIDTH>>2){4'h5}},{(DATA_WIDTH>>2){4'h4}},{(DATA_WIDTH>>2){4'h3}},{(DATA_WIDTH>>2){4'h2}},{(DATA_WIDTH>>2){4'h1}},{(DATA_WIDTH>>2){4'h0}}};
        i_en = 1'b1;
        i_cmd = {{2'b00, 2'b00},{2'b00, 2'b00},{2'b00, 2'b00},{2'b00, 2'b00},{2'b00, 2'b00},{2'b11, 2'b11},{2'b00, 2'b00},{2'b00, 2'b00}};

        // change data half way  -- Pass Through
        #40
        i_valid = {NUM_INPUT_DATA{1'b1}};
        i_data_bus = {{(DATA_WIDTH>>2){4'hf}},{(DATA_WIDTH>>2){4'he}},{(DATA_WIDTH>>2){4'hd}},{(DATA_WIDTH>>2){4'hc}},{(DATA_WIDTH>>2){4'hb}},{(DATA_WIDTH>>2){4'ha}},{(DATA_WIDTH>>2){4'h9}},{(DATA_WIDTH>>2){4'h8}}};
        i_en = 1'b1;
        i_cmd = {{2'b00, 2'b00},{2'b01, 2'b01},{2'b00, 2'b00},{2'b10, 2'b01},{2'b00, 2'b00},{2'b10, 2'b10},{2'b00, 2'b00},{2'b01, 2'b10}};
       
        #40
        $stop;
    end

    // instantiate DUT (device under test)
    unfoldedbutterfly_merge_seq #(
		.DATA_WIDTH(DATA_WIDTH),
        .NUM_INPUT_DATA(NUM_INPUT_DATA)
      ) dut(
        .clk(clk),
        .rst(rst),
		.i_valid(i_valid),
		.i_data_bus(i_data_bus),
		.o_valid(o_valid),
		.o_data_bus(o_data_bus),
		.i_en(i_en),
		.i_cmd(i_cmd)
	);

    always#5 clk=~clk;

endmodule
`endif 


