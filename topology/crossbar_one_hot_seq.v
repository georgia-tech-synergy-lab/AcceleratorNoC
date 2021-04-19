`timescale 1ns / 1ps
/////////////////////////////////////////////////////////////
// Top Module:  crossbar_one_hot_seq
// Data:        Only data width matters.
// Format:      keeping the input format unchange
// Timing:      Sequential Logic; 1 cycle latency.
// Dummy Data:  {DATA_WIDTH{1'b0}}
// Command:     Each data comes with a NUM_OUTPUT_DATA-bit one-hot destination command.
//              i_data_bus[0*DATA_WIDTH+:DATA_WIDTH] is corresponding to i_cmd
// Function:    Arbitrary Unicast  or  Arbitrary Multicast
// Note: this file is not parameterizable.
// 
// Example: A 5:4 crossbar. 
//     i_data_bus[0*DATA_WIDTH+:DATA_WIDTH]  ------------------------------------>
//                                            |        |        |        |
//     i_data_bus[1*DATA_WIDTH+:DATA_WIDTH]  ------------------------------------>
//                                            ||       ||       ||       ||
//     i_data_bus[2*DATA_WIDTH+:DATA_WIDTH]  ------------------------------------>
//                                            |||      |||      |||      |||
//     i_data_bus[3*DATA_WIDTH+:DATA_WIDTH]  ------------------------------------>
//                                            ||||     ||||     ||||     ||||
//     i_data_bus[4*DATA_WIDTH+:DATA_WIDTH]  ------------------------------------>
//                                            |||||    |||||    |||||    |||||
//                                            ______   ______   ______   ______
//   5-bit one-hot control to each of mux ->  \____/   \____/   \____/   \____/
//                                              |        |        |        |
//                                              v        v        v        v 
//                                       o_data_bus o_data_bus o_data_bus o_data_bus
//                       [0*DATA_WIDTH+:DATA_WIDTH]           ...         [3*DATA_WIDTH+:DATA_WIDTH]
//
//                       [0*DATA_WIDTH+:DATA_WIDTH]           ...         [3*DATA_WIDTH+:DATA_WIDTH]
//
//
// Example: A 64:8 hierarchy crossbar. For a hierarchy version [2 pipeline stages: first stage = 8* 8:1 mux -- second stage = 1* 8:1 mux;]
//          The following is the hierarchy crossbar for a single output data. 
//          And the whole hierarachy crossbar needs to instantiate the following logic multiple times.
//
//     i_data_bus[0*DATA_WIDTH+:DATA_WIDTH]  ------------------------------------------------------------------------------------------------->
//                                             |                                                           |                    
//     i_data_bus[1*DATA_WIDTH+:DATA_WIDTH]  ------------------------------------------------------------------------------------------------->
//                                             ||                                                          ||                       
//     i_data_bus[2*DATA_WIDTH+:DATA_WIDTH]  ------------------------------------------------------------------------------------------------->
//                                             |||                                                         |||                   
//           ....                              ...                                                         ...                    
//                                             ||||||||                                                    ||||||||               
//     i_data_bus[63*DATA_WIDTH+:DATA_WIDTH]  ------------------------------------------------------------------------------------------------->
//                                             ||||||||                                                    ||||||||               
//                                             ||||||||     ...   i_data_bus[0*DATA_WIDTH+:DATA_WIDTH] ->  |||||||| <- i_data_bus[7*DATA_WIDTH+:DATA_WIDTH]        
//                                             ||||||||                                                    ||||||||         
//     i_data_bus[56*DATA_WIDTH+:DATA_WIDTH]-> |||||||| <- i_data_bus[63*DATA_WIDTH+:DATA_WIDTH]   ...     ||||||||         
//                                            __________                                                  __________            
//   5-bit one-hot control to each of mux ->  \________/                                                  \________/             
//                                                |                                                           |                   
//                                                v                                                           v                     
//                                     inner_first_stage_data_reg[7]                            inner_first_stage_data_reg[0]
//                                                |                                                           |                                       
//                                                ---------------------------  ... ----------------------------
//                                                                          ||||||||
//                                                                         __________ 
//                                                                         \________/          same logic repeats for 8 times.
//                                                                             |             
//                                                                             v              
//                                                                        o_data_bus[7]    ...  o_data_bus[0]
//
//
// Author:      Jianming Tong (jianming.tong@gatech.edu)
/////////////////////////////////////////////////////////////

// `define In16_Out8 
// `define In8_Out8 
`define In8_Out8_input_tree_wire_pipeline_hierarchy_RTL // -> lastest 8:8 version
// `define In8_Out1
// `define In8_Out8_input_pipeline_output_pipeline
// `define In16_Out8_separate_8_8
// `define In16_Out8_separate_8_8_wire_pipeline
// `define In16_Out8_8_8_wire_tree_pipeline   // -> lastest 16:8 version 
// `define In16_Out8_pipeline_wire
// `define In16_Out8_pipeline_wire_pipeline_i_en_pipeline_mux
// `define In16_Out8_pipeline_wire_pipeline_i_en_pipeline_mux_output_pipeline
// `define In64_Out8
// `define In64_Out8_hier_8_8
// `define In32_Out8_hier_4_8
// `define In32_Out8_hier_4_8_separate
// `define In32_Out8_hier_3_lvl_2_2_8_separate
// `define In32_Out8_hier_3_lvl_2_2_8

`ifdef In8_Out1
module crossbar_one_hot_seq#(
	parameter DATA_WIDTH = 32,      // could be arbitrary number
	parameter NUM_OUTPUT_DATA  = 1, // must be power of 2.
	parameter NUM_INPUT_DATA = 8   
)(
    // timeing signals
    clk,
	rst,
	
    // data signals
	i_valid,        // valid input data signal
	i_data_bus,     // input data bus coming into distribute switch
	
	o_valid,        // output valid
    o_data_bus,     // output data 

	// control signals
	i_en,           // distribute switch enable
	i_cmd           // the input should be one-hot encoded command 
);
	//parameter
	localparam TOTAL_COMMMAND = NUM_INPUT_DATA*NUM_OUTPUT_DATA;
	
	localparam WIDTH_INPUT_DATA = NUM_INPUT_DATA*DATA_WIDTH;
	localparam WIDTH_OUTPUT_DATA = NUM_OUTPUT_DATA*DATA_WIDTH;
	
    // interface
	input                                        clk;
	input                                        rst;
	
	input  [NUM_INPUT_DATA-1:0]                  i_valid;             
	input  [WIDTH_INPUT_DATA-1:0]                i_data_bus;
	
	output [NUM_OUTPUT_DATA-1:0]                 o_valid;             
	output [WIDTH_OUTPUT_DATA-1:0]               o_data_bus; // {o_data_a, o_data_b}

	input                                        i_en;
	input  [TOTAL_COMMMAND-1:0]                  i_cmd;

    reg    [NUM_OUTPUT_DATA-1:0]                 o_valid_reg;
    reg    [WIDTH_OUTPUT_DATA-1:0]               o_data_bus_reg;

    genvar i,j;
    generate
        for(i=0; i<NUM_OUTPUT_DATA; i=i+1)
        begin: o_data_output_mux
            
            // data mux
            wire [NUM_INPUT_DATA-1:0] inner_cmd_wire;
            assign inner_cmd_wire = {i_cmd[7*NUM_OUTPUT_DATA+i],i_cmd[6*NUM_OUTPUT_DATA+i],i_cmd[5*NUM_OUTPUT_DATA+i],i_cmd[4*NUM_OUTPUT_DATA+i],i_cmd[3*NUM_OUTPUT_DATA+i],i_cmd[2*NUM_OUTPUT_DATA+i],i_cmd[1*NUM_OUTPUT_DATA+i],i_cmd[0*NUM_OUTPUT_DATA+i]};
            always@(posedge clk)
            begin
               if(i_en && (~rst))
                begin
                    case(inner_cmd_wire)
                        8'b00000001:
                        begin
                            o_data_bus_reg[i*DATA_WIDTH+:DATA_WIDTH] <= (i_valid[0])?i_data_bus[0*DATA_WIDTH+:DATA_WIDTH]:{DATA_WIDTH{1'b0}};
                        end
                        8'b00000010:
                        begin
                            o_data_bus_reg[i*DATA_WIDTH+:DATA_WIDTH] <= (i_valid[1])?i_data_bus[1*DATA_WIDTH+:DATA_WIDTH]:{DATA_WIDTH{1'b0}};
                        end
                        8'b00000100:
                        begin
                            o_data_bus_reg[i*DATA_WIDTH+:DATA_WIDTH] <= (i_valid[2])?i_data_bus[2*DATA_WIDTH+:DATA_WIDTH]:{DATA_WIDTH{1'b0}};
                        end
                        8'b00001000:
                        begin
                            o_data_bus_reg[i*DATA_WIDTH+:DATA_WIDTH] <= (i_valid[3])?i_data_bus[3*DATA_WIDTH+:DATA_WIDTH]:{DATA_WIDTH{1'b0}};
                        end
                        8'b00010000:
                        begin
                            o_data_bus_reg[i*DATA_WIDTH+:DATA_WIDTH] <= (i_valid[4])?i_data_bus[4*DATA_WIDTH+:DATA_WIDTH]:{DATA_WIDTH{1'b0}};
                        end
                        8'b00100000:
                        begin
                            o_data_bus_reg[i*DATA_WIDTH+:DATA_WIDTH] <= (i_valid[5])?i_data_bus[5*DATA_WIDTH+:DATA_WIDTH]:{DATA_WIDTH{1'b0}};
                        end
                        8'b01000000:
                        begin
                            o_data_bus_reg[i*DATA_WIDTH+:DATA_WIDTH] <= (i_valid[6])?i_data_bus[6*DATA_WIDTH+:DATA_WIDTH]:{DATA_WIDTH{1'b0}};
                        end
                        8'b10000000:
                        begin
                            o_data_bus_reg[i*DATA_WIDTH+:DATA_WIDTH] <= (i_valid[7])?i_data_bus[7*DATA_WIDTH+:DATA_WIDTH]:{DATA_WIDTH{1'b0}};
                        end
                        default:
                        begin
                            o_data_bus_reg[i*DATA_WIDTH+:DATA_WIDTH] <= {WIDTH_OUTPUT_DATA{1'b0}};
                        end
                    endcase
                end
                else
                begin
                    o_data_bus_reg[i*DATA_WIDTH+:DATA_WIDTH] <= {WIDTH_OUTPUT_DATA{1'b0}};
                end
            end

            // valid mux
            wire [NUM_INPUT_DATA-1:0] inner_cmd_wire_valid;
            assign inner_cmd_wire_valid = {i_cmd[7*NUM_OUTPUT_DATA+i],i_cmd[6*NUM_OUTPUT_DATA+i],i_cmd[5*NUM_OUTPUT_DATA+i],i_cmd[4*NUM_OUTPUT_DATA+i],i_cmd[3*NUM_OUTPUT_DATA+i],i_cmd[2*NUM_OUTPUT_DATA+i],i_cmd[1*NUM_OUTPUT_DATA+i],i_cmd[0*NUM_OUTPUT_DATA+i]};
            always@(posedge clk)
            begin
               if(i_en && (~rst))
                begin
                    case(inner_cmd_wire_valid)
                        8'b00000001:
                        begin
                            o_valid_reg[i] <= (i_valid[0])?1'b1:1'b0;
                        end
                        8'b00000010:
                        begin
                            o_valid_reg[i] <= (i_valid[1])?1'b1:1'b0;
                        end
                        8'b00000100:
                        begin
                            o_valid_reg[i] <= (i_valid[2])?1'b1:1'b0;
                        end
                        8'b00001000:
                        begin
                            o_valid_reg[i] <= (i_valid[3])?1'b1:1'b0;
                        end
                        8'b00010000:
                        begin
                            o_valid_reg[i] <= (i_valid[4])?1'b1:1'b0;
                        end
                        8'b00100000:
                        begin
                            o_valid_reg[i] <= (i_valid[5])?1'b1:1'b0;
                        end
                        8'b01000000:
                        begin
                            o_valid_reg[i] <= (i_valid[6])?1'b1:1'b0;
                        end
                        8'b10000000:
                        begin
                            o_valid_reg[i] <= (i_valid[7])?1'b1:1'b0;
                        end
                        default:
                        begin
                            o_valid_reg[i] <= 1'b0;
                        end
                    endcase
                end
                else
                begin
                    o_valid_reg[i] <= 1'b0;
                end
            end

        end
    endgenerate

    assign o_data_bus = o_data_bus_reg;
    assign o_valid = o_valid_reg;

endmodule
`endif


`ifdef In8_Out8
module crossbar_one_hot_seq#(
	parameter DATA_WIDTH = 32,      // could be arbitrary number
	parameter NUM_OUTPUT_DATA  = 8, // must be power of 2.
	parameter NUM_INPUT_DATA = 8   
)(
    // timeing signals
    clk,
	rst,
	
    // data signals
	i_valid,        // valid input data signal
	i_data_bus,     // input data bus coming into distribute switch
	
	o_valid,        // output valid
    o_data_bus,     // output data 

	// control signals
	i_en,           // distribute switch enable
	i_cmd           // the input should be one-hot encoded command 
);
	//parameter
	localparam TOTAL_COMMMAND = NUM_INPUT_DATA*NUM_OUTPUT_DATA;
	
	localparam WIDTH_INPUT_DATA = NUM_INPUT_DATA*DATA_WIDTH;
	localparam WIDTH_OUTPUT_DATA = NUM_OUTPUT_DATA*DATA_WIDTH;
	
    // interface
	input                                        clk;
	input                                        rst;
	
	input  [NUM_INPUT_DATA-1:0]                  i_valid;             
	input  [WIDTH_INPUT_DATA-1:0]                i_data_bus;
	
	output [NUM_OUTPUT_DATA-1:0]                 o_valid;             
	output [WIDTH_OUTPUT_DATA-1:0]               o_data_bus; // {o_data_a, o_data_b}

	input                                        i_en;
	input  [TOTAL_COMMMAND-1:0]                  i_cmd;

    reg    [NUM_OUTPUT_DATA-1:0]                 o_valid_reg;
    reg    [WIDTH_OUTPUT_DATA-1:0]               o_data_bus_reg;

    genvar i,j;
    generate
        for(i=0; i<NUM_OUTPUT_DATA; i=i+1)
        begin: o_data_output_mux
            
            // data mux
            wire [NUM_INPUT_DATA-1:0] inner_cmd_wire;
            assign inner_cmd_wire = {i_cmd[7*NUM_OUTPUT_DATA+i],i_cmd[6*NUM_OUTPUT_DATA+i],i_cmd[5*NUM_OUTPUT_DATA+i],i_cmd[4*NUM_OUTPUT_DATA+i],i_cmd[3*NUM_OUTPUT_DATA+i],i_cmd[2*NUM_OUTPUT_DATA+i],i_cmd[1*NUM_OUTPUT_DATA+i],i_cmd[0*NUM_OUTPUT_DATA+i]};
            always@(posedge clk)
            begin
               if(i_en && (~rst))
                begin
                    case(inner_cmd_wire)
                        8'b00000001:
                        begin
                            o_data_bus_reg[i*DATA_WIDTH+:DATA_WIDTH] <= (i_valid[0])?i_data_bus[0*DATA_WIDTH+:DATA_WIDTH]:{DATA_WIDTH{1'b0}};
                        end
                        8'b00000010:
                        begin
                            o_data_bus_reg[i*DATA_WIDTH+:DATA_WIDTH] <= (i_valid[1])?i_data_bus[1*DATA_WIDTH+:DATA_WIDTH]:{DATA_WIDTH{1'b0}};
                        end
                        8'b00000100:
                        begin
                            o_data_bus_reg[i*DATA_WIDTH+:DATA_WIDTH] <= (i_valid[2])?i_data_bus[2*DATA_WIDTH+:DATA_WIDTH]:{DATA_WIDTH{1'b0}};
                        end
                        8'b00001000:
                        begin
                            o_data_bus_reg[i*DATA_WIDTH+:DATA_WIDTH] <= (i_valid[3])?i_data_bus[3*DATA_WIDTH+:DATA_WIDTH]:{DATA_WIDTH{1'b0}};
                        end
                        8'b00010000:
                        begin
                            o_data_bus_reg[i*DATA_WIDTH+:DATA_WIDTH] <= (i_valid[4])?i_data_bus[4*DATA_WIDTH+:DATA_WIDTH]:{DATA_WIDTH{1'b0}};
                        end
                        8'b00100000:
                        begin
                            o_data_bus_reg[i*DATA_WIDTH+:DATA_WIDTH] <= (i_valid[5])?i_data_bus[5*DATA_WIDTH+:DATA_WIDTH]:{DATA_WIDTH{1'b0}};
                        end
                        8'b01000000:
                        begin
                            o_data_bus_reg[i*DATA_WIDTH+:DATA_WIDTH] <= (i_valid[6])?i_data_bus[6*DATA_WIDTH+:DATA_WIDTH]:{DATA_WIDTH{1'b0}};
                        end
                        8'b10000000:
                        begin
                            o_data_bus_reg[i*DATA_WIDTH+:DATA_WIDTH] <= (i_valid[7])?i_data_bus[7*DATA_WIDTH+:DATA_WIDTH]:{DATA_WIDTH{1'b0}};
                        end
                        default:
                        begin
                            o_data_bus_reg[i*DATA_WIDTH+:DATA_WIDTH] <= {WIDTH_OUTPUT_DATA{1'b0}};
                        end
                    endcase
                end
                else
                begin
                    o_data_bus_reg[i*DATA_WIDTH+:DATA_WIDTH] <= {WIDTH_OUTPUT_DATA{1'b0}};
                end
            end

            // valid mux
            wire [NUM_INPUT_DATA-1:0] inner_cmd_wire_valid;
            assign inner_cmd_wire_valid = {i_cmd[7*NUM_OUTPUT_DATA+i],i_cmd[6*NUM_OUTPUT_DATA+i],i_cmd[5*NUM_OUTPUT_DATA+i],i_cmd[4*NUM_OUTPUT_DATA+i],i_cmd[3*NUM_OUTPUT_DATA+i],i_cmd[2*NUM_OUTPUT_DATA+i],i_cmd[1*NUM_OUTPUT_DATA+i],i_cmd[0*NUM_OUTPUT_DATA+i]};
            always@(posedge clk)
            begin
               if(i_en && (~rst))
                begin
                    case(inner_cmd_wire_valid)
                        8'b00000001:
                        begin
                            o_valid_reg[i] <= (i_valid[0])?1'b1:1'b0;
                        end
                        8'b00000010:
                        begin
                            o_valid_reg[i] <= (i_valid[1])?1'b1:1'b0;
                        end
                        8'b00000100:
                        begin
                            o_valid_reg[i] <= (i_valid[2])?1'b1:1'b0;
                        end
                        8'b00001000:
                        begin
                            o_valid_reg[i] <= (i_valid[3])?1'b1:1'b0;
                        end
                        8'b00010000:
                        begin
                            o_valid_reg[i] <= (i_valid[4])?1'b1:1'b0;
                        end
                        8'b00100000:
                        begin
                            o_valid_reg[i] <= (i_valid[5])?1'b1:1'b0;
                        end
                        8'b01000000:
                        begin
                            o_valid_reg[i] <= (i_valid[6])?1'b1:1'b0;
                        end
                        8'b10000000:
                        begin
                            o_valid_reg[i] <= (i_valid[7])?1'b1:1'b0;
                        end
                        default:
                        begin
                            o_valid_reg[i] <= 1'b0;
                        end
                    endcase
                end
                else
                begin
                    o_valid_reg[i] <= 1'b0;
                end
            end

        end
    endgenerate

    assign o_data_bus = o_data_bus_reg;
    assign o_valid = o_valid_reg;

endmodule
`endif

`ifdef In8_Out8_input_tree_wire_pipeline_hierarchy_RTL
module crossbar_one_hot_seq#(
	parameter DATA_WIDTH = 32,      // could be arbitrary number
	parameter NUM_OUTPUT_DATA  = 8, // must be power of 2.
	parameter NUM_INPUT_DATA = 8   
)(

    // timeing signals
    clk,
	rst,
	
    // data signals
	i_valid,        // valid input data signal
	i_data_bus,     // input data bus coming into distribute switch
	
	o_valid,        // output valid
    o_data_bus,     // output data 

	// control signals
	i_en,           // distribute switch enable
	i_cmd           // the input should be one-hot encoded command 
);

	//parameter
	localparam TOTAL_COMMMAND = NUM_INPUT_DATA*NUM_OUTPUT_DATA;
	
	localparam WIDTH_INPUT_DATA = NUM_INPUT_DATA*DATA_WIDTH;
	localparam WIDTH_OUTPUT_DATA = NUM_OUTPUT_DATA*DATA_WIDTH;
	
    // interface
	input                                        clk;
	input                                        rst;
	
	input  [NUM_INPUT_DATA-1:0]                  i_valid;             
	input  [WIDTH_INPUT_DATA-1:0]                i_data_bus;
	
	output [NUM_OUTPUT_DATA-1:0]                 o_valid;             
	output [WIDTH_OUTPUT_DATA-1:0]               o_data_bus; // {o_data_a, o_data_b}

	input                                        i_en;
	input  [TOTAL_COMMMAND-1:0]                  i_cmd;

	reg    [NUM_OUTPUT_DATA-1:0]                 o_valid_reg;             
	reg    [WIDTH_OUTPUT_DATA-1:0]               o_data_bus_reg; // {o_data_a, o_data_b}

    wire   [NUM_OUTPUT_DATA-1:0]                 o_valid_wire;             
	wire   [WIDTH_OUTPUT_DATA-1:0]               o_data_bus_wire; // {o_data_a, o_data_b}

    localparam  NUM_OUT_WIRE_PIPELINE = 2;

    // inner logic
    genvar i,j,k;
    generate
        // wire definition -- for input data & valid
        wire [NUM_OUTPUT_DATA*NUM_INPUT_DATA*DATA_WIDTH-1:0]  inner_data_wire;
        wire [NUM_OUTPUT_DATA*NUM_INPUT_DATA-1:0]             inner_valid_wire;

        // wire_tree_pipeline -- for input data & valid
        for(i=0; i<NUM_INPUT_DATA; i=i+1)
        begin: top_half
            wire_binary_tree_1_8_seq#(
                .DATA_WIDTH(DATA_WIDTH), 
                .NUM_OUTPUT_DATA(8),
                .NUM_INPUT_DATA(1)) 
            wire_pipeline(
                .clk(clk),
                .rst(rst),
                .i_valid(i_valid[i]),
                .i_data_bus(i_data_bus[i*DATA_WIDTH+:DATA_WIDTH]),
                .o_valid(inner_valid_wire[i*NUM_OUTPUT_DATA+:NUM_OUTPUT_DATA]),
                .o_data_bus(inner_data_wire[i*NUM_OUTPUT_DATA*DATA_WIDTH+:NUM_OUTPUT_DATA*DATA_WIDTH]),
                .i_en(i_en)
            );
        end

        // input command
        for(i=0; i<NUM_INPUT_DATA; i=i+1)
        begin:i_cmd_id  
            wire                                             inner_cmd_wire[0:NUM_INPUT_DATA-1];
            
            cmd_wire_binary_tree_1_8_seq #(
                .DATA_WIDTH(DATA_WIDTH), 
                .NUM_OUTPUT_DATA(8),
                .NUM_INPUT_DATA(1)) 
            cmd_pipeline(
                .clk(clk),
                .rst(rst),
                .i_cmd(i_cmd[i*NUM_OUTPUT_DATA+:NUM_OUTPUT_DATA]),
                .o_cmd_0(inner_cmd_wire[0]),
                .o_cmd_1(inner_cmd_wire[1]),
                .o_cmd_2(inner_cmd_wire[2]),
                .o_cmd_3(inner_cmd_wire[3]),
                .o_cmd_4(inner_cmd_wire[4]),
                .o_cmd_5(inner_cmd_wire[5]),
                .o_cmd_6(inner_cmd_wire[6]),
                .o_cmd_7(inner_cmd_wire[7]),
                .i_en(i_en)
            );
        end
        
        // eight 8:1 mux tree
        for(i=0; i<NUM_OUTPUT_DATA; i=i+1)
        begin: bottom_half
            wire [NUM_INPUT_DATA*DATA_WIDTH-1:0]  inner_data_i_mux_tree_wire;
            wire [NUM_INPUT_DATA-1:0]             inner_valid_i_mux_tree_wire;
            wire [NUM_OUTPUT_DATA-1:0]            inner_cmd_i_mux_tree_wire;

            assign inner_data_i_mux_tree_wire = {inner_data_wire[(7*NUM_OUTPUT_DATA+i)*DATA_WIDTH+:DATA_WIDTH], inner_data_wire[(6*NUM_OUTPUT_DATA+i)*DATA_WIDTH+:DATA_WIDTH], inner_data_wire[(5*NUM_OUTPUT_DATA+i)*DATA_WIDTH+:DATA_WIDTH], inner_data_wire[(4*NUM_OUTPUT_DATA+i)*DATA_WIDTH+:DATA_WIDTH], inner_data_wire[(3*NUM_OUTPUT_DATA+i)*DATA_WIDTH+:DATA_WIDTH], inner_data_wire[(2*NUM_OUTPUT_DATA+i)*DATA_WIDTH+:DATA_WIDTH], inner_data_wire[(1*NUM_OUTPUT_DATA+i)*DATA_WIDTH+:DATA_WIDTH], inner_data_wire[(0*NUM_OUTPUT_DATA+i)*DATA_WIDTH+:DATA_WIDTH]};
            assign inner_valid_i_mux_tree_wire = {inner_valid_wire[7*NUM_OUTPUT_DATA+i], inner_valid_wire[6*NUM_OUTPUT_DATA+i], inner_valid_wire[5*NUM_OUTPUT_DATA+i], inner_valid_wire[4*NUM_OUTPUT_DATA+i], inner_valid_wire[3*NUM_OUTPUT_DATA+i], inner_valid_wire[2*NUM_OUTPUT_DATA+i], inner_valid_wire[1*NUM_OUTPUT_DATA+i], inner_valid_wire[0*NUM_OUTPUT_DATA+i]};
            assign inner_cmd_i_mux_tree_wire = {i_cmd_id[7].inner_cmd_wire[i], i_cmd_id[6].inner_cmd_wire[i], i_cmd_id[5].inner_cmd_wire[i], i_cmd_id[4].inner_cmd_wire[i], i_cmd_id[3].inner_cmd_wire[i], i_cmd_id[2].inner_cmd_wire[i], i_cmd_id[1].inner_cmd_wire[i], i_cmd_id[0].inner_cmd_wire[i]};

            mux_tree_8_1_seq #(
                .NUM_INPUT_DATA(8), 
                .NUM_OUTPUT_DATA(1),
                .DATA_WIDTH(DATA_WIDTH)) 
            mux_tree(
                .clk(clk),
                .rst(rst),
                .i_valid(inner_valid_i_mux_tree_wire),
                .i_data_bus(inner_data_i_mux_tree_wire),
                .o_valid(o_valid_wire[i]),
                .o_data_bus(o_data_bus_wire[i*DATA_WIDTH+:DATA_WIDTH]),
                .i_en(i_en),
                .i_cmd(inner_cmd_i_mux_tree_wire)
            );
        end


        // output pipeline  
        for(j=0; j< NUM_OUT_WIRE_PIPELINE; j=j+1)
        begin:output_shift_def
            reg    [NUM_OUTPUT_DATA-1:0]                 o_valid_reg_shift;
            reg    [WIDTH_OUTPUT_DATA-1:0]               o_data_bus_reg_shift;
        end 

        always @(posedge clk) 
        begin
            output_shift_def[0].o_valid_reg_shift <= o_valid_wire;
            output_shift_def[0].o_data_bus_reg_shift <=  o_data_bus_wire;
        end

        // output pipeline
        for(j=1; j< NUM_OUT_WIRE_PIPELINE; j=j+1)
        begin:shift_output
            always @(posedge clk) 
            begin
                output_shift_def[j].o_valid_reg_shift <= output_shift_def[j-1].o_valid_reg_shift;
                output_shift_def[j].o_data_bus_reg_shift <=  output_shift_def[j-1].o_data_bus_reg_shift;
            end
        end 

        always @(posedge clk) 
        begin:shift_output_last
            o_valid_reg <= output_shift_def[NUM_OUT_WIRE_PIPELINE-1].o_valid_reg_shift;
            o_data_bus_reg <= output_shift_def[NUM_OUT_WIRE_PIPELINE-1].o_data_bus_reg_shift;
        end
    endgenerate

    assign o_data_bus = o_data_bus_reg;
    assign o_valid = o_valid_reg;

endmodule


module wire_binary_tree_1_8_seq #(
	parameter DATA_WIDTH = 32,      // could be arbitrary number
	parameter NUM_OUTPUT_DATA  = 8, // must be power of 2.
	parameter NUM_INPUT_DATA = 1   
)(
    // timeing signals
    clk,
	rst,
	
    // data signals
	i_valid,        // valid input data signal
	i_data_bus,     // input data bus coming into distribute switch
	
	o_valid,        // output valid
    o_data_bus,     // output data 
	
    // control signals
	i_en            // distribute switch enable
);

	//parameter
	localparam TOTAL_COMMMAND = NUM_INPUT_DATA*NUM_OUTPUT_DATA;
	
	localparam WIDTH_INPUT_DATA = NUM_INPUT_DATA*DATA_WIDTH;
	localparam WIDTH_OUTPUT_DATA = NUM_OUTPUT_DATA*DATA_WIDTH;
	localparam NUM_LEVEL = $clog2(NUM_OUTPUT_DATA);

    // interface
	input                                        clk;
	input                                        rst;

	input  [NUM_INPUT_DATA-1:0]                  i_valid;             
	input  [WIDTH_INPUT_DATA-1:0]                i_data_bus;

	output [NUM_OUTPUT_DATA-1:0]                 o_valid;             
	output [WIDTH_OUTPUT_DATA-1:0]               o_data_bus; // {o_data_a, o_data_b}

	input                                        i_en;

    reg    [NUM_OUTPUT_DATA-1:0]                 o_valid_reg;
    reg    [WIDTH_OUTPUT_DATA-1:0]               o_data_bus_reg;


    genvar i,j;
    generate 
        for (i = 0; i< NUM_LEVEL; i=i+1)
        begin: wire_tree_level
            localparam NUM_SWITCH_SHIFT =  (4'b0001 << i);
            localparam WIDTH_DATA_LEVEL = NUM_SWITCH_SHIFT*DATA_WIDTH;

            // define the output wire for switches of level i
            reg      [WIDTH_DATA_LEVEL-1:0]         i_data_latch;
            reg      [NUM_SWITCH_SHIFT-1:0]         i_valid_latch;
        end

        always@(posedge clk)
        begin: first_level_assignment
            if(i_en && (~rst))
            begin
                wire_tree_level[0].i_data_latch <= i_data_bus;
                wire_tree_level[0].i_valid_latch <= i_valid;
            end
            else
            begin
                wire_tree_level[0].i_data_latch <= {DATA_WIDTH{1'b0}};
                wire_tree_level[0].i_valid_latch <= 1'b0;
            end
        end
        
        for (i = 0; i< NUM_LEVEL-1; i=i+1)
        begin: wire_tree_assignment
            localparam NUM_SWITCH_SHIFT =  (4'b0001 << i);
            localparam WIDTH_DATA_LEVEL = NUM_SWITCH_SHIFT*DATA_WIDTH; 
            
            for( j=0; j<NUM_SWITCH_SHIFT; j=j+1)
            begin: level_assignment
                always@(posedge clk)
                begin
                    if(i_en && (~rst))
                    begin
                        wire_tree_level[i+1].i_data_latch[(2*j)*DATA_WIDTH+:DATA_WIDTH] <= wire_tree_level[i].i_data_latch[j*DATA_WIDTH+:DATA_WIDTH];
                        wire_tree_level[i+1].i_valid_latch[2*j] <= wire_tree_level[i].i_valid_latch[j];

                        wire_tree_level[i+1].i_data_latch[(2*j+1)*DATA_WIDTH+:DATA_WIDTH] <= wire_tree_level[i].i_data_latch[j*DATA_WIDTH+:DATA_WIDTH];
                        wire_tree_level[i+1].i_valid_latch[2*j+1] <= wire_tree_level[i].i_valid_latch[j];
                    end
                    else
                    begin
                        wire_tree_level[i+1].i_data_latch[(2*j)*DATA_WIDTH+:DATA_WIDTH] <= {DATA_WIDTH{1'b0}};
                        wire_tree_level[i+1].i_valid_latch[2*j] <= 1'b0;

                        wire_tree_level[i+1].i_data_latch[(2*j+1)*DATA_WIDTH+:DATA_WIDTH] <= {DATA_WIDTH{1'b0}};
                        wire_tree_level[i+1].i_valid_latch[2*j+1] <= 1'b0;
                    end
                end
            end
        end

        for(i=0; i<(NUM_OUTPUT_DATA>>1); i=i+1)
        begin: assign_output_latch
            always @(posedge clk) begin
                if(i_en && (~rst))
                begin
                    o_data_bus_reg[2*i*DATA_WIDTH+:DATA_WIDTH] <= wire_tree_level[NUM_LEVEL-1].i_data_latch[i*DATA_WIDTH+:DATA_WIDTH];
                    o_valid_reg[2*i] <= wire_tree_level[NUM_LEVEL-1].i_valid_latch[i];

                    o_data_bus_reg[(2*i+1)*DATA_WIDTH+:DATA_WIDTH] <= wire_tree_level[NUM_LEVEL-1].i_data_latch[i*DATA_WIDTH+:DATA_WIDTH];
                    o_valid_reg[2*i+1] <= wire_tree_level[NUM_LEVEL-1].i_valid_latch[i];
                end
                else
                begin
                    o_data_bus_reg[2*i*DATA_WIDTH+:DATA_WIDTH] <= {DATA_WIDTH{1'b0}};
                    o_valid_reg[2*i] <= 1'b0;

                    o_data_bus_reg[(2*i+1)*DATA_WIDTH+:DATA_WIDTH] <= {DATA_WIDTH{1'b0}};
                    o_valid_reg[2*i+1] <= 1'b0;
                end
            end
        end
    endgenerate

    assign o_data_bus = o_data_bus_reg;
    assign o_valid = o_valid_reg;

endmodule


module cmd_wire_binary_tree_1_8_seq #(
	parameter DATA_WIDTH = 32,      // could be arbitrary number
	parameter NUM_OUTPUT_DATA  = 8, // must be power of 2.
	parameter NUM_INPUT_DATA = 1   
)(
    // timeing signals
    clk,
	rst,
	
    // data signals
	// i_valid,        // valid input data signal
	// i_data_bus,     // input data bus coming into distribute switch
	
	// o_valid,        // output valid
    // o_data_bus,     // output data 
    o_cmd_0,
    o_cmd_1,
    o_cmd_2,
    o_cmd_3,
    o_cmd_4,
    o_cmd_5,
    o_cmd_6,
    o_cmd_7,
	
    // control signals
	i_en,           // distribute switch enable
	i_cmd           // input command
);

	//parameter
	localparam TOTAL_COMMMAND = NUM_INPUT_DATA*NUM_OUTPUT_DATA;
	
	localparam WIDTH_INPUT_DATA = NUM_INPUT_DATA*DATA_WIDTH;
	localparam WIDTH_OUTPUT_DATA = NUM_OUTPUT_DATA*DATA_WIDTH;
	localparam NUM_LEVEL = $clog2(NUM_OUTPUT_DATA);

    // interface
	input                                        clk;
	input                                        rst;

	input  [TOTAL_COMMMAND-1:0]                  i_cmd;  

	output                                       o_cmd_0;             
	output                                       o_cmd_1;             
	output                                       o_cmd_2;             
	output                                       o_cmd_3;             
	output                                       o_cmd_4;             
	output                                       o_cmd_5;             
	output                                       o_cmd_6;             
	output                                       o_cmd_7;             

	input                                        i_en;

    reg                                          o_cmd_reg[0:NUM_OUTPUT_DATA-1] ;
    
    // 
    genvar i,j;
    generate
        for(i=0; i<NUM_LEVEL; i=i+1)
        begin:cmd_wire
            localparam WIDTH_PER_CMD_REG = NUM_OUTPUT_DATA>>i;
            localparam NUM_CMD_REG = 4'b0001<<i;

            reg  [WIDTH_PER_CMD_REG-1:0]         inner_cmd_reg[0:NUM_CMD_REG-1];
        end

        always@(posedge clk)
        begin
            if(i_en && (~rst))
            begin
                cmd_wire[0].inner_cmd_reg[0] <= i_cmd;
            end
            else
            begin
                cmd_wire[0].inner_cmd_reg[0] <= {NUM_OUTPUT_DATA{1'b0}};
            end
            // cmd_wire[0].inner_cmd_reg[1] <= i_cmd[1*cmd_wire[0].WIDTH_PER_CMD_REG+:cmd_wire[0].WIDTH_PER_CMD_REG];
        end

        // input command pipeline
        for(i=1; i<NUM_LEVEL; i=i+1)
        begin:command_pipeline_top_half
            localparam WIDTH_PER_CMD_REG = NUM_OUTPUT_DATA>>i;
            localparam NUM_CMD_REG = 4'b0001<<i;
            localparam NUM_CMD_REG_LAST_LEVEL = NUM_CMD_REG>>1;

            for(j=0; j<NUM_CMD_REG_LAST_LEVEL; j=j+1)
            begin: cmd_level_assignment
                always@(posedge clk)
                begin
                    cmd_wire[i].inner_cmd_reg[2*j] <= cmd_wire[i-1].inner_cmd_reg[j][0*cmd_wire[i].WIDTH_PER_CMD_REG+:cmd_wire[i].WIDTH_PER_CMD_REG];
                    cmd_wire[i].inner_cmd_reg[2*j+1] <= cmd_wire[i-1].inner_cmd_reg[j][1*cmd_wire[i].WIDTH_PER_CMD_REG+:cmd_wire[i].WIDTH_PER_CMD_REG];
                end
            end
        end

        for(i=0; i<(NUM_OUTPUT_DATA>>1); i=i+1)
        begin:o_latch_assignment
            always @(posedge clk) 
            begin
                o_cmd_reg[2*i] <= cmd_wire[NUM_LEVEL-1].inner_cmd_reg[i][0]; 
                o_cmd_reg[2*i+1] <= cmd_wire[NUM_LEVEL-1].inner_cmd_reg[i][1]; 
            end
        end
    endgenerate

    assign o_cmd_0  = o_cmd_reg[0];
    assign o_cmd_1  = o_cmd_reg[1];
    assign o_cmd_2  = o_cmd_reg[2];
    assign o_cmd_3  = o_cmd_reg[3];
    assign o_cmd_4  = o_cmd_reg[4];
    assign o_cmd_5  = o_cmd_reg[5];
    assign o_cmd_6  = o_cmd_reg[6];
    assign o_cmd_7  = o_cmd_reg[7];

endmodule


module mux_tree_8_1_seq #(
	parameter DATA_WIDTH = 32,      // could be arbitrary number
	parameter NUM_OUTPUT_DATA  = 1, // must be power of 2.
	parameter NUM_INPUT_DATA = 8   
)(
    // timeing signals
    clk,
	rst,
	
    // data signals
	i_valid,        // valid input data signal
	i_data_bus,     // input data bus coming into distribute switch
	
	o_valid,        // output valid
    o_data_bus,     // output data 

	// control signals
	i_en,           // distribute switch enable
	i_cmd           // the input should be one-hot encoded command 
);
	//parameter
	localparam TOTAL_COMMMAND = NUM_INPUT_DATA*NUM_OUTPUT_DATA;
	
	localparam WIDTH_INPUT_DATA = NUM_INPUT_DATA*DATA_WIDTH;
	localparam WIDTH_OUTPUT_DATA = NUM_OUTPUT_DATA*DATA_WIDTH;

	
    // interface
	input                                        clk;
	input                                        rst;

	input  [NUM_INPUT_DATA-1:0]                  i_valid;             
	input  [WIDTH_INPUT_DATA-1:0]                i_data_bus;

	output [NUM_OUTPUT_DATA-1:0]                 o_valid;             
	output [WIDTH_OUTPUT_DATA-1:0]               o_data_bus; // {o_data_a, o_data_b}

	input                                        i_en;
	input  [TOTAL_COMMMAND-1:0]                  i_cmd;

    reg    [NUM_OUTPUT_DATA-1:0]                 o_valid_reg;
    reg    [WIDTH_OUTPUT_DATA-1:0]               o_data_bus_reg;

    genvar i,j;
    generate
        for(i=0; i<NUM_OUTPUT_DATA; i=i+1)
        begin: o_data_output_mux
            
            // data mux
            wire [NUM_INPUT_DATA-1:0] inner_cmd_wire;
            assign inner_cmd_wire = {i_cmd[7*NUM_OUTPUT_DATA+i],i_cmd[6*NUM_OUTPUT_DATA+i],i_cmd[5*NUM_OUTPUT_DATA+i],i_cmd[4*NUM_OUTPUT_DATA+i],i_cmd[3*NUM_OUTPUT_DATA+i],i_cmd[2*NUM_OUTPUT_DATA+i],i_cmd[1*NUM_OUTPUT_DATA+i],i_cmd[0*NUM_OUTPUT_DATA+i]};
            always@(posedge clk)
            begin
               if(i_en && (~rst))
                begin
                    case(inner_cmd_wire)
                        8'b00000001:
                        begin
                            o_data_bus_reg[i*DATA_WIDTH+:DATA_WIDTH] <= (i_valid[0])?i_data_bus[0*DATA_WIDTH+:DATA_WIDTH]:{DATA_WIDTH{1'b0}};
                        end
                        8'b00000010:
                        begin
                            o_data_bus_reg[i*DATA_WIDTH+:DATA_WIDTH] <= (i_valid[1])?i_data_bus[1*DATA_WIDTH+:DATA_WIDTH]:{DATA_WIDTH{1'b0}};
                        end
                        8'b00000100:
                        begin
                            o_data_bus_reg[i*DATA_WIDTH+:DATA_WIDTH] <= (i_valid[2])?i_data_bus[2*DATA_WIDTH+:DATA_WIDTH]:{DATA_WIDTH{1'b0}};
                        end
                        8'b00001000:
                        begin
                            o_data_bus_reg[i*DATA_WIDTH+:DATA_WIDTH] <= (i_valid[3])?i_data_bus[3*DATA_WIDTH+:DATA_WIDTH]:{DATA_WIDTH{1'b0}};
                        end
                        8'b00010000:
                        begin
                            o_data_bus_reg[i*DATA_WIDTH+:DATA_WIDTH] <= (i_valid[4])?i_data_bus[4*DATA_WIDTH+:DATA_WIDTH]:{DATA_WIDTH{1'b0}};
                        end
                        8'b00100000:
                        begin
                            o_data_bus_reg[i*DATA_WIDTH+:DATA_WIDTH] <= (i_valid[5])?i_data_bus[5*DATA_WIDTH+:DATA_WIDTH]:{DATA_WIDTH{1'b0}};
                        end
                        8'b01000000:
                        begin
                            o_data_bus_reg[i*DATA_WIDTH+:DATA_WIDTH] <= (i_valid[6])?i_data_bus[6*DATA_WIDTH+:DATA_WIDTH]:{DATA_WIDTH{1'b0}};
                        end
                        8'b10000000:
                        begin
                            o_data_bus_reg[i*DATA_WIDTH+:DATA_WIDTH] <= (i_valid[7])?i_data_bus[7*DATA_WIDTH+:DATA_WIDTH]:{DATA_WIDTH{1'b0}};
                        end
                        default:
                        begin
                            o_data_bus_reg[i*DATA_WIDTH+:DATA_WIDTH] <= {WIDTH_OUTPUT_DATA{1'b0}};
                        end
                    endcase
                end
                else
                begin
                    o_data_bus_reg[i*DATA_WIDTH+:DATA_WIDTH] <= {WIDTH_OUTPUT_DATA{1'b0}};
                end
            end

            // valid mux
            wire [NUM_INPUT_DATA-1:0] inner_cmd_wire_valid;
            assign inner_cmd_wire_valid = {i_cmd[7*NUM_OUTPUT_DATA+i],i_cmd[6*NUM_OUTPUT_DATA+i],i_cmd[5*NUM_OUTPUT_DATA+i],i_cmd[4*NUM_OUTPUT_DATA+i],i_cmd[3*NUM_OUTPUT_DATA+i],i_cmd[2*NUM_OUTPUT_DATA+i],i_cmd[1*NUM_OUTPUT_DATA+i],i_cmd[0*NUM_OUTPUT_DATA+i]};
            always@(posedge clk)
            begin
               if(i_en && (~rst))
                begin
                    case(inner_cmd_wire_valid)
                        8'b00000001:
                        begin
                            o_valid_reg[i] <= (i_valid[0])?1'b1:1'b0;
                        end
                        8'b00000010:
                        begin
                            o_valid_reg[i] <= (i_valid[1])?1'b1:1'b0;
                        end
                        8'b00000100:
                        begin
                            o_valid_reg[i] <= (i_valid[2])?1'b1:1'b0;
                        end
                        8'b00001000:
                        begin
                            o_valid_reg[i] <= (i_valid[3])?1'b1:1'b0;
                        end
                        8'b00010000:
                        begin
                            o_valid_reg[i] <= (i_valid[4])?1'b1:1'b0;
                        end
                        8'b00100000:
                        begin
                            o_valid_reg[i] <= (i_valid[5])?1'b1:1'b0;
                        end
                        8'b01000000:
                        begin
                            o_valid_reg[i] <= (i_valid[6])?1'b1:1'b0;
                        end
                        8'b10000000:
                        begin
                            o_valid_reg[i] <= (i_valid[7])?1'b1:1'b0;
                        end
                        default:
                        begin
                            o_valid_reg[i] <= 1'b0;
                        end
                    endcase
                end
                else
                begin
                    o_valid_reg[i] <= 1'b0;
                end
            end
        end
    endgenerate

    assign o_data_bus = o_data_bus_reg;
    assign o_valid = o_valid_reg;

endmodule
`endif

