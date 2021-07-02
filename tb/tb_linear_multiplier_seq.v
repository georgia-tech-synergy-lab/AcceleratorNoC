`timescale 1ns / 1ps
/////////////////////////////////////////////////////////////
// Top Module:  tb_linear_multiplier_seq
// Data:        Only data width matters.
// Format:      keeping the input format unchange
// Timing:      Sequential Logic, each switch takes one clock cycle
// Dummy Data:  {DATA_WIDTH{1'b0}}
// 
// Function:    Multiplier with forwarding link for data local reuse
//                                
//                             first clock posedge
//
//                         serve as input gate control -- i_cmd[0]
//       1'b1 -> i_data_fwd_reg remain unchanged             |     
//       1'b1 -> i_data_dynamic_wire remain unchanged        |     
//                                                           v
// 1'b0 & i_valid -> i_data_dynamic_wire = i_data_fwd_reg    |
// 1'b1 & i_valid -> i_data_dynamic_wire = i_data_stream_reg |                                   1'b1 & i_valid_dynamic_reg ->  o_fwd_bus = i_data_dynamic_wire
//                        serve as the input selection -- i_cmd[2]                   i_cmd[3] -- serve as output fwd enable
//                                                           |                          |  
//                                 i_data_fwd_reg            |                          v  
//                                   ______               |\ v                         ____
//  i_fwd_bus & i_fwd_valid -------->_|_|_|-------------->| \                     |---|   |---> o_fwd_bus & o_fwd_valid
//                              /|                        |  |                    |   |___|     
//                             / |   ______               |  |     ______         |    ___
//                            |  |-->_|_|_|-------------->|  |---->_|_|_|------------>|   | 
//    i_data_bus & i_valid -->|  |  i_data_stream_reg     | /  i_data_dynamic_wire    | X |----> o_data_bus & o_valid
//                             \ |   ______               |/                          |   | 
//                              \|-->_|_|_|------------------------------------------>|___|     
//                              ^   i_data_stationary_reg
//                              |   
//                           i_cmd[1] -- serve as reg selection
//                              |        1'b0 & i_valid -> i_data_stationary_reg = i_data_bus
//                              |        1'b1 & i_valid -> i_data_stream_reg = i_data_bus
//                              |
//                           i_cmd[0] -- serve as input gate control
//                                       1'b1 -> i_data_stationary_reg remain unchanged
//                                       1'b1 -> i_data_stream_reg remain unchanged
// 
// Note: there might be some demand for changing i_data_stream_reg & i_data_stationary_reg & i_data_dynamic_reg into FIFO
//              
// Author:      Jianming Tong (jianming.tong@gatech.edu)
/////////////////////////////////////////////////////////////
// `define base_testcase       // choose bit_selection_32x16_seq module in the linear_multiplier_seq module.
`define multiplier_16_kernel_3_datawidth_8 // choose bit_selection_16x8_seq module in the linear_multiplier_seq module.

`ifdef multiplier_16_kernel_3_datawidth_8
module tb_linear_multiplier_seq();

	parameter DATA_WIDTH  = 8;
	parameter NUM_NODE  = 4;
	parameter COMMAND_WIDTH  = 4 + $clog2(DATA_WIDTH);

	localparam WIDTH_INPUT_DATA = NUM_NODE * DATA_WIDTH;
	localparam WIDTH_OUTPUT_DATA = NUM_NODE * DATA_WIDTH;
	localparam TOTAL_COMMAND_WIDTH = NUM_NODE * COMMAND_WIDTH;
    
    // timing signals
    reg                               clk;
    reg                               rst;

    // data signals
	reg    [NUM_NODE-1:0]             i_valid;        // valid input data signal
	reg    [WIDTH_INPUT_DATA-1:0]     i_data_bus;     // input data bus coming into mux
 
	wire   [NUM_NODE-1:0]             o_valid;        // output valid
    wire   [WIDTH_OUTPUT_DATA-1:0]    o_data_bus;     // output data 
	
	// control signals
	reg                               i_en;           // mux enable
	reg    [TOTAL_COMMAND_WIDTH-1:0]  i_cmd;          // command 
                                                      // 0 --> Branch Low
                                                      // 1 --> Branch High

    // Test case declaration
    initial 
    begin
        // disable
        clk = 1'b1;
        rst = 1'b0;
        i_data_bus = {{(DATA_WIDTH>>2){4'hA}},{(DATA_WIDTH>>2){4'hA}},{(DATA_WIDTH>>2){4'hA}},{(DATA_WIDTH>>2){4'hA}}};
        i_valid = 4'hf;
        i_en = 1'b0;
        i_cmd = {{8'b11110101},{8'b11110101},{8'b11110101},{8'b11110101}};

        // reset
        #10
        rst = 1'b1;
        i_data_bus = {{(DATA_WIDTH>>2){4'hA}},{(DATA_WIDTH>>2){4'hA}},{(DATA_WIDTH>>2){4'hA}},{(DATA_WIDTH>>2){4'hA}}};
        i_valid = 4'hf;
        i_en = 1'b1;
        i_cmd = {{8'b11110101},{8'b11110101},{8'b11110101},{8'b11110101}};

        // case 1 - enable & ms_init_SteadyVal
        // 1. receive valid value from i_data_bus 
        // 2. store it into i_data_stationary_reg
        // 3. no multiplication -- output invalid
        // observed reg: i_data_stationary_reg = i_data_bus
        // all other regs are invalid
        // output expect (2 cycle later):
        // o_data_bus = 0
        // o_valid = 0 
        #10
        $display("o_data_bus: %h\n", o_data_bus);
        rst = 1'b0;
        i_valid = 4'hf;
        i_data_bus = {{(DATA_WIDTH>>2){4'h1}},{(DATA_WIDTH>>2){4'h1}},{(DATA_WIDTH>>2){4'h1}},{(DATA_WIDTH>>2){4'h1}}};
        i_en = 1'b1;
        i_cmd = {{8'b11110101},{8'b11110101},{8'b11110101},{8'b11110101}};

        // case 2 - enable & ms_runLEdgeFirst
        // 1. receive valid value from i_data_bus 
        // 2. store it into i_data_stream_reg
        // 3. do multiplication -- o_valid = 1 (use saved data from previous cycle)
        // observed reg: i_data_stream_reg = i_data_bus
        //               i_data_stationary_reg
        //               o_data_bus valid  
        // all other regs are invalid
        // output expect (2 cycle later):
        // o_data_bus = 2
        // o_valid = 1 
        #10
        $display("o_data_bus: %h\n", o_data_bus);
        rst = 1'b0;
        i_valid = 4'hf;
        i_data_bus = {{(DATA_WIDTH>>2){4'h2}},{(DATA_WIDTH>>2){4'h2}},{(DATA_WIDTH>>2){4'h2}},{(DATA_WIDTH>>2){4'h2}}};
        i_en = 1'b1;
        i_cmd = {{8'b11111111},{8'b11111111},{8'b11111111},{8'b11111111}};
        
        // case 3 - enable & ms_runLEdge
        // 1. receive valid value from i_data_bus
        // 2. store it into i_data_stream_reg
        // 3. do multiplication -- o_valid = 1 (use saved data from previous cycle)
        // observed reg: i_data_stream_reg = i_data_bus
        //               i_data_stationary_reg
        //               o_data_bus valid
        // all other regs are invalid
        // output expect (2 cycle later):
        // o_data_bus = 3
        // o_valid = 1 
        #10
        $display("o_data_bus: %h\n", o_data_bus);
        rst = 1'b0;
        i_valid = 4'hf;
        i_data_bus = {{(DATA_WIDTH>>2){4'h3}},{(DATA_WIDTH>>2){4'h3}},{(DATA_WIDTH>>2){4'h3}},{(DATA_WIDTH>>2){4'h3}}};
        i_en = 1'b1;
        i_cmd = {{8'b11111111},{8'b11111111},{8'b11111111},{8'b11111111}};

        // case 4 - enable & ms_runMiddleFirst
        // 1. receive valid value from i_data_bus
        // 2. store it into i_data_stream_reg
        // 3. do multiplication -- o_valid = 1 (use saved data from previous cycle)
        // observed reg: i_data_stream_reg = i_data_bus
        //               i_data_stationary_reg
        //               o_data_bus valid
        // all other regs are invalid
        // output expect (2 cycle later):
        // o_data_bus = 4
        // o_valid = 1 
        #10
        $display("o_data_bus: %h\n", o_data_bus);
        rst = 1'b0;
        i_valid = 4'hf;
        i_data_bus = {{(DATA_WIDTH>>2){4'h4}},{(DATA_WIDTH>>2){4'h4}},{(DATA_WIDTH>>2){4'h4}},{(DATA_WIDTH>>2){4'h4}}};
        i_en = 1'b1;
        i_cmd = {{8'b11111111},{8'b11111111},{8'b11111111},{8'b11111111}};

        // case 5 - enable & ms_runMiddle
        // 1. receive valid value from i_data_bus 
        // 2. store it into i_data_stream_reg
        // 3. do multiplication -- o_valid = 1 (use saved data from previous cycle)
        // 4. receive valid input forward data
        // observed reg: i_data_stream_reg = i_data_bus
        //               i_data_stationary_reg
        //               o_data_bus valid  
        // all other regs are invalid
        // output expect (2 cycle later):
        // o_data_bus = C
        // o_valid = 1 
        #10
        $display("o_data_bus: %h\n", o_data_bus);
        rst = 1'b0;
        i_valid = 4'hf;
        i_data_bus = {{(DATA_WIDTH>>2){4'h5}},{(DATA_WIDTH>>2){4'h5}},{(DATA_WIDTH>>2){4'h5}},{(DATA_WIDTH>>2){4'h5}}};
        i_en = 1'b1;
        i_cmd = {{8'b11111000},{8'b11111000},{8'b11111000},{8'b11111000}};
        
        // case 6 - enable & ms_runREdgeFirst
        // 1. receive invalid value from i_data_bus
        // 2. store it into i_data_stream_reg
        // 3. do multiplication -- o_valid = 1 (use saved data from previous cycle)
        // observed reg: i_data_stream_reg = i_data_bus
        //               i_data_stationary_reg
        //               o_data_bus valid  
        // all other regs are invalid
        // output expect (2 cycle later):
        // o_data_bus = 6
        // o_valid = 1
        #10
        $display("o_data_bus: %h\n", o_data_bus);
        rst = 1'b0;
        i_valid = 4'hf;
        i_data_bus = {{(DATA_WIDTH>>2){4'h6}},{(DATA_WIDTH>>2){4'h6}},{(DATA_WIDTH>>2){4'h6}},{(DATA_WIDTH>>2){4'h6}}};
        i_en = 1'b1;
        i_cmd = {{8'b11110111},{8'b11110111},{8'b11110111},{8'b11110111}};
        
        // case 7 - enable & ms_runREdge
        // 1. receive invalid value from i_data_bus
        // 2. store it into i_data_stream_reg
        // 3. do multiplication -- o_valid = 1 (use saved data from previous cycle)
        // observed reg: i_data_stream_reg = i_data_bus
        //               i_data_stationary_reg
        //               o_data_bus valid  
        // all other regs are invalid
        // output expect (2 cycle later):
        // o_data_bus = 7
        // o_valid = 1
        #10
        $display("o_data_bus: %h\n", o_data_bus);
        rst = 1'b0;
        i_valid = 4'hf;
        i_data_bus = {{(DATA_WIDTH>>2){4'h7}},{(DATA_WIDTH>>2){4'h7}},{(DATA_WIDTH>>2){4'h7}},{(DATA_WIDTH>>2){4'h7}}};
        i_en = 1'b1;
        i_cmd = {{8'b11110000},{8'b11110000},{8'b11110000},{8'b11110000}};

        // case 8 no valid input
        #10
        $display("o_data_bus: %h\n", o_data_bus);
        rst = 1'b0;
        i_valid = 1'b0;
        i_data_bus = {{(DATA_WIDTH>>2){4'h8}},{(DATA_WIDTH>>2){4'h8}},{(DATA_WIDTH>>2){4'h8}},{(DATA_WIDTH>>2){4'h8}}};
        i_en = 1'b1;
        i_cmd = {{8'b11110000},{8'b11110000},{8'b11110000},{8'b11110000}};

        #10
        $display("o_data_bus: %h\n", o_data_bus);
        #10     
        $display("o_data_bus: %h\n", o_data_bus);
        $stop;
    end

    // instantiate DUT (device under test)
    linear_multiplier_seq#(
        .DATA_WIDTH(DATA_WIDTH),         // could be arbitrary number
        .COMMAND_WIDTH(COMMAND_WIDTH),   // total input command bits.
        .NUM_NODE(NUM_NODE)
    )dut (
        .clk(clk),
        .rst(rst),
        .i_valid(i_valid),               // valid input data signal
        .i_data_bus(i_data_bus),         // input data
        .o_valid(o_valid),               // output valid
        .o_data_bus(o_data_bus),         // output data 
        .i_en(i_en),                     // distribute switch enable
        .i_cmd(i_cmd)                    // command 
    );

    always#5 clk=~clk;

