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
    
    localparam  NUM_OUT_WIRE_PIPELINE = 3;
	
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