`ifdef In8_Out8_input_pipeline_output_pipeline
module crossbar_one_hot_seq#(
	parameter DATA_WIDTH = 32,      // could be arbitrary number
	parameter NUM_OUTPUT_DATA  = 8, // must be power of 2.
	parameter NUM_INPUT_DATA = 8   
)(
    // timeing signals
    clk,
	rst,
	
    // data signals
	i_valid,        // valid input data signal
	i_data_bus,     // input data bus coming into distribute switch
	
	o_valid,        // output valid
    o_data_bus,     // output data 

	// control signals
	i_en,           // distribute switch enable
	i_cmd           // the input should be one-hot encoded command 
);
	//parameter
	localparam TOTAL_COMMMAND = NUM_INPUT_DATA*NUM_OUTPUT_DATA;
	
	localparam WIDTH_INPUT_DATA = NUM_INPUT_DATA*DATA_WIDTH;
	localparam WIDTH_OUTPUT_DATA = NUM_OUTPUT_DATA*DATA_WIDTH;

	localparam NUM_IN_WIRE_PIPELINE = 5;
    localparam NUM_OUT_WIRE_PIPELINE = 3;
	
    // interface
	input                                        clk;
	input                                        rst;
	
	input  [NUM_INPUT_DATA-1:0]                  i_valid;             
	input  [WIDTH_INPUT_DATA-1:0]                i_data_bus;
	
	output [NUM_OUTPUT_DATA-1:0]                 o_valid;             
	output [WIDTH_OUTPUT_DATA-1:0]               o_data_bus; // {o_data_a, o_data_b}

	input                                        i_en;
	input  [TOTAL_COMMMAND-1:0]                  i_cmd;

    reg    [NUM_OUTPUT_DATA-1:0]                 o_valid_reg;
    reg    [WIDTH_OUTPUT_DATA-1:0]               o_data_bus_reg;

    genvar i,j;
    generate
        // input pipeline
        for(i=0; i< NUM_IN_WIRE_PIPELINE; i=i+1)
        begin:input_shift_def
            reg  [NUM_INPUT_DATA-1:0]            i_valid_shift;
            reg  [WIDTH_INPUT_DATA-1:0]          i_data_shift;
            reg  [TOTAL_COMMMAND-1:0]            i_cmd_shift;
            reg                                  i_en_shift;
            reg                                  rst_shift;
        end 

        always @(posedge clk) 
        begin:shift_first
            input_shift_def[0].i_valid_shift <= i_valid;
            input_shift_def[0].i_data_shift <= i_data_bus;
            input_shift_def[0].i_cmd_shift <= i_cmd;
            input_shift_def[0].i_en_shift <= i_en;
            input_shift_def[0].rst_shift <= rst;
        end

        for(i=1; i< NUM_IN_WIRE_PIPELINE; i=i+1)
        begin:input_shift
            always @(posedge clk) 
            begin
                input_shift_def[i].i_valid_shift <= input_shift_def[i-1].i_valid_shift;
                input_shift_def[i].i_data_shift <= input_shift_def[i-1].i_data_shift;
                input_shift_def[i].i_cmd_shift <= input_shift_def[i-1].i_cmd_shift;
                input_shift_def[i].i_en_shift <= input_shift_def[i-1].i_en_shift;
                input_shift_def[i].rst_shift <= input_shift_def[i-1].rst_shift;
            end
        end

        // output pipeline  
        for(j=0; j< NUM_OUT_WIRE_PIPELINE; j=j+1)
        begin:output_shift_def
            reg    [NUM_OUTPUT_DATA-1:0]                 o_valid_reg;
            reg    [WIDTH_OUTPUT_DATA-1:0]               o_data_bus_reg;
        end

        for(i=0; i<NUM_OUTPUT_DATA; i=i+1)
        begin: o_data_output_mux
            // data mux
            wire   [NUM_INPUT_DATA-1:0]           inner_cmd_wire;
            assign inner_cmd_wire = {input_shift_def[NUM_IN_WIRE_PIPELINE-1].i_cmd_shift[7*NUM_OUTPUT_DATA+i], input_shift_def[NUM_IN_WIRE_PIPELINE-1].i_cmd_shift[6*NUM_OUTPUT_DATA+i], input_shift_def[NUM_IN_WIRE_PIPELINE-1].i_cmd_shift[5*NUM_OUTPUT_DATA+i], input_shift_def[NUM_IN_WIRE_PIPELINE-1].i_cmd_shift[4*NUM_OUTPUT_DATA+i], input_shift_def[NUM_IN_WIRE_PIPELINE-1].i_cmd_shift[3*NUM_OUTPUT_DATA+i], input_shift_def[NUM_IN_WIRE_PIPELINE-1].i_cmd_shift[2*NUM_OUTPUT_DATA+i], input_shift_def[NUM_IN_WIRE_PIPELINE-1].i_cmd_shift[1*NUM_OUTPUT_DATA+i], input_shift_def[NUM_IN_WIRE_PIPELINE-1].i_cmd_shift[0*NUM_OUTPUT_DATA+i]};
            always@(posedge clk)
            begin:two_8_8_xbar_o_data
                if(i_en && (~rst))
                begin
                    case(inner_cmd_wire)
                        8'b00000001:
                        begin
                            output_shift_def[0].o_data_bus_reg[i*DATA_WIDTH+:DATA_WIDTH] <= (input_shift_def[NUM_IN_WIRE_PIPELINE-1].i_valid_shift[0])?input_shift_def[NUM_IN_WIRE_PIPELINE-1].i_data_shift[0*DATA_WIDTH+:DATA_WIDTH]:{DATA_WIDTH{1'b0}};
                        end
                        8'b00000010:
                        begin
                            output_shift_def[0].o_data_bus_reg[i*DATA_WIDTH+:DATA_WIDTH] <= (input_shift_def[NUM_IN_WIRE_PIPELINE-1].i_valid_shift[1])?input_shift_def[NUM_IN_WIRE_PIPELINE-1].i_data_shift[1*DATA_WIDTH+:DATA_WIDTH]:{DATA_WIDTH{1'b0}};
                        end
                        8'b00000100:
                        begin
                            output_shift_def[0].o_data_bus_reg[i*DATA_WIDTH+:DATA_WIDTH] <= (input_shift_def[NUM_IN_WIRE_PIPELINE-1].i_valid_shift[2])?input_shift_def[NUM_IN_WIRE_PIPELINE-1].i_data_shift[2*DATA_WIDTH+:DATA_WIDTH]:{DATA_WIDTH{1'b0}};
                        end
                        8'b00001000:
                        begin
                            output_shift_def[0].o_data_bus_reg[i*DATA_WIDTH+:DATA_WIDTH] <= (input_shift_def[NUM_IN_WIRE_PIPELINE-1].i_valid_shift[3])?input_shift_def[NUM_IN_WIRE_PIPELINE-1].i_data_shift[3*DATA_WIDTH+:DATA_WIDTH]:{DATA_WIDTH{1'b0}};
                        end
                        8'b00010000:
                        begin
                            output_shift_def[0].o_data_bus_reg[i*DATA_WIDTH+:DATA_WIDTH] <= (input_shift_def[NUM_IN_WIRE_PIPELINE-1].i_valid_shift[4])?input_shift_def[NUM_IN_WIRE_PIPELINE-1].i_data_shift[4*DATA_WIDTH+:DATA_WIDTH]:{DATA_WIDTH{1'b0}};
                        end
                        8'b00100000:
                        begin
                            output_shift_def[0].o_data_bus_reg[i*DATA_WIDTH+:DATA_WIDTH] <= (input_shift_def[NUM_IN_WIRE_PIPELINE-1].i_valid_shift[5])?input_shift_def[NUM_IN_WIRE_PIPELINE-1].i_data_shift[5*DATA_WIDTH+:DATA_WIDTH]:{DATA_WIDTH{1'b0}};
                        end
                        8'b01000000:
                        begin
                            output_shift_def[0].o_data_bus_reg[i*DATA_WIDTH+:DATA_WIDTH] <= (input_shift_def[NUM_IN_WIRE_PIPELINE-1].i_valid_shift[6])?input_shift_def[NUM_IN_WIRE_PIPELINE-1].i_data_shift[6*DATA_WIDTH+:DATA_WIDTH]:{DATA_WIDTH{1'b0}};
                        end
                        8'b10000000:
                        begin
                            output_shift_def[0].o_data_bus_reg[i*DATA_WIDTH+:DATA_WIDTH] <= (input_shift_def[NUM_IN_WIRE_PIPELINE-1].i_valid_shift[7])?input_shift_def[NUM_IN_WIRE_PIPELINE-1].i_data_shift[7*DATA_WIDTH+:DATA_WIDTH]:{DATA_WIDTH{1'b0}};
                        end
                        default:
                        begin
                            output_shift_def[0].o_data_bus_reg[i*DATA_WIDTH+:DATA_WIDTH] <= {WIDTH_OUTPUT_DATA{1'b0}};
                        end
                    endcase
                end
                else
                begin
                    output_shift_def[0].o_data_bus_reg[i*DATA_WIDTH+:DATA_WIDTH] <= {WIDTH_OUTPUT_DATA{1'b0}};
                end
            end

            // valid mux
            wire [NUM_INPUT_DATA-1:0] inner_cmd_wire_valid;
            assign inner_cmd_wire_valid = {input_shift_def[NUM_IN_WIRE_PIPELINE-1].i_cmd_shift[7*NUM_OUTPUT_DATA+i], input_shift_def[NUM_IN_WIRE_PIPELINE-1].i_cmd_shift[6*NUM_OUTPUT_DATA+i], input_shift_def[NUM_IN_WIRE_PIPELINE-1].i_cmd_shift[5*NUM_OUTPUT_DATA+i], input_shift_def[NUM_IN_WIRE_PIPELINE-1].i_cmd_shift[4*NUM_OUTPUT_DATA+i], input_shift_def[NUM_IN_WIRE_PIPELINE-1].i_cmd_shift[3*NUM_OUTPUT_DATA+i], input_shift_def[NUM_IN_WIRE_PIPELINE-1].i_cmd_shift[2*NUM_OUTPUT_DATA+i], input_shift_def[NUM_IN_WIRE_PIPELINE-1].i_cmd_shift[1*NUM_OUTPUT_DATA+i], input_shift_def[NUM_IN_WIRE_PIPELINE-1].i_cmd_shift[0*NUM_OUTPUT_DATA+i]};
            always@(posedge clk)
            begin:two_8_8_xbar_o_valid
                if(i_en && (~rst))
                begin
                    case(inner_cmd_wire_valid)
                        8'b00000001:
                        begin
                            output_shift_def[0].o_valid_reg[i] <= (input_shift_def[NUM_IN_WIRE_PIPELINE-1].i_valid_shift[0])?1'b1:1'b0;
                        end
                        8'b00000010:
                        begin
                            output_shift_def[0].o_valid_reg[i] <= (input_shift_def[NUM_IN_WIRE_PIPELINE-1].i_valid_shift[1])?1'b1:1'b0;
                        end
                        8'b00000100:
                        begin
                            output_shift_def[0].o_valid_reg[i] <= (input_shift_def[NUM_IN_WIRE_PIPELINE-1].i_valid_shift[2])?1'b1:1'b0;
                        end
                        8'b00001000:
                        begin
                            output_shift_def[0].o_valid_reg[i] <= (input_shift_def[NUM_IN_WIRE_PIPELINE-1].i_valid_shift[3])?1'b1:1'b0;
                        end
                        8'b00010000:
                        begin
                            output_shift_def[0].o_valid_reg[i] <= (input_shift_def[NUM_IN_WIRE_PIPELINE-1].i_valid_shift[4])?1'b1:1'b0;
                        end
                        8'b00100000:
                        begin
                            output_shift_def[0].o_valid_reg[i] <= (input_shift_def[NUM_IN_WIRE_PIPELINE-1].i_valid_shift[5])?1'b1:1'b0;
                        end
                        8'b01000000:
                        begin
                            output_shift_def[0].o_valid_reg[i] <= (input_shift_def[NUM_IN_WIRE_PIPELINE-1].i_valid_shift[6])?1'b1:1'b0;
                        end
                        8'b10000000:
                        begin
                            output_shift_def[0].o_valid_reg[i] <= (input_shift_def[NUM_IN_WIRE_PIPELINE-1].i_valid_shift[7])?1'b1:1'b0;
                        end
                        default:
                        begin
                            output_shift_def[0].o_valid_reg[i] <= 1'b0;
                        end
                    endcase
                end
                else
                begin
                    output_shift_def[0].o_valid_reg[i] <= 1'b0;
                end
            end
        end

        for(j=1; j< NUM_OUT_WIRE_PIPELINE; j=j+1)
        begin:shift_output
            always @(posedge clk) 
            begin
                output_shift_def[j].o_valid_reg <= output_shift_def[j-1].o_valid_reg;
                output_shift_def[j].o_data_bus_reg <=  output_shift_def[j-1].o_data_bus_reg;
            end
        end 

        always @(posedge clk) 
        begin:shift_output_last
            o_valid_reg <= output_shift_def[NUM_OUT_WIRE_PIPELINE-1].o_valid_reg;
            o_data_bus_reg <= output_shift_def[NUM_OUT_WIRE_PIPELINE-1].o_data_bus_reg;
        end

    endgenerate

    assign o_data_bus = o_data_bus_reg;
    assign o_valid = o_valid_reg;

endmodule
`endif



`ifdef In16_Out8
module crossbar_one_hot_seq#(
	parameter DATA_WIDTH = 32,      // could be arbitrary number
	parameter NUM_OUTPUT_DATA  = 8, // must be power of 2.
	parameter NUM_INPUT_DATA = 16   
)(
    // timeing signals
    clk,
	rst,
	
    // data signals
	i_valid,        // valid input data signal
	i_data_bus,     // input data bus coming into distribute switch
	
	o_valid,        // output valid
    o_data_bus,     // output data 

	// control signals
	i_en,           // distribute switch enable
	i_cmd           // the input should be one-hot encoded command 
);
	//parameter
	localparam TOTAL_COMMMAND = NUM_INPUT_DATA*NUM_OUTPUT_DATA;
	
	localparam WIDTH_INPUT_DATA = NUM_INPUT_DATA*DATA_WIDTH;
	localparam WIDTH_OUTPUT_DATA = NUM_OUTPUT_DATA*DATA_WIDTH;
	
    // interface
	input                                        clk;
	input                                        rst;
	
	input  [NUM_INPUT_DATA-1:0]                  i_valid;             
	input  [WIDTH_INPUT_DATA-1:0]                i_data_bus;
	
	output [NUM_OUTPUT_DATA-1:0]                 o_valid;             
	output [WIDTH_OUTPUT_DATA-1:0]               o_data_bus; // {o_data_a, o_data_b}

	input                                        i_en;
	input  [TOTAL_COMMMAND-1:0]                  i_cmd;

    reg    [NUM_OUTPUT_DATA-1:0]                 o_valid_reg;
    reg    [WIDTH_OUTPUT_DATA-1:0]               o_data_bus_reg;

    genvar i,j;
    generate
        for(i=0; i<NUM_OUTPUT_DATA; i=i+1)
        begin: o_data_output_mux
            wire [NUM_INPUT_DATA-1:0] inner_cmd_wire;
            assign inner_cmd_wire = {i_cmd[15*NUM_OUTPUT_DATA+i],i_cmd[14*NUM_OUTPUT_DATA+i],i_cmd[13*NUM_OUTPUT_DATA+i],i_cmd[12*NUM_OUTPUT_DATA+i],i_cmd[11*NUM_OUTPUT_DATA+i],i_cmd[10*NUM_OUTPUT_DATA+i],i_cmd[9*NUM_OUTPUT_DATA+i],i_cmd[8*NUM_OUTPUT_DATA+i],i_cmd[7*NUM_OUTPUT_DATA+i],i_cmd[6*NUM_OUTPUT_DATA+i],i_cmd[5*NUM_OUTPUT_DATA+i],i_cmd[4*NUM_OUTPUT_DATA+i],i_cmd[3*NUM_OUTPUT_DATA+i],i_cmd[2*NUM_OUTPUT_DATA+i],i_cmd[1*NUM_OUTPUT_DATA+i],i_cmd[0*NUM_OUTPUT_DATA+i]};
            always@(posedge clk)
            begin
               if(i_en && (~rst))
                begin
                    case(inner_cmd_wire)
                        16'b0000000000000001:
                        begin
                            o_data_bus_reg[i*DATA_WIDTH+:DATA_WIDTH] <= (i_valid[0])?i_data_bus[0*DATA_WIDTH+:DATA_WIDTH]:{DATA_WIDTH{1'b0}};
                            o_valid_reg[i] <= (i_valid[0])?1'b1:1'b0;
                        end
                        16'b0000000000000010:
                        begin
                            o_data_bus_reg[i*DATA_WIDTH+:DATA_WIDTH] <= (i_valid[1])?i_data_bus[1*DATA_WIDTH+:DATA_WIDTH]:{DATA_WIDTH{1'b0}};
                            o_valid_reg[i] <= (i_valid[1])?1'b1:1'b0;
                        end
                        16'b0000000000000100:
                        begin
                            o_data_bus_reg[i*DATA_WIDTH+:DATA_WIDTH] <= (i_valid[2])?i_data_bus[2*DATA_WIDTH+:DATA_WIDTH]:{DATA_WIDTH{1'b0}};
                            o_valid_reg[i] <= (i_valid[2])?1'b1:1'b0;
                        end
                        16'b0000000000001000:
                        begin
                            o_data_bus_reg[i*DATA_WIDTH+:DATA_WIDTH] <= (i_valid[3])?i_data_bus[3*DATA_WIDTH+:DATA_WIDTH]:{DATA_WIDTH{1'b0}};
                            o_valid_reg[i] <= (i_valid[3])?1'b1:1'b0;
                        end
                        16'b0000000000010000:
                        begin
                            o_data_bus_reg[i*DATA_WIDTH+:DATA_WIDTH] <= (i_valid[4])?i_data_bus[4*DATA_WIDTH+:DATA_WIDTH]:{DATA_WIDTH{1'b0}};
                            o_valid_reg[i] <= (i_valid[4])?1'b1:1'b0;
                        end
                        16'b0000000000100000:
                        begin
                            o_data_bus_reg[i*DATA_WIDTH+:DATA_WIDTH] <= (i_valid[5])?i_data_bus[5*DATA_WIDTH+:DATA_WIDTH]:{DATA_WIDTH{1'b0}};
                            o_valid_reg[i] <= (i_valid[5])?1'b1:1'b0;
                        end
                        16'b0000000001000000:
                        begin
                            o_data_bus_reg[i*DATA_WIDTH+:DATA_WIDTH] <= (i_valid[6])?i_data_bus[6*DATA_WIDTH+:DATA_WIDTH]:{DATA_WIDTH{1'b0}};
                            o_valid_reg[i] <= (i_valid[6])?1'b1:1'b0;
                        end
                        16'b0000000010000000:
                        begin
                            o_data_bus_reg[i*DATA_WIDTH+:DATA_WIDTH] <= (i_valid[7])?i_data_bus[7*DATA_WIDTH+:DATA_WIDTH]:{DATA_WIDTH{1'b0}};
                            o_valid_reg[i] <= (i_valid[7])?1'b1:1'b0;
                        end
                        16'b0000000100000000:
                        begin
                            o_data_bus_reg[i*DATA_WIDTH+:DATA_WIDTH] <= (i_valid[8])?i_data_bus[8*DATA_WIDTH+:DATA_WIDTH]:{DATA_WIDTH{1'b0}};
                            o_valid_reg[i] <= (i_valid[8])?1'b1:1'b0;
                        end
                        16'b0000001000000000:
                        begin
                            o_data_bus_reg[i*DATA_WIDTH+:DATA_WIDTH] <= (i_valid[9])?i_data_bus[9*DATA_WIDTH+:DATA_WIDTH]:{DATA_WIDTH{1'b0}};
                            o_valid_reg[i] <= (i_valid[9])?1'b1:1'b0;
                        end
                        16'b0000010000000000:
                        begin
                            o_data_bus_reg[i*DATA_WIDTH+:DATA_WIDTH] <= (i_valid[10])?i_data_bus[10*DATA_WIDTH+:DATA_WIDTH]:{DATA_WIDTH{1'b0}};
                            o_valid_reg[i] <= (i_valid[10])?1'b1:1'b0;
                        end
                        16'b0000100000000000:
                        begin
                            o_data_bus_reg[i*DATA_WIDTH+:DATA_WIDTH] <= (i_valid[11])?i_data_bus[11*DATA_WIDTH+:DATA_WIDTH]:{DATA_WIDTH{1'b0}};
                            o_valid_reg[i] <= (i_valid[11])?1'b1:1'b0;
                        end
                        16'b0001000000000000:
                        begin
                            o_data_bus_reg[i*DATA_WIDTH+:DATA_WIDTH] <= (i_valid[12])?i_data_bus[12*DATA_WIDTH+:DATA_WIDTH]:{DATA_WIDTH{1'b0}};
                            o_valid_reg[i] <= (i_valid[12])?1'b1:1'b0;
                        end
                        16'b0010000000000000:
                        begin
                            o_data_bus_reg[i*DATA_WIDTH+:DATA_WIDTH] <= (i_valid[13])?i_data_bus[13*DATA_WIDTH+:DATA_WIDTH]:{DATA_WIDTH{1'b0}};
                            o_valid_reg[i] <= (i_valid[13])?1'b1:1'b0;
                        end
                        16'b0100000000000000:
                        begin
                            o_data_bus_reg[i*DATA_WIDTH+:DATA_WIDTH] <= (i_valid[14])?i_data_bus[14*DATA_WIDTH+:DATA_WIDTH]:{DATA_WIDTH{1'b0}};
                            o_valid_reg[i] <= (i_valid[14])?1'b1:1'b0;
                        end
                        16'b1000000000000000:
                        begin
                            o_data_bus_reg[i*DATA_WIDTH+:DATA_WIDTH] <= (i_valid[15])?i_data_bus[15*DATA_WIDTH+:DATA_WIDTH]:{DATA_WIDTH{1'b0}};
                            o_valid_reg[i] <= (i_valid[15])?1'b1:1'b0;
                        end
                        default:
                        begin
                            o_data_bus_reg[i*DATA_WIDTH+:DATA_WIDTH] <= {WIDTH_OUTPUT_DATA{1'b0}};
                            o_valid_reg[i] <= 1'b0;
                        end
                    endcase
                end
                else
                begin
                    o_data_bus_reg[i*DATA_WIDTH+:DATA_WIDTH] <= {WIDTH_OUTPUT_DATA{1'b0}};
                    o_valid_reg[i] <= 1'b0;
                end
            end
        end
    endgenerate

    assign o_data_bus = o_data_bus_reg;
    assign o_valid = o_valid_reg;

endmodule
`endif


`ifdef In16_Out8_separate_8_8
module crossbar_one_hot_seq#(
	parameter DATA_WIDTH = 32,      // could be arbitrary number
	parameter NUM_OUTPUT_DATA  = 8, // must be power of 2.
	parameter NUM_INPUT_DATA = 16   
)(
    // timeing signals
    clk,
	rst,
	
    // data signals
	i_valid,        // valid input data signal
	i_data_bus,     // input data bus coming into distribute switch
	
	o_valid,        // output valid
    o_data_bus,     // output data 

	// control signals
	i_en,           // distribute switch enable
	i_cmd           // the input should be one-hot encoded command 
);
	//parameter
	localparam TOTAL_COMMMAND = NUM_INPUT_DATA*NUM_OUTPUT_DATA;
	
	localparam WIDTH_INPUT_DATA = NUM_INPUT_DATA*DATA_WIDTH;
	localparam WIDTH_OUTPUT_DATA = NUM_OUTPUT_DATA*DATA_WIDTH;
	
    
    localparam NUM_SEPARATE_FIRST_STAGE = 2;
	
    // interface
	input                                        clk;
	input                                        rst;
	
	input  [NUM_INPUT_DATA-1:0]                  i_valid;             
	input  [WIDTH_INPUT_DATA-1:0]                i_data_bus;
	
	output [NUM_OUTPUT_DATA-1:0]                 o_valid;             
	output [WIDTH_OUTPUT_DATA-1:0]               o_data_bus; // {o_data_a, o_data_b}

	input                                        i_en;
	input  [TOTAL_COMMMAND-1:0]                  i_cmd;

    reg    [NUM_OUTPUT_DATA-1:0]                 o_valid_reg;
    reg    [WIDTH_OUTPUT_DATA-1:0]               o_data_bus_reg;

    genvar i,j,k;
    generate
        // define output reg of the two 8:8 mux.
        for(k=0; k<NUM_SEPARATE_FIRST_STAGE; k=k+1)
        begin:first_stage_output_def
            reg    [NUM_OUTPUT_DATA-1:0]                 o_valid_reg;
            reg    [WIDTH_OUTPUT_DATA-1:0]               o_data_bus_reg;
        end

        // two 8-to-8 xbar
        for(k=0; k<2;k=k+1)
        begin
            for(i=0; i<NUM_OUTPUT_DATA; i=i+1)
            begin: o_data_output_mux
                
                // data mux
                wire [NUM_INPUT_DATA-1:0] inner_cmd_wire;
                assign inner_cmd_wire = {i_cmd[(7+k*NUM_OUTPUT_DATA)*NUM_OUTPUT_DATA+i],i_cmd[(6+k*NUM_OUTPUT_DATA)*NUM_OUTPUT_DATA+i],i_cmd[(5+k*NUM_OUTPUT_DATA)*NUM_OUTPUT_DATA+i],i_cmd[(4+k*NUM_OUTPUT_DATA)*NUM_OUTPUT_DATA+i],i_cmd[(3+k*NUM_OUTPUT_DATA)*NUM_OUTPUT_DATA+i],i_cmd[(2+k*NUM_OUTPUT_DATA)*NUM_OUTPUT_DATA+i],i_cmd[(1+k*NUM_OUTPUT_DATA)*NUM_OUTPUT_DATA+i],i_cmd[(0+k*NUM_OUTPUT_DATA)*NUM_OUTPUT_DATA+i]};
                always@(posedge clk)
                begin
                if(i_en && (~rst))
                    begin
                        case(inner_cmd_wire)
                            8'b00000001:
                            begin
                                first_stage_output_def[k].o_data_bus_reg[i*DATA_WIDTH+:DATA_WIDTH] <= (i_valid[0])?i_data_bus[(0+k*NUM_OUTPUT_DATA)*DATA_WIDTH+:DATA_WIDTH]:{DATA_WIDTH{1'b0}};
                            end
                            8'b00000010:
                            begin
                                first_stage_output_def[k].o_data_bus_reg[i*DATA_WIDTH+:DATA_WIDTH] <= (i_valid[1])?i_data_bus[(1+k*NUM_OUTPUT_DATA)*DATA_WIDTH+:DATA_WIDTH]:{DATA_WIDTH{1'b0}};
                            end
                            8'b00000100:
                            begin
                                first_stage_output_def[k].o_data_bus_reg[i*DATA_WIDTH+:DATA_WIDTH] <= (i_valid[2])?i_data_bus[(2+k*NUM_OUTPUT_DATA)*DATA_WIDTH+:DATA_WIDTH]:{DATA_WIDTH{1'b0}};
                            end
                            8'b00001000:
                            begin
                                first_stage_output_def[k].o_data_bus_reg[i*DATA_WIDTH+:DATA_WIDTH] <= (i_valid[3])?i_data_bus[(3+k*NUM_OUTPUT_DATA)*DATA_WIDTH+:DATA_WIDTH]:{DATA_WIDTH{1'b0}};
                            end
                            8'b00010000:
                            begin
                                first_stage_output_def[k].o_data_bus_reg[i*DATA_WIDTH+:DATA_WIDTH] <= (i_valid[4])?i_data_bus[(4+k*NUM_OUTPUT_DATA)*DATA_WIDTH+:DATA_WIDTH]:{DATA_WIDTH{1'b0}};
                            end
                            8'b00100000:
                            begin
                                first_stage_output_def[k].o_data_bus_reg[i*DATA_WIDTH+:DATA_WIDTH] <= (i_valid[5])?i_data_bus[(5+k*NUM_OUTPUT_DATA)*DATA_WIDTH+:DATA_WIDTH]:{DATA_WIDTH{1'b0}};
                            end
                            8'b01000000:
                            begin
                                first_stage_output_def[k].o_data_bus_reg[i*DATA_WIDTH+:DATA_WIDTH] <= (i_valid[6])?i_data_bus[(6+k*NUM_OUTPUT_DATA)*DATA_WIDTH+:DATA_WIDTH]:{DATA_WIDTH{1'b0}};
                            end
                            8'b10000000:
                            begin
                                first_stage_output_def[k].o_data_bus_reg[i*DATA_WIDTH+:DATA_WIDTH] <= (i_valid[7])?i_data_bus[(7+k*NUM_OUTPUT_DATA)*DATA_WIDTH+:DATA_WIDTH]:{DATA_WIDTH{1'b0}};
                            end
                            default:
                            begin
                                first_stage_output_def[k].o_data_bus_reg[i*DATA_WIDTH+:DATA_WIDTH] <= {WIDTH_OUTPUT_DATA{1'b0}};
                            end
                        endcase
                    end
                    else
                    begin
                        first_stage_output_def[k].o_data_bus_reg[i*DATA_WIDTH+:DATA_WIDTH] <= {WIDTH_OUTPUT_DATA{1'b0}};
                    end
                end

                // valid mux
                wire [NUM_INPUT_DATA-1:0] inner_cmd_wire_valid;
                assign inner_cmd_wire_valid = {i_cmd[(7+k*NUM_OUTPUT_DATA)*NUM_OUTPUT_DATA+i],i_cmd[(6+k*NUM_OUTPUT_DATA)*NUM_OUTPUT_DATA+i],i_cmd[(5+k*NUM_OUTPUT_DATA)*NUM_OUTPUT_DATA+i],i_cmd[(4+k*NUM_OUTPUT_DATA)*NUM_OUTPUT_DATA+i],i_cmd[(3+k*NUM_OUTPUT_DATA)*NUM_OUTPUT_DATA+i],i_cmd[(2+k*NUM_OUTPUT_DATA)*NUM_OUTPUT_DATA+i],i_cmd[(1+k*NUM_OUTPUT_DATA)*NUM_OUTPUT_DATA+i],i_cmd[(0+k*NUM_OUTPUT_DATA)*NUM_OUTPUT_DATA+i]};
                always@(posedge clk)
                begin
                    if(i_en && (~rst))
                    begin
                        case(inner_cmd_wire_valid)
                            8'b00000001:
                            begin
                                first_stage_output_def[k].o_valid_reg[i] <= (i_valid[0+k*NUM_OUTPUT_DATA])?1'b1:1'b0;
                            end
                            8'b00000010:
                            begin
                                first_stage_output_def[k].o_valid_reg[i] <= (i_valid[1+k*NUM_OUTPUT_DATA])?1'b1:1'b0;
                            end
                            8'b00000100:
                            begin
                                first_stage_output_def[k].o_valid_reg[i] <= (i_valid[2+k*NUM_OUTPUT_DATA])?1'b1:1'b0;
                            end
                            8'b00001000:
                            begin
                                first_stage_output_def[k].o_valid_reg[i] <= (i_valid[3+k*NUM_OUTPUT_DATA])?1'b1:1'b0;
                            end
                            8'b00010000:
                            begin
                                first_stage_output_def[k].o_valid_reg[i] <= (i_valid[4+k*NUM_OUTPUT_DATA])?1'b1:1'b0;
                            end
                            8'b00100000:
                            begin
                                first_stage_output_def[k].o_valid_reg[i] <= (i_valid[5+k*NUM_OUTPUT_DATA])?1'b1:1'b0;
                            end
                            8'b01000000:
                            begin
                                first_stage_output_def[k].o_valid_reg[i] <= (i_valid[6+k*NUM_OUTPUT_DATA])?1'b1:1'b0;
                            end
                            8'b10000000:
                            begin
                                first_stage_output_def[k].o_valid_reg[i] <= (i_valid[7+k*NUM_OUTPUT_DATA])?1'b1:1'b0;
                            end
                            default:
                            begin
                                first_stage_output_def[k].o_valid_reg[i] <= 1'b0;
                            end
                        endcase
                    end
                    else
                    begin
                        first_stage_output_def[k].o_valid_reg[i] <= 1'b0;
                    end
                end

            end
        end

        // second stage -- eight 2:1 mux.
        for(i=0; i<NUM_OUTPUT_DATA; i=i+1)
        begin
            wire    [NUM_SEPARATE_FIRST_STAGE-1:0]   inner_cmd_wire_second_stage_data;
            assign  inner_cmd_wire_second_stage_data = {first_stage_output_def[1].o_valid_reg[i], first_stage_output_def[0].o_valid_reg[i]};

            always @(posedge clk) 
            begin
                if(i_en && (~rst))
                begin
                    case(inner_cmd_wire_second_stage_data)
                        2'b01:
                        begin
                            o_data_bus_reg[i*DATA_WIDTH+:DATA_WIDTH] <= first_stage_output_def[0].o_data_bus_reg[i*DATA_WIDTH+:DATA_WIDTH];                 
                        end                        
                        2'b10:
                        begin
                            o_data_bus_reg[i*DATA_WIDTH+:DATA_WIDTH] <= first_stage_output_def[1].o_data_bus_reg[i*DATA_WIDTH+:DATA_WIDTH];                 
                        end
                        default:
                        begin
                            o_data_bus_reg[i*DATA_WIDTH+:DATA_WIDTH] <= {DATA_WIDTH{1'b0}};                 
                        end
                    endcase
                end
            end
        end
        
        // second stage -- eight 2:1 mux -- valid
        for(i=0; i<NUM_OUTPUT_DATA; i=i+1)
        begin
            wire    [NUM_SEPARATE_FIRST_STAGE-1:0]   inner_cmd_wire_second_stage_valid;
            assign  inner_cmd_wire_second_stage_valid = {first_stage_output_def[1].o_valid_reg[i], first_stage_output_def[0].o_valid_reg[i]};

            always @(posedge clk) 
            begin
                if(i_en && (~rst))
                begin
                    case(inner_cmd_wire_second_stage_valid)
                        2'b01:
                        begin
                            o_valid_reg[i] <= first_stage_output_def[0].o_valid_reg[i];                 
                        end                        
                        2'b10:
                        begin
                            o_valid_reg[i] <= first_stage_output_def[1].o_valid_reg[i];                 
                        end
                        default:
                        begin
                            o_valid_reg[i] <= {DATA_WIDTH{1'b0}};                 
                        end
                    endcase
                end
            end
        end

    endgenerate

    assign o_data_bus = o_data_bus_reg;
    assign o_valid = o_valid_reg;

endmodule
`endif 


