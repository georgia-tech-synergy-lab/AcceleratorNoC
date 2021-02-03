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


module merge_switch_seq#(
	parameter DATA_WIDTH = 32
)(
    // timeing signals
    clk,
	rst,
	
    // data signals
	i_valid,        // valid input data signal
	i_data_bus,     // input data bus coming into distribute switch
	
	o_valid,        // output valid
    o_data_bus,     // output data 

	// control signals
	i_en,           // distribute switch enable
	i_cmd,          // command 
)
	// interface
	input                      clk;
	input                      rst;
	
	input  [1:0]               i_valid;             
	input  [2*DATA_WIDTH-1:0]  i_data_bus;
	
	output [1:0]               o_valid;             
	output [DATA_WIDTH-1:0]    o_data_bus; //{o_data_a, o_data_b}
	    
	input                      i_en;
	input  [1:0]               i_cmd;
		// 00 --> NA
		// 01 --> Branch_low
		// 10 --> Branch_high
		// 11 --> Duplicate

	// inner logic
	wire                       grant_valid;
	wire                       grant_data;

	arbitor_last_served_2req(
		.i_valid( i_valid[0] | i_valid[1] ),       
		.i_req_bus(i_valid),    // req A = low; req B = high
		.o_valid(grant_valid),      
		.o_grant_b(grant_data), // 0 grants low; 1 grants high 
		.i_en(i_en)         
	);

	mux_seq2_1 #(
		.DATA_WIDTH(DATA_WIDTH)
	)data_mux(
		.clk(clk),
		.rst(rst),
		.i_valid(grant_valid),
		.i_data_bus(i_data_bus),
		.o_valid(o_valid),
		.o_data_bus(o_data_bus),
		.i_en(i_en),
		.i_cmd(grant_data)
	);

endmodule