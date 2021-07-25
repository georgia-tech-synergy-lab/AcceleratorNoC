`timescale 1ns / 1ps
/*
    Top Module:  tb_merge_2x1_autopick_seq
    Data:        Only data width matters.
    Format:      keeping the input format unchange
    Note:        Does not feed command, will autopick the valid input
                 to go to the output.
                 When both input are valid, choose the highIn to go output

    Function:             Auto Pick HighIn                               Auto Pick LowIn                                   No Pick

          i_data_bus(high)          i_data_bus(low)      i_data_bus(high)          i_data_bus(low)       i_data_bus(high)          i_data_bus(low)
       [DATA_WIDTH+:DATA_WIDTH]    [DATA_WIDTH-1:0]    [DATA_WIDTH+:DATA_WIDTH]    [DATA_WIDTH-1:0]   [DATA_WIDTH+:DATA_WIDTH]    [DATA_WIDTH-1:0]
                              \     /                                       \     /                                         \     /
                               v   v                                         v   v                                           v   v
                              |¯¯¯¯¯| <--- i_valid=2'b10                    |¯¯¯¯¯| <--- i_valid=2'b01                      |¯¯¯¯¯| <--- i_valid=2'b00
                              |_____|                                       |_____|                                         |_____|
                                 |                                             |	                                              |
                                 v                                             v                                               v
                          i_data_bus(high)                              i_data_bus(low)                                      Invalid


    Author:      Jianming Tong (jianming.tong@gatech.edu)
*/

module tb_merge_2x1_autopick_seq();

    parameter DATA_WIDTH  = 32;

    // timing signals
    reg                            clk;
    reg                            rst_n;

    // data signals
    reg    [1:0]                   i_valid;        // valid input data signal
    reg    [2*DATA_WIDTH-1:0]      i_data_bus;     // input data bus coming into mux

    wire                           o_valid;        // output valid
    wire   [DATA_WIDTH-1:0]        o_data_bus;     // output data

    // control signals
    reg                            i_en;           // mux enable

    // Test case declaration
    // all cases for control
   initial
    begin
        clk = 1'b0;
        // not enable at start
        #20
        rst_n = 1'b1;
        i_valid = 2'b10;
        i_data_bus = {{(DATA_WIDTH>>2){4'hA}}, {(DATA_WIDTH>>2){4'hF}}};
        i_en = 1'b1;

        // reset
        #20
        rst_n = 1'b0;
        i_valid = 2'b01;
        i_data_bus = {{(DATA_WIDTH>>2){4'hA}}, {(DATA_WIDTH>>2){4'hF}}};
        i_en = 1'b1;

        // input active -- pick low
        #20
        rst_n = 1'b1;
        i_valid = 2'b01;
        i_data_bus = {{(DATA_WIDTH>>2){4'hA}}, {(DATA_WIDTH>>2){4'hF}}};
        i_en = 1'b1;

        // input active -- pick high
        #20
        rst_n = 1'b1;
        i_valid = 2'b10;
        i_data_bus = {{(DATA_WIDTH>>2){4'hA}}, {(DATA_WIDTH>>2){4'hF}}};
        i_en = 1'b1;

        // disable in progress
        #20
        rst_n = 1'b1;
        i_valid = 2'b11;
        i_data_bus = {{(DATA_WIDTH>>2){4'hA}}, {(DATA_WIDTH>>2){4'hF}}};
        i_en = 1'b0;

        // enable in progress -- pick both (content -> high out)
        #20
        rst_n = 1'b1;
        i_valid = 2'b11;
        i_data_bus = {{(DATA_WIDTH>>2){4'hA}}, {(DATA_WIDTH>>2){4'hF}}};
        i_en = 1'b1;

        // change data half way
        #20
        rst_n = 1'b1;
        i_valid = 2'b11;
        i_data_bus = {{(DATA_WIDTH>>2){4'hB}}, {(DATA_WIDTH>>2){4'h3}}};
        i_en = 1'b1;

        // invalid high input
        #20
        rst_n = 1'b1;
        i_valid = 2'b01;
        i_data_bus = {{(DATA_WIDTH>>2){4'hB}}, {(DATA_WIDTH>>2){4'h3}}};
        i_en = 1'b1;

        // invalid low input
        #20
        rst_n = 1'b1;
        i_valid = 2'b10;
        i_data_bus = {{(DATA_WIDTH>>2){4'hB}}, {(DATA_WIDTH>>2){4'h3}}};
        i_en = 1'b1;
        $stop;
end


    // instantiate DUT (device under test)
    merge_2x1_autopick_seq #(
        .DATA_WIDTH(DATA_WIDTH)
    ) dut(
        .clk(clk),
        .rst_n(rst_n),
        .i_valid(i_valid),
        .i_data_bus(i_data_bus),
        .o_valid(o_valid),
        .o_data_bus(o_data_bus),
        .i_en(i_en)
    );

    always#5 clk=~clk;

endmodule

