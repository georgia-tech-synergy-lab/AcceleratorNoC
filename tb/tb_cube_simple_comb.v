`timescale 1ns / 1ps
/////////////////////////////////////////////////////////////
// Top Module:  tb_cube_simple_comb
// Data:        Only data width matters.
// Format:      keeping the input format unchange
// Timing:      Combinational Logic
// Dummy Data:  {DATA_WIDTH{1'b0}}
// 
// Function:    Unicast  or  Multicast(Not arbitrary Multicast)
//                                              
//     i_data_bus[0*DATA_WIDTH+:DATA_WIDTH]  -->|¯¯¯|-\     /->|¯¯¯|-\  /->|¯¯¯|-->
//     i_data_bus[1*DATA_WIDTH+:DATA_WIDTH]  -->|___|-\\   //->|___|-\\//->|___|-->
//                                                     \\ //          XX                                  
//     i_data_bus[2*DATA_WIDTH+:DATA_WIDTH]  -->|¯¯¯|-\ \X/ /->|¯¯¯|-//\\->|¯¯¯|-->
//     i_data_bus[3*DATA_WIDTH+:DATA_WIDTH]  -->|___|-\\/X\//->|___|-/  \->|___|-->
//                                                     XX XX                               
//     i_data_bus[4*DATA_WIDTH+:DATA_WIDTH]  -->|¯¯¯|-//\X/\\->|¯¯¯|-\  /->|¯¯¯|-->
//     i_data_bus[5*DATA_WIDTH+:DATA_WIDTH]  -->|___|-/ /X\ \->|___|-\\//->|___|-->
//                                                     // \\          XX              
//     i_data_bus[6*DATA_WIDTH+:DATA_WIDTH]  -->|¯¯¯|-//   \\->|¯¯¯|-//\\->|¯¯¯|-->
//     i_data_bus[7*DATA_WIDTH+:DATA_WIDTH]  -->|___|-/     \->|___|-/  \->|___|-->
//                                                        
//              
//        CONNECTION FUNCTION                          CUBE          CUBE  
//       CONNECTION GROUP SIZE                          8             4 
//
// Control Signal
//     i_valid[0]-->|¯¯¯|<--i_cmd[2:0] 
//     i_valid[1]-->|___|
//     
// Author:      Jianming Tong (jianming.tong@gatech.edu)
/////////////////////////////////////////////////////////////

// Note: use the UNICAST_ONLY_MODULAR version distribute_2x2_simple_seq.
// Need to set "`define UNICAST_ONLY_MODULAR in distribute_2x2_simple_seq.v"

// `define TEST_4_cube
`define TEST_8_cube

`ifdef TEST_8_cube
module tb_cube_simple_comb();
    parameter DATA_WIDTH = 4;
	parameter COMMMAND_WIDTH  = 1;
    parameter NUM_INPUT_DATA = 8;

	//parameter
	localparam NUM_SWITCH_IN = NUM_INPUT_DATA >> 1;
	localparam LEVEL = $clog2(NUM_SWITCH_IN);
	localparam TOTAL_STAGE = 2*LEVEL+1;

	localparam TOTAL_COMMMAND = TOTAL_STAGE*NUM_SWITCH_IN*COMMMAND_WIDTH;
	
	localparam WIDTH_INPUT_DATA = NUM_INPUT_DATA*DATA_WIDTH;

	// interface
	reg                                        clk;
	
	reg  [NUM_INPUT_DATA-1:0]                  i_valid;             
	reg  [WIDTH_INPUT_DATA-1:0]                i_data_bus;
	
    wire [NUM_INPUT_DATA-1:0]                  o_valid;             
	wire [WIDTH_INPUT_DATA-1:0]                o_data_bus; //{o_data_a, o_data_b}
  
	reg                                        i_en;
	reg  [TOTAL_COMMMAND-1:0]                  i_cmd;
									// 0 --> Pass Through
									// 1 --> Pass Switch