endmodule
`endif 


`ifdef multiplier_16_kernel_3
module tb_linear_multiplier_seq();

	parameter DATA_WIDTH  = 8;
	parameter NUM_NODE  = 16;
	parameter COMMAND_WIDTH  = 4 + $clog2(DATA_WIDTH);

	localparam WIDTH_INPUT_DATA = NUM_NODE * DATA_WIDTH;
	localparam WIDTH_OUTPUT_DATA = NUM_NODE * DATA_WIDTH;
	localparam TOTAL_COMMAND_WIDTH = NUM_NODE * COMMAND_WIDTH;
    
    // timing signals
    reg                               clk;
    reg                               rst;

    // data signals
	reg    [NUM_NODE-1:0]             i_valid;        // valid input data signal
	reg    [WIDTH_INPUT_DATA-1:0]     i_data_bus;     // input data bus coming into mux
 
	wire   [NUM_NODE-1:0]             o_valid;        // output valid
    wire   [WIDTH_OUTPUT_DATA-1:0]    o_data_bus;     // output data 
	
	// control signals
	reg                               i_en;           // mux enable
	reg    [TOTAL_COMMAND_WIDTH-1:0]  i_cmd;          // command 
                                                      // 0 --> Branch Low
                                                      // 1 --> Branch High

    // Test case declaration
    initial 
    begin
        // disable
        clk = 1'b1;
        rst = 1'b0;
        i_data_bus = {{(DATA_WIDTH>>2){4'hA}},{(DATA_WIDTH>>2){4'hA}},{(DATA_WIDTH>>2){4'hA}},{(DATA_WIDTH>>2){4'hA}}};
        i_valid = 4'hf;
        i_en = 1'b0;
        i_cmd = {{8'b11110101},{8'b11110101},{8'b11110101},{8'b11110101}};

        // reset
        #10
        rst = 1'b1;
        i_data_bus = {{(DATA_WIDTH>>2){4'hA}},{(DATA_WIDTH>>2){4'hA}},{(DATA_WIDTH>>2){4'hA}},{(DATA_WIDTH>>2){4'hA}}};
        i_valid = 4'hf;
        i_en = 1'b1;
        i_cmd = {{8'b11110101},{8'b11110101},{8'b11110101},{8'b11110101}};

        // case 1 - enable & ms_init_SteadyVal
        // 1. receive valid value from i_data_bus 
        // 2. store it into i_data_stationary_reg
        // 3. no multiplication -- output invalid
        // observed reg: i_data_stationary_reg = i_data_bus
        // all other regs are invalid
        // output expect (2 cycle later):
        // o_data_bus = 0
        // o_valid = 0 
        #10
        $display("o_data_bus: %h\n", o_data_bus);
        rst = 1'b0;
        i_valid = 4'hf;
        i_data_bus = {{(DATA_WIDTH>>2){4'h1}},{(DATA_WIDTH>>2){4'h1}},{(DATA_WIDTH>>2){4'h1}},{(DATA_WIDTH>>2){4'h1}}};
        i_en = 1'b1;
        i_cmd = {{8'b11110101},{8'b11110101},{8'b11110101},{8'b11110101}};

        // case 2 - enable & ms_runLEdgeFirst
        // 1. receive valid value from i_data_bus 
        // 2. store it into i_data_stream_reg
        // 3. do multiplication -- o_valid = 1 (use saved data from previous cycle)
        // observed reg: i_data_stream_reg = i_data_bus
        //               i_data_stationary_reg
        //               o_data_bus valid  
        // all other regs are invalid
        // output expect (2 cycle later):
        // o_data_bus = 2
        // o_valid = 1 
        #10
        $display("o_data_bus: %h\n", o_data_bus);
        rst = 1'b0;
        i_valid = 4'hf;
        i_data_bus = {{(DATA_WIDTH>>2){4'h2}},{(DATA_WIDTH>>2){4'h2}},{(DATA_WIDTH>>2){4'h2}},{(DATA_WIDTH>>2){4'h2}}};
        i_en = 1'b1;
        i_cmd = {{8'b11111111},{8'b11111111},{8'b11111111},{8'b11111111}};
        
        // case 3 - enable & ms_runLEdge
        // 1. receive valid value from i_data_bus
        // 2. store it into i_data_stream_reg
        // 3. do multiplication -- o_valid = 1 (use saved data from previous cycle)
        // observed reg: i_data_stream_reg = i_data_bus
        //               i_data_stationary_reg
        //               o_data_bus valid
        // all other regs are invalid
        // output expect (2 cycle later):
        // o_data_bus = 3
        // o_valid = 1 
        #10
        $display("o_data_bus: %h\n", o_data_bus);
        rst = 1'b0;
        i_valid = 4'hf;
        i_data_bus = {{(DATA_WIDTH>>2){4'h3}},{(DATA_WIDTH>>2){4'h3}},{(DATA_WIDTH>>2){4'h3}},{(DATA_WIDTH>>2){4'h3}}};
        i_en = 1'b1;
        i_cmd = {{8'b11111111},{8'b11111111},{8'b11111111},{8'b11111111}};

        // case 4 - enable & ms_runMiddleFirst
        // 1. receive valid value from i_data_bus
        // 2. store it into i_data_stream_reg
        // 3. do multiplication -- o_valid = 1 (use saved data from previous cycle)
        // observed reg: i_data_stream_reg = i_data_bus
        //               i_data_stationary_reg
        //               o_data_bus valid
        // all other regs are invalid
        // output expect (2 cycle later):
        // o_data_bus = 4
        // o_valid = 1 
        #10
        $display("o_data_bus: %h\n", o_data_bus);
        rst = 1'b0;
        i_valid = 4'hf;
        i_data_bus = {{(DATA_WIDTH>>2){4'h4}},{(DATA_WIDTH>>2){4'h4}},{(DATA_WIDTH>>2){4'h4}},{(DATA_WIDTH>>2){4'h4}}};
        i_en = 1'b1;
        i_cmd = {{8'b11111111},{8'b11111111},{8'b11111111},{8'b11111111}};

        // case 5 - enable & ms_runMiddle
        // 1. receive valid value from i_data_bus 
        // 2. store it into i_data_stream_reg
        // 3. do multiplication -- o_valid = 1 (use saved data from previous cycle)
        // 4. receive valid input forward data
        // observed reg: i_data_stream_reg = i_data_bus
        //               i_data_stationary_reg
        //               o_data_bus valid  
        // all other regs are invalid
        // output expect (2 cycle later):
        // o_data_bus = C
        // o_valid = 1 
        #10
        $display("o_data_bus: %h\n", o_data_bus);
        rst = 1'b0;
        i_valid = 4'hf;
        i_data_bus = {{(DATA_WIDTH>>2){4'h5}},{(DATA_WIDTH>>2){4'h5}},{(DATA_WIDTH>>2){4'h5}},{(DATA_WIDTH>>2){4'h5}}};
        i_en = 1'b1;
        i_cmd = {{8'b11111000},{8'b11111000},{8'b11111000},{8'b11111000}};
        
        // case 6 - enable & ms_runREdgeFirst
        // 1. receive invalid value from i_data_bus
        // 2. store it into i_data_stream_reg
        // 3. do multiplication -- o_valid = 1 (use saved data from previous cycle)
        // observed reg: i_data_stream_reg = i_data_bus
        //               i_data_stationary_reg
        //               o_data_bus valid  
        // all other regs are invalid
        // output expect (2 cycle later):
        // o_data_bus = 6
        // o_valid = 1
        #10
        $display("o_data_bus: %h\n", o_data_bus);
        rst = 1'b0;
        i_valid = 4'hf;
        i_data_bus = {{(DATA_WIDTH>>2){4'h6}},{(DATA_WIDTH>>2){4'h6}},{(DATA_WIDTH>>2){4'h6}},{(DATA_WIDTH>>2){4'h6}}};
        i_en = 1'b1;
        i_cmd = {{8'b11110111},{8'b11110111},{8'b11110111},{8'b11110111}};
        
        // case 7 - enable & ms_runREdge
        // 1. receive invalid value from i_data_bus
        // 2. store it into i_data_stream_reg
        // 3. do multiplication -- o_valid = 1 (use saved data from previous cycle)
        // observed reg: i_data_stream_reg = i_data_bus
        //               i_data_stationary_reg
        //               o_data_bus valid  
        // all other regs are invalid
        // output expect (2 cycle later):
        // o_data_bus = 7
        // o_valid = 1
        #10
        $display("o_data_bus: %h\n", o_data_bus);
        rst = 1'b0;
        i_valid = 4'hf;
        i_data_bus = {{(DATA_WIDTH>>2){4'h7}},{(DATA_WIDTH>>2){4'h7}},{(DATA_WIDTH>>2){4'h7}},{(DATA_WIDTH>>2){4'h7}}};
        i_en = 1'b1;
        i_cmd = {{8'b11110000},{8'b11110000},{8'b11110000},{8'b11110000}};

        // case 8 no valid input
        #10
        $display("o_data_bus: %h\n", o_data_bus);
        rst = 1'b0;
        i_valid = 1'b0;
        i_data_bus = {{(DATA_WIDTH>>2){4'h8}},{(DATA_WIDTH>>2){4'h8}},{(DATA_WIDTH>>2){4'h8}},{(DATA_WIDTH>>2){4'h8}}};
        i_en = 1'b1;
        i_cmd = {{8'b11110000},{8'b11110000},{8'b11110000},{8'b11110000}};

        #10
        $display("o_data_bus: %h\n", o_data_bus);
        #10     
        $display("o_data_bus: %h\n", o_data_bus);
        $stop;
    end

    // instantiate DUT (device under test)
    linear_multiplier_seq#(
        .DATA_WIDTH(DATA_WIDTH),         // could be arbitrary number
        .COMMAND_WIDTH(COMMAND_WIDTH),   // total input command bits.
        .NUM_NODE(NUM_NODE)
    )dut (
        .clk(clk),
        .rst(rst),
        .i_valid(i_valid),               // valid input data signal
        .i_data_bus(i_data_bus),         // input data
        .o_valid(o_valid),               // output valid
        .o_data_bus(o_data_bus),         // output data 
        .i_en(i_en),                     // distribute switch enable
        .i_cmd(i_cmd)                    // command 
    );

    always#5 clk=~clk;

endmodule
`endif