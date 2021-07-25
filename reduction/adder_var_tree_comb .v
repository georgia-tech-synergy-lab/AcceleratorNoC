`timescale 1ns / 1ps
/*
    Top Module:  adder_var_tree_comb
    Data:        Only data width matters.
    Format:      Output has LEVEL more bit than input data
    Timing:      Combinational Logic
    Dummy Data:  {(DATA_WIDTH+LEVELx){1'b0}}

    Parameter:   NUM_INPUT_DATA could be arbitrary integer.
                 When it's not power of 2, redundent adder will not be instantiated.

    Function:    sum all input together

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
                      o_data_bus(summation of all input data)

    Author:      Jianming Tong (jianming.tong@gatech.edu)
*/


module adder_var_tree_comb#(
    parameter NUM_INPUT_DATA = 300,
    parameter DATA_WIDTH = 16
)(
    // data signals
    i_valid,        // valid input data signal
    i_data_bus,     // input data bus coming into distribute switch

    o_valid,        // output valid
    o_data_bus,     // output data

    // control signals
    i_en            // distribute switch enable
);
    // inner parameter and logic
    localparam   NUM_LEVEL = $clog2(NUM_INPUT_DATA); // Note: inner ceiling: e.g. $clog2(18) = 5, (2^5=32).
    // use ceiling to add 1 extra level to support all possible input cases (input not exactly 2^n).
    // If the input is exactly 2^n, then the num_switch in the last level will be 0.

    // interface
    input  [NUM_INPUT_DATA-1:0]                  i_valid;
    input  [NUM_INPUT_DATA*DATA_WIDTH-1:0]       i_data_bus;

    output                                       o_valid;
    output [DATA_WIDTH+NUM_LEVEL-1:0]            o_data_bus; //{o_data_a, o_data_b}

    input                                        i_en;

    // define output wire for all switches of different level.
    genvar i,j;
    generate

    for (i =0; i< NUM_LEVEL+1; i=i+1)
    begin: wire_level
        // calculate # of switch in level i
        // When i=0, NUM_SWITCH_LEVEL stands for the # of Input DATA
        // image the input is the output from high level of the previous adder tree.
        localparam NUM_SWITCH_SHIFT =  NUM_INPUT_DATA >> i;
        localparam NOT_ADD_EXTRA_SWITCH_THIS_LEVEL = ((NUM_INPUT_DATA - ((NUM_INPUT_DATA >> i) << i)) == 0);
        localparam NUM_SWITCH_LEVEL = (NOT_ADD_EXTRA_SWITCH_THIS_LEVEL)? NUM_SWITCH_SHIFT: (NUM_SWITCH_SHIFT + 1);

        // define the output wire for switches of level i
        wire       [DATA_WIDTH+i-1:0]            inner_wire_data[0:NUM_SWITCH_LEVEL-1];
        wire                                     inner_wire_valid[0:NUM_SWITCH_LEVEL-1];
    end

    // output latch
    reg    [DATA_WIDTH+NUM_LEVEL-1:0]            o_data_bus_inner;
    reg                                          o_valid_inner;

    // connect i_data_bus to input of adder tree.
    for (j = 0; j< NUM_INPUT_DATA; j=j+1)
    begin: assign_first_stage_wire
        assign wire_level[0].inner_wire_data[j] = i_data_bus[j*DATA_WIDTH+:DATA_WIDTH];
        assign wire_level[0].inner_wire_valid[j] = i_valid[j+:1];
    end

    //instantiate adder tree
    for (i = 0; i< NUM_LEVEL; i=i+1)
    begin: adder_tree_level
        for (j = 0; j< wire_level[i+1].NUM_SWITCH_LEVEL; j=j+1)
        begin: adder_in_level
            if( j==(wire_level[i+1].NUM_SWITCH_LEVEL -1) && ((wire_level[i].NUM_SWITCH_LEVEL >> 1) != wire_level[i+1].NUM_SWITCH_LEVEL) )
            begin
                adder_var_comb #(
                    .DATA_WIDTH(DATA_WIDTH+i)
                ) adder(
                    .i_valid({{1'b1},wire_level[i].inner_wire_valid[2*j]}),
                    .i_data_bus({{(DATA_WIDTH+i){1'b0}}, wire_level[i].inner_wire_data[2*j]}),
                    .o_valid(wire_level[i+1].inner_wire_valid[j]),
                    .o_data_bus(wire_level[i+1].inner_wire_data[j]),
                    .i_en(i_en)
                );
            end
            else
            begin
                adder_var_comb #(
                    .DATA_WIDTH(DATA_WIDTH+i)
                ) adder(
                    .i_valid({wire_level[i].inner_wire_valid[2*j+1],wire_level[i].inner_wire_valid[2*j]}),
                    .i_data_bus({wire_level[i].inner_wire_data[2*j+1], wire_level[i].inner_wire_data[2*j]}),
                    .o_valid(wire_level[i+1].inner_wire_valid[j]),
                    .o_data_bus(wire_level[i+1].inner_wire_data[j]),
                    .i_en(i_en)
                );
            end
        end
    end

    always @(*)
    begin
        o_data_bus_inner = wire_level[NUM_LEVEL].inner_wire_data[0];
        o_valid_inner = wire_level[NUM_LEVEL].inner_wire_valid[0];
    end

    endgenerate


    // output logic
    assign o_data_bus = o_data_bus_inner;
    assign o_valid = o_valid_inner;
endmodule