`timescale 1ns / 1ps
/*
    Top Module:  tb_merge_tree_autopick_multi_output_comb
    Data:        Only data width matters.
    Format:      keeping the input format unchange
    Timing:      Combinational Logic
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
                      o_data_bus(only pick 1 valid from all input ports)

    Author:      Jianming Tong (jianming.tong@gatech.edu)
*/


module tb_merge_tree_autopick_multi_output_comb();

    parameter NUM_INPUT_DATA = 4;
    parameter NUM_OUTPUT_DATA = 2;
    parameter DATA_WIDTH = 4;

    // timing signals
    reg                                         clk;

    // interface
    reg   [NUM_INPUT_DATA-1:0]                  i_valid;
    reg   [NUM_INPUT_DATA*DATA_WIDTH-1:0]       i_data_bus;

    wire  [NUM_OUTPUT_DATA-1:0]                 o_valid;
    wire  [NUM_OUTPUT_DATA*DATA_WIDTH-1:0]      o_data_bus; //{o_data_a, o_data_b}

    reg                                         i_en;

    initial begin
        clk = 1'b0;
        // not enable
        i_en = 1'b0;
        i_valid = {1'b0, 1'b0, 1'b0, 1'b1};
        i_data_bus = {{(DATA_WIDTH>>2){4'h3}}, {(DATA_WIDTH>>2){4'h2}}, {(DATA_WIDTH>>2){4'h1}}, {(DATA_WIDTH>>2){4'h0}}};

        // Only lowest input valid -> output 0 (low valid)
        i_en = 1'b1;
        i_valid = {1'b0, 1'b0, 1'b0, 1'b1};
        i_data_bus = {{(DATA_WIDTH>>2){4'h3}}, {(DATA_WIDTH>>2){4'h2}}, {(DATA_WIDTH>>2){4'h1}}, {(DATA_WIDTH>>2){4'h0}}};

        // Only highest input valid -> output 2 (high valid)
        #20
        i_en = 1'b1;
        i_valid = {1'b0, 1'b1, 1'b0, 1'b0};
        i_data_bus = {{(DATA_WIDTH>>2){4'h3}}, {(DATA_WIDTH>>2){4'h2}}, {(DATA_WIDTH>>2){4'h1}}, {(DATA_WIDTH>>2){4'h0}}};

        // Multiple valid input signle -> output 3 ,1 (both valid)
        #20
        i_en = 1'b1;
        i_valid = {1'b1, 1'b0, 1'b1, 1'b0};
        i_data_bus = {{(DATA_WIDTH>>2){4'h3}}, {(DATA_WIDTH>>2){4'h2}}, {(DATA_WIDTH>>2){4'h1}}, {(DATA_WIDTH>>2){4'h0}}};

        #20
        $stop;
    end


    // instantiate DUT (device under test)
    merge_tree_autopick_multi_output_comb#(
        .NUM_INPUT_DATA(NUM_INPUT_DATA),
        .DATA_WIDTH(DATA_WIDTH),
        .NUM_OUTPUT_DATA(NUM_OUTPUT_DATA))
    dut(
        .i_valid(i_valid),
        .i_data_bus(i_data_bus),
        .o_valid(o_valid),
        .o_data_bus(o_data_bus),
        .i_en(i_en)
    );

    always #5 clk=~clk;


endmodule