module crossbar_one_hot_seq#(
	parameter DATA_WIDTH = 32,      // could be arbitrary number
	parameter NUM_OUTPUT_DATA  = 16, // must be power of 2.
	parameter NUM_INPUT_DATA = 128   
)(

    // timeing signals
    CLK,
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

	localparam NUMBER_OUT_FIRST_STAGE = NUM_OUTPUT_DATA;
	localparam NUMBER_IN_FIRST_STAGE = 1;
	localparam NUMBER_OUT_SEC_STAGE = 1;
    
    // interface
	input                                        CLK;
	input                                        rst;
	
	input  [NUM_INPUT_DATA-1:0]                  i_valid;             
	input  [WIDTH_INPUT_DATA-1:0]                i_data_bus;
	
	output [NUM_OUTPUT_DATA-1:0]                 o_valid;             
	output [WIDTH_OUTPUT_DATA-1:0]               o_data_bus; // {o_data_a, o_data_b}

	input                                        i_en;
	input  [TOTAL_COMMAND-1:0]                   i_cmd;


    // inner logic
    genvar i,j,k;
    generate
        // wire definition -- for input data & valid
        wire [NUM_OUTPUT_DATA*NUM_INPUT_DATA*DATA_WIDTH-1:0]  o_inner_data_wire;
        wire [NUM_OUTPUT_DATA*NUM_INPUT_DATA-1:0]             o_inner_valid_wire;
        wire [NUM_OUTPUT_DATA*NUM_INPUT_DATA-1:0]             o_inner_cmd_wire;
        
        // wire_tree_pipeline -- for input data & valid
        for(i=0; i<NUM_INPUT_DATA; i=i+1)
        begin: top_half
            wire_binary_tree_1_16_seq#(
                .DATA_WIDTH(DATA_WIDTH), 
                .NUM_OUTPUT_DATA(NUM_OUTPUT_DATA),
                .NUM_INPUT_DATA(NUMBER_IN_FIRST_STAGE)) 
            wire_pipeline(
                .CLK(CLK),
                .rst(rst),
                .i_valid(i_valid[i]),
                .i_data_bus(i_data_bus[i*DATA_WIDTH+:DATA_WIDTH]),
                .o_valid({o_inner_valid_wire[15*NUM_INPUT_DATA+i], o_inner_valid_wire[14*NUM_INPUT_DATA+i], o_inner_valid_wire[13*NUM_INPUT_DATA+i], o_inner_valid_wire[12*NUM_INPUT_DATA+i], o_inner_valid_wire[11*NUM_INPUT_DATA+i], o_inner_valid_wire[10*NUM_INPUT_DATA+i], o_inner_valid_wire[9*NUM_INPUT_DATA+i], o_inner_valid_wire[8*NUM_INPUT_DATA+i],o_inner_valid_wire[7*NUM_INPUT_DATA+i], o_inner_valid_wire[6*NUM_INPUT_DATA+i], o_inner_valid_wire[5*NUM_INPUT_DATA+i], o_inner_valid_wire[4*NUM_INPUT_DATA+i], o_inner_valid_wire[3*NUM_INPUT_DATA+i], o_inner_valid_wire[2*NUM_INPUT_DATA+i], o_inner_valid_wire[1*NUM_INPUT_DATA+i], o_inner_valid_wire[0*NUM_INPUT_DATA+i]}),
                .o_data_bus({o_inner_data_wire[(15*NUM_INPUT_DATA+i)*DATA_WIDTH+:DATA_WIDTH], o_inner_data_wire[(14*NUM_INPUT_DATA+i)*DATA_WIDTH+:DATA_WIDTH], o_inner_data_wire[(13*NUM_INPUT_DATA+i)*DATA_WIDTH+:DATA_WIDTH], o_inner_data_wire[(12*NUM_INPUT_DATA+i)*DATA_WIDTH+:DATA_WIDTH], o_inner_data_wire[(11*NUM_INPUT_DATA+i)*DATA_WIDTH+:DATA_WIDTH], o_inner_data_wire[(10*NUM_INPUT_DATA+i)*DATA_WIDTH+:DATA_WIDTH], o_inner_data_wire[(9*NUM_INPUT_DATA+i)*DATA_WIDTH+:DATA_WIDTH], o_inner_data_wire[(8*NUM_INPUT_DATA+i)*DATA_WIDTH+:DATA_WIDTH],o_inner_data_wire[(7*NUM_INPUT_DATA+i)*DATA_WIDTH+:DATA_WIDTH], o_inner_data_wire[(6*NUM_INPUT_DATA+i)*DATA_WIDTH+:DATA_WIDTH], o_inner_data_wire[(5*NUM_INPUT_DATA+i)*DATA_WIDTH+:DATA_WIDTH], o_inner_data_wire[(4*NUM_INPUT_DATA+i)*DATA_WIDTH+:DATA_WIDTH], o_inner_data_wire[(3*NUM_INPUT_DATA+i)*DATA_WIDTH+:DATA_WIDTH], o_inner_data_wire[(2*NUM_INPUT_DATA+i)*DATA_WIDTH+:DATA_WIDTH], o_inner_data_wire[(1*NUM_INPUT_DATA+i)*DATA_WIDTH+:DATA_WIDTH], o_inner_data_wire[(0*NUM_INPUT_DATA+i)*DATA_WIDTH+:DATA_WIDTH]}),
                .i_en(i_en)
            );
        end

        // input command
        for(i=0; i<NUM_INPUT_DATA; i=i+1)
        begin:i_cmd_id  
            // wire                                             o_inner_cmd_wire[0:NUM_INPUT_DATA-1];
            
            cmd_wire_binary_tree_1_16_seq #(
                .DATA_WIDTH(DATA_WIDTH), 
                .NUM_OUTPUT_DATA(NUM_OUTPUT_DATA),
                .NUM_INPUT_DATA(NUMBER_IN_FIRST_STAGE)) 
            cmd_pipeline(
                .CLK(CLK),
                .rst(rst),
                .i_cmd(i_cmd[i*NUM_OUTPUT_DATA+:NUM_OUTPUT_DATA]),
                .o_cmd_0(o_inner_cmd_wire[0*NUM_INPUT_DATA+i]),
                .o_cmd_1(o_inner_cmd_wire[1*NUM_INPUT_DATA+i]),
                .o_cmd_2(o_inner_cmd_wire[2*NUM_INPUT_DATA+i]),
                .o_cmd_3(o_inner_cmd_wire[3*NUM_INPUT_DATA+i]),
                .o_cmd_4(o_inner_cmd_wire[4*NUM_INPUT_DATA+i]),
                .o_cmd_5(o_inner_cmd_wire[5*NUM_INPUT_DATA+i]),
                .o_cmd_6(o_inner_cmd_wire[6*NUM_INPUT_DATA+i]),
                .o_cmd_7(o_inner_cmd_wire[7*NUM_INPUT_DATA+i]),
                .o_cmd_8(o_inner_cmd_wire[8*NUM_INPUT_DATA+i]),
                .o_cmd_9(o_inner_cmd_wire[9*NUM_INPUT_DATA+i]),
                .o_cmd_10(o_inner_cmd_wire[10*NUM_INPUT_DATA+i]),
                .o_cmd_11(o_inner_cmd_wire[11*NUM_INPUT_DATA+i]),
                .o_cmd_12(o_inner_cmd_wire[12*NUM_INPUT_DATA+i]),
                .o_cmd_13(o_inner_cmd_wire[13*NUM_INPUT_DATA+i]),
                .o_cmd_14(o_inner_cmd_wire[14*NUM_INPUT_DATA+i]),
                .o_cmd_15(o_inner_cmd_wire[15*NUM_INPUT_DATA+i]),
                .i_en(i_en)
            );
        end
        
        // sixteen 128:1 mux tree
        for(i=0; i<NUM_OUTPUT_DATA; i=i+1)
        begin: bottom_half
            wire [NUM_INPUT_DATA*DATA_WIDTH-1:0]  inner_data_i_mux_tree_wire;
            wire [NUM_INPUT_DATA-1:0]             inner_valid_i_mux_tree_wire;
            wire [NUM_INPUT_DATA-1:0]             inner_cmd_i_mux_tree_wire;
 
            assign inner_data_i_mux_tree_wire = {o_inner_data_wire[i*NUM_INPUT_DATA*DATA_WIDTH+:NUM_INPUT_DATA*DATA_WIDTH]};
            assign inner_valid_i_mux_tree_wire = {o_inner_valid_wire[i*NUM_INPUT_DATA+:NUM_INPUT_DATA]};
            assign inner_cmd_i_mux_tree_wire = {o_inner_cmd_wire[i*NUM_INPUT_DATA+:NUM_INPUT_DATA]};

            mux_tree_128_1_seq #(
                .NUM_INPUT_DATA(NUM_INPUT_DATA), 
                .NUM_OUTPUT_DATA(NUMBER_OUT_SEC_STAGE),
                .DATA_WIDTH(DATA_WIDTH))
            mux_tree(
                .CLK(CLK),
                .rst(rst),
                .i_valid(inner_valid_i_mux_tree_wire),
                .i_data_bus(inner_data_i_mux_tree_wire),
                .o_valid(o_valid[i]),
                .o_data_bus(o_data_bus[i*DATA_WIDTH+:DATA_WIDTH]),
                .i_en(i_en),
                .i_cmd(inner_cmd_i_mux_tree_wire)
            );
        end

    endgenerate

endmodule
