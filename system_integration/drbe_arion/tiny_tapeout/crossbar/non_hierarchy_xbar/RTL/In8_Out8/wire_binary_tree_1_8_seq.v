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
	localparam TOTAL_COMMAND = NUM_INPUT_DATA*NUM_OUTPUT_DATA;
	
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