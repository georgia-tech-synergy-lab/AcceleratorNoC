`timescale 1ns / 1ps
/////////////////////////////////////////////////////////////
// Top Module:  tb_bit_selection_8x4_seq
// Data:        Only data width matters.
// Format:      keeping the input format unchange
// Timing:      Sequential Logic, one clock cycle latency
// Dummy Data:  {DATA_WIDTH{1'b0}}
// 
// Function:    select 4 continous bits out of 8 bits --> total 4 cases (if need shift) -> 2-bit command.
//              extra 1 bit command to control whether shift is needed.
//              So 3-bit command in total.
//
// Author:      Jianming Tong (jianming.tong@gatech.edu)
/////////////////////////////////////////////////////////////

module tb_bit_selection_8x4_seq();
	
    parameter DATA_WIDTH = 8;                         // could only be 8
	parameter COMMAND_WIDTH = $clog2(DATA_WIDTH);     // could only be 2+1 = 3
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
        expected output
        # o_data_bus: 0
        # 
        # o_data_bus: 0
        # 
        # o_data_bus: 8
        # 
        # o_data_bus: 8
        # 
        # o_data_bus: 6
        # 
        # o_data_bus: 4
        # 
        # o_data_bus: 5
        # 
    */

    initial begin
        clk = 1'b0;
        // 1 not enable at start
        rst = 1'b1;
        i_valid = 2'b00;
        i_data_bus = {(DATA_WIDTH>>2){4'h0}};
        i_en = 1'b1;
        i_cmd = 3'b100;

        // 2 rst active;
        #10
        $display("o_data_bus: %h\n", o_data_bus);
        rst = 1'b1;
        i_valid = 1'b1;
        i_data_bus = {(DATA_WIDTH>>2){4'h0}};
        i_en = 1'b1;
        i_cmd = 3'b100;
        
        // 3 input active -- right shift 1 bit
        #10
        $display("o_data_bus: %h\n", o_data_bus);
        rst = 1'b0;
        i_valid = 1'b1;
        i_data_bus = {(DATA_WIDTH>>2){4'h1}};
        i_en = 1'b1;
        i_cmd = 3'b100;
    
        // 4 input active -- right shift 2 bit
        #10
        $display("o_data_bus: %h\n", o_data_bus);
        rst = 1'b0;
        i_valid = 1'b1;
        i_data_bus = {(DATA_WIDTH>>2){4'h2}};
        i_en = 1'b1;
        i_cmd = 3'b101;
        
        // 5 input active -- right shift 3 bit
        #10
        $display("o_data_bus: %h\n", o_data_bus);
        rst = 1'b0;
        i_valid = 1'b1;
        i_data_bus = {(DATA_WIDTH>>2){4'h3}};
        i_en = 1'b1;
        i_cmd = 3'b110;
        
        // 6 input active -- right shift 4 bit
        #10
        $display("o_data_bus: %h\n", o_data_bus);
        rst = 1'b0;
        i_valid = 1'b1;
        i_data_bus = {(DATA_WIDTH>>2){4'h4}};
        i_en = 1'b1;
        i_cmd = 3'b111;
        
        // 7 input active -- no right shift
        #10
        $display("o_data_bus: %h\n", o_data_bus);
        rst = 1'b0;
        i_valid = 1'b1;
        i_data_bus = {(DATA_WIDTH>>2){4'h5}};
        i_en = 1'b1;
        i_cmd = 3'b000;

        #10
        $display("o_data_bus: %h\n", o_data_bus);
        $stop;
    end

    // instantiate DUT (device under test)
    bit_selection_8x4_seq #(
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