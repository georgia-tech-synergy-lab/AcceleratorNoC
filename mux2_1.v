// *********************************************************************************
// Project Name : MAERI
// Abstract     : the switch of the benes network
// *********************************************************************************
// Modification History:
// Time          By              Version                 Change Description
// -----------------------------------------------------------------------
// 2020/01/27    Jianming           1.0                    First Create
// 19:42
// *********************************************************************************
`timescale 1ns / 1ps

module mux2_1
#(
    parameter       data_width = 8
)
(   input sel,
    input [data_width-1:0]      data_0_i,
    input [data_width-1:0]      data_1_i,
    output[data_width-1:0]      data_o
);

    reg  [data_width-1:0]       data_tmp;

    always @ (*) begin
        if (sel) begin
            data_tmp = data_1_i;
        end
        else begin
            data_tmp = data_0_i;
        end
    end

    assign data_o = data_tmp;
endmodule