`timescale 1ns / 1ps
/*
    Top Module:  tb_maeri_first_half_seq
    Data:        Only data width matters.
    Format:      keeping the reg format unchange
    Timing:      Sequential Logic
    Reset:       Asynchronized Reset [Low Reset]
    Pipeline:    the system consist of three separate parts
                 For benes constructed with sequential switches, every stage is a pipeline stage
                 Total latency = # stages (cycle)
    Dummy Data:  {DATA_WIDTH{1'b0}}

    Function:     The first half of MAERI consist of BENES network and 1D Multipliers (Here is an example for 8 multiplier)

                                                                                                            |------->|¯¯¯|
                                                                                                            |        |_x_|---o_data_bus
                                                                                                            |          |     [0*DW+:DW]
                                                                                                            |          v
                                                                                                            | |----->|¯¯¯|
                                                                                                            | |      |_x_|---o_data_bus
                                                                                                            | |        |     [1*DW+:DW]
                                                                                                            | |        v
                                                                                                            | | |--->|¯¯¯|
                                                                                                            | | |    |_x_|---o_data_bus
       i_data_bus[0*DATA_WIDTH+:DATA_WIDTH]  -->|¯¯¯|-------->|¯¯¯|------->|¯¯¯|------->|¯¯¯|-------->|¯¯¯|-| | |      |     [2*DW+:DW]
       i_data_bus[1*DATA_WIDTH+:DATA_WIDTH]  -->|___|-\ /---->|___|--\ /-->|___|--\ /-->|___|----\ /->|___|---| |      v
                                        ID:       0    X        4     X      8     X      12      X     16      | |->|¯¯¯|
       i_data_bus[2*DATA_WIDTH+:DATA_WIDTH]  -->|¯¯¯|-/ \/--->|¯¯¯|--/ \-->|¯¯¯|--/ \-->|¯¯¯|---\/ \->|¯¯¯|-----| |  |_x_|---o_data_bus
       i_data_bus[3*DATA_WIDTH+:DATA_WIDTH]  -->|___|-\ /\ /->|___|------->|___|------->|___|-\ /\ /->|___|-------|    |     [3*DW+:DW]
                                        ID:       1    X  X     5            9            13   X  X     17             |
       i_data_bus[4*DATA_WIDTH+:DATA_WIDTH]  -->|¯¯¯|-/ \/ \->|¯¯¯|------->|¯¯¯|------->|¯¯¯|-/ \/ \->|¯¯¯|-------|    v
       i_data_bus[5*DATA_WIDTH+:DATA_WIDTH]  -->|___|-\ /\--->|___|--\ /-->|___|--\ /-->|___|---/\ /->|___|-----| |  |¯¯¯|
                                        ID:       2    X        6     X      10    X      14      X     18      | |->|_x_|---o_data_bus
       i_data_bus[6*DATA_WIDTH+:DATA_WIDTH]  -->|¯¯¯|-/ \---->|¯¯¯|--/ \-->|¯¯¯|--/ \-->|¯¯¯|----/ \->|¯¯¯|---| |      |     [4*DW+:DW]
       i_data_bus[7*DATA_WIDTH+:DATA_WIDTH]  -->|___|-------->|___|------->|___|------->|___|-------->|___|-| | |      v
                                        ID:       3             7            11           15            19  | | |    |¯¯¯|
          CONNECTION FUNCTION                   INVERSE SHUFFLE      ,,         SHUFFLE       SHUFFLE       | | |--->|_x_|---o_data_bus
         CONNECTION GROUP SIZE                         8             4             4             8          | |        |     [5*DW+:DW]
                                                                                                            | |        v
                                                                                                            | |      |¯¯¯|
                                                                                                            | |----->|_x_|---o_data_bus
                                                                                                            |          |     [6*DW+:DW]
                                                                                                            |          v
                                                                                                            |        |¯¯¯|
                                                                                                            |------->|_x_|---o_data_bus
                                                                                                                             [7*DW+:DW]


                                                               BENES Network                                   1D Multiplier                   Augmented Reduction Tree
                                                                                                        DW stands for MAX_DATA_WIDTH




                                                                                    |     |¯¯¯|
                                                                                    v     |_+_|
               |¯¯¯|                    |¯¯¯|                 |¯¯¯|               |¯¯¯|     |
               |___|                    |_x_|                 |_+_|               |_+_|     v
       distribute_2x2_simple       multiplier_seq       single_reduce_seq      single_reduce_forward_seq


    Author:      Jianming Tong (jianming.tong@gatech.edu)
*/

/*
    parameter illustration:
    1. COMMAND_WIDTH means the length of command for a single switch, so each switch need COMMAND_WIDTH because of two inputs.
    2. IN_COMMAND_WIDTH means total length of command fed into the design. It is used to calculate the length of the output command.
    3. DATA_WIDTH means the length of a single data, arbitrary number is supported in the design.
*/

module tb_maeri_first_half_seq();
    parameter DATA_WIDTH = 8;
    parameter COMMAND_WIDTH  = 2;
    parameter IN_COMMAND_WIDTH  = 30; // o_cmd should have 2 bits
    parameter NUM_INPUT_DATA = 16;

    //parameter
    localparam NUM_SWITCH_IN = NUM_INPUT_DATA >> 1;
    localparam LEVEL = $clog2(NUM_SWITCH_IN);
    localparam TOTAL_STAGE = 2*LEVEL+1;

    localparam TOTAL_COMMAND = NUM_SWITCH_IN*IN_COMMAND_WIDTH;
    localparam BENES_COMMAND_ROW = TOTAL_STAGE*COMMAND_WIDTH;
    localparam OUT_COMMAND_WIDTH = TOTAL_COMMAND - NUM_SWITCH_IN*TOTAL_STAGE*COMMAND_WIDTH;

    localparam WIDTH_INPUT_DATA = NUM_INPUT_DATA*DATA_WIDTH;

    // interface
    reg                                        clk;
    reg                                        rst_n;

    reg  [NUM_INPUT_DATA-1:0]                  i_valid;
    reg  [WIDTH_INPUT_DATA-1:0]                i_data_bus;

    wire [NUM_INPUT_DATA-1:0]                  o_valid;
    wire [WIDTH_INPUT_DATA-1:0]                o_data_bus; //{o_data_a, o_data_b}

    reg                                        i_en;
    reg  [TOTAL_COMMAND-1:0]                   i_cmd;

    // Test case declaration
    // all cases for control
    /*
        error output
        # o_data_bus: 00000000000000000000000000000000
        #
        # o_data_bus: 00000000000000000000000000000000
        #
        # o_data_bus: 00000000000000000000000000000000
        #
        # o_data_bus: 00000000000000000000000000000000
        #
        # o_data_bus: 00000000000000000000000000000000
        #
        # o_data_bus: 00000000000000000000000000000000
        #
        # o_data_bus: 00000000000000000000000000000000
        #
        # o_data_bus: 00000000000000000000000000000000
        #
        # o_data_bus: 00000000000000000000000000000000
        #
        # o_data_bus: 00000000000000000000000000000000
        #
        # o_data_bus: 000000000000007e9a2e2d4055000a16
        #
        # o_data_bus: 0000000000000084a13030445a000b18
        #
        # o_data_bus: 000000000000008aa83233485f000c1a
        #
        # o_data_bus: 0000000000000090af34364c64000d1c
        #
        # o_data_bus: 00000000000000a2c43a3f5873001022
        #
        # o_data_bus: 00000000000000a8cb3c425c78001124
        #
        # o_data_bus: 00000000000000aed23e45607d001226
        #
        # o_data_bus: 00000000000000b4d940486482001328
        #
        # o_data_bus: 00000000000000000000000000000000
    */
    initial
    begin
        // disable
        clk = 1'b0;
        rst_n = 1'b1;
        i_data_bus = {{8'h00},{8'h00},{8'h00},{8'h00},{8'h00},{8'h00},{8'h00},{8'h06},{8'h07},{8'h02},{8'h03},{8'h04},{8'h05},{8'h00},{8'h01},{8'h02}};
        i_valid = 16'h01ff;
        i_en = 1'b0;
        i_cmd = {{{(BENES_COMMAND_ROW>>1){2'b10}},{8'b01110101},{8'b01110101}},{{(BENES_COMMAND_ROW>>1){2'b10}},{8'b01110101},{8'b01110101}},{{(BENES_COMMAND_ROW>>1){2'b10}},{8'b01110101},{8'b01110101}},{{(BENES_COMMAND_ROW>>1){2'b10}},{8'b01110101},{8'b01110101}},{{(BENES_COMMAND_ROW>>1){2'b10}},{8'b01110101},{8'b01110101}},{{(BENES_COMMAND_ROW>>1){2'b10}},{8'b01110101},{8'b01110101}},{{(BENES_COMMAND_ROW>>1){2'b10}},{8'b01110101},{8'b01110101}},{{(BENES_COMMAND_ROW>>1){2'b10}},{8'b01110101},{8'b01110101}}};

        // reset
        #10
        rst_n = 1'b0;
        i_data_bus = {{8'h00},{8'h00},{8'h00},{8'h00},{8'h00},{8'h00},{8'h00},{8'h06},{8'h07},{8'h02},{8'h03},{8'h04},{8'h05},{8'h00},{8'h01},{8'h02}};
        i_valid = 16'h01ff;
        i_en = 1'b1;
        i_cmd = {{{(BENES_COMMAND_ROW>>1){2'b10}},{8'b01110101},{8'b01110101}},{{(BENES_COMMAND_ROW>>1){2'b10}},{8'b01110101},{8'b01110101}},{{(BENES_COMMAND_ROW>>1){2'b10}},{8'b01110101},{8'b01110101}},{{(BENES_COMMAND_ROW>>1){2'b10}},{8'b01110101},{8'b01110101}},{{(BENES_COMMAND_ROW>>1){2'b10}},{8'b01110101},{8'b01110101}},{{(BENES_COMMAND_ROW>>1){2'b10}},{8'b01110101},{8'b01110101}},{{(BENES_COMMAND_ROW>>1){2'b10}},{8'b01110101},{8'b01110101}},{{(BENES_COMMAND_ROW>>1){2'b10}},{8'b01110101},{8'b01110101}}};

        /*
            case start!
        */

        // cycle 0
        #10
        $display("o_data_bus: %h\n", o_data_bus);
        rst_n = 1'b1;
        i_data_bus = {{8'h00},{8'h00},{8'h00},{8'h00},{8'h00},{8'h00},{8'h00},{8'h06},{8'h07},{8'h02},{8'h03},{8'h04},{8'h05},{8'h00},{8'h01},{8'h02}};
        i_valid = 16'h01ff;
        i_en = 1'b1;
        i_cmd = {{{(BENES_COMMAND_ROW>>1){2'b10}},{8'b01110101},{8'b01110101}},{{(BENES_COMMAND_ROW>>1){2'b10}},{8'b01110101},{8'b01110101}},{{(BENES_COMMAND_ROW>>1){2'b10}},{8'b01110101},{8'b01110101}},{{(BENES_COMMAND_ROW>>1){2'b10}},{8'b01110101},{8'b01110101}},{{(BENES_COMMAND_ROW>>1){2'b10}},{8'b01110101},{8'b01110101}},{{(BENES_COMMAND_ROW>>1){2'b10}},{8'b01110101},{8'b01110101}},{{(BENES_COMMAND_ROW>>1){2'b10}},{8'b01110101},{8'b01110101}},{{(BENES_COMMAND_ROW>>1){2'b10}},{8'b01110101},{8'b01110101}}};

        // cycle 1
        #10
        $display("o_data_bus: %h\n", o_data_bus);
        rst_n = 1'b1;
        i_data_bus = {{8'h00},{8'h00},{8'h00},{8'h00},{8'h00},{8'h00},{8'h00},{8'h15},{8'h16},{8'h17},{8'h0F},{8'h10},{8'h11},{8'h09},{8'h0A},{8'h0B}};
        i_valid = 16'h01ff;
        i_en = 1'b1;
        i_cmd = {{{(BENES_COMMAND_ROW>>1){2'b10}},{8'b01110101},{8'b01110101}},{{(BENES_COMMAND_ROW>>1){2'b10}},{8'b01110101},{8'b01110101}},{{(BENES_COMMAND_ROW>>1){2'b10}},{8'b01110101},{8'b01110101}},{{(BENES_COMMAND_ROW>>1){2'b10}},{8'b01110101},{8'b01110111}},{{(BENES_COMMAND_ROW>>1){2'b10}},{8'b01111111},{8'b01111111}},{{(BENES_COMMAND_ROW>>1){2'b10}},{8'b01110111},{8'b01111111}},{{(BENES_COMMAND_ROW>>1){2'b10}},{8'b01111111},{8'b01110111}},{{(BENES_COMMAND_ROW>>1){2'b10}},{8'b01111111},{8'b01111111}}};

        // cycle 2
        #10
        $display("o_data_bus: %h\n", o_data_bus);
        rst_n = 1'b1;
        i_data_bus = {{8'h00},{8'h00},{8'h00},{8'h00},{8'h00},{8'h00},{8'h00},{8'h16},{8'h17},{8'h18},{8'h10},{8'h11},{8'h12},{8'h0A},{8'h0B},{8'h0C}};
        i_valid = 16'h0049;
        i_en = 1'b1;
        i_cmd = {{{(BENES_COMMAND_ROW>>1){2'b10}},{8'b01110101},{8'b01110101}},{{(BENES_COMMAND_ROW>>1){2'b10}},{8'b01110101},{8'b01110101}},{{(BENES_COMMAND_ROW>>1){2'b10}},{8'b01110101},{8'b01110101}},{{(BENES_COMMAND_ROW>>1){2'b10}},{8'b01110101},{8'b01110000}},{{(BENES_COMMAND_ROW>>1){2'b10}},{8'b01111000},{8'b01111111}},{{(BENES_COMMAND_ROW>>1){2'b10}},{8'b01110000},{8'b01111000}},{{(BENES_COMMAND_ROW>>1){2'b10}},{8'b01111111},{8'b01110000}},{{(BENES_COMMAND_ROW>>1){2'b10}},{8'b01111000},{8'b01111111}}};

        // cycle 3
        #10
        $display("o_data_bus: %h\n", o_data_bus);
        rst_n = 1'b1;
        i_data_bus = {{8'h00},{8'h00},{8'h00},{8'h00},{8'h00},{8'h00},{8'h00},{8'h17},{8'h18},{8'h19},{8'h11},{8'h12},{8'h13},{8'h0B},{8'h0C},{8'h0D}};
        i_valid = 16'h0049;
        i_en = 1'b1;
        i_cmd = {{{(BENES_COMMAND_ROW>>1){2'b10}},{8'b01110101},{8'b01110101}},{{(BENES_COMMAND_ROW>>1){2'b10}},{8'b01110101},{8'b01110101}},{{(BENES_COMMAND_ROW>>1){2'b10}},{8'b01110101},{8'b01110101}},{{(BENES_COMMAND_ROW>>1){2'b10}},{8'b01110101},{8'b01110000}},{{(BENES_COMMAND_ROW>>1){2'b10}},{8'b01111000},{8'b01111111}},{{(BENES_COMMAND_ROW>>1){2'b10}},{8'b01110000},{8'b01111000}},{{(BENES_COMMAND_ROW>>1){2'b10}},{8'b01111111},{8'b01110000}},{{(BENES_COMMAND_ROW>>1){2'b10}},{8'b01111000},{8'b01111111}}};

        // cycle 4
        #10
        $display("o_data_bus: %h\n", o_data_bus);
        rst_n = 1'b1;
        i_data_bus = {{8'h00},{8'h00},{8'h00},{8'h00},{8'h00},{8'h00},{8'h00},{8'h18},{8'h19},{8'h1A},{8'h12},{8'h13},{8'h14},{8'h0C},{8'h0D},{8'h0E}};
        i_valid = 16'h0049;
        i_en = 1'b1;
        i_cmd = {{{(BENES_COMMAND_ROW>>1){2'b10}},{8'b01110101},{8'b01110101}},{{(BENES_COMMAND_ROW>>1){2'b10}},{8'b01110101},{8'b01110101}},{{(BENES_COMMAND_ROW>>1){2'b10}},{8'b01110101},{8'b01110101}},{{(BENES_COMMAND_ROW>>1){2'b10}},{8'b01110101},{8'b01110000}},{{(BENES_COMMAND_ROW>>1){2'b10}},{8'b01110000},{8'b01110111}},{{(BENES_COMMAND_ROW>>1){2'b10}},{8'b01110000},{8'b01110000}},{{(BENES_COMMAND_ROW>>1){2'b10}},{8'b01110111},{8'b01110000}},{{(BENES_COMMAND_ROW>>1){2'b10}},{8'b01110000},{8'b01110111}}};

        // cycle 5
        #10
        $display("o_data_bus: %h\n", o_data_bus);
        i_data_bus = {{8'h00},{8'h00},{8'h00},{8'h00},{8'h00},{8'h00},{8'h00},{8'h1B},{8'h1C},{8'h1D},{8'h15},{8'h16},{8'h17},{8'h0F},{8'h10},{8'h11}};
        rst_n = 1'b1;
        i_cmd = {{{(BENES_COMMAND_ROW>>1){2'b10}},{8'b01110101},{8'b01110101}},{{(BENES_COMMAND_ROW>>1){2'b10}},{8'b01110101},{8'b01110101}},{{(BENES_COMMAND_ROW>>1){2'b10}},{8'b01110101},{8'b01110101}},{{(BENES_COMMAND_ROW>>1){2'b10}},{8'b01110101},{8'b01110111}},{{(BENES_COMMAND_ROW>>1){2'b10}},{8'b01111111},{8'b01111111}},{{(BENES_COMMAND_ROW>>1){2'b10}},{8'b01110111},{8'b01111111}},{{(BENES_COMMAND_ROW>>1){2'b10}},{8'b01111111},{8'b01110111}},{{(BENES_COMMAND_ROW>>1){2'b10}},{8'b01111111},{8'b01111111}}};
        i_valid = 16'h01ff;
        i_en = 1'b1;

        // cycle 6
        #10
        $display("o_data_bus: %h\n", o_data_bus);
        rst_n = 1'b1;
        i_data_bus = {{8'h00},{8'h00},{8'h00},{8'h00},{8'h00},{8'h00},{8'h00},{8'h1C},{8'h1D},{8'h1E},{8'h16},{8'h17},{8'h18},{8'h10},{8'h11},{8'h12}};
        i_cmd = {{{(BENES_COMMAND_ROW>>1){2'b10}},{8'b01110101},{8'b01110101}},{{(BENES_COMMAND_ROW>>1){2'b10}},{8'b01110101},{8'b01110101}},{{(BENES_COMMAND_ROW>>1){2'b10}},{8'b01110101},{8'b01110101}},{{(BENES_COMMAND_ROW>>1){2'b10}},{8'b01110101},{8'b01110000}},{{(BENES_COMMAND_ROW>>1){2'b10}},{8'b01111000},{8'b01111111}},{{(BENES_COMMAND_ROW>>1){2'b10}},{8'b01110000},{8'b01111000}},{{(BENES_COMMAND_ROW>>1){2'b10}},{8'b01111111},{8'b01110000}},{{(BENES_COMMAND_ROW>>1){2'b10}},{8'b01111000},{8'b01111111}}};
        i_valid = 16'h0049;
        i_en = 1'b1;

        // cycle 7
        #10
        $display("o_data_bus: %h\n", o_data_bus);
        rst_n = 1'b1;
        i_data_bus = {{8'h00},{8'h00},{8'h00},{8'h00},{8'h00},{8'h00},{8'h00},{8'h1D},{8'h1E},{8'h1F},{8'h17},{8'h18},{8'h19},{8'h11},{8'h12},{8'h13}};
        i_cmd = {{{(BENES_COMMAND_ROW>>1){2'b10}},{8'b01110101},{8'b01110101}},{{(BENES_COMMAND_ROW>>1){2'b10}},{8'b01110101},{8'b01110101}},{{(BENES_COMMAND_ROW>>1){2'b10}},{8'b01110101},{8'b01110101}},{{(BENES_COMMAND_ROW>>1){2'b10}},{8'b01110101},{8'b01110000}},{{(BENES_COMMAND_ROW>>1){2'b10}},{8'b01111000},{8'b01111111}},{{(BENES_COMMAND_ROW>>1){2'b10}},{8'b01110000},{8'b01111000}},{{(BENES_COMMAND_ROW>>1){2'b10}},{8'b01111111},{8'b01110000}},{{(BENES_COMMAND_ROW>>1){2'b10}},{8'b01111000},{8'b01111111}}};
        i_valid = 16'h0049;
        i_en = 1'b1;

        // cycle 8
        #10
        $display("o_data_bus: %h\n", o_data_bus);
        rst_n = 1'b1;
        i_data_bus = {{8'h00},{8'h00},{8'h00},{8'h00},{8'h00},{8'h00},{8'h00},{8'h1E},{8'h1F},{8'h20},{8'h18},{8'h19},{8'h1A},{8'h12},{8'h13},{8'h14}};
        i_cmd = {{{(BENES_COMMAND_ROW>>1){2'b10}},{8'b01110101},{8'b01110101}},{{(BENES_COMMAND_ROW>>1){2'b10}},{8'b01110101},{8'b01110101}},{{(BENES_COMMAND_ROW>>1){2'b10}},{8'b01110101},{8'b01110101}},{{(BENES_COMMAND_ROW>>1){2'b10}},{8'b01110101},{8'b01110000}},{{(BENES_COMMAND_ROW>>1){2'b10}},{8'b01110000},{8'b01110111}},{{(BENES_COMMAND_ROW>>1){2'b10}},{8'b01110000},{8'b01110000}},{{(BENES_COMMAND_ROW>>1){2'b10}},{8'b01110111},{8'b01110000}},{{(BENES_COMMAND_ROW>>1){2'b10}},{8'b01110000},{8'b01110111}}};
        i_valid = 16'h0049;
        i_en = 1'b1;

        // cycle 9 -- no valid input
        #10
        $display("o_data_bus: %h\n", o_data_bus);
        rst_n = 1'b1;
        i_data_bus = {{8'h00},{8'h00},{8'h00},{8'h00},{8'h00},{8'h00},{8'h00},{8'h06},{8'h07},{8'h02},{8'h03},{8'h04},{8'h05},{8'h00},{8'h01},{8'h02}};
        i_valid = 16'h0000;
        i_en = 1'b1;
        i_cmd = {{{(BENES_COMMAND_ROW>>1){2'b10}},{8'b01110101},{8'b01110101}},{{(BENES_COMMAND_ROW>>1){2'b10}},{8'b01110101},{8'b01110101}},{{(BENES_COMMAND_ROW>>1){2'b10}},{8'b01110101},{8'b01110101}},{{(BENES_COMMAND_ROW>>1){2'b10}},{8'b01110101},{8'b01110111}},{{(BENES_COMMAND_ROW>>1){2'b10}},{8'b01110000},{8'b01110000}},{{(BENES_COMMAND_ROW>>1){2'b10}},{8'b01110111},{8'b01110000}},{{(BENES_COMMAND_ROW>>1){2'b10}},{8'b01110000},{8'b01110111}},{{(BENES_COMMAND_ROW>>1){2'b10}},{8'b01110000},{8'b01110000}}};


        // cycle 10 -- no valid input
        #10
        $display("o_data_bus: %h\n", o_data_bus);
        rst_n = 1'b1;
        i_data_bus = {{8'h02},{8'h01},{8'h00},{8'h05},{8'h04},{8'h03},{8'h08},{8'h07},{8'h06},{8'h00},{8'h00},{8'h00},{8'h00},{8'h00},{8'h00},{8'h00}};
        i_valid = 16'h0000;
        i_en = 1'b1;
        i_cmd = {{{(BENES_COMMAND_ROW>>1){2'b10}},{8'b01110101},{8'b01110101}},{{(BENES_COMMAND_ROW>>1){2'b10}},{8'b01110101},{8'b01110101}},{{(BENES_COMMAND_ROW>>1){2'b10}},{8'b01110101},{8'b01110101}},{{(BENES_COMMAND_ROW>>1){2'b10}},{8'b01110101},{8'b01110111}},{{(BENES_COMMAND_ROW>>1){2'b10}},{8'b01110000},{8'b01110000}},{{(BENES_COMMAND_ROW>>1){2'b10}},{8'b01110111},{8'b01110000}},{{(BENES_COMMAND_ROW>>1){2'b10}},{8'b01110000},{8'b01110111}},{{(BENES_COMMAND_ROW>>1){2'b10}},{8'b01110000},{8'b01110000}}};

        #10
        $display("o_data_bus: %h\n", o_data_bus);
        #10
        $display("o_data_bus: %h\n", o_data_bus);
        #10
        $display("o_data_bus: %h\n", o_data_bus);
        #10
        $display("o_data_bus: %h\n", o_data_bus);
        #10
        $display("o_data_bus: %h\n", o_data_bus);
        #10
        $display("o_data_bus: %h\n", o_data_bus);
        #10
        $display("o_data_bus: %h\n", o_data_bus);
        #10
        $display("o_data_bus: %h\n", o_data_bus);
        $stop;
    end

    // instantiate DUT (device under test)
    maeri_first_half_seq #(
        .DATA_WIDTH(DATA_WIDTH),
        .COMMAND_WIDTH(COMMAND_WIDTH),
        .NUM_INPUT_DATA(NUM_INPUT_DATA),
        .IN_COMMAND_WIDTH(IN_COMMAND_WIDTH)
    ) dut(
        .clk(clk),
        .rst_n(rst_n),
        .i_valid(i_valid),
        .i_data_bus(i_data_bus),
        .o_valid(o_valid),
        .o_data_bus(o_data_bus),
        .i_en(i_en),
        .i_cmd(i_cmd)
    );

    always#5 clk=~clk;

endmodule
