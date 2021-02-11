`timescale 1ns / 1ps
/////////////////////////////////////////////////////////////
// Top Module:  distribute_2x2_seq
// Data:        Only data width matters.
// Format:      keeping the input format unchange
// Timing:      Sequential Logic
// Reset:       Synchronized Reset [High Reset]
// Latency:     2 cycle for Complex; 1 cycle for Simple
// Dummy Data:  {DATA_WIDTH{1'b0}}
// 
// Total two versions are supported here, including complex (9 functions[3 bit control]) and simple (4 functions + No Pass[2 bit control]) version
// uncomment `define SIMPLE to use SIMPLE VERSION
// ----------------------------------------------
// Complex Version3 bit control version:
// Unicast Function 
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
// Multicast Function:    Multicast_HighIn                             Multicast_LowIn                                   No Pass   
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
// ----------------------------------------------
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
//                            |___| <--i_cmd=2'b10                          |___| <--i_cmd=2'b01                
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
//                            |___| <--i_cmd=2'b11                          |___| <--i_cmd=2'b00                            |___| <--i_cmd=2'bxx      
//                           /     \                                       /     \                                         /     \
//                          v       v                                     v       v                                       v       v
//                  o_data_high   o_data_high                      o_data_low    o_data_low                            Invalid  Invalid    
//  
// Author:      Jianming Tong (jianming.tong@gatech.edu)
/////////////////////////////////////////////////////////////

`define SIMPLE
`ifdef SIMPLE
module tb_distribute_2x2_seq();

	parameter DATA_WIDTH  = 32;
	parameter COMMMAND_WIDTH  = 2;

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
                                    // 10 --> Multicast_HighIn
                                    // 01 --> Multicast_LowIn
                                    // 11 --> Pass Through
                                    // 00 --> Pass Switch 
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
        i_cmd = 2'b00;
        
        // rst active;
        #20
        rst = 1'b1;
        i_valid = 2'b11;
        i_data_bus = {{(DATA_WIDTH>>2){4'hA}},{(DATA_WIDTH>>2){4'hf}}};
        i_en = 1'b1;
        i_cmd = 2'b00;
        
        // input active -- Multicast_HighIn
        #20
        rst = 1'b0;
        i_valid = 2'b10;
        i_data_bus = {{(DATA_WIDTH>>2){4'hA}},{(DATA_WIDTH>>2){4'hf}}};
        i_en = 1'b1;
        i_cmd = 2'b11;
    
        // input active -- Multicast_LowIn
        #20
        rst = 1'b0;
        i_valid = 2'b01;
        i_data_bus = {{(DATA_WIDTH>>2){4'hA}},{(DATA_WIDTH>>2){4'hf}}};
        i_en = 1'b1;
        i_cmd = 2'b00;
        
        // input active -- Pass Through
        #20
        rst = 1'b0;
        i_valid = 2'b11;
        i_data_bus = {{(DATA_WIDTH>>2){4'hA}},{(DATA_WIDTH>>2){4'hf}}};
        i_en = 1'b1;
        i_cmd = 2'b10;
        
        // input active -- Pass Switch 
        #20
        rst = 1'b0;
        i_valid = 2'b11;
        i_data_bus = {{(DATA_WIDTH>>2){4'hA}},{(DATA_WIDTH>>2){4'hf}}};
        i_en = 1'b1;
        i_cmd = 2'b01;
        
        // disable in progress
        #20
        rst = 1'b0;
        i_valid = 2'b11;
        i_data_bus = {{(DATA_WIDTH>>2){4'hA}},{(DATA_WIDTH>>2){4'hf}}};
        i_en = 1'b0;
        i_cmd = 2'b00;

        
        // enable in progress -- Pass Through
        #20
        rst = 1'b0;
        i_valid = 2'b11;
        i_data_bus = {{(DATA_WIDTH>>2){4'hA}},{(DATA_WIDTH>>2){4'hf}}};
        i_en = 1'b1;
        i_cmd = 2'b10;
         
        // reset half way  -- Pass Swtich
        #20
        rst = 1'b1;
        i_valid = 2'b11;
        i_data_bus = {{(DATA_WIDTH>>2){4'hA}},{(DATA_WIDTH>>2){4'hf}}};
        i_en = 1'b1;
        i_cmd = 2'b01;
                
        // input active -- No Pass
        #20
        rst = 1'b0;
        i_valid = 2'b00;
        i_data_bus = {{(DATA_WIDTH>>2){4'hA}},{(DATA_WIDTH>>2){4'hf}}};
        i_en = 1'b1;
        i_cmd = 2'b01;

        // change data half way  -- Pass Through
        #20
        rst = 1'b0;
        i_valid = 2'b11;
        i_data_bus = {{(DATA_WIDTH>>2){4'hb}},{(DATA_WIDTH>>2){4'hc}}};
        i_en = 1'b1;
        i_cmd = 2'b10;
        
        // invalid high output -- Pass Through
        #20
        rst = 1'b0;
        i_valid = 2'b01;
        i_data_bus = {{(DATA_WIDTH>>2){4'hb}},{(DATA_WIDTH>>2){4'hc}}};
        i_en = 1'b1;
        i_cmd = 2'b10;
       
        // invalid low output  -- Pass Through
        #20
        rst = 1'b0;
        i_valid = 2'b10;
        i_data_bus = {{(DATA_WIDTH>>2){4'hb}},{(DATA_WIDTH>>2){4'hc}}};
        i_en = 1'b1;
        i_cmd = 2'b10;
        #20
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


`else
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
                                    // 000 --> Multicast_HighIn
                                    // 100 --> Multicast_LowIn
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
        
        // input active -- Multicast_HighIn
        #20
        rst = 1'b0;
        i_valid = 2'b10;
        i_data_bus = {{(DATA_WIDTH>>2){4'hA}},{(DATA_WIDTH>>2){4'hf}}};
        i_en = 1'b1;
        i_cmd = 3'b000;
    
        // input active -- Multicast_LowIn
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

`endif