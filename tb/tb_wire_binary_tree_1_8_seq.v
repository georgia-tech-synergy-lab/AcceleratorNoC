`timescale 1ns / 1ps
/*
    Top Module:  tb_wire_binary_tree_1_8_seq
    Data:        Only data width matters.
    Format:      keeping the input format unchange
    Timing:      Sequential Logic
    Dummy Data:  {DATA_WIDTH{1'b0}}

    Parameter:   NUM_INPUT_DATA could be arbitrary integer

    Function:    OR all bit of input together

                     i_data_latch
                           |
                         |¯¯¯|
                         |___|
                        /     \
                       /       \
                 /....            ....\
                /                      \
               v                        v
             |¯¯¯|        ...         |¯¯¯|
             |___|        ...         |___|
            /     \                  /     \
           /       \                /       \
          /         \              /         \
         /           \            /           \
       |¯¯¯|       |¯¯¯|  ...   |¯¯¯|       |¯¯¯|
       |___|       |___|  ...   |___|       |___|
        | |         | |          | |         | |
        v v         v v          v v         v v
      o_data_bus(all output ports show the same data)


    Author:      Jianming Tong (jianming.tong@gatech.edu)
*/

module tb_wire_binary_tree_1_8_seq();

    parameter DATA_WIDTH = 8;      // could be arbitrary number
    parameter NUM_OUTPUT_DATA  = 8; // must be power of 2.
    parameter NUM_INPUT_DATA = 1;

    //parameter
    parameter WIDTH_INPUT_DATA = NUM_INPUT_DATA*DATA_WIDTH;
    parameter WIDTH_OUTPUT_DATA = NUM_OUTPUT_DATA*DATA_WIDTH;

    // interface
    reg                                        clk;
    reg                                        rst_n;

    reg  [NUM_INPUT_DATA-1:0]                  i_valid;
    reg  [WIDTH_INPUT_DATA-1:0]                i_data_bus;

    wire [NUM_OUTPUT_DATA-1:0]                 o_valid;
    wire [WIDTH_OUTPUT_DATA-1:0]               o_data_bus; // {o_data_a, o_data_b}

    reg                                        i_en;

    initial begin
        clk = 0;
        i_en = 1'b1;
        i_valid = {NUM_INPUT_DATA{1'b1}};
        rst_n= 1'b1;
        #20
        rst_n= 1'b0;
        #20
        rst_n= 1'b1;
        i_data_bus = {8'b10010010};
        #20
        i_data_bus = {8'b10001000};
        #20
        i_data_bus = {8'b11111111};
        #20

        $stop;
    end

    // instantiate DUT (device under test)
    wire_binary_tree_1_8_seq#(
        .DATA_WIDTH(DATA_WIDTH),
        .NUM_OUTPUT_DATA(NUM_OUTPUT_DATA),
        .NUM_INPUT_DATA(NUM_INPUT_DATA))
    dut(
        .clk(clk),
        .rst_n(rst_n),
        .i_valid(i_valid),
        .i_data_bus(i_data_bus),
        .o_valid(o_valid),
        .o_data_bus(o_data_bus),
        .i_en(i_en)
    );

    always #5 clk=~clk;

endmodule