`ifdef In16_Out8_8_8_wire_tree_pipeline
module crossbar_one_hot_seq#(
	parameter DATA_WIDTH = 32,      // could be arbitrary number
	parameter NUM_OUTPUT_DATA  = 8, // must be power of 2.
	parameter NUM_INPUT_DATA = 16   
)(
    // timeing signals
    clk,
	rst,
	
    // data signals
	i_valid,        // valid input data signal
	i_data_bus,     // input data bus coming into distribute switch
	
	o_valid,        // output valid
    o_data_bus,     // output data 

	// control signals
	i_en,           // distribute switch enable
	i_cmd           // the input should be one-hot encoded command 
);
	//parameter
	localparam TOTAL_COMMMAND = NUM_INPUT_DATA*NUM_OUTPUT_DATA;
	
	localparam WIDTH_INPUT_DATA = NUM_INPUT_DATA*DATA_WIDTH;
	localparam WIDTH_OUTPUT_DATA = NUM_OUTPUT_DATA*DATA_WIDTH;
	
    
    localparam NUM_SEPARATE_FIRST_STAGE = 2;
	
    // interface
	input                                        clk;
	input                                        rst;
	
	input  [NUM_INPUT_DATA-1:0]                  i_valid;             
	input  [WIDTH_INPUT_DATA-1:0]                i_data_bus;
	
	output [NUM_OUTPUT_DATA-1:0]                 o_valid;             
	output [WIDTH_OUTPUT_DATA-1:0]               o_data_bus; // {o_data_a, o_data_b}

	input                                        i_en;
	input  [TOTAL_COMMMAND-1:0]                  i_cmd;

    reg    [NUM_OUTPUT_DATA-1:0]                 o_valid_reg;
    reg    [WIDTH_OUTPUT_DATA-1:0]               o_data_bus_reg;

    genvar i,j,k;
    generate
        // define output reg of the two 8:8 mux.
        for(k=0; k<NUM_SEPARATE_FIRST_STAGE; k=k+1)
        begin:first_stage_output_def
            // reg    [NUM_OUTPUT_DATA-1:0]                 o_valid_reg;
            wire   [NUM_OUTPUT_DATA-1:0]                 o_valid_wire;
            // reg    [WIDTH_OUTPUT_DATA-1:0]               o_data_bus_reg;
            wire   [WIDTH_OUTPUT_DATA-1:0]               o_data_bus_wire;
        end

        // two 8-to-8 xbar
        for(k=0; k<2;k=k+1)
        begin:xbar_8_8
            localparam  NUM_HALF_INPUT_DATA = NUM_INPUT_DATA>>1;
            localparam  NUM_HALF_COMMAND = TOTAL_COMMMAND>>1;

            crossbar_8_8_seq#(
                .DATA_WIDTH(DATA_WIDTH),      // could be arbitrary number
                .NUM_OUTPUT_DATA(NUM_OUTPUT_DATA), // must be power of 2.
                .NUM_INPUT_DATA(NUM_INPUT_DATA)   
            ) xba8_8(
                .clk(clk),
                .rst(rst),
                .i_valid(i_valid[k*NUM_HALF_INPUT_DATA+:NUM_HALF_INPUT_DATA]),            // valid input data signal
                .i_data_bus(i_data_bus[k*NUM_HALF_INPUT_DATA*DATA_WIDTH+:NUM_HALF_INPUT_DATA*DATA_WIDTH]),     // input data bus coming into distribute switch
                .o_valid(first_stage_output_def[k].o_valid_wire),                         // output valid
                .o_data_bus(first_stage_output_def[k].o_data_bus_wire),                   // output data 
                .i_en(i_en),                                                              // distribute switch enable
                .i_cmd(i_cmd[k*NUM_HALF_COMMAND+:NUM_HALF_COMMAND])                       // the input should be one-hot encoded command 
            );
        end

        // second stage -- eight 2:1 mux.
        for(i=0; i<NUM_OUTPUT_DATA; i=i+1)
        begin:arbiter_2_1_mux_data
            wire    [NUM_SEPARATE_FIRST_STAGE-1:0]   inner_cmd_wire_second_stage_data;
            assign  inner_cmd_wire_second_stage_data = {first_stage_output_def[1].o_valid_wire[i], first_stage_output_def[0].o_valid_wire[i]};

            always @(posedge clk) 
            begin
                if(i_en && (~rst))
                begin
                    case(inner_cmd_wire_second_stage_data)
                        2'b01:
                        begin
                            o_data_bus_reg[i*DATA_WIDTH+:DATA_WIDTH] <= first_stage_output_def[0].o_data_bus_wire[i*DATA_WIDTH+:DATA_WIDTH];                 
                        end                        
                        2'b10:
                        begin
                            o_data_bus_reg[i*DATA_WIDTH+:DATA_WIDTH] <= first_stage_output_def[1].o_data_bus_wire[i*DATA_WIDTH+:DATA_WIDTH];                 
                        end
                        default:
                        begin
                            o_data_bus_reg[i*DATA_WIDTH+:DATA_WIDTH] <= {DATA_WIDTH{1'b0}};                 
                        end
                    endcase
                end
            end
        end
        
        // second stage -- eight 2:1 mux -- valid
        for(i=0; i<NUM_OUTPUT_DATA; i=i+1)
        begin:arbiter_2_1_mux_valid
            wire    [NUM_SEPARATE_FIRST_STAGE-1:0]   inner_cmd_wire_second_stage_valid;
            assign  inner_cmd_wire_second_stage_valid = {first_stage_output_def[1].o_valid_wire[i], first_stage_output_def[0].o_valid_wire[i]};

            always @(posedge clk) 
            begin
                if(i_en && (~rst))
                begin
                    case(inner_cmd_wire_second_stage_valid)
                        2'b01:
                        begin
                            o_valid_reg[i] <= first_stage_output_def[0].o_valid_wire[i];                 
                        end                        
                        2'b10:
                        begin
                            o_valid_reg[i] <= first_stage_output_def[1].o_valid_wire[i];                 
                        end
                        default:
                        begin
                            o_valid_reg[i] <= {DATA_WIDTH{1'b0}};                 
                        end
                    endcase
                end
            end
        end

    endgenerate

    assign o_data_bus = o_data_bus_reg;
    assign o_valid = o_valid_reg;

endmodule

module crossbar_8_8_seq#(
	parameter DATA_WIDTH = 32,      // could be arbitrary number
	parameter NUM_OUTPUT_DATA  = 8, // must be power of 2.
	parameter NUM_INPUT_DATA = 8   
)(

    // timeing signals
    clk,
	rst,
	
    // data signals
	i_valid,        // valid input data signal
	i_data_bus,     // input data bus coming into distribute switch
	
	o_valid,        // output valid
    o_data_bus,     // output data 

	// control signals
	i_en,           // distribute switch enable
	i_cmd           // the input should be one-hot encoded command 
);

	//parameter
	localparam TOTAL_COMMMAND = NUM_INPUT_DATA*NUM_OUTPUT_DATA;
	
	localparam WIDTH_INPUT_DATA = NUM_INPUT_DATA*DATA_WIDTH;
	localparam WIDTH_OUTPUT_DATA = NUM_OUTPUT_DATA*DATA_WIDTH;
	
    // interface
	input                                        clk;
	input                                        rst;
	
	input  [NUM_INPUT_DATA-1:0]                  i_valid;             
	input  [WIDTH_INPUT_DATA-1:0]                i_data_bus;
	
	output [NUM_OUTPUT_DATA-1:0]                 o_valid;             
	output [WIDTH_OUTPUT_DATA-1:0]               o_data_bus; // {o_data_a, o_data_b}

	input                                        i_en;
	input  [TOTAL_COMMMAND-1:0]                  i_cmd;

	reg    [NUM_OUTPUT_DATA-1:0]                 o_valid_reg;             
	reg    [WIDTH_OUTPUT_DATA-1:0]               o_data_bus_reg; // {o_data_a, o_data_b}

    wire   [NUM_OUTPUT_DATA-1:0]                 o_valid_wire;             
	wire   [WIDTH_OUTPUT_DATA-1:0]               o_data_bus_wire; // {o_data_a, o_data_b}


    // inner logic
    genvar i,j,k;
    generate
        // wire definition -- for input data & valid
        wire [NUM_OUTPUT_DATA*NUM_INPUT_DATA*DATA_WIDTH-1:0]  inner_data_wire;
        wire [NUM_OUTPUT_DATA*NUM_INPUT_DATA-1:0]             inner_valid_wire;

        // wire_tree_pipeline -- for input data & valid
        for(i=0; i<NUM_INPUT_DATA; i=i+1)
        begin: top_half
            wire_binary_tree_1_8_seq#(
                .DATA_WIDTH(DATA_WIDTH), 
                .NUM_OUTPUT_DATA(8),
                .NUM_INPUT_DATA(1)) 
            wire_pipeline(
                .clk(clk),
                .rst(rst),
                .i_valid(i_valid[i]),
                .i_data_bus(i_data_bus[i*DATA_WIDTH+:DATA_WIDTH]),
                .o_valid(inner_valid_wire[i*NUM_OUTPUT_DATA+:NUM_OUTPUT_DATA]),
                .o_data_bus(inner_data_wire[i*NUM_OUTPUT_DATA*DATA_WIDTH+:NUM_OUTPUT_DATA*DATA_WIDTH]),
                .i_en(i_en)
            );
        end

        // input command
        for(i=0; i<NUM_INPUT_DATA; i=i+1)
        begin:i_cmd_id  
            wire                                             inner_cmd_wire[0:NUM_INPUT_DATA-1];
            
            cmd_wire_binary_tree_1_8_seq #(
                .DATA_WIDTH(DATA_WIDTH), 
                .NUM_OUTPUT_DATA(8),
                .NUM_INPUT_DATA(1)) 
            cmd_pipeline(
                .clk(clk),
                .rst(rst),
                .i_cmd(i_cmd[i*NUM_OUTPUT_DATA+:NUM_OUTPUT_DATA]),
                .o_cmd_0(inner_cmd_wire[0]),
                .o_cmd_1(inner_cmd_wire[1]),
                .o_cmd_2(inner_cmd_wire[2]),
                .o_cmd_3(inner_cmd_wire[3]),
                .o_cmd_4(inner_cmd_wire[4]),
                .o_cmd_5(inner_cmd_wire[5]),
                .o_cmd_6(inner_cmd_wire[6]),
                .o_cmd_7(inner_cmd_wire[7]),
                .i_en(i_en)
            );
        end
        
        // eight 8:1 mux tree
        for(i=0; i<NUM_OUTPUT_DATA; i=i+1)
        begin: bottom_half
            wire [NUM_INPUT_DATA*DATA_WIDTH-1:0]  inner_data_i_mux_tree_wire;
            wire [NUM_INPUT_DATA-1:0]             inner_valid_i_mux_tree_wire;
            wire [NUM_OUTPUT_DATA-1:0]            inner_cmd_i_mux_tree_wire;

            assign inner_data_i_mux_tree_wire = {inner_data_wire[(7*NUM_OUTPUT_DATA+i)*DATA_WIDTH+:DATA_WIDTH], inner_data_wire[(6*NUM_OUTPUT_DATA+i)*DATA_WIDTH+:DATA_WIDTH], inner_data_wire[(5*NUM_OUTPUT_DATA+i)*DATA_WIDTH+:DATA_WIDTH], inner_data_wire[(4*NUM_OUTPUT_DATA+i)*DATA_WIDTH+:DATA_WIDTH], inner_data_wire[(3*NUM_OUTPUT_DATA+i)*DATA_WIDTH+:DATA_WIDTH], inner_data_wire[(2*NUM_OUTPUT_DATA+i)*DATA_WIDTH+:DATA_WIDTH], inner_data_wire[(1*NUM_OUTPUT_DATA+i)*DATA_WIDTH+:DATA_WIDTH], inner_data_wire[(0*NUM_OUTPUT_DATA+i)*DATA_WIDTH+:DATA_WIDTH]};
            assign inner_valid_i_mux_tree_wire = {inner_valid_wire[7*NUM_OUTPUT_DATA+i], inner_valid_wire[6*NUM_OUTPUT_DATA+i], inner_valid_wire[5*NUM_OUTPUT_DATA+i], inner_valid_wire[4*NUM_OUTPUT_DATA+i], inner_valid_wire[3*NUM_OUTPUT_DATA+i], inner_valid_wire[2*NUM_OUTPUT_DATA+i], inner_valid_wire[1*NUM_OUTPUT_DATA+i], inner_valid_wire[0*NUM_OUTPUT_DATA+i]};
            assign inner_cmd_i_mux_tree_wire = {i_cmd_id[7].inner_cmd_wire[i], i_cmd_id[6].inner_cmd_wire[i], i_cmd_id[5].inner_cmd_wire[i], i_cmd_id[4].inner_cmd_wire[i], i_cmd_id[3].inner_cmd_wire[i], i_cmd_id[2].inner_cmd_wire[i], i_cmd_id[1].inner_cmd_wire[i], i_cmd_id[0].inner_cmd_wire[i]};

            mux_tree_8_1_seq #(
                .NUM_INPUT_DATA(8), 
                .NUM_OUTPUT_DATA(1),
                .DATA_WIDTH(DATA_WIDTH)) 
            mux_tree(
                .clk(clk),
                .rst(rst),
                .i_valid(inner_valid_i_mux_tree_wire),
                .i_data_bus(inner_data_i_mux_tree_wire),
                .o_valid(o_valid_wire[i]),
                .o_data_bus(o_data_bus_wire[i*DATA_WIDTH+:DATA_WIDTH]),
                .i_en(i_en),
                .i_cmd(inner_cmd_i_mux_tree_wire)
            );
        end

    endgenerate

    always @(posedge clk) 
    begin
        o_data_bus_reg <= o_data_bus_wire;
        o_valid_reg <= o_valid_wire;
    end

    assign o_data_bus = o_data_bus_reg;
    assign o_valid = o_valid_reg;

endmodule


module wire_binary_tree_1_8_seq #(
	parameter DATA_WIDTH = 32,      // could be arbitrary number
	parameter NUM_OUTPUT_DATA  = 8, // must be power of 2.
	parameter NUM_INPUT_DATA = 1   
)(
    // timeing signals
    clk,
	rst,
	
    // data signals
	i_valid,        // valid input data signal
	i_data_bus,     // input data bus coming into distribute switch
	
	o_valid,        // output valid
    o_data_bus,     // output data 
	
    // control signals
	i_en            // distribute switch enable
);

	//parameter
	localparam TOTAL_COMMMAND = NUM_INPUT_DATA*NUM_OUTPUT_DATA;
	
	localparam WIDTH_INPUT_DATA = NUM_INPUT_DATA*DATA_WIDTH;
	localparam WIDTH_OUTPUT_DATA = NUM_OUTPUT_DATA*DATA_WIDTH;
	localparam NUM_LEVEL = $clog2(NUM_OUTPUT_DATA);

    // interface
	input                                        clk;
	input                                        rst;

	input  [NUM_INPUT_DATA-1:0]                  i_valid;             
	input  [WIDTH_INPUT_DATA-1:0]                i_data_bus;

	output [NUM_OUTPUT_DATA-1:0]                 o_valid;             
	output [WIDTH_OUTPUT_DATA-1:0]               o_data_bus; // {o_data_a, o_data_b}

	input                                        i_en;

    reg    [NUM_OUTPUT_DATA-1:0]                 o_valid_reg;
    reg    [WIDTH_OUTPUT_DATA-1:0]               o_data_bus_reg;


    genvar i,j;
    generate 
        for (i = 0; i< NUM_LEVEL; i=i+1)
        begin: wire_tree_level
            localparam NUM_SWITCH_SHIFT =  (4'b0001 << i);
            localparam WIDTH_DATA_LEVEL = NUM_SWITCH_SHIFT*DATA_WIDTH;

            // define the output wire for switches of level i
            reg      [WIDTH_DATA_LEVEL-1:0]         i_data_latch;
            reg      [NUM_SWITCH_SHIFT-1:0]         i_valid_latch;
        end

        always@(posedge clk)
        begin: first_level_assignment
            if(i_en && (~rst))
            begin
                wire_tree_level[0].i_data_latch <= i_data_bus;
                wire_tree_level[0].i_valid_latch <= i_valid;
            end
            else
            begin
                wire_tree_level[0].i_data_latch <= {DATA_WIDTH{1'b0}};
                wire_tree_level[0].i_valid_latch <= 1'b0;
            end
        end
        
        for (i = 0; i< NUM_LEVEL-1; i=i+1)
        begin: wire_tree_assignment
            localparam NUM_SWITCH_SHIFT =  (4'b0001 << i);
            localparam WIDTH_DATA_LEVEL = NUM_SWITCH_SHIFT*DATA_WIDTH; 
            
            for( j=0; j<NUM_SWITCH_SHIFT; j=j+1)
            begin: level_assignment
                always@(posedge clk)
                begin
                    if(i_en && (~rst))
                    begin
                        wire_tree_level[i+1].i_data_latch[(2*j)*DATA_WIDTH+:DATA_WIDTH] <= wire_tree_level[i].i_data_latch[j*DATA_WIDTH+:DATA_WIDTH];
                        wire_tree_level[i+1].i_valid_latch[2*j] <= wire_tree_level[i].i_valid_latch[j];

                        wire_tree_level[i+1].i_data_latch[(2*j+1)*DATA_WIDTH+:DATA_WIDTH] <= wire_tree_level[i].i_data_latch[j*DATA_WIDTH+:DATA_WIDTH];
                        wire_tree_level[i+1].i_valid_latch[2*j+1] <= wire_tree_level[i].i_valid_latch[j];
                    end
                    else
                    begin
                        wire_tree_level[i+1].i_data_latch[(2*j)*DATA_WIDTH+:DATA_WIDTH] <= {DATA_WIDTH{1'b0}};
                        wire_tree_level[i+1].i_valid_latch[2*j] <= 1'b0;

                        wire_tree_level[i+1].i_data_latch[(2*j+1)*DATA_WIDTH+:DATA_WIDTH] <= {DATA_WIDTH{1'b0}};
                        wire_tree_level[i+1].i_valid_latch[2*j+1] <= 1'b0;
                    end
                end
            end
        end

        for(i=0; i<(NUM_OUTPUT_DATA>>1); i=i+1)
        begin: assign_output_latch
            always @(posedge clk) begin
                if(i_en && (~rst))
                begin
                    o_data_bus_reg[2*i*DATA_WIDTH+:DATA_WIDTH] <= wire_tree_level[NUM_LEVEL-1].i_data_latch[i*DATA_WIDTH+:DATA_WIDTH];
                    o_valid_reg[2*i] <= wire_tree_level[NUM_LEVEL-1].i_valid_latch[i];

                    o_data_bus_reg[(2*i+1)*DATA_WIDTH+:DATA_WIDTH] <= wire_tree_level[NUM_LEVEL-1].i_data_latch[i*DATA_WIDTH+:DATA_WIDTH];
                    o_valid_reg[2*i+1] <= wire_tree_level[NUM_LEVEL-1].i_valid_latch[i];
                end
                else
                begin
                    o_data_bus_reg[2*i*DATA_WIDTH+:DATA_WIDTH] <= {DATA_WIDTH{1'b0}};
                    o_valid_reg[2*i] <= 1'b0;

                    o_data_bus_reg[(2*i+1)*DATA_WIDTH+:DATA_WIDTH] <= {DATA_WIDTH{1'b0}};
                    o_valid_reg[2*i+1] <= 1'b0;
                end
            end
        end
    endgenerate

    assign o_data_bus = o_data_bus_reg;
    assign o_valid = o_valid_reg;

endmodule


module cmd_wire_binary_tree_1_8_seq #(
	parameter DATA_WIDTH = 32,      // could be arbitrary number
	parameter NUM_OUTPUT_DATA  = 8, // must be power of 2.
	parameter NUM_INPUT_DATA = 1   
)(
    // timeing signals
    clk,
	rst,
	
    // data signals
	// i_valid,        // valid input data signal
	// i_data_bus,     // input data bus coming into distribute switch
	
	// o_valid,        // output valid
    // o_data_bus,     // output data 
    o_cmd_0,
    o_cmd_1,
    o_cmd_2,
    o_cmd_3,
    o_cmd_4,
    o_cmd_5,
    o_cmd_6,
    o_cmd_7,
	
    // control signals
	i_en,           // distribute switch enable
	i_cmd           // input command
);

	//parameter
	localparam TOTAL_COMMMAND = NUM_INPUT_DATA*NUM_OUTPUT_DATA;
	
	localparam WIDTH_INPUT_DATA = NUM_INPUT_DATA*DATA_WIDTH;
	localparam WIDTH_OUTPUT_DATA = NUM_OUTPUT_DATA*DATA_WIDTH;
	localparam NUM_LEVEL = $clog2(NUM_OUTPUT_DATA);

    // interface
	input                                        clk;
	input                                        rst;

	input  [TOTAL_COMMMAND-1:0]                  i_cmd;  

	output                                       o_cmd_0;             
	output                                       o_cmd_1;             
	output                                       o_cmd_2;             
	output                                       o_cmd_3;             
	output                                       o_cmd_4;             
	output                                       o_cmd_5;             
	output                                       o_cmd_6;             
	output                                       o_cmd_7;             

	input                                        i_en;

    reg                                          o_cmd_reg[0:NUM_OUTPUT_DATA-1] ;
    
    // 
    genvar i,j;
    generate
        for(i=0; i<NUM_LEVEL; i=i+1)
        begin:cmd_wire
            localparam WIDTH_PER_CMD_REG = NUM_OUTPUT_DATA>>i;
            localparam NUM_CMD_REG = 4'b0001<<i;

            reg  [WIDTH_PER_CMD_REG-1:0]         inner_cmd_reg[0:NUM_CMD_REG-1];
        end

        always@(posedge clk)
        begin
            if(i_en && (~rst))
            begin
                cmd_wire[0].inner_cmd_reg[0] <= i_cmd;
            end
            else
            begin
                cmd_wire[0].inner_cmd_reg[0] <= {NUM_OUTPUT_DATA{1'b0}};
            end
            // cmd_wire[0].inner_cmd_reg[1] <= i_cmd[1*cmd_wire[0].WIDTH_PER_CMD_REG+:cmd_wire[0].WIDTH_PER_CMD_REG];
        end

        // input command pipeline
        for(i=1; i<NUM_LEVEL; i=i+1)
        begin:command_pipeline_top_half
            localparam WIDTH_PER_CMD_REG = NUM_OUTPUT_DATA>>i;
            localparam NUM_CMD_REG = 4'b0001<<i;
            localparam NUM_CMD_REG_LAST_LEVEL = NUM_CMD_REG>>1;

            for(j=0; j<NUM_CMD_REG_LAST_LEVEL; j=j+1)
            begin: cmd_level_assignment
                always@(posedge clk)
                begin
                    cmd_wire[i].inner_cmd_reg[2*j] <= cmd_wire[i-1].inner_cmd_reg[j][0*cmd_wire[i].WIDTH_PER_CMD_REG+:cmd_wire[i].WIDTH_PER_CMD_REG];
                    cmd_wire[i].inner_cmd_reg[2*j+1] <= cmd_wire[i-1].inner_cmd_reg[j][1*cmd_wire[i].WIDTH_PER_CMD_REG+:cmd_wire[i].WIDTH_PER_CMD_REG];
                end
            end
        end

        for(i=0; i<(NUM_OUTPUT_DATA>>1); i=i+1)
        begin:o_latch_assignment
            always @(posedge clk) 
            begin
                o_cmd_reg[2*i] <= cmd_wire[NUM_LEVEL-1].inner_cmd_reg[i][0]; 
                o_cmd_reg[2*i+1] <= cmd_wire[NUM_LEVEL-1].inner_cmd_reg[i][1]; 
            end
        end
    endgenerate

    assign o_cmd_0  = o_cmd_reg[0];
    assign o_cmd_1  = o_cmd_reg[1];
    assign o_cmd_2  = o_cmd_reg[2];
    assign o_cmd_3  = o_cmd_reg[3];
    assign o_cmd_4  = o_cmd_reg[4];
    assign o_cmd_5  = o_cmd_reg[5];
    assign o_cmd_6  = o_cmd_reg[6];
    assign o_cmd_7  = o_cmd_reg[7];

endmodule


module mux_tree_8_1_seq #(
	parameter DATA_WIDTH = 32,      // could be arbitrary number
	parameter NUM_OUTPUT_DATA  = 1, // must be power of 2.
	parameter NUM_INPUT_DATA = 8   
)(
    // timeing signals
    clk,
	rst,
	
    // data signals
	i_valid,        // valid input data signal
	i_data_bus,     // input data bus coming into distribute switch
	
	o_valid,        // output valid
    o_data_bus,     // output data 

	// control signals
	i_en,           // distribute switch enable
	i_cmd           // the input should be one-hot encoded command 
);
	//parameter
	localparam TOTAL_COMMMAND = NUM_INPUT_DATA*NUM_OUTPUT_DATA;
	
	localparam WIDTH_INPUT_DATA = NUM_INPUT_DATA*DATA_WIDTH;
	localparam WIDTH_OUTPUT_DATA = NUM_OUTPUT_DATA*DATA_WIDTH;

	
    // interface
	input                                        clk;
	input                                        rst;

	input  [NUM_INPUT_DATA-1:0]                  i_valid;             
	input  [WIDTH_INPUT_DATA-1:0]                i_data_bus;

	output [NUM_OUTPUT_DATA-1:0]                 o_valid;             
	output [WIDTH_OUTPUT_DATA-1:0]               o_data_bus; // {o_data_a, o_data_b}

	input                                        i_en;
	input  [TOTAL_COMMMAND-1:0]                  i_cmd;

    reg    [NUM_OUTPUT_DATA-1:0]                 o_valid_reg;
    reg    [WIDTH_OUTPUT_DATA-1:0]               o_data_bus_reg;

    genvar i,j;
    generate
        for(i=0; i<NUM_OUTPUT_DATA; i=i+1)
        begin: o_data_output_mux
            
            // data mux
            wire [NUM_INPUT_DATA-1:0] inner_cmd_wire;
            assign inner_cmd_wire = {i_cmd[7*NUM_OUTPUT_DATA+i],i_cmd[6*NUM_OUTPUT_DATA+i],i_cmd[5*NUM_OUTPUT_DATA+i],i_cmd[4*NUM_OUTPUT_DATA+i],i_cmd[3*NUM_OUTPUT_DATA+i],i_cmd[2*NUM_OUTPUT_DATA+i],i_cmd[1*NUM_OUTPUT_DATA+i],i_cmd[0*NUM_OUTPUT_DATA+i]};
            always@(posedge clk)
            begin
               if(i_en && (~rst))
                begin
                    case(inner_cmd_wire)
                        8'b00000001:
                        begin
                            o_data_bus_reg[i*DATA_WIDTH+:DATA_WIDTH] <= (i_valid[0])?i_data_bus[0*DATA_WIDTH+:DATA_WIDTH]:{DATA_WIDTH{1'b0}};
                        end
                        8'b00000010:
                        begin
                            o_data_bus_reg[i*DATA_WIDTH+:DATA_WIDTH] <= (i_valid[1])?i_data_bus[1*DATA_WIDTH+:DATA_WIDTH]:{DATA_WIDTH{1'b0}};
                        end
                        8'b00000100:
                        begin
                            o_data_bus_reg[i*DATA_WIDTH+:DATA_WIDTH] <= (i_valid[2])?i_data_bus[2*DATA_WIDTH+:DATA_WIDTH]:{DATA_WIDTH{1'b0}};
                        end
                        8'b00001000:
                        begin
                            o_data_bus_reg[i*DATA_WIDTH+:DATA_WIDTH] <= (i_valid[3])?i_data_bus[3*DATA_WIDTH+:DATA_WIDTH]:{DATA_WIDTH{1'b0}};
                        end
                        8'b00010000:
                        begin
                            o_data_bus_reg[i*DATA_WIDTH+:DATA_WIDTH] <= (i_valid[4])?i_data_bus[4*DATA_WIDTH+:DATA_WIDTH]:{DATA_WIDTH{1'b0}};
                        end
                        8'b00100000:
                        begin
                            o_data_bus_reg[i*DATA_WIDTH+:DATA_WIDTH] <= (i_valid[5])?i_data_bus[5*DATA_WIDTH+:DATA_WIDTH]:{DATA_WIDTH{1'b0}};
                        end
                        8'b01000000:
                        begin
                            o_data_bus_reg[i*DATA_WIDTH+:DATA_WIDTH] <= (i_valid[6])?i_data_bus[6*DATA_WIDTH+:DATA_WIDTH]:{DATA_WIDTH{1'b0}};
                        end
                        8'b10000000:
                        begin
                            o_data_bus_reg[i*DATA_WIDTH+:DATA_WIDTH] <= (i_valid[7])?i_data_bus[7*DATA_WIDTH+:DATA_WIDTH]:{DATA_WIDTH{1'b0}};
                        end
                        default:
                        begin
                            o_data_bus_reg[i*DATA_WIDTH+:DATA_WIDTH] <= {WIDTH_OUTPUT_DATA{1'b0}};
                        end
                    endcase
                end
                else
                begin
                    o_data_bus_reg[i*DATA_WIDTH+:DATA_WIDTH] <= {WIDTH_OUTPUT_DATA{1'b0}};
                end
            end

            // valid mux
            wire [NUM_INPUT_DATA-1:0] inner_cmd_wire_valid;
            assign inner_cmd_wire_valid = {i_cmd[7*NUM_OUTPUT_DATA+i],i_cmd[6*NUM_OUTPUT_DATA+i],i_cmd[5*NUM_OUTPUT_DATA+i],i_cmd[4*NUM_OUTPUT_DATA+i],i_cmd[3*NUM_OUTPUT_DATA+i],i_cmd[2*NUM_OUTPUT_DATA+i],i_cmd[1*NUM_OUTPUT_DATA+i],i_cmd[0*NUM_OUTPUT_DATA+i]};
            always@(posedge clk)
            begin
               if(i_en && (~rst))
                begin
                    case(inner_cmd_wire_valid)
                        8'b00000001:
                        begin
                            o_valid_reg[i] <= (i_valid[0])?1'b1:1'b0;
                        end
                        8'b00000010:
                        begin
                            o_valid_reg[i] <= (i_valid[1])?1'b1:1'b0;
                        end
                        8'b00000100:
                        begin
                            o_valid_reg[i] <= (i_valid[2])?1'b1:1'b0;
                        end
                        8'b00001000:
                        begin
                            o_valid_reg[i] <= (i_valid[3])?1'b1:1'b0;
                        end
                        8'b00010000:
                        begin
                            o_valid_reg[i] <= (i_valid[4])?1'b1:1'b0;
                        end
                        8'b00100000:
                        begin
                            o_valid_reg[i] <= (i_valid[5])?1'b1:1'b0;
                        end
                        8'b01000000:
                        begin
                            o_valid_reg[i] <= (i_valid[6])?1'b1:1'b0;
                        end
                        8'b10000000:
                        begin
                            o_valid_reg[i] <= (i_valid[7])?1'b1:1'b0;
                        end
                        default:
                        begin
                            o_valid_reg[i] <= 1'b0;
                        end
                    endcase
                end
                else
                begin
                    o_valid_reg[i] <= 1'b0;
                end
            end
        end
    endgenerate

    assign o_data_bus = o_data_bus_reg;
    assign o_valid = o_valid_reg;

endmodule
`endif


