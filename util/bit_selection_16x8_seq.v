`timescale 1ns / 1ps
/*
    Top Module:  bit_selection_16x8_seq
    Data:        Only data width matters.
    Format:      keeping the input format unchange
    Timing:      Sequential Logic, one clock cycle latency
    Dummy Data:  {DATA_WIDTH{1'b0}}

    Function:    select 8 continous bits out of 16 bits --> total 8 cases (if need shift) -> 3-bit command.
                 extra 1 bit command to control whether shift is needed.
                 So 4-bit command in total.

    Author:      Jianming Tong (jianming.tong@gatech.edu)
*/

module bit_selection_16x8_seq#(
    parameter DATA_WIDTH = 16,                        // could only be 16
    parameter COMMAND_WIDTH = $clog2(DATA_WIDTH)      // could only be 3+1 = 4
)(
    // data signals
    clk,
    rst_n,

    i_valid,        // valid input data signal
    i_data_bus,     // input data

    o_valid,        // output valid
    o_data_bus,     // output data

    // control signals
    i_en,           // distribute switch enable
    i_cmd           // command
);

    localparam  OUT_DATA_WIDTH = DATA_WIDTH >> 1;

    // data signals
    input                          clk;
    input                          rst_n;

    input  [DATA_WIDTH-1:0]        i_data_bus;
    input                          i_valid;

    output [OUT_DATA_WIDTH-1:0]    o_data_bus;
    output                         o_valid;

    input                          i_en;
    input  [COMMAND_WIDTH-1:0]     i_cmd;

    reg    [OUT_DATA_WIDTH-1:0]    o_data_bus_reg;
    reg                            o_valid_reg;

    reg    [OUT_DATA_WIDTH-1:0]    o_ori_data_bus_reg;
    reg                            o_ori_valid_reg;

    always @(posedge clk or negedge rst_n) begin
        if(!rst_n)
        begin
            o_ori_data_bus_reg <= {OUT_DATA_WIDTH{1'b0}};
            o_ori_valid_reg <= 1'b0;
        end
        else if(i_en & i_valid & (~i_cmd[COMMAND_WIDTH-1]))
        begin
            o_ori_data_bus_reg <= i_data_bus;
            o_ori_valid_reg <= i_valid;
        end
        else
        begin
            o_ori_data_bus_reg <= {OUT_DATA_WIDTH{1'b0}};
            o_ori_valid_reg <= 1'b0;
        end
    end

    always@(posedge clk or negedge rst_n)
    begin
        if(!rst_n)
        begin
            o_data_bus_reg <= {OUT_DATA_WIDTH{1'b0}};
        end
        else if(i_en & i_valid)
        begin
            case(i_cmd[COMMAND_WIDTH-2:0])
                3'h0:
                begin
                    o_data_bus_reg <= i_data_bus[1+:OUT_DATA_WIDTH];
                end
                3'h1:
                begin
                    o_data_bus_reg <= i_data_bus[2+:OUT_DATA_WIDTH];
                end
                3'h2:
                begin
                    o_data_bus_reg <= i_data_bus[3+:OUT_DATA_WIDTH];
                end
                3'h3:
                begin
                    o_data_bus_reg <= i_data_bus[4+:OUT_DATA_WIDTH];
                end
                3'h4:
                begin
                    o_data_bus_reg <= i_data_bus[5+:OUT_DATA_WIDTH];
                end
                3'h5:
                begin
                    o_data_bus_reg <= i_data_bus[6+:OUT_DATA_WIDTH];
                end
                3'h6:
                begin
                    o_data_bus_reg <= i_data_bus[7+:OUT_DATA_WIDTH];
                end
                3'h7:
                begin
                    o_data_bus_reg <= i_data_bus[8+:OUT_DATA_WIDTH];
                end
                default:
                begin
                    o_data_bus_reg <= i_data_bus[0+:OUT_DATA_WIDTH];
                end
            endcase
        end
        else
        begin
            o_data_bus_reg <= {OUT_DATA_WIDTH{1'b0}};
        end
    end

    always@(posedge clk or negedge rst_n)
    begin
        if(!rst_n)
        begin
            o_valid_reg <= 1'b0;
        end
        else if(i_en & i_valid)
        begin
            o_valid_reg <= 1'b1;
        end
        else
        begin
            o_valid_reg <= 1'b0;
        end
    end

    assign o_data_bus = (i_cmd[COMMAND_WIDTH-1])?o_data_bus_reg:o_ori_data_bus_reg;
    assign o_valid = (i_cmd[COMMAND_WIDTH-1])?o_valid_reg:o_ori_valid_reg;

endmodule