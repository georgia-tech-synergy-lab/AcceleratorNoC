`timescale 1ns / 1ps
/*
    Top Module:  tb_or_tree_comb
    Data:        Only data width matters.
    Format:      keeping the input format unchange
    Timing:      Combinational Logic
    Dummy Data:  {DATA_WIDTH{1'b0}}

    Parameter:   NUM_INPUT_DATA could be arbitrary integer

    Function:    OR all bit of input together
     MSB                                        LSB
      \     /     \     / ... \     /     \     / i_data_latch[0]
       v   v       v   v  ...  v   v       v   v
       |¯¯¯|       |¯¯¯|  ...  |¯¯¯|       |¯¯¯|
       |___|       |___|  ...  |___|       |___|
         v           v    ...     v           v
          \         /     ...      \         /
           \       /      ...       \       /
            \     /       ...        \     /
             v   v        ...         v   v
             |¯¯¯|        ...         |¯¯¯|
             |___|        ...         |___|
               v                        v
                \                      /
                 \                    /
                  ...              ...
                   ...           ...
                    ...        ...
                       \       /
                        \     /
                         v   v
                         |¯¯¯|
                         |___|
                           |
                           v
                      o_data_bus(logic AND of all bits of input data)

    Author:      Jianming Tong (jianming.tong@gatech.edu)
*/


module tb_or_tree_comb();

    parameter NUM_INPUT_DATA = 8;
    parameter DATA_WIDTH = 1;

    // timing signals
    reg                                         clk;

    // interface
    reg   [NUM_INPUT_DATA-1:0]                  i_valid;
    reg   [NUM_INPUT_DATA-1:0]                  i_data_bus;

    wire                                        o_valid;
    wire                                        o_data_bus; //{o_data_a, o_data_b}

    reg                                         i_en;

    // inner logic
    reg   signed                                i_data_bus_inner[NUM_INPUT_DATA-1:0];

    integer i;
    initial begin
        i_en = 1'b1;
        i_valid = {NUM_INPUT_DATA{1'b1}};
        clk = 0;
        i_data_bus = {8'b10010010};
        #20
        i_data_bus = {8'b10001000};
        #20
        i_data_bus = {8'b11111111};
        #20

        $stop;
    end

    // instantiate DUT (device under test)
    or_tree_comb#(
        .NUM_INPUT_DATA(NUM_INPUT_DATA),
        .DATA_WIDTH(DATA_WIDTH))
    dut(
        .i_valid(i_valid),
        .i_data_bus(i_data_bus),
        .o_valid(o_valid),
        .o_data_bus(o_data_bus),
        .i_en(i_en)
    );

    always #5 clk=~clk;

endmodule