`ifdef In16_Out8_separate_8_8_wire_pipeline
module crossbar_one_hot_seq#(
	parameter DATA_WIDTH = 32,      // could be arbitrary number
	parameter NUM_OUTPUT_DATA  = 8, // must be power of 2.
	parameter NUM_INPUT_DATA = 16   
)(
    // timeing signals
    clk,
	rst,
	
    // data signals
	i_valid,        // valid input data signal
	i_data_bus,     // input data bus coming into distribute switch
	
	o_valid,        // output valid
    o_data_bus,     // output data 

	// control signals
	i_en,           // distribute switch enable
	i_cmd           // the input should be one-hot encoded command 
);
	//parameter
	localparam TOTAL_COMMMAND = NUM_INPUT_DATA*NUM_OUTPUT_DATA;
	
	localparam WIDTH_INPUT_DATA = NUM_INPUT_DATA*DATA_WIDTH;
	localparam WIDTH_OUTPUT_DATA = NUM_OUTPUT_DATA*DATA_WIDTH;
	
    localparam NUM_IN_WIRE_PIPELINE = 5;
    
    localparam NUM_SEPARATE_FIRST_STAGE = 2;
	
    // interface
	input                                        clk;
	input                                        rst;
	
	input  [NUM_INPUT_DATA-1:0]                  i_valid;             
	input  [WIDTH_INPUT_DATA-1:0]                i_data_bus;
	
	output [NUM_OUTPUT_DATA-1:0]                 o_valid;             
	output [WIDTH_OUTPUT_DATA-1:0]               o_data_bus; // {o_data_a, o_data_b}

	input                                        i_en;
	input  [TOTAL_COMMMAND-1:0]                  i_cmd;

    reg    [NUM_OUTPUT_DATA-1:0]                 o_valid_reg;
    reg    [WIDTH_OUTPUT_DATA-1:0]               o_data_bus_reg;

    genvar i,j,k;
    generate
        // input wire pipeline -- divide wire into multiple pipeline stage to shorten the length of wire. 
        for(j=0; j< NUM_IN_WIRE_PIPELINE; j=j+1)
        begin:input_shift_def
            reg  [NUM_INPUT_DATA-1:0]            i_valid_shift;
            reg  [WIDTH_INPUT_DATA-1:0]          i_data_shift;
            reg  [TOTAL_COMMMAND-1:0]            i_cmd_shift;
            reg                                  i_en_shift;
            reg                                  rst_shift;
        end 

        always @(posedge clk) 
        begin:shift_input_initial
            input_shift_def[0].i_valid_shift <= i_valid;
            input_shift_def[0].i_data_shift <= i_data_bus;
            input_shift_def[0].i_cmd_shift <= i_cmd;
            input_shift_def[0].i_en_shift <= i_en;
            input_shift_def[0].rst_shift <= rst;
        end

        for(j=1; j< NUM_IN_WIRE_PIPELINE; j=j+1)
        begin:shift_input
            always @(posedge clk) 
            begin
                input_shift_def[j].i_valid_shift <= input_shift_def[j-1].i_valid_shift;
                input_shift_def[j].i_data_shift <= input_shift_def[j-1].i_data_shift;
                input_shift_def[j].i_cmd_shift <= input_shift_def[j-1].i_cmd_shift;
                input_shift_def[j].i_en_shift <= input_shift_def[j-1].i_en_shift;
                input_shift_def[j].rst_shift <= input_shift_def[j-1].rst_shift;
            end
        end 

        // define output reg of the two 8:8 mux.
        for(k=0; k<NUM_SEPARATE_FIRST_STAGE; k=k+1)
        begin:first_stage_output_def
            reg    [NUM_OUTPUT_DATA-1:0]                 o_valid_reg;
            reg    [WIDTH_OUTPUT_DATA-1:0]               o_data_bus_reg;
        end

        // two 8-to-8 xbar
        for(k=0; k<2;k=k+1)
        begin:xbar_id
            for(i=0; i<NUM_OUTPUT_DATA; i=i+1)
            begin: o_data_output_mux
                
                // data mux
                wire [NUM_INPUT_DATA-1:0] inner_cmd_wire;
                assign inner_cmd_wire = {input_shift_def[NUM_IN_WIRE_PIPELINE-1].i_cmd_shift[(7+k*NUM_OUTPUT_DATA)*NUM_OUTPUT_DATA+i], input_shift_def[NUM_IN_WIRE_PIPELINE-1].i_cmd_shift[(6+k*NUM_OUTPUT_DATA)*NUM_OUTPUT_DATA+i], input_shift_def[NUM_IN_WIRE_PIPELINE-1].i_cmd_shift[(5+k*NUM_OUTPUT_DATA)*NUM_OUTPUT_DATA+i], input_shift_def[NUM_IN_WIRE_PIPELINE-1].i_cmd_shift[(4+k*NUM_OUTPUT_DATA)*NUM_OUTPUT_DATA+i], input_shift_def[NUM_IN_WIRE_PIPELINE-1].i_cmd_shift[(3+k*NUM_OUTPUT_DATA)*NUM_OUTPUT_DATA+i], input_shift_def[NUM_IN_WIRE_PIPELINE-1].i_cmd_shift[(2+k*NUM_OUTPUT_DATA)*NUM_OUTPUT_DATA+i], input_shift_def[NUM_IN_WIRE_PIPELINE-1].i_cmd_shift[(1+k*NUM_OUTPUT_DATA)*NUM_OUTPUT_DATA+i], input_shift_def[NUM_IN_WIRE_PIPELINE-1].i_cmd_shift[(0+k*NUM_OUTPUT_DATA)*NUM_OUTPUT_DATA+i]};
                always@(posedge clk)
                begin:two_8_8_xbar_o_data
                if(i_en && (~rst))
                    begin
                        case(inner_cmd_wire)
                            8'b00000001:
                            begin
                                first_stage_output_def[k].o_data_bus_reg[i*DATA_WIDTH+:DATA_WIDTH] <= (input_shift_def[NUM_IN_WIRE_PIPELINE-1].i_valid_shift[0+k*NUM_OUTPUT_DATA])?input_shift_def[NUM_IN_WIRE_PIPELINE-1].i_data_shift[(0+k*NUM_OUTPUT_DATA)*DATA_WIDTH+:DATA_WIDTH]:{DATA_WIDTH{1'b0}};
                            end
                            8'b00000010:
                            begin
                                first_stage_output_def[k].o_data_bus_reg[i*DATA_WIDTH+:DATA_WIDTH] <= (input_shift_def[NUM_IN_WIRE_PIPELINE-1].i_valid_shift[1+k*NUM_OUTPUT_DATA])?input_shift_def[NUM_IN_WIRE_PIPELINE-1].i_data_shift[(1+k*NUM_OUTPUT_DATA)*DATA_WIDTH+:DATA_WIDTH]:{DATA_WIDTH{1'b0}};
                            end
                            8'b00000100:
                            begin
                                first_stage_output_def[k].o_data_bus_reg[i*DATA_WIDTH+:DATA_WIDTH] <= (input_shift_def[NUM_IN_WIRE_PIPELINE-1].i_valid_shift[2+k*NUM_OUTPUT_DATA])?input_shift_def[NUM_IN_WIRE_PIPELINE-1].i_data_shift[(2+k*NUM_OUTPUT_DATA)*DATA_WIDTH+:DATA_WIDTH]:{DATA_WIDTH{1'b0}};
                            end
                            8'b00001000:
                            begin
                                first_stage_output_def[k].o_data_bus_reg[i*DATA_WIDTH+:DATA_WIDTH] <= (input_shift_def[NUM_IN_WIRE_PIPELINE-1].i_valid_shift[3+k*NUM_OUTPUT_DATA])?input_shift_def[NUM_IN_WIRE_PIPELINE-1].i_data_shift[(3+k*NUM_OUTPUT_DATA)*DATA_WIDTH+:DATA_WIDTH]:{DATA_WIDTH{1'b0}};
                            end
                            8'b00010000:
                            begin
                                first_stage_output_def[k].o_data_bus_reg[i*DATA_WIDTH+:DATA_WIDTH] <= (input_shift_def[NUM_IN_WIRE_PIPELINE-1].i_valid_shift[4+k*NUM_OUTPUT_DATA])?input_shift_def[NUM_IN_WIRE_PIPELINE-1].i_data_shift[(4+k*NUM_OUTPUT_DATA)*DATA_WIDTH+:DATA_WIDTH]:{DATA_WIDTH{1'b0}};
                            end
                            8'b00100000:
                            begin
                                first_stage_output_def[k].o_data_bus_reg[i*DATA_WIDTH+:DATA_WIDTH] <= (input_shift_def[NUM_IN_WIRE_PIPELINE-1].i_valid_shift[5+k*NUM_OUTPUT_DATA])?input_shift_def[NUM_IN_WIRE_PIPELINE-1].i_data_shift[(5+k*NUM_OUTPUT_DATA)*DATA_WIDTH+:DATA_WIDTH]:{DATA_WIDTH{1'b0}};
                            end
                            8'b01000000:
                            begin
                                first_stage_output_def[k].o_data_bus_reg[i*DATA_WIDTH+:DATA_WIDTH] <= (input_shift_def[NUM_IN_WIRE_PIPELINE-1].i_valid_shift[6+k*NUM_OUTPUT_DATA])?input_shift_def[NUM_IN_WIRE_PIPELINE-1].i_data_shift[(6+k*NUM_OUTPUT_DATA)*DATA_WIDTH+:DATA_WIDTH]:{DATA_WIDTH{1'b0}};
                            end
                            8'b10000000:
                            begin
                                first_stage_output_def[k].o_data_bus_reg[i*DATA_WIDTH+:DATA_WIDTH] <= (input_shift_def[NUM_IN_WIRE_PIPELINE-1].i_valid_shift[7+k*NUM_OUTPUT_DATA])?input_shift_def[NUM_IN_WIRE_PIPELINE-1].i_data_shift[(7+k*NUM_OUTPUT_DATA)*DATA_WIDTH+:DATA_WIDTH]:{DATA_WIDTH{1'b0}};
                            end
                            default:
                            begin
                                first_stage_output_def[k].o_data_bus_reg[i*DATA_WIDTH+:DATA_WIDTH] <= {WIDTH_OUTPUT_DATA{1'b0}};
                            end
                        endcase
                    end
                    else
                    begin
                        first_stage_output_def[k].o_data_bus_reg[i*DATA_WIDTH+:DATA_WIDTH] <= {WIDTH_OUTPUT_DATA{1'b0}};
                    end
                end

                // valid mux
                wire [NUM_INPUT_DATA-1:0] inner_cmd_wire_valid;
                assign inner_cmd_wire_valid = {input_shift_def[NUM_IN_WIRE_PIPELINE-1].i_cmd_shift[(7+k*NUM_OUTPUT_DATA)*NUM_OUTPUT_DATA+i], input_shift_def[NUM_IN_WIRE_PIPELINE-1].i_cmd_shift[(6+k*NUM_OUTPUT_DATA)*NUM_OUTPUT_DATA+i], input_shift_def[NUM_IN_WIRE_PIPELINE-1].i_cmd_shift[(5+k*NUM_OUTPUT_DATA)*NUM_OUTPUT_DATA+i], input_shift_def[NUM_IN_WIRE_PIPELINE-1].i_cmd_shift[(4+k*NUM_OUTPUT_DATA)*NUM_OUTPUT_DATA+i], input_shift_def[NUM_IN_WIRE_PIPELINE-1].i_cmd_shift[(3+k*NUM_OUTPUT_DATA)*NUM_OUTPUT_DATA+i], input_shift_def[NUM_IN_WIRE_PIPELINE-1].i_cmd_shift[(2+k*NUM_OUTPUT_DATA)*NUM_OUTPUT_DATA+i], input_shift_def[NUM_IN_WIRE_PIPELINE-1].i_cmd_shift[(1+k*NUM_OUTPUT_DATA)*NUM_OUTPUT_DATA+i], input_shift_def[NUM_IN_WIRE_PIPELINE-1].i_cmd_shift[(0+k*NUM_OUTPUT_DATA)*NUM_OUTPUT_DATA+i]};
                always@(posedge clk)
                begin:two_8_8_xbar_o_valid
                    if(i_en && (~rst))
                    begin
                        case(inner_cmd_wire_valid)
                            8'b00000001:
                            begin
                                first_stage_output_def[k].o_valid_reg[i] <= (input_shift_def[NUM_IN_WIRE_PIPELINE-1].i_valid_shift[0+k*NUM_OUTPUT_DATA])?1'b1:1'b0;
                            end
                            8'b00000010:
                            begin
                                first_stage_output_def[k].o_valid_reg[i] <= (input_shift_def[NUM_IN_WIRE_PIPELINE-1].i_valid_shift[1+k*NUM_OUTPUT_DATA])?1'b1:1'b0;
                            end
                            8'b00000100:
                            begin
                                first_stage_output_def[k].o_valid_reg[i] <= (input_shift_def[NUM_IN_WIRE_PIPELINE-1].i_valid_shift[2+k*NUM_OUTPUT_DATA])?1'b1:1'b0;
                            end
                            8'b00001000:
                            begin
                                first_stage_output_def[k].o_valid_reg[i] <= (input_shift_def[NUM_IN_WIRE_PIPELINE-1].i_valid_shift[3+k*NUM_OUTPUT_DATA])?1'b1:1'b0;
                            end
                            8'b00010000:
                            begin
                                first_stage_output_def[k].o_valid_reg[i] <= (input_shift_def[NUM_IN_WIRE_PIPELINE-1].i_valid_shift[4+k*NUM_OUTPUT_DATA])?1'b1:1'b0;
                            end
                            8'b00100000:
                            begin
                                first_stage_output_def[k].o_valid_reg[i] <= (input_shift_def[NUM_IN_WIRE_PIPELINE-1].i_valid_shift[5+k*NUM_OUTPUT_DATA])?1'b1:1'b0;
                            end
                            8'b01000000:
                            begin
                                first_stage_output_def[k].o_valid_reg[i] <= (input_shift_def[NUM_IN_WIRE_PIPELINE-1].i_valid_shift[6+k*NUM_OUTPUT_DATA])?1'b1:1'b0;
                            end
                            8'b10000000:
                            begin
                                first_stage_output_def[k].o_valid_reg[i] <= (input_shift_def[NUM_IN_WIRE_PIPELINE-1].i_valid_shift[7+k*NUM_OUTPUT_DATA])?1'b1:1'b0;
                            end
                            default:
                            begin
                                first_stage_output_def[k].o_valid_reg[i] <= 1'b0;
                            end
                        endcase
                    end
                    else
                    begin
                        first_stage_output_def[k].o_valid_reg[i] <= 1'b0;
                    end
                end

            end
        end

        // second stage -- eight 2:1 mux.
        for(i=0; i<NUM_OUTPUT_DATA; i=i+1)
        begin:eight_2_1_mux_o_data
            wire    [NUM_SEPARATE_FIRST_STAGE-1:0]   inner_cmd_wire_second_stage_data;
            assign  inner_cmd_wire_second_stage_data = {first_stage_output_def[1].o_valid_reg[i], first_stage_output_def[0].o_valid_reg[i]};

            always @(posedge clk) 
            begin
                if(i_en && (~rst))
                begin
                    case(inner_cmd_wire_second_stage_data)
                        2'b01:
                        begin
                            o_data_bus_reg[i*DATA_WIDTH+:DATA_WIDTH] <= first_stage_output_def[0].o_data_bus_reg[i*DATA_WIDTH+:DATA_WIDTH];                 
                        end                        
                        2'b10:
                        begin
                            o_data_bus_reg[i*DATA_WIDTH+:DATA_WIDTH] <= first_stage_output_def[1].o_data_bus_reg[i*DATA_WIDTH+:DATA_WIDTH];                 
                        end
                        default:
                        begin
                            o_data_bus_reg[i*DATA_WIDTH+:DATA_WIDTH] <= {DATA_WIDTH{1'b0}};                 
                        end
                    endcase
                end
            end
        end
        
        // second stage -- eight 2:1 mux -- valid
        for(i=0; i<NUM_OUTPUT_DATA; i=i+1)
        begin:eight_2_1_mux_o_valid
            wire    [NUM_SEPARATE_FIRST_STAGE-1:0]   inner_cmd_wire_second_stage_valid;
            assign  inner_cmd_wire_second_stage_valid = {first_stage_output_def[1].o_valid_reg[i], first_stage_output_def[0].o_valid_reg[i]};

            always @(posedge clk) 
            begin
                if(i_en && (~rst))
                begin
                    case(inner_cmd_wire_second_stage_valid)
                        2'b01:
                        begin
                            o_valid_reg[i] <= first_stage_output_def[0].o_valid_reg[i];                 
                        end                        
                        2'b10:
                        begin
                            o_valid_reg[i] <= first_stage_output_def[1].o_valid_reg[i];                 
                        end
                        default:
                        begin
                            o_valid_reg[i] <= {DATA_WIDTH{1'b0}};                 
                        end
                    endcase
                end
            end
        end

    endgenerate

    assign o_data_bus = o_data_bus_reg;
    assign o_valid = o_valid_reg;

endmodule
`endif 

`ifdef In16_Out8_pipeline_wire_pipeline_i_en_pipeline_mux
module crossbar_one_hot_seq#(
	parameter DATA_WIDTH = 32,      // could be arbitrary number
	parameter NUM_OUTPUT_DATA  = 8, // must be power of 2.
	parameter NUM_INPUT_DATA = 16   
)(
    // timeing signals
    clk,
	rst,
	
    // data signals
	i_valid,        // valid input data signal
	i_data_bus,     // input data bus coming into distribute switch
	
	o_valid,        // output valid
    o_data_bus,     // output data 

	// control signals
	i_en,           // distribute switch enable
	i_cmd           // the input should be one-hot encoded command 
);

	//parameter
	localparam TOTAL_COMMMAND = NUM_INPUT_DATA*NUM_OUTPUT_DATA;
	
	localparam WIDTH_INPUT_DATA = NUM_INPUT_DATA*DATA_WIDTH;
	localparam WIDTH_OUTPUT_DATA = NUM_OUTPUT_DATA*DATA_WIDTH;

	localparam NUM_IN_WIRE_PIPELINE = 6;

	localparam NUM_IN_MUX_FIRST_STAGE = 4;
	localparam NUM_MUX_FIRST_STAGE = NUM_INPUT_DATA >> $clog2(NUM_IN_MUX_FIRST_STAGE);

	localparam NUM_WIRE_PIPELINE_FIRST_STAGE = 2;

	localparam NUM_IN_MUX_SECOND_STAGE = NUM_MUX_FIRST_STAGE;
	localparam NUM_MUX_SECOND_STAGE = 1;


    // interface
	input                                        clk;
	input                                        rst;
	
	input  [NUM_INPUT_DATA-1:0]                  i_valid;             
	input  [WIDTH_INPUT_DATA-1:0]                i_data_bus;
	
	output [NUM_OUTPUT_DATA-1:0]                 o_valid;             
	output [WIDTH_OUTPUT_DATA-1:0]               o_data_bus; // {o_data_a, o_data_b}

	input                                        i_en;
	input  [TOTAL_COMMMAND-1:0]                  i_cmd;

    reg    [NUM_OUTPUT_DATA-1:0]                 o_valid_reg;
    reg    [WIDTH_OUTPUT_DATA-1:0]               o_data_bus_reg;


    genvar i,j;
    generate
        // input pipeline -- divide wire into multiple pipeline stage to shorten the length of wire. 
        for(j=0; j< NUM_IN_WIRE_PIPELINE; j=j+1)
        begin:input_shift_def
            reg  [NUM_INPUT_DATA-1:0]            i_valid_shift;
            reg  [WIDTH_INPUT_DATA-1:0]          i_data_shift;
            reg  [TOTAL_COMMMAND-1:0]            i_cmd_shift;
            reg                                  i_en_shift;
            reg                                  rst_shift;
        end 

        always @(posedge clk) 
        begin:shift_input_initial
            input_shift_def[0].i_valid_shift <= i_valid;
            input_shift_def[0].i_data_shift <= i_data_bus;
            input_shift_def[0].i_cmd_shift <= i_cmd;
            input_shift_def[0].i_en_shift <= i_en;
            input_shift_def[0].rst_shift <= rst;
        end

        for(j=1; j< NUM_IN_WIRE_PIPELINE; j=j+1)
        begin:shift_input
            always @(posedge clk) 
            begin
                input_shift_def[j].i_valid_shift <= input_shift_def[j-1].i_valid_shift;
                input_shift_def[j].i_data_shift <= input_shift_def[j-1].i_data_shift;
                input_shift_def[j].i_cmd_shift <= input_shift_def[j-1].i_cmd_shift;
                input_shift_def[j].i_en_shift <= input_shift_def[j-1].i_en_shift;
                input_shift_def[j].rst_shift <= input_shift_def[j-1].rst_shift;
            end
        end 

        // instantiate output data mux
        for(i=0; i<NUM_OUTPUT_DATA; i=i+1)
        begin: o_data_output_mux
            for(j=0; j< NUM_WIRE_PIPELINE_FIRST_STAGE; j=j+1)
            begin:first_stage_def
                reg   [NUM_MUX_FIRST_STAGE*DATA_WIDTH-1:0]        inner_data_shift;
                reg   [NUM_MUX_FIRST_STAGE-1:0]                   inner_valid_shift;
                reg                                               inner_en_shift;
                reg                                               inner_rst_shift;
            end

            always @(posedge clk) 
            begin
                first_stage_def[0].inner_en_shift <= input_shift_def[NUM_IN_WIRE_PIPELINE-1].i_en_shift;
                first_stage_def[0].inner_rst_shift <= input_shift_def[NUM_IN_WIRE_PIPELINE-1].rst_shift;
            end

            for(j=1; j< NUM_WIRE_PIPELINE_FIRST_STAGE; j=j+1)
            begin:shift_input_first_stage
                always @(posedge clk)
                begin
                    first_stage_def[j].inner_valid_shift <= first_stage_def[j-1].inner_valid_shift;
                    first_stage_def[j].inner_data_shift <= first_stage_def[j-1].inner_data_shift;
                    first_stage_def[j].inner_en_shift <= first_stage_def[j-1].inner_en_shift;
                    first_stage_def[j].inner_rst_shift <= first_stage_def[j-1].inner_rst_shift;
                end
            end
            
            // first pipeline stage -- data -- 4 * 4:1 mux logic.
            for(j=0; j< NUM_MUX_FIRST_STAGE; j=j+1)
            begin:first_stage_data
                wire  [NUM_IN_MUX_FIRST_STAGE-1:0]       inner_cmd_wire;
                assign  inner_cmd_wire = {input_shift_def[NUM_IN_WIRE_PIPELINE-1].i_cmd_shift[(3+j*NUM_IN_MUX_FIRST_STAGE)*NUM_OUTPUT_DATA+i],input_shift_def[NUM_IN_WIRE_PIPELINE-1].i_cmd_shift[(2+j*NUM_IN_MUX_FIRST_STAGE)*NUM_OUTPUT_DATA+i],input_shift_def[NUM_IN_WIRE_PIPELINE-1].i_cmd_shift[(1+j*NUM_IN_MUX_FIRST_STAGE)*NUM_OUTPUT_DATA+i],input_shift_def[NUM_IN_WIRE_PIPELINE-1].i_cmd_shift[(0+j*NUM_IN_MUX_FIRST_STAGE)*NUM_OUTPUT_DATA+i]};
                always@(posedge clk)
                begin
                    if(input_shift_def[NUM_IN_WIRE_PIPELINE-1].i_en_shift && (~input_shift_def[NUM_IN_WIRE_PIPELINE-1].rst_shift))
                    begin
                        case(inner_cmd_wire)
                            4'b0001:
                            begin
                                first_stage_def[0].inner_data_shift[j*DATA_WIDTH+:DATA_WIDTH] <= (input_shift_def[NUM_IN_WIRE_PIPELINE-1].i_valid_shift[(0+j*NUM_IN_MUX_FIRST_STAGE)])?input_shift_def[NUM_IN_WIRE_PIPELINE-1].i_data_shift[(0+j*NUM_IN_MUX_FIRST_STAGE)*DATA_WIDTH+:DATA_WIDTH]:{DATA_WIDTH{1'b0}};
                            end
                            4'b0010:
                            begin
                                first_stage_def[0].inner_data_shift[j*DATA_WIDTH+:DATA_WIDTH] <= (input_shift_def[NUM_IN_WIRE_PIPELINE-1].i_valid_shift[(1+j*NUM_IN_MUX_FIRST_STAGE)])?input_shift_def[NUM_IN_WIRE_PIPELINE-1].i_data_shift[(1+j*NUM_IN_MUX_FIRST_STAGE)*DATA_WIDTH+:DATA_WIDTH]:{DATA_WIDTH{1'b0}};
                            end
                            4'b0100:
                            begin
                                first_stage_def[0].inner_data_shift[j*DATA_WIDTH+:DATA_WIDTH] <= (input_shift_def[NUM_IN_WIRE_PIPELINE-1].i_valid_shift[(2+j*NUM_IN_MUX_FIRST_STAGE)])?input_shift_def[NUM_IN_WIRE_PIPELINE-1].i_data_shift[(2+j*NUM_IN_MUX_FIRST_STAGE)*DATA_WIDTH+:DATA_WIDTH]:{DATA_WIDTH{1'b0}};
                            end
                            4'b1000:
                            begin
                                first_stage_def[0].inner_data_shift[j*DATA_WIDTH+:DATA_WIDTH] <= (input_shift_def[NUM_IN_WIRE_PIPELINE-1].i_valid_shift[(3+j*NUM_IN_MUX_FIRST_STAGE)])?input_shift_def[NUM_IN_WIRE_PIPELINE-1].i_data_shift[(3+j*NUM_IN_MUX_FIRST_STAGE)*DATA_WIDTH+:DATA_WIDTH]:{DATA_WIDTH{1'b0}};
                            end
                            default:
                            begin
                                first_stage_def[0].inner_data_shift[j*DATA_WIDTH+:DATA_WIDTH] <= {DATA_WIDTH{1'b0}};
                            end
                        endcase
                    end
                    else
                    begin
                        first_stage_def[0].inner_data_shift[j*DATA_WIDTH+:DATA_WIDTH] <= {DATA_WIDTH{1'b0}};
                    end
                end
            end

            // first pipeline stage -- valid -- 4 * 4:1 mux logic.
            for(j=0; j< NUM_MUX_FIRST_STAGE; j=j+1)
            begin:first_stage_valid
                wire  [NUM_IN_MUX_FIRST_STAGE-1:0]       inner_cmd_wire_valid;
                assign  inner_cmd_wire_valid = {input_shift_def[NUM_IN_WIRE_PIPELINE-1].i_cmd_shift[(3+j*NUM_IN_MUX_FIRST_STAGE)*NUM_OUTPUT_DATA+i],input_shift_def[NUM_IN_WIRE_PIPELINE-1].i_cmd_shift[(2+j*NUM_IN_MUX_FIRST_STAGE)*NUM_OUTPUT_DATA+i],input_shift_def[NUM_IN_WIRE_PIPELINE-1].i_cmd_shift[(1+j*NUM_IN_MUX_FIRST_STAGE)*NUM_OUTPUT_DATA+i],input_shift_def[NUM_IN_WIRE_PIPELINE-1].i_cmd_shift[(j*NUM_IN_MUX_FIRST_STAGE)*NUM_OUTPUT_DATA+i]};
                always@(posedge clk)
                begin
                    if(input_shift_def[NUM_IN_WIRE_PIPELINE-1].i_en_shift && (~input_shift_def[NUM_IN_WIRE_PIPELINE-1].rst_shift))
                    begin
                        case(inner_cmd_wire_valid)
                            4'b0001:
                            begin
                                first_stage_def[0].inner_valid_shift[j] <= (i_valid[0+j*NUM_IN_MUX_FIRST_STAGE])?1'b1:1'b0;
                            end
                            4'b0010:
                            begin
                                first_stage_def[0].inner_valid_shift[j] <= (i_valid[1+j*NUM_IN_MUX_FIRST_STAGE])?1'b1:1'b0;
                            end
                            4'b0100:
                            begin
                                first_stage_def[0].inner_valid_shift[j] <= (i_valid[2+j*NUM_IN_MUX_FIRST_STAGE])?1'b1:1'b0;
                            end
                            4'b1000:
                            begin
                                first_stage_def[0].inner_valid_shift[j] <= (i_valid[3+j*NUM_IN_MUX_FIRST_STAGE])?1'b1:1'b0;
                            end
                            default:
                            begin
                                first_stage_def[0].inner_valid_shift[j] <= 1'b0;
                            end
                        endcase
                    end
                    else
                    begin
                        first_stage_def[0].inner_valid_shift[j] <= 1'b0; 
                    end
                end
            end

            wire  [NUM_IN_MUX_SECOND_STAGE-1:0]  inner_cmd_wire_second_stage;
            assign inner_cmd_wire_second_stage = {first_stage_def[NUM_WIRE_PIPELINE_FIRST_STAGE-1].inner_valid_shift};

            //data_mux
            always@(posedge clk)
            begin:second_stage_data
                if(first_stage_def[NUM_WIRE_PIPELINE_FIRST_STAGE-1].inner_en_shift && (~first_stage_def[NUM_WIRE_PIPELINE_FIRST_STAGE-1].inner_rst_shift))
                begin
                    case(inner_cmd_wire_second_stage)
                        4'b0001:
                        begin
                            o_data_bus_reg[i*DATA_WIDTH+:DATA_WIDTH] <= first_stage_def[NUM_WIRE_PIPELINE_FIRST_STAGE-1].inner_data_shift[0*DATA_WIDTH+:DATA_WIDTH];
                        end
                        4'b0010:
                        begin
                            o_data_bus_reg[i*DATA_WIDTH+:DATA_WIDTH] <= first_stage_def[NUM_WIRE_PIPELINE_FIRST_STAGE-1].inner_data_shift[1*DATA_WIDTH+:DATA_WIDTH];
                        end
                        4'b0100:
                        begin
                            o_data_bus_reg[i*DATA_WIDTH+:DATA_WIDTH] <= first_stage_def[NUM_WIRE_PIPELINE_FIRST_STAGE-1].inner_data_shift[2*DATA_WIDTH+:DATA_WIDTH];
                        end
                        4'b1000:
                        begin
                            o_data_bus_reg[i*DATA_WIDTH+:DATA_WIDTH] <= first_stage_def[NUM_WIRE_PIPELINE_FIRST_STAGE-1].inner_data_shift[3*DATA_WIDTH+:DATA_WIDTH];
                        end
                        default:
                        begin
                            o_data_bus_reg[i*DATA_WIDTH+:DATA_WIDTH] <= {WIDTH_OUTPUT_DATA{1'b0}};
                        end
                    endcase
                end
                else
                begin
                    o_data_bus_reg[i*DATA_WIDTH+:DATA_WIDTH] <= {WIDTH_OUTPUT_DATA{1'b0}};
                end
            end

            //valid_mux
            always@(posedge clk)
            begin:second_stage_valid
                if(first_stage_def[NUM_WIRE_PIPELINE_FIRST_STAGE-1].inner_en_shift && (~first_stage_def[NUM_WIRE_PIPELINE_FIRST_STAGE-1].inner_rst_shift))
                begin
                    case(inner_cmd_wire_second_stage)
                        4'b0001:
                        begin
                            o_valid_reg[i] <= 1'b1;
                        end
                        4'b0010:
                        begin
                            o_valid_reg[i] <= 1'b1;
                        end
                        4'b0100:
                        begin
                            o_valid_reg[i] <= 1'b1;
                        end
                        4'b1000:
                        begin
                            o_valid_reg[i] <= 1'b1;
                        end
                        default:
                        begin
                            o_valid_reg[i] <= 1'b0;
                        end
                    endcase
                end
                else
                begin
                    o_valid_reg[i] <= 1'b0;
                end
            end
        end
    endgenerate

    assign o_data_bus = o_data_bus_reg;
    assign o_valid = o_valid_reg;

endmodule
`endif


