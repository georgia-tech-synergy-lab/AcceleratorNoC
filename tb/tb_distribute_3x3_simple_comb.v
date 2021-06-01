`timescale 1ns / 1ps
/////////////////////////////////////////////////////////////
// Top Module:  tb_distribute_3x3_simple_comb
// Data:        Only data width matters.
// Format:      keeping the input format unchange
// Timing:      Sequential Logic
// Reset:       Synchronized Reset [High Reset]
// Latency:     2 cycle for Complex; 1 cycle for Simple
// Dummy Data:  {DATA_WIDTH{1'b0}}
// 
// Total two versions are supported here, including complex (9 functions[3 bit control]) and simple (4 functions + No Pass[2 bit control]) version
// uncomment `define SIMPLE_MODULAR to use SIMPLE_MODULAR VERSION
//
// 5 bit control
// Description:
// 1. The first 2 bits encode the functionalities of the two input data. 
//   Note: the left bit of the first 2 bits determine the high output port
//         the right bit of the first 2 bits determine the low output port
// 2. The middle bit is used to control the o_fwd bit 
//         when last bits are both 1 then the o_fwd output valid data. 
// 3. The last 2 bits control the output data. 
//   Note: the left bit of the first 2 bits determine the high output port
//         the right bit of the first 2 bits determine the low output port
//
// Unicast Function:
//                         Pass_Through                                              Pass_Swtich                          
//
//       i_data_bus(high)          i_data_bus(low)                  i_data_bus(high)          i_data_bus(low)                  
//    [DATA_WIDTH+:DATA_WIDTH]    [DATA_WIDTH-1:0]                [DATA_WIDTH+:DATA_WIDTH]    [DATA_WIDTH-1:0]         
//                           \     /                                                   \     /                                                                                                
//                            v   v                                                     v   v                                                            
// [DATA_WIDTH-1:0] i_fwd --> |¯¯¯| <--i_valid=3'b11?        [DATA_WIDTH-1:0] i_fwd --> |¯¯¯| <--i_valid=3'b11?                
//        Invalid(o_fwd)  <-- |___| <--i_cmd=5'b10011               Invalid(o_fwd)  <-- |___| <--i_cmd=5'b01011                 
//                           /     \                                                   /     \                              
//                          v       v                                                 v       v                             
//                 o_data_high    o_data_low                                  o_data_low     o_data_high        
//    [DATA_WIDTH+:DATA_WIDTH]    [DATA_WIDTH-1:0] 
// 
// 
// Multicast Function:   Multicast_HighIn                                          Multicast_LowIn                                              No Pass    
// 
//       i_data_bus(high)          i_data_bus(low)                   i_data_bus(high)          i_data_bus(low)                  i_data_bus(high)          i_data_bus(low)              
//    [DATA_WIDTH+:DATA_WIDTH]    [DATA_WIDTH-1:0]                 [DATA_WIDTH+:DATA_WIDTH]    [DATA_WIDTH-1:0]             [DATA_WIDTH+:DATA_WIDTH]    [DATA_WIDTH-1:0]      
//                           \     /                                                     \     /                                                 \     /                                                                  
//                            v   v                                                       v   v                                                   v   v                             
// [DATA_WIDTH-1:0] i_fwd --> |¯¯¯| <--i_valid=3'b11?          [DATA_WIDTH-1:0] i_fwd --> |¯¯¯| <--i_valid=3'b11?      [DATA_WIDTH-1:0] i_fwd --> |¯¯¯| <--i_valid=3'b000             
//        Invalid(o_fwd)  <-- |___| <--i_cmd=5'b11011                 Invalid(o_fwd)  <-- |___| <--i_cmd=5'b00011             Invalid(o_fwd)  <-- |___| <--i_cmd=5'b?????      
//                           /     \                                                     /     \                                                 /     \
//                          v       v                                                   v       v                                               v       v
//                  o_data_high   o_data_high                                   o_data_low    o_data_low                                   Invalid    Invalid    
//  
// 
// Forwarding Function:   Pass_Through_I_Fwd_High_O_Fwd_High                    Pass_Through_I_Fwd_High_O_Fwd_Low   
// 
//                i_data_bus(high)          i_data_bus(low)              i_data_bus(high)          i_data_bus(low)              
//             [DATA_WIDTH+:DATA_WIDTH]    [DATA_WIDTH-1:0]            [DATA_WIDTH+:DATA_WIDTH]    [DATA_WIDTH-1:0]      
//                                    \     /                                               \     /
//                                     v   v                                                 v   v 
//          [DATA_WIDTH-1:0] i_fwd --> |¯¯¯| <--i_valid=3'b111    [DATA_WIDTH-1:0] i_fwd --> |¯¯¯| <--i_valid=3'b111
//            o_data_high (o_fwd)  <-- |___| <--i_cmd=5'b10110        o_data_low (o_fwd) <-- |___| <--i_cmd=5'b10010
//                                    /     \                                               /     \
//                                   v       v                                             v       v
//                               i_fwd   o_data_low                                   i_fwd   o_data_low 
//
//
// Forwarding Function:   Pass_Through_I_Fwd_High_O_Fwd_High                    Pass_Through_I_Fwd_High_O_Fwd_Low   
// 
//                i_data_bus(high)          i_data_bus(low)              i_data_bus(high)          i_data_bus(low)              
//             [DATA_WIDTH+:DATA_WIDTH]    [DATA_WIDTH-1:0]            [DATA_WIDTH+:DATA_WIDTH]    [DATA_WIDTH-1:0]      
//                                    \     /                                               \     /
//                                     v   v                                                 v   v 
//          [DATA_WIDTH-1:0] i_fwd --> |¯¯¯| <--i_valid=3'b111    [DATA_WIDTH-1:0] i_fwd --> |¯¯¯| <--i_valid=3'b111
//            o_data_high (o_fwd)  <-- |___| <--i_cmd=5'b10101        o_data_low (o_fwd) <-- |___| <--i_cmd=5'b10001
//                                    /     \                                               /     \
//                                   v       v                                             v       v
//                             o_data_high   i_fwd                                  o_data_high   i_fwd
//
//
// Forwarding Function:   Pass_Cross_I_Fwd_High_O_Fwd_High                    Pass_Cross_I_Fwd_High_O_Fwd_Low   
// 
//                i_data_bus(high)          i_data_bus(low)              i_data_bus(high)          i_data_bus(low)              
//             [DATA_WIDTH+:DATA_WIDTH]    [DATA_WIDTH-1:0]            [DATA_WIDTH+:DATA_WIDTH]    [DATA_WIDTH-1:0]      
//                                    \     /                                               \     /
//                                     v   v                                                 v   v 
//          [DATA_WIDTH-1:0] i_fwd --> |¯¯¯| <--i_valid=3'b111    [DATA_WIDTH-1:0] i_fwd --> |¯¯¯| <--i_valid=3'b111
//             o_data_low (o_fwd)  <-- |___| <--i_cmd=5'b01110       o_data_high (o_fwd) <-- |___| <--i_cmd=5'b01010
//                                    /     \                                               /     \
//                                   v       v                                             v       v
//                               i_fwd   o_data_high                                  i_fwd   o_data_high 
//
//
// Forwarding Function:   Pass_Cross_I_Fwd_High_O_Fwd_High                    Pass_Cross_I_Fwd_High_O_Fwd_Low   
// 
//                i_data_bus(high)          i_data_bus(low)              i_data_bus(high)          i_data_bus(low)              
//             [DATA_WIDTH+:DATA_WIDTH]    [DATA_WIDTH-1:0]            [DATA_WIDTH+:DATA_WIDTH]    [DATA_WIDTH-1:0]      
//                                    \     /                                               \     /
//                                     v   v                                                 v   v 
//          [DATA_WIDTH-1:0] i_fwd --> |¯¯¯| <--i_valid=3'b111    [DATA_WIDTH-1:0] i_fwd --> |¯¯¯| <--i_valid=3'b111
//             o_data_low (o_fwd)  <-- |___| <--i_cmd=5'b01101       o_data_high (o_fwd) <-- |___| <--i_cmd=5'b01001
//                                    /     \                                               /     \
//                                   v       v                                             v       v
//                            o_data_low    i_fwd                                  o_data_low    i_fwd
//
//
// Author:      Jianming Tong (jianming.tong@gatech.edu)
/////////////////////////////////////////////////////////////

