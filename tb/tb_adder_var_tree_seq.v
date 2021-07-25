`timescale 1ns / 1ps
/*
    Top Module:  tb_adder_var_tree_seq
    Data:        Only data width matters.
    Format:      Output has LEVEL more bit than input data
    Timing:      Sequential Logic
    Reset:       Synchronized Reset [High Reset]
    Latency:     # of LEVEL(every LEVEL is a pipeline stage)

    Dummy Data:  {DATA_WIDTH{1'b0}}

    Parameter:   NUM_INPUT_DATA_INPUT_DATA could be arbitrary integer below 1024.

    Function:    Unicast  or  Multicast(Not arbitrary Multicast)
      \     /     \     / ... \     /     \     /
       v   v       v   v  ...  v   v       v   v
       |¯¯¯|       |¯¯¯|  ...  |¯¯¯|       |¯¯¯|
       |___|       |___|  ...  |___|       |___|
         v           v    ...     v           v
          \         /     ...      \         /
           \       /      ...       \       /
            \     /       ...        \     /
             v   v        ...         v   v
             |¯¯¯|        ...         |¯¯¯|
             |___|        ...         |___|
               v                        v
                \                      /
                 \                    /
                  ...              ...
                   ...           ...
                    ...        ...
                       \       /
                        \     /
                         v   v
                         |¯¯¯|
                         |___|
                           v
                      o_data_bus(summation of all input data

    Author:      Jianming Tong (jianming.tong@gatech.edu)
*/

module tb_adder_var_tree_seq();

    parameter NUM_INPUT_DATA = 16;
    parameter DATA_WIDTH = 4;
    localparam  NUM_LEVEL = $clog2(NUM_INPUT_DATA); // Note: inner ceiling: e.g. $clog2(18) = 5, (2^5=32).

    // timing signals
    reg                                         clk;
    reg                                         rst_n;

    // interface
    reg   [NUM_INPUT_DATA-1:0]                  i_valid;
    reg   [NUM_INPUT_DATA*DATA_WIDTH-1:0]       i_data_bus;

    wire                                        o_valid;
    wire  [DATA_WIDTH+NUM_LEVEL-1:0]            o_data_bus; //{o_data_a, o_data_b}

    reg                                         i_en;

    // inner logic
    reg signed [DATA_WIDTH-1:0] i_data_bus_inner[NUM_INPUT_DATA-1:0];

    integer i;
    initial begin
        // test reset
        clk = 1'b0;
        i_en = 1'b1;
        rst_n = 1'b1;
        #20
        rst_n = 1'b0;
        #20
        rst_n = 1'b1;

        // test input
        #20
        i_en = 1'b1;
        i_valid = {NUM_INPUT_DATA{1'b1}};
        i_data_bus = 0;
        for (i=0; i<NUM_INPUT_DATA; i=i+1)
        begin
            i_data_bus_inner[i] = 1;
        end

        for (i = 0; i < NUM_INPUT_DATA; i = i + 1) begin
            i_data_bus = {i_data_bus,i_data_bus_inner[i]};
        end
        #100
        $stop;
    end


    // instantiate DUT (device under test)
    adder_var_tree_seq#(
        .NUM_INPUT_DATA(NUM_INPUT_DATA),
        .DATA_WIDTH(DATA_WIDTH))
    dut(
        .clk(clk),
        .rst_n(rst_n),
        .i_valid(i_valid),
        .i_data_bus(i_data_bus),
        .o_valid(o_valid),
        .o_data_bus(o_data_bus),
        .i_en(i_en)
    );

    always #5 clk=~clk;


endmodule