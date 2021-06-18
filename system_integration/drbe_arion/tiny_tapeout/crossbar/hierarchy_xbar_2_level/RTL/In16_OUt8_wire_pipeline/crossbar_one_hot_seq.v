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
	localparam TOTAL_COMMAND = NUM_INPUT_DATA*NUM_OUTPUT_DATA;
	
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
	input  [TOTAL_COMMAND-1:0]                  i_cmd;

    reg    [NUM_OUTPUT_DATA-1:0]                 o_valid_reg;
    reg    [WIDTH_OUTPUT_DATA-1:0]               o_data_bus_reg;

    genvar i,j,k;
    generate
        // input wire pipeline -- divide wire into multiple pipeline stage to shorten the length of wire. 
        for(j=0; j< NUM_IN_WIRE_PIPELINE; j=j+1)
        begin:input_shift_def
            reg  [NUM_INPUT_DATA-1:0]            i_valid_shift;
            reg  [WIDTH_INPUT_DATA-1:0]          i_data_shift;
            reg  [TOTAL_COMMAND-1:0]            i_cmd_shift;
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