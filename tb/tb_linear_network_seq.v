`timescale 1ns / 1ps
/////////////////////////////////////////////////////////////
// Top Module:  tb_linear_network_seq
// Data:        Only data width matters.
// Format:      keeping the input format unchange
// Timing:      Sequential Logic, each switch takes one clock cycle
// Dummy Data:  {DATA_WIDTH{1'bz}}
// 
// Function:    Unicast  or  Multicast(Not arbitrary Multicast)
//                               i_data_bus & i_valid     i_data_bus & i_valid     
//  i_data_bus & i_valid  -->|¯¯¯|------------------>|¯¯¯|------------------>|¯¯¯|--> i_data_bus & i_valid
//         i_dest[N-1:0]  -->|___|------------------>|___|------------------>|___|--> i_dest[N-4:0]     
//          (one-hot)          |    i_dest[N-2:0]      |     i_dest[N-3:0]     |    
//                             v                       v                       v
//                        o_data_bus              o_data_bus               o_data_bus
//         [0*DATA_WIDTH+:DATA_WIDTH]     [1*DATA_WIDTH+:DATA_WIDTH]    [2*DATA_WIDTH+:DATA_WIDTH]
//
// Control:
// Each stage takes one destination bit. 
// If destination bit is set high, pass input port to the 
//     
// Author:      Jianming Tong (jianming.tong@gatech.edu)
/////////////////////////////////////////////////////////////

`define MULTIPLE_STAGE_COMMAND_INPUT_TEST
// `define SINGLE_SWTICH


`ifdef MULTIPLE_STAGE_COMMAND_INPUT_TEST

module tb_linear_network_seq();

	parameter DATA_WIDTH  = 32;

    // variable parameter
	// parameter NUM_NODE = NUM_DATA_IN * DESTINATION_TAG_WIDTH;
	parameter NUM_NODE = 4;

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
	reg    [NUM_NODE-1:0]            i_cmd;
		// 1 --> output to Node & Pass to the next node
		// 0 --> Pass to the next node
	

    // Test case declaration
    // all cases for control
    initial 
    begin
        clk = 1'b0;
        // not enable at start
        rst = 1'b0;
        i_valid = 1'b0;
        i_data_bus = {(DATA_WIDTH>>2){4'hA}};
        i_en = 1'b0;
        i_cmd ={NUM_NODE{1'b1}};

        // reset --  Pass to the next node
        #20
        rst = 1'b1;
        i_valid = 1'b1;
        i_data_bus = {(DATA_WIDTH>>2){4'hA}};
        i_en = 1'b1;
        i_cmd = {{(NUM_NODE-1){1'b0}}, 1'b1};

        // input active --  Pass to the next node
        #20
        rst = 1'b0;
        i_valid = 1'b1;
        i_data_bus = {(DATA_WIDTH>>2){4'hA}};
        i_en = 1'b1;
        i_cmd = {{(NUM_NODE-1){1'b0}}, 1'b1};
     
        // input active --  output to Node & Pass to the next node
        #20
        i_valid = 1'b1;
        i_data_bus = {(DATA_WIDTH>>2){4'hA}};
        i_en = 1'b1;
        i_cmd = {{(NUM_NODE-1){1'b1}}, 1'b0};
        
        // disable in progress
        #20
        i_valid = 1'b1;
        i_data_bus = {(DATA_WIDTH>>2){4'hA}};
        i_en = 1'b0;
        i_cmd = {{(NUM_NODE-1){1'b1}}, 1'b0};
         
        // enable in progress -- Pass to the next node
        #20
        i_valid = 1'b1;
        i_data_bus = {(DATA_WIDTH>>2){4'hA}};
        i_en = 1'b1;
        i_cmd = {{(NUM_NODE-1){1'b1}}, 1'b0};
        
        // change data half way -- output to Node & Pass to the next node
        #20
        i_valid = 1'b1;
        i_data_bus = {(DATA_WIDTH>>2){4'hB}};
        i_en = 1'b1;
        i_cmd = {{(NUM_NODE-1){1'b1}}, 1'b0};
        
        // invalid input 
        #20
        i_valid = 1'b0;
        i_data_bus = {(DATA_WIDTH>>2){4'hB}};
        i_en = 1'b1;
        i_cmd = {{(NUM_NODE-1){1'b1}}, 1'b0};
       
        $stop;
    end

    // instantiate DUT (device under test)
    linear_network_seq #(
		.DATA_WIDTH(DATA_WIDTH),
        .NUM_NODE(NUM_NODE)
	) dut(
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
`endif 


`ifdef SINGLE_SWTICH
module tb_linear_network_seq();

	parameter DATA_WIDTH  = 32;

    // variable parameter
	// parameter NUM_NODE = NUM_DATA_IN * DESTINATION_TAG_WIDTH;
	parameter NUM_NODE = 1;

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
	reg    [NUM_NODE-1:0]            i_cmd;
		// 1 --> output to Node & Pass to the next node
		// 0 --> Pass to the next node
	
    // Test case declaration
    // all cases for control
    initial 
    begin
        clk = 1'b0;
        rst = 1'b0;
        // not enable at start
        rst = 1'b0;
        i_valid = 1'b0;
        i_data_bus = {(DATA_WIDTH>>2){4'hA}};
        i_en = 1'b0;
        i_cmd = 1'b1;

        // reset -- Pass to the next node
        #20
        rst = 1'b1;
        i_valid = 1'b1;
        i_data_bus = {(DATA_WIDTH>>2){4'hA}};
        i_en = 1'b1;
        i_cmd = 1'b0;
        
        // input active -- Pass to the next node
        #20
        rst = 1'b0;
        i_valid = 1'b1;
        i_data_bus = {(DATA_WIDTH>>2){4'hA}};
        i_en = 1'b1;
        i_cmd = 1'b0;
     
        // input active -- output to Node & Pass to the next node
        #20
        i_valid = 1'b1;
        i_data_bus = {(DATA_WIDTH>>2){4'hA}};
        i_en = 1'b1;
        i_cmd = 1'b1;
        
        // disable in progress 
        #20
        i_valid = 1'b1;
        i_data_bus = {(DATA_WIDTH>>2){4'hA}};
        i_en = 1'b0;
        i_cmd = 1'b1;
         
        // enable in progress -- output to Node & Pass to the next node
        #20
        i_valid = 1'b1;
        i_data_bus = {(DATA_WIDTH>>2){4'hA}};
        i_en = 1'b1;
        i_cmd = 1'b1;
        
        // change data half way -- output to Node & Pass to the next node
        #20
        i_valid = 1'b1;
        i_data_bus = {(DATA_WIDTH>>2){4'hB}};
        i_en = 1'b1;
        i_cmd = 1'b1;
        
        // invalid input 
        #20
        i_valid = 1'b0;
        i_data_bus = {(DATA_WIDTH>>2){4'hB}};
        i_en = 1'b1;
        i_cmd = 1'b1;
       
        $stop;
    end


    // instantiate DUT (device under test)
    linear_network_seq #(
		.DATA_WIDTH(DATA_WIDTH),
        .NUM_NODE(NUM_NODE)
	) dut(
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
`endif