// Test case declaration
    // all cases for control
    initial
    begin
        clk = 1'b0;
        // not enable at start
        #40
        i_valid = {NUM_INPUT_DATA{1'b1}};
        i_data_bus = {{(DATA_WIDTH>>2){4'h7}},{(DATA_WIDTH>>2){4'h6}},{(DATA_WIDTH>>2){4'h5}},{(DATA_WIDTH>>2){4'h4}},{(DATA_WIDTH>>2){4'h3}},{(DATA_WIDTH>>2){4'h2}},{(DATA_WIDTH>>2){4'h1}},{(DATA_WIDTH>>2){4'h0}}};
        i_en = 1'b0;
        i_cmd = {(TOTAL_COMMMAND){1'b1}};
        

        // reg active -- Pass Through
        #40
        i_valid = {NUM_INPUT_DATA{1'b1}};
        i_data_bus = {{(DATA_WIDTH>>2){4'h7}},{(DATA_WIDTH>>2){4'h6}},{(DATA_WIDTH>>2){4'h5}},{(DATA_WIDTH>>2){4'h4}},{(DATA_WIDTH>>2){4'h3}},{(DATA_WIDTH>>2){4'h2}},{(DATA_WIDTH>>2){4'h1}},{(DATA_WIDTH>>2){4'h0}}};
        i_en = 1'b1;
        i_cmd = {(TOTAL_COMMMAND){1'b0}};
    
        // reg active -- Pass Switch
        #40
        i_valid = {NUM_INPUT_DATA{1'b1}};
        i_data_bus = {{(DATA_WIDTH>>2){4'h7}},{(DATA_WIDTH>>2){4'h6}},{(DATA_WIDTH>>2){4'h5}},{(DATA_WIDTH>>2){4'h4}},{(DATA_WIDTH>>2){4'h3}},{(DATA_WIDTH>>2){4'h2}},{(DATA_WIDTH>>2){4'h1}},{(DATA_WIDTH>>2){4'h0}}};
        i_en = 1'b1;
        i_cmd = {(TOTAL_COMMMAND){1'b1}};
                
        // reg active -- No Pass
        #40
        i_valid = {NUM_INPUT_DATA{1'b0}};
        i_data_bus = {{(DATA_WIDTH>>2){4'h7}},{(DATA_WIDTH>>2){4'h6}},{(DATA_WIDTH>>2){4'h5}},{(DATA_WIDTH>>2){4'h4}},{(DATA_WIDTH>>2){4'h3}},{(DATA_WIDTH>>2){4'h2}},{(DATA_WIDTH>>2){4'h1}},{(DATA_WIDTH>>2){4'h0}}};
        i_en = 1'b1;
        i_cmd = {(TOTAL_COMMMAND){1'b1}};

        // change data half way  -- Pass Through
        #40
        i_valid = {NUM_INPUT_DATA{1'b1}};
        i_data_bus = {{(DATA_WIDTH>>2){4'hb}},{(DATA_WIDTH>>2){4'ha}},{(DATA_WIDTH>>2){4'h9}},{(DATA_WIDTH>>2){4'h8}}};
        i_en = 1'b1;
        i_cmd = {(TOTAL_COMMMAND){1'b0}};
        
        // invalid high output -- Pass Through
        #40
        i_valid = {(NUM_INPUT_DATA>>1){2'b10}};
        i_data_bus = {{(DATA_WIDTH>>2){4'hb}},{(DATA_WIDTH>>2){4'ha}},{(DATA_WIDTH>>2){4'h9}},{(DATA_WIDTH>>2){4'h8}}};
        i_en = 1'b1;
        i_cmd = {(TOTAL_COMMMAND){1'b0}};
       
        // invalid low output  -- Pass Through
        #40
        i_valid = {(NUM_INPUT_DATA>>1){2'b01}};
        i_data_bus = {{(DATA_WIDTH>>2){4'hb}},{(DATA_WIDTH>>2){4'ha}},{(DATA_WIDTH>>2){4'h9}},{(DATA_WIDTH>>2){4'h8}}};
        i_en = 1'b1;
        i_cmd = {(TOTAL_COMMMAND){1'b0}};
        #40
        $stop;
    end

    // instantiate DUT (device under test)
    cube_simple_comb #(
		.DATA_WIDTH(DATA_WIDTH),
        .NUM_INPUT_DATA(NUM_INPUT_DATA),
        .COMMMAND_WIDTH(COMMMAND_WIDTH)
      ) dut(
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




`ifdef TEST_4_cube
module tb_cube_simple_comb();
    parameter DATA_WIDTH = 4;
	parameter COMMMAND_WIDTH  = 1;
    parameter NUM_INPUT_DATA = 4;

	//parameter
	localparam NUM_SWITCH_IN = NUM_INPUT_DATA >> 1;
	localparam LEVEL = $clog2(NUM_SWITCH_IN);
	localparam TOTAL_STAGE = 2*LEVEL+1;

	localparam TOTAL_COMMMAND = TOTAL_STAGE*NUM_SWITCH_IN*COMMMAND_WIDTH;
	
	localparam WIDTH_INPUT_DATA = NUM_INPUT_DATA*DATA_WIDTH;

	// interface
	reg                                        clk;
	
	reg  [NUM_INPUT_DATA-1:0]                  i_valid;             
	reg  [WIDTH_INPUT_DATA-1:0]                i_data_bus;
	
    wire [NUM_INPUT_DATA-1:0]                  o_valid;             
	wire [WIDTH_INPUT_DATA-1:0]                o_data_bus; //{o_data_a, o_data_b}
  
	reg                                        i_en;
	reg  [TOTAL_COMMMAND-1:0]                  i_cmd;
									// 11 --> Multicast_HighIn
									// 00 --> Multicast_LowIn
									// 10 --> Pass Through
									// 01 --> Pass Switch

    // Test case declaration
    // all cases for control
    initial
    begin
        clk = 1'b0;
        // not enable at start
        #40
        i_valid = {NUM_INPUT_DATA{1'b1}};
        i_data_bus = {{(DATA_WIDTH>>2){4'h3}},{(DATA_WIDTH>>2){4'h2}},{(DATA_WIDTH>>2){4'h1}},{(DATA_WIDTH>>2){4'h0}}};
        i_en = 1'b0;
        i_cmd = {(TOTAL_COMMMAND){1'b1}};
        

        // reg active -- Pass Through
        #40
        i_valid = {NUM_INPUT_DATA{1'b1}};
        i_data_bus = {{(DATA_WIDTH>>2){4'h3}},{(DATA_WIDTH>>2){4'h2}},{(DATA_WIDTH>>2){4'h1}},{(DATA_WIDTH>>2){4'h0}}};
        i_en = 1'b1;
        i_cmd = {(TOTAL_COMMMAND){1'b0}};
    
        // reg active -- Pass Switch
        #40
        i_valid = {NUM_INPUT_DATA{1'b1}};
        i_data_bus = {{(DATA_WIDTH>>2){4'h3}},{(DATA_WIDTH>>2){4'h2}},{(DATA_WIDTH>>2){4'h1}},{(DATA_WIDTH>>2){4'h0}}};
        i_en = 1'b1;
        i_cmd = {(TOTAL_COMMMAND){1'b1}};
                
        // reg active -- No Pass
        #40
        i_valid = {NUM_INPUT_DATA{1'b0}};
        i_data_bus = {{(DATA_WIDTH>>2){4'h3}},{(DATA_WIDTH>>2){4'h2}},{(DATA_WIDTH>>2){4'h1}},{(DATA_WIDTH>>2){4'h0}}};
        i_en = 1'b1;
        i_cmd = {(TOTAL_COMMMAND){1'b1}};

        // change data half way  -- Pass Through
        #40
        i_valid = {NUM_INPUT_DATA{1'b1}};
        i_data_bus = {{(DATA_WIDTH>>2){4'hb}},{(DATA_WIDTH>>2){4'ha}},{(DATA_WIDTH>>2){4'h9}},{(DATA_WIDTH>>2){4'h8}}};
        i_en = 1'b1;
        i_cmd = {(TOTAL_COMMMAND){1'b0}};
        
        // invalid high output -- Pass Through
        #40
        i_valid = {(NUM_INPUT_DATA>>1){2'b10}};
        i_data_bus = {{(DATA_WIDTH>>2){4'hb}},{(DATA_WIDTH>>2){4'ha}},{(DATA_WIDTH>>2){4'h9}},{(DATA_WIDTH>>2){4'h8}}};
        i_en = 1'b1;
        i_cmd = {(TOTAL_COMMMAND){1'b0}};
       
        // invalid low output  -- Pass Through
        #40
        i_valid = {(NUM_INPUT_DATA>>1){2'b01}};
        i_data_bus = {{(DATA_WIDTH>>2){4'hb}},{(DATA_WIDTH>>2){4'ha}},{(DATA_WIDTH>>2){4'h9}},{(DATA_WIDTH>>2){4'h8}}};
        i_en = 1'b1;
        i_cmd = {(TOTAL_COMMMAND){1'b0}};
        #40
        $stop;
    end

    // instantiate DUT (device under test)
    cube_simple_comb #(
		.DATA_WIDTH(DATA_WIDTH),
        .NUM_INPUT_DATA(NUM_INPUT_DATA),
        .COMMMAND_WIDTH(COMMMAND_WIDTH)
      ) dut(
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