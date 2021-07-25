`timescale 1ns / 1ps
/*
    Top Module:  two_dim_input_template_comb
    Data:        Only data width matters.
    Format:      Output has 1 more bit than input
    Timing:      Combinational Logic
    Dummy Data:  {DATA_WIDTH{1'b0}}

    Function:

          i_data_bus(data_a)        i_data_bus(data_b)
       [DATA_WIDTH+:DATA_WIDTH]    [DATA_WIDTH-1:0]
                             \     /
                              v   v
                              |¯¯¯| <--- i_valid[0]--data_b;
                              |___| <--- i_valid[1]--data_a;
                             /     \
                            /       \
                     o_data_bus   o_data_bus
               [DATA_WIDTH-1:0]  [2*DATA_WIDTH-1:DATA_WIDTH]


                                    1 bit longer than input

    Author:      Jianming Tong (jianming.tong@gatech.edu)
*/


module two_dim_input_template_comb#(
    parameter DATA_WIDTH = 16
)(
    // data signals
    i_valid,        // valid input data signal
    i_data_bus,     // input data bus coming into adder

    o_valid,        // output valid
    o_data_bus,     // output data

    // control signals
    i_en            // adder enable
);
    // interface
    input  [DATA_WIDTH-1:0]        i_data_bus[0:1];
    input  [1:0]                   i_valid;

    output [DATA_WIDTH-1:0]        o_data_bus[0:1];
    output [1:0]                   o_valid;

    input                          i_en;

    reg    [DATA_WIDTH-1:0]        o_data_bus_reg[0:1];
    reg    [1:0]                   o_valid_reg;

    generate
    genvar i;
    for(i=0; i<2;i=i+1)
    begin
        always@(*)
        begin
            if(i_en)
            begin
                if(i_valid[i])
                begin
                    o_data_bus_reg[i] = i_data_bus[i];
                    o_valid_reg[i] = 1'b1;
                end
                else
                begin
                    o_data_bus_reg[i] = {DATA_WIDTH{1'b0}};
                    o_valid_reg[i] = 1'b0;
                end
            end
        end
    end

    for(i=0; i<2;i=i+1)
    begin
        assign o_data_bus[i] = o_data_bus_reg[i];
        assign o_valid[i] = o_valid_reg[i];
    end
    endgenerate


endmodule
