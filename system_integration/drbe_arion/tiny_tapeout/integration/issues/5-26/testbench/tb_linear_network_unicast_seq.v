`timescale 1ns / 1ps
/////////////////////////////////////////////////////////////
// Top Module:  linear_network_unicast_seq
// Data:        Only data width matters.
// Format:      keeping the input format unchange
// Timing:      Combinational Logic
// Dummy Data:  {DATA_WIDTH{1'b0}}
// 
// Function:    Unicast
//                               i_data_bus & i_valid     i_data_bus & i_valid     
//  i_data_bus & i_valid  -->|¯¯¯|------------------>|¯¯¯|------------------>|¯¯¯|--> i_data_bus & i_valid
//         i_dest[N-1:0]  -->|___|------------------>|___|------------------>|___|--> i_dest[N-4:0]     
//          (dst-tag)          |    i_dest[N-2:0]      |     i_dest[N-3:0]     |    
//                             v                       v                       v
//                        o_data_bus              o_data_bus               o_data_bus
//         [0*DATA_WIDTH+:DATA_WIDTH]     [1*DATA_WIDTH+:DATA_WIDTH]    [2*DATA_WIDTH+:DATA_WIDTH]
//
// Control:
// Each stage compares the dst tag. If it's destination, then output the data. 
// 
//     
// Author:      Jianming Tong (jianming.tong@gatech.edu)
/////////////////////////////////////////////////////////////


module tb_linear_network_unicast_seq();

	parameter DATA_WIDTH  = 32;

    // variable parameter
	// parameter NUM_NODE = NUM_DATA_IN * DESTINATION_TAG_WIDTH;
	parameter NUM_NODE = 4;
	parameter COMMAND_WIDTH = $clog2(NUM_NODE);

	// localparam
	parameter NUM_DATA_IN = 1;
	parameter NUM_DATA_OUT = 2;


    // timing signals
    reg                              clk;
    reg                              rst;

    // data signals
	reg                              i_valid;        // valid input data signal
	reg    [DATA_WIDTH-1:0]          i_data_bus;     // input data bus coming into mux
	
	wire   [NUM_NODE-1:0]            o_valid;        // output valid
    wire   [NUM_NODE*DATA_WIDTH-1:0] o_data_bus;     // output data 

	// control signals
	reg                              i_en;           // mux enable
	reg    [COMMAND_WIDTH-1:0]       i_cmd;
	

    // Test case declaration
    // all cases for control
    initial 
    begin
        clk = 1'b0;
        rst = 1'b0;
        // not enable at start
        i_valid = 1'b0;
        i_data_bus = {(DATA_WIDTH>>2){4'hA}};
        i_en = 1'b0;
        i_cmd ={COMMAND_WIDTH{1'b1}};

        // reset at start
        #20
        i_valid = 1'b0;
        rst = 1'b1;
        i_data_bus = {(DATA_WIDTH>>2){4'hA}};
        i_en = 1'b0;
        i_cmd ={COMMAND_WIDTH{1'b1}};
        
        // input active --  Pass to the next node
        #20
        rst = 1'b0;
        i_valid = 1'b1;
        i_data_bus = {(DATA_WIDTH>>2){4'hA}};
        i_en = 1'b1;
        i_cmd = {{(COMMAND_WIDTH-1){1'b0}}, 1'b1};
     
        // input active --  output to Node & Pass to the next node
        #20
        i_valid = 1'b1;
        i_data_bus = {(DATA_WIDTH>>2){4'hA}};
        i_en = 1'b1;
        i_cmd = {{(COMMAND_WIDTH-1){1'b1}}, 1'b0};
        
        // disable in progress
        #20
        i_valid = 1'b1;
        i_data_bus = {(DATA_WIDTH>>2){4'hA}};
        i_en = 1'b0;
        i_cmd = {{(COMMAND_WIDTH-1){1'b1}}, 1'b0};
         
        // enable in progress -- Pass to the next node
        #20
        i_valid = 1'b1;
        i_data_bus = {(DATA_WIDTH>>2){4'hA}};
        i_en = 1'b1;
        i_cmd = {{(COMMAND_WIDTH-1){1'b1}}, 1'b0};
        
        // change data half way -- output to Node & Pass to the next node
        #20
        i_valid = 1'b1;
        i_data_bus = {(DATA_WIDTH>>2){4'hB}};
        i_en = 1'b1;
        i_cmd = {{(COMMAND_WIDTH-1){1'b1}}, 1'b0};
        
        // invalid input 
        #20
        i_valid = 1'b0;
        i_data_bus = {(DATA_WIDTH>>2){4'hB}};
        i_en = 1'b1;
        i_cmd = {{(COMMAND_WIDTH-1){1'b1}}, 1'b0};

        #100
        $stop;
    end


    // instantiate DUT (device under test)
    linear_network_unicast_seq_1_16 dut(
        .clk(clk),
        .rst(rst),
		.i_valid(i_valid),
		.i_data_bus(i_data_bus),
		.o_valid(o_valid),
		.o_data_bus(o_data_bus),
		.i_en(i_en),
		.i_cmd(i_cmd)
	);

    always#5 clk=~clk;

endmodule