`ifdef In16_Out8_pipeline_wire_pipeline_i_en_pipeline_mux_output_pipeline
module crossbar_one_hot_seq#(
	parameter DATA_WIDTH = 32,      // could be arbitrary number
	parameter NUM_OUTPUT_DATA  = 8, // must be power of 2.
	parameter NUM_INPUT_DATA = 16   
)(
    // timeing signals
    clk,
	rst,
	
    // data signals
	i_valid,        // valid input data signal
	i_data_bus,     // input data bus coming into distribute switch
	
	o_valid,        // output valid
    o_data_bus,     // output data 

	// control signals
	i_en,           // distribute switch enable
	i_cmd           // the input should be one-hot encoded command 
);

	//parameter
	localparam TOTAL_COMMMAND = NUM_INPUT_DATA*NUM_OUTPUT_DATA;
	
	localparam WIDTH_INPUT_DATA = NUM_INPUT_DATA*DATA_WIDTH;
	localparam WIDTH_OUTPUT_DATA = NUM_OUTPUT_DATA*DATA_WIDTH;

	localparam NUM_IN_WIRE_PIPELINE = 8;

	localparam NUM_IN_MUX_FIRST_STAGE = 4;
	localparam NUM_MUX_FIRST_STAGE = NUM_INPUT_DATA >> $clog2(NUM_IN_MUX_FIRST_STAGE);

	localparam NUM_WIRE_PIPELINE_FIRST_STAGE = 2;

	localparam NUM_IN_MUX_SECOND_STAGE = NUM_MUX_FIRST_STAGE;
	localparam NUM_MUX_SECOND_STAGE = 1;

    localparam NUM_OUT_WIRE_PIPELINE = 2;

    // interface
	input                                        clk;
	input                                        rst;
	
	input  [NUM_INPUT_DATA-1:0]                  i_valid;             
	input  [WIDTH_INPUT_DATA-1:0]                i_data_bus;
	
	output [NUM_OUTPUT_DATA-1:0]                 o_valid;             
	output [WIDTH_OUTPUT_DATA-1:0]               o_data_bus; // {o_data_a, o_data_b}

	input                                        i_en;
	input  [TOTAL_COMMMAND-1:0]                  i_cmd;

    reg    [NUM_OUTPUT_DATA-1:0]                 o_valid_reg;
    reg    [WIDTH_OUTPUT_DATA-1:0]               o_data_bus_reg;

    genvar i,j;
    generate
        // input pipeline -- divide wire into multiple pipeline stage to shorten the length of wire. 
        for(j=0; j< NUM_IN_WIRE_PIPELINE; j=j+1)
        begin:input_shift_def
            reg  [NUM_INPUT_DATA-1:0]            i_valid_shift;
            reg  [WIDTH_INPUT_DATA-1:0]          i_data_shift;
            reg  [TOTAL_COMMMAND-1:0]            i_cmd_shift;
            reg                                  i_en_shift;
            reg                                  rst_shift;
        end 

        always @(posedge clk) 
        begin:shift_input_initial
            input_shift_def[0].i_valid_shift <= i_valid;
            input_shift_def[0].i_data_shift <= i_data_bus;
            input_shift_def[0].i_cmd_shift <= i_cmd;
            input_shift_def[0].i_en_shift <= i_en;
            input_shift_def[0].rst_shift <= rst;
        end

        for(j=1; j< NUM_IN_WIRE_PIPELINE; j=j+1)
        begin:shift_input
            always @(posedge clk) 
            begin
                input_shift_def[j].i_valid_shift <= input_shift_def[j-1].i_valid_shift;
                input_shift_def[j].i_data_shift <= input_shift_def[j-1].i_data_shift;
                input_shift_def[j].i_cmd_shift <= input_shift_def[j-1].i_cmd_shift;
                input_shift_def[j].i_en_shift <= input_shift_def[j-1].i_en_shift;
                input_shift_def[j].rst_shift <= input_shift_def[j-1].rst_shift;
            end
        end 

        // output pipeline  
        for(j=0; j< NUM_OUT_WIRE_PIPELINE; j=j+1)
        begin:output_shift_def
            reg    [NUM_OUTPUT_DATA-1:0]                 o_valid_reg_shift;
            reg    [WIDTH_OUTPUT_DATA-1:0]               o_data_bus_reg_shift;
        end 

        // instantiate output data mux
        for(i=0; i<NUM_OUTPUT_DATA; i=i+1)
        begin: o_data_output_mux

            for(j=0; j< NUM_WIRE_PIPELINE_FIRST_STAGE; j=j+1)
            begin:first_stage_def
                reg   [NUM_MUX_FIRST_STAGE*DATA_WIDTH-1:0]        inner_data_shift;
                reg   [NUM_MUX_FIRST_STAGE-1:0]                   inner_valid_shift;
                reg                                               inner_en_shift;
                reg                                               inner_rst_shift;
            end
            
            always @(posedge clk) 
            begin
                first_stage_def[0].inner_en_shift <= input_shift_def[NUM_IN_WIRE_PIPELINE-1].i_en_shift;
                first_stage_def[0].inner_rst_shift <= input_shift_def[NUM_IN_WIRE_PIPELINE-1].rst_shift;
            end

            for(j=1; j< NUM_WIRE_PIPELINE_FIRST_STAGE; j=j+1)
            begin:shift_input_first_stage
                always @(posedge clk)
                begin
                    first_stage_def[j].inner_valid_shift <= first_stage_def[j-1].inner_valid_shift;
                    first_stage_def[j].inner_data_shift <= first_stage_def[j-1].inner_data_shift;
                    first_stage_def[j].inner_en_shift <= first_stage_def[j-1].inner_en_shift;
                    first_stage_def[j].inner_rst_shift <= first_stage_def[j-1].inner_rst_shift;
                end
            end
            
            // first pipeline stage -- data -- 4 * 4:1 mux logic.
            for(j=0; j< NUM_MUX_FIRST_STAGE; j=j+1)
            begin:first_stage_data
                wire  [NUM_IN_MUX_FIRST_STAGE-1:0]       inner_cmd_wire;
                assign  inner_cmd_wire = {input_shift_def[NUM_IN_WIRE_PIPELINE-1].i_cmd_shift[(3+j*NUM_IN_MUX_FIRST_STAGE)*NUM_OUTPUT_DATA+i],input_shift_def[NUM_IN_WIRE_PIPELINE-1].i_cmd_shift[(2+j*NUM_IN_MUX_FIRST_STAGE)*NUM_OUTPUT_DATA+i],input_shift_def[NUM_IN_WIRE_PIPELINE-1].i_cmd_shift[(1+j*NUM_IN_MUX_FIRST_STAGE)*NUM_OUTPUT_DATA+i],input_shift_def[NUM_IN_WIRE_PIPELINE-1].i_cmd_shift[(0+j*NUM_IN_MUX_FIRST_STAGE)*NUM_OUTPUT_DATA+i]};
                always@(posedge clk)
                begin
                    if(input_shift_def[NUM_IN_WIRE_PIPELINE-1].i_en_shift && (~input_shift_def[NUM_IN_WIRE_PIPELINE-1].rst_shift))
                    begin
                        case(inner_cmd_wire)
                            4'b0001:
                            begin
                                first_stage_def[0].inner_data_shift[j*DATA_WIDTH+:DATA_WIDTH] <= (input_shift_def[NUM_IN_WIRE_PIPELINE-1].i_valid_shift[(0+j*NUM_IN_MUX_FIRST_STAGE)])?input_shift_def[NUM_IN_WIRE_PIPELINE-1].i_data_shift[(0+j*NUM_IN_MUX_FIRST_STAGE)*DATA_WIDTH+:DATA_WIDTH]:{DATA_WIDTH{1'b0}};
                            end
                            4'b0010:
                            begin
                                first_stage_def[0].inner_data_shift[j*DATA_WIDTH+:DATA_WIDTH] <= (input_shift_def[NUM_IN_WIRE_PIPELINE-1].i_valid_shift[(1+j*NUM_IN_MUX_FIRST_STAGE)])?input_shift_def[NUM_IN_WIRE_PIPELINE-1].i_data_shift[(1+j*NUM_IN_MUX_FIRST_STAGE)*DATA_WIDTH+:DATA_WIDTH]:{DATA_WIDTH{1'b0}};
                            end
                            4'b0100:
                            begin
                                first_stage_def[0].inner_data_shift[j*DATA_WIDTH+:DATA_WIDTH] <= (input_shift_def[NUM_IN_WIRE_PIPELINE-1].i_valid_shift[(2+j*NUM_IN_MUX_FIRST_STAGE)])?input_shift_def[NUM_IN_WIRE_PIPELINE-1].i_data_shift[(2+j*NUM_IN_MUX_FIRST_STAGE)*DATA_WIDTH+:DATA_WIDTH]:{DATA_WIDTH{1'b0}};
                            end
                            4'b1000:
                            begin
                                first_stage_def[0].inner_data_shift[j*DATA_WIDTH+:DATA_WIDTH] <= (input_shift_def[NUM_IN_WIRE_PIPELINE-1].i_valid_shift[(3+j*NUM_IN_MUX_FIRST_STAGE)])?input_shift_def[NUM_IN_WIRE_PIPELINE-1].i_data_shift[(3+j*NUM_IN_MUX_FIRST_STAGE)*DATA_WIDTH+:DATA_WIDTH]:{DATA_WIDTH{1'b0}};
                            end
                            default:
                            begin
                                first_stage_def[0].inner_data_shift[j*DATA_WIDTH+:DATA_WIDTH] <= {DATA_WIDTH{1'b0}};
                            end
                        endcase
                    end
                    else
                    begin
                        first_stage_def[0].inner_data_shift[j*DATA_WIDTH+:DATA_WIDTH] <= {DATA_WIDTH{1'b0}};
                    end
                end
            end

            // first pipeline stage -- valid -- 4 * 4:1 mux logic.
            for(j=0; j< NUM_MUX_FIRST_STAGE; j=j+1)
            begin:first_stage_valid
                wire  [NUM_IN_MUX_FIRST_STAGE-1:0]       inner_cmd_wire_valid;
                assign  inner_cmd_wire_valid = {input_shift_def[NUM_IN_WIRE_PIPELINE-1].i_cmd_shift[(3+j*NUM_IN_MUX_FIRST_STAGE)*NUM_OUTPUT_DATA+i],input_shift_def[NUM_IN_WIRE_PIPELINE-1].i_cmd_shift[(2+j*NUM_IN_MUX_FIRST_STAGE)*NUM_OUTPUT_DATA+i],input_shift_def[NUM_IN_WIRE_PIPELINE-1].i_cmd_shift[(1+j*NUM_IN_MUX_FIRST_STAGE)*NUM_OUTPUT_DATA+i],input_shift_def[NUM_IN_WIRE_PIPELINE-1].i_cmd_shift[(j*NUM_IN_MUX_FIRST_STAGE)*NUM_OUTPUT_DATA+i]};
                always@(posedge clk)
                begin
                    if(input_shift_def[NUM_IN_WIRE_PIPELINE-1].i_en_shift && (~input_shift_def[NUM_IN_WIRE_PIPELINE-1].rst_shift))
                    begin
                        case(inner_cmd_wire_valid)
                            4'b0001:
                            begin
                                first_stage_def[0].inner_valid_shift[j] <= (input_shift_def[NUM_IN_WIRE_PIPELINE-1].i_valid_shift[0+j*NUM_IN_MUX_FIRST_STAGE])?1'b1:1'b0;
                            end
                            4'b0010:
                            begin
                                first_stage_def[0].inner_valid_shift[j] <= (input_shift_def[NUM_IN_WIRE_PIPELINE-1].i_valid_shift[1+j*NUM_IN_MUX_FIRST_STAGE])?1'b1:1'b0;
                            end
                            4'b0100:
                            begin
                                first_stage_def[0].inner_valid_shift[j] <= (input_shift_def[NUM_IN_WIRE_PIPELINE-1].i_valid_shift[2+j*NUM_IN_MUX_FIRST_STAGE])?1'b1:1'b0;
                            end
                            4'b1000:
                            begin
                                first_stage_def[0].inner_valid_shift[j] <= (input_shift_def[NUM_IN_WIRE_PIPELINE-1].i_valid_shift[3+j*NUM_IN_MUX_FIRST_STAGE])?1'b1:1'b0;
                            end
                            default:
                            begin
                                first_stage_def[0].inner_valid_shift[j] <= 1'b0;
                            end
                        endcase
                    end
                    else
                    begin
                        first_stage_def[0].inner_valid_shift[j] <= 1'b0; 
                    end
                end
            end

            wire  [NUM_IN_MUX_SECOND_STAGE-1:0]  inner_cmd_wire_second_stage;
            assign inner_cmd_wire_second_stage = {first_stage_def[NUM_WIRE_PIPELINE_FIRST_STAGE-1].inner_valid_shift};

            //data_mux
            always@(posedge clk)
            begin:second_stage_data
                if(first_stage_def[NUM_WIRE_PIPELINE_FIRST_STAGE-1].inner_en_shift && (~first_stage_def[NUM_WIRE_PIPELINE_FIRST_STAGE-1].inner_rst_shift))
                begin
                    case(inner_cmd_wire_second_stage)
                        4'b0001:
                        begin
                            output_shift_def[0].o_data_bus_reg_shift[i*DATA_WIDTH+:DATA_WIDTH] <= first_stage_def[NUM_WIRE_PIPELINE_FIRST_STAGE-1].inner_data_shift[0*DATA_WIDTH+:DATA_WIDTH];
                        end
                        4'b0010:
                        begin
                            output_shift_def[0].o_data_bus_reg_shift[i*DATA_WIDTH+:DATA_WIDTH] <= first_stage_def[NUM_WIRE_PIPELINE_FIRST_STAGE-1].inner_data_shift[1*DATA_WIDTH+:DATA_WIDTH];
                        end
                        4'b0100:
                        begin
                            output_shift_def[0].o_data_bus_reg_shift[i*DATA_WIDTH+:DATA_WIDTH] <= first_stage_def[NUM_WIRE_PIPELINE_FIRST_STAGE-1].inner_data_shift[2*DATA_WIDTH+:DATA_WIDTH];
                        end
                        4'b1000:
                        begin
                            output_shift_def[0].o_data_bus_reg_shift[i*DATA_WIDTH+:DATA_WIDTH] <= first_stage_def[NUM_WIRE_PIPELINE_FIRST_STAGE-1].inner_data_shift[3*DATA_WIDTH+:DATA_WIDTH];
                        end
                        default:
                        begin
                            output_shift_def[0].o_data_bus_reg_shift[i*DATA_WIDTH+:DATA_WIDTH] <= {WIDTH_OUTPUT_DATA{1'b0}};
                        end
                    endcase
                end
                else
                begin
                    output_shift_def[0].o_data_bus_reg_shift[i*DATA_WIDTH+:DATA_WIDTH] <= {WIDTH_OUTPUT_DATA{1'b0}};
                end
            end

            //valid_mux
            always@(posedge clk)
            begin:second_stage_valid
                if(first_stage_def[NUM_WIRE_PIPELINE_FIRST_STAGE-1].inner_en_shift && (~first_stage_def[NUM_WIRE_PIPELINE_FIRST_STAGE-1].inner_rst_shift))
                begin
                    case(inner_cmd_wire_second_stage)
                        4'b0001:
                        begin
                            output_shift_def[0].o_valid_reg_shift[i] <= 1'b1;
                        end
                        4'b0010:
                        begin
                            output_shift_def[0].o_valid_reg_shift[i] <= 1'b1;
                        end
                        4'b0100:
                        begin
                            output_shift_def[0].o_valid_reg_shift[i] <= 1'b1;
                        end
                        4'b1000:
                        begin
                            output_shift_def[0].o_valid_reg_shift[i] <= 1'b1;
                        end
                        default:
                        begin
                            output_shift_def[0].o_valid_reg_shift[i] <= 1'b0;
                        end
                    endcase
                end
                else
                begin
                    output_shift_def[0].o_valid_reg_shift[i] <= 1'b0;
                end
            end
        end

        for(j=1; j< NUM_OUT_WIRE_PIPELINE; j=j+1)
        begin:shift_output
            always @(posedge clk) 
            begin
                output_shift_def[j].o_valid_reg_shift <= output_shift_def[j-1].o_valid_reg_shift;
                output_shift_def[j].o_data_bus_reg_shift <=  output_shift_def[j-1].o_data_bus_reg_shift;
            end
        end 

        always @(posedge clk) 
        begin:shift_output_last
            o_valid_reg <= output_shift_def[NUM_OUT_WIRE_PIPELINE-1].o_valid_reg_shift;
            o_data_bus_reg <= output_shift_def[NUM_OUT_WIRE_PIPELINE-1].o_data_bus_reg_shift;
        end
    endgenerate

    assign o_data_bus = o_data_bus_reg;
    assign o_valid = o_valid_reg;

endmodule
`endif



`ifdef In16_Out8_pipeline_wire_pipeline_double_8_8_xbar_separate
// implement a 16-to-8 xbar as two separate 8-to-8 NoC, followed by a 2x1 MUX. 
module crossbar_one_hot_seq#(
	parameter DATA_WIDTH = 32,      // could be arbitrary number
	parameter NUM_OUTPUT_DATA  = 8, // must be power of 2.
	parameter NUM_INPUT_DATA = 16   
)(
    // timeing signals
    clk,
	rst,
	
    // data signals
	i_valid,        // valid input data signal
	i_data_bus,     // input data bus coming into distribute switch
	
	o_valid,        // output valid
    o_data_bus,     // output data 

	// control signals
	i_en,           // distribute switch enable
	i_cmd           // the input should be one-hot encoded command 
);

	//parameter
	localparam TOTAL_COMMMAND = NUM_INPUT_DATA*NUM_OUTPUT_DATA;
	
	localparam WIDTH_INPUT_DATA = NUM_INPUT_DATA*DATA_WIDTH;
	localparam WIDTH_OUTPUT_DATA = NUM_OUTPUT_DATA*DATA_WIDTH;

	localparam NUM_IN_WIRE_PIPELINE = 8;

	localparam NUM_IN_MUX_FIRST_STAGE = 4;
	localparam NUM_MUX_FIRST_STAGE = NUM_INPUT_DATA >> $clog2(NUM_IN_MUX_FIRST_STAGE);

	localparam NUM_WIRE_PIPELINE_FIRST_STAGE = 2;

	localparam NUM_IN_MUX_SECOND_STAGE = NUM_MUX_FIRST_STAGE;
	localparam NUM_MUX_SECOND_STAGE = 1;

    localparam NUM_OUT_WIRE_PIPELINE = 2;

    // interface
	input                                        clk;
	input                                        rst;
	
	input  [NUM_INPUT_DATA-1:0]                  i_valid;             
	input  [WIDTH_INPUT_DATA-1:0]                i_data_bus;
	
	output [NUM_OUTPUT_DATA-1:0]                 o_valid;             
	output [WIDTH_OUTPUT_DATA-1:0]               o_data_bus; // {o_data_a, o_data_b}

	input                                        i_en;
	input  [TOTAL_COMMMAND-1:0]                  i_cmd;

    reg    [NUM_OUTPUT_DATA-1:0]                 o_valid_reg;
    reg    [WIDTH_OUTPUT_DATA-1:0]               o_data_bus_reg;

    genvar i,j;
    generate
        // input pipeline -- divide wire into multiple pipeline stage to shorten the length of wire. 
        for(j=0; j< NUM_IN_WIRE_PIPELINE; j=j+1)
        begin:input_shift_def
            reg  [NUM_INPUT_DATA-1:0]            i_valid_shift;
            reg  [WIDTH_INPUT_DATA-1:0]          i_data_shift;
            reg  [TOTAL_COMMMAND-1:0]            i_cmd_shift;
            reg                                  i_en_shift;
            reg                                  rst_shift;
        end

        always @(posedge clk) 
        begin:shift_input_initial
            input_shift_def[0].i_valid_shift <= i_valid;
            input_shift_def[0].i_data_shift <= i_data_bus;
            input_shift_def[0].i_cmd_shift <= i_cmd;
            input_shift_def[0].i_en_shift <= i_en;
            input_shift_def[0].rst_shift <= rst;
        end

        for(j=1; j< NUM_IN_WIRE_PIPELINE; j=j+1)
        begin:shift_input
            always @(posedge clk) 
            begin
                input_shift_def[j].i_valid_shift <= input_shift_def[j-1].i_valid_shift;
                input_shift_def[j].i_data_shift <= input_shift_def[j-1].i_data_shift;
                input_shift_def[j].i_cmd_shift <= input_shift_def[j-1].i_cmd_shift;
                input_shift_def[j].i_en_shift <= input_shift_def[j-1].i_en_shift;
                input_shift_def[j].rst_shift <= input_shift_def[j-1].rst_shift;
            end
        end 

        // output pipeline  
        for(j=0; j< NUM_OUT_WIRE_PIPELINE; j=j+1)
        begin:output_shift_def
            reg    [NUM_OUTPUT_DATA-1:0]                 o_valid_reg_shift;
            reg    [WIDTH_OUTPUT_DATA-1:0]               o_data_bus_reg_shift;
        end 

        // instantiate output data mux
        for(i=0; i<NUM_OUTPUT_DATA; i=i+1)
        begin: o_data_output_mux

            for(j=0; j< NUM_WIRE_PIPELINE_FIRST_STAGE; j=j+1)
            begin:first_stage_def
                reg   [NUM_MUX_FIRST_STAGE*DATA_WIDTH-1:0]        inner_data_shift;
                reg   [NUM_MUX_FIRST_STAGE-1:0]                   inner_valid_shift;
                reg                                               inner_en_shift;
                reg                                               inner_rst_shift;
            end
            
            always @(posedge clk) 
            begin
                first_stage_def[0].inner_en_shift <= input_shift_def[NUM_IN_WIRE_PIPELINE-1].i_en_shift;
                first_stage_def[0].inner_rst_shift <= input_shift_def[NUM_IN_WIRE_PIPELINE-1].rst_shift;
            end

            for(j=1; j< NUM_WIRE_PIPELINE_FIRST_STAGE; j=j+1)
            begin:shift_input_first_stage
                always @(posedge clk)
                begin
                    first_stage_def[j].inner_valid_shift <= first_stage_def[j-1].inner_valid_shift;
                    first_stage_def[j].inner_data_shift <= first_stage_def[j-1].inner_data_shift;
                    first_stage_def[j].inner_en_shift <= first_stage_def[j-1].inner_en_shift;
                    first_stage_def[j].inner_rst_shift <= first_stage_def[j-1].inner_rst_shift;
                end
            end
            
            // first pipeline stage -- data -- 1 * 8:1 mux logic.
            for(j=0; j< NUM_MUX_FIRST_STAGE; j=j+1)
            begin:first_stage_data
                wire  [NUM_IN_MUX_FIRST_STAGE-1:0]       inner_cmd_wire;
                assign  inner_cmd_wire = {input_shift_def[NUM_IN_WIRE_PIPELINE-1].i_cmd_shift[(3+j*NUM_IN_MUX_FIRST_STAGE)*NUM_OUTPUT_DATA+i],input_shift_def[NUM_IN_WIRE_PIPELINE-1].i_cmd_shift[(2+j*NUM_IN_MUX_FIRST_STAGE)*NUM_OUTPUT_DATA+i],input_shift_def[NUM_IN_WIRE_PIPELINE-1].i_cmd_shift[(1+j*NUM_IN_MUX_FIRST_STAGE)*NUM_OUTPUT_DATA+i],input_shift_def[NUM_IN_WIRE_PIPELINE-1].i_cmd_shift[(0+j*NUM_IN_MUX_FIRST_STAGE)*NUM_OUTPUT_DATA+i]};
                always@(posedge clk)
                begin
                    if(input_shift_def[NUM_IN_WIRE_PIPELINE-1].i_en_shift && (~input_shift_def[NUM_IN_WIRE_PIPELINE-1].rst_shift))
                    begin
                        case(inner_cmd_wire)
                            4'b0001:
                            begin
                                first_stage_def[0].inner_data_shift[j*DATA_WIDTH+:DATA_WIDTH] <= (input_shift_def[NUM_IN_WIRE_PIPELINE-1].i_valid_shift[(0+j*NUM_IN_MUX_FIRST_STAGE)])?input_shift_def[NUM_IN_WIRE_PIPELINE-1].i_data_shift[(0+j*NUM_IN_MUX_FIRST_STAGE)*DATA_WIDTH+:DATA_WIDTH]:{DATA_WIDTH{1'b0}};
                            end
                            4'b0010:
                            begin
                                first_stage_def[0].inner_data_shift[j*DATA_WIDTH+:DATA_WIDTH] <= (input_shift_def[NUM_IN_WIRE_PIPELINE-1].i_valid_shift[(1+j*NUM_IN_MUX_FIRST_STAGE)])?input_shift_def[NUM_IN_WIRE_PIPELINE-1].i_data_shift[(1+j*NUM_IN_MUX_FIRST_STAGE)*DATA_WIDTH+:DATA_WIDTH]:{DATA_WIDTH{1'b0}};
                            end
                            4'b0100:
                            begin
                                first_stage_def[0].inner_data_shift[j*DATA_WIDTH+:DATA_WIDTH] <= (input_shift_def[NUM_IN_WIRE_PIPELINE-1].i_valid_shift[(2+j*NUM_IN_MUX_FIRST_STAGE)])?input_shift_def[NUM_IN_WIRE_PIPELINE-1].i_data_shift[(2+j*NUM_IN_MUX_FIRST_STAGE)*DATA_WIDTH+:DATA_WIDTH]:{DATA_WIDTH{1'b0}};
                            end
                            4'b1000:
                            begin
                                first_stage_def[0].inner_data_shift[j*DATA_WIDTH+:DATA_WIDTH] <= (input_shift_def[NUM_IN_WIRE_PIPELINE-1].i_valid_shift[(3+j*NUM_IN_MUX_FIRST_STAGE)])?input_shift_def[NUM_IN_WIRE_PIPELINE-1].i_data_shift[(3+j*NUM_IN_MUX_FIRST_STAGE)*DATA_WIDTH+:DATA_WIDTH]:{DATA_WIDTH{1'b0}};
                            end
                            default:
                            begin
                                first_stage_def[0].inner_data_shift[j*DATA_WIDTH+:DATA_WIDTH] <= {DATA_WIDTH{1'b0}};
                            end
                        endcase
                    end
                    else
                    begin
                        first_stage_def[0].inner_data_shift[j*DATA_WIDTH+:DATA_WIDTH] <= {DATA_WIDTH{1'b0}};
                    end
                end
            end

            // first pipeline stage -- valid -- 4 * 4:1 mux logic.
            for(j=0; j< NUM_MUX_FIRST_STAGE; j=j+1)
            begin:first_stage_valid
                wire  [NUM_IN_MUX_FIRST_STAGE-1:0]       inner_cmd_wire_valid;
                assign  inner_cmd_wire_valid = {input_shift_def[NUM_IN_WIRE_PIPELINE-1].i_cmd_shift[(3+j*NUM_IN_MUX_FIRST_STAGE)*NUM_OUTPUT_DATA+i],input_shift_def[NUM_IN_WIRE_PIPELINE-1].i_cmd_shift[(2+j*NUM_IN_MUX_FIRST_STAGE)*NUM_OUTPUT_DATA+i],input_shift_def[NUM_IN_WIRE_PIPELINE-1].i_cmd_shift[(1+j*NUM_IN_MUX_FIRST_STAGE)*NUM_OUTPUT_DATA+i],input_shift_def[NUM_IN_WIRE_PIPELINE-1].i_cmd_shift[(j*NUM_IN_MUX_FIRST_STAGE)*NUM_OUTPUT_DATA+i]};
                always@(posedge clk)
                begin
                    if(input_shift_def[NUM_IN_WIRE_PIPELINE-1].i_en_shift && (~input_shift_def[NUM_IN_WIRE_PIPELINE-1].rst_shift))
                    begin
                        case(inner_cmd_wire_valid)
                            4'b0001:
                            begin
                                first_stage_def[0].inner_valid_shift[j] <= (input_shift_def[NUM_IN_WIRE_PIPELINE-1].i_valid_shift[0+j*NUM_IN_MUX_FIRST_STAGE])?1'b1:1'b0;
                            end
                            4'b0010:
                            begin
                                first_stage_def[0].inner_valid_shift[j] <= (input_shift_def[NUM_IN_WIRE_PIPELINE-1].i_valid_shift[1+j*NUM_IN_MUX_FIRST_STAGE])?1'b1:1'b0;
                            end
                            4'b0100:
                            begin
                                first_stage_def[0].inner_valid_shift[j] <= (input_shift_def[NUM_IN_WIRE_PIPELINE-1].i_valid_shift[2+j*NUM_IN_MUX_FIRST_STAGE])?1'b1:1'b0;
                            end
                            4'b1000:
                            begin
                                first_stage_def[0].inner_valid_shift[j] <= (input_shift_def[NUM_IN_WIRE_PIPELINE-1].i_valid_shift[3+j*NUM_IN_MUX_FIRST_STAGE])?1'b1:1'b0;
                            end
                            default:
                            begin
                                first_stage_def[0].inner_valid_shift[j] <= 1'b0;
                            end
                        endcase
                    end
                    else
                    begin
                        first_stage_def[0].inner_valid_shift[j] <= 1'b0; 
                    end
                end
            end

            wire  [NUM_IN_MUX_SECOND_STAGE-1:0]  inner_cmd_wire_second_stage;
            assign inner_cmd_wire_second_stage = {first_stage_def[NUM_WIRE_PIPELINE_FIRST_STAGE-1].inner_valid_shift};

            //data_mux
            always@(posedge clk)
            begin:second_stage_data
                if(first_stage_def[NUM_WIRE_PIPELINE_FIRST_STAGE-1].inner_en_shift && (~first_stage_def[NUM_WIRE_PIPELINE_FIRST_STAGE-1].inner_rst_shift))
                begin
                    case(inner_cmd_wire_second_stage)
                        4'b0001:
                        begin
                            output_shift_def[0].o_data_bus_reg_shift[i*DATA_WIDTH+:DATA_WIDTH] <= first_stage_def[NUM_WIRE_PIPELINE_FIRST_STAGE-1].inner_data_shift[0*DATA_WIDTH+:DATA_WIDTH];
                        end
                        4'b0010:
                        begin
                            output_shift_def[0].o_data_bus_reg_shift[i*DATA_WIDTH+:DATA_WIDTH] <= first_stage_def[NUM_WIRE_PIPELINE_FIRST_STAGE-1].inner_data_shift[1*DATA_WIDTH+:DATA_WIDTH];
                        end
                        4'b0100:
                        begin
                            output_shift_def[0].o_data_bus_reg_shift[i*DATA_WIDTH+:DATA_WIDTH] <= first_stage_def[NUM_WIRE_PIPELINE_FIRST_STAGE-1].inner_data_shift[2*DATA_WIDTH+:DATA_WIDTH];
                        end
                        4'b1000:
                        begin
                            output_shift_def[0].o_data_bus_reg_shift[i*DATA_WIDTH+:DATA_WIDTH] <= first_stage_def[NUM_WIRE_PIPELINE_FIRST_STAGE-1].inner_data_shift[3*DATA_WIDTH+:DATA_WIDTH];
                        end
                        default:
                        begin
                            output_shift_def[0].o_data_bus_reg_shift[i*DATA_WIDTH+:DATA_WIDTH] <= {WIDTH_OUTPUT_DATA{1'b0}};
                        end
                    endcase
                end
                else
                begin
                    output_shift_def[0].o_data_bus_reg_shift[i*DATA_WIDTH+:DATA_WIDTH] <= {WIDTH_OUTPUT_DATA{1'b0}};
                end
            end

            //valid_mux
            always@(posedge clk)
            begin:second_stage_valid
                if(first_stage_def[NUM_WIRE_PIPELINE_FIRST_STAGE-1].inner_en_shift && (~first_stage_def[NUM_WIRE_PIPELINE_FIRST_STAGE-1].inner_rst_shift))
                begin
                    case(inner_cmd_wire_second_stage)
                        4'b0001:
                        begin
                            output_shift_def[0].o_valid_reg_shift[i] <= 1'b1;
                        end
                        4'b0010:
                        begin
                            output_shift_def[0].o_valid_reg_shift[i] <= 1'b1;
                        end
                        4'b0100:
                        begin
                            output_shift_def[0].o_valid_reg_shift[i] <= 1'b1;
                        end
                        4'b1000:
                        begin
                            output_shift_def[0].o_valid_reg_shift[i] <= 1'b1;
                        end
                        default:
                        begin
                            output_shift_def[0].o_valid_reg_shift[i] <= 1'b0;
                        end
                    endcase
                end
                else
                begin
                    output_shift_def[0].o_valid_reg_shift[i] <= 1'b0;
                end
            end
        end

        for(j=1; j< NUM_OUT_WIRE_PIPELINE; j=j+1)
        begin:shift_output
            always @(posedge clk) 
            begin
                output_shift_def[j].o_valid_reg_shift <= output_shift_def[j-1].o_valid_reg_shift;
                output_shift_def[j].o_data_bus_reg_shift <=  output_shift_def[j-1].o_data_bus_reg_shift;
            end
        end 

        always @(posedge clk) 
        begin:shift_output_last
            o_valid_reg <= output_shift_def[NUM_OUT_WIRE_PIPELINE-1].o_valid_reg_shift;
            o_data_bus_reg <= output_shift_def[NUM_OUT_WIRE_PIPELINE-1].o_data_bus_reg_shift;
        end
    endgenerate

    assign o_data_bus = o_data_bus_reg;
    assign o_valid = o_valid_reg;

endmodule
`endif

`ifdef In16_Out8_pipeline_wire
module crossbar_one_hot_seq#(
	parameter DATA_WIDTH = 32,      // could be arbitrary number
	parameter NUM_OUTPUT_DATA  = 8, // must be power of 2.
	parameter NUM_INPUT_DATA = 16   
)(
    // timeing signals
    clk,
	rst,
	
    // data signals
	i_valid,        // valid input data signal
	i_data_bus,     // input data bus coming into distribute switch
	
	o_valid,        // output valid
    o_data_bus,     // output data 

	// control signals
	i_en,           // distribute switch enable
	i_cmd           // the input should be one-hot encoded command 
);

	//parameter
	localparam TOTAL_COMMMAND = NUM_INPUT_DATA*NUM_OUTPUT_DATA;
	
	localparam WIDTH_INPUT_DATA = NUM_INPUT_DATA*DATA_WIDTH;
	localparam WIDTH_OUTPUT_DATA = NUM_OUTPUT_DATA*DATA_WIDTH;

	localparam NUM_IN_WIRE_PIPELINE = 7;
    // interface
	input                                        clk;
	input                                        rst;
	
	input  [NUM_INPUT_DATA-1:0]                  i_valid;             
	input  [WIDTH_INPUT_DATA-1:0]                i_data_bus;
	
	output [NUM_OUTPUT_DATA-1:0]                 o_valid;             
	output [WIDTH_OUTPUT_DATA-1:0]               o_data_bus; // {o_data_a, o_data_b}

	input                                        i_en;
	input  [TOTAL_COMMMAND-1:0]                  i_cmd;

    reg    [NUM_OUTPUT_DATA-1:0]                 o_valid_reg;
    reg    [WIDTH_OUTPUT_DATA-1:0]               o_data_bus_reg;

    genvar i,j;
    generate
        for(i=0; i< NUM_IN_WIRE_PIPELINE; i=i+1)
        begin:input_shift_def
            reg  [NUM_INPUT_DATA-1:0]            i_valid_shift;
            reg  [WIDTH_INPUT_DATA-1:0]          i_data_shift;
            reg  [TOTAL_COMMMAND-1:0]            i_cmd_shift;
            reg                                  i_en_shift;
            reg                                  rst_shift;
        end 

        always @(posedge clk) 
        begin:shift_first
            input_shift_def[0].i_valid_shift <= i_valid;
            input_shift_def[0].i_data_shift <= i_data_bus;
            input_shift_def[0].i_cmd_shift <= i_cmd;
            input_shift_def[0].i_en_shift <= i_en;
            input_shift_def[0].rst_shift <= rst;
        end

        for(i=1; i< NUM_IN_WIRE_PIPELINE; i=i+1)
        begin:input_shift
            always @(posedge clk) 
            begin
                input_shift_def[i].i_valid_shift <= input_shift_def[i-1].i_valid_shift;
                input_shift_def[i].i_data_shift <= input_shift_def[i-1].i_data_shift;
                input_shift_def[i].i_cmd_shift <= input_shift_def[i-1].i_cmd_shift;
                input_shift_def[i].i_en_shift <= input_shift_def[i-1].i_en_shift;
                input_shift_def[i].rst_shift <= input_shift_def[i-1].rst_shift;
            end
        end 

        for(i=0; i<NUM_OUTPUT_DATA; i=i+1)
        begin: o_data_output_mux
            wire [NUM_INPUT_DATA-1:0] inner_cmd_wire;
            assign inner_cmd_wire = {input_shift_def[NUM_IN_WIRE_PIPELINE-1].i_cmd_shift[15*NUM_OUTPUT_DATA+i],input_shift_def[NUM_IN_WIRE_PIPELINE-1].i_cmd_shift[14*NUM_OUTPUT_DATA+i],input_shift_def[NUM_IN_WIRE_PIPELINE-1].i_cmd_shift[13*NUM_OUTPUT_DATA+i],input_shift_def[NUM_IN_WIRE_PIPELINE-1].i_cmd_shift[12*NUM_OUTPUT_DATA+i],input_shift_def[NUM_IN_WIRE_PIPELINE-1].i_cmd_shift[11*NUM_OUTPUT_DATA+i],input_shift_def[NUM_IN_WIRE_PIPELINE-1].i_cmd_shift[10*NUM_OUTPUT_DATA+i],input_shift_def[NUM_IN_WIRE_PIPELINE-1].i_cmd_shift[9*NUM_OUTPUT_DATA+i],input_shift_def[NUM_IN_WIRE_PIPELINE-1].i_cmd_shift[8*NUM_OUTPUT_DATA+i],input_shift_def[NUM_IN_WIRE_PIPELINE-1].i_cmd_shift[7*NUM_OUTPUT_DATA+i],input_shift_def[NUM_IN_WIRE_PIPELINE-1].i_cmd_shift[6*NUM_OUTPUT_DATA+i],input_shift_def[NUM_IN_WIRE_PIPELINE-1].i_cmd_shift[5*NUM_OUTPUT_DATA+i],input_shift_def[NUM_IN_WIRE_PIPELINE-1].i_cmd_shift[4*NUM_OUTPUT_DATA+i],input_shift_def[NUM_IN_WIRE_PIPELINE-1].i_cmd_shift[3*NUM_OUTPUT_DATA+i],input_shift_def[NUM_IN_WIRE_PIPELINE-1].i_cmd_shift[2*NUM_OUTPUT_DATA+i],input_shift_def[NUM_IN_WIRE_PIPELINE-1].i_cmd_shift[1*NUM_OUTPUT_DATA+i],input_shift_def[NUM_IN_WIRE_PIPELINE-1].i_cmd_shift[0*NUM_OUTPUT_DATA+i]};
            
            //data_mux
            always@(posedge clk)
            begin
                if(input_shift_def[NUM_IN_WIRE_PIPELINE-1].i_en_shift && (~input_shift_def[NUM_IN_WIRE_PIPELINE-1].rst_shift))
                begin
                    case(inner_cmd_wire)
                        16'b0000000000000001:
                        begin
                            o_data_bus_reg[i*DATA_WIDTH+:DATA_WIDTH] <= (input_shift_def[NUM_IN_WIRE_PIPELINE-1].i_valid_shift[0])?input_shift_def[NUM_IN_WIRE_PIPELINE-1].i_data_shift[0*DATA_WIDTH+:DATA_WIDTH]:{DATA_WIDTH{1'b0}};
                        end
                        16'b0000000000000010:
                        begin
                            o_data_bus_reg[i*DATA_WIDTH+:DATA_WIDTH] <= (input_shift_def[NUM_IN_WIRE_PIPELINE-1].i_valid_shift[1])?input_shift_def[NUM_IN_WIRE_PIPELINE-1].i_data_shift[1*DATA_WIDTH+:DATA_WIDTH]:{DATA_WIDTH{1'b0}};
                        end
                        16'b0000000000000100:
                        begin
                            o_data_bus_reg[i*DATA_WIDTH+:DATA_WIDTH] <= (input_shift_def[NUM_IN_WIRE_PIPELINE-1].i_valid_shift[2])?input_shift_def[NUM_IN_WIRE_PIPELINE-1].i_data_shift[2*DATA_WIDTH+:DATA_WIDTH]:{DATA_WIDTH{1'b0}};
                        end
                        16'b0000000000001000:
                        begin
                            o_data_bus_reg[i*DATA_WIDTH+:DATA_WIDTH] <= (input_shift_def[NUM_IN_WIRE_PIPELINE-1].i_valid_shift[3])?input_shift_def[NUM_IN_WIRE_PIPELINE-1].i_data_shift[3*DATA_WIDTH+:DATA_WIDTH]:{DATA_WIDTH{1'b0}};
                        end
                        16'b0000000000010000:
                        begin
                            o_data_bus_reg[i*DATA_WIDTH+:DATA_WIDTH] <= (input_shift_def[NUM_IN_WIRE_PIPELINE-1].i_valid_shift[4])?input_shift_def[NUM_IN_WIRE_PIPELINE-1].i_data_shift[4*DATA_WIDTH+:DATA_WIDTH]:{DATA_WIDTH{1'b0}};
                        end
                        16'b0000000000100000:
                        begin
                            o_data_bus_reg[i*DATA_WIDTH+:DATA_WIDTH] <= (input_shift_def[NUM_IN_WIRE_PIPELINE-1].i_valid_shift[5])?input_shift_def[NUM_IN_WIRE_PIPELINE-1].i_data_shift[5*DATA_WIDTH+:DATA_WIDTH]:{DATA_WIDTH{1'b0}};
                        end
                        16'b0000000001000000:
                        begin
                            o_data_bus_reg[i*DATA_WIDTH+:DATA_WIDTH] <= (input_shift_def[NUM_IN_WIRE_PIPELINE-1].i_valid_shift[6])?input_shift_def[NUM_IN_WIRE_PIPELINE-1].i_data_shift[6*DATA_WIDTH+:DATA_WIDTH]:{DATA_WIDTH{1'b0}};
                        end
                        16'b0000000010000000:
                        begin
                            o_data_bus_reg[i*DATA_WIDTH+:DATA_WIDTH] <= (input_shift_def[NUM_IN_WIRE_PIPELINE-1].i_valid_shift[7])?input_shift_def[NUM_IN_WIRE_PIPELINE-1].i_data_shift[7*DATA_WIDTH+:DATA_WIDTH]:{DATA_WIDTH{1'b0}};
                        end
                        16'b0000000100000000:
                        begin
                            o_data_bus_reg[i*DATA_WIDTH+:DATA_WIDTH] <= (input_shift_def[NUM_IN_WIRE_PIPELINE-1].i_valid_shift[8])?input_shift_def[NUM_IN_WIRE_PIPELINE-1].i_data_shift[8*DATA_WIDTH+:DATA_WIDTH]:{DATA_WIDTH{1'b0}};
                        end
                        16'b0000001000000000:
                        begin
                            o_data_bus_reg[i*DATA_WIDTH+:DATA_WIDTH] <= (input_shift_def[NUM_IN_WIRE_PIPELINE-1].i_valid_shift[9])?input_shift_def[NUM_IN_WIRE_PIPELINE-1].i_data_shift[9*DATA_WIDTH+:DATA_WIDTH]:{DATA_WIDTH{1'b0}};
                        end
                        16'b0000010000000000:
                        begin
                            o_data_bus_reg[i*DATA_WIDTH+:DATA_WIDTH] <= (input_shift_def[NUM_IN_WIRE_PIPELINE-1].i_valid_shift[10])?input_shift_def[NUM_IN_WIRE_PIPELINE-1].i_data_shift[10*DATA_WIDTH+:DATA_WIDTH]:{DATA_WIDTH{1'b0}};
                        end
                        16'b0000100000000000:
                        begin
                            o_data_bus_reg[i*DATA_WIDTH+:DATA_WIDTH] <= (input_shift_def[NUM_IN_WIRE_PIPELINE-1].i_valid_shift[11])?input_shift_def[NUM_IN_WIRE_PIPELINE-1].i_data_shift[11*DATA_WIDTH+:DATA_WIDTH]:{DATA_WIDTH{1'b0}};
                        end
                        16'b0001000000000000:
                        begin
                            o_data_bus_reg[i*DATA_WIDTH+:DATA_WIDTH] <= (input_shift_def[NUM_IN_WIRE_PIPELINE-1].i_valid_shift[12])?input_shift_def[NUM_IN_WIRE_PIPELINE-1].i_data_shift[12*DATA_WIDTH+:DATA_WIDTH]:{DATA_WIDTH{1'b0}};
                        end
                        16'b0010000000000000:
                        begin
                            o_data_bus_reg[i*DATA_WIDTH+:DATA_WIDTH] <= (input_shift_def[NUM_IN_WIRE_PIPELINE-1].i_valid_shift[13])?input_shift_def[NUM_IN_WIRE_PIPELINE-1].i_data_shift[13*DATA_WIDTH+:DATA_WIDTH]:{DATA_WIDTH{1'b0}};
                        end
                        16'b0100000000000000:
                        begin
                            o_data_bus_reg[i*DATA_WIDTH+:DATA_WIDTH] <= (input_shift_def[NUM_IN_WIRE_PIPELINE-1].i_valid_shift[14])?input_shift_def[NUM_IN_WIRE_PIPELINE-1].i_data_shift[14*DATA_WIDTH+:DATA_WIDTH]:{DATA_WIDTH{1'b0}};
                        end
                        16'b1000000000000000:
                        begin
                            o_data_bus_reg[i*DATA_WIDTH+:DATA_WIDTH] <= (input_shift_def[NUM_IN_WIRE_PIPELINE-1].i_valid_shift[15])?input_shift_def[NUM_IN_WIRE_PIPELINE-1].i_data_shift[15*DATA_WIDTH+:DATA_WIDTH]:{DATA_WIDTH{1'b0}};
                        end
                        default:
                        begin
                            o_data_bus_reg[i*DATA_WIDTH+:DATA_WIDTH] <= {WIDTH_OUTPUT_DATA{1'b0}};
                        end
                    endcase
                end
                else
                begin
                    o_data_bus_reg[i*DATA_WIDTH+:DATA_WIDTH] <= {WIDTH_OUTPUT_DATA{1'b0}};
                end
            end

            //valid_mux
            always@(posedge clk)
            begin
                if(input_shift_def[NUM_IN_WIRE_PIPELINE-1].i_en_shift && (~input_shift_def[NUM_IN_WIRE_PIPELINE-1].rst_shift))
                begin
                    case(inner_cmd_wire)
                        16'b0000000000000001:
                        begin
                            o_valid_reg[i] <= (input_shift_def[NUM_IN_WIRE_PIPELINE-1].i_valid_shift[0])?1'b1:1'b0;
                        end
                        16'b0000000000000010:
                        begin
                            o_valid_reg[i] <= (input_shift_def[NUM_IN_WIRE_PIPELINE-1].i_valid_shift[1])?1'b1:1'b0;
                        end
                        16'b0000000000000100:
                        begin
                            o_valid_reg[i] <= (input_shift_def[NUM_IN_WIRE_PIPELINE-1].i_valid_shift[2])?1'b1:1'b0;
                        end
                        16'b0000000000001000:
                        begin
                            o_valid_reg[i] <= (input_shift_def[NUM_IN_WIRE_PIPELINE-1].i_valid_shift[3])?1'b1:1'b0;
                        end
                        16'b0000000000010000:
                        begin
                            o_valid_reg[i] <= (input_shift_def[NUM_IN_WIRE_PIPELINE-1].i_valid_shift[4])?1'b1:1'b0;
                        end
                        16'b0000000000100000:
                        begin
                            o_valid_reg[i] <= (input_shift_def[NUM_IN_WIRE_PIPELINE-1].i_valid_shift[5])?1'b1:1'b0;
                        end
                        16'b0000000001000000:
                        begin
                            o_valid_reg[i] <= (input_shift_def[NUM_IN_WIRE_PIPELINE-1].i_valid_shift[6])?1'b1:1'b0;
                        end
                        16'b0000000010000000:
                        begin
                            o_valid_reg[i] <= (input_shift_def[NUM_IN_WIRE_PIPELINE-1].i_valid_shift[7])?1'b1:1'b0;
                        end
                        16'b0000000100000000:
                        begin
                            o_valid_reg[i] <= (input_shift_def[NUM_IN_WIRE_PIPELINE-1].i_valid_shift[8])?1'b1:1'b0;
                        end
                        16'b0000001000000000:
                        begin
                            o_valid_reg[i] <= (input_shift_def[NUM_IN_WIRE_PIPELINE-1].i_valid_shift[9])?1'b1:1'b0;
                        end
                        16'b0000010000000000:
                        begin
                            o_valid_reg[i] <= (input_shift_def[NUM_IN_WIRE_PIPELINE-1].i_valid_shift[10])?1'b1:1'b0;
                        end
                        16'b0000100000000000:
                        begin
                            o_valid_reg[i] <= (input_shift_def[NUM_IN_WIRE_PIPELINE-1].i_valid_shift[11])?1'b1:1'b0;
                        end
                        16'b0001000000000000:
                        begin
                            o_valid_reg[i] <= (input_shift_def[NUM_IN_WIRE_PIPELINE-1].i_valid_shift[12])?1'b1:1'b0;
                        end
                        16'b0010000000000000:
                        begin
                            o_valid_reg[i] <= (input_shift_def[NUM_IN_WIRE_PIPELINE-1].i_valid_shift[13])?1'b1:1'b0;
                        end
                        16'b0100000000000000:
                        begin
                            o_valid_reg[i] <= (input_shift_def[NUM_IN_WIRE_PIPELINE-1].i_valid_shift[14])?1'b1:1'b0;
                        end
                        16'b1000000000000000:
                        begin
                            o_valid_reg[i] <= (input_shift_def[NUM_IN_WIRE_PIPELINE-1].i_valid_shift[15])?1'b1:1'b0;
                        end
                        default:
                        begin
                            o_valid_reg[i] <= 1'b0;
                        end
                    endcase
                end
                else
                begin
                    o_valid_reg[i] <= 1'b0;
                end
            end
        end
    endgenerate

    assign o_data_bus = o_data_bus_reg;
    assign o_valid = o_valid_reg;

endmodule
`endif

