`timescale 1ns / 1ps
/////////////////////////////////////////////////////////////
// Top Module:  crossbar_one_hot_comb
// Data:        Only data width matters.
// Format:      keeping the input format unchange
// Timing:      Combinational Logic
// Dummy Data:  {DATA_WIDTH{1'b0}}
// Command:     Each data comes with a NUM_OUTPUT_DATA-bit one-hot destination command.
//              i_data_bus[0*DATA_WIDTH+:DATA_WIDTH] is corresponding to i_cmd
// Function:    Arbitrary Unicast  or  Arbitrary Multicast
// Note: this file is not parameterizable.
// 
// Example: A 5:4 crossbar. For a single cycle version
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
//
// Example: A 5:4 crossbar. For a hierarchy version [2 pipeline stages: first stage = 8* 8:1 mux -- second stage = 1* 8:1 mux;]
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
// Author:      Jianming Tong (jianming.tong@gatech.edu)
/////////////////////////////////////////////////////////////

module crossbar_one_hot_comb#( 
	parameter DATA_WIDTH = 32,      // could be arbitrary number
	parameter NUM_OUTPUT_DATA  = 8, // must be power of 2.
	parameter NUM_INPUT_DATA = 32   
)(
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

	// interface
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
            // first pipeline stage -- 8 * 8:1 mux logic.
            for(j=0; j< NUM_MUX_FIRST_STAGE; j=j+1)
            begin:first_stage
                wire  [NUM_IN_MUX_FIRST_STAGE-1:0]       inner_cmd_wire;
                assign  inner_cmd_wire = {i_cmd[(3+j*NUM_IN_MUX_FIRST_STAGE)*NUM_OUTPUT_DATA+i],i_cmd[(2+j*NUM_IN_MUX_FIRST_STAGE)*NUM_OUTPUT_DATA+i],i_cmd[(1+j*NUM_IN_MUX_FIRST_STAGE)*NUM_OUTPUT_DATA+i],i_cmd[(j*NUM_IN_MUX_FIRST_STAGE)*NUM_OUTPUT_DATA+i]};
                always@(*)
                begin
                    if(i_en)
                    begin
                        case(inner_cmd_wire)
                            4'b0001:
                            begin
                                inner_first_stage_data_reg[(i*NUM_MUX_FIRST_STAGE+j)*DATA_WIDTH+:DATA_WIDTH] <= (i_valid[0+j*NUM_IN_MUX_FIRST_STAGE])?i_data_bus[(0+j*NUM_IN_MUX_FIRST_STAGE)*DATA_WIDTH+:DATA_WIDTH]:{DATA_WIDTH{1'b0}};
                                inner_first_stage_valid_reg[(i*NUM_MUX_FIRST_STAGE+j)] <= 1'b1;
                            end
                            4'b0010:
                            begin
                                inner_first_stage_data_reg[(i*NUM_MUX_FIRST_STAGE+j)*DATA_WIDTH+:DATA_WIDTH] <= (i_valid[1+j*NUM_IN_MUX_FIRST_STAGE])?i_data_bus[(1+j*NUM_IN_MUX_FIRST_STAGE)*DATA_WIDTH+:DATA_WIDTH]:{DATA_WIDTH{1'b0}};
                                inner_first_stage_valid_reg[(i*NUM_MUX_FIRST_STAGE+j)] <= 1'b1;
                            end
                            4'b0100:
                            begin
                                inner_first_stage_data_reg[(i*NUM_MUX_FIRST_STAGE+j)*DATA_WIDTH+:DATA_WIDTH] <= (i_valid[2+j*NUM_IN_MUX_FIRST_STAGE])?i_data_bus[(2+j*NUM_IN_MUX_FIRST_STAGE)*DATA_WIDTH+:DATA_WIDTH]:{DATA_WIDTH{1'b0}};
                                inner_first_stage_valid_reg[(i*NUM_MUX_FIRST_STAGE+j)] <= 1'b1;
                            end
                            4'b1000:
                            begin
                                inner_first_stage_data_reg[(i*NUM_MUX_FIRST_STAGE+j)*DATA_WIDTH+:DATA_WIDTH] <= (i_valid[3+j*NUM_IN_MUX_FIRST_STAGE])?i_data_bus[(3+j*NUM_IN_MUX_FIRST_STAGE)*DATA_WIDTH+:DATA_WIDTH]:{DATA_WIDTH{1'b0}};
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
            always@(*)
            begin:second_stage
                if(i_en)
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