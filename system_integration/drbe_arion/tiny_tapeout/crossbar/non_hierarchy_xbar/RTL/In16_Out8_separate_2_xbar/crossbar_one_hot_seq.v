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
	
    
    localparam NUM_SEPARATE_FIRST_STAGE = 2;
	
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

    genvar i,j,k;
    generate
        // define output reg of the two 8:8 mux.
        for(k=0; k<NUM_SEPARATE_FIRST_STAGE; k=k+1)
        begin:first_stage_output_def
            // reg    [NUM_OUTPUT_DATA-1:0]                 o_valid_reg;
            wire   [NUM_OUTPUT_DATA-1:0]                 o_valid_wire;
            // reg    [WIDTH_OUTPUT_DATA-1:0]               o_data_bus_reg;
            wire   [WIDTH_OUTPUT_DATA-1:0]               o_data_bus_wire;
        end

        // two 8-to-8 xbar
        for(k=0; k<2;k=k+1)
        begin:xbar_8_8
            localparam  NUM_HALF_INPUT_DATA = NUM_INPUT_DATA>>1;
            localparam  NUM_HALF_COMMAND = TOTAL_COMMMAND>>1;

            crossbar_8_8_seq#(
                .DATA_WIDTH(DATA_WIDTH),      // could be arbitrary number
                .NUM_OUTPUT_DATA(NUM_OUTPUT_DATA), // must be power of 2.
                .NUM_INPUT_DATA(NUM_INPUT_DATA)   
            ) xba8_8(
                .clk(clk),
                .rst(rst),
                .i_valid(i_valid[k*NUM_HALF_INPUT_DATA+:NUM_HALF_INPUT_DATA]),            // valid input data signal
                .i_data_bus(i_data_bus[k*NUM_HALF_INPUT_DATA*DATA_WIDTH+:NUM_HALF_INPUT_DATA*DATA_WIDTH]),     // input data bus coming into distribute switch
                .o_valid(first_stage_output_def[k].o_valid_wire),                         // output valid
                .o_data_bus(first_stage_output_def[k].o_data_bus_wire),                   // output data 
                .i_en(i_en),                                                              // distribute switch enable
                .i_cmd(i_cmd[k*NUM_HALF_COMMAND+:NUM_HALF_COMMAND])                       // the input should be one-hot encoded command 
            );
        end

        // second stage -- eight 2:1 mux.
        for(i=0; i<NUM_OUTPUT_DATA; i=i+1)
        begin:arbiter_2_1_mux_data
            wire    [NUM_SEPARATE_FIRST_STAGE-1:0]   inner_cmd_wire_second_stage_data;
            assign  inner_cmd_wire_second_stage_data = {first_stage_output_def[1].o_valid_wire[i], first_stage_output_def[0].o_valid_wire[i]};

            always @(posedge clk) 
            begin
                if(i_en && (~rst))
                begin
                    case(inner_cmd_wire_second_stage_data)
                        2'b01:
                        begin
                            o_data_bus_reg[i*DATA_WIDTH+:DATA_WIDTH] <= first_stage_output_def[0].o_data_bus_wire[i*DATA_WIDTH+:DATA_WIDTH];                 
                        end                        
                        2'b10:
                        begin
                            o_data_bus_reg[i*DATA_WIDTH+:DATA_WIDTH] <= first_stage_output_def[1].o_data_bus_wire[i*DATA_WIDTH+:DATA_WIDTH];                 
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
        begin:arbiter_2_1_mux_valid
            wire    [NUM_SEPARATE_FIRST_STAGE-1:0]   inner_cmd_wire_second_stage_valid;
            assign  inner_cmd_wire_second_stage_valid = {first_stage_output_def[1].o_valid_wire[i], first_stage_output_def[0].o_valid_wire[i]};

            always @(posedge clk) 
            begin
                if(i_en && (~rst))
                begin
                    case(inner_cmd_wire_second_stage_valid)
                        2'b01:
                        begin
                            o_valid_reg[i] <= first_stage_output_def[0].o_valid_wire[i];                 
                        end                        
                        2'b10:
                        begin
                            o_valid_reg[i] <= first_stage_output_def[1].o_valid_wire[i];                 
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

module crossbar_8_8_seq#(
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

    endgenerate

    always @(posedge clk) 
    begin
        o_data_bus_reg <= o_data_bus_wire;
        o_valid_reg <= o_valid_wire;
    end

    assign o_data_bus = o_data_bus_reg;
    assign o_valid = o_valid_reg;

endmodule


