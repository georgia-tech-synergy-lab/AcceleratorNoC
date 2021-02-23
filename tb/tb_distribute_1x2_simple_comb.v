`timescale 1ns / 1ps
/////////////////////////////////////////////////////////////
// Top Module:  tb_distribute_1x2_simple_comb
// Data:        Only data width matters.
// Format:      keeping the input format unchange
// Timing:      Combinational Logic
// Dummy Data:  {DATA_WIDTH{1'b0}}
// 
// Function:     Duplicate               Branch_high               Branch_low
//                
//               i_data_bus               i_data_bus               i_data_bus
//                   |                        |                        |
//                   v                        v                        v        
//                 |¯¯¯| <--i_valid=2'b11   |¯¯¯| <--i_valid=2'b1x   |¯¯¯| <--i_valid=2'bx1 
//                 |___| <--i_cmd=2'b11     |___| <--i_cmd=2'b10     |___| <--i_cmd=2'b01    
//                /     \                  /                              \
//       o_data_high  o_data_low       o_data_high                     o_data_low
//
//       o_data_high = o_data_bus[2*DATA_WIDTH-1: DATA_WIDTH]
//       o_data_low  = o_data_bus[DATA_WIDTH-1: 0]
//       i_valid = 2'b1?; where ? indicates that we don't care about this bit
//
// Author:      Jianming Tong (jianming.tong@gatech.edu)
/////////////////////////////////////////////////////////////

module tb_distribute_1x2_simple_comb();

	parameter DATA_WIDTH  = 32;
	parameter COMMMAND_WIDTH  = 2;

    // timing signals
    reg                            clk;

    // data signals
	reg                            i_valid;        // valid input data signal
	reg    [DATA_WIDTH-1:0]        i_data_bus;     // input data bus coming into mux
	
	wire   [1:0]                   o_valid;        // output valid
    wire   [2*DATA_WIDTH-1:0]      o_data_bus;     // output data 

	// control signals
	reg                            i_en;           // mux enable
	reg    [COMMMAND_WIDTH-1:0]    i_cmd;          // command 
                                    // 00 --> NA
                                    // 01 --> Branch_low
                                    // 10 --> Branch_high
                                    // 11 --> Duplicate
    
    // Test case declaration
    // all cases for control
    initial 
    begin
        clk = 1'b0;
        // not enable at start
        i_valid = 1'b0;
        i_data_bus = {(DATA_WIDTH>>2){4'hA}};
        i_en = 1'b1;
        i_cmd = 2'b00;
        
        // rst active;
        #20
        i_valid = 1'b1;
        i_data_bus = {(DATA_WIDTH>>2){4'hA}};
        i_en = 1'b1;
        i_cmd = 2'b00;
        
        // input active -- branch_low
        #20
        i_valid = 1'b1;
        i_data_bus = {(DATA_WIDTH>>2){4'hA}};
        i_en = 1'b1;
        i_cmd = 2'b01;
    
        // input active -- branch_high
        #20
        i_valid = 1'b1;
        i_data_bus = {(DATA_WIDTH>>2){4'hA}};
        i_en = 1'b1;
        i_cmd = 2'b10;
        
        // input active -- duplicate
        #20
        i_valid = 1'b1;
        i_data_bus = {(DATA_WIDTH>>2){4'hA}};
        i_en = 1'b1;
        i_cmd = 2'b11;
        
        // disable in progress
        #20
        i_valid = 1'b1;
        i_data_bus = {(DATA_WIDTH>>2){4'hA}};
        i_en = 1'b0;
        i_cmd = 2'b11;
         
        
        // enable in progress
        #20
        i_valid = 1'b1;
        i_data_bus = {(DATA_WIDTH>>2){4'hA}};
        i_en = 1'b1;
        i_cmd = 2'b11;
        
        // change data half way
        #20
        i_valid = 1'b1;
        i_data_bus = {(DATA_WIDTH>>2){4'hB}};
        i_en = 1'b1;
        i_cmd = 2'b11;
        
        // invalid high output 
        #20
        i_valid = 1'b1;
        i_data_bus = {(DATA_WIDTH>>2){4'hB}};
        i_en = 1'b1;
        i_cmd = 2'b01;
       
        // invalid low output 
        #20
        i_valid = 1'b1;
        i_data_bus = {(DATA_WIDTH>>2){4'hB}};
        i_en = 1'b1;
        i_cmd = 2'b10;
        $stop;
end


    // instantiate DUT (device under test)
    distribute_1x2_simple_comb #(
		.DATA_WIDTH(DATA_WIDTH),
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

