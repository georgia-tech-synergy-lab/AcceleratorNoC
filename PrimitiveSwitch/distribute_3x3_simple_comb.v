`timescale 1ns / 1ps
/*
    Top Module:  distribute_3x3_simple_comb
    Data:        Only data width matters.
    Format:      keeping the input format unchange
    Timing:      Combinational Logic
    Dummy Data:  {DATA_WIDTH{1'b0}}

    Total two versions are supported here, including complex (9 functions[3 bit control]) and simple (4 functions + No Pass[2 bit control]) version
    uncomment `define SIMPLE_MODULAR to use SIMPLE_MODULAR VERSION

    5 bit control
    Description:
    1. The first 2 bits encode the functionalities of the two input data.
      Note: the left bit of the first 2 bits determine the high output port
            the right bit of the first 2 bits determine the low output port
    2. The middle bit is used to control the o_fwd bit
            when last bits are both 1 then the o_fwd output valid data.
    3. The last 2 bits control the output data.
      Note: the left bit of the first 2 bits determine the high output port
            the right bit of the first 2 bits determine the low output port

    Unicast Function:
                            Pass_Through                                              Pass_Swtich

          i_data_bus(high)          i_data_bus(low)                  i_data_bus(high)          i_data_bus(low)
       [DATA_WIDTH+:DATA_WIDTH]    [DATA_WIDTH-1:0]                [DATA_WIDTH+:DATA_WIDTH]    [DATA_WIDTH-1:0]
                              \     /                                                   \     /
                               v   v                                                     v   v
    [DATA_WIDTH-1:0] i_fwd --> |¯¯¯| <--i_valid=3'b11?        [DATA_WIDTH-1:0] i_fwd --> |¯¯¯| <--i_valid=3'b11?
           Invalid(o_fwd)  <-- |___| <--i_cmd=5'b10011               Invalid(o_fwd)  <-- |___| <--i_cmd=5'b01011
                              /     \                                                   /     \
                             v       v                                                 v       v
                    o_data_high    o_data_low                                  o_data_low     o_data_high
       [DATA_WIDTH+:DATA_WIDTH]    [DATA_WIDTH-1:0]


    Multicast Function:   Multicast_HighIn                                          Multicast_LowIn                                              No Pass

          i_data_bus(high)          i_data_bus(low)                   i_data_bus(high)          i_data_bus(low)                  i_data_bus(high)          i_data_bus(low)
       [DATA_WIDTH+:DATA_WIDTH]    [DATA_WIDTH-1:0]                 [DATA_WIDTH+:DATA_WIDTH]    [DATA_WIDTH-1:0]             [DATA_WIDTH+:DATA_WIDTH]    [DATA_WIDTH-1:0]
                              \     /                                                     \     /                                                 \     /
                               v   v                                                       v   v                                                   v   v
    [DATA_WIDTH-1:0] i_fwd --> |¯¯¯| <--i_valid=3'b11?          [DATA_WIDTH-1:0] i_fwd --> |¯¯¯| <--i_valid=3'b11?      [DATA_WIDTH-1:0] i_fwd --> |¯¯¯| <--i_valid=3'b000
           Invalid(o_fwd)  <-- |___| <--i_cmd=5'b11011                 Invalid(o_fwd)  <-- |___| <--i_cmd=5'b00011             Invalid(o_fwd)  <-- |___| <--i_cmd=5'b?????
                              /     \                                                     /     \                                                 /     \
                             v       v                                                   v       v                                               v       v
                     o_data_high   o_data_high                                   o_data_low    o_data_low                                   Invalid    Invalid


    Forwarding Function:   Pass_Through_I_Fwd_High_O_Fwd_High                   Pass_Through_I_Fwd_High_O_Fwd_Low

                   i_data_bus(high)          i_data_bus(low)              i_data_bus(high)          i_data_bus(low)
                [DATA_WIDTH+:DATA_WIDTH]    [DATA_WIDTH-1:0]            [DATA_WIDTH+:DATA_WIDTH]    [DATA_WIDTH-1:0]
                                       \     /                                               \     /
                                        v   v                                                 v   v
             [DATA_WIDTH-1:0] i_fwd --> |¯¯¯| <--i_valid=3'b111    [DATA_WIDTH-1:0] i_fwd --> |¯¯¯| <--i_valid=3'b111
               o_data_high (o_fwd)  <-- |___| <--i_cmd=5'b10101        o_data_low (o_fwd) <-- |___| <--i_cmd=5'b10001
                                       /     \                                               /     \
                                      v       v                                             v       v
                                  i_fwd   o_data_low                                   i_fwd   o_data_low


    Forwarding Function:   Pass_Through_I_Fwd_Low_O_Fwd_High                   Pass_Through_I_Fwd_Low_O_Fwd_Low

                   i_data_bus(high)          i_data_bus(low)              i_data_bus(high)          i_data_bus(low)
                [DATA_WIDTH+:DATA_WIDTH]    [DATA_WIDTH-1:0]            [DATA_WIDTH+:DATA_WIDTH]    [DATA_WIDTH-1:0]
                                       \     /                                               \     /
                                        v   v                                                 v   v
             [DATA_WIDTH-1:0] i_fwd --> |¯¯¯| <--i_valid=3'b111    [DATA_WIDTH-1:0] i_fwd --> |¯¯¯| <--i_valid=3'b111
               o_data_high (o_fwd)  <-- |___| <--i_cmd=5'b10110        o_data_low (o_fwd) <-- |___| <--i_cmd=5'b10010
                                       /     \                                               /     \
                                      v       v                                             v       v
                                o_data_high   i_fwd                                  o_data_high   i_fwd


    Forwarding Function:   Pass_Cross_I_Fwd_High_O_Fwd_High                    Pass_Cross_I_Fwd_High_O_Fwd_Low

                   i_data_bus(high)          i_data_bus(low)              i_data_bus(high)          i_data_bus(low)
                [DATA_WIDTH+:DATA_WIDTH]    [DATA_WIDTH-1:0]            [DATA_WIDTH+:DATA_WIDTH]    [DATA_WIDTH-1:0]
                                       \     /                                               \     /
                                        v   v                                                 v   v
             [DATA_WIDTH-1:0] i_fwd --> |¯¯¯| <--i_valid=3'b111    [DATA_WIDTH-1:0] i_fwd --> |¯¯¯| <--i_valid=3'b111
                o_data_low (o_fwd)  <-- |___| <--i_cmd=5'b01101       o_data_high (o_fwd) <-- |___| <--i_cmd=5'b01001
                                       /     \                                               /     \
                                      v       v                                             v       v
                                  i_fwd   o_data_high                                  i_fwd   o_data_high


    Forwarding Function:   Pass_Cross_I_Fwd_Low_O_Fwd_High                     Pass_Cross_I_Fwd_Low_O_Fwd_Low

                   i_data_bus(high)          i_data_bus(low)              i_data_bus(high)          i_data_bus(low)
                [DATA_WIDTH+:DATA_WIDTH]    [DATA_WIDTH-1:0]            [DATA_WIDTH+:DATA_WIDTH]    [DATA_WIDTH-1:0]
                                       \     /                                               \     /
                                        v   v                                                 v   v
             [DATA_WIDTH-1:0] i_fwd --> |¯¯¯| <--i_valid=3'b111    [DATA_WIDTH-1:0] i_fwd --> |¯¯¯| <--i_valid=3'b111
                o_data_low (o_fwd)  <-- |___| <--i_cmd=5'b01110       o_data_high (o_fwd) <-- |___| <--i_cmd=5'b01010
                                       /     \                                               /     \
                                      v       v                                             v       v
                               o_data_low    i_fwd                                  o_data_low    i_fwd


    Author:      Jianming Tong (jianming.tong@gatech.edu)
