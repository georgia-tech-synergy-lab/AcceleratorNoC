`timescale 1ns / 1ps
/////////////////////////////////////////////////////////////
// Top Module:  tb_benes_seq
// Data:        Only data width matters.
// Format:      keeping the reg format unchange
// Timing:      Sequential Logic
// Reset:       Synchronized Reset [High Reset]
// Pipeline:    For benes constructed with sequential switches, every stage is a pipeline stage
//              Total latency = # stages (cycle)  
// Dummy Data:  {DATA_WIDTH{1'b0}}
// 
// Function:    Unicast  or  Multicast(Not arbitrary Multicast)
//   
//     i_data_bus[0*DATA_WIDTH+:DATA_WIDTH]  -->|¯¯¯|-------->|¯¯¯|------->|¯¯¯|------->|¯¯¯|-------->|¯¯¯|-->
//     i_data_bus[1*DATA_WIDTH+:DATA_WIDTH]  -->|___|-\ /---->|___|--\ /-->|___|--\ /-->|___|----\ /->|___|-->
//                                                     X              X            X              X
//     i_data_bus[2*DATA_WIDTH+:DATA_WIDTH]  -->|¯¯¯|-/ \/--->|¯¯¯|--/ \-->|¯¯¯|--/ \-->|¯¯¯|---\/ \->|¯¯¯|-->
//     i_data_bus[3*DATA_WIDTH+:DATA_WIDTH]  -->|___|-\ /\ /->|___|------->|___|------->|___|-\ /\ /->|___|-->
//                                                     X  X                                    X  X
//     i_data_bus[4*DATA_WIDTH+:DATA_WIDTH]  -->|¯¯¯|-/ \/ \->|¯¯¯|------->|¯¯¯|------->|¯¯¯|-/ \/ \->|¯¯¯|-->
//     i_data_bus[5*DATA_WIDTH+:DATA_WIDTH]  -->|___|-\ /\--->|___|--\ /-->|___|--\ /-->|___|---/\ /->|___|-->
//                                                     X              X            X              X 
//     i_data_bus[6*DATA_WIDTH+:DATA_WIDTH]  -->|¯¯¯|-/ \---->|¯¯¯|--/ \-->|¯¯¯|--/ \-->|¯¯¯|----/ \->|¯¯¯|-->
//     i_data_bus[7*DATA_WIDTH+:DATA_WIDTH]  -->|___|-------->|___|------->|___|------->|___|-------->|___|-->
//          
// Control Signal
//     i_valid[0]-->|¯¯¯|<--ctrl[2:0] 
//     i_valid[1]-->|___|
//     
// Author:      Jianming Tong (jianming.tong@gatech.edu)
/////////////////////////////////////////////////////////////

module tb_benes_seq();
    parameter DATA_WIDTH = 4;
	parameter COMMMAND_WIDTH  = 2;
	parameter NUM_SWITCH_IN = 2;

	//parameter
	localparam LEVEL = $clog2(NUM_SWITCH_IN);
	localparam TOTAL_STAGE = 2*LEVEL+1;

	localparam TOTAL_COMMMAND = TOTAL_STAGE*NUM_SWITCH_IN*COMMMAND_WIDTH;
	
	localparam NUM_INPUT_DATA = 2*NUM_SWITCH_IN;
	localparam WIDTH_INPUT_DATA = NUM_INPUT_DATA*DATA_WIDTH;
	
	localparam NUM_CONNECTION = (TOTAL_STAGE-1)*NUM_INPUT_DATA*DATA_WIDTH;

	// interface
	reg                                        clk;
	reg                                        rst;
	
	reg  [NUM_INPUT_DATA-1:0]                  i_valid;             
	reg  [WIDTH_INPUT_DATA-1:0]                i_data_bus;
	
    wire [NUM_INPUT_DATA-1:0]                  o_valid;             
	wire [WIDTH_INPUT_DATA-1:0]                o_data_bus; //{o_data_a, o_data_b}
  
	reg                                        i_en;
	reg  [TOTAL_COMMMAND-1:0]                  i_cmd;
									// 11 --> Multicast_HighIn
									// 00 --> Multicast_LowIn
									// 10 --> Pass Through
									// 01 --> Pass Switch

    // Test case declaration
    // all cases for control
    initial
    begin
        clk = 1'b0;
        // not enable at start
        #40
        rst = 1'b1;
        i_valid = {NUM_INPUT_DATA{1'b1}};
        // i_data_bus = {{(DATA_WIDTH>>2){4'h0}} ,{(DATA_WIDTH>>2){4'h1}},{(DATA_WIDTH>>2){4'h2}},{(DATA_WIDTH>>2){4'h3}},{(DATA_WIDTH>>2){4'h4}},{(DATA_WIDTH>>2){4'h5}},{(DATA_WIDTH>>2){4'h6}},{(DATA_WIDTH>>2){4'h7}}};//,{(DATA_WIDTH>>2){4'h8}},{(DATA_WIDTH>>2){4'h9}},{(DATA_WIDTH>>2){4'ha}},{(DATA_WIDTH>>2){4'hb}},{(DATA_WIDTH>>2){4'hc}},{(DATA_WIDTH>>2){4'hd}},{(DATA_WIDTH>>2){4'he}},{(DATA_WIDTH>>2){4'hf}}};
        i_data_bus = {{(DATA_WIDTH>>2){4'h3}},{(DATA_WIDTH>>2){4'h2}},{(DATA_WIDTH>>2){4'h1}},{(DATA_WIDTH>>2){4'h0}}};
        i_en = 1'b1;
        i_cmd = {(TOTAL_COMMMAND>>1){2'b10}};
        
        // rst active;
        #40
        rst = 1'b1;
        i_valid = {NUM_INPUT_DATA{1'b1}};
        // i_data_bus = {(NUM_INPUT_DATA>>1) {{(DATA_WIDTH>>2){4'hA}},{(DATA_WIDTH>>2){4'hf}}}};
        i_data_bus = {{(DATA_WIDTH>>2){4'h3}},{(DATA_WIDTH>>2){4'h2}},{(DATA_WIDTH>>2){4'h1}},{(DATA_WIDTH>>2){4'h0}}};//,{(DATA_WIDTH>>2){4'h8}},{(DATA_WIDTH>>2){4'h9}},{(DATA_WIDTH>>2){4'ha}},{(DATA_WIDTH>>2){4'hb}},{(DATA_WIDTH>>2){4'hc}},{(DATA_WIDTH>>2){4'hd}},{(DATA_WIDTH>>2){4'he}},{(DATA_WIDTH>>2){4'hf}}};
        i_en = 1'b1;
        i_cmd = {(TOTAL_COMMMAND>>1){2'b00}};
        
        // reg active -- Multicast_HighIn
        #40
        rst = 1'b0;
        i_valid = {NUM_INPUT_DATA{1'b1}};
        i_data_bus = {{(DATA_WIDTH>>2){4'h3}},{(DATA_WIDTH>>2){4'h2}},{(DATA_WIDTH>>2){4'h1}},{(DATA_WIDTH>>2){4'h0}}};//,{(DATA_WIDTH>>2){4'h8}},{(DATA_WIDTH>>2){4'h9}},{(DATA_WIDTH>>2){4'ha}},{(DATA_WIDTH>>2){4'hb}},{(DATA_WIDTH>>2){4'hc}},{(DATA_WIDTH>>2){4'hd}},{(DATA_WIDTH>>2){4'he}},{(DATA_WIDTH>>2){4'hf}}};
        i_en = 1'b1;
        i_cmd = {(TOTAL_COMMMAND>>1){2'b11}};
    
        // reg active -- Multicast_LowIn
        #40
        rst = 1'b0;
        i_valid = {NUM_INPUT_DATA{1'b1}};
        i_data_bus = {{(DATA_WIDTH>>2){4'h3}},{(DATA_WIDTH>>2){4'h2}},{(DATA_WIDTH>>2){4'h1}},{(DATA_WIDTH>>2){4'h0}}};//,{(DATA_WIDTH>>2){4'h8}},{(DATA_WIDTH>>2){4'h9}},{(DATA_WIDTH>>2){4'ha}},{(DATA_WIDTH>>2){4'hb}},{(DATA_WIDTH>>2){4'hc}},{(DATA_WIDTH>>2){4'hd}},{(DATA_WIDTH>>2){4'he}},{(DATA_WIDTH>>2){4'hf}}};
        i_en = 1'b1;
        i_cmd = {(TOTAL_COMMMAND>>1){2'b00}};
        
        // reg active -- Pass Through
        #40
        rst = 1'b0;
        i_valid = {NUM_INPUT_DATA{1'b1}};
        i_data_bus = {{(DATA_WIDTH>>2){4'h3}},{(DATA_WIDTH>>2){4'h2}},{(DATA_WIDTH>>2){4'h1}},{(DATA_WIDTH>>2){4'h0}}};//,{(DATA_WIDTH>>2){4'h8}},{(DATA_WIDTH>>2){4'h9}},{(DATA_WIDTH>>2){4'ha}},{(DATA_WIDTH>>2){4'hb}},{(DATA_WIDTH>>2){4'hc}},{(DATA_WIDTH>>2){4'hd}},{(DATA_WIDTH>>2){4'he}},{(DATA_WIDTH>>2){4'hf}}};
        i_en = 1'b1;
        i_cmd = {(TOTAL_COMMMAND>>1){2'b10}};
        
        // reg active -- Pass Switch 
        #40
        rst = 1'b0;
        i_valid = {NUM_INPUT_DATA{1'b1}};
        i_data_bus = {{(DATA_WIDTH>>2){4'h3}},{(DATA_WIDTH>>2){4'h2}},{(DATA_WIDTH>>2){4'h1}},{(DATA_WIDTH>>2){4'h0}}};//,{(DATA_WIDTH>>2){4'h8}},{(DATA_WIDTH>>2){4'h9}},{(DATA_WIDTH>>2){4'ha}},{(DATA_WIDTH>>2){4'hb}},{(DATA_WIDTH>>2){4'hc}},{(DATA_WIDTH>>2){4'hd}},{(DATA_WIDTH>>2){4'he}},{(DATA_WIDTH>>2){4'hf}}};
        i_en = 1'b1;
        i_cmd = {(TOTAL_COMMMAND>>1){2'b01}};
        
        // disable in progress
        #40
        rst = 1'b0;
        i_valid = {NUM_INPUT_DATA{1'b1}};
        i_data_bus = {{(DATA_WIDTH>>2){4'h3}},{(DATA_WIDTH>>2){4'h2}},{(DATA_WIDTH>>2){4'h1}},{(DATA_WIDTH>>2){4'h0}}};//,{(DATA_WIDTH>>2){4'h8}},{(DATA_WIDTH>>2){4'h9}},{(DATA_WIDTH>>2){4'ha}},{(DATA_WIDTH>>2){4'hb}},{(DATA_WIDTH>>2){4'hc}},{(DATA_WIDTH>>2){4'hd}},{(DATA_WIDTH>>2){4'he}},{(DATA_WIDTH>>2){4'hf}}};
        i_en = 1'b0;
        i_cmd = {(TOTAL_COMMMAND>>1){2'b10}};
        
        // enable in progress -- Pass Through
        #40
        rst = 1'b0;
        i_valid = {NUM_INPUT_DATA{1'b1}};
        i_data_bus = {{(DATA_WIDTH>>2){4'h3}},{(DATA_WIDTH>>2){4'h2}},{(DATA_WIDTH>>2){4'h1}},{(DATA_WIDTH>>2){4'h0}}};//,{(DATA_WIDTH>>2){4'h8}},{(DATA_WIDTH>>2){4'h9}},{(DATA_WIDTH>>2){4'ha}},{(DATA_WIDTH>>2){4'hb}},{(DATA_WIDTH>>2){4'hc}},{(DATA_WIDTH>>2){4'hd}},{(DATA_WIDTH>>2){4'he}},{(DATA_WIDTH>>2){4'hf}}};
        i_en = 1'b1;
        i_cmd = {(TOTAL_COMMMAND>>1){2'b10}};

        // reset half way  -- Pass Swtich
        #40
        rst = 1'b1;
        i_valid = {NUM_INPUT_DATA{1'b1}};
        i_data_bus = {{(DATA_WIDTH>>2){4'h3}},{(DATA_WIDTH>>2){4'h2}},{(DATA_WIDTH>>2){4'h1}},{(DATA_WIDTH>>2){4'h0}}};//,{(DATA_WIDTH>>2){4'h8}},{(DATA_WIDTH>>2){4'h9}},{(DATA_WIDTH>>2){4'ha}},{(DATA_WIDTH>>2){4'hb}},{(DATA_WIDTH>>2){4'hc}},{(DATA_WIDTH>>2){4'hd}},{(DATA_WIDTH>>2){4'he}},{(DATA_WIDTH>>2){4'hf}}};
        i_en = 1'b1;
        i_cmd = {(TOTAL_COMMMAND>>1){2'b10}};
                
        // reg active -- No Pass
        #40
        rst = 1'b0;
        i_valid = {NUM_INPUT_DATA{1'b1}};
        i_data_bus = {{(DATA_WIDTH>>2){4'h3}},{(DATA_WIDTH>>2){4'h2}},{(DATA_WIDTH>>2){4'h1}},{(DATA_WIDTH>>2){4'h0}}};//,{(DATA_WIDTH>>2){4'h8}},{(DATA_WIDTH>>2){4'h9}},{(DATA_WIDTH>>2){4'ha}},{(DATA_WIDTH>>2){4'hb}},{(DATA_WIDTH>>2){4'hc}},{(DATA_WIDTH>>2){4'hd}},{(DATA_WIDTH>>2){4'he}},{(DATA_WIDTH>>2){4'hf}}};
        i_en = 1'b1;
        i_cmd = {(TOTAL_COMMMAND>>1){2'b10}};

        // change data half way  -- Pass Through
        #40
        rst = 1'b0;
        i_valid = {NUM_INPUT_DATA{1'b1}};
        i_data_bus = {{(DATA_WIDTH>>2){4'h8}},{(DATA_WIDTH>>2){4'h9}},{(DATA_WIDTH>>2){4'ha}},{(DATA_WIDTH>>2){4'hb}},{(DATA_WIDTH>>2){4'hc}},{(DATA_WIDTH>>2){4'hd}},{(DATA_WIDTH>>2){4'he}},{(DATA_WIDTH>>2){4'hf}}};
        i_en = 1'b1;
        i_cmd = {(TOTAL_COMMMAND>>1){2'b10}};
        
        // invalid high output -- Pass Through
        #40
        rst = 1'b0;
        i_valid = {NUM_INPUT_DATA{1'b1}};
        i_data_bus = {{(DATA_WIDTH>>2){4'h8}},{(DATA_WIDTH>>2){4'h9}},{(DATA_WIDTH>>2){4'ha}},{(DATA_WIDTH>>2){4'hb}},{(DATA_WIDTH>>2){4'hc}},{(DATA_WIDTH>>2){4'hd}},{(DATA_WIDTH>>2){4'he}},{(DATA_WIDTH>>2){4'hf}}};
        i_en = 1'b1;
        i_cmd = {(TOTAL_COMMMAND>>1){2'b10}};
       
        // invalid low output  -- Pass Through
        #40
        rst = 1'b0;
        i_valid = {NUM_INPUT_DATA{1'b1}};
        i_data_bus = {{(DATA_WIDTH>>2){4'h8}},{(DATA_WIDTH>>2){4'h9}},{(DATA_WIDTH>>2){4'ha}},{(DATA_WIDTH>>2){4'hb}},{(DATA_WIDTH>>2){4'hc}},{(DATA_WIDTH>>2){4'hd}},{(DATA_WIDTH>>2){4'he}},{(DATA_WIDTH>>2){4'hf}}};
        i_en = 1'b1;
        i_cmd = {(TOTAL_COMMMAND>>1){2'b10}};
        #40
        $stop;
    end

    // instantiate DUT (device under test)
    benes #(
		.DATA_WIDTH(DATA_WIDTH),
        .COMMMAND_WIDTH(COMMMAND_WIDTH),
        .NUM_SWITCH_IN(NUM_SWITCH_IN)
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