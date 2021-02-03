// *********************************************************************************
// Project Name : Modified_NoC
// Abstract     : the switch of the modifed-butterfly network
// *********************************************************************************
// Modification History:
// Time          By              Version                 Change Description
// -----------------------------------------------------------------------
// 2021/1/27     JianmingTONG     1.0                    First Create
// 19:42
// *********************************************************************************
`timescale 1ns / 1ps

module modified_butterfly
#(
    parameter       data_width  = 32,
    parameter       num_in      = 64,
    parameter       num_out     = 64,
    parameter       num_stage   = 3,
    parameter       addr_length = num_stage * log2(num_in)
)
(   
    input                                     clk,
    input  [num_in*addr_length-1:0]           addr_in,
    input  [num_in*data_width-1 :0]           data_0_i,
    
    output [num_in-1:0]                       valid,

    output [data_width-1 :0]                  data_o,
    output [addr_length-2:0]                  addr_out,
);
    reg    [addr_length-2:0]                  addr_out_inner;
    reg    [num_out*data_width-1 :0]          data_out_inner;
    

    // three stages;
    always @(*) begin
        addr_out_inner = addr_in[addr_length-2:0];
    end

    always @(*) begin
        if (addr_in[addr_length-1:addr_length-2]) begin
            data_out_inner = data_1_i;
        end
        else begin
            data_out_inner = data_0_i;
        end
    end

    assign data_o   = data_out_inner;
    assign addr_out = addr_out_inner;

endmodule