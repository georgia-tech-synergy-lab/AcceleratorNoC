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