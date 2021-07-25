`timescale 1ns / 1ps
/*
    Top Module:  linear_network_unicast_comb
    Data:        Only data width matters.
    Format:      keeping the input format unchange
    Timing:      Combinational Logic
    Dummy Data:  {DATA_WIDTH{1'b0}}

    Function:    Unicast
                                  i_data_bus & i_valid     i_data_bus & i_valid
     i_data_bus & i_valid  -->|¯¯¯|------------------>|¯¯¯|------------------>|¯¯¯|--> i_data_bus & i_valid
            i_dest[N-1:0]  -->|___|------------------>|___|------------------>|___|--> i_dest[N-4:0]
             (dst-tag)          |    i_dest[N-2:0]      |     i_dest[N-3:0]     |
                                v                       v                       v
                           o_data_bus              o_data_bus               o_data_bus
            [0*DATA_WIDTH+:DATA_WIDTH]     [1*DATA_WIDTH+:DATA_WIDTH]    [2*DATA_WIDTH+:DATA_WIDTH]

    Control:
    Each stage takes one destination bit.
    If destination bit is set high, pass input port to the

    Author:      Jianming Tong (jianming.tong@gatech.edu)
*/


module linear_network_unicast_comb#(
    parameter DATA_WIDTH = 32,     // could be arbitrary number
    parameter NUM_NODE = 4         // could be arbitrary integer.
)(
    // data signals
    i_valid,        // valid input data signal
    i_data_bus,     // input data bus coming into distribute switch

    o_valid,        // output valid
    o_data_bus,     // output data

    // control signals
    i_en,           // distribute switch enable
    i_cmd           // command
);
    //parameter
    localparam COMMAND_WIDTH = $clog2(NUM_NODE);

    localparam WIDTH_OUTPUT_DATA = DATA_WIDTH * NUM_NODE;

    // interface
    input                                        i_valid;
    input  [DATA_WIDTH-1:0]                      i_data_bus;

    output [NUM_NODE-1:0]                        o_valid;
    output [WIDTH_OUTPUT_DATA-1:0]               o_data_bus; // Node 0 output [0+:DATA_WIDTH]; Node max# output [(NUM_NODE-1)*DATA_WIDTH+:DATA_WIDTH]

    input                                        i_en;
    input  [COMMAND_WIDTH-1:0]                  i_cmd;      // destination tag.

    // inner logic
    reg    [WIDTH_OUTPUT_DATA-1:0]               o_data_bus_reg;
    reg    [NUM_NODE-1:0]                        o_valid_reg;

    reg    [DATA_WIDTH-1:0]                      o_data_forward_reg[0:NUM_NODE-2];
    reg                                          o_valid_forward_reg[0:NUM_NODE-2];

    // the first switch
    reg [COMMAND_WIDTH-1:0] node_id_reg_first;

    initial begin
        node_id_reg_first = 0;
    end

    always @(*) begin
        if(i_en)
        begin
            if(node_id_reg_first==i_cmd)
            begin
                o_data_bus_reg[0*DATA_WIDTH+:DATA_WIDTH] = i_data_bus;
                o_valid_reg[0] = i_valid;
            end
            else
            begin
                o_data_bus_reg[0*DATA_WIDTH+:DATA_WIDTH] = {DATA_WIDTH{1'b0}};
                o_valid_reg[0] = 1'b0;
            end
        end
    end

    always@(*)
    begin
        if(i_en)
        begin
            o_data_forward_reg[0] = i_data_bus;
            o_valid_forward_reg[0] = i_valid;
        end
    end

    genvar i;
    generate
        for(i=1; i<NUM_NODE-1;i=i+1)
        begin: node
            reg [COMMAND_WIDTH-1:0] node_id_reg;
            initial begin
                node_id_reg = i;
            end

            always @(*) begin
                if(i_en)
                begin
                    if(node_id_reg==i_cmd)
                    begin
                        o_data_bus_reg[i*DATA_WIDTH+:DATA_WIDTH] = o_data_forward_reg[i-1];
                        o_valid_reg[i] = o_valid_forward_reg[i-1];
                    end
                    else
                    begin
                        o_data_bus_reg[i*DATA_WIDTH+:DATA_WIDTH] = {DATA_WIDTH{1'b0}};
                        o_valid_reg[i] = 1'b0;
                    end
                end
            end

            always@(*)
            begin
                if(i_en)
                begin
                    o_data_forward_reg[i] = o_data_forward_reg[i-1];
                    o_valid_forward_reg[i] = o_valid_forward_reg[i-1];
                end
            end
        end
    endgenerate


    reg [COMMAND_WIDTH-1:0] node_id_reg_last;

    initial begin
        node_id_reg_last = NUM_NODE-1;
    end

    always @(*) begin
        if(i_en)
        begin
            if(node_id_reg_last==i_cmd)
            begin
                o_data_bus_reg[(NUM_NODE-1)*DATA_WIDTH+:DATA_WIDTH] = o_data_forward_reg[NUM_NODE-2];
                o_valid_reg[NUM_NODE-1] = o_valid_forward_reg[NUM_NODE-2];
            end
            else
            begin
                o_data_bus_reg[(NUM_NODE-1)*DATA_WIDTH+:DATA_WIDTH] = {DATA_WIDTH{1'b0}};
                o_valid_reg[NUM_NODE-1] = 1'b0;
            end
        end
    end

    assign o_data_bus = o_data_bus_reg;
    assign o_valid = o_valid_reg;

endmodule

