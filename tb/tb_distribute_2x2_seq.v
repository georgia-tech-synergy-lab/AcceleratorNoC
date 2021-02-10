`timescale 1ns / 1ps
/////////////////////////////////////////////////////////////
// Top Module:  tb_distribute_1x2_seq
// Data:        Only data width matters.
// Format:      keeping the input format unchange
// Timing:      Sequential Logic
// Reset:       Synchronized Reset [High Reset]
// Dummy Data:  {DATA_WIDTH{1'b0}}
//
// Unicast Function:
//                         Pass_Through                                   Pass_High                                        Pass_Low
//            
//       i_data_bus(high)          i_data_bus(low)      i_data_bus(high)          i_data_bus(low)      i_data_bus(high)          i_data_bus(low)              
//    [DATA_WIDTH+:DATA_WIDTH]    [DATA_WIDTH-1:0]    [DATA_WIDTH+:DATA_WIDTH]    [DATA_WIDTH-1:0]   [DATA_WIDTH+:DATA_WIDTH]    [DATA_WIDTH-1:0]      
//                           \     /                                       \     /                                         \     /                                                                  
//                            v   v                                         v   v                                           v   v                             
//                            |¯¯¯| <--i_valid=2'b11                        |¯¯¯| <--i_valid=2'b1x                          |¯¯¯| <--i_valid=2'bx1 
//                            |___| <--i_cmd=3'b011                         |___| <--i_cmd=3'b010                           |___| <--i_cmd=3'b001     
//                           /     \                                       /     \                                         /     \
//                          v       v                                     v       v                                       v       v
//                  o_data_high   o_data_low                      o_data_high   Invalid                              Invalid   o_data_low
//
//
// 			               Pass_Switch                                Pass_HighIn_LowOut                              Pass_LowIn_HighOut
//                 
//       i_data_bus(high)          i_data_bus(low)      i_data_bus(high)          i_data_bus(low)      i_data_bus(high)          i_data_bus(low)              
//    [DATA_WIDTH+:DATA_WIDTH]    [DATA_WIDTH-1:0]    [DATA_WIDTH+:DATA_WIDTH]    [DATA_WIDTH-1:0]   [DATA_WIDTH+:DATA_WIDTH]    [DATA_WIDTH-1:0]      
//                           \     /                                       \     /                                         \     /                                                                  
//                            v   v                                         v   v                                           v   v                             
//                            |¯¯¯| <--i_valid=2'b11                        |¯¯¯| <--i_valid=2'b10                          |¯¯¯| <--i_valid=2'b01  
//                            |___| <--i_cmd=3'b111                         |___| <--i_cmd=3'b110                           |___| <--i_cmd=3'b101      
//                           /     \                                       /     \                                         /     \
//                          v       v                                     v       v                                       v       v
//                  o_data_low   o_data_high                         Invalid     o_data_high                       o_data_low  Invalid
//
//
// Multicast Function:   Pass_HighIn_BothOut                          Pass_LowIn_BothOut                                   No Pass   
//                 
//       i_data_bus(high)          i_data_bus(low)      i_data_bus(high)          i_data_bus(low)      i_data_bus(high)          i_data_bus(low)              
//    [DATA_WIDTH+:DATA_WIDTH]    [DATA_WIDTH-1:0]    [DATA_WIDTH+:DATA_WIDTH]    [DATA_WIDTH-1:0]   [DATA_WIDTH+:DATA_WIDTH]    [DATA_WIDTH-1:0]      
//                           \     /                                       \     /                                         \     /                                                                  
//                            v   v                                         v   v                                           v   v                             
//                            |¯¯¯| <--i_valid=2'b11                        |¯¯¯| <--i_valid=2'b01                          |¯¯¯| <--i_valid=2'b00
//                            |___| <--i_cmd=3'b000                         |___| <--i_cmd=3'b100                           |___| <--i_cmd=3'bxxx      
//                           /     \                                       /     \                                         /     \
//                          v       v                                     v       v                                       v       v
//                  o_data_high   o_data_high                      o_data_low    o_data_low                            Invalid  Invalid               
//
//       o_data_high = o_data_bus[2*DATA_WIDTH-1: DATA_WIDTH]
//       o_data_low  = o_data_bus[DATA_WIDTH-1: 0]
//
// Author:      Jianming Tong (jianming.tong@gatech.edu)
/////////////////////////////////////////////////////////////

module tb_distribute_2x2_seq();

	parameter DATA_WIDTH  = 32;
	parameter COMMMAND_WIDTH  = 3;

    // timing signals
    reg                            clk;
    reg                            rst;

    // data signals
	reg    [1:0]                   i_valid;        // valid input data signal
	reg    [2*DATA_WIDTH-1:0]      i_data_bus;     // input data bus coming into mux
	
	wire   [1:0]                   o_valid;        // output valid
    wire   [2*DATA_WIDTH-1:0]      o_data_bus;     // output data 

	// control signals
	reg                            i_en;           // mux enable
	reg    [COMMMAND_WIDTH-1:0]    i_cmd;          // command 
                                    // 000 --> Pass HighIn BothOut
                                    // 100 --> Pass_LowIn_BothOut
                                    // 011 --> Pass Through
                                    // 010 --> Pass High
                                    // 001 --> Pass Low
                                    // 111 --> Pass Switch 
                                    // 110 --> Pass HighIn LowOut
                                    // 101 --> Pass LowIn HighOut

    // Test case declaration
    // all cases for control
    initial 
    begin
        clk = 1'b0;
        // not enable at start
        #20
        rst = 1'b1;
        i_valid = 2'b00;
        i_data_bus = {{(DATA_WIDTH>>2){4'hA}},{(DATA_WIDTH>>2){4'hf}}};
        i_en = 1'b1;
        i_cmd = 3'b000;
        
        // rst active;
        #20
        rst = 1'b1;
        i_valid = 2'b11;
        i_data_bus = {{(DATA_WIDTH>>2){4'hA}},{(DATA_WIDTH>>2){4'hf}}};
        i_en = 1'b1;
        i_cmd = 3'b000;
        
        // input active -- Pass HighIn BothOut
        #20
        rst = 1'b0;
        i_valid = 2'b10;
        i_data_bus = {{(DATA_WIDTH>>2){4'hA}},{(DATA_WIDTH>>2){4'hf}}};
        i_en = 1'b1;
        i_cmd = 3'b000;
    
        // input active -- Pass LowIn BothOut
        #20
        rst = 1'b0;
        i_valid = 2'b01;
        i_data_bus = {{(DATA_WIDTH>>2){4'hA}},{(DATA_WIDTH>>2){4'hf}}};
        i_en = 1'b1;
        i_cmd = 3'b100;
        
        // input active -- Pass Through
        #20
        rst = 1'b0;
        i_valid = 2'b11;
        i_data_bus = {{(DATA_WIDTH>>2){4'hA}},{(DATA_WIDTH>>2){4'hf}}};
        i_en = 1'b1;
        i_cmd = 3'b011;
         
        // input active -- Pass High
        #20
        rst = 1'b0;
        i_valid = 2'b10;
        i_data_bus = {{(DATA_WIDTH>>2){4'hA}},{(DATA_WIDTH>>2){4'hf}}};
        i_en = 1'b1;
        i_cmd = 3'b010;
    
        // input active -- Pass Low
        #20
        rst = 1'b0;
        i_valid = 2'b01;
        i_data_bus = {{(DATA_WIDTH>>2){4'hA}},{(DATA_WIDTH>>2){4'hf}}};
        i_en = 1'b1;
        i_cmd = 3'b001;
        
        // input active -- Pass Switch 
        #20
        rst = 1'b0;
        i_valid = 2'b11;
        i_data_bus = {{(DATA_WIDTH>>2){4'hA}},{(DATA_WIDTH>>2){4'hf}}};
        i_en = 1'b1;
        i_cmd = 3'b111;
                
        // input active -- Pass HighIn LowOut
        #20
        rst = 1'b0;
        i_valid = 2'b11;
        i_data_bus = {{(DATA_WIDTH>>2){4'hA}},{(DATA_WIDTH>>2){4'hf}}};
        i_en = 1'b1;
        i_cmd = 3'b110;
    
        // input active -- Pass LowIn HighOut
        #20
        rst = 1'b0;
        i_valid = 2'b01;
        i_data_bus = {{(DATA_WIDTH>>2){4'hA}},{(DATA_WIDTH>>2){4'hf}}};
        i_en = 1'b1;
        i_cmd = 3'b101;
        
        // disable in progress
        #20
        rst = 1'b0;
        i_valid = 2'b11;
        i_data_bus = {{(DATA_WIDTH>>2){4'hA}},{(DATA_WIDTH>>2){4'hf}}};
        i_en = 1'b0;
        i_cmd = 3'b101;
         
        
        // enable in progress -- Pass LowIn HighOut
        #20
        rst = 1'b0;
        i_valid = 2'b11;
        i_data_bus = {{(DATA_WIDTH>>2){4'hA}},{(DATA_WIDTH>>2){4'hf}}};
        i_en = 1'b1;
        i_cmd = 3'b101;
         
        // reset half way  -- Pass LowIn HighOut
        #20
        rst = 1'b1;
        i_valid = 2'b11;
        i_data_bus = {{(DATA_WIDTH>>2){4'hA}},{(DATA_WIDTH>>2){4'hf}}};
        i_en = 1'b1;
        i_cmd = 3'b101;
                
        // input active -- No Pass
        #20
        rst = 1'b0;
        i_valid = 2'b00;
        i_data_bus = {{(DATA_WIDTH>>2){4'hA}},{(DATA_WIDTH>>2){4'hf}}};
        i_en = 1'b1;
        i_cmd = 3'b011;

        // change data half way  -- Pass LowIn HighOut
        #20
        rst = 1'b0;
        i_valid = 2'b11;
        i_data_bus = {{(DATA_WIDTH>>2){4'hb}},{(DATA_WIDTH>>2){4'hc}}};
        i_en = 1'b1;
        i_cmd = 3'b101;
        
        // invalid high output -- Pass LowIn HighOut
        #20
        rst = 1'b0;
        i_valid = 2'b01;
        i_data_bus = {{(DATA_WIDTH>>2){4'hb}},{(DATA_WIDTH>>2){4'hc}}};
        i_en = 1'b1;
        i_cmd = 3'b101;
       
        // invalid low output  -- Pass LowIn HighOut
        #20
        rst = 1'b0;
        i_valid = 2'b10;
        i_data_bus = {{(DATA_WIDTH>>2){4'hb}},{(DATA_WIDTH>>2){4'hc}}};
        i_en = 1'b1;
        i_cmd = 3'b101;
        $stop;
    end

    // instantiate DUT (device under test)
    distribute_2x2_seq #(
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
		.i_cmd(i_cmd)
	);

    always#5 clk=~clk;

endmodule

