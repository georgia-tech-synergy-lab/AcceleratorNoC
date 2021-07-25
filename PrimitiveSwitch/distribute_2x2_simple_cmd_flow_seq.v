`timescale 1ns / 1ps
/*
    Top Module:  distribute_2x2_simple_seq
    Data:        Only data width matters.
    Format:      keeping the input format unchange
    Timing:      Sequential Logic
    Reset:       Asynchronized Reset [Low Reset]
    Latency:     2 cycle for Complex; 1 cycle for Simple
    Dummy Data:  {DATA_WIDTH{1'b0}}

    Unicast Function:
                            Pass_Through                                  Pass_Swtich

          i_data_bus(high)          i_data_bus(low)      i_data_bus(high)          i_data_bus(low)
       [DATA_WIDTH+:DATA_WIDTH]    [DATA_WIDTH-1:0]    [DATA_WIDTH+:DATA_WIDTH]    [DATA_WIDTH-1:0]
                              \     /                                       \     /
                               v   v                                         v   v
                               |¯¯¯| <--i_valid=2'b11                        |¯¯¯| <--i_valid=2'b11
                               |___| <--i_cmd=2'b10 (MS 2 bits)              |___| <--i_cmd=2'b01 (MS 2 bits)
                              /     \                                       /     \
                             v       v                                     v       v
                     o_data_high   o_data_low                      o_data_low     o_data_high


    Multicast Function:   Multicast_HighIn                              Multicast_LowIn                                     No Pass

          i_data_bus(high)          i_data_bus(low)      i_data_bus(high)          i_data_bus(low)      i_data_bus(high)          i_data_bus(low)
       [DATA_WIDTH+:DATA_WIDTH]    [DATA_WIDTH-1:0]    [DATA_WIDTH+:DATA_WIDTH]    [DATA_WIDTH-1:0]   [DATA_WIDTH+:DATA_WIDTH]    [DATA_WIDTH-1:0]
                              \     /                                       \     /                                         \     /
                               v   v                                         v   v                                           v   v
                               |¯¯¯| <--i_valid=2'b1x                        |¯¯¯| <--i_valid=2'bx1                          |¯¯¯| <--i_valid=2'b00
                               |___| <--i_cmd=2'b11 (MS 2 bits)              |___| <--i_cmd=2'b00  (MS 2 bits)               |___| <--i_cmd=2'bxx  (MS 2 bits)
                              /     \                                       /     \                                         /     \
                             v       v                                     v       v                                       v       v
                     o_data_high   o_data_high                      o_data_low    o_data_low                            Invalid  Invalid



      The i_cmd other than most significant bits -> forward to the following modules.

    Author:      Jianming Tong (jianming.tong@gatech.edu)
*/

/*
    parameter illustration:
    1. COMMAND_WIDTH means the length of command for a single switch, so each switch need COMMAND_WIDTH because of two inputs.
    2. IN_COMMAND_WIDTH means total length of command fed into the design. It is used to calculate the length of the output command.
    3. DATA_WIDTH means the length of a single data, arbitrary number is supported in the design.
*/

module distribute_2x2_simple_cmd_flow_seq#(
    parameter DATA_WIDTH = 32,
    parameter COMMAND_WIDTH  = 2,
    parameter IN_COMMAND_WIDTH  = 8
)(
    // timeing signals
    clk,
    rst_n,

    // data signals
    i_valid,        // valid input data signal
    i_data_bus,     // input data bus coming into distribute switch

    o_valid,        // output valid
    o_data_bus,     // output data

    // control signals
    i_en,           // distribute switch enable
    i_cmd,          // input command

    o_cmd           // output command
);

    // localparam
    localparam OUT_COMMAND_WIDTH = IN_COMMAND_WIDTH - COMMAND_WIDTH;

    // interface
    input                              clk;
    input                              rst_n;

    input  [1:0]                       i_valid;
    input  [2*DATA_WIDTH-1:0]          i_data_bus;

    output [1:0]                       o_valid;
    output [2*DATA_WIDTH-1:0]          o_data_bus; //{o_data_a, o_data_b}

    input                              i_en;
    input  [IN_COMMAND_WIDTH-1:0]      i_cmd;

    output [OUT_COMMAND_WIDTH-1:0]     o_cmd;
        // 11 --> Multicast_HighIn
        // 00 --> Multicast_LowIn
        // 10 --> Pass Through
        // 01 --> Pass Switch

    reg    [OUT_COMMAND_WIDTH-1:0]     o_cmd_reg;

    // high output data
    merge_2x1_simple_seq#(
        .DATA_WIDTH(DATA_WIDTH),
        .COMMAND_WIDTH(COMMAND_WIDTH-1)
    )merge_i_data_high(
        .clk(clk),
        .rst_n(rst_n),
        .i_valid(i_valid),
        .i_data_bus(i_data_bus),
        .o_valid(o_valid[1]),
        .o_data_bus(o_data_bus[DATA_WIDTH+:DATA_WIDTH]),
        .i_en(i_en),
        .i_cmd(i_cmd[IN_COMMAND_WIDTH-1])
    );

    // low output data
    merge_2x1_simple_seq#(
        .DATA_WIDTH(DATA_WIDTH),
        .COMMAND_WIDTH(COMMAND_WIDTH-1)
    )merge_i_data_low(
        .clk(clk),
        .rst_n(rst_n),
        .i_valid(i_valid),
        .i_data_bus(i_data_bus),
        .o_valid(o_valid[0]),
        .o_data_bus(o_data_bus[0+:DATA_WIDTH]),
        .i_en(i_en),
        .i_cmd(i_cmd[IN_COMMAND_WIDTH-2])
    );

    // command forward
    always @(posedge clk or negedge rst_n) begin
        if(!rst_n)
        begin
            o_cmd_reg <= {OUT_COMMAND_WIDTH{1'b0}};
        end
        else if(i_en)
        begin
            o_cmd_reg <= i_cmd[IN_COMMAND_WIDTH-3:0];
        end
        else
        begin
            o_cmd_reg <= {OUT_COMMAND_WIDTH{1'b0}};
        end
    end

    assign o_cmd = o_cmd_reg;

endmodule