*/

module distribute_3x3_simple_comb#(
    parameter DATA_WIDTH = 32,
    parameter COMMAND_WIDTH  = 5
)(
    // data signals
    i_valid,        // valid input data signal
    i_data_bus,     // input data bus coming into distribute switch

    o_valid,        // output valid
    o_data_bus,     // output data

    i_fwd_valid,    // input forward valid
    i_fwd_data_bus, // input data

    o_fwd_valid,    // output forward valid
    o_fwd_data_bus, // output data

    // control signals
    i_en,           // distribute switch enable
    i_cmd           // command
);

    // interface
    input  [1:0]                  i_valid;
    input  [2*DATA_WIDTH-1:0]     i_data_bus;

    output [1:0]                  o_valid;
    output [2*DATA_WIDTH-1:0]     o_data_bus; //{o_data_a, o_data_b}

    input                         i_fwd_valid;
    input  [DATA_WIDTH-1:0]       i_fwd_data_bus;

    output                        o_fwd_valid;
    output [DATA_WIDTH-1:0]       o_fwd_data_bus;

    input                         i_en;
    input  [COMMAND_WIDTH-1:0]   i_cmd;

    // The first 2 bits
        // 11 --> Multicast_HighIn
        // 00 --> Multicast_LowIn
        // 10 --> Pass Through
        // 01 --> Pass Switch
    // The middle bit
        // input forward valid bit
    // The last 2 bits
        // 11 --> Keep Original
        // 10 --> Forward LowOut
        // 00 --> Forward Multicast
        // 01 --> Forward HighOut

    wire   [1:0]                  inner_valid;
    wire   [2*DATA_WIDTH-1:0]     inner_data_bus;

    wire                          inner_fwd_valid;
    wire   [DATA_WIDTH-1:0]       inner_fwd_data_bus;

    // merge level
    merge_2x1_simple_comb#(
        .DATA_WIDTH(DATA_WIDTH),
        .COMMAND_WIDTH(COMMAND_WIDTH-4)
    ) merge_i_data_high(
        .i_valid(i_valid),
        .i_data_bus(i_data_bus),
        .o_valid(inner_valid[1]),
        .o_data_bus(inner_data_bus[DATA_WIDTH+:DATA_WIDTH]),
        .i_en(i_en),
        .i_cmd(i_cmd[4])
    );

    merge_2x1_simple_comb#(
        .DATA_WIDTH(DATA_WIDTH),
        .COMMAND_WIDTH(COMMAND_WIDTH-4)
    ) merge_i_data_low(
        .i_valid(i_valid),
        .i_data_bus(i_data_bus),
        .o_valid(inner_valid[0]),
        .o_data_bus(inner_data_bus[0+:DATA_WIDTH]),
        .i_en({i_en}),
        .i_cmd(i_cmd[3])
    );

    merge_2x1_simple_comb#(
        .DATA_WIDTH(DATA_WIDTH),
        .COMMAND_WIDTH(COMMAND_WIDTH-4)
    ) o_fwd(
        .i_valid(inner_valid),
        .i_data_bus(inner_data_bus),
        .o_valid(inner_fwd_valid),
        .o_data_bus(inner_fwd_data_bus),
        .i_en(i_en),
        .i_cmd(i_cmd[2])
    );

    merge_2x1_simple_comb#(
        .DATA_WIDTH(DATA_WIDTH),
        .COMMAND_WIDTH(COMMAND_WIDTH-4)
    ) o_fwd_en(
        .i_valid({1'b0, inner_fwd_valid}),
        .i_data_bus({{DATA_WIDTH{1'b0}}, inner_fwd_data_bus}),
        .o_valid(o_fwd_valid),
        .o_data_bus(o_fwd_data_bus),
        .i_en(i_en),
        .i_cmd({i_cmd[0] & i_cmd[1]})
    );

    merge_2x1_simple_comb#(
        .DATA_WIDTH(DATA_WIDTH),
        .COMMAND_WIDTH(COMMAND_WIDTH-4)
    ) o_data_high(
        .i_valid({inner_valid[1], i_fwd_valid}),
        .i_data_bus({inner_data_bus[DATA_WIDTH+:DATA_WIDTH], i_fwd_data_bus}),
        .o_valid(o_valid[1]),
        .o_data_bus(o_data_bus[DATA_WIDTH+:DATA_WIDTH]),
        .i_en(i_en),
        .i_cmd(i_cmd[1])
    );

    merge_2x1_simple_comb#(
        .DATA_WIDTH(DATA_WIDTH),
        .COMMAND_WIDTH(COMMAND_WIDTH-4)
    ) o_data_low(
        .i_valid({inner_valid[0], i_fwd_valid}),
        .i_data_bus({inner_data_bus[0+:DATA_WIDTH], i_fwd_data_bus}),
        .o_valid(o_valid[0]),
        .o_data_bus(o_data_bus[0+:DATA_WIDTH]),
        .i_en(i_en),
        .i_cmd(i_cmd[0])
    );

endmodule
