`timescale 1ns / 1ps
/////////////////////////////////////////////////////////////
// Top Module:  merge_switch_seq
// Data:        Only data width matters.
// Format:      keeping the input format unchange
// Timing:      Sequential Logic
// Reset:       Synchronized Reset [High Reset]
// Dummy Data:  {DATA_WIDTH{1'b0}}
// 
//       i_data_bus(high)          i_data_bus(low)
//    [DATA_WIDTH+:DATA_WIDTH]    [DATA_WIDTH-1:0]  
//                           \     /     
//                            v   v      
//                           |¯¯¯¯¯|       
//                           |_____| <--- arbitor(last served)    
//                              |        
//                              v    
//                          o_data_bus
//
//       o_data_high = o_data_bus[2*DATA_WIDTH-1: DATA_WIDTH]
//       o_data_low  = o_data_bus[DATA_WIDTH-1: 0]
//
// Author:      Jianming Tong (jianming.tong@gatech.edu)
/////////////////////////////////////////////////////////////


module tb_merge_2x1_seq();

	parameter DATA_WIDTH  = 32;
	parameter COMMMAND_WIDTH  = 2;

    // timing signals
    reg                            clk;
    reg                            rst;

    // data signals
	reg    [1:0]                   i_valid;        // valid input data signal
	reg    [2*DATA_WIDTH-1:0]      i_data_bus;     // input data bus coming into mux
	
	wire                           o_valid;        // output valid
    wire   [DATA_WIDTH-1:0]        o_data_bus;     // output data 

	// control signals
	reg                            i_en;           // mux enable
	reg    [COMMMAND_WIDTH-1:0]    i_cmd;          // i_cmd here is of no use in this module, leave it here for keeping the consistency of the interface.
    
    // Test case declaration
    // all cases for control
    initial 
    begin
        clk = 1'b0;
        // not enable at start
        #20
        rst = 1'b1;
        i_valid = 2'b10;
        i_data_bus = {(DATA_WIDTH>>2){4'hA}};
        i_en = 1'b0;
        i_cmd = 1'b0;
        
        // rst active;
        #20
        rst = 1'b1;
        i_valid = 2'b00;
        i_data_bus = {(DATA_WIDTH>>2){4'hA}};
        i_en = 1'b1;
        i_cmd = 1'b0;
        
        // input active -- branch_low
        #20
        rst = 1'b0;
        i_valid = 2'b01;
        i_data_bus = {(DATA_WIDTH>>2){4'hA}};
        i_en = 1'b1;
        i_cmd = 1'b0;
    
        // input active -- branch_high
        #20
        rst = 1'b0;
        i_valid = 2'b10;
        i_data_bus = {(DATA_WIDTH>>2){4'hA}};
        i_en = 1'b1;
        i_cmd = 1'b1;
        
        // disable in progress
        #20
        rst = 1'b0;
        i_valid = 2'b11;
        i_data_bus = {(DATA_WIDTH>>2){4'hA}};
        i_en = 1'b0;
        i_cmd = 1'b1;
         
        
        // enable in progress
        #20
        rst = 1'b0;
        i_valid = 2'b11;
        i_data_bus = {(DATA_WIDTH>>2){4'hA}};
        i_en = 1'b1;
        i_cmd = 1'b1;
        
        // reset half way
        #20
        rst = 1'b1;
        i_valid = 2'b11;
        i_data_bus = {(DATA_WIDTH>>2){4'hA}};
        i_en = 1'b1;
        i_cmd = 1'b1;
        
        // change data half way
        #20
        rst = 1'b0;
        i_valid = 2'b11;
        i_data_bus = {(DATA_WIDTH>>2){4'hB}};
        i_en = 1'b1;
        i_cmd = 1'b0;
        
        // invalid high input 
        #20
        rst = 1'b0;
        i_valid = 2'b01;
        i_data_bus = {(DATA_WIDTH>>2){4'hB}};
        i_en = 1'b1;
        i_cmd = 1'b1;
       
        // invalid low input 
        #20
        rst = 1'b0;
        i_valid = 2'b10;
        i_data_bus = {(DATA_WIDTH>>2){4'hB}};
        i_en = 1'b1;
        i_cmd = 1'b0;
end


    // instantiate DUT (device under test)
    merge_2x1_seq #(
		.DATA_WIDTH(DATA_WIDTH),
        .COMMMAND_WIDTH(COMMMAND_WIDTH)
	) dut(
	    .clk(clk),
	    .rst(rst),
		.i_valid(i_valid),
		.i_data_bus(i_data_bus),
		.o_valid(o_valid),
		.o_data_bus(o_data_bus),
		.i_en(i_en),
		.i_cmd(i_cmd)  //i_cmd here is of no use, just make the interface general enough.
	);

    always#5 clk=~clk;

endmodule