`ifdef In64_Out8
module crossbar_one_hot_seq#(
	parameter DATA_WIDTH = 32,      // could be arbitrary number
	parameter NUM_OUTPUT_DATA  = 8, // must be power of 2.
	parameter NUM_INPUT_DATA = 64   
)(
    // timeing signals
    clk,
	rst,
	
    // data signals
	i_valid,        // valid input data signal
	i_data_bus,     // input data bus coming into distribute switch
	
	o_valid,        // output valid
    o_data_bus,     // output data 

	// control signals
	i_en,           // distribute switch enable
	i_cmd           // the input should be one-hot encoded command 
);
	//parameter
	localparam TOTAL_COMMMAND = NUM_INPUT_DATA*NUM_OUTPUT_DATA;
	
	localparam WIDTH_INPUT_DATA = NUM_INPUT_DATA*DATA_WIDTH;
	localparam WIDTH_OUTPUT_DATA = NUM_OUTPUT_DATA*DATA_WIDTH;
	
    // interface
	input                                        clk;
	input                                        rst;

	input  [NUM_INPUT_DATA-1:0]                  i_valid;             
	input  [WIDTH_INPUT_DATA-1:0]                i_data_bus;
	
	output [NUM_OUTPUT_DATA-1:0]                 o_valid;             
	output [WIDTH_OUTPUT_DATA-1:0]               o_data_bus; // {o_data_a, o_data_b}

	input                                        i_en;
	input  [TOTAL_COMMMAND-1:0]                  i_cmd;

    reg    [NUM_OUTPUT_DATA-1:0]                 o_valid_reg;
    reg    [WIDTH_OUTPUT_DATA-1:0]               o_data_bus_reg;

    genvar i,j;
    generate
        for(i=0; i<NUM_OUTPUT_DATA; i=i+1)
        begin: o_data_output_mux
            wire [NUM_INPUT_DATA-1:0] inner_cmd_wire;
            assign inner_cmd_wire = {i_cmd[63*NUM_OUTPUT_DATA+i],i_cmd[62*NUM_OUTPUT_DATA+i],i_cmd[61*NUM_OUTPUT_DATA+i],i_cmd[60*NUM_OUTPUT_DATA+i],i_cmd[59*NUM_OUTPUT_DATA+i],i_cmd[58*NUM_OUTPUT_DATA+i],i_cmd[57*NUM_OUTPUT_DATA+i],i_cmd[56*NUM_OUTPUT_DATA+i],i_cmd[55*NUM_OUTPUT_DATA+i],i_cmd[54*NUM_OUTPUT_DATA+i],i_cmd[53*NUM_OUTPUT_DATA+i],i_cmd[52*NUM_OUTPUT_DATA+i],i_cmd[51*NUM_OUTPUT_DATA+i],i_cmd[50*NUM_OUTPUT_DATA+i],i_cmd[49*NUM_OUTPUT_DATA+i],i_cmd[48*NUM_OUTPUT_DATA+i],i_cmd[47*NUM_OUTPUT_DATA+i],i_cmd[46*NUM_OUTPUT_DATA+i],i_cmd[45*NUM_OUTPUT_DATA+i],i_cmd[44*NUM_OUTPUT_DATA+i],i_cmd[43*NUM_OUTPUT_DATA+i],i_cmd[42*NUM_OUTPUT_DATA+i],i_cmd[41*NUM_OUTPUT_DATA+i],i_cmd[40*NUM_OUTPUT_DATA+i],i_cmd[39*NUM_OUTPUT_DATA+i],i_cmd[38*NUM_OUTPUT_DATA+i],i_cmd[37*NUM_OUTPUT_DATA+i],i_cmd[36*NUM_OUTPUT_DATA+i],i_cmd[35*NUM_OUTPUT_DATA+i],i_cmd[34*NUM_OUTPUT_DATA+i],i_cmd[33*NUM_OUTPUT_DATA+i],i_cmd[32*NUM_OUTPUT_DATA+i],i_cmd[31*NUM_OUTPUT_DATA+i],i_cmd[30*NUM_OUTPUT_DATA+i],i_cmd[29*NUM_OUTPUT_DATA+i],i_cmd[28*NUM_OUTPUT_DATA+i],i_cmd[27*NUM_OUTPUT_DATA+i],i_cmd[26*NUM_OUTPUT_DATA+i],i_cmd[25*NUM_OUTPUT_DATA+i],i_cmd[24*NUM_OUTPUT_DATA+i],i_cmd[23*NUM_OUTPUT_DATA+i],i_cmd[22*NUM_OUTPUT_DATA+i],i_cmd[21*NUM_OUTPUT_DATA+i],i_cmd[20*NUM_OUTPUT_DATA+i],i_cmd[19*NUM_OUTPUT_DATA+i],i_cmd[18*NUM_OUTPUT_DATA+i],i_cmd[17*NUM_OUTPUT_DATA+i],i_cmd[16*NUM_OUTPUT_DATA+i],i_cmd[15*NUM_OUTPUT_DATA+i],i_cmd[14*NUM_OUTPUT_DATA+i],i_cmd[13*NUM_OUTPUT_DATA+i],i_cmd[12*NUM_OUTPUT_DATA+i],i_cmd[11*NUM_OUTPUT_DATA+i],i_cmd[10*NUM_OUTPUT_DATA+i],i_cmd[9*NUM_OUTPUT_DATA+i],i_cmd[8*NUM_OUTPUT_DATA+i],i_cmd[7*NUM_OUTPUT_DATA+i],i_cmd[6*NUM_OUTPUT_DATA+i],i_cmd[5*NUM_OUTPUT_DATA+i],i_cmd[4*NUM_OUTPUT_DATA+i],i_cmd[3*NUM_OUTPUT_DATA+i],i_cmd[2*NUM_OUTPUT_DATA+i],i_cmd[1*NUM_OUTPUT_DATA+i],i_cmd[0*NUM_OUTPUT_DATA+i]};
            always@(posedge clk)
            begin
                if(i_en && (~rst))
                begin
                    case(inner_cmd_wire)
                        64'b0000000000000000000000000000000000000000000000000000000000000001:
                        begin
                            o_data_bus_reg[i*DATA_WIDTH+:DATA_WIDTH] <= (i_valid[0])?i_data_bus[0*DATA_WIDTH+:DATA_WIDTH]:{DATA_WIDTH{1'b0}};
                            o_valid_reg[i] <= 1'b1;
                        end
                        64'b0000000000000000000000000000000000000000000000000000000000000010:
                        begin
                            o_data_bus_reg[i*DATA_WIDTH+:DATA_WIDTH] <= (i_valid[1])?i_data_bus[1*DATA_WIDTH+:DATA_WIDTH]:{DATA_WIDTH{1'b0}};
                            o_valid_reg[i] <= 1'b1;
                        end
                        64'b0000000000000000000000000000000000000000000000000000000000000100:
                        begin
                            o_data_bus_reg[i*DATA_WIDTH+:DATA_WIDTH] <= (i_valid[2])?i_data_bus[2*DATA_WIDTH+:DATA_WIDTH]:{DATA_WIDTH{1'b0}};
                            o_valid_reg[i] <= 1'b1;
                        end
                        64'b0000000000000000000000000000000000000000000000000000000000001000:
                        begin
                            o_data_bus_reg[i*DATA_WIDTH+:DATA_WIDTH] <= (i_valid[3])?i_data_bus[3*DATA_WIDTH+:DATA_WIDTH]:{DATA_WIDTH{1'b0}};
                            o_valid_reg[i] <= 1'b1;
                        end
                        64'b0000000000000000000000000000000000000000000000000000000000010000:
                        begin
                            o_data_bus_reg[i*DATA_WIDTH+:DATA_WIDTH] <= (i_valid[4])?i_data_bus[4*DATA_WIDTH+:DATA_WIDTH]:{DATA_WIDTH{1'b0}};
                            o_valid_reg[i] <= 1'b1;
                        end
                        64'b0000000000000000000000000000000000000000000000000000000000100000:
                        begin
                            o_data_bus_reg[i*DATA_WIDTH+:DATA_WIDTH] <= (i_valid[5])?i_data_bus[5*DATA_WIDTH+:DATA_WIDTH]:{DATA_WIDTH{1'b0}};
                            o_valid_reg[i] <= 1'b1;
                        end
                        64'b0000000000000000000000000000000000000000000000000000000001000000:
                        begin
                            o_data_bus_reg[i*DATA_WIDTH+:DATA_WIDTH] <= (i_valid[6])?i_data_bus[6*DATA_WIDTH+:DATA_WIDTH]:{DATA_WIDTH{1'b0}};
                            o_valid_reg[i] <= 1'b1;
                        end
                        64'b0000000000000000000000000000000000000000000000000000000010000000:
                        begin
                            o_data_bus_reg[i*DATA_WIDTH+:DATA_WIDTH] <= (i_valid[7])?i_data_bus[7*DATA_WIDTH+:DATA_WIDTH]:{DATA_WIDTH{1'b0}};
                            o_valid_reg[i] <= 1'b1;
                        end
                        64'b0000000000000000000000000000000000000000000000000000000100000000:
                        begin
                            o_data_bus_reg[i*DATA_WIDTH+:DATA_WIDTH] <= (i_valid[8])?i_data_bus[8*DATA_WIDTH+:DATA_WIDTH]:{DATA_WIDTH{1'b0}};
                            o_valid_reg[i] <= 1'b1;
                        end
                        64'b0000000000000000000000000000000000000000000000000000001000000000:
                        begin
                            o_data_bus_reg[i*DATA_WIDTH+:DATA_WIDTH] <= (i_valid[9])?i_data_bus[9*DATA_WIDTH+:DATA_WIDTH]:{DATA_WIDTH{1'b0}};
                            o_valid_reg[i] <= 1'b1;
                        end
                        64'b0000000000000000000000000000000000000000000000000000010000000000:
                        begin
                            o_data_bus_reg[i*DATA_WIDTH+:DATA_WIDTH] <= (i_valid[10])?i_data_bus[10*DATA_WIDTH+:DATA_WIDTH]:{DATA_WIDTH{1'b0}};
                            o_valid_reg[i] <= 1'b1;
                        end
                        64'b0000000000000000000000000000000000000000000000000000100000000000:
                        begin
                            o_data_bus_reg[i*DATA_WIDTH+:DATA_WIDTH] <= (i_valid[11])?i_data_bus[11*DATA_WIDTH+:DATA_WIDTH]:{DATA_WIDTH{1'b0}};
                            o_valid_reg[i] <= 1'b1;
                        end
                        64'b0000000000000000000000000000000000000000000000000001000000000000:
                        begin
                            o_data_bus_reg[i*DATA_WIDTH+:DATA_WIDTH] <= (i_valid[12])?i_data_bus[12*DATA_WIDTH+:DATA_WIDTH]:{DATA_WIDTH{1'b0}};
                            o_valid_reg[i] <= 1'b1;
                        end
                        64'b0000000000000000000000000000000000000000000000000010000000000000:
                        begin
                            o_data_bus_reg[i*DATA_WIDTH+:DATA_WIDTH] <= (i_valid[13])?i_data_bus[13*DATA_WIDTH+:DATA_WIDTH]:{DATA_WIDTH{1'b0}};
                            o_valid_reg[i] <= 1'b1;
                        end
                        64'b0000000000000000000000000000000000000000000000000100000000000000:
                        begin
                            o_data_bus_reg[i*DATA_WIDTH+:DATA_WIDTH] <= (i_valid[14])?i_data_bus[14*DATA_WIDTH+:DATA_WIDTH]:{DATA_WIDTH{1'b0}};
                            o_valid_reg[i] <= 1'b1;
                        end
                        64'b0000000000000000000000000000000000000000000000001000000000000000:
                        begin
                            o_data_bus_reg[i*DATA_WIDTH+:DATA_WIDTH] <= (i_valid[15])?i_data_bus[15*DATA_WIDTH+:DATA_WIDTH]:{DATA_WIDTH{1'b0}};
                            o_valid_reg[i] <= 1'b1;
                        end
                        64'b0000000000000000000000000000000000000000000000010000000000000000:
                        begin
                            o_data_bus_reg[i*DATA_WIDTH+:DATA_WIDTH] <= (i_valid[16])?i_data_bus[16*DATA_WIDTH+:DATA_WIDTH]:{DATA_WIDTH{1'b0}};
                            o_valid_reg[i] <= 1'b1;
                        end
                        64'b0000000000000000000000000000000000000000000000100000000000000000:
                        begin
                            o_data_bus_reg[i*DATA_WIDTH+:DATA_WIDTH] <= (i_valid[17])?i_data_bus[17*DATA_WIDTH+:DATA_WIDTH]:{DATA_WIDTH{1'b0}};
                            o_valid_reg[i] <= 1'b1;
                        end
                        64'b0000000000000000000000000000000000000000000001000000000000000000:
                        begin
                            o_data_bus_reg[i*DATA_WIDTH+:DATA_WIDTH] <= (i_valid[18])?i_data_bus[18*DATA_WIDTH+:DATA_WIDTH]:{DATA_WIDTH{1'b0}};
                            o_valid_reg[i] <= 1'b1;
                        end
                        64'b0000000000000000000000000000000000000000000010000000000000000000:
                        begin
                            o_data_bus_reg[i*DATA_WIDTH+:DATA_WIDTH] <= (i_valid[19])?i_data_bus[19*DATA_WIDTH+:DATA_WIDTH]:{DATA_WIDTH{1'b0}};
                            o_valid_reg[i] <= 1'b1;
                        end
                        64'b0000000000000000000000000000000000000000000100000000000000000000:
                        begin
                            o_data_bus_reg[i*DATA_WIDTH+:DATA_WIDTH] <= (i_valid[20])?i_data_bus[20*DATA_WIDTH+:DATA_WIDTH]:{DATA_WIDTH{1'b0}};
                            o_valid_reg[i] <= 1'b1;
                        end
                        64'b0000000000000000000000000000000000000000001000000000000000000000:
                        begin
                            o_data_bus_reg[i*DATA_WIDTH+:DATA_WIDTH] <= (i_valid[21])?i_data_bus[21*DATA_WIDTH+:DATA_WIDTH]:{DATA_WIDTH{1'b0}};
                            o_valid_reg[i] <= 1'b1;
                        end
                        64'b0000000000000000000000000000000000000000010000000000000000000000:
                        begin
                            o_data_bus_reg[i*DATA_WIDTH+:DATA_WIDTH] <= (i_valid[22])?i_data_bus[22*DATA_WIDTH+:DATA_WIDTH]:{DATA_WIDTH{1'b0}};
                            o_valid_reg[i] <= 1'b1;
                        end
                        64'b0000000000000000000000000000000000000000100000000000000000000000:
                        begin
                            o_data_bus_reg[i*DATA_WIDTH+:DATA_WIDTH] <= (i_valid[23])?i_data_bus[23*DATA_WIDTH+:DATA_WIDTH]:{DATA_WIDTH{1'b0}};
                            o_valid_reg[i] <= 1'b1;
                        end
                        64'b0000000000000000000000000000000000000001000000000000000000000000:
                        begin
                            o_data_bus_reg[i*DATA_WIDTH+:DATA_WIDTH] <= (i_valid[24])?i_data_bus[24*DATA_WIDTH+:DATA_WIDTH]:{DATA_WIDTH{1'b0}};
                            o_valid_reg[i] <= 1'b1;
                        end
                        64'b0000000000000000000000000000000000000010000000000000000000000000:
                        begin
                            o_data_bus_reg[i*DATA_WIDTH+:DATA_WIDTH] <= (i_valid[25])?i_data_bus[25*DATA_WIDTH+:DATA_WIDTH]:{DATA_WIDTH{1'b0}};
                            o_valid_reg[i] <= 1'b1;
                        end
                        64'b0000000000000000000000000000000000000100000000000000000000000000:
                        begin
                            o_data_bus_reg[i*DATA_WIDTH+:DATA_WIDTH] <= (i_valid[26])?i_data_bus[26*DATA_WIDTH+:DATA_WIDTH]:{DATA_WIDTH{1'b0}};
                            o_valid_reg[i] <= 1'b1;
                        end
                        64'b0000000000000000000000000000000000001000000000000000000000000000:
                        begin
                            o_data_bus_reg[i*DATA_WIDTH+:DATA_WIDTH] <= (i_valid[27])?i_data_bus[27*DATA_WIDTH+:DATA_WIDTH]:{DATA_WIDTH{1'b0}};
                            o_valid_reg[i] <= 1'b1;
                        end
                        64'b0000000000000000000000000000000000010000000000000000000000000000:
                        begin
                            o_data_bus_reg[i*DATA_WIDTH+:DATA_WIDTH] <= (i_valid[28])?i_data_bus[28*DATA_WIDTH+:DATA_WIDTH]:{DATA_WIDTH{1'b0}};
                            o_valid_reg[i] <= 1'b1;
                        end
                        64'b0000000000000000000000000000000000100000000000000000000000000000:
                        begin
                            o_data_bus_reg[i*DATA_WIDTH+:DATA_WIDTH] <= (i_valid[29])?i_data_bus[29*DATA_WIDTH+:DATA_WIDTH]:{DATA_WIDTH{1'b0}};
                            o_valid_reg[i] <= 1'b1;
                        end
                        64'b0000000000000000000000000000000001000000000000000000000000000000:
                        begin
                            o_data_bus_reg[i*DATA_WIDTH+:DATA_WIDTH] <= (i_valid[30])?i_data_bus[30*DATA_WIDTH+:DATA_WIDTH]:{DATA_WIDTH{1'b0}};
                            o_valid_reg[i] <= 1'b1;
                        end
                        64'b0000000000000000000000000000000010000000000000000000000000000000:
                        begin
                            o_data_bus_reg[i*DATA_WIDTH+:DATA_WIDTH] <= (i_valid[31])?i_data_bus[31*DATA_WIDTH+:DATA_WIDTH]:{DATA_WIDTH{1'b0}};
                            o_valid_reg[i] <= 1'b1;
                        end
                        64'b0000000000000000000000000000000100000000000000000000000000000000:
                        begin
                            o_data_bus_reg[i*DATA_WIDTH+:DATA_WIDTH] <= (i_valid[32])?i_data_bus[32*DATA_WIDTH+:DATA_WIDTH]:{DATA_WIDTH{1'b0}};
                            o_valid_reg[i] <= 1'b1;
                        end
                        64'b0000000000000000000000000000001000000000000000000000000000000000:
                        begin
                            o_data_bus_reg[i*DATA_WIDTH+:DATA_WIDTH] <= (i_valid[33])?i_data_bus[33*DATA_WIDTH+:DATA_WIDTH]:{DATA_WIDTH{1'b0}};
                            o_valid_reg[i] <= 1'b1;
                        end
                        64'b0000000000000000000000000000010000000000000000000000000000000000:
                        begin
                            o_data_bus_reg[i*DATA_WIDTH+:DATA_WIDTH] <= (i_valid[34])?i_data_bus[34*DATA_WIDTH+:DATA_WIDTH]:{DATA_WIDTH{1'b0}};
                            o_valid_reg[i] <= 1'b1;
                        end
                        64'b0000000000000000000000000000100000000000000000000000000000000000:
                        begin
                            o_data_bus_reg[i*DATA_WIDTH+:DATA_WIDTH] <= (i_valid[35])?i_data_bus[35*DATA_WIDTH+:DATA_WIDTH]:{DATA_WIDTH{1'b0}};
                            o_valid_reg[i] <= 1'b1;
                        end
                        64'b0000000000000000000000000001000000000000000000000000000000000000:
                        begin
                            o_data_bus_reg[i*DATA_WIDTH+:DATA_WIDTH] <= (i_valid[36])?i_data_bus[36*DATA_WIDTH+:DATA_WIDTH]:{DATA_WIDTH{1'b0}};
                            o_valid_reg[i] <= 1'b1;
                        end
                        64'b0000000000000000000000000010000000000000000000000000000000000000:
                        begin
                            o_data_bus_reg[i*DATA_WIDTH+:DATA_WIDTH] <= (i_valid[37])?i_data_bus[37*DATA_WIDTH+:DATA_WIDTH]:{DATA_WIDTH{1'b0}};
                            o_valid_reg[i] <= 1'b1;
                        end
                        64'b0000000000000000000000000100000000000000000000000000000000000000:
                        begin
                            o_data_bus_reg[i*DATA_WIDTH+:DATA_WIDTH] <= (i_valid[38])?i_data_bus[38*DATA_WIDTH+:DATA_WIDTH]:{DATA_WIDTH{1'b0}};
                            o_valid_reg[i] <= 1'b1;
                        end
                        64'b0000000000000000000000001000000000000000000000000000000000000000:
                        begin
                            o_data_bus_reg[i*DATA_WIDTH+:DATA_WIDTH] <= (i_valid[39])?i_data_bus[39*DATA_WIDTH+:DATA_WIDTH]:{DATA_WIDTH{1'b0}};
                            o_valid_reg[i] <= 1'b1;
                        end
                        64'b0000000000000000000000010000000000000000000000000000000000000000:
                        begin
                            o_data_bus_reg[i*DATA_WIDTH+:DATA_WIDTH] <= (i_valid[40])?i_data_bus[40*DATA_WIDTH+:DATA_WIDTH]:{DATA_WIDTH{1'b0}};
                            o_valid_reg[i] <= 1'b1;
                        end
                        64'b0000000000000000000000100000000000000000000000000000000000000000:
                        begin
                            o_data_bus_reg[i*DATA_WIDTH+:DATA_WIDTH] <= (i_valid[41])?i_data_bus[41*DATA_WIDTH+:DATA_WIDTH]:{DATA_WIDTH{1'b0}};
                            o_valid_reg[i] <= 1'b1;
                        end
                        64'b0000000000000000000001000000000000000000000000000000000000000000:
                        begin
                            o_data_bus_reg[i*DATA_WIDTH+:DATA_WIDTH] <= (i_valid[42])?i_data_bus[42*DATA_WIDTH+:DATA_WIDTH]:{DATA_WIDTH{1'b0}};
                            o_valid_reg[i] <= 1'b1;
                        end
                        64'b0000000000000000000010000000000000000000000000000000000000000000:
                        begin
                            o_data_bus_reg[i*DATA_WIDTH+:DATA_WIDTH] <= (i_valid[43])?i_data_bus[43*DATA_WIDTH+:DATA_WIDTH]:{DATA_WIDTH{1'b0}};
                            o_valid_reg[i] <= 1'b1;
                        end
                        64'b0000000000000000000100000000000000000000000000000000000000000000:
                        begin
                            o_data_bus_reg[i*DATA_WIDTH+:DATA_WIDTH] <= (i_valid[44])?i_data_bus[44*DATA_WIDTH+:DATA_WIDTH]:{DATA_WIDTH{1'b0}};
                            o_valid_reg[i] <= 1'b1;
                        end
                        64'b0000000000000000001000000000000000000000000000000000000000000000:
                        begin
                            o_data_bus_reg[i*DATA_WIDTH+:DATA_WIDTH] <= (i_valid[45])?i_data_bus[45*DATA_WIDTH+:DATA_WIDTH]:{DATA_WIDTH{1'b0}};
                            o_valid_reg[i] <= 1'b1;
                        end
                        64'b0000000000000000010000000000000000000000000000000000000000000000:
                        begin
                            o_data_bus_reg[i*DATA_WIDTH+:DATA_WIDTH] <= (i_valid[46])?i_data_bus[46*DATA_WIDTH+:DATA_WIDTH]:{DATA_WIDTH{1'b0}};
                            o_valid_reg[i] <= 1'b1;
                        end
                        64'b0000000000000000100000000000000000000000000000000000000000000000:
                        begin
                            o_data_bus_reg[i*DATA_WIDTH+:DATA_WIDTH] <= (i_valid[47])?i_data_bus[47*DATA_WIDTH+:DATA_WIDTH]:{DATA_WIDTH{1'b0}};
                            o_valid_reg[i] <= 1'b1;
                        end
                        64'b0000000000000001000000000000000000000000000000000000000000000000:
                        begin
                            o_data_bus_reg[i*DATA_WIDTH+:DATA_WIDTH] <= (i_valid[48])?i_data_bus[48*DATA_WIDTH+:DATA_WIDTH]:{DATA_WIDTH{1'b0}};
                            o_valid_reg[i] <= 1'b1;
                        end
                        64'b0000000000000010000000000000000000000000000000000000000000000000:
                        begin
                            o_data_bus_reg[i*DATA_WIDTH+:DATA_WIDTH] <= (i_valid[49])?i_data_bus[49*DATA_WIDTH+:DATA_WIDTH]:{DATA_WIDTH{1'b0}};
                            o_valid_reg[i] <= 1'b1;
                        end
                        64'b0000000000000100000000000000000000000000000000000000000000000000:
                        begin
                            o_data_bus_reg[i*DATA_WIDTH+:DATA_WIDTH] <= (i_valid[50])?i_data_bus[50*DATA_WIDTH+:DATA_WIDTH]:{DATA_WIDTH{1'b0}};
                            o_valid_reg[i] <= 1'b1;
                        end
                        64'b0000000000001000000000000000000000000000000000000000000000000000:
                        begin
                            o_data_bus_reg[i*DATA_WIDTH+:DATA_WIDTH] <= (i_valid[51])?i_data_bus[51*DATA_WIDTH+:DATA_WIDTH]:{DATA_WIDTH{1'b0}};
                            o_valid_reg[i] <= 1'b1;
                        end
                        64'b0000000000010000000000000000000000000000000000000000000000000000:
                        begin
                            o_data_bus_reg[i*DATA_WIDTH+:DATA_WIDTH] <= (i_valid[52])?i_data_bus[52*DATA_WIDTH+:DATA_WIDTH]:{DATA_WIDTH{1'b0}};
                            o_valid_reg[i] <= 1'b1;
                        end
                        64'b0000000000100000000000000000000000000000000000000000000000000000:
                        begin
                            o_data_bus_reg[i*DATA_WIDTH+:DATA_WIDTH] <= (i_valid[53])?i_data_bus[53*DATA_WIDTH+:DATA_WIDTH]:{DATA_WIDTH{1'b0}};
                            o_valid_reg[i] <= 1'b1;
                        end
                        64'b0000000001000000000000000000000000000000000000000000000000000000:
                        begin
                            o_data_bus_reg[i*DATA_WIDTH+:DATA_WIDTH] <= (i_valid[54])?i_data_bus[54*DATA_WIDTH+:DATA_WIDTH]:{DATA_WIDTH{1'b0}};
                            o_valid_reg[i] <= 1'b1;
                        end
                        64'b0000000010000000000000000000000000000000000000000000000000000000:
                        begin
                            o_data_bus_reg[i*DATA_WIDTH+:DATA_WIDTH] <= (i_valid[55])?i_data_bus[55*DATA_WIDTH+:DATA_WIDTH]:{DATA_WIDTH{1'b0}};
                            o_valid_reg[i] <= 1'b1;
                        end
                        64'b0000000100000000000000000000000000000000000000000000000000000000:
                        begin
                            o_data_bus_reg[i*DATA_WIDTH+:DATA_WIDTH] <= (i_valid[56])?i_data_bus[56*DATA_WIDTH+:DATA_WIDTH]:{DATA_WIDTH{1'b0}};
                            o_valid_reg[i] <= 1'b1;
                        end
                        64'b0000001000000000000000000000000000000000000000000000000000000000:
                        begin
                            o_data_bus_reg[i*DATA_WIDTH+:DATA_WIDTH] <= (i_valid[57])?i_data_bus[57*DATA_WIDTH+:DATA_WIDTH]:{DATA_WIDTH{1'b0}};
                            o_valid_reg[i] <= 1'b1;
                        end
                        64'b0000010000000000000000000000000000000000000000000000000000000000:
                        begin
                            o_data_bus_reg[i*DATA_WIDTH+:DATA_WIDTH] <= (i_valid[58])?i_data_bus[58*DATA_WIDTH+:DATA_WIDTH]:{DATA_WIDTH{1'b0}};
                            o_valid_reg[i] <= 1'b1;
                        end
                        64'b0000100000000000000000000000000000000000000000000000000000000000:
                        begin
                            o_data_bus_reg[i*DATA_WIDTH+:DATA_WIDTH] <= (i_valid[59])?i_data_bus[59*DATA_WIDTH+:DATA_WIDTH]:{DATA_WIDTH{1'b0}};
                            o_valid_reg[i] <= 1'b1;
                        end
                        64'b0001000000000000000000000000000000000000000000000000000000000000:
                        begin
                            o_data_bus_reg[i*DATA_WIDTH+:DATA_WIDTH] <= (i_valid[60])?i_data_bus[60*DATA_WIDTH+:DATA_WIDTH]:{DATA_WIDTH{1'b0}};
                            o_valid_reg[i] <= 1'b1;
                        end
                        64'b0010000000000000000000000000000000000000000000000000000000000000:
                        begin
                            o_data_bus_reg[i*DATA_WIDTH+:DATA_WIDTH] <= (i_valid[61])?i_data_bus[61*DATA_WIDTH+:DATA_WIDTH]:{DATA_WIDTH{1'b0}};
                            o_valid_reg[i] <= 1'b1;
                        end
                        64'b0100000000000000000000000000000000000000000000000000000000000000:
                        begin
                            o_data_bus_reg[i*DATA_WIDTH+:DATA_WIDTH] <= (i_valid[62])?i_data_bus[62*DATA_WIDTH+:DATA_WIDTH]:{DATA_WIDTH{1'b0}};
                            o_valid_reg[i] <= 1'b1;
                        end
                        64'b1000000000000000000000000000000000000000000000000000000000000000:
                        begin
                            o_data_bus_reg[i*DATA_WIDTH+:DATA_WIDTH] <= (i_valid[63])?i_data_bus[63*DATA_WIDTH+:DATA_WIDTH]:{DATA_WIDTH{1'b0}};
                            o_valid_reg[i] <= 1'b1;
                        end
                        default:
                        begin
                            o_data_bus_reg[i*DATA_WIDTH+:DATA_WIDTH] <= {WIDTH_OUTPUT_DATA{1'b0}};
                            o_valid_reg[i] <= 1'b0;
                        end
                    endcase
                end
                else
                begin
                    o_data_bus_reg[i*DATA_WIDTH+:DATA_WIDTH] <= {WIDTH_OUTPUT_DATA{1'b0}};
                    o_valid_reg[i] <= 1'b0;
                end
            end
        end
    endgenerate

    assign o_data_bus = o_data_bus_reg;
    assign o_valid = o_valid_reg;

endmodule
`endif



