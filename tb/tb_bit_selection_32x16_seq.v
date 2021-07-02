`timescale 1ns / 1ps
/////////////////////////////////////////////////////////////
// Top Module:  tb_bit_selection_32x16_seq
// Data:        Only data width matters.
// Format:      keeping the input format unchange
// Timing:      Sequential Logic, one clock cycle latency
// Dummy Data:  {DATA_WIDTH{1'b0}}
// 
// Function:    select 16 continous bits out of 32 bits --> total 16 cases (if need shift) -> 4-bit command.
//              extra 1 bit command to control whether shift is needed.
//              So 5-bit command in total
//
// Author:      Jianming Tong (jianming.tong@gatech.edu)
/////////////////////////////////////////////////////////////

module tb_bit_selection_32x16_seq();
	
    parameter DATA_WIDTH = 32;                        // could only be 32
	parameter COMMAND_WIDTH = $clog2(DATA_WIDTH);     // could only be 4+1 = 5 
	parameter OUT_DATA_WIDTH = DATA_WIDTH >> 1;
    
    // interface
	reg                                                        clk;
	reg                                                        rst;

	reg                                                        i_valid;             
	reg    [DATA_WIDTH-1:0]                                    i_data_bus;
	
	wire                                                       o_valid;             
	wire   [OUT_DATA_WIDTH-1:0]                                o_data_bus; //{o_data_a, o_data_b}

	reg                                                        i_en;
	reg    [COMMAND_WIDTH-1:0]                                 i_cmd;
    
    /*
        # o_data_bus: 0000
        # 
        # o_data_bus: 0000
        # 
        # o_data_bus: 0408
        # 
        # o_data_bus: 8204
        # 
        # o_data_bus: 4102
        # 
        # o_data_bus: 2081
        # 
        # o_data_bus: 1040
        # 
        # o_data_bus: 8410
        # 
        # o_data_bus: 4208
        # 
        # o_data_bus: 2104
        # 
        # o_data_bus: 1082
        # 
        # o_data_bus: 8841
        # 
        # o_data_bus: 4420
        # 
        # o_data_bus: 2210
        # 
        # o_data_bus: 4884
        # 
        # o_data_bus: a442
        # 
        # o_data_bus: 0810
        #
    */

    initial begin
        clk = 1'b0;
        // 1 not enable at start
        rst = 1'b1;
        i_valid = 2'b00;
        i_data_bus = 32'b10100100010000100000100000010000;
        i_en = 1'b1;
        i_cmd = 5'b10000;

        // 2 rst active;
        #10
        $display("o_data_bus: %h\n", o_data_bus);
        rst = 1'b1;
        i_valid = 1'b1;
        i_data_bus = 32'b10100100010000100000100000010000;
        i_en = 1'b1;
        i_cmd = 5'b10000;
        
        // 3 input active -- right shift 1 bit
        #10
        $display("o_data_bus: %h\n", o_data_bus);
        rst = 1'b0;
        i_valid = 1'b1;
        i_data_bus = 32'b10100100010000100000100000010000;
        i_en = 1'b1;
        i_cmd = 5'b10000;
    
        // 4 input active -- right shift 2 bit
        #10
        $display("o_data_bus: %h\n", o_data_bus);
        rst = 1'b0;
        i_valid = 1'b1;
        i_data_bus = 32'b10100100010000100000100000010000;
        i_en = 1'b1;
        i_cmd = 5'b10001;
        
        // 5 input active -- right shift 3 bit
        #10
        $display("o_data_bus: %h\n", o_data_bus);
        rst = 1'b0;
        i_valid = 1'b1;
        i_data_bus = 32'b10100100010000100000100000010000;
        i_en = 1'b1;
        i_cmd = 5'b10010;
        
        // 6 input active -- right shift 4 bit
        #10
        $display("o_data_bus: %h\n", o_data_bus);
        rst = 1'b0;
        i_valid = 1'b1;
        i_data_bus = 32'b10100100010000100000100000010000;
        i_en = 1'b1;
        i_cmd = 5'b10011;
        
        // 7 input active -- right shift 5 bit
        #10
        $display("o_data_bus: %h\n", o_data_bus);
        rst = 1'b0;
        i_valid = 1'b1;
        i_data_bus = 32'b10100100010000100000100000010000;
        i_en = 1'b1;
        i_cmd = 5'b10100;
        
        // 8 input active -- right shift 6 bit
        #10
        $display("o_data_bus: %h\n", o_data_bus);
        rst = 1'b0;
        i_valid = 1'b1;
        i_data_bus = 32'b10100100010000100000100000010000;
        i_en = 1'b1;
        i_cmd = 5'b10101;
        
        // 9 input active -- right shift 7 bit
        #10
        rst = 1'b0;
        i_valid = 1'b1;
        i_data_bus = 32'b10100100010000100000100000010000;
        i_en = 1'b1;
        i_cmd = 5'b10110;

        // 10 input active -- right shift 8 bit
        #10
        $display("o_data_bus: %h\n", o_data_bus);
        rst = 1'b0;
        i_valid = 1'b1;
        i_data_bus = 32'b10100100010000100000100000010000;
        i_en = 1'b1;
        i_cmd = 5'b10111;

        // 11 input active -- right shift 9 bit
        #10
        $display("o_data_bus: %h\n", o_data_bus);
        rst = 1'b0;
        i_valid = 1'b1;
        i_data_bus = 32'b10100100010000100000100000010000;
        i_en = 1'b1;
        i_cmd = 5'b11000;
    
               // 12 input active -- right shift 10 bit
        #10
        $display("o_data_bus: %h\n", o_data_bus);
        rst = 1'b0;
        i_valid = 1'b1;
        i_data_bus = 32'b10100100010000100000100000010000;
        i_en = 1'b1;
        i_cmd = 5'b11001;
        
        // 13 input active -- right shift 11 bit
        #10
        $display("o_data_bus: %h\n", o_data_bus);
        rst = 1'b0;
        i_valid = 1'b1;
        i_data_bus = 32'b10100100010000100000100000010000;
        i_en = 1'b1;
        i_cmd = 5'b11010;
        
        // 14 input active -- right shift 12 bit
        #10
        $display("o_data_bus: %h\n", o_data_bus);
        rst = 1'b0;
        i_valid = 1'b1;
        i_data_bus = 32'b10100100010000100000100000010000;
        i_en = 1'b1;
        i_cmd = 5'b11011;
        
        // 15 input active -- right shift 13 bit
        #10
        $display("o_data_bus: %h\n", o_data_bus);
        rst = 1'b0;
        i_valid = 1'b1;
        i_data_bus = 32'b10100100010000100000100000010000;
        i_en = 1'b1;
        i_cmd = 5'b11100;
        
        // 16 input active -- right shift 14 bit
        #10
        $display("o_data_bus: %h\n", o_data_bus);
        rst = 1'b0;
        i_valid = 1'b1;
        i_data_bus = 32'b10100100010000100000100000010000;
        i_en = 1'b1;
        i_cmd = 5'b11101;
        
        // 17 input active -- right shift 15 bit
        #10
        rst = 1'b0;
        i_valid = 1'b1;
        i_data_bus = 32'b10100100010000100000100000010000;
        i_en = 1'b1;
        i_cmd = 5'b11110;

        // 18 input active -- right shift 16 bit
        #10
        $display("o_data_bus: %h\n", o_data_bus);
        rst = 1'b0;
        i_valid = 1'b1;
        i_data_bus = 32'b10100100010000100000100000010000;
        i_en = 1'b1;
        i_cmd = 5'b11111;

        // 19 input active -- no shift
        #10
        $display("o_data_bus: %h\n", o_data_bus);
        rst = 1'b0;
        i_valid = 1'b1;
        i_data_bus = 32'b10100100010000100000100000010000;
        i_en = 1'b1;
        i_cmd = 5'b00000;

        #10
        $display("o_data_bus: %h\n", o_data_bus);
        $stop;
    end

    // instantiate DUT (device under test)
    bit_selection_32x16_seq #(
		.DATA_WIDTH(DATA_WIDTH),
        .COMMAND_WIDTH(COMMAND_WIDTH)
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

    always #5 clk = ~clk;

endmodule