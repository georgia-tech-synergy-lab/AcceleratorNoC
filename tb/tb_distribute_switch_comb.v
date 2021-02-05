`timescale 1ns / 1ps
/////////////////////////////////////////////////////////////
// Top Module:  distribute_switch_seq
// Data:        Only data width matters.
// Format:      keeping the input format unchange
// Timing:      Sequential Logic
// Reset:       Synchronized Reset [High Reset]
// Dummy Data:  {DATA_WIDTH{1'b0}}
// 
// Function:     Duplicate           Branch_high      Branch_low
//                
//               i_data_bus          i_data_bus        i_data_bus
//                   |                   |                 |
//                   v                   v                 v        
//                 |¯¯¯|               |¯¯¯|             |¯¯¯| 
//                 |___|               |___|             |___|     
//                /     \             /                       \
//       o_data_high  o_data_low  o_data_high               o_data_low
//
//       o_data_high = o_data_bus[2*DATA_WIDTH-1: DATA_WIDTH]
//       o_data_low  = o_data_bus[DATA_WIDTH-1: 0]
//
// Author:      Jianming Tong (jianming.tong@gatech.edu)
/////////////////////////////////////////////////////////////

module tb_distribute_switch_comb();

	parameter DATA_WIDTH  = 32;

    // timing signals
    reg                            clk;

    // data signals
	reg    [1:0]                   i_valid;        // valid input data signal
	reg    [DATA_WIDTH-1:0]        i_data_bus;     // input data bus coming into mux
	
	wire                           o_valid;        // output valid
    wire   [2*DATA_WIDTH-1:0]      o_data_bus;     // output data 

	// control signals
	reg                            i_en;           // mux enable
	reg    [1:0]                   i_cmd;          // command 
                                // 0 --> Branch_left
                                // 1 --> Branch_right
    
    // Test case declaration
    // all cases for control
    initial 
    begin
        clk = 1'b0;
        // not enable at start
        #20
        i_valid = 2'b00;
        i_data_bus = {(DATA_WIDTH>>2){4'hA}};
        i_en = 1'b1;
        i_cmd = 2'b00;
        
        // rst active;
        #20
        i_valid = 2'b11;
        i_data_bus = {(DATA_WIDTH>>2){4'hA}};
        i_en = 1'b1;
        i_cmd = 2'b00;
        
        // input active -- branch_low
        #20
        i_valid = 2'b11;
        i_data_bus = {(DATA_WIDTH>>2){4'hA}};
        i_en = 1'b1;
        i_cmd = 2'b01;
    
        // input active -- branch_high
        #20
        i_valid = 2'b11;
        i_data_bus = {(DATA_WIDTH>>2){4'hA}};
        i_en = 1'b1;
        i_cmd = 2'b10;
        
        // input active -- duplicate
        #20
        i_valid = 2'b11;
        i_data_bus = {(DATA_WIDTH>>2){4'hA}};
        i_en = 1'b1;
        i_cmd = 2'b11;
        
        // disable in progress
        #20
        i_valid = 2'b11;
        i_data_bus = {(DATA_WIDTH>>2){4'hA}};
        i_en = 1'b0;
        i_cmd = 2'b11;
         
        
        // enable in progress
        #20
        i_valid = 2'b11;
        i_data_bus = {(DATA_WIDTH>>2){4'hA}};
        i_en = 1'b1;
        i_cmd = 2'b11;
        
        // reset half way
        #20
        i_valid = 2'b11;
        i_data_bus = {(DATA_WIDTH>>2){4'hA}};
        i_en = 1'b1;
        i_cmd = 2'b11;
        
        // change data half way
        #20
        i_valid = 2'b11;
        i_data_bus = {(DATA_WIDTH>>2){4'hB}};
        i_en = 1'b1;
        i_cmd = 2'b11;
        
        // invalid high output 
        #20
        i_valid = 2'b11;
        i_data_bus = {(DATA_WIDTH>>2){4'hB}};
        i_en = 1'b1;
        i_cmd = 2'b01;
       
        // invalid low output 
        #20
        i_valid = 2'b11;
        i_data_bus = {(DATA_WIDTH>>2){4'hB}};
        i_en = 1'b1;
        i_cmd = 2'b10;
end


    // instantiate DUT (device under test)
    distribute_switch_comb #(
		.DATA_WIDTH(DATA_WIDTH)
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

