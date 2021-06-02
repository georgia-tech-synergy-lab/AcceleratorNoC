`timescale 1ns / 1ps
/////////////////////////////////////////////////////////////
// Top Module:  linear_network_unicast_seq
// Data:        Only data width matters.
// Format:      keeping the input format unchange
// Timing:      Combinational Logic
// Dummy Data:  {DATA_WIDTH{1'b0}}
// Latency:     i-th PE (start from 0) has i cycles latency
// Function:    Unicast  or  Multicast(arbitrary Multicast)
//                               i_data_bus & i_valid     i_data_bus & i_valid     
//  i_data_bus & i_valid  -->|¯¯¯|------------------>|¯¯¯|------------------>|¯¯¯|--> i_data_bus & i_valid
//         i_dest[N-1:0]  -->|___|------------------>|___|------------------>|___|--> i_dest[N-4:0]     
//          (dst-tag)          |    i_dest[N-2:0]      |     i_dest[N-3:0]     |    
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
`include "/home/jimmy/work/work_tushar/AcceleratorNoC/system_integration/drbe_arion/tiny_tapeout/integration/lib/lib.v"

module linear_network_unicast_seq_1_16#(
	parameter DATA_WIDTH = 32,     // could be arbitrary number
	parameter NUM_NODE = 4         // could be arbitrary integer.
)(
	// interface
	CLK,
	rst,

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
	input                                        CLK;
	input                                        rst;
	
	input                                        i_valid;             
	input  [DATA_WIDTH-1:0]                      i_data_bus;
	
	output [NUM_NODE-1:0]                        o_valid;             
	output [WIDTH_OUTPUT_DATA-1:0]               o_data_bus; // Node 0 output [0+:DATA_WIDTH]; Node max# output [(NUM_NODE-1)*DATA_WIDTH+:DATA_WIDTH]

	input                                        i_en;
	input  [COMMAND_WIDTH-1:0]                   i_cmd;      // destination tag.
 
	// inner logic
	reg    [WIDTH_OUTPUT_DATA-1:0]               o_data_bus_reg;
	reg    [NUM_NODE-1:0]                        o_valid_reg;
	
	reg    [DATA_WIDTH-1:0]                      o_data_forward_reg[0:NUM_NODE-2];
	reg    [COMMAND_WIDTH-1:0]                   o_cmd_forward_reg[0:NUM_NODE-2];
	reg                                          o_valid_forward_reg[0:NUM_NODE-2];

	wire   [DATA_WIDTH-1:0]                      buf_data_forward_wire1[0:NUM_NODE-3];
	wire   [COMMAND_WIDTH-1:0]                   buf_cmd_forward_wire1[0:NUM_NODE-3];
	wire                                         buf_valid_forward_wire1[0:NUM_NODE-3];

	wire   [DATA_WIDTH-1:0]                      buf_data_forward_wire2[0:NUM_NODE-3];
	wire   [COMMAND_WIDTH-1:0]                   buf_cmd_forward_wire2[0:NUM_NODE-3];
	wire                                         buf_valid_forward_wire2[0:NUM_NODE-3];

	wire   [DATA_WIDTH-1:0]                      buf_data_forward_wire3[0:NUM_NODE-3];
	wire   [COMMAND_WIDTH-1:0]                   buf_cmd_forward_wire3[0:NUM_NODE-3];
	wire                                         buf_valid_forward_wire3[0:NUM_NODE-3];
	
	wire   [DATA_WIDTH-1:0]                      buf_data_forward_wire4[0:NUM_NODE-3];
	wire   [COMMAND_WIDTH-1:0]                   buf_cmd_forward_wire4[0:NUM_NODE-3];
	wire                                         buf_valid_forward_wire4[0:NUM_NODE-3];

	// the first switch
	always @(posedge CLK) begin
		if(i_en && (~rst))
		begin
			if(i_cmd=={COMMAND_WIDTH{1'b0}})
			begin
				o_data_bus_reg[0*DATA_WIDTH+:DATA_WIDTH] <= (i_valid)?i_data_bus:{DATA_WIDTH{1'b0}};
				o_valid_reg[0] <= i_valid;
			end
			else
			begin
				o_data_bus_reg[0*DATA_WIDTH+:DATA_WIDTH] <= {DATA_WIDTH{1'b0}};
				o_valid_reg[0] <= 1'b0;
			end
		end
		else
		begin
			o_data_bus_reg[0*DATA_WIDTH+:DATA_WIDTH] <= {DATA_WIDTH{1'b0}};
			o_valid_reg[0] <= 1'b0;
		end
	end

	// the foward data from the first switch to the second switch
	always@(posedge CLK)
	begin
		if(i_en && (~rst))
		begin
			o_data_forward_reg[0] <= i_data_bus;
			o_valid_forward_reg[0] <= i_valid;
			o_cmd_forward_reg[0] <= i_cmd;
		end
		else
		begin
			o_data_forward_reg[0] <= {DATA_WIDTH{1'b0}};
			o_valid_forward_reg[0] <= 1'b0;
			o_cmd_forward_reg[0] <= {COMMAND_WIDTH{1'b0}};
		end
	end

	// the following switches and the following forwarding logics
	genvar i,j;
	generate
		for(i=1; i<NUM_NODE;i=i+1)
		begin: node	
			always @(posedge CLK) begin
				if(i_en && (~rst))
				begin
					if(o_cmd_forward_reg[i-1]==({COMMAND_WIDTH{1'b0}}+i))
					begin
						o_data_bus_reg[i*DATA_WIDTH+:DATA_WIDTH] <= (o_valid_forward_reg[i-1])?o_data_forward_reg[i-1]:{DATA_WIDTH{1'b0}};
						o_valid_reg[i] <= o_valid_forward_reg[i-1];
					end
					else
					begin
						o_data_bus_reg[i*DATA_WIDTH+:DATA_WIDTH] <= {DATA_WIDTH{1'b0}};
						o_valid_reg[i] <= 1'b0;
					end
				end
				else
				begin
					o_data_bus_reg[i*DATA_WIDTH+:DATA_WIDTH] <= {DATA_WIDTH{1'b0}};
					o_valid_reg[i] <= 1'b0;
				end
			end
		end

		for(i=1; i<NUM_NODE-1;i=i+1)
        begin: UI_buf_o_data_assign
			for(j=0; j<DATA_WIDTH;j=j+1)
			begin:every_bit
				BUFFD0BWP30P140LVT UI_BUF_o_data_forward_first (.I(o_data_forward_reg[i-1][j]), .Z(buf_data_forward_wire1[i-1][j]));
				BUFFD0BWP30P140LVT UI_BUF_o_data_forward_second (.I(buf_data_forward_wire1[i-1][j]), .Z(buf_data_forward_wire2[i-1][j]));
				BUFFD0BWP30P140LVT UI_BUF_o_data_forward_third (.I(buf_data_forward_wire2[i-1][j]), .Z(buf_data_forward_wire3[i-1][j]));
				BUFFD0BWP30P140LVT UI_BUF_o_data_forward_last (.I(buf_data_forward_wire3[i-1][j]), .Z(buf_data_forward_wire4[i-1][j]));
			end
		end

		for(i=1; i<NUM_NODE-1;i=i+1)
        begin: UI_buf_o_valid_forward
			BUFFD0BWP30P140LVT UI_BUF_o_valid_forward_first (.I(o_valid_forward_reg[i-1]), .Z(buf_valid_forward_wire1[i-1]));
			BUFFD0BWP30P140LVT UI_BUF_o_valid_forward_second (.I(buf_valid_forward_wire1[i-1]), .Z(buf_valid_forward_wire2[i-1]));
			BUFFD0BWP30P140LVT UI_BUF_o_valid_forward_third (.I(buf_valid_forward_wire2[i-1]), .Z(buf_valid_forward_wire3[i-1]));
			BUFFD0BWP30P140LVT UI_BUF_o_valid_forward_last (.I(buf_valid_forward_wire3[i-1]), .Z(buf_valid_forward_wire4[i-1]));
		end

		for(i=1; i<NUM_NODE-1;i=i+1)
        begin: UI_buf_o_cmd_forward
			for(j=0; j<COMMAND_WIDTH;j=j+1)
			begin:every_bit
				BUFFD0BWP30P140LVT UI_BUF_o_cmd_forward_first (.I(o_cmd_forward_reg[i-1][j]), .Z(buf_cmd_forward_wire1[i-1][j]));
				BUFFD0BWP30P140LVT UI_BUF_o_cmd_forward_second (.I(buf_cmd_forward_wire1[i-1][j]), .Z(buf_cmd_forward_wire2[i-1][j]));
				BUFFD0BWP30P140LVT UI_BUF_o_cmd_forward_third (.I(buf_cmd_forward_wire2[i-1][j]), .Z(buf_cmd_forward_wire3[i-1][j]));
				BUFFD0BWP30P140LVT UI_BUF_o_cmd_forward_last (.I(buf_cmd_forward_wire3[i-1][j]), .Z(buf_cmd_forward_wire4[i-1][j]));
			end
		end

		for(i=1; i<NUM_NODE-1;i=i+1)
		begin: forward_node	
			always@(posedge CLK)
			begin
				if(i_en && (~rst))
				begin
					// o_data_forward_reg[i] <= o_data_forward_reg[i-1];
					// o_valid_forward_reg[i] <= o_valid_forward_reg[i-1];
					// o_cmd_forward_reg[i] <= o_cmd_forward_reg[i-1];
					
					o_data_forward_reg[i] <= buf_data_forward_wire4[i-1];
					o_valid_forward_reg[i] <= buf_valid_forward_wire4[i-1];
					o_cmd_forward_reg[i] <= buf_cmd_forward_wire4[i-1];
				end
				else
				begin
					o_data_forward_reg[i] <= {DATA_WIDTH{1'b0}};
					o_valid_forward_reg[i] <= 1'b0;
					o_cmd_forward_reg[i] <= {COMMAND_WIDTH{1'b0}};
				end
			end
		end
	endgenerate

	// // the last switch and forwarding logics
	// always @(posedge CLK) begin
	// 	if(i_en && (~rst))
	// 	begin
	// 		if(o_cmd_forward_reg[NUM_NODE-2]=={COMMAND_WIDTH{1'b1}})
	// 		begin
	// 			o_data_bus_reg[(NUM_NODE-1)*DATA_WIDTH+:DATA_WIDTH] <= (o_valid_forward_reg[NUM_NODE-2])?o_data_forward_reg[NUM_NODE-2]:{DATA_WIDTH{1'b0}};
	// 			o_valid_reg[NUM_NODE-1] <= o_valid_forward_reg[NUM_NODE-2];
	// 		end
	// 		else
	// 		begin
	// 			o_data_bus_reg[(NUM_NODE-1)*DATA_WIDTH+:DATA_WIDTH] <= {DATA_WIDTH{1'b0}};
	// 			o_valid_reg[NUM_NODE-1] <= 1'b0;
	// 		end
	// 	end
	// 	else
	// 	begin
	// 		o_data_bus_reg[(NUM_NODE-1)*DATA_WIDTH+:DATA_WIDTH] <= {DATA_WIDTH{1'b0}};
	// 		o_valid_reg[NUM_NODE-1] <= 1'b0;
	// 	end
	// end

	assign o_data_bus = o_data_bus_reg;
	assign o_valid = o_valid_reg;

endmodule

