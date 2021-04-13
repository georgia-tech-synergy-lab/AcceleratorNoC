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

            // // third stage -- valid -- a single 8:1 or tree.
            // localparam  LEVEL_OR_TREE = $clog2(NUM_IN_MUX_THIRD_STAGE);
            
            // wire  [NUM_IN_MUX_THIRD_STAGE-1:0]          inner_cmd_wire_third_stage_valid;
            // assign inner_cmd_wire_third_stage_valid = inner_second_stage_valid_reg[i*NUM_OUTPUT_DATA+:NUM_MUX_SECOND_STAGE];

            // for (j=0; j<LEVEL_OR_TREE-1; j=j+1)
            // begin: o_valid_gen_tree_lvl
            //     localparam WIDTH_VALID = NUM_IN_MUX_THIRD_STAGE>>(j+1);
            //     wire   [WIDTH_VALID-1:0]  inner_o_valid_tree_reg;
            // end
            
            // for (j=0; j<LEVEL_OR_TREE-1; j=j+1)
            // begin: o_valid_gen_tree_lvl_assignment
            //     localparam WIDTH_VALID = (NUM_IN_MUX_THIRD_STAGE>>(j+1));
            //     wire   [WIDTH_VALID-1:0]  inner_o_valid_tree_reg;
            //     for (k=0; k<(WIDTH_VALID); k=k+1)
            //     begin: wire_assignment
            //         if(j==0)
            //         begin
            //             assign o_valid_gen_tree_lvl[j].inner_o_valid_tree_reg[k] = inner_cmd_wire_third_stage_valid[2*k] | inner_cmd_wire_third_stage_valid[2*k+1];
            //         end
            //         else
            //         begin
            //             assign o_valid_gen_tree_lvl[j].inner_o_valid_tree_reg[k] = o_valid_gen_tree_lvl[j-1].inner_o_valid_tree_reg[2*k] | o_valid_gen_tree_lvl[j-1].inner_o_valid_tree_reg[2*k+1];
            //         end
            //     end
            // end
            
            // always@(posedge clk)
            // begin
            //     if(i_en && (~rst))
            //     begin
            //         o_valid_reg[i] <= o_valid_gen_tree_lvl[LEVEL_OR_TREE-2].inner_o_valid_tree_reg[0] | o_valid_gen_tree_lvl[LEVEL_OR_TREE-2].inner_o_valid_tree_reg[1];
            //     end
            // end


        end
    endgenerate

    assign o_data_bus = o_data_bus_reg;
    assign o_valid = o_valid_reg;

endmodule