`ifdef In64_Out8_hier_8_8
module crossbar_one_hot_seq#(
	parameter DATA_WIDTH = 32,      // could be arbitrary number
	parameter NUM_OUTPUT_DATA  = 8, // must be power of 2.
	parameter NUM_INPUT_DATA = 64   
)(
    // timeing signals
    clk,
    rst,

    // data signals
	i_valid,        // valid input data signal
	i_data_bus,     // input data bus coming into distribute switch
	
	o_valid,        // output valid
    o_data_bus,     // output data 

	// control signals
	i_en,           // distribute switch enable
	i_cmd           // the input should be one-hot encoded command 
);

	//parameter
	localparam TOTAL_COMMMAND = NUM_INPUT_DATA*NUM_OUTPUT_DATA;
	
	localparam WIDTH_INPUT_DATA = NUM_INPUT_DATA*DATA_WIDTH;
	localparam WIDTH_OUTPUT_DATA = NUM_OUTPUT_DATA*DATA_WIDTH;

	localparam NUM_IN_MUX_FIRST_STAGE = 8;
	localparam NUM_MUX_FIRST_STAGE = NUM_INPUT_DATA >> $clog2(NUM_IN_MUX_FIRST_STAGE);

	localparam NUM_IN_MUX_SECOND_STAGE = NUM_MUX_FIRST_STAGE;
	localparam NUM_MUX_SECOND_STAGE = 1;

    // interface
	input                                        clk;
	input                                        rst;

	input  [NUM_INPUT_DATA-1:0]                  i_valid;             
	input  [WIDTH_INPUT_DATA-1:0]                i_data_bus;
	
	output [NUM_OUTPUT_DATA-1:0]                 o_valid;             
	output [WIDTH_OUTPUT_DATA-1:0]               o_data_bus; // {o_data_a, o_data_b}

	input                                        i_en;
	input  [TOTAL_COMMMAND-1:0]                  i_cmd;

    reg    [NUM_OUTPUT_DATA-1:0]                 o_valid_reg;
    reg    [WIDTH_OUTPUT_DATA-1:0]               o_data_bus_reg;
    
    genvar i,j;
    generate
        for(i=0; i<NUM_OUTPUT_DATA; i=i+1)
        begin:output_mux
            // first pipeline stage -- buffer definition.
            reg    [NUM_IN_MUX_FIRST_STAGE*DATA_WIDTH-1:0]      inner_first_stage_data_reg;
            reg    [NUM_IN_MUX_FIRST_STAGE-1:0]                 inner_first_stage_valid_reg;
            
            // first pipeline stage -- 8 * 8:1 mux logic.
            for(j=0; j< NUM_MUX_FIRST_STAGE; j=j+1)
            begin:first_stage
                wire  [NUM_IN_MUX_FIRST_STAGE-1:0]       inner_cmd_wire;
                assign  inner_cmd_wire = {i_cmd[(7+j*NUM_IN_MUX_FIRST_STAGE)*NUM_OUTPUT_DATA+i],i_cmd[(6+j*NUM_IN_MUX_FIRST_STAGE)*NUM_OUTPUT_DATA+i],i_cmd[(5+j*NUM_IN_MUX_FIRST_STAGE)*NUM_OUTPUT_DATA+i],i_cmd[(4+j*NUM_IN_MUX_FIRST_STAGE)*NUM_OUTPUT_DATA+i],i_cmd[(3+j*NUM_IN_MUX_FIRST_STAGE)*NUM_OUTPUT_DATA+i],i_cmd[(2+j*NUM_IN_MUX_FIRST_STAGE)*NUM_OUTPUT_DATA+i],i_cmd[(1+j*NUM_IN_MUX_FIRST_STAGE)*NUM_OUTPUT_DATA+i],i_cmd[(j*NUM_IN_MUX_FIRST_STAGE)*NUM_OUTPUT_DATA+i]};
                always@(posedge clk)
                begin
                    if(i_en && (~rst))
                    begin
                        case(inner_cmd_wire)
                            8'b00000001:
                            begin
                                inner_first_stage_data_reg[j*DATA_WIDTH+:DATA_WIDTH] <= (i_valid[0+j*NUM_IN_MUX_FIRST_STAGE])?i_data_bus[(0+j*NUM_IN_MUX_FIRST_STAGE)*DATA_WIDTH+:DATA_WIDTH]:{DATA_WIDTH{1'b0}};
                                inner_first_stage_valid_reg[j] <= (i_valid[0+j*NUM_IN_MUX_FIRST_STAGE])?1'b1:1'b0;
                            end
                            8'b00000010:
                            begin
                                inner_first_stage_data_reg[j*DATA_WIDTH+:DATA_WIDTH] <= (i_valid[1+j*NUM_IN_MUX_FIRST_STAGE])?i_data_bus[(1+j*NUM_IN_MUX_FIRST_STAGE)*DATA_WIDTH+:DATA_WIDTH]:{DATA_WIDTH{1'b0}};
                                inner_first_stage_valid_reg[j] <= (i_valid[1+j*NUM_IN_MUX_FIRST_STAGE])?1'b1:1'b0;
                            end
                            8'b00000100:
                            begin
                                inner_first_stage_data_reg[j*DATA_WIDTH+:DATA_WIDTH] <= (i_valid[2+j*NUM_IN_MUX_FIRST_STAGE])?i_data_bus[(2+j*NUM_IN_MUX_FIRST_STAGE)*DATA_WIDTH+:DATA_WIDTH]:{DATA_WIDTH{1'b0}};
                                inner_first_stage_valid_reg[j] <= (i_valid[2+j*NUM_IN_MUX_FIRST_STAGE])?1'b1:1'b0;
                            end
                            8'b00001000:
                            begin
                                inner_first_stage_data_reg[j*DATA_WIDTH+:DATA_WIDTH] <= (i_valid[3+j*NUM_IN_MUX_FIRST_STAGE])?i_data_bus[(3+j*NUM_IN_MUX_FIRST_STAGE)*DATA_WIDTH+:DATA_WIDTH]:{DATA_WIDTH{1'b0}};
                                inner_first_stage_valid_reg[j] <= (i_valid[3+j*NUM_IN_MUX_FIRST_STAGE])?1'b1:1'b0;
                            end
                            8'b00010000:
                            begin
                                inner_first_stage_data_reg[j*DATA_WIDTH+:DATA_WIDTH] <= (i_valid[4+j*NUM_IN_MUX_FIRST_STAGE])?i_data_bus[(4+j*NUM_IN_MUX_FIRST_STAGE)*DATA_WIDTH+:DATA_WIDTH]:{DATA_WIDTH{1'b0}};
                                inner_first_stage_valid_reg[j] <= (i_valid[4+j*NUM_IN_MUX_FIRST_STAGE])?1'b1:1'b0;
                            end
                            8'b00100000:
                            begin
                                inner_first_stage_data_reg[j*DATA_WIDTH+:DATA_WIDTH] <= (i_valid[5+j*NUM_IN_MUX_FIRST_STAGE])?i_data_bus[(5+j*NUM_IN_MUX_FIRST_STAGE)*DATA_WIDTH+:DATA_WIDTH]:{DATA_WIDTH{1'b0}};
                                inner_first_stage_valid_reg[j] <= (i_valid[5+j*NUM_IN_MUX_FIRST_STAGE])?1'b1:1'b0;
                            end
                            8'b01000000:
                            begin
                                inner_first_stage_data_reg[j*DATA_WIDTH+:DATA_WIDTH] <= (i_valid[6+j*NUM_IN_MUX_FIRST_STAGE])?i_data_bus[(6+j*NUM_IN_MUX_FIRST_STAGE)*DATA_WIDTH+:DATA_WIDTH]:{DATA_WIDTH{1'b0}};
                                inner_first_stage_valid_reg[j] <= (i_valid[6+j*NUM_IN_MUX_FIRST_STAGE])?1'b1:1'b0;
                            end
                            8'b10000000:
                            begin
                                inner_first_stage_data_reg[j*DATA_WIDTH+:DATA_WIDTH] <= (i_valid[7+j*NUM_IN_MUX_FIRST_STAGE])?i_data_bus[(7+j*NUM_IN_MUX_FIRST_STAGE)*DATA_WIDTH+:DATA_WIDTH]:{DATA_WIDTH{1'b0}};
                                inner_first_stage_valid_reg[j] <= (i_valid[7+j*NUM_IN_MUX_FIRST_STAGE])?1'b1:1'b0;
                            end
                            8'b00000000:
                            begin
                                inner_first_stage_data_reg[j*DATA_WIDTH+:DATA_WIDTH] <= {DATA_WIDTH{1'b0}};
                                inner_first_stage_valid_reg[j] <= 1'b0;
                            end
                            default:
                            begin
                                inner_first_stage_data_reg[j*DATA_WIDTH+:DATA_WIDTH] <= {DATA_WIDTH{1'b0}};
                                inner_first_stage_valid_reg[j] <= 1'b0;
                            end
                        endcase
                    end
                    else
                    begin
                        inner_first_stage_data_reg[j*DATA_WIDTH+:DATA_WIDTH] <= {DATA_WIDTH{1'b0}};
                        inner_first_stage_valid_reg[j] <= 1'b0; 
                    end
                end
            end

            // second stage -- a single 8:1 mux.
            wire  [NUM_IN_MUX_SECOND_STAGE-1:0]  inner_cmd_wire_second_stage;
            assign inner_cmd_wire_second_stage = inner_first_stage_valid_reg;
            always@(posedge clk)
            begin:second_stage
                if(i_en && (~rst))
                begin
                    case(inner_cmd_wire_second_stage)
                        8'b00000001:
                        begin
                            o_data_bus_reg[i*DATA_WIDTH+:DATA_WIDTH] <= inner_first_stage_data_reg[0*DATA_WIDTH+:DATA_WIDTH];
                            o_valid_reg[i] <= 1'b1;
                        end
                        8'b00000010:
                        begin
                            o_data_bus_reg[i*DATA_WIDTH+:DATA_WIDTH] <= inner_first_stage_data_reg[1*DATA_WIDTH+:DATA_WIDTH];
                            o_valid_reg[i] <= 1'b1;
                        end
                        8'b00000100:
                        begin
                            o_data_bus_reg[i*DATA_WIDTH+:DATA_WIDTH] <= inner_first_stage_data_reg[2*DATA_WIDTH+:DATA_WIDTH];
                            o_valid_reg[i] <= 1'b1;
                        end
                        8'b00001000:
                        begin
                            o_data_bus_reg[i*DATA_WIDTH+:DATA_WIDTH] <= inner_first_stage_data_reg[3*DATA_WIDTH+:DATA_WIDTH];
                            o_valid_reg[i] <= 1'b1;
                        end
                        8'b00010000:
                        begin
                            o_data_bus_reg[i*DATA_WIDTH+:DATA_WIDTH] <= inner_first_stage_data_reg[4*DATA_WIDTH+:DATA_WIDTH];
                            o_valid_reg[i] <= 1'b1;
                        end
                        8'b00100000:
                        begin
                            o_data_bus_reg[i*DATA_WIDTH+:DATA_WIDTH] <= inner_first_stage_data_reg[5*DATA_WIDTH+:DATA_WIDTH];
                            o_valid_reg[i] <= 1'b1;
                        end
                        8'b01000000:
                        begin
                            o_data_bus_reg[i*DATA_WIDTH+:DATA_WIDTH] <= inner_first_stage_data_reg[6*DATA_WIDTH+:DATA_WIDTH];
                            o_valid_reg[i] <= 1'b1;
                        end
                        8'b10000000:
                        begin
                            o_data_bus_reg[i*DATA_WIDTH+:DATA_WIDTH] <= inner_first_stage_data_reg[7*DATA_WIDTH+:DATA_WIDTH];
                            o_valid_reg[i] <= 1'b1;
                        end
                        default:
                        begin
                            o_data_bus_reg[i*DATA_WIDTH+:DATA_WIDTH] <= {DATA_WIDTH{1'b0}};
                            o_valid_reg[i] <= 1'b0;                
                        end
                    endcase
                end
                else
                begin
                    o_data_bus_reg[i*DATA_WIDTH+:DATA_WIDTH] <= {DATA_WIDTH{1'b0}};
                    o_valid_reg[i] <= 1'b0; 
                end
            end
        end
    endgenerate

    assign o_data_bus = o_data_bus_reg;
    assign o_valid = o_valid_reg;

endmodule
`endif  




`ifdef In32_Out8_hier_4_8
module crossbar_one_hot_seq#(
	parameter DATA_WIDTH = 32,      // could be arbitrary number
	parameter NUM_OUTPUT_DATA  = 8, // must be power of 2.
	parameter NUM_INPUT_DATA = 32   
)(
    // timeing signals
    clk,
    rst,

    // data signals
	i_valid,        // valid input data signal
	i_data_bus,     // input data bus coming into distribute switch
	
	o_valid,        // output valid
    o_data_bus,     // output data 

	// control signals
	i_en,           // distribute switch enable
	i_cmd           // the input should be one-hot encoded command 
);

	//parameter
	localparam TOTAL_COMMMAND = NUM_INPUT_DATA*NUM_OUTPUT_DATA;
	
	localparam WIDTH_INPUT_DATA = NUM_INPUT_DATA*DATA_WIDTH;
	localparam WIDTH_OUTPUT_DATA = NUM_OUTPUT_DATA*DATA_WIDTH;

	localparam NUM_IN_MUX_FIRST_STAGE = 4;In32_Out8_hier_3_lvl_2_2_8_separate

    // interface
	input                                        clk;
	input                                        rst;

	input  [NUM_INPUT_DATA-1:0]                  i_valid;             
	input  [WIDTH_INPUT_DATA-1:0]                i_data_bus;
	
	output [NUM_OUTPUT_DATA-1:0]                 o_valid;             
	output [WIDTH_OUTPUT_DATA-1:0]               o_data_bus; // {o_data_a, o_data_b}

	input                                        i_en;
	input  [TOTAL_COMMMAND-1:0]                  i_cmd;

    reg    [NUM_OUTPUT_DATA-1:0]                 o_valid_reg;
    reg    [WIDTH_OUTPUT_DATA-1:0]               o_data_bus_reg;
    
    // first pipeline stage -- buffer definition.
    reg    [NUM_OUTPUT_DATA*NUM_MUX_FIRST_STAGE*DATA_WIDTH-1:0]      inner_first_stage_data_reg;
    reg    [NUM_OUTPUT_DATA*NUM_MUX_FIRST_STAGE-1:0]                 inner_first_stage_valid_reg;
    
    genvar i,j;
    generate
        for(i=0; i<NUM_OUTPUT_DATA; i=i+1)
        begin:output_mux
            // first pipeline stage -- 8 * 4:1 mux logic.
            for(j=0; j< NUM_MUX_FIRST_STAGE; j=j+1)
            begin:first_stage
                wire  [NUM_IN_MUX_FIRST_STAGE-1:0]       inner_cmd_wire;
                assign  inner_cmd_wire = {i_cmd[(3+j*NUM_IN_MUX_FIRST_STAGE)*NUM_OUTPUT_DATA+i],i_cmd[(2+j*NUM_IN_MUX_FIRST_STAGE)*NUM_OUTPUT_DATA+i],i_cmd[(1+j*NUM_IN_MUX_FIRST_STAGE)*NUM_OUTPUT_DATA+i],i_cmd[(j*NUM_IN_MUX_FIRST_STAGE)*NUM_OUTPUT_DATA+i]};
                always@(posedge clk)
                begin
                    if(i_en && (~rst))
                    begin
                        case(inner_cmd_wire & i_valid[j*NUM_IN_MUX_FIRST_STAGE+:NUM_IN_MUX_FIRST_STAGE])
                            4'b0001:
                            begin
                                inner_first_stage_data_reg[(i*NUM_MUX_FIRST_STAGE+j)*DATA_WIDTH+:DATA_WIDTH] <= i_data_bus[(0+j*NUM_IN_MUX_FIRST_STAGE)*DATA_WIDTH+:DATA_WIDTH];
                                inner_first_stage_valid_reg[(i*NUM_MUX_FIRST_STAGE+j)] <= 1'b1;
                            end
                            4'b0010:
                            begin
                                inner_first_stage_data_reg[(i*NUM_MUX_FIRST_STAGE+j)*DATA_WIDTH+:DATA_WIDTH] <= i_data_bus[(1+j*NUM_IN_MUX_FIRST_STAGE)*DATA_WIDTH+:DATA_WIDTH];
                                inner_first_stage_valid_reg[(i*NUM_MUX_FIRST_STAGE+j)] <= 1'b1;
                            end
                            4'b0100:
                            begin
                                inner_first_stage_data_reg[(i*NUM_MUX_FIRST_STAGE+j)*DATA_WIDTH+:DATA_WIDTH] <= i_data_bus[(2+j*NUM_IN_MUX_FIRST_STAGE)*DATA_WIDTH+:DATA_WIDTH];
                                inner_first_stage_valid_reg[(i*NUM_MUX_FIRST_STAGE+j)] <= 1'b1;
                            end
                            4'b1000:
                            begin
                                inner_first_stage_data_reg[(i*NUM_MUX_FIRST_STAGE+j)*DATA_WIDTH+:DATA_WIDTH] <= i_data_bus[(3+j*NUM_IN_MUX_FIRST_STAGE)*DATA_WIDTH+:DATA_WIDTH];
                                inner_first_stage_valid_reg[(i*NUM_MUX_FIRST_STAGE+j)] <= 1'b1;
                            end
                            default:
                            begin
                                inner_first_stage_data_reg[(i*NUM_MUX_FIRST_STAGE+j)*DATA_WIDTH+:DATA_WIDTH] <= {DATA_WIDTH{1'b0}};
                                inner_first_stage_valid_reg[(i*NUM_MUX_FIRST_STAGE+j)] <= 1'b0;
                            end
                        endcase
                    end
                    else
                    begin
                        inner_first_stage_data_reg[(i*NUM_OUTPUT_DATA+j)*DATA_WIDTH+:DATA_WIDTH] <= {DATA_WIDTH{1'b0}};
                        inner_first_stage_valid_reg[(i*NUM_OUTPUT_DATA+j)] <= 1'b0; 
                    end
                end
            end

            // second stage -- a single 8:1 mux.
            wire  [NUM_IN_MUX_SECOND_STAGE-1:0]  inner_cmd_wire_second_stage;
            assign inner_cmd_wire_second_stage = inner_first_stage_valid_reg[i*NUM_OUTPUT_DATA+:NUM_MUX_FIRST_STAGE];
            always@(posedge clk)
            begin:second_stage
                if(i_en && (~rst))
                begin
                    case(inner_cmd_wire_second_stage)
                        8'b00000001:
                        begin
                            o_data_bus_reg[i*DATA_WIDTH+:DATA_WIDTH] <= inner_first_stage_data_reg[(i*NUM_OUTPUT_DATA+0)*DATA_WIDTH+:DATA_WIDTH];
                            o_valid_reg[i] <= 1'b1;
                        end
                        8'b00000010:
                        begin
                            o_data_bus_reg[i*DATA_WIDTH+:DATA_WIDTH] <= inner_first_stage_data_reg[(i*NUM_OUTPUT_DATA+1)*DATA_WIDTH+:DATA_WIDTH];
                            o_valid_reg[i] <= 1'b1;
                        end
                        8'b00000100:
                        begin
                            o_data_bus_reg[i*DATA_WIDTH+:DATA_WIDTH] <= inner_first_stage_data_reg[(i*NUM_OUTPUT_DATA+2)*DATA_WIDTH+:DATA_WIDTH];
                            o_valid_reg[i] <= 1'b1;
                        end
                        8'b00001000:
                        begin
                            o_data_bus_reg[i*DATA_WIDTH+:DATA_WIDTH] <= inner_first_stage_data_reg[(i*NUM_OUTPUT_DATA+3)*DATA_WIDTH+:DATA_WIDTH];
                            o_valid_reg[i] <= 1'b1;
                        end
                        8'b00010000:
                        begin
                            o_data_bus_reg[i*DATA_WIDTH+:DATA_WIDTH] <= inner_first_stage_data_reg[(i*NUM_OUTPUT_DATA+4)*DATA_WIDTH+:DATA_WIDTH];
                            o_valid_reg[i] <= 1'b1;
                        end
                        8'b00100000:
                        begin
                            o_data_bus_reg[i*DATA_WIDTH+:DATA_WIDTH] <= inner_first_stage_data_reg[(i*NUM_OUTPUT_DATA+5)*DATA_WIDTH+:DATA_WIDTH];
                            o_valid_reg[i] <= 1'b1;
                        end
                        8'b01000000:
                        begin
                            o_data_bus_reg[i*DATA_WIDTH+:DATA_WIDTH] <= inner_first_stage_data_reg[(i*NUM_OUTPUT_DATA+6)*DATA_WIDTH+:DATA_WIDTH];
                            o_valid_reg[i] <= 1'b1;
                        end
                        8'b10000000:
                        begin
                            o_data_bus_reg[i*DATA_WIDTH+:DATA_WIDTH] <= inner_first_stage_data_reg[(i*NUM_OUTPUT_DATA+7)*DATA_WIDTH+:DATA_WIDTH];
                            o_valid_reg[i] <= 1'b1;
                        end
                        default:
                        begin
                            o_data_bus_reg[i*DATA_WIDTH+:DATA_WIDTH] <= {DATA_WIDTH{1'b0}};
                            o_valid_reg[i] <= 1'b0;                
                        end
                    endcase
                end
                else
                begin
                    o_data_bus_reg[i*DATA_WIDTH+:DATA_WIDTH] <= {DATA_WIDTH{1'b0}};
                    o_valid_reg[i] <= 1'b0; 
                end
            end
        end
    endgenerate


    assign o_data_bus = o_data_bus_reg;
    assign o_valid = o_valid_reg;

endmodule
`endif  



`ifdef In32_Out8_hier_4_8_separate
module crossbar_one_hot_seq#(
	parameter DATA_WIDTH = 32,      // could be arbitrary number
	parameter NUM_OUTPUT_DATA  = 8, // must be power of 2.
	parameter NUM_INPUT_DATA = 32   
)(
    // timeing signals
    clk,
    rst,

    // data signals
	i_valid,        // valid input data signal
	i_data_bus,     // input data bus coming into distribute switch
	
	o_valid,        // output valid
    o_data_bus,     // output data 

	// control signals
	i_en,           // distribute switch enable
	i_cmd           // the input should be one-hot encoded command 
);

	//parameter
	localparam TOTAL_COMMMAND = NUM_INPUT_DATA*NUM_OUTPUT_DATA;
	
	localparam WIDTH_INPUT_DATA = NUM_INPUT_DATA*DATA_WIDTH;
	localparam WIDTH_OUTPUT_DATA = NUM_OUTPUT_DATA*DATA_WIDTH;

	localparam NUM_IN_MUX_FIRST_STAGE = 4;
	localparam NUM_MUX_FIRST_STAGE = NUM_INPUT_DATA >> $clog2(NUM_IN_MUX_FIRST_STAGE);

	localparam NUM_IN_MUX_SECOND_STAGE = NUM_MUX_FIRST_STAGE;
	localparam NUM_MUX_SECOND_STAGE = 1;

	localparam DATA_INDEX_BIT_WIDTH = $clog2(WIDTH_INPUT_DATA);

    // interface
	input                                        clk;
	input                                        rst;

	input  [NUM_INPUT_DATA-1:0]                  i_valid;             
	input  [WIDTH_INPUT_DATA-1:0]                i_data_bus;
	
	output [NUM_OUTPUT_DATA-1:0]                 o_valid;             
	output [WIDTH_OUTPUT_DATA-1:0]               o_data_bus; // {o_data_a, o_data_b}

	input                                        i_en;
	input  [TOTAL_COMMMAND-1:0]                  i_cmd;

    reg    [NUM_OUTPUT_DATA-1:0]                 o_valid_reg;
    reg    [WIDTH_OUTPUT_DATA-1:0]               o_data_bus_reg;
    
    // first pipeline stage -- buffer definition.
    reg    [NUM_OUTPUT_DATA*NUM_MUX_FIRST_STAGE*DATA_WIDTH-1:0]      inner_first_stage_data_reg;
    reg    [NUM_OUTPUT_DATA*NUM_MUX_FIRST_STAGE-1:0]                 inner_first_stage_valid_reg;
    
    genvar i,j,k;
    generate
        for(i=0; i<NUM_OUTPUT_DATA; i=i+1)
        begin:output_mux
            // first pipeline stage -- data -- 8 * 4:1 mux logic.
            for(j=0; j< NUM_MUX_FIRST_STAGE; j=j+1)
            begin:first_stage_data
                wire  [NUM_IN_MUX_FIRST_STAGE-1:0]       inner_cmd_wire;
                assign  inner_cmd_wire = {i_cmd[(3+j*NUM_IN_MUX_FIRST_STAGE)*NUM_OUTPUT_DATA+i],i_cmd[(2+j*NUM_IN_MUX_FIRST_STAGE)*NUM_OUTPUT_DATA+i],i_cmd[(1+j*NUM_IN_MUX_FIRST_STAGE)*NUM_OUTPUT_DATA+i],i_cmd[(j*NUM_IN_MUX_FIRST_STAGE)*NUM_OUTPUT_DATA+i]};
                always@(posedge clk)
                begin
                    if(i_en && (~rst))
                    begin
                        case(inner_cmd_wire)
                            4'b0001:
                            begin
                                inner_first_stage_data_reg[(i*NUM_MUX_FIRST_STAGE+j)*DATA_WIDTH+:DATA_WIDTH] <= (i_valid[0+j*NUM_IN_MUX_FIRST_STAGE])?i_data_bus[(0+j*NUM_IN_MUX_FIRST_STAGE)*DATA_WIDTH+:DATA_WIDTH]:{DATA_WIDTH{1'b0}};
                            end
                            4'b0010:
                            begin
                                inner_first_stage_data_reg[(i*NUM_MUX_FIRST_STAGE+j)*DATA_WIDTH+:DATA_WIDTH] <= (i_valid[1+j*NUM_IN_MUX_FIRST_STAGE])?i_data_bus[(1+j*NUM_IN_MUX_FIRST_STAGE)*DATA_WIDTH+:DATA_WIDTH]:{DATA_WIDTH{1'b0}};
                            end
                            4'b0100:
                            begin
                                inner_first_stage_data_reg[(i*NUM_MUX_FIRST_STAGE+j)*DATA_WIDTH+:DATA_WIDTH] <= (i_valid[2+j*NUM_IN_MUX_FIRST_STAGE])?i_data_bus[(2+j*NUM_IN_MUX_FIRST_STAGE)*DATA_WIDTH+:DATA_WIDTH]:{DATA_WIDTH{1'b0}};
                            end
                            4'b1000:
                            begin
                                inner_first_stage_data_reg[(i*NUM_MUX_FIRST_STAGE+j)*DATA_WIDTH+:DATA_WIDTH] <= (i_valid[3+j*NUM_IN_MUX_FIRST_STAGE])?i_data_bus[(3+j*NUM_IN_MUX_FIRST_STAGE)*DATA_WIDTH+:DATA_WIDTH]:{DATA_WIDTH{1'b0}};
                            end
                            default:
                            begin
                                inner_first_stage_data_reg[(i*NUM_MUX_FIRST_STAGE+j)*DATA_WIDTH+:DATA_WIDTH] <= {DATA_WIDTH{1'b0}};
                            end
                        endcase
                    end
                    else
                    begin
                        inner_first_stage_data_reg[(i*NUM_MUX_FIRST_STAGE+j)*DATA_WIDTH+:DATA_WIDTH] <= {DATA_WIDTH{1'b0}};
                    end
                end
            end

            // first pipeline stage -- valid -- 8 * 4:1 mux logic.
            for(j=0; j< NUM_MUX_FIRST_STAGE; j=j+1)
            begin:first_stage_valid
                wire  [NUM_IN_MUX_FIRST_STAGE-1:0]       inner_cmd_wire_valid;
                assign  inner_cmd_wire_valid = {i_cmd[(3+j*NUM_IN_MUX_FIRST_STAGE)*NUM_OUTPUT_DATA+i],i_cmd[(2+j*NUM_IN_MUX_FIRST_STAGE)*NUM_OUTPUT_DATA+i],i_cmd[(1+j*NUM_IN_MUX_FIRST_STAGE)*NUM_OUTPUT_DATA+i],i_cmd[(j*NUM_IN_MUX_FIRST_STAGE)*NUM_OUTPUT_DATA+i]};
                always@(posedge clk)
                begin
                    if(i_en && (~rst))
                    begin
                        case(inner_cmd_wire_valid)
                            4'b0001:
                            begin
                                inner_first_stage_valid_reg[(i*NUM_MUX_FIRST_STAGE+j)] <= (i_valid[0+j*NUM_IN_MUX_FIRST_STAGE])?1'b1:1'b0;
                            end
                            4'b0010:
                            begin
                                inner_first_stage_valid_reg[(i*NUM_MUX_FIRST_STAGE+j)] <= (i_valid[1+j*NUM_IN_MUX_FIRST_STAGE])?1'b1:1'b0;
                            end
                            4'b0100:
                            begin
                                inner_first_stage_valid_reg[(i*NUM_MUX_FIRST_STAGE+j)] <= (i_valid[2+j*NUM_IN_MUX_FIRST_STAGE])?1'b1:1'b0;
                            end
                            4'b1000:
                            begin
                                inner_first_stage_valid_reg[(i*NUM_MUX_FIRST_STAGE+j)] <= (i_valid[3+j*NUM_IN_MUX_FIRST_STAGE])?1'b1:1'b0;
                            end
                            default:
                            begin
                                inner_first_stage_valid_reg[(i*NUM_MUX_FIRST_STAGE+j)] <= 1'b0;
                            end
                        endcase
                    end
                    else
                    begin
                        inner_first_stage_valid_reg[(i*NUM_MUX_FIRST_STAGE+j)] <= 1'b0; 
                    end
                end
            end

            // second stage -- data -- a single 8:1 mux.
            wire  [NUM_IN_MUX_SECOND_STAGE-1:0]  inner_cmd_wire_second_stage;
            assign inner_cmd_wire_second_stage = inner_first_stage_valid_reg[i*NUM_OUTPUT_DATA+:NUM_MUX_FIRST_STAGE];
            always@(posedge clk)
            begin:second_stage
                if(i_en && (~rst))
                begin
                    case(inner_cmd_wire_second_stage)
                        8'b00000001:
                        begin
                            o_data_bus_reg[i*DATA_WIDTH+:DATA_WIDTH] <= inner_first_stage_data_reg[(i*NUM_OUTPUT_DATA+0)*DATA_WIDTH+:DATA_WIDTH];
                        end
                        8'b00000010:
                        begin
                            o_data_bus_reg[i*DATA_WIDTH+:DATA_WIDTH] <= inner_first_stage_data_reg[(i*NUM_OUTPUT_DATA+1)*DATA_WIDTH+:DATA_WIDTH];
                        end
                        8'b00000100:
                        begin
                            o_data_bus_reg[i*DATA_WIDTH+:DATA_WIDTH] <= inner_first_stage_data_reg[(i*NUM_OUTPUT_DATA+2)*DATA_WIDTH+:DATA_WIDTH];
                        end
                        8'b00001000:
                        begin
                            o_data_bus_reg[i*DATA_WIDTH+:DATA_WIDTH] <= inner_first_stage_data_reg[(i*NUM_OUTPUT_DATA+3)*DATA_WIDTH+:DATA_WIDTH];
                        end
                        8'b00010000:
                        begin
                            o_data_bus_reg[i*DATA_WIDTH+:DATA_WIDTH] <= inner_first_stage_data_reg[(i*NUM_OUTPUT_DATA+4)*DATA_WIDTH+:DATA_WIDTH];
                        end
                        8'b00100000:
                        begin
                            o_data_bus_reg[i*DATA_WIDTH+:DATA_WIDTH] <= inner_first_stage_data_reg[(i*NUM_OUTPUT_DATA+5)*DATA_WIDTH+:DATA_WIDTH];
                        end
                        8'b01000000:
                        begin
                            o_data_bus_reg[i*DATA_WIDTH+:DATA_WIDTH] <= inner_first_stage_data_reg[(i*NUM_OUTPUT_DATA+6)*DATA_WIDTH+:DATA_WIDTH];
                        end
                        8'b10000000:
                        begin
                            o_data_bus_reg[i*DATA_WIDTH+:DATA_WIDTH] <= inner_first_stage_data_reg[(i*NUM_OUTPUT_DATA+7)*DATA_WIDTH+:DATA_WIDTH];
                        end
                        default:
                        begin
                            o_data_bus_reg[i*DATA_WIDTH+:DATA_WIDTH] <= {DATA_WIDTH{1'b0}};
                        end
                    endcase
                end
                else
                begin
                    o_data_bus_reg[i*DATA_WIDTH+:DATA_WIDTH] <= {DATA_WIDTH{1'b0}};
                end
            end

            // second stage -- valid -- a single 8:1 or tree.
            localparam  LEVEL_OR_TREE = $clog2(NUM_IN_MUX_SECOND_STAGE);
            
            wire  [NUM_IN_MUX_SECOND_STAGE-1:0]          inner_cmd_wire_second_stage_valid;
            assign inner_cmd_wire_second_stage_valid = inner_first_stage_valid_reg[i*NUM_OUTPUT_DATA+:NUM_MUX_FIRST_STAGE];

            for (j=0; j<LEVEL_OR_TREE-1; j=j+1)
            begin: o_valid_gen_tree_lvl
                localparam WIDTH_VALID = NUM_IN_MUX_SECOND_STAGE>>(j+1);
                wire   [WIDTH_VALID-1:0]  inner_o_valid_tree_reg;
            end
            
            for (j=0; j<LEVEL_OR_TREE-1; j=j+1)
            begin: o_valid_gen_tree_lvl_assignment
                localparam WIDTH_VALID = (NUM_IN_MUX_SECOND_STAGE>>(j+1));
                wire   [WIDTH_VALID-1:0]  inner_o_valid_tree_reg;
                for (k=0; k<(WIDTH_VALID); k=k+1)
                begin: wire_assignment
                    if(j==0)
                    begin
                        assign o_valid_gen_tree_lvl[j].inner_o_valid_tree_reg[k] = inner_cmd_wire_second_stage_valid[2*k] | inner_cmd_wire_second_stage_valid[2*k+1];
                    end
                    else
                    begin
                        assign o_valid_gen_tree_lvl[j].inner_o_valid_tree_reg[k] = o_valid_gen_tree_lvl[j-1].inner_o_valid_tree_reg[2*k] | o_valid_gen_tree_lvl[j-1].inner_o_valid_tree_reg[2*k+1];
                    end
                end
            end
            
            always@(posedge clk)
            begin
                if(i_en && (~rst))
                begin
                    o_valid_reg[i] <= o_valid_gen_tree_lvl[LEVEL_OR_TREE-2].inner_o_valid_tree_reg[0] | o_valid_gen_tree_lvl[LEVEL_OR_TREE-2].inner_o_valid_tree_reg[1];
                end
            end
        end
    endgenerate


    assign o_data_bus = o_data_bus_reg;
    assign o_valid = o_valid_reg;

endmodule
`endif  



