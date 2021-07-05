`timescale 1ns / 1ps
/////////////////////////////////////////////////////////////
// Top Module:  tb_distribute_2x2_simple_cmd_flow_seq
// Data:        Only data width matters.
// Format:      keeping the input format unchange
// Timing:      Sequential Logic
// Reset:       Synchronized Reset [High Reset]
// Latency:     2 cycle for Complex; 1 cycle for Simple
// Dummy Data:  {DATA_WIDTH{1'b0}}
// 
// simple version 2 bit control
//
// Unicast Function:
//                         Pass_Through                                  Pass_Swtich                         
//            
//       i_data_bus(high)          i_data_bus(low)      i_data_bus(high)          i_data_bus(low)                  
//    [DATA_WIDTH+:DATA_WIDTH]    [DATA_WIDTH-1:0]    [DATA_WIDTH+:DATA_WIDTH]    [DATA_WIDTH-1:0]         
//                           \     /                                       \     /                                                                                                
//                            v   v                                         v   v                                                            
//                            |¯¯¯| <--i_valid=2'b11                        |¯¯¯| <--i_valid=2'b11               
//                            |___| <--i_cmd=2'b10 (MS 2 bits)              |___| <--i_cmd=2'b01 (MS 2 bits)               
//                           /     \                                       /     \                              
//                          v       v                                     v       v                             
//                  o_data_high   o_data_low                      o_data_low     o_data_high        
//
//
// Multicast Function:   Multicast_HighIn                              Multicast_LowIn                                     No Pass   
//                 
//       i_data_bus(high)          i_data_bus(low)      i_data_bus(high)          i_data_bus(low)      i_data_bus(high)          i_data_bus(low)              
//    [DATA_WIDTH+:DATA_WIDTH]    [DATA_WIDTH-1:0]    [DATA_WIDTH+:DATA_WIDTH]    [DATA_WIDTH-1:0]   [DATA_WIDTH+:DATA_WIDTH]    [DATA_WIDTH-1:0]      
//                           \     /                                       \     /                                         \     /                                                                  
//                            v   v                                         v   v                                           v   v                             
//                            |¯¯¯| <--i_valid=2'b1x                        |¯¯¯| <--i_valid=2'bx1                          |¯¯¯| <--i_valid=2'b00
//                            |___| <--i_cmd=2'b11 (MS 2 bits)              |___| <--i_cmd=2'b00  (MS 2 bits)               |___| <--i_cmd=2'bxx  (MS 2 bits)
//                           /     \                                       /     \                                         /     \
//                          v       v                                     v       v                                       v       v
//                  o_data_high   o_data_high                      o_data_low    o_data_low                            Invalid  Invalid    
//
// 
//   The i_cmd other than most significant bits -> forward to the following modules.
// 
// 
// Author:      Jianming Tong (jianming.tong@gatech.edu)
/////////////////////////////////////////////////////////////

/*
	parameter illustration:
	1. COMMAND_WIDTH means the length of command for a single switch, so each switch need COMMAND_WIDTH because of two inputs.
	2. IN_COMMAND_WIDTH means total length of command fed into the design. It is used to calculate the length of the output command.
	3. DATA_WIDTH means the length of a single data, arbitrary number is supported in the design. 
*/

module tb_distribute_2x2_simple_cmd_flow_seq();

	parameter DATA_WIDTH = 32;
	parameter COMMAND_WIDTH = 2;
	parameter IN_COMMAND_WIDTH = 10;
	parameter OUT_COMMAND_WIDTH = IN_COMMAND_WIDTH - COMMAND_WIDTH;

    // timing signals
    reg                               clk;
    reg                               rst;
   
    // data signals   
	reg    [1:0]                      i_valid;        // valid input data signal
	reg    [2*DATA_WIDTH-1:0]         i_data_bus;     // input data bus coming into mux
	   
	wire   [1:0]                      o_valid;        // output valid
    wire   [2*DATA_WIDTH-1:0]         o_data_bus;     // output data 
   
	// control signals   
	reg                               i_en;           // mux enable
	reg    [IN_COMMAND_WIDTH-1:0]     i_cmd;          // command 
                                       // 10 --> Multicast_HighIn
                                       // 01 --> Multicast_LowIn
                                       // 11 --> Pass Through
                                       // 00 --> Pass Switch

    wire   [OUT_COMMAND_WIDTH-1:0]    o_cmd;

    // Test case declaration
    // all cases for control
    initial 
    begin
        clk = 1'b0;
        // not enable at start
        #10
        rst = 1'b1;
        i_valid = 2'b00;
        i_data_bus = {{(DATA_WIDTH>>2){4'hA}},{(DATA_WIDTH>>2){4'hf}}};
        i_en = 1'b1;
        i_cmd = {2'b00, {(OUT_COMMAND_WIDTH){1'b0}}};
        
        // rst active;
        #10
        rst = 1'b1;
        i_valid = 2'b11;
        i_data_bus = {{(DATA_WIDTH>>2){4'hA}},{(DATA_WIDTH>>2){4'hf}}};
        i_en = 1'b1;
        i_cmd = {2'b00, {(OUT_COMMAND_WIDTH){1'b0}}};
        
        // input active -- Multicast_HighIn
        #10
        rst = 1'b0;
        i_valid = 2'b10;
        i_data_bus = {{(DATA_WIDTH>>2){4'hA}},{(DATA_WIDTH>>2){4'hf}}};
        i_en = 1'b1;
        i_cmd = {2'b11, {(OUT_COMMAND_WIDTH){1'b0}}};
    
        // input active -- Multicast_LowIn
        #10
        rst = 1'b0;
        i_valid = 2'b01;
        i_data_bus = {{(DATA_WIDTH>>2){4'hA}},{(DATA_WIDTH>>2){4'hf}}};
        i_en = 1'b1;
        i_cmd = {2'b00, {(OUT_COMMAND_WIDTH){1'b0}}};
        
        // input active -- Pass Through
        #10
        rst = 1'b0;
        i_valid = 2'b11;
        i_data_bus = {{(DATA_WIDTH>>2){4'hA}},{(DATA_WIDTH>>2){4'hf}}};
        i_en = 1'b1;
        i_cmd = {2'b10, {(OUT_COMMAND_WIDTH){1'b0}}};
        
        // input active -- Pass Switch 
        #10
        rst = 1'b0;
        i_valid = 2'b11;
        i_data_bus = {{(DATA_WIDTH>>2){4'hA}},{(DATA_WIDTH>>2){4'hf}}};
        i_en = 1'b1;
        i_cmd = {2'b01, {(OUT_COMMAND_WIDTH){1'b0}}};
        
        // disable in progress
        #10
        rst = 1'b0;
        i_valid = 2'b11;
        i_data_bus = {{(DATA_WIDTH>>2){4'hA}},{(DATA_WIDTH>>2){4'hf}}};
        i_en = 1'b0;
        i_cmd = {2'b00, {(OUT_COMMAND_WIDTH){1'b0}}};
        
        // enable in progress -- Pass Through
        #10
        rst = 1'b0;
        i_valid = 2'b11;
        i_data_bus = {{(DATA_WIDTH>>2){4'hA}},{(DATA_WIDTH>>2){4'hf}}};
        i_en = 1'b1;
        i_cmd = {2'b10, {(OUT_COMMAND_WIDTH){1'b0}}};
         
        // reset half way  -- Pass Swtich
        #10
        rst = 1'b1;
        i_valid = 2'b11;
        i_data_bus = {{(DATA_WIDTH>>2){4'hA}},{(DATA_WIDTH>>2){4'hf}}};
        i_en = 1'b1;
        i_cmd = {2'b01, {(OUT_COMMAND_WIDTH){1'b0}}};
                
        // input active -- No Pass
        #10
        rst = 1'b0;
        i_valid = 2'b00;
        i_data_bus = {{(DATA_WIDTH>>2){4'hA}},{(DATA_WIDTH>>2){4'hf}}};
        i_en = 1'b1;
        i_cmd = {2'b01, {(OUT_COMMAND_WIDTH){1'b0}}};

        // change data half way  -- Pass Through
        #10
        rst = 1'b0;
        i_valid = 2'b11;
        i_data_bus = {{(DATA_WIDTH>>2){4'hb}},{(DATA_WIDTH>>2){4'hc}}};
        i_en = 1'b1;
        i_cmd = {2'b10, {(OUT_COMMAND_WIDTH){1'b0}}};
        
        // invalid high output -- Pass Through
        #10
        rst = 1'b0;
        i_valid = 2'b01;
        i_data_bus = {{(DATA_WIDTH>>2){4'hb}},{(DATA_WIDTH>>2){4'hc}}};
        i_en = 1'b1;
        i_cmd = {2'b10, {(OUT_COMMAND_WIDTH){1'b0}}};
       
        // invalid low output  -- Pass Through
        #10
        rst = 1'b0;
        i_valid = 2'b10;
        i_data_bus = {{(DATA_WIDTH>>2){4'hb}},{(DATA_WIDTH>>2){4'hc}}};
        i_en = 1'b1;
        i_cmd = {2'b10, {(OUT_COMMAND_WIDTH){1'b0}}};
        #10
        $stop;
    end

    // instantiate DUT (device under test)
    distribute_2x2_simple_cmd_flow_seq #(
		.DATA_WIDTH(DATA_WIDTH),
        .COMMAND_WIDTH(COMMAND_WIDTH),
        .IN_COMMAND_WIDTH(IN_COMMAND_WIDTH)
      ) dut(
	    .clk(clk),
	    .rst(rst),
		.i_valid(i_valid),
		.i_data_bus(i_data_bus),
		.o_valid(o_valid),
		.o_data_bus(o_data_bus),
		.i_en(i_en),
		.i_cmd(i_cmd),
        .o_cmd(o_cmd)
	);

    always#5 clk=~clk;

endmodule