module tb_distribute_3x3_simple_comb();
	parameter DATA_WIDTH  = 4;
	parameter COMMMAND_WIDTH  = 5;

    // timing signals
    reg                            clk;

    // data signals
	reg    [1:0]                   i_valid;        // valid input data signal
	reg    [2*DATA_WIDTH-1:0]      i_data_bus;     // input data bus coming into mux
	
	wire   [1:0]                   o_valid;        // output valid
    wire   [2*DATA_WIDTH-1:0]      o_data_bus;     // output data 

	reg                            i_fwd_valid;             
	reg  [DATA_WIDTH-1:0]          i_fwd_data_bus;
	
	wire                           o_fwd_valid;             
	wire [DATA_WIDTH-1:0]          o_fwd_data_bus; 

	// control signals
	reg                            i_en;           // mux enable
	reg    [COMMMAND_WIDTH-1:0]    i_cmd;          // command 
                        // The first 2 bits
                            // 11 --> Multicast_HighIn
                            // 00 --> Multicast_LowIn
                            // 10 --> Pass Through
                            // 01 --> Pass Switch 
                        // The middle bit
                            // input forward valid bit
                        // The last 2 bits
                            // 11 --> Keep Original
                            // 10 --> Forward LowOut
                            // 00 --> Forward Multicast
                            // 01 --> Forward HighOut

    // Test case declaration
    // all cases for control
    initial 
    begin
        // expected output
        /*
            1   # o_fwd_data: 0; o_data_bus: 00
                # 
            2   # o_fwd_data: 0; o_data_bus: 00
                # 
            3   # o_fwd_data: 0; o_data_bus: ff
                # 
            4   # o_fwd_data: 0; o_data_bus: aa
                # 
            5   # o_fwd_data: 0; o_data_bus: fa
                # 
            6   # o_fwd_data: 0; o_data_bus: af
                # 
            7   # o_fwd_data: 0; o_data_bus: 00
                # 
            8   # o_fwd_data: 0; o_data_bus: 3a
                # 
            9   # o_fwd_data: a; o_data_bus: 3a
                # 
            10  # o_fwd_data: f; o_data_bus: f3
                # 
            11  # o_fwd_data: a; o_data_bus: f3
                # 
            12  # o_fwd_data: f; o_data_bus: 3f
                # 
            13  # o_fwd_data: f; o_data_bus: 3f
                # 
            14  # o_fwd_data: a; o_data_bus: a3
                # 
            15  # o_fwd_data: f; o_data_bus: a3
                # 
            16  # o_fwd_data: 0; o_data_bus: 00
                # 
            17  # o_fwd_data: 0; o_data_bus: 00
                # 
            18  # o_fwd_data: 0; o_data_bus: 54
                # 
            19  # o_fwd_data: 0; o_data_bus: 04
                # 
            20  # o_fwd_data: 0; o_data_bus: 50
                # 
        */
    
        clk = 1'b0;
        // 1 not enable at start
        #20
        i_valid = 2'b00;
        i_fwd_valid = 1'b0;
        i_data_bus = {{(DATA_WIDTH>>2){4'hF}},{(DATA_WIDTH>>2){4'hA}}};
        i_fwd_data_bus = {(DATA_WIDTH>>2){4'h3}};
        i_en = 1'b1;
        i_cmd = 5'b10011;

        // 2 rst active;
        #20
        // 1 -> o_fwd_data: 0; o_data_bus: 00
        $display("o_fwd_data: %h; o_data_bus: %h\n", o_fwd_data_bus, o_data_bus);
        i_valid = 2'b11;
        i_fwd_valid = 1'b1;
        i_data_bus = {{(DATA_WIDTH>>2){4'hF}},{(DATA_WIDTH>>2){4'hA}}};
        i_fwd_data_bus = {(DATA_WIDTH>>2){4'h3}};
        i_en = 1'b1;
        i_cmd = 5'b01011;
        
        // 3 input active -- Multicast_HighIn
        #20
        // 2 -> o_fwd_data: 0; o_data_bus: 00
        $display("o_fwd_data: %h; o_data_bus: %h\n", o_fwd_data_bus, o_data_bus);
        i_valid = 2'b11;
        i_fwd_valid = 1'b1;
        i_data_bus = {{(DATA_WIDTH>>2){4'hF}},{(DATA_WIDTH>>2){4'hA}}};
        i_fwd_data_bus = {(DATA_WIDTH>>2){4'h3}};
        i_en = 1'b1;
        i_cmd = 5'b11011;
    
        // 4 input active -- Multicast_LowIn
        #20
        // 3 -> o_fwd_data: 0; o_data_bus: FF
        $display("o_fwd_data: %h; o_data_bus: %h\n", o_fwd_data_bus, o_data_bus);
        i_valid = 2'b11;
        i_fwd_valid = 1'b1;
        i_data_bus = {{(DATA_WIDTH>>2){4'hF}},{(DATA_WIDTH>>2){4'hA}}};
        i_fwd_data_bus = {(DATA_WIDTH>>2){4'h3}};
        i_en = 1'b1;
        i_cmd = 5'b00011;
        
        // 5 input active -- Pass Through
        #20
        // 4 -> o_fwd_data: 0; o_data_bus: AA
        $display("o_fwd_data: %h; o_data_bus: %h\n", o_fwd_data_bus, o_data_bus);
        i_valid = 2'b11;
        i_fwd_valid = 1'b1;
        i_data_bus = {{(DATA_WIDTH>>2){4'hF}},{(DATA_WIDTH>>2){4'hA}}};
        i_fwd_data_bus = {(DATA_WIDTH>>2){4'h3}};
        i_en = 1'b1;
        i_cmd = 5'b10011;
        
        // 6 input active -- Pass Switch 
        #20
        // 5 -> o_fwd_data: 0; o_data_bus: FA
        $display("o_fwd_data: %h; o_data_bus: %h\n", o_fwd_data_bus, o_data_bus);
        i_valid = 2'b11;
        i_fwd_valid = 1'b1;
        i_data_bus = {{(DATA_WIDTH>>2){4'hF}},{(DATA_WIDTH>>2){4'hA}}};
        i_fwd_data_bus = {(DATA_WIDTH>>2){4'h3}};
        i_en = 1'b1;
        i_cmd = 5'b01011;
        
        // 7 disable in progress
        #20
        // 6 -> o_fwd_data: 0; o_data_bus: AF
        $display("o_fwd_data: %h; o_data_bus: %h\n", o_fwd_data_bus, o_data_bus);
        i_valid = 2'b11;
        i_fwd_valid = 1'b1;
        i_data_bus = {{(DATA_WIDTH>>2){4'hF}},{(DATA_WIDTH>>2){4'hA}}};
        i_fwd_data_bus = {(DATA_WIDTH>>2){4'h3}};
        i_en = 1'b0;
        i_cmd = 5'b01011;
        
        // 8 enable in progress -- Pass_Through_I_Fwd_High_O_Fwd_High
        #20
        // 7 -> o_fwd_data: 0; o_data_bus: 00
        $display("o_fwd_data: %h; o_data_bus: %h\n", o_fwd_data_bus, o_data_bus);
        i_valid = 2'b11;
        i_fwd_valid = 1'b1;
        i_data_bus = {{(DATA_WIDTH>>2){4'hF}},{(DATA_WIDTH>>2){4'hA}}};
        i_fwd_data_bus = {(DATA_WIDTH>>2){4'h3}};
        i_en = 1'b1;
        i_cmd = 5'b10101;
        
        // 9 enable in progress -- Pass_Through_I_Fwd_High_O_Fwd_Low
        #20
        // 8 -> o_fwd_data: F; o_data_bus: 3A
        $display("o_fwd_data: %h; o_data_bus: %h\n", o_fwd_data_bus, o_data_bus);
        i_valid = 2'b11;
        i_fwd_valid = 1'b1;
        i_data_bus = {{(DATA_WIDTH>>2){4'hF}},{(DATA_WIDTH>>2){4'hA}}};
        i_fwd_data_bus = {(DATA_WIDTH>>2){4'h3}};
        i_en = 1'b1;
        i_cmd = 5'b10001;

        // 10 enable in progress -- Pass_Through_I_Fwd_Low_O_Fwd_High
        #20
        // 9 -> o_fwd_data: A; o_data_bus: 3A
        $display("o_fwd_data: %h; o_data_bus: %h\n", o_fwd_data_bus, o_data_bus);
        i_valid = 2'b11;
        i_fwd_valid = 1'b1;
        i_data_bus = {{(DATA_WIDTH>>2){4'hF}},{(DATA_WIDTH>>2){4'hA}}};
        i_fwd_data_bus = {(DATA_WIDTH>>2){4'h3}};
        i_en = 1'b1;
        i_cmd = 5'b10110;
        
        // 11 enable in progress -- Pass_Through_I_Fwd_Low_O_Fwd_Low
        #20
        // 10 -> o_fwd_data: F; o_data_bus: F3
        $display("o_fwd_data: %h; o_data_bus: %h\n", o_fwd_data_bus, o_data_bus);
        i_valid = 2'b11;
        i_fwd_valid = 1'b1;
        i_data_bus = {{(DATA_WIDTH>>2){4'hF}},{(DATA_WIDTH>>2){4'hA}}};
        i_fwd_data_bus = {(DATA_WIDTH>>2){4'h3}};
        i_en = 1'b1;
        i_cmd = 5'b10010;

        // 12 enable in progress -- Pass_Cross_I_Fwd_High_O_Fwd_High
        #20
        // 11 -> o_fwd_data: A; o_data_bus: F3
        $display("o_fwd_data: %h; o_data_bus: %h\n", o_fwd_data_bus, o_data_bus);
        i_valid = 2'b11;
        i_fwd_valid = 1'b1;
        i_data_bus = {{(DATA_WIDTH>>2){4'hF}},{(DATA_WIDTH>>2){4'hA}}};
        i_fwd_data_bus = {(DATA_WIDTH>>2){4'h3}};
        i_en = 1'b1;
        i_cmd = 5'b01101;
        
        // 13 enable in progress -- Pass_Cross_I_Fwd_High_O_Fwd_Low
        #20
        // 12 -> o_fwd_data: A; o_data_bus: 3F
        $display("o_fwd_data: %h; o_data_bus: %h\n", o_fwd_data_bus, o_data_bus);
        i_valid = 2'b11;
        i_fwd_valid = 1'b1;
        i_data_bus = {{(DATA_WIDTH>>2){4'hF}},{(DATA_WIDTH>>2){4'hA}}};
        i_fwd_data_bus = {(DATA_WIDTH>>2){4'h3}};
        i_en = 1'b1;
        i_cmd = 5'b01001;

        // 14 enable in progress -- Pass_Cross_I_Fwd_Low_O_Fwd_High
        #20
        // 13 -> o_fwd_data: F; o_data_bus: 3F
        $display("o_fwd_data: %h; o_data_bus: %h\n", o_fwd_data_bus, o_data_bus);
        i_valid = 2'b11;
        i_fwd_valid = 1'b1;
        i_data_bus = {{(DATA_WIDTH>>2){4'hF}},{(DATA_WIDTH>>2){4'hA}}};
        i_fwd_data_bus = {(DATA_WIDTH>>2){4'h3}};
        i_en = 1'b1;
        i_cmd = 5'b01110;
        
        // 15 enable in progress -- Pass_Cross_I_Fwd_Low_O_Fwd_Low
        #20
        // 14 -> o_fwd_data: A; o_data_bus: A3
        $display("o_fwd_data: %h; o_data_bus: %h\n", o_fwd_data_bus, o_data_bus);
        i_valid = 2'b11;
        i_fwd_valid = 1'b1;
        i_data_bus = {{(DATA_WIDTH>>2){4'hF}},{(DATA_WIDTH>>2){4'hA}}};
        i_fwd_data_bus = {(DATA_WIDTH>>2){4'h3}};
        i_en = 1'b1;
        i_cmd = 5'b01010;

        // 16 reset half way  -- Pass Swtich
        #20
        // 15 -> o_fwd_data: F; o_data_bus: A3
        $display("o_fwd_data: %h; o_data_bus: %h\n", o_fwd_data_bus, o_data_bus);
        i_valid = 2'b11;
        i_fwd_valid = 1'b1;
        i_data_bus = {{(DATA_WIDTH>>2){4'hF}},{(DATA_WIDTH>>2){4'hA}}};
        i_fwd_data_bus = {(DATA_WIDTH>>2){4'h3}};
        i_en = 1'b1;
        i_cmd = 5'b01011;

        // 17 input active -- No Pass
        #20
        // 16 -> o_fwd_data: 0; o_data_bus: 00
        $display("o_fwd_data: %h; o_data_bus: %h\n", o_fwd_data_bus, o_data_bus);
        i_valid = 2'b00;
        i_fwd_valid = 1'b0;
        i_data_bus = {{(DATA_WIDTH>>2){4'hF}},{(DATA_WIDTH>>2){4'hA}}};
        i_fwd_data_bus = {(DATA_WIDTH>>2){4'h3}};
        i_en = 1'b1;
        i_cmd = 5'b01011;

        // 18 change data half way  -- Pass Through
        #20
        // 17 -> o_fwd_data: 0; o_data_bus: 00
        $display("o_fwd_data: %h; o_data_bus: %h\n", o_fwd_data_bus, o_data_bus);
        i_valid = 2'b11;
        i_fwd_valid = 1'b1;
        i_data_bus = {{(DATA_WIDTH>>2){4'h5}},{(DATA_WIDTH>>2){4'h4}}};
        i_fwd_data_bus = {(DATA_WIDTH>>2){4'h1}};
        i_en = 1'b1;
        i_cmd = 5'b10011;
        
        // 19 invalid high output -- Pass Through
        #20
        // 18 -> o_fwd_data: 0; o_data_bus: 54
        $display("o_fwd_data: %h; o_data_bus: %h\n", o_fwd_data_bus, o_data_bus);
        i_valid = 2'b01;
        i_fwd_valid = 1'b1;
        i_data_bus = {{(DATA_WIDTH>>2){4'h5}},{(DATA_WIDTH>>2){4'h4}}};
        i_fwd_data_bus = {(DATA_WIDTH>>2){4'h3}};
        i_en = 1'b1;
        i_cmd = 5'b10011;
       
        // 20 invalid low output  -- Pass Through
        #20
        // 19 -> o_fwd_data: 0; o_data_bus: 04
        $display("o_fwd_data: %h; o_data_bus: %h\n", o_fwd_data_bus, o_data_bus);
        i_valid = 2'b10;
        i_fwd_valid = 1'b1;
        i_data_bus = {{(DATA_WIDTH>>2){4'h5}},{(DATA_WIDTH>>2){4'h4}}};
        i_fwd_data_bus = {(DATA_WIDTH>>2){4'h3}};
        i_en = 1'b1;
        i_cmd = 5'b10011;
        #20
        // 20 -> o_fwd_data: 0; o_data_bus: 50
        $display("o_fwd_data: %h; o_data_bus: %h\n", o_fwd_data_bus, o_data_bus);
        $stop;
    end

    // instantiate DUT (device under test)
    distribute_3x3_simple_comb #(
		.DATA_WIDTH(DATA_WIDTH),
        .COMMMAND_WIDTH(COMMMAND_WIDTH)
      ) dut(
		.i_valid(i_valid),
		.i_data_bus(i_data_bus),
		.o_valid(o_valid),
		.o_data_bus(o_data_bus),
		.i_en(i_en),
		.i_cmd(i_cmd),
        .i_fwd_valid(i_fwd_valid),       // input forward valid
        .i_fwd_data_bus(i_fwd_data_bus), // input data
        .o_fwd_valid(o_fwd_valid),       // output forward valid
        .o_fwd_data_bus(o_fwd_data_bus)  // output data
	);

    always#5 clk=~clk;

endmodule
