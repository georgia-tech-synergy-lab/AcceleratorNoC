`timescale 1ns / 1ps
/////////////////////////////////////////////////////////////
// Top Module:  tb_distribute_2x2_dst_tag_comb
// Data:        Only data width matters.
// Format:      keeping the input format unchange
// Timing:      Combinational Logic
// Dummy Data:  {DATA_WIDTH{1'bz}}
// 
// ----------------------------------------------
// DESTINATION_TAG verion: 1 bit control for each data.
//
// Unicast Function:
//                  Both_Contention_Highout                          Both_Contention_Lowout
//
//       i_data_bus(high)          i_data_bus(low)         i_data_bus(high)          i_data_bus(low)
//    [DATA_WIDTH+:DATA_WIDTH]    [DATA_WIDTH-1:0]      [DATA_WIDTH+:DATA_WIDTH]    [DATA_WIDTH-1:0]
//                           \     /                                         \     /
//                            v   v                                           v   v
//                            |¯¯¯| <--i_valid=2'b11                          |¯¯¯| <--i_valid=2'b11
//      o_cmd=(n-2)b'???? <-- |___| <--i_cmd=n'b11????  o_cmd=(n-2)b'???? <-- |___| <--i_cmd=n'b00????
//                           /     \                                         /     \
//                          v       v                                       v       v
//                  o_data_high   Invalid                               Invalid   o_data_low
//
//
//                         Pass Through                                    Pass Switch
//
//       i_data_bus(high)          i_data_bus(low)        i_data_bus(high)          i_data_bus(low)
//    [DATA_WIDTH+:DATA_WIDTH]    [DATA_WIDTH-1:0]      [DATA_WIDTH+:DATA_WIDTH]    [DATA_WIDTH-1:0]
//                           \     /                                         \     /
//                            v   v                                           v   v
//                            |¯¯¯| <--i_valid=2'b11                          |¯¯¯| <--i_valid=2'b11
//      o_cmd=(n-2)b'???? <-- |___| <--i_cmd=n'b10????  o_cmd=(n-2)b'???? <-- |___| <--i_cmd=n'b01????
//                           /     \                                         /     \
//                          v       v                                       v       v
//                  o_data_high   o_data_low                          o_data_low   o_data_high
//
// Note: the output port is Invalid when corresponding input data is invalid
//
// Special Function:      No Pass   
//                 
//       i_data_bus(high)          i_data_bus(low)            
//    [DATA_WIDTH+:DATA_WIDTH]    [DATA_WIDTH-1:0]    
//                        \     /                                                                  
//                         v   v                             
//                         |¯¯¯| <--i_valid=2'b00
//    o_cmd=(n-2)b'???? <--|___| <--i_cmd=n'b????      
//                        /     \
//                       v       v
//                  Invalid  Invalid    
//
// Author:      Jianming Tong (jianming.tong@gatech.edu)
/////////////////////////////////////////////////////////////

module tb_distribute_2x2_dst_tag_comb();

	parameter DATA_WIDTH  = 32;
	parameter DESTINATION_TAG_WIDTH  = 2;
	parameter NUM_DATA_IN  = 2;
	parameter IN_COMMAND_WIDTH  = NUM_DATA_IN * DESTINATION_TAG_WIDTH;
	parameter OUT_COMMAND_WIDTH  = (IN_COMMAND_WIDTH>2)?IN_COMMAND_WIDTH-2:1;

    // timing signals
    reg                               clk;

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

    wire   [OUT_COMMAND_WIDTH-1:0]    o_cmd;          // output data 
    
    // Test case declaration
    // all cases for control
    initial 
    begin
        clk = 1'b0;
        // not enable at start
        #20
        i_valid = 2'b11;
        i_data_bus = {{(DATA_WIDTH>>2){4'hA}},{(DATA_WIDTH>>2){4'hf}}};
        i_en = 1'b0;
        i_cmd = {2'b10,2'b01};

        // enable -- reset
        #20
        i_valid = 2'b11;
        i_data_bus = {{(DATA_WIDTH>>2){4'hA}},{(DATA_WIDTH>>2){4'hf}}};
        i_en = 1'b0;
        i_cmd = {2'b00,2'b00};


        // input active -- Pass Through
        #20
        i_valid = 2'b11;
        i_data_bus = {{(DATA_WIDTH>>2){4'hA}},{(DATA_WIDTH>>2){4'hf}}};
        i_en = 1'b1;
        i_cmd = {2'b10,2'b01};
    
        // input active -- Pass Switch 
        #20
        i_valid = 2'b11;
        i_data_bus = {{(DATA_WIDTH>>2){4'hA}},{(DATA_WIDTH>>2){4'hf}}};
        i_en = 1'b1;
        i_cmd = {2'b01,2'b10};
        
        // input active -- Both_Contention_Highout
        #20
        i_valid = 2'b10;
        i_data_bus = {{(DATA_WIDTH>>2){4'hA}},{(DATA_WIDTH>>2){4'hf}}};
        i_en = 1'b1;
        i_cmd = {2'b10,2'b10};
        
        // input active -- Both_Contention_Lowout
        #20
        i_valid = 2'b01;
        i_data_bus = {{(DATA_WIDTH>>2){4'hA}},{(DATA_WIDTH>>2){4'hf}}};
        i_en = 1'b1;
        i_cmd = {2'b01,2'b01};

        // input active -- Pass Switch -- Only HighIn valid
        #20
        i_valid = 2'b10;
        i_data_bus = {{(DATA_WIDTH>>2){4'hA}},{(DATA_WIDTH>>2){4'hf}}};
        i_en = 1'b1;
        i_cmd = {2'b01,2'b10};
        
        // input active -- Pass Switch -- Only LowIn valid
        #20
        i_valid = 2'b01;
        i_data_bus = {{(DATA_WIDTH>>2){4'hA}},{(DATA_WIDTH>>2){4'hf}}};
        i_en = 1'b1;
        i_cmd = {2'b01,2'b10};

        // disable in progress
        #20
        i_valid = 2'b11;
        i_data_bus = {{(DATA_WIDTH>>2){4'hA}},{(DATA_WIDTH>>2){4'hf}}};
        i_en = 1'b0;
        i_cmd = {2'b10,2'b01};

        // enable in progress -- Pass Through
        #20
        i_valid = 2'b11;
        i_data_bus = {{(DATA_WIDTH>>2){4'hA}},{(DATA_WIDTH>>2){4'hf}}};
        i_en = 1'b1;
        i_cmd = {2'b10,2'b01};

        // input active -- No Pass
        #20
        i_valid = 2'b00;
        i_data_bus = {{(DATA_WIDTH>>2){4'hA}},{(DATA_WIDTH>>2){4'hf}}};
        i_en = 1'b1;
        i_cmd = {2'b10,2'b01};

        // change data half way  -- Pass Through
        #20
        i_valid = 2'b11;
        i_data_bus = {{(DATA_WIDTH>>2){4'hb}},{(DATA_WIDTH>>2){4'hc}}};
        i_en = 1'b1;
        i_cmd = {2'b10,2'b01};

        #20
        $stop;
    end

    // instantiate DUT (device under test)
    distribute_2x2_dst_tag_comb #(
		.DATA_WIDTH(DATA_WIDTH),
        .DESTINATION_TAG_WIDTH(DESTINATION_TAG_WIDTH)
      ) dut(
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
