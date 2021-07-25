`timescale 1ns / 1ps
/*
    Top Module:  merge_2x1_simple_seq
    Data:        Only data width matters.
    Format:      keeping the input format unchange
    Timing:      Sequential Logic
    Reset:       Synchronized Reset [High Reset]
    Dummy Data:  {DATA_WIDTH{1'b0}}

    Function:                Branch Low                                    Branch High                                     No Branch

          i_data_bus(high)          i_data_bus(low)      i_data_bus(high)          i_data_bus(low)       i_data_bus(high)          i_data_bus(low)
       [DATA_WIDTH+:DATA_WIDTH]    [DATA_WIDTH-1:0]    [DATA_WIDTH+:DATA_WIDTH]    [DATA_WIDTH-1:0]   [DATA_WIDTH+:DATA_WIDTH]    [DATA_WIDTH-1:0]
                              \     /                                       \     /                                         \     /
                               v   v                                         v   v                                           v   v
                              |¯¯¯¯¯| <--- i_valid=2'b01                    |¯¯¯¯¯| <--- i_valid=2'b10                      |¯¯¯¯¯| <--- i_valid=2'b00
                              |_____| <--- i_cmd=1'b0                       |_____| <--- i_cmd=1'b1                         |_____| <--- i_cmd=1'bx
                                 |                                             |	                                              |
                                 v                                             v                                               v
                           i_data_bus(low)                              i_data_bus(high)                                    Invalid

          o_data_high = o_data_bus[2*DATA_WIDTH-1: DATA_WIDTH]
          o_data_low  = o_data_bus[DATA_WIDTH-1: 0]
          i_valid = 1'bx; where x indicates "don't care".

    Author:      Jianming Tong (jianming.tong@gatech.edu)
*/

module merge_2x1_simple_seq#(
    parameter DATA_WIDTH = 32,
    parameter COMMAND_WIDTH = 1 // todo
)(
    // timeing signals
    clk,
    rst_n,

    // data signals
    i_valid,        // valid input data signal
    i_data_bus,     // input data bus coming into distribute switch

    o_valid,        // output valid
    o_data_bus,     // output data

    // control signals
    i_en,           // distribute switch enable
    i_cmd           // command
);
    // interface
    input                       clk;
    input                       rst_n;

    input  [1:0]                i_valid;
    input  [2*DATA_WIDTH-1:0]   i_data_bus;

    output                      o_valid;
    output [DATA_WIDTH-1:0]     o_data_bus;

    input                       i_en;
    input  [COMMAND_WIDTH-1:0]  i_cmd;
                                // 0 --> Branch Low
                                // 1 --> Branch High

    mux_2x1_simple_seq #(
        .DATA_WIDTH(DATA_WIDTH),
        .COMMAND_WIDTH(COMMAND_WIDTH)
    )data_mux(
        .clk(clk),
        .rst_n(rst_n),
        .i_valid(i_valid),
        .i_data_bus(i_data_bus),
        .o_valid(o_valid),
        .o_data_bus(o_data_bus),
        .i_en(i_en),
        .i_cmd(i_cmd)
    );


endmodule