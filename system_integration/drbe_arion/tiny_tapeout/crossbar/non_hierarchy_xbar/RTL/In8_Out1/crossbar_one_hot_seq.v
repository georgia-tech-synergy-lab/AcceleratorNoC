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
	localparam TOTAL_COMMAND = NUM_INPUT_DATA*NUM_OUTPUT_DATA;
	
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
	input  [TOTAL_COMMAND-1:0]                  i_cmd;

    reg 
    reg    [NUM_OUTPUT_DATA-1:0]                 o_valid_reg;
    reg    [WIDTH_OUTPUT_DATA-1:0]               o_data_bus_reg;

    // reg    [WIDTH_OUTPUT_DATA-1:0]               i_data_bus_reg;
    // reg    [NUM_OUTPUT_DATA-1:0]                 i_valid_reg;
	// reg    [TOTAL_COMMAND-1:0]                  i_cmd_reg;

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