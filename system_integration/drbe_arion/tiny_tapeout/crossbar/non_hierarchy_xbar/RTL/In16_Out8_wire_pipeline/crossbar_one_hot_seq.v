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
// Author:      Jianming Tong (jianming.tong@gatech.edu)
/////////////////////////////////////////////////////////////
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

	localparam NUM_WIRE_PIPELINE = 5;
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
        for(i=0; i< NUM_WIRE_PIPELINE; i=i+1)
        begin:input_shift_def
            reg  [NUM_INPUT_DATA-1:0]            i_valid_shift;
            reg  [WIDTH_INPUT_DATA-1:0]          i_data_shift;
            reg  [TOTAL_COMMMAND-1:0]            i_cmd_shift;
        end 


        always @(posedge clk) 
        begin:shift_first
            input_shift_def[0].i_valid_shift <= i_valid;
            input_shift_def[0].i_data_shift <= i_data_bus;
            input_shift_def[0].i_cmd_shift <= i_cmd;
        end

        for(i=1; i< NUM_WIRE_PIPELINE; i=i+1)
        begin:input_shift
            always @(posedge clk) 
            begin
                input_shift_def[i].i_valid_shift <= input_shift_def[i-1].i_valid_shift;
                input_shift_def[i].i_data_shift <= input_shift_def[i-1].i_data_shift;
                input_shift_def[i].i_cmd_shift <= input_shift_def[i-1].i_cmd_shift;
            end
        end 
        

        for(i=0; i<NUM_OUTPUT_DATA; i=i+1)
        begin: o_data_output_mux
            wire [NUM_INPUT_DATA-1:0] inner_cmd_wire;
            assign inner_cmd_wire = {input_shift_def[4].i_cmd_shift[15*NUM_OUTPUT_DATA+i],input_shift_def[4].i_cmd_shift[14*NUM_OUTPUT_DATA+i],input_shift_def[4].i_cmd_shift[13*NUM_OUTPUT_DATA+i],input_shift_def[4].i_cmd_shift[12*NUM_OUTPUT_DATA+i],input_shift_def[4].i_cmd_shift[11*NUM_OUTPUT_DATA+i],input_shift_def[4].i_cmd_shift[10*NUM_OUTPUT_DATA+i],input_shift_def[4].i_cmd_shift[9*NUM_OUTPUT_DATA+i],input_shift_def[4].i_cmd_shift[8*NUM_OUTPUT_DATA+i],input_shift_def[4].i_cmd_shift[7*NUM_OUTPUT_DATA+i],input_shift_def[4].i_cmd_shift[6*NUM_OUTPUT_DATA+i],input_shift_def[4].i_cmd_shift[5*NUM_OUTPUT_DATA+i],input_shift_def[4].i_cmd_shift[4*NUM_OUTPUT_DATA+i],input_shift_def[4].i_cmd_shift[3*NUM_OUTPUT_DATA+i],input_shift_def[4].i_cmd_shift[2*NUM_OUTPUT_DATA+i],input_shift_def[4].i_cmd_shift[1*NUM_OUTPUT_DATA+i],input_shift_def[4].i_cmd_shift[0*NUM_OUTPUT_DATA+i]};
            
            //data_mux
            always@(posedge clk)
            begin
               if(i_en && (~rst))
                begin
                    case(inner_cmd_wire)
                        16'b0000000000000001:
                        begin
                            o_data_bus_reg[i*DATA_WIDTH+:DATA_WIDTH] <= (input_shift_def[4].i_valid_shift[0])?input_shift_def[4].i_data_shift[0*DATA_WIDTH+:DATA_WIDTH]:{DATA_WIDTH{1'b0}};
                        end
                        16'b0000000000000010:
                        begin
                            o_data_bus_reg[i*DATA_WIDTH+:DATA_WIDTH] <= (input_shift_def[4].i_valid_shift[1])?input_shift_def[4].i_data_shift[1*DATA_WIDTH+:DATA_WIDTH]:{DATA_WIDTH{1'b0}};
                        end
                        16'b0000000000000100:
                        begin
                            o_data_bus_reg[i*DATA_WIDTH+:DATA_WIDTH] <= (input_shift_def[4].i_valid_shift[2])?input_shift_def[4].i_data_shift[2*DATA_WIDTH+:DATA_WIDTH]:{DATA_WIDTH{1'b0}};
                        end
                        16'b0000000000001000:
                        begin
                            o_data_bus_reg[i*DATA_WIDTH+:DATA_WIDTH] <= (input_shift_def[4].i_valid_shift[3])?input_shift_def[4].i_data_shift[3*DATA_WIDTH+:DATA_WIDTH]:{DATA_WIDTH{1'b0}};
                        end
                        16'b0000000000010000:
                        begin
                            o_data_bus_reg[i*DATA_WIDTH+:DATA_WIDTH] <= (input_shift_def[4].i_valid_shift[4])?input_shift_def[4].i_data_shift[4*DATA_WIDTH+:DATA_WIDTH]:{DATA_WIDTH{1'b0}};
                        end
                        16'b0000000000100000:
                        begin
                            o_data_bus_reg[i*DATA_WIDTH+:DATA_WIDTH] <= (input_shift_def[4].i_valid_shift[5])?input_shift_def[4].i_data_shift[5*DATA_WIDTH+:DATA_WIDTH]:{DATA_WIDTH{1'b0}};
                        end
                        16'b0000000001000000:
                        begin
                            o_data_bus_reg[i*DATA_WIDTH+:DATA_WIDTH] <= (input_shift_def[4].i_valid_shift[6])?input_shift_def[4].i_data_shift[6*DATA_WIDTH+:DATA_WIDTH]:{DATA_WIDTH{1'b0}};
                        end
                        16'b0000000010000000:
                        begin
                            o_data_bus_reg[i*DATA_WIDTH+:DATA_WIDTH] <= (input_shift_def[4].i_valid_shift[7])?input_shift_def[4].i_data_shift[7*DATA_WIDTH+:DATA_WIDTH]:{DATA_WIDTH{1'b0}};
                        end
                        16'b0000000100000000:
                        begin
                            o_data_bus_reg[i*DATA_WIDTH+:DATA_WIDTH] <= (input_shift_def[4].i_valid_shift[8])?input_shift_def[4].i_data_shift[8*DATA_WIDTH+:DATA_WIDTH]:{DATA_WIDTH{1'b0}};
                        end
                        16'b0000001000000000:
                        begin
                            o_data_bus_reg[i*DATA_WIDTH+:DATA_WIDTH] <= (input_shift_def[4].i_valid_shift[9])?input_shift_def[4].i_data_shift[9*DATA_WIDTH+:DATA_WIDTH]:{DATA_WIDTH{1'b0}};
                        end
                        16'b0000010000000000:
                        begin
                            o_data_bus_reg[i*DATA_WIDTH+:DATA_WIDTH] <= (input_shift_def[4].i_valid_shift[10])?input_shift_def[4].i_data_shift[10*DATA_WIDTH+:DATA_WIDTH]:{DATA_WIDTH{1'b0}};
                        end
                        16'b0000100000000000:
                        begin
                            o_data_bus_reg[i*DATA_WIDTH+:DATA_WIDTH] <= (input_shift_def[4].i_valid_shift[11])?input_shift_def[4].i_data_shift[11*DATA_WIDTH+:DATA_WIDTH]:{DATA_WIDTH{1'b0}};
                        end
                        16'b0001000000000000:
                        begin
                            o_data_bus_reg[i*DATA_WIDTH+:DATA_WIDTH] <= (input_shift_def[4].i_valid_shift[12])?input_shift_def[4].i_data_shift[12*DATA_WIDTH+:DATA_WIDTH]:{DATA_WIDTH{1'b0}};
                        end
                        16'b0010000000000000:
                        begin
                            o_data_bus_reg[i*DATA_WIDTH+:DATA_WIDTH] <= (input_shift_def[4].i_valid_shift[13])?input_shift_def[4].i_data_shift[13*DATA_WIDTH+:DATA_WIDTH]:{DATA_WIDTH{1'b0}};
                        end
                        16'b0100000000000000:
                        begin
                            o_data_bus_reg[i*DATA_WIDTH+:DATA_WIDTH] <= (input_shift_def[4].i_valid_shift[14])?input_shift_def[4].i_data_shift[14*DATA_WIDTH+:DATA_WIDTH]:{DATA_WIDTH{1'b0}};
                        end
                        16'b1000000000000000:
                        begin
                            o_data_bus_reg[i*DATA_WIDTH+:DATA_WIDTH] <= (input_shift_def[4].i_valid_shift[15])?input_shift_def[4].i_data_shift[15*DATA_WIDTH+:DATA_WIDTH]:{DATA_WIDTH{1'b0}};
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
                if(i_en && (~rst))
                begin
                    case(inner_cmd_wire)
                        16'b0000000000000001:
                        begin
                            o_valid_reg[i] <= (input_shift_def[4].i_valid_shift[0])?1'b1:1'b0;
                        end
                        16'b0000000000000010:
                        begin
                            o_valid_reg[i] <= (input_shift_def[4].i_valid_shift[1])?1'b1:1'b0;
                        end
                        16'b0000000000000100:
                        begin
                            o_valid_reg[i] <= (input_shift_def[4].i_valid_shift[2])?1'b1:1'b0;
                        end
                        16'b0000000000001000:
                        begin
                            o_valid_reg[i] <= (input_shift_def[4].i_valid_shift[3])?1'b1:1'b0;
                        end
                        16'b0000000000010000:
                        begin
                            o_valid_reg[i] <= (input_shift_def[4].i_valid_shift[4])?1'b1:1'b0;
                        end
                        16'b0000000000100000:
                        begin
                            o_valid_reg[i] <= (input_shift_def[4].i_valid_shift[5])?1'b1:1'b0;
                        end
                        16'b0000000001000000:
                        begin
                            o_valid_reg[i] <= (input_shift_def[4].i_valid_shift[6])?1'b1:1'b0;
                        end
                        16'b0000000010000000:
                        begin
                            o_valid_reg[i] <= (input_shift_def[4].i_valid_shift[7])?1'b1:1'b0;
                        end
                        16'b0000000100000000:
                        begin
                            o_valid_reg[i] <= (input_shift_def[4].i_valid_shift[8])?1'b1:1'b0;
                        end
                        16'b0000001000000000:
                        begin
                            o_valid_reg[i] <= (input_shift_def[4].i_valid_shift[9])?1'b1:1'b0;
                        end
                        16'b0000010000000000:
                        begin
                            o_valid_reg[i] <= (input_shift_def[4].i_valid_shift[10])?1'b1:1'b0;
                        end
                        16'b0000100000000000:
                        begin
                            o_valid_reg[i] <= (input_shift_def[4].i_valid_shift[11])?1'b1:1'b0;
                        end
                        16'b0001000000000000:
                        begin
                            o_valid_reg[i] <= (input_shift_def[4].i_valid_shift[12])?1'b1:1'b0;
                        end
                        16'b0010000000000000:
                        begin
                            o_valid_reg[i] <= (input_shift_def[4].i_valid_shift[13])?1'b1:1'b0;
                        end
                        16'b0100000000000000:
                        begin
                            o_valid_reg[i] <= (input_shift_def[4].i_valid_shift[14])?1'b1:1'b0;
                        end
                        16'b1000000000000000:
                        begin
                            o_valid_reg[i] <= (input_shift_def[4].i_valid_shift[15])?1'b1:1'b0;
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