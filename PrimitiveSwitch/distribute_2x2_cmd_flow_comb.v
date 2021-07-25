`timescale 1ns / 1ps
/*
    Top Module:  distribute_2x2_cmd_flow_comb
    Data:        Only data width matters.
    Format:      keeping the input format unchange
    Timing:      Combinational Logic
    Dummy Data:  {DATA_WIDTH{1'b0}}

    ----------------------------------------------
    DESTINATION_TAG verion: 1 bit control for each data.

    Unicast Function:
                     Both_Contention_Highout                          Both_Contention_Lowout

          i_data_bus(high)          i_data_bus(low)         i_data_bus(high)          i_data_bus(low)
       [DATA_WIDTH+:DATA_WIDTH]    [DATA_WIDTH-1:0]      [DATA_WIDTH+:DATA_WIDTH]    [DATA_WIDTH-1:0]
                              \     /                                         \     /
                               v   v                                           v   v
                               |¯¯¯| <--i_valid=2'b11                          |¯¯¯| <--i_valid=2'b11
         o_cmd=(n-2)b'???? <-- |___| <--i_cmd=n'b11????  o_cmd=(n-2)b'???? <-- |___| <--i_cmd=n'b00????
                              /     \                                         /     \
                             v       v                                       v       v
                     o_data_high   Invalid                               Invalid   o_data_low


                            Pass Through                                    Pass Switch

          i_data_bus(high)          i_data_bus(low)        i_data_bus(high)          i_data_bus(low)
       [DATA_WIDTH+:DATA_WIDTH]    [DATA_WIDTH-1:0]      [DATA_WIDTH+:DATA_WIDTH]    [DATA_WIDTH-1:0]
                              \     /                                         \     /
                               v   v                                           v   v
                               |¯¯¯| <--i_valid=2'b11                          |¯¯¯| <--i_valid=2'b11
         o_cmd=(n-2)b'???? <-- |___| <--i_cmd=n'b10????  o_cmd=(n-2)b'???? <-- |___| <--i_cmd=n'b01????
                              /     \                                         /     \
                             v       v                                       v       v
                     o_data_high   o_data_low                          o_data_low   o_data_high

    Note: the output port is Invalid when corresponding input data is invalid

    Special Function:      No Pass

          i_data_bus(high)          i_data_bus(low)
       [DATA_WIDTH+:DATA_WIDTH]    [DATA_WIDTH-1:0]
                           \     /
                            v   v
                            |¯¯¯| <--i_valid=2'b00
       o_cmd=(n-2)b'???? <--|___| <--i_cmd=n'b????
                           /     \
                          v       v
                     Invalid  Invalid

    Author:      Jianming Tong (jianming.tong@gatech.edu)
*/


module distribute_2x2_cmd_flow_comb#(
    parameter DATA_WIDTH = 32,
    parameter DESTINATION_TAG_WIDTH = 1,
    parameter IN_COMMAND_WIDTH = 2
)(
    // data signals
    i_valid,        // valid input data signal
    i_data_bus,     // input data bus coming into distribute switch

    o_valid,        // output valid
    o_data_bus,     // output data

    // control signals
    i_en,           // distribute switch enable
    i_cmd,          // input destination tag

    o_cmd           // output destination tag
);
    // localparam
    parameter NUM_DATA_IN = 2;
    parameter CONSUME_COMMAND_WIDTH = NUM_DATA_IN * DESTINATION_TAG_WIDTH;
    parameter OUT_COMMAND_WIDTH = (IN_COMMAND_WIDTH>CONSUME_COMMAND_WIDTH)?(IN_COMMAND_WIDTH-CONSUME_COMMAND_WIDTH):CONSUME_COMMAND_WIDTH;
    parameter OUT_COMMAND_WIDTH_PER_DATA = ((IN_COMMAND_WIDTH - CONSUME_COMMAND_WIDTH) >> 1);
    parameter MSB_COMMAND_HIGHIN_DATA = IN_COMMAND_WIDTH;
    parameter MSB_COMMAND_LOWIN_DATA = IN_COMMAND_WIDTH>>1;

    // interface
    input  [1:0]                    i_valid;
    input  [2*DATA_WIDTH-1:0]       i_data_bus;

    output [1:0]                    o_valid;
    output [2*DATA_WIDTH-1:0]       o_data_bus; //{o_data_a, o_data_b}

    input                           i_en;
    input  [IN_COMMAND_WIDTH-1:0]   i_cmd;
        // 2'b11 --> HighIn HighOut
        // 2'b00 --> HighIn LowOut
        // 2'b10 --> Pass Through
        // 2'b01 --> Pass Swtich
        // MSB is command for high Input, 1 choose high out
        // LSB is command for low Input, 1 choose high out
        // when both input choose the same output port
        // HighIn has higher priority.

    output [OUT_COMMAND_WIDTH-1:0]  o_cmd;

    // inner logic
    reg    [IN_COMMAND_WIDTH-1:0]   i_cmd_inner;
    reg    [2*DATA_WIDTH-1:0]       i_data_bus_inner;
    reg    [1:0]                    i_valid_inner;

    reg    [2*DATA_WIDTH-1:0]       o_data_bus_inner;
    reg    [1:0]                    o_valid_inner;
    reg    [OUT_COMMAND_WIDTH-1:0]  o_cmd_inner;

    always@(*)
    begin
        i_cmd_inner = i_cmd;
        i_data_bus_inner = i_data_bus;
        i_valid_inner = i_valid;
    end

    if(IN_COMMAND_WIDTH<=NUM_DATA_IN*DESTINATION_TAG_WIDTH)
    begin:LAST_STAGE
        // output data
        always@(*)
        begin
            if(i_en)
            begin
                o_cmd_inner = {(OUT_COMMAND_WIDTH){1'b0}};

                case(i_valid_inner)
                2'b11:
                begin
                    case({i_cmd_inner})
                        2'b11: // HighIn HighOut
                        begin
                            o_data_bus_inner = {i_data_bus_inner[DATA_WIDTH+:DATA_WIDTH], {DATA_WIDTH{1'b0}}};
                            o_valid_inner = 2'b10;
                        end
                        2'b00: // HighIn LowOut
                        begin
                            o_data_bus_inner = {{DATA_WIDTH{1'b0}}, i_data_bus_inner[DATA_WIDTH+:DATA_WIDTH]};
                            o_valid_inner = 2'b01;
                        end
                        2'b10: // Pass Through
                        begin
                            o_data_bus_inner = i_data_bus_inner;
                            o_valid_inner = 2'b11;
                        end
                        2'b01: // Pass Switch
                        begin
                            o_data_bus_inner = {i_data_bus_inner[0+:DATA_WIDTH], i_data_bus_inner[DATA_WIDTH+:DATA_WIDTH]};
                            o_valid_inner = 2'b11;
                        end
                        default: // No Pass
                        begin
                            o_data_bus_inner = {(2*DATA_WIDTH){1'b0}};
                            o_valid_inner = 2'b00;
                        end
                    endcase
                end
                2'b10:
                begin
                    case({i_cmd_inner})
                        2'b11,2'b10: // HighIn HighOut
                        begin
                            o_data_bus_inner = {i_data_bus_inner[DATA_WIDTH+:DATA_WIDTH], {DATA_WIDTH{1'b0}}};
                            o_valid_inner = 2'b10;
                        end
                        2'b00,2'b01: // HighIn LowOut
                        begin
                            o_data_bus_inner = {{DATA_WIDTH{1'b0}}, i_data_bus_inner[DATA_WIDTH+:DATA_WIDTH]};
                            o_valid_inner = 2'b01;
                        end
                        default: // No Pass
                        begin
                            o_data_bus_inner = {(2*DATA_WIDTH){1'b0}};
                            o_valid_inner = 2'b00;
                        end
                    endcase
                end
                2'b01:
                begin
                    case({i_cmd_inner})
                        2'b01,2'b11: // LowIn HighOut
                        begin
                            o_data_bus_inner = {i_data_bus_inner[0+:DATA_WIDTH], {DATA_WIDTH{1'b0}}};
                            o_valid_inner = 2'b10;
                        end
                        2'b00,2'b10: // LowIn LowOut
                        begin
                            o_data_bus_inner = {{DATA_WIDTH{1'b0}}, i_data_bus_inner[0+:DATA_WIDTH]};
                            o_valid_inner = 2'b01;
                        end
                        default: // No Pass
                        begin
                            o_data_bus_inner = {(2*DATA_WIDTH){1'b0}};
                            o_valid_inner = 2'b00;
                        end
                    endcase
                end
                default: // No Pass
                begin
                    o_data_bus_inner = {(2*DATA_WIDTH){1'b0}};
                    o_valid_inner = 2'b00;
                end
                endcase
            end
            else
            begin
                o_valid_inner = 2'b00;
                o_data_bus_inner = {2*DATA_WIDTH{1'b0}};
            end
        end
    end
    else
    begin: NOT_LAST_STAGE
        // output data & command
        always@(*)
        begin
            if(i_en)
            begin
                case(i_valid_inner)
                2'b11:
                begin
                    case({i_cmd_inner[MSB_COMMAND_HIGHIN_DATA-1], i_cmd_inner[MSB_COMMAND_LOWIN_DATA-1]})
                        2'b11: // HighIn HighOut
                        begin
                            o_data_bus_inner = {i_data_bus_inner[DATA_WIDTH+:DATA_WIDTH], {DATA_WIDTH{1'b0}}};
                            o_valid_inner = 2'b10;

                            o_cmd_inner = {i_cmd_inner[MSB_COMMAND_HIGHIN_DATA-DESTINATION_TAG_WIDTH-1:MSB_COMMAND_LOWIN_DATA], {(OUT_COMMAND_WIDTH_PER_DATA){1'b0}}};
                        end
                        2'b00: // HighIn LowOut
                        begin
                            o_data_bus_inner = {{DATA_WIDTH{1'b0}}, i_data_bus_inner[DATA_WIDTH+:DATA_WIDTH]};
                            o_valid_inner = 2'b01;

                            o_cmd_inner = {{(OUT_COMMAND_WIDTH_PER_DATA){1'b0}}, i_cmd_inner[MSB_COMMAND_HIGHIN_DATA-DESTINATION_TAG_WIDTH-1:MSB_COMMAND_LOWIN_DATA]};
                        end
                        2'b10: // Pass Through
                        begin
                            o_data_bus_inner = i_data_bus_inner;
                            o_valid_inner = 2'b11;

                            o_cmd_inner = {i_cmd_inner[MSB_COMMAND_HIGHIN_DATA-DESTINATION_TAG_WIDTH-1:MSB_COMMAND_LOWIN_DATA], i_cmd_inner[MSB_COMMAND_LOWIN_DATA-DESTINATION_TAG_WIDTH-1:0]};
                        end
                        2'b01: // Pass Switch
                        begin
                            o_data_bus_inner = {i_data_bus_inner[0+:DATA_WIDTH], i_data_bus_inner[DATA_WIDTH+:DATA_WIDTH]};
                            o_valid_inner = 2'b11;

                            o_cmd_inner = {i_cmd_inner[MSB_COMMAND_LOWIN_DATA-DESTINATION_TAG_WIDTH-1:0], i_cmd_inner[MSB_COMMAND_HIGHIN_DATA-DESTINATION_TAG_WIDTH-1:MSB_COMMAND_LOWIN_DATA]};
                        end
                        default: // No Pass
                        begin
                            o_data_bus_inner = {(2*DATA_WIDTH){1'b0}};
                            o_valid_inner = 2'b00;

                            o_cmd_inner = {(OUT_COMMAND_WIDTH){1'b0}};
                        end
                    endcase
                end
                2'b10:
                begin
                    case({i_cmd_inner[MSB_COMMAND_HIGHIN_DATA-1], i_cmd_inner[MSB_COMMAND_LOWIN_DATA-1]})
                        2'b10,2'b11: // HighIn HighOut
                        begin
                            o_data_bus_inner = {i_data_bus_inner[DATA_WIDTH+:DATA_WIDTH], {DATA_WIDTH{1'b0}}};
                            o_valid_inner = 2'b10;

                            o_cmd_inner = {i_cmd_inner[MSB_COMMAND_HIGHIN_DATA-DESTINATION_TAG_WIDTH-1:MSB_COMMAND_LOWIN_DATA], {(OUT_COMMAND_WIDTH_PER_DATA){1'b0}}};
                        end
                        2'b01,2'b00: // HighIn LowOut
                        begin
                            o_data_bus_inner = {{DATA_WIDTH{1'b0}}, i_data_bus_inner[DATA_WIDTH+:DATA_WIDTH]};
                            o_valid_inner = 2'b01;

                            o_cmd_inner = {{(OUT_COMMAND_WIDTH_PER_DATA){1'b0}}, i_cmd_inner[MSB_COMMAND_HIGHIN_DATA-DESTINATION_TAG_WIDTH-1:MSB_COMMAND_LOWIN_DATA]};
                        end
                        default: // No Pass
                        begin
                            o_data_bus_inner = {(2*DATA_WIDTH){1'b0}};
                            o_valid_inner = 2'b00;

                            o_cmd_inner = {(OUT_COMMAND_WIDTH){1'b0}};
                        end
                    endcase
                end
                2'b01:
                begin
                    case({i_cmd_inner[MSB_COMMAND_HIGHIN_DATA-1], i_cmd_inner[MSB_COMMAND_LOWIN_DATA-1]})
                        2'b01,2'b11: // LowIn HighOut
                        begin
                            o_data_bus_inner = {i_data_bus_inner[0+:DATA_WIDTH], {DATA_WIDTH{1'b0}}};
                            o_valid_inner = 2'b10;

                            o_cmd_inner = {i_cmd_inner[MSB_COMMAND_LOWIN_DATA-DESTINATION_TAG_WIDTH-1:0], {(OUT_COMMAND_WIDTH_PER_DATA){1'b0}}};
                        end
                        2'b00,2'b10: // LowIn LowOut
                        begin
                            o_data_bus_inner = {{DATA_WIDTH{1'b0}}, i_data_bus_inner[0+:DATA_WIDTH]};
                            o_valid_inner = 2'b01;

                            o_cmd_inner = {{(OUT_COMMAND_WIDTH_PER_DATA){1'b0}}, i_cmd_inner[MSB_COMMAND_LOWIN_DATA-DESTINATION_TAG_WIDTH-1:0]};
                        end
                        default: // No Pass
                        begin
                            o_data_bus_inner = {(2*DATA_WIDTH){1'b0}};
                            o_valid_inner = 2'b00;

                            o_cmd_inner = {(OUT_COMMAND_WIDTH){1'b0}};
                        end
                    endcase
                end
                default: // No Pass
                    begin
                        o_data_bus_inner = {(2*DATA_WIDTH){1'b0}};
                        o_valid_inner = 2'b00;

                        o_cmd_inner = {(OUT_COMMAND_WIDTH){1'b0}};
                    end
                endcase
            end
            else
            begin
                o_valid_inner = 2'b00;
                o_data_bus_inner = {2*DATA_WIDTH{1'b0}};

                o_cmd_inner = {(OUT_COMMAND_WIDTH){1'b0}};
            end
        end
    end

    // output data & command
    assign o_valid = o_valid_inner;
    assign o_data_bus = o_data_bus_inner;

    assign o_cmd = o_cmd_inner;

endmodule

