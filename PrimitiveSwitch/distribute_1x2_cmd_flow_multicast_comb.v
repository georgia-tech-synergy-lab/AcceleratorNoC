`timescale 1ns / 1ps
/*
    Top Module:  distribute_1x2_cmd_flow_multicast_comb
    Data:        Only data width matters.
    Format:      keeping the input format unchange
    Timing:      Combinational Logic
    Dummy Data:  {DATA_WIDTH{1'b0}}

    [2_BIT_CONTROL Version]
    Function:          Multicast                                      Branch_high                                       Branch_low

                       i_data_bus                                     i_data_bus                                        i_data_bus
                           |                                              |                                                 |
                           v                                              v                                                 v
                         |¯¯¯| <--i_valid=1'b1                          |¯¯¯| <--i_valid=1'b1                             |¯¯¯| <--i_valid=1'b1
    o_cmd=(n-2)b'??? <-- |___| <--i_cmd=n'b11???    o_cmd=(n-2)b'??? <--|___| <--i_cmd=n'b10???     o_cmd=(n-2)b'???  <-- |___| <--i_cmd=n'b01???
                        /     \                                        /                                                       \
                o_data_high  o_data_low                          o_data_high                                                o_data_low

          o_data_high = o_data_bus[2*DATA_WIDTH-1: DATA_WIDTH]
          o_data_low  = o_data_bus[DATA_WIDTH-1: 0]
          i_valid = 2'b1?; where ? indicates that we don't care about this bit

    Author:      Jianming Tong (jianming.tong@gatech.edu)
*/

module distribute_1x2_cmd_flow_multicast_comb#(
    parameter DATA_WIDTH = 32,
    parameter DESTINATION_TAG_WIDTH = 2,
    parameter IN_COMMAND_WIDTH = 4
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
    parameter NUM_DATA_IN = 1;
    parameter NUM_DATA_OUT = 2;
    parameter OUT_COMMAND_WIDTH = (IN_COMMAND_WIDTH>DESTINATION_TAG_WIDTH)?(NUM_DATA_OUT*(IN_COMMAND_WIDTH-DESTINATION_TAG_WIDTH)):DESTINATION_TAG_WIDTH;
    parameter OUT_COMMAND_WIDTH_PER_DATA = IN_COMMAND_WIDTH - DESTINATION_TAG_WIDTH;

    // interface
    input                           i_valid;
    input  [DATA_WIDTH-1:0]         i_data_bus;

    output [1:0]                    o_valid;
    output [2*DATA_WIDTH-1:0]       o_data_bus; //{o_data_a, o_data_b}

    input                           i_en;
    input  [IN_COMMAND_WIDTH-1:0]   i_cmd;
        // 10 --> In chooses HighOut
        // 01 --> In chooses LowOut
        // 11 --> Multicast

    output [OUT_COMMAND_WIDTH-1:0]  o_cmd;

    // inner logic
    reg    [2*DATA_WIDTH-1:0]       o_data_bus_inner;
    reg    [1:0]                    o_valid_inner;
    reg    [OUT_COMMAND_WIDTH-1:0]  o_cmd_inner;

    if(IN_COMMAND_WIDTH<2*DESTINATION_TAG_WIDTH)
    begin: LAST_STAGE
        // output data
        always@(*)
        begin
            if(i_en && i_valid)
            begin
                o_cmd_inner = {(OUT_COMMAND_WIDTH){1'b0}};

                case(i_cmd)
                    2'b10: // In chooses HighOut
                    begin
                        o_data_bus_inner = {i_data_bus, {DATA_WIDTH{1'b0}}};
                        o_valid_inner = 2'b10;
                    end
                    2'b01: // In chooses LowOut
                    begin
                        o_data_bus_inner= {{DATA_WIDTH{1'b0}}, i_data_bus};
                        o_valid_inner = 2'b01;
                    end
                    2'b11: // Mutlicast
                    begin
                        o_data_bus_inner = {i_data_bus, i_data_bus};
                        o_valid_inner = 2'b11;
                    end
                    default:
                    begin
                        o_valid_inner = 2'b00;
                        o_data_bus_inner = {2*DATA_WIDTH{1'b0}};
                    end
                endcase
            end
            else
            begin
                o_cmd_inner = {(OUT_COMMAND_WIDTH){1'b0}};

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
            if(i_en && i_valid)
            begin
                case(i_cmd[IN_COMMAND_WIDTH-1:IN_COMMAND_WIDTH-2])
                    2'b10: // In chooses HighOut
                    begin
                        o_data_bus_inner = {i_data_bus, {DATA_WIDTH{1'b0}}};
                        o_valid_inner = 2'b10;

                        o_cmd_inner = {i_cmd[OUT_COMMAND_WIDTH_PER_DATA-1:0], {(OUT_COMMAND_WIDTH_PER_DATA){1'b0}}};
                    end
                    2'b01: // In chooses LowOut
                    begin
                        o_data_bus_inner = {{DATA_WIDTH{1'b0}}, i_data_bus};
                        o_valid_inner = 2'b01;

                        o_cmd_inner = { {(OUT_COMMAND_WIDTH_PER_DATA){1'b0}}, i_cmd[OUT_COMMAND_WIDTH_PER_DATA-1:0]};
                    end
                    2'b11: // Mutlicast
                    begin
                        o_data_bus_inner = {i_data_bus, i_data_bus};
                        o_valid_inner = 2'b11;

                        o_cmd_inner = { i_cmd[OUT_COMMAND_WIDTH_PER_DATA-1:0], i_cmd[OUT_COMMAND_WIDTH_PER_DATA-1:0]};
                    end
                    default:
                    begin
                        o_valid_inner = 2'b00;
                        o_data_bus_inner = {2*DATA_WIDTH{1'b0}};

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
