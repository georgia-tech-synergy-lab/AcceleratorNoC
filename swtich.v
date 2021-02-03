// *********************************************************************************
// Project Name : DARPA_NOC
// Abstract     : the switch of the modifed-butterfly network
// *********************************************************************************
// Modification History:
// Time          By              Version                 Change Description
// -----------------------------------------------------------------------
// 2021/1/27     JianmingTONG     1.0                    First Create
// 19:42
// *********************************************************************************
`timescale 1ns / 1ps

module switch
#(
    parameter       data_width  = 8,
    parameter       addr_length = 8
)
(   input  [addr_length-1:0]                  addr_in,
    input  [data_width-1 :0]                  data_0_i,
    input  [data_width-1 :0]                  data_1_i,
    output [data_width-1 :0]                  data_o,
    output [addr_length-2:0]                  addr_out,
);
    reg    [addr_length-2:0]                  addr_out_inner;
    reg    [data_width-1 :0]                  data_out_inner;
    
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