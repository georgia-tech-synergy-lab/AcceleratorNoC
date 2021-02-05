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

module tb_mux_comb2_1();

	parameter DATA_WIDTH  = 32;

    // timing signals
    reg                            clk;

    // data signals
	reg                            i_valid;        // valid input data signal
	reg    [2*DATA_WIDTH-1:0]      i_data_bus;     // input data bus coming into mux
	
	wire                           o_valid;        // output valid
    wire   [DATA_WIDTH-1:0]        o_data_bus;     // output data 

	// control signals
	reg                            i_en;           // mux enable
	reg                            i_cmd;          // command 
                                // 0 --> Branch_left
                                // 1 --> Branch_right
    
    // Test case declaration
    initial 
    begin
        clk = 1'b0;
        i_valid = 1'b1;
        i_data_bus = {{DATA_WIDTH{1'b1}}, {(DATA_WIDTH>>2){4'hA}}};
        i_en = 1'b0;
        i_cmd = 1'b1;
        #20
        i_en = 1'b1;
        i_cmd = 1'b1;
        #20
        i_en = 1'b1;
        i_cmd = 1'b0;
        #20
        i_en = 1'b0;
        i_cmd = 1'b0;
        #20
        i_en = 1'b1;
        i_cmd = 1'b0;
        i_data_bus = {{DATA_WIDTH{1'b0}}, {DATA_WIDTH{1'b1}}};
end


    // instantiate DUT (device under test)
    mux_comb2_1 #(
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