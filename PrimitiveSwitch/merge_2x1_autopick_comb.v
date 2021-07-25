`timescale 1ns / 1ps
/*
    Top Module:  merge_2x1_autopick_comb
    Data:        Only data width matters.
    Format:      keeping the input format unchange
    Note:        Does not feed command, will autopick the valid input
                 to go to the output.
                 When both input are valid, choose the highIn to go output
    Dummy Data:  {DATA_WIDTH{1'b0}}

    Function:             Auto Pick HighIn                               Auto Pick LowIn                                   No Pick

          i_data_bus(high)          i_data_bus(low)      i_data_bus(high)          i_data_bus(low)       i_data_bus(high)          i_data_bus(low)
       [DATA_WIDTH+:DATA_WIDTH]    [DATA_WIDTH-1:0]    [DATA_WIDTH+:DATA_WIDTH]    [DATA_WIDTH-1:0]   [DATA_WIDTH+:DATA_WIDTH]    [DATA_WIDTH-1:0]
                              \     /                                       \     /                                         \     /
                               v   v                                         v   v                                           v   v
                              |¯¯¯¯¯| <--- i_valid=2'b1?                    |¯¯¯¯¯| <--- i_valid=2'b01                      |¯¯¯¯¯| <--- i_valid=2'b00
                              |_____|                                       |_____|                                         |_____|
                                 |                                             |	                                              |
                                 v                                             v                                               v
                          i_data_bus(high)                              i_data_bus(low)                                      Invalid


    Author:      Jianming Tong (jianming.tong@gatech.edu)
*/


module merge_2x1_autopick_comb#(
    parameter DATA_WIDTH = 32
)(
    // data signals
    i_valid,        // valid input data signal
    i_data_bus,     // input data bus coming into distribute switch

    o_valid,        // output valid
    o_data_bus,     // output data

    // control signals
    i_en            // distribute switch enable
);
    // interface
    input  [1:0]                i_valid;
    input  [2*DATA_WIDTH-1:0]   i_data_bus;

    output                      o_valid;
    output [DATA_WIDTH-1:0]     o_data_bus;

    input                       i_en;

    // inner logic

    // inner logic
    reg    [DATA_WIDTH-1:0]        o_data_bus_inner;
    reg                            o_valid_inner;
    reg    [1:0]                   i_valid_inner;

    always @(*) begin
        i_valid_inner = i_valid;
    end

    always@(*)
    begin
        if(i_en)
        begin
            case({i_valid_inner[1],i_valid_inner[0]})
                // 2'b01,2'bx1,2'b01:
                2'b01:
                begin
                    o_valid_inner = 1'b1;
                    o_data_bus_inner = i_data_bus[0 +:DATA_WIDTH];
                end
                // 2'b1x,2'b10,2'b1z,2'b11:
                2'b10,2'b11:
                begin
                    o_valid_inner = 1'b1;
                    o_data_bus_inner = i_data_bus[DATA_WIDTH +:DATA_WIDTH];
                end
                default:
                begin
                    o_valid_inner = 1'b0;
                    o_data_bus_inner = {DATA_WIDTH{1'b0}};
                end
            endcase
        end
        else
        begin
            o_valid_inner = 1'b0;
            o_data_bus_inner = {DATA_WIDTH{1'b0}};
        end
    end

    assign o_data_bus = o_data_bus_inner;
    assign o_valid = o_valid_inner;

endmodule