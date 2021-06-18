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
	localparam TOTAL_COMMAND = NUM_INPUT_DATA*NUM_OUTPUT_DATA;
	
	localparam WIDTH_INPUT_DATA = NUM_INPUT_DATA*DATA_WIDTH;
	localparam WIDTH_OUTPUT_DATA = NUM_OUTPUT_DATA*DATA_WIDTH;
	localparam NUM_LEVEL = $clog2(NUM_OUTPUT_DATA);

    // interface
	input                                        clk;
	input                                        rst;

	input  [TOTAL_COMMAND-1:0]                  i_cmd;  

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