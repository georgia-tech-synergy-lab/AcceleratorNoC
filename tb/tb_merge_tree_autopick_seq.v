`timescale 1ns / 1ps
/*
    Top Module:  tb_merge_tree_autopick_seq
    Data:        Only data width matters.
    Format:      keeping the input format unchange
    Timing:      Sequential Logic
    Reset:       Asynchronized Reset [Low Reset]
    Dummy Data:  {DATA_WIDTH{1'b0}}

    Parameter:   NUM_INPUT_DATA could be arbitrary integer

    Function:   output 1 valid input from all input ports
                When multiple input valid -> input with higher
                address in the input bus has higher priority.

      \     /     \     / ... \     /     \     /
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
                      o_data_bus(only pick 1 valid from all input data)

    Author:      Jianming Tong (jianming.tong@gatech.edu)
*/

module tb_merge_tree_autopick_seq();

    parameter NUM_INPUT_DATA = 4;
    parameter DATA_WIDTH = 4;

    // timing signals
    reg                                         clk;
    reg                                         rst_n;

    // interface
    reg   [NUM_INPUT_DATA-1:0]                  i_valid;
    reg   [NUM_INPUT_DATA*DATA_WIDTH-1:0]       i_data_bus;

    wire                                        o_valid;
    wire  [DATA_WIDTH-1:0]                      o_data_bus; //{o_data_a, o_data_b}

    reg                                         i_en;

    initial begin
        clk = 1'b0;
        // not enable
        rst_n = 1'b1;
        i_en = 1'b0;
        i_valid = {1'b0, 1'b0, 1'b0, 1'b1};
        i_data_bus = {{(DATA_WIDTH>>2){4'h3}}, {(DATA_WIDTH>>2){4'h2}}, {(DATA_WIDTH>>2){4'h1}}, {(DATA_WIDTH>>2){4'h0}}};

        // reset
        #20
        rst_n = 1'b0;
        i_en = 1'b1;
        i_valid = {1'b0, 1'b0, 1'b0, 1'b1};
        i_data_bus = {{(DATA_WIDTH>>2){4'h3}}, {(DATA_WIDTH>>2){4'h2}}, {(DATA_WIDTH>>2){4'h1}}, {(DATA_WIDTH>>2){4'h0}}};

        // Only lowest input valid -> output 0
        #20
        rst_n = 1'b1;
        i_en = 1'b1;
        i_valid = {1'b0, 1'b0, 1'b0, 1'b1};
        i_data_bus = {{(DATA_WIDTH>>2){4'h3}}, {(DATA_WIDTH>>2){4'h2}}, {(DATA_WIDTH>>2){4'h1}}, {(DATA_WIDTH>>2){4'h0}}};

        // Only highest input valid -> output 2
        #20
        rst_n = 1'b1;
        i_en = 1'b1;
        i_valid = {1'b0, 1'b1, 1'b0, 1'b0};
        i_data_bus = {{(DATA_WIDTH>>2){4'h3}}, {(DATA_WIDTH>>2){4'h2}}, {(DATA_WIDTH>>2){4'h1}}, {(DATA_WIDTH>>2){4'h0}}};

        // Multiple valid input signle -> output 3 from {valid 1 & 3}
        #20
        rst_n = 1'b1;
        i_en = 1'b1;
        i_valid = {1'b1, 1'b0, 1'b1, 1'b0};
        i_data_bus = {{(DATA_WIDTH>>2){4'h3}}, {(DATA_WIDTH>>2){4'h2}}, {(DATA_WIDTH>>2){4'h1}}, {(DATA_WIDTH>>2){4'h0}}};

        #30
        $stop;
    end


    // instantiate DUT (device under test)
    merge_tree_autopick_seq#(
        .NUM_INPUT_DATA(NUM_INPUT_DATA),
        .DATA_WIDTH(DATA_WIDTH))
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