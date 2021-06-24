`timescale 1ns / 1ps
/////////////////////////////////////////////////////////////
// Top Module:  tb_bit_selection_16x8_comb
// Data:        Only data width matters.
// Format:      keeping the input format unchange
// Timing:      Combinational Logic
// Dummy Data:  {DATA_WIDTH{1'b0}}
// 
// Function:    select 8 continous bits out of 16 bits --> total 8 cases (if need shift) -> 3-bit command.
// 
// Author:      Jianming Tong (jianming.tong@gatech.edu)
/////////////////////////////////////////////////////////////

module tb_bit_selection_16x8_comb();
	
    parameter DATA_WIDTH = 16;                        // could only be 16
	parameter COMMAND_WIDTH = $clog2(DATA_WIDTH) -1;  // could only be 3 
	parameter OUT_DATA_WIDTH = DATA_WIDTH >> 1;
    
    // interface
	reg                                                        clk;

	reg                                                        i_valid;             
	reg    [DATA_WIDTH-1:0]                                    i_data_bus;
	
	wire                                                       o_valid;             
	wire   [OUT_DATA_WIDTH-1:0]                                o_data_bus; //{o_data_a, o_data_b}

	reg                                                        i_en;
	reg    [COMMAND_WIDTH-1:0]                                 i_cmd;

    /*
        expected output
        # o_data_bus: 00
        # 
        # o_data_bus: 21
        # 
        # o_data_bus: 21
        # 
        # o_data_bus: 10
        # 
        # o_data_bus: 88
        # 
        # o_data_bus: 44
        # 
        # o_data_bus: 22
        # 
        # o_data_bus: 48
        # 
        # o_data_bus: a4
        # 
    */
    
    initial begin
        clk = 1'b0;
        // 1 not enable at start
        i_valid = 2'b00;
        i_data_bus = 16'b1010010001000010;
        i_en = 1'b1;
        i_cmd = 3'b000;

        // 2 input active -- right shift 1 bit
        #10
        $display("o_data_bus: %h\n", o_data_bus);
        i_valid = 1'b1;
        i_data_bus = 16'b1010010001000010;
        i_en = 1'b1;
        i_cmd = 3'b000;
        
        // 3 input active -- right shift 1 bit
        #10
        $display("o_data_bus: %h\n", o_data_bus);
        i_valid = 1'b1;
        i_data_bus = 16'b1010010001000010;
        i_en = 1'b1;
        i_cmd = 3'b000;
    
        // 4 input active -- right shift 2 bit
        #10
        $display("o_data_bus: %h\n", o_data_bus);
        i_valid = 1'b1;
        i_data_bus = 16'b1010010001000010;
        i_en = 1'b1;
        i_cmd = 3'b001;
        
        // 5 input active -- right shift 3 bit
        #10
        $display("o_data_bus: %h\n", o_data_bus);
        i_valid = 1'b1;
        i_data_bus = 16'b1010010001000010;
        i_en = 1'b1;
        i_cmd = 3'b010;
        
        // 6 input active -- right shift 4 bit
        #10
        $display("o_data_bus: %h\n", o_data_bus);
        i_valid = 1'b1;
        i_data_bus = 16'b1010010001000010;
        i_en = 1'b1;
        i_cmd = 3'b011;
        
        // 7 input active -- right shift 5 bit
        #10
        $display("o_data_bus: %h\n", o_data_bus);
        i_valid = 1'b1;
        i_data_bus = 16'b1010010001000010;
        i_en = 1'b1;
        i_cmd = 3'b100;
        
        // 8 input active -- right shift 6 bit
        #10
        $display("o_data_bus: %h\n", o_data_bus);
        i_valid = 1'b1;
        i_data_bus = 16'b1010010001000010;
        i_en = 1'b1;
        i_cmd = 3'b101;
        
        // 9 input active -- right shift 7 bit
        #10
        i_valid = 1'b1;
        i_data_bus = 16'b1010010001000010;
        i_en = 1'b1;
        i_cmd = 3'b110;

        // 10 input active -- right shift 8 bit
        #10
        $display("o_data_bus: %h\n", o_data_bus);
        i_valid = 1'b1;
        i_data_bus = 16'b1010010001000010;
        i_en = 1'b1;
        i_cmd = 3'b111;

        #10
        $display("o_data_bus: %h\n", o_data_bus);
        $stop;
    end

    // instantiate DUT (device under test)
    bit_selection_16x8_comb #(
		.DATA_WIDTH(DATA_WIDTH),
        .COMMAND_WIDTH(COMMAND_WIDTH)
      ) dut(
		.i_valid(i_valid),
		.i_data_bus(i_data_bus),
		.o_valid(o_valid),
		.o_data_bus(o_data_bus),
		.i_en(i_en),
		.i_cmd(i_cmd)
	);

    always #5 clk = ~clk;

endmodule