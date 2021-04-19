module binary_tree_8_64_seq#(
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
    o_cmd,          // output cmd

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
	output [TOTAL_COMMMAND-1:0]                  o_cmd; // {o_data_a, o_data_b}

	input                                        i_en;
	input  [TOTAL_COMMMAND-1:0]                  i_cmd;


    // inner logic
    genvar i,j,k;
    generate

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
                .o_valid({o_valid[7*NUM_OUTPUT_DATA+i], o_inner_valid_wire[6*NUM_OUTPUT_DATA+i], o_inner_valid_wire[5*NUM_OUTPUT_DATA+i], o_inner_valid_wire[4*NUM_OUTPUT_DATA+i], o_inner_valid_wire[3*NUM_OUTPUT_DATA+i], o_inner_valid_wire[2*NUM_OUTPUT_DATA+i], o_inner_valid_wire[1*NUM_OUTPUT_DATA+i], o_inner_valid_wire[0*NUM_OUTPUT_DATA+i]}),
                .o_data_bus({o_data_bus[(7*NUM_OUTPUT_DATA+i)*DATA_WIDTH+:DATA_WIDTH], o_inner_data_wire[(6*NUM_OUTPUT_DATA+i)*DATA_WIDTH+:DATA_WIDTH], o_inner_data_wire[(5*NUM_OUTPUT_DATA+i)*DATA_WIDTH+:DATA_WIDTH], o_inner_data_wire[(4*NUM_OUTPUT_DATA+i)*DATA_WIDTH+:DATA_WIDTH], o_inner_data_wire[(3*NUM_OUTPUT_DATA+i)*DATA_WIDTH+:DATA_WIDTH], o_inner_data_wire[(2*NUM_OUTPUT_DATA+i)*DATA_WIDTH+:DATA_WIDTH], o_inner_data_wire[(1*NUM_OUTPUT_DATA+i)*DATA_WIDTH+:DATA_WIDTH], o_inner_data_wire[(0*NUM_OUTPUT_DATA+i)*DATA_WIDTH+:DATA_WIDTH]}),
                .i_en(i_en)
            );
        end

        // input command
        for(i=0; i<NUM_INPUT_DATA; i=i+1)
        begin:i_cmd_id  
            // wire                                             o_inner_cmd_wire[0:NUM_INPUT_DATA-1];
            
            cmd_wire_binary_tree_1_8_seq #(
                .DATA_WIDTH(DATA_WIDTH), 
                .NUM_OUTPUT_DATA(8),
                .NUM_INPUT_DATA(1)) 
            cmd_pipeline(
                .clk(clk),
                .rst(rst),
                .i_cmd(i_cmd[i*NUM_OUTPUT_DATA+:NUM_OUTPUT_DATA]),
                .o_cmd_0(o_cmd[0*NUM_OUTPUT_DATA+i]),
                .o_cmd_1(o_cmd[1*NUM_OUTPUT_DATA+i]),
                .o_cmd_2(o_cmd[2*NUM_OUTPUT_DATA+i]),
                .o_cmd_3(o_cmd[3*NUM_OUTPUT_DATA+i]),
                .o_cmd_4(o_cmd[4*NUM_OUTPUT_DATA+i]),
                .o_cmd_5(o_cmd[5*NUM_OUTPUT_DATA+i]),
                .o_cmd_6(o_cmd[6*NUM_OUTPUT_DATA+i]),
                .o_cmd_7(o_cmd[7*NUM_OUTPUT_DATA+i]),
                .i_en(i_en)
            );
        end

    endgenerate

endmodule