`ifdef In32_Out8_hier_3_lvl_2_2_8
module crossbar_one_hot_seq#(
	parameter DATA_WIDTH = 32,      // could be arbitrary number
	parameter NUM_OUTPUT_DATA  = 8, // must be power of 2.
	parameter NUM_INPUT_DATA = 32   
)(
    // timeing signals
    clk,
    rst,

    // data signals
	i_valid,        // valid input data signal
	i_data_bus,     // input data bus coming into distribute switch
	
	o_valid,        // output valid
    o_data_bus,     // output data 

	// control signals
	i_en,           // distribute switch enable
	i_cmd           // the input should be one-hot encoded command 
);

	//parameter
	localparam TOTAL_COMMMAND = NUM_INPUT_DATA*NUM_OUTPUT_DATA;
	
	localparam WIDTH_INPUT_DATA = NUM_INPUT_DATA*DATA_WIDTH;
	localparam WIDTH_OUTPUT_DATA = NUM_OUTPUT_DATA*DATA_WIDTH;

	localparam NUM_IN_MUX_FIRST_STAGE = 2;
	localparam NUM_MUX_FIRST_STAGE = NUM_INPUT_DATA >> $clog2(NUM_IN_MUX_FIRST_STAGE);

	localparam NUM_IN_MUX_SECOND_STAGE = 2;
	localparam NUM_MUX_SECOND_STAGE = NUM_MUX_FIRST_STAGE >> $clog2(NUM_IN_MUX_SECOND_STAGE);

	localparam NUM_IN_MUX_THIRD_STAGE = NUM_MUX_SECOND_STAGE;
	localparam NUM_MUX_THIRD_STAGE = 1;
    // interface
	input                                        clk;
	input                                        rst;

	input  [NUM_INPUT_DATA-1:0]                  i_valid;             
	input  [WIDTH_INPUT_DATA-1:0]                i_data_bus;
	
	output [NUM_OUTPUT_DATA-1:0]                 o_valid;             
	output [WIDTH_OUTPUT_DATA-1:0]               o_data_bus; // {o_data_a, o_data_b}

	input                                        i_en;
	input  [TOTAL_COMMMAND-1:0]                  i_cmd;

    reg    [NUM_OUTPUT_DATA-1:0]                 o_valid_reg;
    reg    [WIDTH_OUTPUT_DATA-1:0]               o_data_bus_reg;
    
    // first pipeline stage -- buffer definition.
    reg    [NUM_OUTPUT_DATA*NUM_MUX_FIRST_STAGE*DATA_WIDTH-1:0]       inner_first_stage_data_reg;
    reg    [NUM_OUTPUT_DATA*NUM_MUX_FIRST_STAGE-1:0]                  inner_first_stage_valid_reg;

    // second pipeline stage -- buffer definition.
    reg    [NUM_OUTPUT_DATA*NUM_MUX_SECOND_STAGE*DATA_WIDTH-1:0]      inner_second_stage_data_reg;
    reg    [NUM_OUTPUT_DATA*NUM_MUX_SECOND_STAGE-1:0]                 inner_second_stage_valid_reg;
    
    genvar i,j,k;
    generate
        
        for(i=0; i<NUM_OUTPUT_DATA; i=i+1)
        begin:output_mux
            // first pipeline stage -- 16 * 2:1 mux logic.
            for(j=0; j< NUM_MUX_FIRST_STAGE; j=j+1)
            begin:first_stage
                wire  [NUM_IN_MUX_FIRST_STAGE-1:0]       inner_cmd_wire;
                assign  inner_cmd_wire = {i_cmd[(1+j*NUM_IN_MUX_FIRST_STAGE)*NUM_OUTPUT_DATA+i],i_cmd[(j*NUM_IN_MUX_FIRST_STAGE)*NUM_OUTPUT_DATA+i]};
                always@(posedge clk)
                begin
                    if(i_en && (~rst))
                    begin
                        case(inner_cmd_wire)
                            2'b01:
                            begin
                                inner_first_stage_data_reg[(i*NUM_MUX_FIRST_STAGE+j)*DATA_WIDTH+:DATA_WIDTH] <= (i_valid[0+j*NUM_IN_MUX_FIRST_STAGE])?i_data_bus[(0+j*NUM_IN_MUX_FIRST_STAGE)*DATA_WIDTH+:DATA_WIDTH]:{DATA_WIDTH{1'b0}};
                                inner_first_stage_valid_reg[(i*NUM_MUX_FIRST_STAGE+j)] <= (i_valid[0+j*NUM_IN_MUX_FIRST_STAGE])?1'b1:1'b0;
                            end
                            2'b10:
                            begin
                                inner_first_stage_data_reg[(i*NUM_MUX_FIRST_STAGE+j)*DATA_WIDTH+:DATA_WIDTH] <= (i_valid[1+j*NUM_IN_MUX_FIRST_STAGE])?i_data_bus[(1+j*NUM_IN_MUX_FIRST_STAGE)*DATA_WIDTH+:DATA_WIDTH]:{DATA_WIDTH{1'b0}};
                                inner_first_stage_valid_reg[(i*NUM_MUX_FIRST_STAGE+j)] <= (i_valid[1+j*NUM_IN_MUX_FIRST_STAGE])?1'b1:1'b0;
                            end
                            default:
                            begin
                                inner_first_stage_data_reg[(i*NUM_MUX_FIRST_STAGE+j)*DATA_WIDTH+:DATA_WIDTH] <= {DATA_WIDTH{1'b0}};
                                inner_first_stage_valid_reg[(i*NUM_MUX_FIRST_STAGE+j)] <= 1'b0;
                            end
                        endcase
                    end
                    else
                    begin
                        inner_first_stage_data_reg[(i*NUM_MUX_FIRST_STAGE+j)*DATA_WIDTH+:DATA_WIDTH] <= {DATA_WIDTH{1'b0}};
                        inner_first_stage_valid_reg[(i*NUM_MUX_FIRST_STAGE+j)] <= 1'b0; 
                    end
                end
            end

            // second pipeline stage -- 8 * 2:1 mux logic.
            for(j=0; j< NUM_MUX_SECOND_STAGE; j=j+1)
            begin:second_stage
                wire  [NUM_IN_MUX_SECOND_STAGE-1:0]       inner_cmd_wire_second_stage_valid;
                assign  inner_cmd_wire_second_stage_valid = inner_first_stage_valid_reg[(i*NUM_OUTPUT_DATA + j)*NUM_IN_MUX_FIRST_STAGE+:NUM_IN_MUX_FIRST_STAGE];
                always@(posedge clk)
                begin
                    if(i_en && (~rst))
                    begin
                        case(inner_cmd_wire_second_stage_valid)
                            2'b01:
                            begin
                                inner_second_stage_data_reg[(i*NUM_MUX_SECOND_STAGE+j)*DATA_WIDTH+:DATA_WIDTH] <= inner_first_stage_data_reg[((i*NUM_OUTPUT_DATA + j)*NUM_IN_MUX_FIRST_STAGE+0)*DATA_WIDTH+:DATA_WIDTH];
                                inner_second_stage_valid_reg[(i*NUM_MUX_SECOND_STAGE+j)] <= 1'b1;
                            end
                            2'b10:
                            begin
                                inner_second_stage_data_reg[(i*NUM_MUX_SECOND_STAGE+j)*DATA_WIDTH+:DATA_WIDTH] <= inner_first_stage_data_reg[((i*NUM_OUTPUT_DATA + j)*NUM_IN_MUX_FIRST_STAGE+1)*DATA_WIDTH+:DATA_WIDTH];
                                inner_second_stage_valid_reg[(i*NUM_MUX_SECOND_STAGE+j)] <= 1'b1;
                            end
                            default:
                            begin
                                inner_second_stage_data_reg[(i*NUM_MUX_SECOND_STAGE+j)*DATA_WIDTH+:DATA_WIDTH] <= {DATA_WIDTH{1'b0}};
                                inner_second_stage_valid_reg[(i*NUM_MUX_SECOND_STAGE+j)] <= 1'b0;
                            end
                        endcase
                    end
                    else
                    begin
                        inner_second_stage_data_reg[(i*NUM_MUX_SECOND_STAGE+j)*DATA_WIDTH+:DATA_WIDTH] <= {DATA_WIDTH{1'b0}};
                        inner_second_stage_valid_reg[(i*NUM_MUX_SECOND_STAGE+j)] <= 1'b0; 
                    end
                end
            end

            // third stage -- a single 8:1 mux.
            wire  [NUM_IN_MUX_THIRD_STAGE-1:0]  inner_cmd_wire_third_stage;
            assign inner_cmd_wire_third_stage = inner_second_stage_valid_reg[i*NUM_OUTPUT_DATA+:NUM_MUX_SECOND_STAGE];
            always@(posedge clk)
            begin:third_stage
                if(i_en && (~rst))
                begin
                    case(inner_cmd_wire_third_stage)
                        8'b00000001:
                        begin
                            o_data_bus_reg[i*DATA_WIDTH+:DATA_WIDTH] <= inner_second_stage_data_reg[(i*NUM_OUTPUT_DATA+0)*DATA_WIDTH+:DATA_WIDTH];
                            o_valid_reg[i] <= 1'b1;
                        end
                        8'b00000010:
                        begin
                            o_data_bus_reg[i*DATA_WIDTH+:DATA_WIDTH] <= inner_second_stage_data_reg[(i*NUM_OUTPUT_DATA+1)*DATA_WIDTH+:DATA_WIDTH];
                            o_valid_reg[i] <= 1'b1;
                        end
                        8'b00000100:
                        begin
                            o_data_bus_reg[i*DATA_WIDTH+:DATA_WIDTH] <= inner_second_stage_data_reg[(i*NUM_OUTPUT_DATA+2)*DATA_WIDTH+:DATA_WIDTH];
                            o_valid_reg[i] <= 1'b1;
                        end
                        8'b00001000:
                        begin
                            o_data_bus_reg[i*DATA_WIDTH+:DATA_WIDTH] <= inner_second_stage_data_reg[(i*NUM_OUTPUT_DATA+3)*DATA_WIDTH+:DATA_WIDTH];
                            o_valid_reg[i] <= 1'b1;
                        end
                        8'b00010000:
                        begin
                            o_data_bus_reg[i*DATA_WIDTH+:DATA_WIDTH] <= inner_second_stage_data_reg[(i*NUM_OUTPUT_DATA+4)*DATA_WIDTH+:DATA_WIDTH];
                            o_valid_reg[i] <= 1'b1;
                        end
                        8'b00100000:
                        begin
                            o_data_bus_reg[i*DATA_WIDTH+:DATA_WIDTH] <= inner_second_stage_data_reg[(i*NUM_OUTPUT_DATA+5)*DATA_WIDTH+:DATA_WIDTH];
                            o_valid_reg[i] <= 1'b1;
                        end
                        8'b01000000:
                        begin
                            o_data_bus_reg[i*DATA_WIDTH+:DATA_WIDTH] <= inner_second_stage_data_reg[(i*NUM_OUTPUT_DATA+6)*DATA_WIDTH+:DATA_WIDTH];
                            o_valid_reg[i] <= 1'b1;
                        end
                        8'b10000000:
                        begin
                            o_data_bus_reg[i*DATA_WIDTH+:DATA_WIDTH] <= inner_second_stage_data_reg[(i*NUM_OUTPUT_DATA+7)*DATA_WIDTH+:DATA_WIDTH];
                            o_valid_reg[i] <= 1'b1;
                        end
                        default:
                        begin
                            o_data_bus_reg[i*DATA_WIDTH+:DATA_WIDTH] <= {DATA_WIDTH{1'b0}};
                            o_valid_reg[i] <= 1'b0;                
                        end
                    endcase
                end
                else
                begin
                    o_data_bus_reg[i*DATA_WIDTH+:DATA_WIDTH] <= {DATA_WIDTH{1'b0}};
                    o_valid_reg[i] <= 1'b0; 
                end
            end
        end
    endgenerate

    assign o_data_bus = o_data_bus_reg;
    assign o_valid = o_valid_reg;

endmodule
`endif  


`ifdef In32_Out8_hier_3_lvl_2_2_8_separate
module crossbar_one_hot_seq#(
	parameter DATA_WIDTH = 32,      // could be arbitrary number
	parameter NUM_OUTPUT_DATA  = 8, // must be power of 2.
	parameter NUM_INPUT_DATA = 32   
)(
    // timeing signals
    clk,
    rst,

    // data signals
	i_valid,        // valid input data signal
	i_data_bus,     // input data bus coming into distribute switch
	
	o_valid,        // output valid
    o_data_bus,     // output data 

	// control signals
	i_en,           // distribute switch enable
	i_cmd           // the input should be one-hot encoded command 
);

	//parameter
	localparam TOTAL_COMMMAND = NUM_INPUT_DATA*NUM_OUTPUT_DATA;
	
	localparam WIDTH_INPUT_DATA = NUM_INPUT_DATA*DATA_WIDTH;
	localparam WIDTH_OUTPUT_DATA = NUM_OUTPUT_DATA*DATA_WIDTH;

	localparam NUM_IN_MUX_FIRST_STAGE = 2;
	localparam NUM_MUX_FIRST_STAGE = NUM_INPUT_DATA >> $clog2(NUM_IN_MUX_FIRST_STAGE);

	localparam NUM_IN_MUX_SECOND_STAGE = 2;
	localparam NUM_MUX_SECOND_STAGE = NUM_MUX_FIRST_STAGE >> $clog2(NUM_IN_MUX_SECOND_STAGE);

	localparam NUM_IN_MUX_THIRD_STAGE = NUM_MUX_SECOND_STAGE;
	localparam NUM_MUX_THIRD_STAGE = 1;

    // interface
	input                                        clk;
	input                                        rst;

	input  [NUM_INPUT_DATA-1:0]                  i_valid;             
	input  [WIDTH_INPUT_DATA-1:0]                i_data_bus;
	
	output [NUM_OUTPUT_DATA-1:0]                 o_valid;             
	output [WIDTH_OUTPUT_DATA-1:0]               o_data_bus; // {o_data_a, o_data_b}

	input                                        i_en;
	input  [TOTAL_COMMMAND-1:0]                  i_cmd;

    reg    [NUM_OUTPUT_DATA-1:0]                 o_valid_reg;
    reg    [WIDTH_OUTPUT_DATA-1:0]               o_data_bus_reg;
    
    // first pipeline stage -- buffer definition.
    reg    [NUM_OUTPUT_DATA*NUM_MUX_FIRST_STAGE*DATA_WIDTH-1:0]       inner_first_stage_data_reg;
    reg    [NUM_OUTPUT_DATA*NUM_MUX_FIRST_STAGE-1:0]                  inner_first_stage_valid_reg;

    // second pipeline stage -- buffer definition.
    reg    [NUM_OUTPUT_DATA*NUM_MUX_SECOND_STAGE*DATA_WIDTH-1:0]      inner_second_stage_data_reg;
    reg    [NUM_OUTPUT_DATA*NUM_MUX_SECOND_STAGE-1:0]                 inner_second_stage_valid_reg;
    
    genvar i,j,k;
    generate
        for(i=0; i<NUM_OUTPUT_DATA; i=i+1)
        begin:output_mux
            // first pipeline stage -- 16 * 2:1 mux logic.
            for(j=0; j< NUM_MUX_FIRST_STAGE; j=j+1)
            begin:first_stage
                wire  [NUM_IN_MUX_FIRST_STAGE-1:0]       inner_cmd_wire_data;
                assign  inner_cmd_wire_data = {i_cmd[(1+j*NUM_IN_MUX_FIRST_STAGE)*NUM_OUTPUT_DATA+i],i_cmd[(j*NUM_IN_MUX_FIRST_STAGE)*NUM_OUTPUT_DATA+i]};
                always@(posedge clk)
                begin
                    if(i_en && (~rst))
                    begin
                        case(inner_cmd_wire_data)
                            2'b01:
                            begin
                                inner_first_stage_data_reg[(i*NUM_MUX_FIRST_STAGE+j)*DATA_WIDTH+:DATA_WIDTH] <= (i_valid[0+j*NUM_IN_MUX_FIRST_STAGE])?i_data_bus[(0+j*NUM_IN_MUX_FIRST_STAGE)*DATA_WIDTH+:DATA_WIDTH]:{DATA_WIDTH{1'b0}};
                            end
                            2'b10:
                            begin
                                inner_first_stage_data_reg[(i*NUM_MUX_FIRST_STAGE+j)*DATA_WIDTH+:DATA_WIDTH] <= (i_valid[1+j*NUM_IN_MUX_FIRST_STAGE])?i_data_bus[(1+j*NUM_IN_MUX_FIRST_STAGE)*DATA_WIDTH+:DATA_WIDTH]:{DATA_WIDTH{1'b0}};
                            end
                            default:
                            begin
                                inner_first_stage_data_reg[(i*NUM_MUX_FIRST_STAGE+j)*DATA_WIDTH+:DATA_WIDTH] <= {DATA_WIDTH{1'b0}};
                            end
                        endcase
                    end
                    else
                    begin
                        inner_first_stage_data_reg[(i*NUM_MUX_FIRST_STAGE+j)*DATA_WIDTH+:DATA_WIDTH] <= {DATA_WIDTH{1'b0}};
                    end
                end
            end

            for(j=0; j< NUM_MUX_FIRST_STAGE; j=j+1)
            begin:first_stage_valid
                wire  [NUM_IN_MUX_FIRST_STAGE-1:0]       inner_cmd_wire_valid;
                assign  inner_cmd_wire_valid = {i_cmd[(1+j*NUM_IN_MUX_FIRST_STAGE)*NUM_OUTPUT_DATA+i],i_cmd[(j*NUM_IN_MUX_FIRST_STAGE)*NUM_OUTPUT_DATA+i]};
                always@(posedge clk)
                begin
                    if(i_en && (~rst))
                    begin
                        case(inner_cmd_wire_valid)
                            2'b01:
                            begin
                                inner_first_stage_valid_reg[(i*NUM_MUX_FIRST_STAGE+j)] <= (i_valid[0+j*NUM_IN_MUX_FIRST_STAGE])?1'b1:1'b0;
                            end
                            2'b10:
                            begin
                                inner_first_stage_valid_reg[(i*NUM_MUX_FIRST_STAGE+j)] <= (i_valid[1+j*NUM_IN_MUX_FIRST_STAGE])?1'b1:1'b0;
                            end
                            default:
                            begin
                                inner_first_stage_valid_reg[(i*NUM_MUX_FIRST_STAGE+j)] <= 1'b0;
                            end
                        endcase
                    end
                    else
                    begin
                        inner_first_stage_valid_reg[(i*NUM_MUX_FIRST_STAGE+j)] <= 1'b0; 
                    end
                end
            end

            // second pipeline stage -- 8 * 2:1 mux logic.
            for(j=0; j< NUM_MUX_SECOND_STAGE; j=j+1)
            begin:second_stage
                wire  [NUM_IN_MUX_SECOND_STAGE-1:0]       inner_cmd_wire_second_stage_data;
                assign  inner_cmd_wire_second_stage_data = inner_first_stage_valid_reg[(i*NUM_OUTPUT_DATA + j)*NUM_IN_MUX_FIRST_STAGE+:NUM_IN_MUX_FIRST_STAGE];
                always@(posedge clk)
                begin
                    if(i_en && (~rst))
                    begin
                        case(inner_cmd_wire_second_stage_data)
                            2'b01:
                            begin
                                inner_second_stage_data_reg[(i*NUM_MUX_SECOND_STAGE+j)*DATA_WIDTH+:DATA_WIDTH] <= inner_first_stage_data_reg[((i*NUM_OUTPUT_DATA + j)*NUM_IN_MUX_FIRST_STAGE+0)*DATA_WIDTH+:DATA_WIDTH];
                            end
                            2'b10:
                            begin
                                inner_second_stage_data_reg[(i*NUM_MUX_SECOND_STAGE+j)*DATA_WIDTH+:DATA_WIDTH] <= inner_first_stage_data_reg[((i*NUM_OUTPUT_DATA + j)*NUM_IN_MUX_FIRST_STAGE+1)*DATA_WIDTH+:DATA_WIDTH];
                            end
                            default:
                            begin
                                inner_second_stage_data_reg[(i*NUM_MUX_SECOND_STAGE+j)*DATA_WIDTH+:DATA_WIDTH] <= {DATA_WIDTH{1'b0}};
                            end
                        endcase
                    end
                    else
                    begin
                        inner_second_stage_data_reg[(i*NUM_MUX_SECOND_STAGE+j)*DATA_WIDTH+:DATA_WIDTH] <= {DATA_WIDTH{1'b0}};
                    end
                end
            end

            // second pipeline stage -- 8 * 2:1 mux logic.
            for(j=0; j< NUM_MUX_SECOND_STAGE; j=j+1)
            begin:second_stage_valid
                wire  [NUM_IN_MUX_SECOND_STAGE-1:0]       inner_cmd_wire_second_stage_valid;
                assign  inner_cmd_wire_second_stage_valid = inner_first_stage_valid_reg[(i*NUM_OUTPUT_DATA + j)*NUM_IN_MUX_FIRST_STAGE+:NUM_IN_MUX_FIRST_STAGE];
                always@(posedge clk)
                begin
                    if(i_en && (~rst))
                    begin
                        case(inner_cmd_wire_second_stage_valid)
                            2'b01:
                            begin
                                inner_second_stage_valid_reg[(i*NUM_MUX_SECOND_STAGE+j)] <= 1'b1;
                            end
                            2'b10:
                            begin
                                inner_second_stage_valid_reg[(i*NUM_MUX_SECOND_STAGE+j)] <= 1'b1;
                            end
                            default:
                            begin
                                inner_second_stage_valid_reg[(i*NUM_MUX_SECOND_STAGE+j)] <= 1'b0;
                            end
                        endcase
                    end
                    else
                    begin
                        inner_second_stage_valid_reg[(i*NUM_MUX_SECOND_STAGE+j)] <= 1'b0; 
                    end
                end
            end

            // third stage -- a single 8:1 mux.
            wire  [NUM_IN_MUX_THIRD_STAGE-1:0]  inner_cmd_wire_third_stage;
            assign inner_cmd_wire_third_stage = inner_second_stage_valid_reg[i*NUM_OUTPUT_DATA+:NUM_MUX_SECOND_STAGE];
            always@(posedge clk)
            begin:third_stage
                if(i_en && (~rst))
                begin
                    case(inner_cmd_wire_third_stage)
                        8'b00000001:
                        begin
                            o_data_bus_reg[i*DATA_WIDTH+:DATA_WIDTH] <= inner_second_stage_data_reg[(i*NUM_OUTPUT_DATA+0)*DATA_WIDTH+:DATA_WIDTH];
                        end
                        8'b00000010:
                        begin
                            o_data_bus_reg[i*DATA_WIDTH+:DATA_WIDTH] <= inner_second_stage_data_reg[(i*NUM_OUTPUT_DATA+1)*DATA_WIDTH+:DATA_WIDTH];
                        end
                        8'b00000100:
                        begin
                            o_data_bus_reg[i*DATA_WIDTH+:DATA_WIDTH] <= inner_second_stage_data_reg[(i*NUM_OUTPUT_DATA+2)*DATA_WIDTH+:DATA_WIDTH];
                        end
                        8'b00001000:
                        begin
                            o_data_bus_reg[i*DATA_WIDTH+:DATA_WIDTH] <= inner_second_stage_data_reg[(i*NUM_OUTPUT_DATA+3)*DATA_WIDTH+:DATA_WIDTH];
                        end
                        8'b00010000:
                        begin
                            o_data_bus_reg[i*DATA_WIDTH+:DATA_WIDTH] <= inner_second_stage_data_reg[(i*NUM_OUTPUT_DATA+4)*DATA_WIDTH+:DATA_WIDTH];
                        end
                        8'b00100000:
                        begin
                            o_data_bus_reg[i*DATA_WIDTH+:DATA_WIDTH] <= inner_second_stage_data_reg[(i*NUM_OUTPUT_DATA+5)*DATA_WIDTH+:DATA_WIDTH];
                        end
                        8'b01000000:
                        begin
                            o_data_bus_reg[i*DATA_WIDTH+:DATA_WIDTH] <= inner_second_stage_data_reg[(i*NUM_OUTPUT_DATA+6)*DATA_WIDTH+:DATA_WIDTH];
                        end
                        8'b10000000:
                        begin
                            o_data_bus_reg[i*DATA_WIDTH+:DATA_WIDTH] <= inner_second_stage_data_reg[(i*NUM_OUTPUT_DATA+7)*DATA_WIDTH+:DATA_WIDTH];
                        end
                        default:
                        begin
                            o_data_bus_reg[i*DATA_WIDTH+:DATA_WIDTH] <= {DATA_WIDTH{1'b0}};
                        end
                    endcase
                end
                else
                begin
                    o_data_bus_reg[i*DATA_WIDTH+:DATA_WIDTH] <= {DATA_WIDTH{1'b0}};
                end
            end

            // third stage -- valid --  a single 8:1 mux.
            wire  [NUM_IN_MUX_THIRD_STAGE-1:0]  inner_cmd_wire_third_stage_valid;
            assign inner_cmd_wire_third_stage_valid = inner_second_stage_valid_reg[i*NUM_OUTPUT_DATA+:NUM_MUX_SECOND_STAGE];
            always@(posedge clk)
            begin:third_stage_valid
                if(i_en && (~rst))
                begin
                    case(inner_cmd_wire_third_stage_valid)
                        8'b00000001:
                        begin
                            o_valid_reg[i] <= 1'b1;
                        end
                        8'b00000010:
                        begin
                            o_valid_reg[i] <= 1'b1;
                        end
                        8'b00000100:
                        begin
                            o_valid_reg[i] <= 1'b1;
                        end
                        8'b00001000:
                        begin
                            o_valid_reg[i] <= 1'b1;
                        end
                        8'b00010000:
                        begin
                            o_valid_reg[i] <= 1'b1;
                        end
                        8'b00100000:
                        begin
                            o_valid_reg[i] <= 1'b1;
                        end
                        8'b01000000:
                        begin
                            o_valid_reg[i] <= 1'b1;
                        end
                        8'b10000000:
                        begin
                            o_valid_reg[i] <= 1'b1;
                        end
                        default:
                        begin
                            o_valid_reg[i] <= 1'b0;                
                        end
                    endcase
                end
                else
                begin
                    o_valid_reg[i] <= 1'b0; 
                end
            end
        end
    endgenerate

    assign o_data_bus = o_data_bus_reg;
    assign o_valid = o_valid_reg;

endmodule
`endif




`ifdef In32_Out8_hier_3_lvl_2_2_8_separate
module crossbar_one_hot_seq#(
	parameter DATA_WIDTH = 32,      // could be arbitrary number
	parameter NUM_OUTPUT_DATA  = 8, // must be power of 2.
	parameter NUM_INPUT_DATA = 32   
)(
    // timeing signals
    clk,
    rst,

    // data signals
	i_valid,        // valid input data signal
	i_data_bus,     // input data bus coming into distribute switch
	
	o_valid,        // output valid
    o_data_bus,     // output data 

	// control signals
	i_en,           // distribute switch enable
	i_cmd           // the input should be one-hot encoded command 
);

	//parameter
	localparam TOTAL_COMMMAND = NUM_INPUT_DATA*NUM_OUTPUT_DATA;
	
	localparam WIDTH_INPUT_DATA = NUM_INPUT_DATA*DATA_WIDTH;
	localparam WIDTH_OUTPUT_DATA = NUM_OUTPUT_DATA*DATA_WIDTH;

	localparam NUM_IN_MUX_FIRST_STAGE = 2;
	localparam NUM_MUX_FIRST_STAGE = NUM_INPUT_DATA >> $clog2(NUM_IN_MUX_FIRST_STAGE);

	localparam NUM_IN_MUX_SECOND_STAGE = 2;
	localparam NUM_MUX_SECOND_STAGE = NUM_MUX_FIRST_STAGE >> $clog2(NUM_IN_MUX_SECOND_STAGE);

	localparam NUM_IN_MUX_THIRD_STAGE = NUM_MUX_SECOND_STAGE;
	localparam NUM_MUX_THIRD_STAGE = 1;

    // interface
	input                                        clk;
	input                                        rst;

	input  [NUM_INPUT_DATA-1:0]                  i_valid;             
	input  [WIDTH_INPUT_DATA-1:0]                i_data_bus;
	
	output [NUM_OUTPUT_DATA-1:0]                 o_valid;             
	output [WIDTH_OUTPUT_DATA-1:0]               o_data_bus; // {o_data_a, o_data_b}

	input                                        i_en;
	input  [TOTAL_COMMMAND-1:0]                  i_cmd;

    reg    [NUM_OUTPUT_DATA-1:0]                 o_valid_reg;
    reg    [WIDTH_OUTPUT_DATA-1:0]               o_data_bus_reg;
    
    // first pipeline stage -- buffer definition.
    reg    [NUM_OUTPUT_DATA*NUM_MUX_FIRST_STAGE*DATA_WIDTH-1:0]       inner_first_stage_data_reg;
    reg    [NUM_OUTPUT_DATA*NUM_MUX_FIRST_STAGE-1:0]                  inner_first_stage_valid_reg;

    // second pipeline stage -- buffer definition.
    reg    [NUM_OUTPUT_DATA*NUM_MUX_SECOND_STAGE*DATA_WIDTH-1:0]      inner_second_stage_data_reg;
    reg    [NUM_OUTPUT_DATA*NUM_MUX_SECOND_STAGE-1:0]                 inner_second_stage_valid_reg;
    
    genvar i,j,k;
    generate
        for(i=0; i<NUM_OUTPUT_DATA; i=i+1)
        begin:output_mux
            // first pipeline stage -- 16 * 2:1 mux logic.
            for(j=0; j< NUM_MUX_FIRST_STAGE; j=j+1)
            begin:first_stage
                wire  [NUM_IN_MUX_FIRST_STAGE-1:0]       inner_cmd_wire_data;
                assign  inner_cmd_wire_data = {i_cmd[(1+j*NUM_IN_MUX_FIRST_STAGE)*NUM_OUTPUT_DATA+i],i_cmd[(j*NUM_IN_MUX_FIRST_STAGE)*NUM_OUTPUT_DATA+i]};
                always@(posedge clk)
                begin
                    if(i_en && (~rst))
                    begin
                        case(inner_cmd_wire_data)
                            2'b01:
                            begin
                                inner_first_stage_data_reg[(i*NUM_MUX_FIRST_STAGE+j)*DATA_WIDTH+:DATA_WIDTH] <= (i_valid[0+j*NUM_IN_MUX_FIRST_STAGE])?i_data_bus[(0+j*NUM_IN_MUX_FIRST_STAGE)*DATA_WIDTH+:DATA_WIDTH]:{DATA_WIDTH{1'b0}};
                            end
                            2'b10:
                            begin
                                inner_first_stage_data_reg[(i*NUM_MUX_FIRST_STAGE+j)*DATA_WIDTH+:DATA_WIDTH] <= (i_valid[1+j*NUM_IN_MUX_FIRST_STAGE])?i_data_bus[(1+j*NUM_IN_MUX_FIRST_STAGE)*DATA_WIDTH+:DATA_WIDTH]:{DATA_WIDTH{1'b0}};
                            end
                            default:
                            begin
                                inner_first_stage_data_reg[(i*NUM_MUX_FIRST_STAGE+j)*DATA_WIDTH+:DATA_WIDTH] <= {DATA_WIDTH{1'b0}};
                            end
                        endcase
                    end
                    else
                    begin
                        inner_first_stage_data_reg[(i*NUM_MUX_FIRST_STAGE+j)*DATA_WIDTH+:DATA_WIDTH] <= {DATA_WIDTH{1'b0}};
                    end
                end
            end

            for(j=0; j< NUM_MUX_FIRST_STAGE; j=j+1)
            begin:first_stage_valid
                wire  [NUM_IN_MUX_FIRST_STAGE-1:0]       inner_cmd_wire_valid;
                assign  inner_cmd_wire_valid = {i_cmd[(1+j*NUM_IN_MUX_FIRST_STAGE)*NUM_OUTPUT_DATA+i],i_cmd[(j*NUM_IN_MUX_FIRST_STAGE)*NUM_OUTPUT_DATA+i]};
                always@(posedge clk)
                begin
                    if(i_en && (~rst))
                    begin
                        case(inner_cmd_wire_valid)
                            2'b01:
                            begin
                                inner_first_stage_valid_reg[(i*NUM_MUX_FIRST_STAGE+j)] <= (i_valid[0+j*NUM_IN_MUX_FIRST_STAGE])?1'b1:1'b0;
                            end
                            2'b10:
                            begin
                                inner_first_stage_valid_reg[(i*NUM_MUX_FIRST_STAGE+j)] <= (i_valid[1+j*NUM_IN_MUX_FIRST_STAGE])?1'b1:1'b0;
                            end
                            default:
                            begin
                                inner_first_stage_valid_reg[(i*NUM_MUX_FIRST_STAGE+j)] <= 1'b0;
                            end
                        endcase
                    end
                    else
                    begin
                        inner_first_stage_valid_reg[(i*NUM_MUX_FIRST_STAGE+j)] <= 1'b0; 
                    end
                end
            end

            // second pipeline stage -- 8 * 2:1 mux logic.
            for(j=0; j< NUM_MUX_SECOND_STAGE; j=j+1)
            begin:second_stage
                wire  [NUM_IN_MUX_SECOND_STAGE-1:0]       inner_cmd_wire_second_stage_data;
                assign  inner_cmd_wire_second_stage_data = inner_first_stage_valid_reg[(i*NUM_OUTPUT_DATA + j)*NUM_IN_MUX_FIRST_STAGE+:NUM_IN_MUX_FIRST_STAGE];
                always@(posedge clk)
                begin
                    if(i_en && (~rst))
                    begin
                        case(inner_cmd_wire_second_stage_data)
                            2'b01:
                            begin
                                inner_second_stage_data_reg[(i*NUM_MUX_SECOND_STAGE+j)*DATA_WIDTH+:DATA_WIDTH] <= inner_first_stage_data_reg[((i*NUM_OUTPUT_DATA + j)*NUM_IN_MUX_FIRST_STAGE+0)*DATA_WIDTH+:DATA_WIDTH];
                            end
                            2'b10:
                            begin
                                inner_second_stage_data_reg[(i*NUM_MUX_SECOND_STAGE+j)*DATA_WIDTH+:DATA_WIDTH] <= inner_first_stage_data_reg[((i*NUM_OUTPUT_DATA + j)*NUM_IN_MUX_FIRST_STAGE+1)*DATA_WIDTH+:DATA_WIDTH];
                            end
                            default:
                            begin
                                inner_second_stage_data_reg[(i*NUM_MUX_SECOND_STAGE+j)*DATA_WIDTH+:DATA_WIDTH] <= {DATA_WIDTH{1'b0}};
                            end
                        endcase
                    end
                    else
                    begin
                        inner_second_stage_data_reg[(i*NUM_MUX_SECOND_STAGE+j)*DATA_WIDTH+:DATA_WIDTH] <= {DATA_WIDTH{1'b0}};
                    end
                end
            end

            // second pipeline stage -- 8 * 2:1 mux logic.
            for(j=0; j< NUM_MUX_SECOND_STAGE; j=j+1)
            begin:second_stage_valid
                wire  [NUM_IN_MUX_SECOND_STAGE-1:0]       inner_cmd_wire_second_stage_valid;
                assign  inner_cmd_wire_second_stage_valid = inner_first_stage_valid_reg[(i*NUM_OUTPUT_DATA + j)*NUM_IN_MUX_FIRST_STAGE+:NUM_IN_MUX_FIRST_STAGE];
                always@(posedge clk)
                begin
                    if(i_en && (~rst))
                    begin
                        case(inner_cmd_wire_second_stage_valid)
                            2'b01:
                            begin
                                inner_second_stage_valid_reg[(i*NUM_MUX_SECOND_STAGE+j)] <= 1'b1;
                            end
                            2'b10:
                            begin
                                inner_second_stage_valid_reg[(i*NUM_MUX_SECOND_STAGE+j)] <= 1'b1;
                            end
                            default:
                            begin
                                inner_second_stage_valid_reg[(i*NUM_MUX_SECOND_STAGE+j)] <= 1'b0;
                            end
                        endcase
                    end
                    else
                    begin
                        inner_second_stage_valid_reg[(i*NUM_MUX_SECOND_STAGE+j)] <= 1'b0; 
                    end
                end
            end

            // third stage -- a single 8:1 mux.
            wire  [NUM_IN_MUX_THIRD_STAGE-1:0]  inner_cmd_wire_third_stage;
            assign inner_cmd_wire_third_stage = inner_second_stage_valid_reg[i*NUM_OUTPUT_DATA+:NUM_MUX_SECOND_STAGE];
            always@(posedge clk)
            begin:third_stage
                if(i_en && (~rst))
                begin
                    case(inner_cmd_wire_third_stage)
                        8'b00000001:
                        begin
                            o_data_bus_reg[i*DATA_WIDTH+:DATA_WIDTH] <= inner_second_stage_data_reg[(i*NUM_OUTPUT_DATA+0)*DATA_WIDTH+:DATA_WIDTH];
                        end
                        8'b00000010:
                        begin
                            o_data_bus_reg[i*DATA_WIDTH+:DATA_WIDTH] <= inner_second_stage_data_reg[(i*NUM_OUTPUT_DATA+1)*DATA_WIDTH+:DATA_WIDTH];
                        end
                        8'b00000100:
                        begin
                            o_data_bus_reg[i*DATA_WIDTH+:DATA_WIDTH] <= inner_second_stage_data_reg[(i*NUM_OUTPUT_DATA+2)*DATA_WIDTH+:DATA_WIDTH];
                        end
                        8'b00001000:
                        begin
                            o_data_bus_reg[i*DATA_WIDTH+:DATA_WIDTH] <= inner_second_stage_data_reg[(i*NUM_OUTPUT_DATA+3)*DATA_WIDTH+:DATA_WIDTH];
                        end
                        8'b00010000:
                        begin
                            o_data_bus_reg[i*DATA_WIDTH+:DATA_WIDTH] <= inner_second_stage_data_reg[(i*NUM_OUTPUT_DATA+4)*DATA_WIDTH+:DATA_WIDTH];
                        end
                        8'b00100000:
                        begin
                            o_data_bus_reg[i*DATA_WIDTH+:DATA_WIDTH] <= inner_second_stage_data_reg[(i*NUM_OUTPUT_DATA+5)*DATA_WIDTH+:DATA_WIDTH];
                        end
                        8'b01000000:
                        begin
                            o_data_bus_reg[i*DATA_WIDTH+:DATA_WIDTH] <= inner_second_stage_data_reg[(i*NUM_OUTPUT_DATA+6)*DATA_WIDTH+:DATA_WIDTH];
                        end
                        8'b10000000:
                        begin
                            o_data_bus_reg[i*DATA_WIDTH+:DATA_WIDTH] <= inner_second_stage_data_reg[(i*NUM_OUTPUT_DATA+7)*DATA_WIDTH+:DATA_WIDTH];
                        end
                        default:
                        begin
                            o_data_bus_reg[i*DATA_WIDTH+:DATA_WIDTH] <= {DATA_WIDTH{1'b0}};
                        end
                    endcase
                end
                else
                begin
                    o_data_bus_reg[i*DATA_WIDTH+:DATA_WIDTH] <= {DATA_WIDTH{1'b0}};
                end
            end

            // third stage -- valid --  a single 8:1 mux.
            wire  [NUM_IN_MUX_THIRD_STAGE-1:0]  inner_cmd_wire_third_stage_valid;
            assign inner_cmd_wire_third_stage_valid = inner_second_stage_valid_reg[i*NUM_OUTPUT_DATA+:NUM_MUX_SECOND_STAGE];
            always@(posedge clk)
            begin:third_stage_valid
                if(i_en && (~rst))
                begin
                    case(inner_cmd_wire_third_stage_valid)
                        8'b00000001:
                        begin
                            o_valid_reg[i] <= 1'b1;
                        end
                        8'b00000010:
                        begin
                            o_valid_reg[i] <= 1'b1;
                        end
                        8'b00000100:
                        begin
                            o_valid_reg[i] <= 1'b1;
                        end
                        8'b00001000:
                        begin
                            o_valid_reg[i] <= 1'b1;
                        end
                        8'b00010000:
                        begin
                            o_valid_reg[i] <= 1'b1;
                        end
                        8'b00100000:
                        begin
                            o_valid_reg[i] <= 1'b1;
                        end
                        8'b01000000:
                        begin
                            o_valid_reg[i] <= 1'b1;
                        end
                        8'b10000000:
                        begin
                            o_valid_reg[i] <= 1'b1;
                        end
                        default:
                        begin
                            o_valid_reg[i] <= 1'b0;                
                        end
                    endcase
                end
                else
                begin
                    o_valid_reg[i] <= 1'b0; 
                end
            end
        end
    endgenerate

    assign o_data_bus = o_data_bus_reg;
    assign o_valid = o_valid_reg;

endmodule
`endif