module wire_binary_tree_1_8_seq #(
	parameter DATA_WIDTH = 32,      // could be arbitrary number
	parameter NUM_OUTPUT_DATA  = 8, // must be power of 2.
	parameter NUM_INPUT_DATA = 1   
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
	i_en            // distribute switch enable
);

	//parameter
	localparam TOTAL_COMMMAND = NUM_INPUT_DATA*NUM_OUTPUT_DATA;
	
	localparam WIDTH_INPUT_DATA = NUM_INPUT_DATA*DATA_WIDTH;
	localparam WIDTH_OUTPUT_DATA = NUM_OUTPUT_DATA*DATA_WIDTH;
	localparam NUM_LEVEL = $clog2(NUM_OUTPUT_DATA);

    // interface
	input                                        clk;
	input                                        rst;

	input  [NUM_INPUT_DATA-1:0]                  i_valid;             
	input  [WIDTH_INPUT_DATA-1:0]                i_data_bus;

	output [NUM_OUTPUT_DATA-1:0]                 o_valid;             
	output [WIDTH_OUTPUT_DATA-1:0]               o_data_bus; // {o_data_a, o_data_b}

	input                                        i_en;

    reg    [NUM_OUTPUT_DATA-1:0]                 o_valid_reg;
    reg    [WIDTH_OUTPUT_DATA-1:0]               o_data_bus_reg;


    genvar i,j;
    generate 
        for (i = 0; i< NUM_LEVEL; i=i+1)
        begin: wire_tree_level
            localparam NUM_SWITCH_SHIFT =  (4'b0001 << i);
            localparam WIDTH_DATA_LEVEL = NUM_SWITCH_SHIFT*DATA_WIDTH;

            // define the output wire for switches of level i
            reg      [WIDTH_DATA_LEVEL-1:0]         i_data_latch;
            reg      [NUM_SWITCH_SHIFT-1:0]         i_valid_latch;
        end

        always@(posedge clk)
        begin: first_level_assignment
            if(i_en && (~rst))
            begin
                wire_tree_level[0].i_data_latch <= i_data_bus;
                wire_tree_level[0].i_valid_latch <= i_valid;
            end
            else
            begin
                wire_tree_level[0].i_data_latch <= {DATA_WIDTH{1'b0}};
                wire_tree_level[0].i_valid_latch <= 1'b0;
            end
        end
        
        for (i = 0; i< NUM_LEVEL-1; i=i+1)
        begin: wire_tree_assignment
            localparam NUM_SWITCH_SHIFT =  (4'b0001 << i);
            localparam WIDTH_DATA_LEVEL = NUM_SWITCH_SHIFT*DATA_WIDTH; 
            
            for( j=0; j<NUM_SWITCH_SHIFT; j=j+1)
            begin: level_assignment
                always@(posedge clk)
                begin
                    if(i_en && (~rst))
                    begin
                        wire_tree_level[i+1].i_data_latch[(2*j)*DATA_WIDTH+:DATA_WIDTH] <= wire_tree_level[i].i_data_latch[j*DATA_WIDTH+:DATA_WIDTH];
                        wire_tree_level[i+1].i_valid_latch[2*j] <= wire_tree_level[i].i_valid_latch[j];

                        wire_tree_level[i+1].i_data_latch[(2*j+1)*DATA_WIDTH+:DATA_WIDTH] <= wire_tree_level[i].i_data_latch[j*DATA_WIDTH+:DATA_WIDTH];
                        wire_tree_level[i+1].i_valid_latch[2*j+1] <= wire_tree_level[i].i_valid_latch[j];
                    end
                    else
                    begin
                        wire_tree_level[i+1].i_data_latch[(2*j)*DATA_WIDTH+:DATA_WIDTH] <= {DATA_WIDTH{1'b0}};
                        wire_tree_level[i+1].i_valid_latch[2*j] <= 1'b0;

                        wire_tree_level[i+1].i_data_latch[(2*j+1)*DATA_WIDTH+:DATA_WIDTH] <= {DATA_WIDTH{1'b0}};
                        wire_tree_level[i+1].i_valid_latch[2*j+1] <= 1'b0;
                    end
                end
            end
        end

        for(i=0; i<(NUM_OUTPUT_DATA>>1); i=i+1)
        begin: assign_output_latch
            always @(posedge clk) begin
                if(i_en && (~rst))
                begin
                    o_data_bus_reg[2*i*DATA_WIDTH+:DATA_WIDTH] <= wire_tree_level[NUM_LEVEL-1].i_data_latch[i*DATA_WIDTH+:DATA_WIDTH];
                    o_valid_reg[2*i] <= wire_tree_level[NUM_LEVEL-1].i_valid_latch[i];

                    o_data_bus_reg[(2*i+1)*DATA_WIDTH+:DATA_WIDTH] <= wire_tree_level[NUM_LEVEL-1].i_data_latch[i*DATA_WIDTH+:DATA_WIDTH];
                    o_valid_reg[2*i+1] <= wire_tree_level[NUM_LEVEL-1].i_valid_latch[i];
                end
                else
                begin
                    o_data_bus_reg[2*i*DATA_WIDTH+:DATA_WIDTH] <= {DATA_WIDTH{1'b0}};
                    o_valid_reg[2*i] <= 1'b0;

                    o_data_bus_reg[(2*i+1)*DATA_WIDTH+:DATA_WIDTH] <= {DATA_WIDTH{1'b0}};
                    o_valid_reg[2*i+1] <= 1'b0;
                end
            end
        end
    endgenerate

    assign o_data_bus = o_data_bus_reg;
    assign o_valid = o_valid_reg;

endmodule


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
	localparam TOTAL_COMMMAND = NUM_INPUT_DATA*NUM_OUTPUT_DATA;
	
	localparam WIDTH_INPUT_DATA = NUM_INPUT_DATA*DATA_WIDTH;
	localparam WIDTH_OUTPUT_DATA = NUM_OUTPUT_DATA*DATA_WIDTH;
	localparam NUM_LEVEL = $clog2(NUM_OUTPUT_DATA);

    // interface
	input                                        clk;
	input                                        rst;

	input  [TOTAL_COMMMAND-1:0]                  i_cmd;  

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


module mux_tree_8_1_seq #(
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

	input                                        i_en;
	input  [TOTAL_COMMMAND-1:0]                  i_cmd;

    reg    [NUM_OUTPUT_DATA-1:0]                 o_valid_reg;
    reg    [WIDTH_OUTPUT_DATA-1:0]               o_data_bus_reg;

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