`timescale 1ns / 1ps
/*
    Top Module:  adder_seq
    Data:        Only data width matters.
    Format:      Output shares the same length with input [cannot handle overflow]
    Timing:      Sequential Logic
    Reset:       Asynchronized Reset [Low Reset]
    Dummy Data:  {DATA_WIDTH{1'b0}}

    Function:

          i_data_bus(data_a)        i_data_bus(data_b)
       [DATA_WIDTH+:DATA_WIDTH]    [DATA_WIDTH-1:0]
                             \     /
                              v   v
                              |¯¯¯| <--- i_valid[0]--data_b;
                              |___| <--- i_valid[1]--data_a;
                                |
                                v
                            o_data_bus[DATA_WIDTH-1:0] = a + b
                                                  |
                                                  v
                                              same length with input

    Author:      Jianming Tong (jianming.tong@gatech.edu)
*/


module adder_seq#(
    parameter DATA_WIDTH = 16
)(
    // timeing signals
    clk,
    rst_n,

    // data signals
    i_valid,        // valid input data signal
    i_data_bus,     // input data bus coming into adder

    o_valid,        // output valid
    o_data_bus,     // output data

    // control signals
    i_en            // adder enable
);
    // timing signals
    input                          clk;
    input                          rst_n;

    // interface
    input  [2*DATA_WIDTH-1:0]      i_data_bus;
    input  [1:0]                   i_valid;

    output [DATA_WIDTH-1:0]        o_data_bus;
    output                         o_valid;

    input                          i_en;

    // inner logic
    reg                            calcuate_en;
    reg    [DATA_WIDTH-1:0]        o_data_bus_inner;
    reg                            o_valid_inner;

    always@(*)
    begin
        calcuate_en <= i_valid[0] & i_valid[1] & i_en;
    end

    always@(posedge clk or negedge rst_n)
    begin
        if(!rst_n)
        begin
            o_data_bus_inner <= {(DATA_WIDTH){1'b0}};
            o_valid_inner <= 1'b0;
        end
        else if(i_en)
        begin
            o_data_bus_inner <= (calcuate_en)? (i_data_bus[0+:DATA_WIDTH] + i_data_bus[DATA_WIDTH+:DATA_WIDTH]):{(DATA_WIDTH){1'b0}};
            o_valid_inner <= (calcuate_en)? 1'b1:1'b0;
        end
        else
        begin
            o_valid_inner <= 1'b0;
            o_data_bus_inner <= {(DATA_WIDTH){1'b0}};
        end
    end

    assign o_data_bus = o_data_bus_inner;
    assign o_valid = o_valid_inner;

endmodule
