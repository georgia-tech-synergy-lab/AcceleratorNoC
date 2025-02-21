`timescale 1ns / 1ps
/*
    Top Module:  crossbar_one_hot_comb
    Data:        Only data width matters.
    Format:      keeping the input format unchange
    Timing:      Combinational Logic
    Dummy Data:  {DATA_WIDTH{1'b0}}
    Command:     Each data comes with a NUM_OUTPUT_DATA-bit one-hot destination command.
                 i_data_bus[0*DATA_WIDTH+:DATA_WIDTH] is corresponding to i_cmd
    Function:    Arbitrary Unicast  or  Arbitrary Multicast
    Note: this file is not parameterizable.

    Example: A 5:4 crossbar. For a single cycle version
        i_data_bus[0*DATA_WIDTH+:DATA_WIDTH]  ------------------------------------>
                                               |        |        |        |
        i_data_bus[1*DATA_WIDTH+:DATA_WIDTH]  ------------------------------------>
                                               ||       ||       ||       ||
        i_data_bus[2*DATA_WIDTH+:DATA_WIDTH]  ------------------------------------>
                                               |||      |||      |||      |||
        i_data_bus[3*DATA_WIDTH+:DATA_WIDTH]  ------------------------------------>
                                               ||||     ||||     ||||     ||||
        i_data_bus[4*DATA_WIDTH+:DATA_WIDTH]  ------------------------------------>
                                               |||||    |||||    |||||    |||||
                                               ______   ______   ______   ______
      5-bit one-hot control to each of mux ->  \____/   \____/   \____/   \____/
                                                 |        |        |        |
                                                 v        v        v        v
                                          o_data_bus o_data_bus o_data_bus o_data_bus
                          [0*DATA_WIDTH+:DATA_WIDTH]           ...         [3*DATA_WIDTH+:DATA_WIDTH]


    Example: A 64:8 hierarchy. For a hierarchy version [2 pipeline stages: first stage = 8* 8:1 mux -- second stage = 1* 8:1 mux;]
             The following is the hierarchy crossbar for a single output data.
             And the whole hierarachy crossbar needs to instantiate the following logic multiple times.

        i_data_bus[0*DATA_WIDTH+:DATA_WIDTH]  ------------------------------------------------------------------------------------------------->
                                                |                                                           |
        i_data_bus[1*DATA_WIDTH+:DATA_WIDTH]  ------------------------------------------------------------------------------------------------->
                                                ||                                                          ||
        i_data_bus[2*DATA_WIDTH+:DATA_WIDTH]  ------------------------------------------------------------------------------------------------->
                                                |||                                                         |||
              ....                              ...                                                         ...
                                                ||||||||                                                    ||||||||
        i_data_bus[63*DATA_WIDTH+:DATA_WIDTH]  ------------------------------------------------------------------------------------------------->
                                                ||||||||                                                    ||||||||
                                                ||||||||     ...   i_data_bus[0*DATA_WIDTH+:DATA_WIDTH] ->  |||||||| <- i_data_bus[7*DATA_WIDTH+:DATA_WIDTH]
                                                ||||||||                                                    ||||||||
        i_data_bus[56*DATA_WIDTH+:DATA_WIDTH]-> |||||||| <- i_data_bus[63*DATA_WIDTH+:DATA_WIDTH]   ...     ||||||||
                                               __________                                                  __________
      5-bit one-hot control to each of mux ->  \________/                                                  \________/
                                                   |                                                           |
                                                   v                                                           v
                                        inner_first_stage_data_reg[7]                            inner_first_stage_data_reg[0]
                                                   |                                                           |
                                                   ---------------------------  ... ----------------------------
                                                                             ||||||||
                                                                            __________
                                                                            \________/          same logic repeats for 8 times.
                                                                                |
                                                                                v
                                                                           o_data_bus[7]    ...  o_data_bus[0]


    Author:      Jianming Tong (jianming.tong@gatech.edu)
*/


// `define In16_Out8
// `define In64_Out8
// `define In64_Out8_hier_8_8
`define In32_Out8_hier_4_8

`ifdef In16_Out8
module crossbar_one_hot_comb#(
    parameter DATA_WIDTH = 32,      // could be arbitrary number
    parameter NUM_OUTPUT_DATA  = 8, // must be power of 2.
    parameter NUM_INPUT_DATA = 16
)(
    // data signals
    i_valid,        // valid input data signal
    i_data_bus,     // input data bus coming into distribute switch

    o_valid,        // output valid
    o_data_bus,     // output data

    // control signals
    i_en,           // distribute switch enable
    i_cmd           // the input should be one-hot encoded command
);
    //parameter
    localparam TOTAL_COMMAND = NUM_INPUT_DATA*NUM_OUTPUT_DATA;

    localparam WIDTH_INPUT_DATA = NUM_INPUT_DATA*DATA_WIDTH;
    localparam WIDTH_OUTPUT_DATA = NUM_OUTPUT_DATA*DATA_WIDTH;

    // interface
    input  [NUM_INPUT_DATA-1:0]                  i_valid;
    input  [WIDTH_INPUT_DATA-1:0]                i_data_bus;

    output [NUM_OUTPUT_DATA-1:0]                 o_valid;
    output [WIDTH_OUTPUT_DATA-1:0]               o_data_bus; // {o_data_a, o_data_b}

    input                                        i_en;
    input  [TOTAL_COMMAND-1:0]                   i_cmd;

    reg    [NUM_OUTPUT_DATA-1:0]                 o_valid_reg;
    reg    [WIDTH_OUTPUT_DATA-1:0]               o_data_bus_reg;

    genvar i,j;
    generate
        for(i=0; i<NUM_OUTPUT_DATA; i=i+1)
        begin: o_data_output_mux
            wire [NUM_INPUT_DATA-1:0] inner_cmd_wire;
            assign inner_cmd_wire = {i_cmd[15*NUM_OUTPUT_DATA+i],i_cmd[14*NUM_OUTPUT_DATA+i],i_cmd[13*NUM_OUTPUT_DATA+i],i_cmd[12*NUM_OUTPUT_DATA+i],i_cmd[11*NUM_OUTPUT_DATA+i],i_cmd[10*NUM_OUTPUT_DATA+i],i_cmd[9*NUM_OUTPUT_DATA+i],i_cmd[8*NUM_OUTPUT_DATA+i],i_cmd[7*NUM_OUTPUT_DATA+i],i_cmd[6*NUM_OUTPUT_DATA+i],i_cmd[5*NUM_OUTPUT_DATA+i],i_cmd[4*NUM_OUTPUT_DATA+i],i_cmd[3*NUM_OUTPUT_DATA+i],i_cmd[2*NUM_OUTPUT_DATA+i],i_cmd[1*NUM_OUTPUT_DATA+i],i_cmd[0*NUM_OUTPUT_DATA+i]};
            always@(*)
            begin
               if(i_en)
                begin
                    case(inner_cmd_wire)
                        16'b0000000000000001:
                        begin
                            o_data_bus_reg[i*DATA_WIDTH+:DATA_WIDTH] <= (i_valid[0])?i_data_bus[0*DATA_WIDTH+:DATA_WIDTH]:{DATA_WIDTH{1'b0}};
                            o_valid_reg[i] <= 1'b1;
                        end
                        16'b0000000000000010:
                        begin
                            o_data_bus_reg[i*DATA_WIDTH+:DATA_WIDTH] <= (i_valid[1])?i_data_bus[1*DATA_WIDTH+:DATA_WIDTH]:{DATA_WIDTH{1'b0}};
                            o_valid_reg[i] <= 1'b1;
                        end
                        16'b0000000000000100:
                        begin
                            o_data_bus_reg[i*DATA_WIDTH+:DATA_WIDTH] <= (i_valid[2])?i_data_bus[2*DATA_WIDTH+:DATA_WIDTH]:{DATA_WIDTH{1'b0}};
                            o_valid_reg[i] <= 1'b1;
                        end
                        16'b0000000000001000:
                        begin
                            o_data_bus_reg[i*DATA_WIDTH+:DATA_WIDTH] <= (i_valid[3])?i_data_bus[3*DATA_WIDTH+:DATA_WIDTH]:{DATA_WIDTH{1'b0}};
                            o_valid_reg[i] <= 1'b1;
                        end
                        16'b0000000000010000:
                        begin
                            o_data_bus_reg[i*DATA_WIDTH+:DATA_WIDTH] <= (i_valid[4])?i_data_bus[4*DATA_WIDTH+:DATA_WIDTH]:{DATA_WIDTH{1'b0}};
                            o_valid_reg[i] <= 1'b1;
                        end
                        16'b0000000000100000:
                        begin
                            o_data_bus_reg[i*DATA_WIDTH+:DATA_WIDTH] <= (i_valid[5])?i_data_bus[5*DATA_WIDTH+:DATA_WIDTH]:{DATA_WIDTH{1'b0}};
                            o_valid_reg[i] <= 1'b1;
                        end
                        16'b0000000001000000:
                        begin
                            o_data_bus_reg[i*DATA_WIDTH+:DATA_WIDTH] <= (i_valid[6])?i_data_bus[6*DATA_WIDTH+:DATA_WIDTH]:{DATA_WIDTH{1'b0}};
                            o_valid_reg[i] <= 1'b1;
                        end
                        16'b0000000010000000:
                        begin
                            o_data_bus_reg[i*DATA_WIDTH+:DATA_WIDTH] <= (i_valid[7])?i_data_bus[7*DATA_WIDTH+:DATA_WIDTH]:{DATA_WIDTH{1'b0}};
                            o_valid_reg[i] <= 1'b1;
                        end
                        16'b0000000100000000:
                        begin
                            o_data_bus_reg[i*DATA_WIDTH+:DATA_WIDTH] <= (i_valid[8])?i_data_bus[8*DATA_WIDTH+:DATA_WIDTH]:{DATA_WIDTH{1'b0}};
                            o_valid_reg[i] <= 1'b1;
                        end
                        16'b0000001000000000:
                        begin
                            o_data_bus_reg[i*DATA_WIDTH+:DATA_WIDTH] <= (i_valid[9])?i_data_bus[9*DATA_WIDTH+:DATA_WIDTH]:{DATA_WIDTH{1'b0}};
                            o_valid_reg[i] <= 1'b1;
                        end
                        16'b0000010000000000:
                        begin
                            o_data_bus_reg[i*DATA_WIDTH+:DATA_WIDTH] <= (i_valid[10])?i_data_bus[10*DATA_WIDTH+:DATA_WIDTH]:{DATA_WIDTH{1'b0}};
                            o_valid_reg[i] <= 1'b1;
                        end
                        16'b0000100000000000:
                        begin
                            o_data_bus_reg[i*DATA_WIDTH+:DATA_WIDTH] <= (i_valid[11])?i_data_bus[11*DATA_WIDTH+:DATA_WIDTH]:{DATA_WIDTH{1'b0}};
                            o_valid_reg[i] <= 1'b1;
                        end
                        16'b0001000000000000:
                        begin
                            o_data_bus_reg[i*DATA_WIDTH+:DATA_WIDTH] <= (i_valid[12])?i_data_bus[12*DATA_WIDTH+:DATA_WIDTH]:{DATA_WIDTH{1'b0}};
                            o_valid_reg[i] <= 1'b1;
                        end
                        16'b0010000000000000:
                        begin
                            o_data_bus_reg[i*DATA_WIDTH+:DATA_WIDTH] <= (i_valid[13])?i_data_bus[13*DATA_WIDTH+:DATA_WIDTH]:{DATA_WIDTH{1'b0}};
                            o_valid_reg[i] <= 1'b1;
                        end
                        16'b0100000000000000:
                        begin
                            o_data_bus_reg[i*DATA_WIDTH+:DATA_WIDTH] <= (i_valid[14])?i_data_bus[14*DATA_WIDTH+:DATA_WIDTH]:{DATA_WIDTH{1'b0}};
                            o_valid_reg[i] <= 1'b1;
                        end
                        16'b1000000000000000:
                        begin
                            o_data_bus_reg[i*DATA_WIDTH+:DATA_WIDTH] <= (i_valid[15])?i_data_bus[15*DATA_WIDTH+:DATA_WIDTH]:{DATA_WIDTH{1'b0}};
                            o_valid_reg[i] <= 1'b1;
                        end
                        default:
                        begin
                            o_data_bus_reg[i*DATA_WIDTH+:DATA_WIDTH] <= {WIDTH_OUTPUT_DATA{1'b0}};
                            o_valid_reg[i] <= 1'b0;
                        end
                    endcase
                end
                else
                begin
                    o_data_bus_reg[i*DATA_WIDTH+:DATA_WIDTH] <= {WIDTH_OUTPUT_DATA{1'b0}};
                    o_valid_reg[i] <= 1'b0;
                end
            end
        end
    endgenerate

    assign o_data_bus = o_data_bus_reg;
    assign o_valid = o_valid_reg;

endmodule
`endif


`ifdef In64_Out8
module crossbar_one_hot_comb#(
    parameter DATA_WIDTH = 32,      // could be arbitrary number
    parameter NUM_OUTPUT_DATA  = 8, // must be power of 2.
    parameter NUM_INPUT_DATA = 64
)(
    // data signals
    i_valid,        // valid input data signal
    i_data_bus,     // input data bus coming into distribute switch

    o_valid,        // output valid
    o_data_bus,     // output data

    // control signals
    i_en,           // distribute switch enable
    i_cmd           // the input should be one-hot encoded command
);
    //parameter
    localparam TOTAL_COMMAND = NUM_INPUT_DATA*NUM_OUTPUT_DATA;

    localparam WIDTH_INPUT_DATA = NUM_INPUT_DATA*DATA_WIDTH;
    localparam WIDTH_OUTPUT_DATA = NUM_OUTPUT_DATA*DATA_WIDTH;

    // interface
    input  [NUM_INPUT_DATA-1:0]                  i_valid;
    input  [WIDTH_INPUT_DATA-1:0]                i_data_bus;

    output [NUM_OUTPUT_DATA-1:0]                 o_valid;
    output [WIDTH_OUTPUT_DATA-1:0]               o_data_bus; // {o_data_a, o_data_b}

    input                                        i_en;
    input  [TOTAL_COMMAND-1:0]                  i_cmd;

    reg    [NUM_OUTPUT_DATA-1:0]                 o_valid_reg;
    reg    [WIDTH_OUTPUT_DATA-1:0]               o_data_bus_reg;

    genvar i,j;
    generate
        for(i=0; i<NUM_OUTPUT_DATA; i=i+1)
        begin: o_data_output_mux
            wire [NUM_INPUT_DATA-1:0] inner_cmd_wire;
            assign inner_cmd_wire = {i_cmd[63*NUM_OUTPUT_DATA+i],i_cmd[62*NUM_OUTPUT_DATA+i],i_cmd[61*NUM_OUTPUT_DATA+i],i_cmd[60*NUM_OUTPUT_DATA+i],i_cmd[59*NUM_OUTPUT_DATA+i],i_cmd[58*NUM_OUTPUT_DATA+i],i_cmd[57*NUM_OUTPUT_DATA+i],i_cmd[56*NUM_OUTPUT_DATA+i],i_cmd[55*NUM_OUTPUT_DATA+i],i_cmd[54*NUM_OUTPUT_DATA+i],i_cmd[53*NUM_OUTPUT_DATA+i],i_cmd[52*NUM_OUTPUT_DATA+i],i_cmd[51*NUM_OUTPUT_DATA+i],i_cmd[50*NUM_OUTPUT_DATA+i],i_cmd[49*NUM_OUTPUT_DATA+i],i_cmd[48*NUM_OUTPUT_DATA+i],i_cmd[47*NUM_OUTPUT_DATA+i],i_cmd[46*NUM_OUTPUT_DATA+i],i_cmd[45*NUM_OUTPUT_DATA+i],i_cmd[44*NUM_OUTPUT_DATA+i],i_cmd[43*NUM_OUTPUT_DATA+i],i_cmd[42*NUM_OUTPUT_DATA+i],i_cmd[41*NUM_OUTPUT_DATA+i],i_cmd[40*NUM_OUTPUT_DATA+i],i_cmd[39*NUM_OUTPUT_DATA+i],i_cmd[38*NUM_OUTPUT_DATA+i],i_cmd[37*NUM_OUTPUT_DATA+i],i_cmd[36*NUM_OUTPUT_DATA+i],i_cmd[35*NUM_OUTPUT_DATA+i],i_cmd[34*NUM_OUTPUT_DATA+i],i_cmd[33*NUM_OUTPUT_DATA+i],i_cmd[32*NUM_OUTPUT_DATA+i],i_cmd[31*NUM_OUTPUT_DATA+i],i_cmd[30*NUM_OUTPUT_DATA+i],i_cmd[29*NUM_OUTPUT_DATA+i],i_cmd[28*NUM_OUTPUT_DATA+i],i_cmd[27*NUM_OUTPUT_DATA+i],i_cmd[26*NUM_OUTPUT_DATA+i],i_cmd[25*NUM_OUTPUT_DATA+i],i_cmd[24*NUM_OUTPUT_DATA+i],i_cmd[23*NUM_OUTPUT_DATA+i],i_cmd[22*NUM_OUTPUT_DATA+i],i_cmd[21*NUM_OUTPUT_DATA+i],i_cmd[20*NUM_OUTPUT_DATA+i],i_cmd[19*NUM_OUTPUT_DATA+i],i_cmd[18*NUM_OUTPUT_DATA+i],i_cmd[17*NUM_OUTPUT_DATA+i],i_cmd[16*NUM_OUTPUT_DATA+i],i_cmd[15*NUM_OUTPUT_DATA+i],i_cmd[14*NUM_OUTPUT_DATA+i],i_cmd[13*NUM_OUTPUT_DATA+i],i_cmd[12*NUM_OUTPUT_DATA+i],i_cmd[11*NUM_OUTPUT_DATA+i],i_cmd[10*NUM_OUTPUT_DATA+i],i_cmd[9*NUM_OUTPUT_DATA+i],i_cmd[8*NUM_OUTPUT_DATA+i],i_cmd[7*NUM_OUTPUT_DATA+i],i_cmd[6*NUM_OUTPUT_DATA+i],i_cmd[5*NUM_OUTPUT_DATA+i],i_cmd[4*NUM_OUTPUT_DATA+i],i_cmd[3*NUM_OUTPUT_DATA+i],i_cmd[2*NUM_OUTPUT_DATA+i],i_cmd[1*NUM_OUTPUT_DATA+i],i_cmd[0*NUM_OUTPUT_DATA+i]};
            always@(*)
            begin
                if(i_en)
                begin
                    case(inner_cmd_wire)
                        64'b0000000000000000000000000000000000000000000000000000000000000001:
                        begin
                            o_data_bus_reg[i*DATA_WIDTH+:DATA_WIDTH] <= (i_valid[0])?i_data_bus[0*DATA_WIDTH+:DATA_WIDTH]:{DATA_WIDTH{1'b0}};
                            o_valid_reg[i] <= 1'b1;
                        end
                        64'b0000000000000000000000000000000000000000000000000000000000000010:
                        begin
                            o_data_bus_reg[i*DATA_WIDTH+:DATA_WIDTH] <= (i_valid[1])?i_data_bus[1*DATA_WIDTH+:DATA_WIDTH]:{DATA_WIDTH{1'b0}};
                            o_valid_reg[i] <= 1'b1;
                        end
                        64'b0000000000000000000000000000000000000000000000000000000000000100:
                        begin
                            o_data_bus_reg[i*DATA_WIDTH+:DATA_WIDTH] <= (i_valid[2])?i_data_bus[2*DATA_WIDTH+:DATA_WIDTH]:{DATA_WIDTH{1'b0}};
                            o_valid_reg[i] <= 1'b1;
                        end
                        64'b0000000000000000000000000000000000000000000000000000000000001000:
                        begin
                            o_data_bus_reg[i*DATA_WIDTH+:DATA_WIDTH] <= (i_valid[3])?i_data_bus[3*DATA_WIDTH+:DATA_WIDTH]:{DATA_WIDTH{1'b0}};
                            o_valid_reg[i] <= 1'b1;
                        end
                        64'b0000000000000000000000000000000000000000000000000000000000010000:
                        begin
                            o_data_bus_reg[i*DATA_WIDTH+:DATA_WIDTH] <= (i_valid[4])?i_data_bus[4*DATA_WIDTH+:DATA_WIDTH]:{DATA_WIDTH{1'b0}};
                            o_valid_reg[i] <= 1'b1;
                        end
                        64'b0000000000000000000000000000000000000000000000000000000000100000:
                        begin
                            o_data_bus_reg[i*DATA_WIDTH+:DATA_WIDTH] <= (i_valid[5])?i_data_bus[5*DATA_WIDTH+:DATA_WIDTH]:{DATA_WIDTH{1'b0}};
                            o_valid_reg[i] <= 1'b1;
                        end
                        64'b0000000000000000000000000000000000000000000000000000000001000000:
                        begin
                            o_data_bus_reg[i*DATA_WIDTH+:DATA_WIDTH] <= (i_valid[6])?i_data_bus[6*DATA_WIDTH+:DATA_WIDTH]:{DATA_WIDTH{1'b0}};
                            o_valid_reg[i] <= 1'b1;
                        end
                        64'b0000000000000000000000000000000000000000000000000000000010000000:
                        begin
                            o_data_bus_reg[i*DATA_WIDTH+:DATA_WIDTH] <= (i_valid[7])?i_data_bus[7*DATA_WIDTH+:DATA_WIDTH]:{DATA_WIDTH{1'b0}};
                            o_valid_reg[i] <= 1'b1;
                        end
                        64'b0000000000000000000000000000000000000000000000000000000100000000:
                        begin
                            o_data_bus_reg[i*DATA_WIDTH+:DATA_WIDTH] <= (i_valid[8])?i_data_bus[8*DATA_WIDTH+:DATA_WIDTH]:{DATA_WIDTH{1'b0}};
                            o_valid_reg[i] <= 1'b1;
                        end
                        64'b0000000000000000000000000000000000000000000000000000001000000000:
                        begin
                            o_data_bus_reg[i*DATA_WIDTH+:DATA_WIDTH] <= (i_valid[9])?i_data_bus[9*DATA_WIDTH+:DATA_WIDTH]:{DATA_WIDTH{1'b0}};
                            o_valid_reg[i] <= 1'b1;
                        end
                        64'b0000000000000000000000000000000000000000000000000000010000000000:
                        begin
                            o_data_bus_reg[i*DATA_WIDTH+:DATA_WIDTH] <= (i_valid[10])?i_data_bus[10*DATA_WIDTH+:DATA_WIDTH]:{DATA_WIDTH{1'b0}};
                            o_valid_reg[i] <= 1'b1;
                        end
                        64'b0000000000000000000000000000000000000000000000000000100000000000:
                        begin
                            o_data_bus_reg[i*DATA_WIDTH+:DATA_WIDTH] <= (i_valid[11])?i_data_bus[11*DATA_WIDTH+:DATA_WIDTH]:{DATA_WIDTH{1'b0}};
                            o_valid_reg[i] <= 1'b1;
                        end
                        64'b0000000000000000000000000000000000000000000000000001000000000000:
                        begin
                            o_data_bus_reg[i*DATA_WIDTH+:DATA_WIDTH] <= (i_valid[12])?i_data_bus[12*DATA_WIDTH+:DATA_WIDTH]:{DATA_WIDTH{1'b0}};
                            o_valid_reg[i] <= 1'b1;
                        end
                        64'b0000000000000000000000000000000000000000000000000010000000000000:
                        begin
                            o_data_bus_reg[i*DATA_WIDTH+:DATA_WIDTH] <= (i_valid[13])?i_data_bus[13*DATA_WIDTH+:DATA_WIDTH]:{DATA_WIDTH{1'b0}};
                            o_valid_reg[i] <= 1'b1;
                        end
                        64'b0000000000000000000000000000000000000000000000000100000000000000:
                        begin
                            o_data_bus_reg[i*DATA_WIDTH+:DATA_WIDTH] <= (i_valid[14])?i_data_bus[14*DATA_WIDTH+:DATA_WIDTH]:{DATA_WIDTH{1'b0}};
                            o_valid_reg[i] <= 1'b1;
                        end
                        64'b0000000000000000000000000000000000000000000000001000000000000000:
                        begin
                            o_data_bus_reg[i*DATA_WIDTH+:DATA_WIDTH] <= (i_valid[15])?i_data_bus[15*DATA_WIDTH+:DATA_WIDTH]:{DATA_WIDTH{1'b0}};
                            o_valid_reg[i] <= 1'b1;
                        end
                        64'b0000000000000000000000000000000000000000000000010000000000000000:
                        begin
                            o_data_bus_reg[i*DATA_WIDTH+:DATA_WIDTH] <= (i_valid[16])?i_data_bus[16*DATA_WIDTH+:DATA_WIDTH]:{DATA_WIDTH{1'b0}};
                            o_valid_reg[i] <= 1'b1;
                        end
                        64'b0000000000000000000000000000000000000000000000100000000000000000:
                        begin
                            o_data_bus_reg[i*DATA_WIDTH+:DATA_WIDTH] <= (i_valid[17])?i_data_bus[17*DATA_WIDTH+:DATA_WIDTH]:{DATA_WIDTH{1'b0}};
                            o_valid_reg[i] <= 1'b1;
                        end
                        64'b0000000000000000000000000000000000000000000001000000000000000000:
                        begin
                            o_data_bus_reg[i*DATA_WIDTH+:DATA_WIDTH] <= (i_valid[18])?i_data_bus[18*DATA_WIDTH+:DATA_WIDTH]:{DATA_WIDTH{1'b0}};
                            o_valid_reg[i] <= 1'b1;
                        end
                        64'b0000000000000000000000000000000000000000000010000000000000000000:
                        begin
                            o_data_bus_reg[i*DATA_WIDTH+:DATA_WIDTH] <= (i_valid[19])?i_data_bus[19*DATA_WIDTH+:DATA_WIDTH]:{DATA_WIDTH{1'b0}};
                            o_valid_reg[i] <= 1'b1;
                        end
                        64'b0000000000000000000000000000000000000000000100000000000000000000:
                        begin
                            o_data_bus_reg[i*DATA_WIDTH+:DATA_WIDTH] <= (i_valid[20])?i_data_bus[20*DATA_WIDTH+:DATA_WIDTH]:{DATA_WIDTH{1'b0}};
                            o_valid_reg[i] <= 1'b1;
                        end
                        64'b0000000000000000000000000000000000000000001000000000000000000000:
                        begin
                            o_data_bus_reg[i*DATA_WIDTH+:DATA_WIDTH] <= (i_valid[21])?i_data_bus[21*DATA_WIDTH+:DATA_WIDTH]:{DATA_WIDTH{1'b0}};
                            o_valid_reg[i] <= 1'b1;
                        end
                        64'b0000000000000000000000000000000000000000010000000000000000000000:
                        begin
                            o_data_bus_reg[i*DATA_WIDTH+:DATA_WIDTH] <= (i_valid[22])?i_data_bus[22*DATA_WIDTH+:DATA_WIDTH]:{DATA_WIDTH{1'b0}};
                            o_valid_reg[i] <= 1'b1;
                        end
                        64'b0000000000000000000000000000000000000000100000000000000000000000:
                        begin
                            o_data_bus_reg[i*DATA_WIDTH+:DATA_WIDTH] <= (i_valid[23])?i_data_bus[23*DATA_WIDTH+:DATA_WIDTH]:{DATA_WIDTH{1'b0}};
                            o_valid_reg[i] <= 1'b1;
                        end
                        64'b0000000000000000000000000000000000000001000000000000000000000000:
                        begin
                            o_data_bus_reg[i*DATA_WIDTH+:DATA_WIDTH] <= (i_valid[24])?i_data_bus[24*DATA_WIDTH+:DATA_WIDTH]:{DATA_WIDTH{1'b0}};
                            o_valid_reg[i] <= 1'b1;
                        end
                        64'b0000000000000000000000000000000000000010000000000000000000000000:
                        begin
                            o_data_bus_reg[i*DATA_WIDTH+:DATA_WIDTH] <= (i_valid[25])?i_data_bus[25*DATA_WIDTH+:DATA_WIDTH]:{DATA_WIDTH{1'b0}};
                            o_valid_reg[i] <= 1'b1;
                        end
                        64'b0000000000000000000000000000000000000100000000000000000000000000:
                        begin
                            o_data_bus_reg[i*DATA_WIDTH+:DATA_WIDTH] <= (i_valid[26])?i_data_bus[26*DATA_WIDTH+:DATA_WIDTH]:{DATA_WIDTH{1'b0}};
                            o_valid_reg[i] <= 1'b1;
                        end
                        64'b0000000000000000000000000000000000001000000000000000000000000000:
                        begin
                            o_data_bus_reg[i*DATA_WIDTH+:DATA_WIDTH] <= (i_valid[27])?i_data_bus[27*DATA_WIDTH+:DATA_WIDTH]:{DATA_WIDTH{1'b0}};
                            o_valid_reg[i] <= 1'b1;
                        end
                        64'b0000000000000000000000000000000000010000000000000000000000000000:
                        begin
                            o_data_bus_reg[i*DATA_WIDTH+:DATA_WIDTH] <= (i_valid[28])?i_data_bus[28*DATA_WIDTH+:DATA_WIDTH]:{DATA_WIDTH{1'b0}};
                            o_valid_reg[i] <= 1'b1;
                        end
                        64'b0000000000000000000000000000000000100000000000000000000000000000:
                        begin
                            o_data_bus_reg[i*DATA_WIDTH+:DATA_WIDTH] <= (i_valid[29])?i_data_bus[29*DATA_WIDTH+:DATA_WIDTH]:{DATA_WIDTH{1'b0}};
                            o_valid_reg[i] <= 1'b1;
                        end
                        64'b0000000000000000000000000000000001000000000000000000000000000000:
                        begin
                            o_data_bus_reg[i*DATA_WIDTH+:DATA_WIDTH] <= (i_valid[30])?i_data_bus[30*DATA_WIDTH+:DATA_WIDTH]:{DATA_WIDTH{1'b0}};
                            o_valid_reg[i] <= 1'b1;
                        end
                        64'b0000000000000000000000000000000010000000000000000000000000000000:
                        begin
                            o_data_bus_reg[i*DATA_WIDTH+:DATA_WIDTH] <= (i_valid[31])?i_data_bus[31*DATA_WIDTH+:DATA_WIDTH]:{DATA_WIDTH{1'b0}};
                            o_valid_reg[i] <= 1'b1;
                        end
                        64'b0000000000000000000000000000000100000000000000000000000000000000:
                        begin
                            o_data_bus_reg[i*DATA_WIDTH+:DATA_WIDTH] <= (i_valid[32])?i_data_bus[32*DATA_WIDTH+:DATA_WIDTH]:{DATA_WIDTH{1'b0}};
                            o_valid_reg[i] <= 1'b1;
                        end
                        64'b0000000000000000000000000000001000000000000000000000000000000000:
                        begin
                            o_data_bus_reg[i*DATA_WIDTH+:DATA_WIDTH] <= (i_valid[33])?i_data_bus[33*DATA_WIDTH+:DATA_WIDTH]:{DATA_WIDTH{1'b0}};
                            o_valid_reg[i] <= 1'b1;
                        end
                        64'b0000000000000000000000000000010000000000000000000000000000000000:
                        begin
                            o_data_bus_reg[i*DATA_WIDTH+:DATA_WIDTH] <= (i_valid[34])?i_data_bus[34*DATA_WIDTH+:DATA_WIDTH]:{DATA_WIDTH{1'b0}};
                            o_valid_reg[i] <= 1'b1;
                        end
                        64'b0000000000000000000000000000100000000000000000000000000000000000:
                        begin
                            o_data_bus_reg[i*DATA_WIDTH+:DATA_WIDTH] <= (i_valid[35])?i_data_bus[35*DATA_WIDTH+:DATA_WIDTH]:{DATA_WIDTH{1'b0}};
                            o_valid_reg[i] <= 1'b1;
                        end
                        64'b0000000000000000000000000001000000000000000000000000000000000000:
                        begin
                            o_data_bus_reg[i*DATA_WIDTH+:DATA_WIDTH] <= (i_valid[36])?i_data_bus[36*DATA_WIDTH+:DATA_WIDTH]:{DATA_WIDTH{1'b0}};
                            o_valid_reg[i] <= 1'b1;
                        end
                        64'b0000000000000000000000000010000000000000000000000000000000000000:
                        begin
                            o_data_bus_reg[i*DATA_WIDTH+:DATA_WIDTH] <= (i_valid[37])?i_data_bus[37*DATA_WIDTH+:DATA_WIDTH]:{DATA_WIDTH{1'b0}};
                            o_valid_reg[i] <= 1'b1;
                        end
                        64'b0000000000000000000000000100000000000000000000000000000000000000:
                        begin
                            o_data_bus_reg[i*DATA_WIDTH+:DATA_WIDTH] <= (i_valid[38])?i_data_bus[38*DATA_WIDTH+:DATA_WIDTH]:{DATA_WIDTH{1'b0}};
                            o_valid_reg[i] <= 1'b1;
                        end
                        64'b0000000000000000000000001000000000000000000000000000000000000000:
                        begin
                            o_data_bus_reg[i*DATA_WIDTH+:DATA_WIDTH] <= (i_valid[39])?i_data_bus[39*DATA_WIDTH+:DATA_WIDTH]:{DATA_WIDTH{1'b0}};
                            o_valid_reg[i] <= 1'b1;
                        end
                        64'b0000000000000000000000010000000000000000000000000000000000000000:
                        begin
                            o_data_bus_reg[i*DATA_WIDTH+:DATA_WIDTH] <= (i_valid[40])?i_data_bus[40*DATA_WIDTH+:DATA_WIDTH]:{DATA_WIDTH{1'b0}};
                            o_valid_reg[i] <= 1'b1;
                        end
                        64'b0000000000000000000000100000000000000000000000000000000000000000:
                        begin
                            o_data_bus_reg[i*DATA_WIDTH+:DATA_WIDTH] <= (i_valid[41])?i_data_bus[41*DATA_WIDTH+:DATA_WIDTH]:{DATA_WIDTH{1'b0}};
                            o_valid_reg[i] <= 1'b1;
                        end
                        64'b0000000000000000000001000000000000000000000000000000000000000000:
                        begin
                            o_data_bus_reg[i*DATA_WIDTH+:DATA_WIDTH] <= (i_valid[42])?i_data_bus[42*DATA_WIDTH+:DATA_WIDTH]:{DATA_WIDTH{1'b0}};
                            o_valid_reg[i] <= 1'b1;
                        end
                        64'b0000000000000000000010000000000000000000000000000000000000000000:
                        begin
                            o_data_bus_reg[i*DATA_WIDTH+:DATA_WIDTH] <= (i_valid[43])?i_data_bus[43*DATA_WIDTH+:DATA_WIDTH]:{DATA_WIDTH{1'b0}};
                            o_valid_reg[i] <= 1'b1;
                        end
                        64'b0000000000000000000100000000000000000000000000000000000000000000:
                        begin
                            o_data_bus_reg[i*DATA_WIDTH+:DATA_WIDTH] <= (i_valid[44])?i_data_bus[44*DATA_WIDTH+:DATA_WIDTH]:{DATA_WIDTH{1'b0}};
                            o_valid_reg[i] <= 1'b1;
                        end
                        64'b0000000000000000001000000000000000000000000000000000000000000000:
                        begin
                            o_data_bus_reg[i*DATA_WIDTH+:DATA_WIDTH] <= (i_valid[45])?i_data_bus[45*DATA_WIDTH+:DATA_WIDTH]:{DATA_WIDTH{1'b0}};
                            o_valid_reg[i] <= 1'b1;
                        end
                        64'b0000000000000000010000000000000000000000000000000000000000000000:
                        begin
                            o_data_bus_reg[i*DATA_WIDTH+:DATA_WIDTH] <= (i_valid[46])?i_data_bus[46*DATA_WIDTH+:DATA_WIDTH]:{DATA_WIDTH{1'b0}};
                            o_valid_reg[i] <= 1'b1;
                        end
                        64'b0000000000000000100000000000000000000000000000000000000000000000:
                        begin
                            o_data_bus_reg[i*DATA_WIDTH+:DATA_WIDTH] <= (i_valid[47])?i_data_bus[47*DATA_WIDTH+:DATA_WIDTH]:{DATA_WIDTH{1'b0}};
                            o_valid_reg[i] <= 1'b1;
                        end
                        64'b0000000000000001000000000000000000000000000000000000000000000000:
                        begin
                            o_data_bus_reg[i*DATA_WIDTH+:DATA_WIDTH] <= (i_valid[48])?i_data_bus[48*DATA_WIDTH+:DATA_WIDTH]:{DATA_WIDTH{1'b0}};
                            o_valid_reg[i] <= 1'b1;
                        end
                        64'b0000000000000010000000000000000000000000000000000000000000000000:
                        begin
                            o_data_bus_reg[i*DATA_WIDTH+:DATA_WIDTH] <= (i_valid[49])?i_data_bus[49*DATA_WIDTH+:DATA_WIDTH]:{DATA_WIDTH{1'b0}};
                            o_valid_reg[i] <= 1'b1;
                        end
                        64'b0000000000000100000000000000000000000000000000000000000000000000:
                        begin
                            o_data_bus_reg[i*DATA_WIDTH+:DATA_WIDTH] <= (i_valid[50])?i_data_bus[50*DATA_WIDTH+:DATA_WIDTH]:{DATA_WIDTH{1'b0}};
                            o_valid_reg[i] <= 1'b1;
                        end
                        64'b0000000000001000000000000000000000000000000000000000000000000000:
                        begin
                            o_data_bus_reg[i*DATA_WIDTH+:DATA_WIDTH] <= (i_valid[51])?i_data_bus[51*DATA_WIDTH+:DATA_WIDTH]:{DATA_WIDTH{1'b0}};
                            o_valid_reg[i] <= 1'b1;
                        end
                        64'b0000000000010000000000000000000000000000000000000000000000000000:
                        begin
                            o_data_bus_reg[i*DATA_WIDTH+:DATA_WIDTH] <= (i_valid[52])?i_data_bus[52*DATA_WIDTH+:DATA_WIDTH]:{DATA_WIDTH{1'b0}};
                            o_valid_reg[i] <= 1'b1;
                        end
                        64'b0000000000100000000000000000000000000000000000000000000000000000:
                        begin
                            o_data_bus_reg[i*DATA_WIDTH+:DATA_WIDTH] <= (i_valid[53])?i_data_bus[53*DATA_WIDTH+:DATA_WIDTH]:{DATA_WIDTH{1'b0}};
                            o_valid_reg[i] <= 1'b1;
                        end
                        64'b0000000001000000000000000000000000000000000000000000000000000000:
                        begin
                            o_data_bus_reg[i*DATA_WIDTH+:DATA_WIDTH] <= (i_valid[54])?i_data_bus[54*DATA_WIDTH+:DATA_WIDTH]:{DATA_WIDTH{1'b0}};
                            o_valid_reg[i] <= 1'b1;
                        end
                        64'b0000000010000000000000000000000000000000000000000000000000000000:
                        begin
                            o_data_bus_reg[i*DATA_WIDTH+:DATA_WIDTH] <= (i_valid[55])?i_data_bus[55*DATA_WIDTH+:DATA_WIDTH]:{DATA_WIDTH{1'b0}};
                            o_valid_reg[i] <= 1'b1;
                        end
                        64'b0000000100000000000000000000000000000000000000000000000000000000:
                        begin
                            o_data_bus_reg[i*DATA_WIDTH+:DATA_WIDTH] <= (i_valid[56])?i_data_bus[56*DATA_WIDTH+:DATA_WIDTH]:{DATA_WIDTH{1'b0}};
                            o_valid_reg[i] <= 1'b1;
                        end
                        64'b0000001000000000000000000000000000000000000000000000000000000000:
                        begin
                            o_data_bus_reg[i*DATA_WIDTH+:DATA_WIDTH] <= (i_valid[57])?i_data_bus[57*DATA_WIDTH+:DATA_WIDTH]:{DATA_WIDTH{1'b0}};
                            o_valid_reg[i] <= 1'b1;
                        end
                        64'b0000010000000000000000000000000000000000000000000000000000000000:
                        begin
                            o_data_bus_reg[i*DATA_WIDTH+:DATA_WIDTH] <= (i_valid[58])?i_data_bus[58*DATA_WIDTH+:DATA_WIDTH]:{DATA_WIDTH{1'b0}};
                            o_valid_reg[i] <= 1'b1;
                        end
                        64'b0000100000000000000000000000000000000000000000000000000000000000:
                        begin
                            o_data_bus_reg[i*DATA_WIDTH+:DATA_WIDTH] <= (i_valid[59])?i_data_bus[59*DATA_WIDTH+:DATA_WIDTH]:{DATA_WIDTH{1'b0}};
                            o_valid_reg[i] <= 1'b1;
                        end
                        64'b0001000000000000000000000000000000000000000000000000000000000000:
                        begin
                            o_data_bus_reg[i*DATA_WIDTH+:DATA_WIDTH] <= (i_valid[60])?i_data_bus[60*DATA_WIDTH+:DATA_WIDTH]:{DATA_WIDTH{1'b0}};
                            o_valid_reg[i] <= 1'b1;
                        end
                        64'b0010000000000000000000000000000000000000000000000000000000000000:
                        begin
                            o_data_bus_reg[i*DATA_WIDTH+:DATA_WIDTH] <= (i_valid[61])?i_data_bus[61*DATA_WIDTH+:DATA_WIDTH]:{DATA_WIDTH{1'b0}};
                            o_valid_reg[i] <= 1'b1;
                        end
                        64'b0100000000000000000000000000000000000000000000000000000000000000:
                        begin
                            o_data_bus_reg[i*DATA_WIDTH+:DATA_WIDTH] <= (i_valid[62])?i_data_bus[62*DATA_WIDTH+:DATA_WIDTH]:{DATA_WIDTH{1'b0}};
                            o_valid_reg[i] <= 1'b1;
                        end
                        64'b1000000000000000000000000000000000000000000000000000000000000000:
                        begin
                            o_data_bus_reg[i*DATA_WIDTH+:DATA_WIDTH] <= (i_valid[63])?i_data_bus[63*DATA_WIDTH+:DATA_WIDTH]:{DATA_WIDTH{1'b0}};
                            o_valid_reg[i] <= 1'b1;
                        end
                        default:
                        begin
                            o_data_bus_reg[i*DATA_WIDTH+:DATA_WIDTH] <= {WIDTH_OUTPUT_DATA{1'b0}};
                            o_valid_reg[i] <= 1'b0;
                        end
                    endcase
                end
                else
                begin
                    o_data_bus_reg[i*DATA_WIDTH+:DATA_WIDTH] <= {WIDTH_OUTPUT_DATA{1'b0}};
                    o_valid_reg[i] <= 1'b0;
                end
            end
        end
    endgenerate

    assign o_data_bus = o_data_bus_reg;
    assign o_valid = o_valid_reg;

endmodule
`endif

`ifdef In64_Out8_hier_8_8
module crossbar_one_hot_comb#(
    parameter DATA_WIDTH = 32,      // could be arbitrary number
    parameter NUM_OUTPUT_DATA  = 8, // must be power of 2.
    parameter NUM_INPUT_DATA = 64
)(
    // data signals
    i_valid,        // valid input data signal
    i_data_bus,     // input data bus coming into distribute switch

    o_valid,        // output valid
    o_data_bus,     // output data

    // control signals
    i_en,           // distribute switch enable
    i_cmd           // the input should be one-hot encoded command
);
    //parameter
    localparam TOTAL_COMMAND = NUM_INPUT_DATA*NUM_OUTPUT_DATA;

    localparam WIDTH_INPUT_DATA = NUM_INPUT_DATA*DATA_WIDTH;
    localparam WIDTH_OUTPUT_DATA = NUM_OUTPUT_DATA*DATA_WIDTH;

    localparam NUM_IN_MUX_FIRST_STAGE = 8;
    localparam NUM_MUX_FIRST_STAGE = NUM_INPUT_DATA >> $clog2(NUM_IN_MUX_FIRST_STAGE);

    localparam NUM_IN_MUX_SECOND_STAGE = NUM_MUX_FIRST_STAGE;
    localparam NUM_MUX_SECOND_STAGE = 1;

    // interface
    input  [NUM_INPUT_DATA-1:0]                  i_valid;
    input  [WIDTH_INPUT_DATA-1:0]                i_data_bus;

    output [NUM_OUTPUT_DATA-1:0]                 o_valid;
    output [WIDTH_OUTPUT_DATA-1:0]               o_data_bus; // {o_data_a, o_data_b}

    input                                        i_en;
    input  [TOTAL_COMMAND-1:0]                  i_cmd;

    reg    [NUM_OUTPUT_DATA-1:0]                 o_valid_reg;
    reg    [WIDTH_OUTPUT_DATA-1:0]               o_data_bus_reg;


    genvar i,j;
    generate
        for(i=0; i<NUM_OUTPUT_DATA; i=i+1)
        begin:output_mux
            // first pipeline stage -- buffer definition.
            reg    [NUM_IN_MUX_FIRST_STAGE*DATA_WIDTH-1:0]      inner_first_stage_data_reg;
            reg    [NUM_IN_MUX_FIRST_STAGE-1:0]                 inner_first_stage_valid_reg;

            // first pipeline stage -- 8 * 8:1 mux logic.
            for(j=0; j< NUM_MUX_FIRST_STAGE; j=j+1)
            begin:first_stage
                wire  [NUM_IN_MUX_FIRST_STAGE-1:0]       inner_cmd_wire;
                assign  inner_cmd_wire = {i_cmd[(7+j*NUM_IN_MUX_FIRST_STAGE)*NUM_OUTPUT_DATA+i],i_cmd[(6+j*NUM_IN_MUX_FIRST_STAGE)*NUM_OUTPUT_DATA+i],i_cmd[(5+j*NUM_IN_MUX_FIRST_STAGE)*NUM_OUTPUT_DATA+i],i_cmd[(4+j*NUM_IN_MUX_FIRST_STAGE)*NUM_OUTPUT_DATA+i],i_cmd[(3+j*NUM_IN_MUX_FIRST_STAGE)*NUM_OUTPUT_DATA+i],i_cmd[(2+j*NUM_IN_MUX_FIRST_STAGE)*NUM_OUTPUT_DATA+i],i_cmd[(1+j*NUM_IN_MUX_FIRST_STAGE)*NUM_OUTPUT_DATA+i],i_cmd[(j*NUM_IN_MUX_FIRST_STAGE)*NUM_OUTPUT_DATA+i]};
                always@(*)
                begin
                    if(i_en)
                    begin
                        case(inner_cmd_wire)
                            8'b00000001:
                            begin
                                inner_first_stage_data_reg[j*DATA_WIDTH+:DATA_WIDTH] <= (i_valid[0+j*NUM_IN_MUX_FIRST_STAGE])?i_data_bus[(0+j*NUM_IN_MUX_FIRST_STAGE)*DATA_WIDTH+:DATA_WIDTH]:{DATA_WIDTH{1'b0}};
                                inner_first_stage_valid_reg[j] <= (i_valid[0+j*NUM_IN_MUX_FIRST_STAGE])?1'b1:1'b0;
                            end
                            8'b00000010:
                            begin
                                inner_first_stage_data_reg[j*DATA_WIDTH+:DATA_WIDTH] <= (i_valid[1+j*NUM_IN_MUX_FIRST_STAGE])?i_data_bus[(1+j*NUM_IN_MUX_FIRST_STAGE)*DATA_WIDTH+:DATA_WIDTH]:{DATA_WIDTH{1'b0}};
                                inner_first_stage_valid_reg[j] <= (i_valid[1+j*NUM_IN_MUX_FIRST_STAGE])?1'b1:1'b0;
                            end
                            8'b00000100:
                            begin
                                inner_first_stage_data_reg[j*DATA_WIDTH+:DATA_WIDTH] <= (i_valid[2+j*NUM_IN_MUX_FIRST_STAGE])?i_data_bus[(2+j*NUM_IN_MUX_FIRST_STAGE)*DATA_WIDTH+:DATA_WIDTH]:{DATA_WIDTH{1'b0}};
                                inner_first_stage_valid_reg[j] <= (i_valid[2+j*NUM_IN_MUX_FIRST_STAGE])?1'b1:1'b0;
                            end
                            8'b00001000:
                            begin
                                inner_first_stage_data_reg[j*DATA_WIDTH+:DATA_WIDTH] <= (i_valid[3+j*NUM_IN_MUX_FIRST_STAGE])?i_data_bus[(3+j*NUM_IN_MUX_FIRST_STAGE)*DATA_WIDTH+:DATA_WIDTH]:{DATA_WIDTH{1'b0}};
                                inner_first_stage_valid_reg[j] <= (i_valid[3+j*NUM_IN_MUX_FIRST_STAGE])?1'b1:1'b0;
                            end
                            8'b00010000:
                            begin
                                inner_first_stage_data_reg[j*DATA_WIDTH+:DATA_WIDTH] <= (i_valid[4+j*NUM_IN_MUX_FIRST_STAGE])?i_data_bus[(4+j*NUM_IN_MUX_FIRST_STAGE)*DATA_WIDTH+:DATA_WIDTH]:{DATA_WIDTH{1'b0}};
                                inner_first_stage_valid_reg[j] <= (i_valid[4+j*NUM_IN_MUX_FIRST_STAGE])?1'b1:1'b0;
                            end
                            8'b00100000:
                            begin
                                inner_first_stage_data_reg[j*DATA_WIDTH+:DATA_WIDTH] <= (i_valid[5+j*NUM_IN_MUX_FIRST_STAGE])?i_data_bus[(5+j*NUM_IN_MUX_FIRST_STAGE)*DATA_WIDTH+:DATA_WIDTH]:{DATA_WIDTH{1'b0}};
                                inner_first_stage_valid_reg[j] <= (i_valid[5+j*NUM_IN_MUX_FIRST_STAGE])?1'b1:1'b0;
                            end
                            8'b01000000:
                            begin
                                inner_first_stage_data_reg[j*DATA_WIDTH+:DATA_WIDTH] <= (i_valid[6+j*NUM_IN_MUX_FIRST_STAGE])?i_data_bus[(6+j*NUM_IN_MUX_FIRST_STAGE)*DATA_WIDTH+:DATA_WIDTH]:{DATA_WIDTH{1'b0}};
                                inner_first_stage_valid_reg[j] <= (i_valid[6+j*NUM_IN_MUX_FIRST_STAGE])?1'b1:1'b0;
                            end
                            8'b10000000:
                            begin
                                inner_first_stage_data_reg[j*DATA_WIDTH+:DATA_WIDTH] <= (i_valid[7+j*NUM_IN_MUX_FIRST_STAGE])?i_data_bus[(7+j*NUM_IN_MUX_FIRST_STAGE)*DATA_WIDTH+:DATA_WIDTH]:{DATA_WIDTH{1'b0}};
                                inner_first_stage_valid_reg[j] <= (i_valid[7+j*NUM_IN_MUX_FIRST_STAGE])?1'b1:1'b0;
                            end
                            8'b00000000:
                            begin
                                inner_first_stage_data_reg[j*DATA_WIDTH+:DATA_WIDTH] <= {DATA_WIDTH{1'b0}};
                                inner_first_stage_valid_reg[j] <= 1'b0;
                            end
                            default:
                            begin
                                inner_first_stage_data_reg[j*DATA_WIDTH+:DATA_WIDTH] <= {DATA_WIDTH{1'b0}};
                                inner_first_stage_valid_reg[j] <= 1'b0;
                            end
                        endcase
                    end
                    else
                    begin
                        inner_first_stage_data_reg[j*DATA_WIDTH+:DATA_WIDTH] <= {DATA_WIDTH{1'b0}};
                        inner_first_stage_valid_reg[j] <= 1'b0;
                    end
                end
            end

            // second stage -- a single 8:1 mux.
            wire  [NUM_IN_MUX_SECOND_STAGE-1:0]  inner_cmd_wire_second_stage;
            assign inner_cmd_wire_second_stage = inner_first_stage_valid_reg;
            always@(*)
            begin:second_stage
                if(i_en)
                begin
                    case(inner_cmd_wire_second_stage)
                        8'b00000001:
                        begin
                            o_data_bus_reg[i*DATA_WIDTH+:DATA_WIDTH] <= inner_first_stage_data_reg[0*DATA_WIDTH+:DATA_WIDTH];
                            o_valid_reg[i] <= 1'b1;
                        end
                        8'b00000010:
                        begin
                            o_data_bus_reg[i*DATA_WIDTH+:DATA_WIDTH] <= inner_first_stage_data_reg[1*DATA_WIDTH+:DATA_WIDTH];
                            o_valid_reg[i] <= 1'b1;
                        end
                        8'b00000100:
                        begin
                            o_data_bus_reg[i*DATA_WIDTH+:DATA_WIDTH] <= inner_first_stage_data_reg[2*DATA_WIDTH+:DATA_WIDTH];
                            o_valid_reg[i] <= 1'b1;
                        end
                        8'b00001000:
                        begin
                            o_data_bus_reg[i*DATA_WIDTH+:DATA_WIDTH] <= inner_first_stage_data_reg[3*DATA_WIDTH+:DATA_WIDTH];
                            o_valid_reg[i] <= 1'b1;
                        end
                        8'b00010000:
                        begin
                            o_data_bus_reg[i*DATA_WIDTH+:DATA_WIDTH] <= inner_first_stage_data_reg[4*DATA_WIDTH+:DATA_WIDTH];
                            o_valid_reg[i] <= 1'b1;
                        end
                        8'b00100000:
                        begin
                            o_data_bus_reg[i*DATA_WIDTH+:DATA_WIDTH] <= inner_first_stage_data_reg[5*DATA_WIDTH+:DATA_WIDTH];
                            o_valid_reg[i] <= 1'b1;
                        end
                        8'b01000000:
                        begin
                            o_data_bus_reg[i*DATA_WIDTH+:DATA_WIDTH] <= inner_first_stage_data_reg[6*DATA_WIDTH+:DATA_WIDTH];
                            o_valid_reg[i] <= 1'b1;
                        end
                        8'b10000000:
                        begin
                            o_data_bus_reg[i*DATA_WIDTH+:DATA_WIDTH] <= inner_first_stage_data_reg[7*DATA_WIDTH+:DATA_WIDTH];
                            o_valid_reg[i] <= 1'b1;
                        end
                        default:
                        begin
                            o_data_bus_reg[i*DATA_WIDTH+:DATA_WIDTH] <= {DATA_WIDTH{1'b0}};
                            o_valid_reg[i] <= 1'b0;
                        end
                    endcase
                end
                else
                begin
                    o_data_bus_reg[i*DATA_WIDTH+:DATA_WIDTH] <= {DATA_WIDTH{1'b0}};
                    o_valid_reg[i] <= 1'b0;
                end
            end
        end
    endgenerate

    assign o_data_bus = o_data_bus_reg;
    assign o_valid = o_valid_reg;

endmodule
`endif



`ifdef In32_Out8_hier_4_8
module crossbar_one_hot_comb#(
    parameter DATA_WIDTH = 32,      // could be arbitrary number
    parameter NUM_OUTPUT_DATA  = 8, // must be power of 2.
    parameter NUM_INPUT_DATA = 32
)(
    // data signals
    i_valid,        // valid input data signal
    i_data_bus,     // input data bus coming into distribute switch

    o_valid,        // output valid
    o_data_bus,     // output data

    // control signals
    i_en,           // distribute switch enable
    i_cmd           // the input should be one-hot encoded command
);
    //parameter
    localparam TOTAL_COMMAND = NUM_INPUT_DATA*NUM_OUTPUT_DATA;

    localparam WIDTH_INPUT_DATA = NUM_INPUT_DATA*DATA_WIDTH;
    localparam WIDTH_OUTPUT_DATA = NUM_OUTPUT_DATA*DATA_WIDTH;

    localparam NUM_IN_MUX_FIRST_STAGE = 4;
    localparam NUM_MUX_FIRST_STAGE = NUM_INPUT_DATA >> $clog2(NUM_IN_MUX_FIRST_STAGE);

    localparam NUM_IN_MUX_SECOND_STAGE = NUM_MUX_FIRST_STAGE;
    localparam NUM_MUX_SECOND_STAGE = 1;

    // interface
    input  [NUM_INPUT_DATA-1:0]                  i_valid;
    input  [WIDTH_INPUT_DATA-1:0]                i_data_bus;

    output [NUM_OUTPUT_DATA-1:0]                 o_valid;
    output [WIDTH_OUTPUT_DATA-1:0]               o_data_bus; // {o_data_a, o_data_b}

    input                                        i_en;
    input  [TOTAL_COMMAND-1:0]                  i_cmd;

    reg    [NUM_OUTPUT_DATA-1:0]                 o_valid_reg;
    reg    [WIDTH_OUTPUT_DATA-1:0]               o_data_bus_reg;

    // first pipeline stage -- buffer definition.
    reg    [NUM_OUTPUT_DATA*NUM_MUX_FIRST_STAGE*DATA_WIDTH-1:0]      inner_first_stage_data_reg;
    reg    [NUM_OUTPUT_DATA*NUM_MUX_FIRST_STAGE-1:0]                 inner_first_stage_valid_reg;

    genvar i,j;
    generate
        for(i=0; i<NUM_OUTPUT_DATA; i=i+1)
        begin:output_mux
            // first pipeline stage -- 8 * 4:1 mux logic.
            for(j=0; j< NUM_MUX_FIRST_STAGE; j=j+1)
            begin:first_stage
                wire  [NUM_IN_MUX_FIRST_STAGE-1:0]       inner_cmd_wire;
                assign  inner_cmd_wire = {i_cmd[(3+j*NUM_IN_MUX_FIRST_STAGE)*NUM_OUTPUT_DATA+i],i_cmd[(2+j*NUM_IN_MUX_FIRST_STAGE)*NUM_OUTPUT_DATA+i],i_cmd[(1+j*NUM_IN_MUX_FIRST_STAGE)*NUM_OUTPUT_DATA+i],i_cmd[(j*NUM_IN_MUX_FIRST_STAGE)*NUM_OUTPUT_DATA+i]};
                always@(*)
                begin
                    if(i_en)
                    begin
                        case(inner_cmd_wire)
                            4'b0001:
                            begin
                                inner_first_stage_data_reg[(i*NUM_MUX_FIRST_STAGE+j)*DATA_WIDTH+:DATA_WIDTH] <= (i_valid[0+j*NUM_IN_MUX_FIRST_STAGE])?i_data_bus[(0+j*NUM_IN_MUX_FIRST_STAGE)*DATA_WIDTH+:DATA_WIDTH]:{DATA_WIDTH{1'b0}};
                                inner_first_stage_valid_reg[(i*NUM_MUX_FIRST_STAGE+j)] <= (i_valid[0+j*NUM_IN_MUX_FIRST_STAGE])?1'b1:1'b0;
                            end
                            4'b0010:
                            begin
                                inner_first_stage_data_reg[(i*NUM_MUX_FIRST_STAGE+j)*DATA_WIDTH+:DATA_WIDTH] <= (i_valid[1+j*NUM_IN_MUX_FIRST_STAGE])?i_data_bus[(1+j*NUM_IN_MUX_FIRST_STAGE)*DATA_WIDTH+:DATA_WIDTH]:{DATA_WIDTH{1'b0}};
                                inner_first_stage_valid_reg[(i*NUM_MUX_FIRST_STAGE+j)] <= (i_valid[1+j*NUM_IN_MUX_FIRST_STAGE])?1'b1:1'b0;
                            end
                            4'b0100:
                            begin
                                inner_first_stage_data_reg[(i*NUM_MUX_FIRST_STAGE+j)*DATA_WIDTH+:DATA_WIDTH] <= (i_valid[2+j*NUM_IN_MUX_FIRST_STAGE])?i_data_bus[(2+j*NUM_IN_MUX_FIRST_STAGE)*DATA_WIDTH+:DATA_WIDTH]:{DATA_WIDTH{1'b0}};
                                inner_first_stage_valid_reg[(i*NUM_MUX_FIRST_STAGE+j)] <= (i_valid[2+j*NUM_IN_MUX_FIRST_STAGE])?1'b1:1'b0;
                            end
                            4'b1000:
                            begin
                                inner_first_stage_data_reg[(i*NUM_MUX_FIRST_STAGE+j)*DATA_WIDTH+:DATA_WIDTH] <= (i_valid[3+j*NUM_IN_MUX_FIRST_STAGE])?i_data_bus[(3+j*NUM_IN_MUX_FIRST_STAGE)*DATA_WIDTH+:DATA_WIDTH]:{DATA_WIDTH{1'b0}};
                                inner_first_stage_valid_reg[(i*NUM_MUX_FIRST_STAGE+j)] <= (i_valid[3+j*NUM_IN_MUX_FIRST_STAGE])?1'b1:1'b0;
                            end
                            default:
                            begin
                                inner_first_stage_data_reg[(i*NUM_MUX_FIRST_STAGE+j)*DATA_WIDTH+:DATA_WIDTH] <= {DATA_WIDTH{1'b0}};
                                inner_first_stage_valid_reg[(i*NUM_MUX_FIRST_STAGE+j)] <= 1'b0;
                            end
                        endcase
                    end
                    else
                    begin
                        inner_first_stage_data_reg[(i*NUM_OUTPUT_DATA+j)*DATA_WIDTH+:DATA_WIDTH] <= {DATA_WIDTH{1'b0}};
                        inner_first_stage_valid_reg[(i*NUM_OUTPUT_DATA+j)] <= 1'b0;
                    end
                end
            end

            // second stage -- a single 8:1 mux.
            wire  [NUM_IN_MUX_SECOND_STAGE-1:0]  inner_cmd_wire_second_stage;
            assign inner_cmd_wire_second_stage = inner_first_stage_valid_reg[i*NUM_OUTPUT_DATA+:NUM_MUX_FIRST_STAGE];
            always@(*)
            begin:second_stage
                if(i_en)
                begin
                    case(inner_cmd_wire_second_stage)
                        8'b00000001:
                        begin
                            o_data_bus_reg[i*DATA_WIDTH+:DATA_WIDTH] <= inner_first_stage_data_reg[(i*NUM_OUTPUT_DATA+0)*DATA_WIDTH+:DATA_WIDTH];
                            o_valid_reg[i] <= 1'b1;
                        end
                        8'b00000010:
                        begin
                            o_data_bus_reg[i*DATA_WIDTH+:DATA_WIDTH] <= inner_first_stage_data_reg[(i*NUM_OUTPUT_DATA+1)*DATA_WIDTH+:DATA_WIDTH];
                            o_valid_reg[i] <= 1'b1;
                        end
                        8'b00000100:
                        begin
                            o_data_bus_reg[i*DATA_WIDTH+:DATA_WIDTH] <= inner_first_stage_data_reg[(i*NUM_OUTPUT_DATA+2)*DATA_WIDTH+:DATA_WIDTH];
                            o_valid_reg[i] <= 1'b1;
                        end
                        8'b00001000:
                        begin
                            o_data_bus_reg[i*DATA_WIDTH+:DATA_WIDTH] <= inner_first_stage_data_reg[(i*NUM_OUTPUT_DATA+3)*DATA_WIDTH+:DATA_WIDTH];
                            o_valid_reg[i] <= 1'b1;
                        end
                        8'b00010000:
                        begin
                            o_data_bus_reg[i*DATA_WIDTH+:DATA_WIDTH] <= inner_first_stage_data_reg[(i*NUM_OUTPUT_DATA+4)*DATA_WIDTH+:DATA_WIDTH];
                            o_valid_reg[i] <= 1'b1;
                        end
                        8'b00100000:
                        begin
                            o_data_bus_reg[i*DATA_WIDTH+:DATA_WIDTH] <= inner_first_stage_data_reg[(i*NUM_OUTPUT_DATA+5)*DATA_WIDTH+:DATA_WIDTH];
                            o_valid_reg[i] <= 1'b1;
                        end
                        8'b01000000:
                        begin
                            o_data_bus_reg[i*DATA_WIDTH+:DATA_WIDTH] <= inner_first_stage_data_reg[(i*NUM_OUTPUT_DATA+6)*DATA_WIDTH+:DATA_WIDTH];
                            o_valid_reg[i] <= 1'b1;
                        end
                        8'b10000000:
                        begin
                            o_data_bus_reg[i*DATA_WIDTH+:DATA_WIDTH] <= inner_first_stage_data_reg[(i*NUM_OUTPUT_DATA+7)*DATA_WIDTH+:DATA_WIDTH];
                            o_valid_reg[i] <= 1'b1;
                        end
                        default:
                        begin
                            o_data_bus_reg[i*DATA_WIDTH+:DATA_WIDTH] <= {DATA_WIDTH{1'b0}};
                            o_valid_reg[i] <= 1'b0;
                        end
                    endcase
                end
                else
                begin
                    o_data_bus_reg[i*DATA_WIDTH+:DATA_WIDTH] <= {DATA_WIDTH{1'b0}};
                    o_valid_reg[i] <= 1'b0;
                end
            end
        end
    endgenerate

    assign o_data_bus = o_data_bus_reg;
    assign o_valid = o_valid_reg;

endmodule
`endif