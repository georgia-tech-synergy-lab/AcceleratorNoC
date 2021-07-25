`timescale 1ns / 1ps

`define post_syn_test
// `define rtl_test

`ifdef post_syn_test
`include "/home/jimmy/work/work_tushar/local_testbench/lib.v"

module tb_binary_tree_8_64_seq();
    parameter DATA_WIDTH = 32;       // could be arbitrary number
    parameter NUM_OUTPUT_DATA  = 8; // must be power of 2.
    parameter NUM_INPUT_DATA = 8;

    localparam NUM_FANOUT = 8;
    //parameter
    localparam TOTAL_COMMAND = NUM_INPUT_DATA*NUM_OUTPUT_DATA;
    localparam TOTAL_OUTPUT_COMMAND = NUM_INPUT_DATA*NUM_OUTPUT_DATA;

    localparam WIDTH_INPUT_DATA = NUM_INPUT_DATA*DATA_WIDTH;
    localparam WIDTH_OUTPUT_DATA = NUM_FANOUT*NUM_OUTPUT_DATA*DATA_WIDTH;

    // interface
    reg                                        clk;
    reg                                        rst_n;

    reg  [NUM_INPUT_DATA-1:0]                  i_valid;
    reg  [WIDTH_INPUT_DATA-1:0]                i_data_bus;

    wire [NUM_FANOUT*NUM_OUTPUT_DATA-1:0]      o_valid;
    wire [WIDTH_OUTPUT_DATA-1:0]               o_data_bus; // {o_data_a, o_data_b}
    wire [TOTAL_COMMAND-1:0]                  o_cmd; // {o_data_a, o_data_b}

    reg                                        i_en;
    reg  [TOTAL_COMMAND-1:0]                  i_cmd;

    initial begin
        i_en = 1'b1;
        clk = 0;
        rst_n = 1'b0;

        // disable
        i_en = 1'b0;

        // enable & reset
        #20
        i_en = 1'b1;
        rst_n = 1'b1;

        // input valid & correct input command (No conflict) with multicasting.
        #20
        rst_n = 1'b0;
        i_valid = {NUM_INPUT_DATA{1'b1}};
        i_data_bus = {{(DATA_WIDTH>>2){4'hf}},{(DATA_WIDTH>>2){4'he}},{(DATA_WIDTH>>2){4'hd}},{(DATA_WIDTH>>2){4'hc}},{(DATA_WIDTH>>2){4'hb}},{(DATA_WIDTH>>2){4'ha}},{(DATA_WIDTH>>2){4'h9}},{(DATA_WIDTH>>2){4'h8}}};
        i_cmd = {8'b10010000, 8'b00100000, 8'b01000100, 40'b0};
        $display("o_valid: %h\n", o_valid);
        $display("o_data_bus:%h \n",o_data_bus);

        // input valid & wrong input command (has conflict at i_cmd[5]).
        #20
        i_data_bus = {{(DATA_WIDTH>>2){4'hf}},{(DATA_WIDTH>>2){4'he}},{(DATA_WIDTH>>2){4'hd}},{(DATA_WIDTH>>2){4'hc}},{(DATA_WIDTH>>2){4'hb}},{(DATA_WIDTH>>2){4'ha}},{(DATA_WIDTH>>2){4'h9}},{(DATA_WIDTH>>2){4'h8}}};
        i_cmd = {8'b10010000, 8'b00100000, 8'b00100010, 40'b0};
        $display("o_valid: %h\n", o_valid);
        $display("o_data_bus:%h \n",o_data_bus);

        // input valid & correct input command (unicasting).
        #20
        i_data_bus = {{(DATA_WIDTH>>2){4'hf}},{(DATA_WIDTH>>2){4'he}},{(DATA_WIDTH>>2){4'hd}},{(DATA_WIDTH>>2){4'hc}},{(DATA_WIDTH>>2){4'hb}},{(DATA_WIDTH>>2){4'ha}},{(DATA_WIDTH>>2){4'h9}},{(DATA_WIDTH>>2){4'h8}}};
        i_cmd = {8'b10000000, 8'b01000000, 8'b00100000, 40'b0};
        $display("o_valid: %h\n", o_valid);
        $display("o_data_bus:%h \n",o_data_bus);

        // input valid & input high-Z command (unicasting).
        #20
        i_data_bus = {{(DATA_WIDTH>>2){4'hf}},{(DATA_WIDTH>>2){4'he}},{(DATA_WIDTH>>2){4'hd}},{(DATA_WIDTH>>2){4'hc}},{(DATA_WIDTH>>2){4'hb}},{(DATA_WIDTH>>2){4'ha}},{(DATA_WIDTH>>2){4'h9}},{(DATA_WIDTH>>2){4'h8}}};
        i_cmd = {8'b10000000, 8'b01000000, 8'b00100000, 40'b0};
        $display("o_valid: %h\n", o_valid);
        $display("o_data_bus:%h \n",o_data_bus);

        // input in-valid & input high-Z command (unicasting).
        #20
        i_valid = {1'b0,{(NUM_INPUT_DATA-1){1'b1}}};
        i_data_bus = {{(DATA_WIDTH>>2){4'hf}},{(DATA_WIDTH>>2){4'he}},{(DATA_WIDTH>>2){4'hd}},{(DATA_WIDTH>>2){4'hc}},{(DATA_WIDTH>>2){4'hb}},{(DATA_WIDTH>>2){4'ha}},{(DATA_WIDTH>>2){4'h9}},{(DATA_WIDTH>>2){4'h8}}};
        i_cmd = {8'b10000000, 8'b01000000, 8'b00100000, 40'b0};
        $display("o_valid: %h\n", o_valid);
        $display("o_data_bus:%h \n",o_data_bus);

        // input valid & change data (unicasting).
        #20
        i_valid = {NUM_INPUT_DATA{1'b1}};
        i_data_bus = {{(DATA_WIDTH>>2){4'hf}},{(DATA_WIDTH>>2){4'he}},{(DATA_WIDTH>>2){4'hd}},{(DATA_WIDTH>>2){4'hc}},{(DATA_WIDTH>>2){4'hb}},{(DATA_WIDTH>>2){4'ha}},{(DATA_WIDTH>>2){4'h9}},{(DATA_WIDTH>>2){4'h8}}};
        i_cmd = {8'b10000000, 8'b01000000, 8'b00100000, 40'b0};
        $display("o_valid: %h\n", o_valid);
        $display("o_data_bus:%h \n",o_data_bus);

        // input valid & change data (unicasting).
        #20
        i_valid = {NUM_INPUT_DATA{1'b1}};
        i_data_bus = {{(DATA_WIDTH>>2){4'h0}},{(DATA_WIDTH>>2){4'h1}},{(DATA_WIDTH>>2){4'h2}},{(DATA_WIDTH>>2){4'h3}},{(DATA_WIDTH>>2){4'h4}},{(DATA_WIDTH>>2){4'h5}},{(DATA_WIDTH>>2){4'h6}},{(DATA_WIDTH>>2){4'h7}}};
        i_cmd = {8'b10000000, 8'b01000000, 8'b00100000, 40'b0};
        $display("o_valid: %h\n", o_valid);
        $display("o_data_bus:%h \n",o_data_bus);

        // Error input example -- input in-valid & input high-Z command (unicasting). !
        #20
        i_valid = {1'b0,{(NUM_INPUT_DATA-1){1'b1}}};
        i_data_bus = {{(DATA_WIDTH>>2){4'hf}},{(DATA_WIDTH>>2){4'he}},{(DATA_WIDTH>>2){4'hd}},{(DATA_WIDTH>>2){4'hc}},{(DATA_WIDTH>>2){4'hb}},{(DATA_WIDTH>>2){4'ha}},{(DATA_WIDTH>>2){4'h9}},{(DATA_WIDTH>>2){4'h8}}};
        i_cmd = {8'b10000000, 8'b01000000, 8'b00100000, 40'b0};
        $display("o_valid: %h\n", o_valid);
        $display("o_data_bus:%h \n",o_data_bus);

        #150
        $stop;
    end

    // instantiate DUT (device under test)
    binary_tree_8_64_seq dut(
        .clk(clk),
        .rst_n(rst_n),
        .i_valid(i_valid),
        .i_data_bus(i_data_bus),
        .o_valid(o_valid),
        .o_data_bus(o_data_bus),
        .o_cmd(o_cmd),
        .i_en(i_en),
        .i_cmd(i_cmd)
    );

    always #5 clk=~clk;

endmodule
`endif

`ifdef rtl_test

module tb_binary_tree_8_64_seq();
    parameter DATA_WIDTH = 4;       // could be arbitrary number
    parameter NUM_OUTPUT_DATA  = 8; // must be power of 2.
    parameter NUM_INPUT_DATA = 8;

    localparam NUM_FANOUT = 8;
    //parameter
    localparam TOTAL_COMMAND = NUM_INPUT_DATA*NUM_OUTPUT_DATA;
    localparam TOTAL_OUTPUT_COMMAND = NUM_INPUT_DATA*NUM_OUTPUT_DATA;

    localparam WIDTH_INPUT_DATA = NUM_INPUT_DATA*DATA_WIDTH;
    localparam WIDTH_OUTPUT_DATA = NUM_FANOUT*NUM_OUTPUT_DATA*DATA_WIDTH;

    // interface
    reg                                        clk;
    reg                                        rst_n;

    reg  [NUM_INPUT_DATA-1:0]                  i_valid;
    reg  [WIDTH_INPUT_DATA-1:0]                i_data_bus;

    wire [NUM_FANOUT*NUM_OUTPUT_DATA-1:0]      o_valid;
    wire [WIDTH_OUTPUT_DATA-1:0]               o_data_bus; // {o_data_a, o_data_b}
    wire [TOTAL_COMMAND-1:0]                  o_cmd; // {o_data_a, o_data_b}

    reg                                        i_en;
    reg  [TOTAL_COMMAND-1:0]                  i_cmd;

    initial begin
        i_en = 1'b1;
        clk = 0;
        rst_n = 1'b1;

        // disable
        i_en = 1'b0;
        #20
        rst_n = 1'b0;

        // enable & reset
        #20
        i_en = 1'b1;
        rst_n = 1'b1;

        // input valid & correct input command (No conflict) with multicasting.
        #20
        rst_n = 1'b1;
        i_valid = {NUM_INPUT_DATA{1'b1}};
        i_data_bus = {{(DATA_WIDTH>>2){4'hf}},{(DATA_WIDTH>>2){4'he}},{(DATA_WIDTH>>2){4'hd}},{(DATA_WIDTH>>2){4'hc}},{(DATA_WIDTH>>2){4'hb}},{(DATA_WIDTH>>2){4'ha}},{(DATA_WIDTH>>2){4'h9}},{(DATA_WIDTH>>2){4'h8}}};
        i_cmd = {8'b10010000, 8'b00100000, 8'b01000100, 40'b0};
        $display("o_valid: %h\n", o_valid);
        $display("o_data_bus:%h \n",o_data_bus);

        // input valid & wrong input command (has conflict at i_cmd[5]).
        #20
        i_data_bus = {{(DATA_WIDTH>>2){4'hf}},{(DATA_WIDTH>>2){4'he}},{(DATA_WIDTH>>2){4'hd}},{(DATA_WIDTH>>2){4'hc}},{(DATA_WIDTH>>2){4'hb}},{(DATA_WIDTH>>2){4'ha}},{(DATA_WIDTH>>2){4'h9}},{(DATA_WIDTH>>2){4'h8}}};
        i_cmd = {8'b10010000, 8'b00100000, 8'b00100010, 40'b0};
        $display("o_valid: %h\n", o_valid);
        $display("o_data_bus:%h \n",o_data_bus);

        // input valid & correct input command (unicasting).
        #20
        i_data_bus = {{(DATA_WIDTH>>2){4'hf}},{(DATA_WIDTH>>2){4'he}},{(DATA_WIDTH>>2){4'hd}},{(DATA_WIDTH>>2){4'hc}},{(DATA_WIDTH>>2){4'hb}},{(DATA_WIDTH>>2){4'ha}},{(DATA_WIDTH>>2){4'h9}},{(DATA_WIDTH>>2){4'h8}}};
        i_cmd = {8'b10000000, 8'b01000000, 8'b00100000, 40'b0};
        $display("o_valid: %h\n", o_valid);
        $display("o_data_bus:%h \n",o_data_bus);

        // input valid & input high-Z command (unicasting).
        #20
        i_data_bus = {{(DATA_WIDTH>>2){4'hf}},{(DATA_WIDTH>>2){4'he}},{(DATA_WIDTH>>2){4'hd}},{(DATA_WIDTH>>2){4'hc}},{(DATA_WIDTH>>2){4'hb}},{(DATA_WIDTH>>2){4'ha}},{(DATA_WIDTH>>2){4'h9}},{(DATA_WIDTH>>2){4'h8}}};
        i_cmd = {8'b10000000, 8'b01000000, 8'b00100000, 40'b0};
        $display("o_valid: %h\n", o_valid);
        $display("o_data_bus:%h \n",o_data_bus);

        // input in-valid & input high-Z command (unicasting).
        #20
        i_valid = {1'b0,{(NUM_INPUT_DATA-1){1'b1}}};
        i_data_bus = {{(DATA_WIDTH>>2){4'hf}},{(DATA_WIDTH>>2){4'he}},{(DATA_WIDTH>>2){4'hd}},{(DATA_WIDTH>>2){4'hc}},{(DATA_WIDTH>>2){4'hb}},{(DATA_WIDTH>>2){4'ha}},{(DATA_WIDTH>>2){4'h9}},{(DATA_WIDTH>>2){4'h8}}};
        i_cmd = {8'b10000000, 8'b01000000, 8'b00100000, 40'b0};
        $display("o_valid: %h\n", o_valid);
        $display("o_data_bus:%h \n",o_data_bus);

        // input valid & change data (unicasting).
        #20
        i_valid = {NUM_INPUT_DATA{1'b1}};
        i_data_bus = {{(DATA_WIDTH>>2){4'hf}},{(DATA_WIDTH>>2){4'he}},{(DATA_WIDTH>>2){4'hd}},{(DATA_WIDTH>>2){4'hc}},{(DATA_WIDTH>>2){4'hb}},{(DATA_WIDTH>>2){4'ha}},{(DATA_WIDTH>>2){4'h9}},{(DATA_WIDTH>>2){4'h8}}};
        i_cmd = {8'b10000000, 8'b01000000, 8'b00100000, 40'b0};
        $display("o_valid: %h\n", o_valid);
        $display("o_data_bus:%h \n",o_data_bus);

        // input valid & change data (unicasting).
        #20
        i_valid = {NUM_INPUT_DATA{1'b1}};
        i_data_bus = {{(DATA_WIDTH>>2){4'h0}},{(DATA_WIDTH>>2){4'h1}},{(DATA_WIDTH>>2){4'h2}},{(DATA_WIDTH>>2){4'h3}},{(DATA_WIDTH>>2){4'h4}},{(DATA_WIDTH>>2){4'h5}},{(DATA_WIDTH>>2){4'h6}},{(DATA_WIDTH>>2){4'h7}}};
        i_cmd = {8'b10000000, 8'b01000000, 8'b00100000, 40'b0};
        $display("o_valid: %h\n", o_valid);
        $display("o_data_bus:%h \n",o_data_bus);

        // Error input example -- input in-valid & input high-Z command (unicasting). !
        #20
        i_valid = {1'b0,{(NUM_INPUT_DATA-1){1'b1}}};
        i_data_bus = {{(DATA_WIDTH>>2){4'hf}},{(DATA_WIDTH>>2){4'he}},{(DATA_WIDTH>>2){4'hd}},{(DATA_WIDTH>>2){4'hc}},{(DATA_WIDTH>>2){4'hb}},{(DATA_WIDTH>>2){4'ha}},{(DATA_WIDTH>>2){4'h9}},{(DATA_WIDTH>>2){4'h8}}};
        i_cmd = {8'b10000000, 8'b01000000, 8'b00100000, 40'b0};
        $display("o_valid: %h\n", o_valid);
        $display("o_data_bus:%h \n",o_data_bus);

        #150
        $stop;
    end

    // instantiate DUT (device under test)
    binary_tree_8_64_seq #(
        .NUM_INPUT_DATA(NUM_INPUT_DATA),
        .NUM_OUTPUT_DATA(NUM_OUTPUT_DATA),
        .DATA_WIDTH(DATA_WIDTH))
    dut(
        .clk(clk),
        .rst_n(rst_n),
        .i_valid(i_valid),
        .i_data_bus(i_data_bus),
        .o_valid(o_valid),
        .o_data_bus(o_data_bus),
        .o_cmd(o_cmd),
        .i_en(i_en),
        .i_cmd(i_cmd)
    );

    always #5 clk=~clk;

endmodule
`endif