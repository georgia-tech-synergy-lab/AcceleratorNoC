`timescale 1ns / 1ps
/*
    Top Module:  merge_tree_autopick_multi_output_comb
    Data:        Only data width matters.
    Format:      keeping the input format unchange
    Timing:      Combinational Logic
    Dummy Data:  {DATA_WIDTH{1'b0}}

    Parameter:   NUM_INPUT_DATA could be arbitrary integer
                 ! The NUM_OUTPUT_DATA determines the # of level

    Function:    output 1 valid input from all input ports
                 When multiple input valid -> input with higher
                 address in the input bus has higher priority.

      \     /     \     / ... \     /     \     /      ---
       v   v       v   v  ...  v   v       v   v        ^
       |¯¯¯|       |¯¯¯|  ...  |¯¯¯|       |¯¯¯|        |
       |___|       |___|  ...  |___|       |___|        |
         v           v    ...     v           v         |
          \         /     ...      \         /          |
           \       /      ...       \       /           |
            \     /       ...        \     /            |
             v   v        ...         v   v
             |¯¯¯|        ...         |¯¯¯|          NUM_LEVEL=$clog2(NUM_INPUT_DATA) - $clog2(NUM_OUTPUT_DATA);
             |___|        ...         |___|
               v                        v               |
                \                      /                |
                 \                    /                 |
                  ...              ...                  |
                   ...           ...                    |
                    ...        ...                      v
                      v        v                       ---
          o_data_bus(pick several valid input from all input data)


    Author:      Jianming Tong (jianming.tong@gatech.edu)
*/


module merge_tree_autopick_multi_output_comb#(
    parameter NUM_INPUT_DATA = 300,
    parameter NUM_OUTPUT_DATA = 4,
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
    // localparam
    localparam  NUM_LEVEL = $clog2(NUM_INPUT_DATA) - $clog2(NUM_OUTPUT_DATA);
            // --- Note: inner ceiling: e.g. $clog2(18) = 5, (2^5=32).

    // interface
    input  [NUM_INPUT_DATA-1:0]                  i_valid;
    input  [NUM_INPUT_DATA*DATA_WIDTH-1:0]       i_data_bus;

    output [NUM_OUTPUT_DATA-1:0]                 o_valid;
    output [NUM_OUTPUT_DATA*DATA_WIDTH-1:0]      o_data_bus; //{o_data_a, o_data_b}

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
        wire       [DATA_WIDTH-1:0]              inner_wire_data[0:NUM_SWITCH_LEVEL-1];
        wire                                     inner_wire_valid[0:NUM_SWITCH_LEVEL-1];
    end

    // output latch
    reg    [NUM_OUTPUT_DATA*DATA_WIDTH-1:0]      o_data_bus_inner;
    reg    [NUM_OUTPUT_DATA-1:0]                 o_valid_inner;

    // connect i_data_bus to input of adder tree.
    for (j = 0; j< NUM_INPUT_DATA; j=j+1)
    begin: assign_first_stage_wire
        assign wire_level[0].inner_wire_data[j] = i_data_bus[j*DATA_WIDTH+:DATA_WIDTH];
        assign wire_level[0].inner_wire_valid[j] = i_valid[j+:1];
    end

    //instantiate adder tree
    for (i = 0; i< NUM_LEVEL; i=i+1)
    begin: adder_tree_level
        localparam NUM_SWITCH_SHIFT =  NUM_INPUT_DATA >> i;
        localparam NOT_ADD_EXTRA_SWITCH_THIS_LEVEL = ((NUM_INPUT_DATA - ((NUM_INPUT_DATA >> i) << i)) == 0);
        localparam NUM_SWITCH_LEVEL = (NOT_ADD_EXTRA_SWITCH_THIS_LEVEL)? NUM_SWITCH_SHIFT: (NUM_SWITCH_SHIFT + 1);

        localparam NUM_SWITCH_SHIFT_NEXT_LEVEL =  NUM_INPUT_DATA >> (i+1);
        localparam NOT_ADD_EXTRA_SWITCH_NEXT_LEVEL = ((NUM_INPUT_DATA - ((NUM_INPUT_DATA >> (i+1)) << (i+1))) == 0);
        localparam NUM_SWITCH_NEXT_LEVEL = (NOT_ADD_EXTRA_SWITCH_NEXT_LEVEL)? NUM_SWITCH_SHIFT_NEXT_LEVEL: (NUM_SWITCH_SHIFT_NEXT_LEVEL + 1);

        for (j = 0; j< NUM_SWITCH_NEXT_LEVEL; j=j+1)
        begin: adder_in_level
            if( j==(NUM_SWITCH_NEXT_LEVEL -1) && ((NUM_SWITCH_LEVEL >> 1) != NUM_SWITCH_NEXT_LEVEL) )
            begin
                merge_2x1_autopick_comb #(
                    .DATA_WIDTH(DATA_WIDTH)
                ) merger(
                    .i_valid({{1'b1},wire_level[i].inner_wire_valid[2*j]}),
                    .i_data_bus({{DATA_WIDTH{1'b0}}, wire_level[i].inner_wire_data[2*j]}),
                    .o_valid(wire_level[i+1].inner_wire_valid[j]),
                    .o_data_bus(wire_level[i+1].inner_wire_data[j]),
                    .i_en(i_en)
                );
            end
            else
            begin
                merge_2x1_autopick_comb #(
                    .DATA_WIDTH(DATA_WIDTH)
                ) merger(
                    .i_valid({wire_level[i].inner_wire_valid[2*j+1],wire_level[i].inner_wire_valid[2*j]}),
                    .i_data_bus({wire_level[i].inner_wire_data[2*j+1], wire_level[i].inner_wire_data[2*j]}),
                    .o_valid(wire_level[i+1].inner_wire_valid[j]),
                    .o_data_bus(wire_level[i+1].inner_wire_data[j]),
                    .i_en(i_en)
                );
            end
        end
    end

    if(NUM_OUTPUT_DATA==1)
    begin
        always @(*)
        begin
            o_data_bus_inner = wire_level[NUM_LEVEL].inner_wire_data[0];
            o_valid_inner = wire_level[NUM_LEVEL].inner_wire_valid[0];
        end
    end
    else
    begin
        for(i=0; i< NUM_OUTPUT_DATA; i=i+1)
        begin
            always @(*)
            begin
                o_data_bus_inner[i*DATA_WIDTH+:DATA_WIDTH] = wire_level[NUM_LEVEL].inner_wire_data[i];
                o_valid_inner[i+:1] = wire_level[NUM_LEVEL].inner_wire_valid[i];
            end
        end
    end

    endgenerate


    // output logic
    assign o_data_bus = o_data_bus_inner;
    assign o_valid = o_valid_inner;
endmodule