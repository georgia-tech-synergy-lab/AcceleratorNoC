`timescale 1ns / 1ps
/*
    Top Module:  tb_adder_seq
    Data:        Only data width matters.
    Format:      Output has 1 more bit than input
    Timing:      Sequential Logic
    Reset:       Asynchronized Reset [Low Reset]
    Dummy Data:  {DATA_WIDTH{1'bx}}

    Function:

          i_data_bus(data_a)        i_data_bus(data_b)
       [DATA_WIDTH+:DATA_WIDTH]    [DATA_WIDTH-1:0]
                             \     /
                              v   v
                              |¯¯¯| <--- i_valid[0]--data_b;
                              |___| <--- i_valid[1]--data_a;
                                |
                                v
                            o_data_bus = a + b

    Author:      Jianming Tong (jianming.tong@gatech.edu)
*/

module tb_adder_seq();

    parameter DATA_WIDTH  = 4;

    // timing signals
    reg                            clk;
    reg                            rst_n;

    // data signals
    reg    [1:0]                   i_valid;        // valid input data signal
    reg    [2*DATA_WIDTH-1:0]      i_data_bus;     // input data bus coming into mux

    wire                           o_valid;        // output valid
    wire   [DATA_WIDTH:0]          o_data_bus;     // output data

    // control signals
    reg                            i_en;           // mux enable

    // Test case declaration
    initial
    begin
        // disable
        clk = 1'b0;
        rst_n = 1'b1;
        i_valid = 2'b11;
        i_data_bus = {{DATA_WIDTH{1'b0}}, {(DATA_WIDTH>>2){4'h1}}};
        i_en = 1'b0;

        // enable and reset
        #20
        rst_n = 1'b0;
        i_valid = 2'b11;
        i_data_bus = {{DATA_WIDTH{1'b1}}, {(DATA_WIDTH>>2){4'h0}}};
        i_en = 1'b1;

        // enable & summation (without overflow).
        #20
        rst_n = 1'b1;
        i_valid = 2'b11;
        i_data_bus = {{DATA_WIDTH{1'b1}}, {(DATA_WIDTH>>2){4'h0}}};
        i_en = 1'b1;

        // enable & summation (without overflow).
        #20
        rst_n = 1'b1;
        i_valid = 2'b11;
        i_data_bus = {{DATA_WIDTH{1'b1}}, {(DATA_WIDTH>>2){4'h0}}};
        i_en = 1'b1;

        // enable & summation (with overflow).
        #20
        i_valid = 2'b11;
        i_data_bus = {{DATA_WIDTH{1'b1}}, {(DATA_WIDTH>>2){4'hE}}};
        i_en = 1'b1;

        // invalid i_data_high & select i_data_bus(high).
        #20
        i_valid = 2'b01;
        i_en = 1'b1;

        // invalid i_data_low & select i_data_bus(low).
        #20
        i_valid = 2'b10;
        i_en = 1'b1;

        // change i_data & select i_data_bus(low).
        #20
        i_valid = 2'b11;
        i_en = 1'b1;
        i_data_bus = {{(DATA_WIDTH>>2){4'hE}}, {(DATA_WIDTH>>2){4'h5}}};
        $stop;
end


    // instantiate DUT (device under test)
    adder_seq #(
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