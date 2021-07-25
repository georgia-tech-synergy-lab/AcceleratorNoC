`timescale 1ns / 1ps
/*
    Top Module:  tb_bit_selection_16x8_seq
    Data:        Only data width matters.
    Format:      keeping the input format unchange
    Timing:      Sequential Logic, one clock cycle latency
    Dummy Data:  {DATA_WIDTH{1'b0}}

    Function:    select 8 continous bits out of 16 bits --> total 8 cases (if need shift) -> 3-bit command.
                 extra 1 bit command to control whether shift is needed.
                 So 4-bit command in total.

    Author:      Jianming Tong (jianming.tong@gatech.edu)
*/

module tb_bit_selection_16x8_seq();

    parameter DATA_WIDTH = 16;                        // could only be 16
    parameter COMMAND_WIDTH = $clog2(DATA_WIDTH);     // could only be 3+1 = 4
    parameter OUT_DATA_WIDTH = DATA_WIDTH >> 1;

    // interface
    reg                                                        clk;
    reg                                                        rst_n;

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
        # o_data_bus: 42
        #
    */

    initial begin
        clk = 1'b0;
        // 1 not enable at start
        rst_n = 1'b1;
        i_valid = 2'b00;
        i_data_bus = 16'b1010010001000010;
        i_en = 1'b1;
        i_cmd = 4'b1000;

        // 2 rst_n active;
        #10
        $display("o_data_bus: %h\n", o_data_bus);
        rst_n = 1'b0;
        i_valid = 1'b1;
        i_data_bus = 16'b1010010001000010;
        i_en = 1'b1;
        i_cmd = 4'b1001;

        // 3 input active -- right shift 1 bit
        #10
        $display("o_data_bus: %h\n", o_data_bus);
        rst_n = 1'b1;
        i_valid = 1'b1;
        i_data_bus = 16'b1010010001000010;
        i_en = 1'b1;
        i_cmd = 4'b1000;

        // 4 input active -- right shift 2 bit
        #10
        $display("o_data_bus: %h\n", o_data_bus);
        rst_n = 1'b1;
        i_valid = 1'b1;
        i_data_bus = 16'b1010010001000010;
        i_en = 1'b1;
        i_cmd = 4'b1001;

        // 5 input active -- right shift 3 bit
        #10
        $display("o_data_bus: %h\n", o_data_bus);
        rst_n = 1'b1;
        i_valid = 1'b1;
        i_data_bus = 16'b1010010001000010;
        i_en = 1'b1;
        i_cmd = 4'b1010;

        // 6 input active -- right shift 4 bit
        #10
        $display("o_data_bus: %h\n", o_data_bus);
        rst_n = 1'b1;
        i_valid = 1'b1;
        i_data_bus = 16'b1010010001000010;
        i_en = 1'b1;
        i_cmd = 4'b1011;

        // 7 input active -- right shift 5 bit
        #10
        $display("o_data_bus: %h\n", o_data_bus);
        rst_n = 1'b1;
        i_valid = 1'b1;
        i_data_bus = 16'b1010010001000010;
        i_en = 1'b1;
        i_cmd = 4'b1100;

        // 8 input active -- right shift 6 bit
        #10
        $display("o_data_bus: %h\n", o_data_bus);
        rst_n = 1'b1;
        i_valid = 1'b1;
        i_data_bus = 16'b1010010001000010;
        i_en = 1'b1;
        i_cmd = 4'b1101;

        // 9 input active -- right shift 7 bit
        #10
        rst_n = 1'b1;
        i_valid = 1'b1;
        i_data_bus = 16'b1010010001000010;
        i_en = 1'b1;
        i_cmd = 4'b1110;

        // 10 input active -- right shift 8 bit
        #10
        $display("o_data_bus: %h\n", o_data_bus);
        rst_n = 1'b1;
        i_valid = 1'b1;
        i_data_bus = 16'b1010010001000010;
        i_en = 1'b1;
        i_cmd = 4'b1111;

        // 11 input active -- no shift
        #10
        $display("o_data_bus: %h\n", o_data_bus);
        rst_n = 1'b1;
        i_valid = 1'b1;
        i_data_bus = 16'b1010010001000010;
        i_en = 1'b1;
        i_cmd = 4'b0000;

        #10
        $display("o_data_bus: %h\n", o_data_bus);
        $stop;
    end

    // instantiate DUT (device under test)
    bit_selection_16x8_seq #(
        .DATA_WIDTH(DATA_WIDTH),
        .COMMAND_WIDTH(COMMAND_WIDTH)
      ) dut(
        .clk(clk),
        .rst_n(rst_n),
        .i_valid(i_valid),
        .i_data_bus(i_data_bus),
        .o_valid(o_valid),
        .o_data_bus(o_data_bus),
        .i_en(i_en),
        .i_cmd(i_cmd)
    );

    always #5 clk = ~clk;

endmodule