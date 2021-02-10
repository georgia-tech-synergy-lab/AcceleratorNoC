`timescale 1ns / 1ps
/////////////////////////////////////////////////////////////
// Top Module:  mux2_1
// Data:        Only data width matters.
// Format:      keeping the input format unchange
// Timing:      Combinational Logic
// Dummy Data:  {DATA_WIDTH{1'b0}}
// 
// Function:   bydefault output  {DATA_WIDTH{1'b0}}
// 
//       i_data_bus(high)          i_data_bus(low)
//    [DATA_WIDTH+:DATA_WIDTH]    [DATA_WIDTH-1:0]  
//                           \     /     
//                            v   v      
//                           \¯¯¯¯¯/       
//                            \___/ <--- i_cmd(1 choose high, 0 choose low)    
//                              |        
//                              v    
//                          o_data_bus
//
// Author:      Jianming Tong (jianming.tong@gatech.edu)
/////////////////////////////////////////////////////////////

module tb_mux_2x1_comb();

	parameter DATA_WIDTH  = 32;
	parameter COMMMAND_WIDTH  = 1;

    // timing signals
    reg                            clk;

    // data signals
	reg    [1:0]                   i_valid;        // valid input data signal
	reg    [2*DATA_WIDTH-1:0]      i_data_bus;     // input data bus coming into mux
	
	wire                           o_valid;        // output valid
    wire   [DATA_WIDTH-1:0]        o_data_bus;     // output data 

	// control signals
	reg                            i_en;           // mux enable
	reg    [COMMMAND_WIDTH-1:0]    i_cmd;          // command 
                                // 0 --> Branch Low
                                // 1 --> Branch High
    
    // Test case declaration
    initial 
    begin
        // disable
        clk = 1'b0;
        i_valid = 2'b11;
        i_data_bus = {{DATA_WIDTH{1'b1}}, {(DATA_WIDTH>>2){4'hA}}};
        i_en = 1'b0;
        i_cmd = 1'b1;
        
        // enable & select i_data_bus(high).
        #20
        i_valid = 2'b10;
        i_en = 1'b1;
        i_cmd = 1'b1;
        
        // enable & select i_data_bus(low).
        #20
        i_valid = 2'b01;
        i_en = 1'b1;
        i_cmd = 1'b0;
        
        // invalid i_data_high & select i_data_bus(high).
        #20
        i_valid = 2'b01;
        i_en = 1'b1;
        i_cmd = 1'b1;
        
        // invalid i_data_low & select i_data_bus(low).
        #20
        i_valid = 2'b10;
        i_en = 1'b1;
        i_cmd = 1'b0;

        // change i_data & select i_data_bus(low).
        #20
        i_valid = 2'b01;
        i_en = 1'b1;
        i_cmd = 1'b0;        
        i_data_bus = {{DATA_WIDTH{1'b0}}, {DATA_WIDTH{1'b1}}};
end


    // instantiate DUT (device under test)
    mux_2x1_comb #(
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