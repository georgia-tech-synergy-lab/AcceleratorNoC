`timescale 1ns / 1ps
/////////////////////////////////////////////////////////////
// Top Module:  tb_multiplier_seq
// Data:        Only data width matters.
// Format:      keeping the input format unchange
// Timing:      Sequential Logic, each switch takes one clock cycle
// Dummy Data:  {DATA_WIDTH{1'b0}}
// 
// Function:    Multiplier with forwarding link for data local reuse
// 
//                             first clock posedge
// 
// 1'b0 & i_valid -> data_dynamic_wire = i_data_fwd_latch
// 1'b1 & i_valid -> data_dynamic_wire = data_stream_reg                                    1'b1 & valid_dynamic_wire ->  o_fwd_bus = data_dynamic_wire
//                       serve as the input selection --  i_cmd[2]                   i_cmd[3] -- serve as output fwd enable
//                                                           |                          |  
//                                 i_data_fwd_latch          |                          v  
//                                   ______               |\ v                         ____
//  i_fwd_bus & i_fwd_valid -------->_|_|_|-------------->| \                     |---|   |---> o_fwd_bus & o_fwd_valid
//                              /|                        |  |                    |   |___|     
//                             / |   ______               |  |     ______         |    ___
//                            |  |-->_|_|_|-------------->|  |---->_|_|_|------------>|   | 
//    i_data_bus & i_valid -->|  |  data_stream_reg       | /  data_dynamic_wire      | X |----> o_data_bus & o_valid
//                             \ |   ______               |/                          |   | 
//                              \|-->_|_|_|------------------------------------------>|___|     
//                              ^   data_stationary_reg
//                              |   
//                           i_cmd[1] -- serve as reg selection
//                              |        1'b0 & i_valid -> data_stationary_reg = i_data_bus
//                              |        1'b1 & i_valid -> data_stream_reg = i_data_bus
//                              |
//                           i_cmd[0] -- serve as input gate control
//                                       1'b0 -> data_stationary_reg remain unchanged
//                                       1'b0 -> data_stream_reg remain unchanged
// 
// Note: there might be some demand for changing data_stream_reg & data_stationary_reg & data_dynamic_wire into FIFO
// 1. pattern to remember the configurations: 1 is always used to select data_stream_reg e.g. i_cmd[1] & i_cmd[2]
// 
// Author:      Jianming Tong (jianming.tong@gatech.edu)
/////////////////////////////////////////////////////////////
// `define INPUT4
`define INPUT8
// `define INPUT16 

`ifdef INPUT4
module tb_multiplier_seq();

	parameter DATA_WIDTH  = 4;
	parameter COMMAND_WIDTH  = 4 + $clog2(DATA_WIDTH) + 1;

    // timing signals
    reg                            clk;
    reg                            rst;

    // data signals
	reg                            i_valid;        // valid input data signal
	reg    [DATA_WIDTH-1:0]        i_data_bus;     // input data bus coming into mux
 
    reg                            i_fwd_valid;    // valid input data signal
	reg    [DATA_WIDTH-1:0]        i_fwd_bus;      // input data bus coming into mux
	
	wire                           o_valid;        // output valid
    wire   [DATA_WIDTH-1:0]        o_data_bus;     // output data 
	
	wire                           o_fwd_valid;    // output valid
    wire   [DATA_WIDTH-1:0]        o_fwd_bus;      // output data 

	// control signals
	reg                            i_en;           // mux enable
	reg    [COMMAND_WIDTH-1:0]     i_cmd;          // command 

/*
        Expected output
        # o_fwd_bus: 0; o_data_bus: 0
        # 
        # o_fwd_bus: 0; o_data_bus: 0
        # 
        # o_fwd_bus: 0; o_data_bus: 0
        # 
        # o_fwd_bus: 2; o_data_bus: 2
        # 
        # o_fwd_bus: 3; o_data_bus: 3
        # 
        # o_fwd_bus: 4; o_data_bus: 4
        # 
        # o_fwd_bus: c; o_data_bus: c
        # 
        # o_fwd_bus: 0; o_data_bus: 6
        # 
        # o_fwd_bus: 0; o_data_bus: 0
        # 
        # o_fwd_bus: 0; o_data_bus: 0
        # 
        # o_fwd_bus: 0; o_data_bus: 0
        # 
*/

    // Test case declaration
    initial
    begin
        // disable
        clk = 1'b1;
        rst = 1'b0;
        i_data_bus = {(DATA_WIDTH>>2){4'h0}};
        i_valid = 1'b1;

        i_fwd_bus = {(DATA_WIDTH>>2){4'h8}};
        i_fwd_valid = 1'b1;

        i_en = 1'b0;
        i_cmd = 7'b1110101;

        // reset
        #10
        rst = 1'b1;
        i_data_bus = {(DATA_WIDTH>>2){4'h0}};
        i_valid = 1'b1;

        i_fwd_bus = {(DATA_WIDTH>>2){4'h8}};
        i_fwd_valid = 1'b1;

        i_en = 1'b1;
        i_cmd = 7'b1110101;

        // case 1 - enable & ms_init_SteadyVal
        // 1. receive valid value from i_data_bus 
        // 2. store it into i_data_stationary_reg
        // 3. no multiplication -- output invalid
        // 4. forward data invalid
        // 5. cut LS 4 bits
        // observed reg: i_data_stationary_reg = i_data_bus
        // all other regs are invalid
        // output expect (appear 1 cycle later; used after 2 cycles):
        // o_data_bus = 0 
        // o_valid = 0 
        // o_fwd_bus = 0
        // o_fwd_valid = 0 
        #10
        $display("o_fwd_bus: %h; o_data_bus: %h\n", o_fwd_bus, o_data_bus);
        rst = 1'b0;
        i_valid = 1'b1;
        i_data_bus = {(DATA_WIDTH>>2){4'h1}};
        
        i_fwd_bus = {(DATA_WIDTH>>2){4'h8}};
        i_fwd_valid = 1'b1;

        i_en = 1'b1;
        i_cmd = 7'b0110101;

        // case 2 - enable & ms_runLEdgeFirst
        // 1. receive valid value from i_data_bus 
        // 2. store it into i_data_stream_reg
        // 3. do multiplication -- o_valid = 1 (use saved data from previous cycle)
        // 4. input forward data invalid
        // 5. cut LS 4 bits
        // observed reg: i_data_stream_reg = i_data_bus
        //               i_data_stationary_reg
        //               o_fwd valid  
        //               o_data_bus valid  
        // all other regs are invalid
        // output expect (appear 1 cycle later; used after 2 cycles):
        // o_data_bus = 2
        // o_valid = 1 
        // o_fwd_bus = 2
        // o_fwd_valid = 1 
        #10
        $display("o_fwd_bus: %h; o_data_bus: %h\n", o_fwd_bus, o_data_bus);
        rst = 1'b0;
        i_valid = 1'b1;
        i_data_bus = {(DATA_WIDTH>>2){4'h2}};
        
        i_fwd_bus = {(DATA_WIDTH>>2){4'h9}};
        i_fwd_valid = 1'b1;

        i_en = 1'b1;
        i_cmd = 7'b0111111;
        
        // case 3 - enable & ms_runLEdge
        // 1. receive valid value from i_data_bus
        // 2. store it into i_data_stream_reg
        // 3. do multiplication -- o_valid = 1 (use saved data from previous cycle)
        // 4. input forward data invalid
        // 5. cut LS 4 bits
        // observed reg: i_data_stream_reg = i_data_bus
        //               i_data_stationary_reg
        //               o_fwd valid
        //               o_data_bus valid
        // all other regs are invalid
        // output expect (appear 1 cycle later; used after 2 cycles):
        // o_data_bus = 3
        // o_valid = 1 
        // o_fwd_bus = 3
        // o_fwd_valid = 1 
        #10
        $display("o_fwd_bus: %h; o_data_bus: %h\n", o_fwd_bus, o_data_bus);
        rst = 1'b0;
        i_valid = 1'b1;
        i_data_bus = {(DATA_WIDTH>>2){4'h3}};
        
        i_fwd_bus = {(DATA_WIDTH>>2){4'hA}};
        i_fwd_valid = 1'b1;

        i_en = 1'b1;
        i_cmd = 7'b0111111;

        // case 4 - enable & ms_runMiddleFirst
        // 1. receive valid value from i_data_bus
        // 2. store it into i_data_stream_reg
        // 3. do multiplication -- o_valid = 1 (use saved data from previous cycle)
        // 4. input forward data invalid
        // 5. cut LS 4 bits
        // observed reg: i_data_stream_reg = i_data_bus
        //               i_data_stationary_reg
        //               o_fwd valid
        //               o_data_bus valid
        // all other regs are invalid
        // output expect (appear 1 cycle later; used after 2 cycles):
        // o_data_bus = 4
        // o_valid = 1 
        // o_fwd_bus = 4
        // o_fwd_valid = 1 
        #10
        $display("o_fwd_bus: %h; o_data_bus: %h\n", o_fwd_bus, o_data_bus);
        rst = 1'b0;
        i_valid = 1'b1;
        i_data_bus = {(DATA_WIDTH>>2){4'h4}};
        
        i_fwd_bus = {(DATA_WIDTH>>2){4'hB}};
        i_fwd_valid = 1'b1;

        i_en = 1'b1;
        i_cmd = 7'b0111111;

        // case 5 - enable & ms_runMiddle
        // 1. receive valid value from i_data_bus 
        // 2. store it into i_data_stream_reg
        // 3. do multiplication -- o_valid = 1 (use saved data from previous cycle)
        // 4. receive valid input forward data
        // 5. cut LS 4 bits
        // observed reg: i_data_stream_reg = i_data_bus
        //               i_data_stationary_reg
        //               o_fwd valid  
        //               o_data_bus valid  
        // all other regs are invalid
        // output expect (appear 1 cycle later; used after 2 cycles):
        // o_data_bus = C
        // o_valid = 1 
        // o_fwd_bus = C
        // o_fwd_valid = 1 
        #10
        $display("o_fwd_bus: %h; o_data_bus: %h\n", o_fwd_bus, o_data_bus);
        rst = 1'b0;
        i_valid = 1'b1;
        i_data_bus = {(DATA_WIDTH>>2){4'h5}};
        
        i_fwd_bus = {(DATA_WIDTH>>2){4'hC}};
        i_fwd_valid = 1'b1;

        i_en = 1'b1;
        i_cmd = 7'b0111000; 
        
        // case 6 - enable & ms_runREdgeFirst
        // 1. receive invalid value from i_data_bus
        // 2. store it into i_data_stream_reg
        // 3. do multiplication -- o_valid = 1 (use saved data from previous cycle)
        // 4. input forward value invalid 
        // 5. cut LS 4 bits
        // observed reg: i_data_stream_reg = i_data_bus
        //               i_data_stationary_reg
        //               o_fwd valid  
        //               o_data_bus valid  
        // all other regs are invalid
        // output expect (appear 1 cycle later; used after 2 cycles):
        // o_data_bus = 6
        // o_valid = 1
        // o_fwd_bus = 0
        // o_fwd_valid = 0 
        #10
        $display("o_fwd_bus: %h; o_data_bus: %h\n", o_fwd_bus, o_data_bus);
        rst = 1'b0;
        i_valid = 1'b1;
        i_data_bus = {(DATA_WIDTH>>2){4'h6}};
        
        i_fwd_bus = {(DATA_WIDTH>>2){4'hD}};
        i_fwd_valid = 1'b1;

        i_en = 1'b1;
        i_cmd = 7'b0110111; 
        
        // case 7 - enable & ms_runREdge
        // 1. receive invalid value from i_data_bus
        // 2. store it into i_data_stream_reg
        // 3. do multiplication -- o_valid = 1 (use saved data from previous cycle)
        // 4. receive valid input forward data
        // 5. cut LS 4 bits
        // observed reg: i_data_stream_reg = i_data_bus
        //               i_data_stationary_reg
        //               o_fwd valid  
        //               o_data_bus valid  
        // all other regs are invalid
        // output expect (appear 1 cycle later; used after 2 cycles):
        // o_data_bus = 7
        // o_valid = 1
        // o_fwd_bus = 0
        // o_fwd_valid = 0 
        #10
        $display("o_fwd_bus: %h; o_data_bus: %h\n", o_fwd_bus, o_data_bus);
        rst = 1'b0;
        i_valid = 1'b1;
        i_data_bus = {(DATA_WIDTH>>2){4'h7}};
        
        i_fwd_bus = {(DATA_WIDTH>>2){4'hE}};
        i_fwd_valid = 1'b1;

        i_en = 1'b1;
        i_cmd = 7'b0110000; 

        // case 8 - enable & ms_runREdge
        // 1. receive invalid value from i_data_bus
        // 2. store it into i_data_stream_reg
        // 3. do multiplication -- o_valid = 1 (use saved data from previous cycle)
        // 4. receive valid input forward data
        // 5. cut MS 4 bits
        // observed reg: i_data_stream_reg = i_data_bus
        //               i_data_stationary_reg
        //               o_fwd valid  
        //               o_data_bus valid  
        // all other regs are invalid
        // output expect (appear 1 cycle later; used after 2 cycles):
        // o_data_bus = 7
        // o_valid = 1
        // o_fwd_bus = 0
        // o_fwd_valid = 0 
        #10
        $display("o_fwd_bus: %h; o_data_bus: %h\n", o_fwd_bus, o_data_bus);
        rst = 1'b0;
        i_valid = 1'b1;
        i_data_bus = {(DATA_WIDTH>>2){4'h7}};
        
        i_fwd_bus = {(DATA_WIDTH>>2){4'hE}};
        i_fwd_valid = 1'b1;

        i_en = 1'b1;
        i_cmd = 7'b1110000; 

        // case 9 - no valid input
        #10     
        $display("o_fwd_bus: %h; o_data_bus: %h\n", o_fwd_bus, o_data_bus);
        rst = 1'b0;
        i_valid = 2'b00;
        i_data_bus = {(DATA_WIDTH>>2){4'h7}};
        
        i_fwd_bus = {(DATA_WIDTH>>2){4'hE}};
        i_fwd_valid = 1'b0;

        i_en = 1'b1;
        i_cmd = 7'b0110000;

        #10     
        $display("o_fwd_bus: %h; o_data_bus: %h\n", o_fwd_bus, o_data_bus);
        #10     
        $display("o_fwd_bus: %h; o_data_bus: %h\n", o_fwd_bus, o_data_bus);
        $stop;
    end

    // instantiate DUT (device under test)
    multiplier_seq#(
        .DATA_WIDTH(DATA_WIDTH),         // could be arbitrary number
        .COMMAND_WIDTH(COMMAND_WIDTH)    // total input command bits.
    )dut (
        .clk(clk),
        .rst(rst),
        .i_valid(i_valid),               // valid input data signal
        .i_data_bus(i_data_bus),         // input data
        .i_fwd_valid(i_fwd_valid),       // valid forward data signal
        .i_fwd_bus(i_fwd_bus),           // data forward input from neighbor multiplier
        .o_valid(o_valid),               // output valid
        .o_data_bus(o_data_bus),         // output data 
        .o_fwd_valid(o_fwd_valid),       // output valid forward data signal
        .o_fwd_bus(o_fwd_bus),           // output data forward output to neighbor multiplier
        .i_en(i_en),                     // distribute switch enable
        .i_cmd(i_cmd)                    // command 
    );

    always#5 clk=~clk;

endmodule
`endif



`ifdef INPUT8
module tb_multiplier_seq();

	parameter DATA_WIDTH  = 8;
	parameter COMMAND_WIDTH  = 4 + $clog2(DATA_WIDTH) + 1;

    // timing signals
    reg                            clk;
    reg                            rst;

    // data signals
	reg                            i_valid;        // valid input data signal
	reg    [DATA_WIDTH-1:0]        i_data_bus;     // input data bus coming into mux
 
    reg                            i_fwd_valid;    // valid input data signal
	reg    [DATA_WIDTH-1:0]        i_fwd_bus;      // input data bus coming into mux
	
	wire                           o_valid;        // output valid
    wire   [DATA_WIDTH-1:0]        o_data_bus;     // output data 
	
	wire                           o_fwd_valid;    // output valid
    wire   [DATA_WIDTH-1:0]        o_fwd_bus;      // output data 

	// control signals
	reg                            i_en;           // mux enable
	reg    [COMMAND_WIDTH-1:0]     i_cmd;          // command 

/*
        Expected output
        # o_fwd_bus: 00; o_data_bus: 00
        # 
        # o_fwd_bus: 00; o_data_bus: 00
        # 
        # o_fwd_bus: 00; o_data_bus: 00
        # 
        # o_fwd_bus: 22; o_data_bus: 42
        # 
        # o_fwd_bus: 33; o_data_bus: 63
        # 
        # o_fwd_bus: 44; o_data_bus: 84
        # 
        # o_fwd_bus: cc; o_data_bus: 8c
        # 
        # o_fwd_bus: 00; o_data_bus: c6
        # 
        # o_fwd_bus: 00; o_data_bus: fc
        # 
        # o_fwd_bus: 00; o_data_bus: 00
        # 
        # o_fwd_bus: 00; o_data_bus: 00
        # 
*/

    // Test case declaration
    initial
    begin
        // disable
        clk = 1'b1;
        rst = 1'b0;
        i_data_bus = {(DATA_WIDTH>>2){4'h0}};
        i_valid = 1'b1;

        i_fwd_bus = {(DATA_WIDTH>>2){4'h8}};
        i_fwd_valid = 1'b1;

        i_en = 1'b0;
        i_cmd = 8'b01110101;

        // reset
        #10
        rst = 1'b1;
        i_data_bus = {(DATA_WIDTH>>2){4'h0}};
        i_valid = 1'b1;

        i_fwd_bus = {(DATA_WIDTH>>2){4'h8}};
        i_fwd_valid = 1'b1;

        i_en = 1'b1;
        i_cmd = 8'b01110101;

        // case 1 - enable & ms_init_SteadyVal
        // 1. receive valid value from i_data_bus 
        // 2. store it into i_data_stationary_reg
        // 3. no multiplication -- output invalid
        // 4. forward data invalid
        // 5. cut LS 8 bits
        // observed reg: i_data_stationary_reg = i_data_bus
        // all other regs are invalid
        // output expect (appear 1 cycle later; used after 2 cycles):
        // o_data_bus = 0
        // o_valid = 0 
        // o_fwd_bus = 0
        // o_fwd_valid = 0 
        #10
        $display("o_fwd_bus: %h; o_data_bus: %h\n", o_fwd_bus, o_data_bus);
        rst = 1'b0;
        i_valid = 1'b1;
        i_data_bus = {(DATA_WIDTH>>2){4'h1}};
        
        i_fwd_bus = {(DATA_WIDTH>>2){4'h8}};
        i_fwd_valid = 1'b1;

        i_en = 1'b1;
        i_cmd = 8'b00110101;

        // case 2 - enable & ms_runLEdgeFirst
        // 1. receive valid value from i_data_bus 
        // 2. store it into i_data_stream_reg
        // 3. do multiplication -- o_valid = 1 (use saved data from previous cycle)
        // 4. input forward data invalid
        // 5. cut LS 8 bits
        // observed reg: i_data_stream_reg = i_data_bus
        //               i_data_stationary_reg
        //               o_fwd valid  
        //               o_data_bus valid  
        // all other regs are invalid
        // output expect (appear 1 cycle later; used after 2 cycles):
        #10
        $display("o_fwd_bus: %h; o_data_bus: %h\n", o_fwd_bus, o_data_bus);
        rst = 1'b0;
        i_valid = 1'b1;
        i_data_bus = {(DATA_WIDTH>>2){4'h2}};
        
        i_fwd_bus = {(DATA_WIDTH>>2){4'h9}};
        i_fwd_valid = 1'b1;

        i_en = 1'b1;
        i_cmd = 8'b00111111;
        
        // case 3 - enable & ms_runLEdge
        // 1. receive valid value from i_data_bus
        // 2. store it into i_data_stream_reg
        // 3. do multiplication -- o_valid = 1 (use saved data from previous cycle)
        // 4. input forward data invalid
        // 5. cut LS 8 bits
        // observed reg: i_data_stream_reg = i_data_bus
        //               i_data_stationary_reg
        //               o_fwd valid
        //               o_data_bus valid
        // all other regs are invalid
        // output expect (appear 1 cycle later; used after 2 cycles):
        // o_data_bus = 3
        // o_valid = 1 
        // o_fwd_bus = 3
        // o_fwd_valid = 1 
        #10
        $display("o_fwd_bus: %h; o_data_bus: %h\n", o_fwd_bus, o_data_bus);
        rst = 1'b0;
        i_valid = 1'b1;
        i_data_bus = {(DATA_WIDTH>>2){4'h3}};
        
        i_fwd_bus = {(DATA_WIDTH>>2){4'hA}};
        i_fwd_valid = 1'b1;

        i_en = 1'b1;
        i_cmd = 8'b00111111;

        // case 4 - enable & ms_runMiddleFirst
        // 1. receive valid value from i_data_bus
        // 2. store it into i_data_stream_reg
        // 3. do multiplication -- o_valid = 1 (use saved data from previous cycle)
        // 4. input forward data invalid
        // 5. cut LS 8 bits
        // observed reg: i_data_stream_reg = i_data_bus
        //               i_data_stationary_reg
        //               o_fwd valid
        //               o_data_bus valid
        // all other regs are invalid
        // output expect (appear 1 cycle later; used after 2 cycles):
        #10
        $display("o_fwd_bus: %h; o_data_bus: %h\n", o_fwd_bus, o_data_bus);
        rst = 1'b0;
        i_valid = 1'b1;
        i_data_bus = {(DATA_WIDTH>>2){4'h4}};
        
        i_fwd_bus = {(DATA_WIDTH>>2){4'hB}};
        i_fwd_valid = 1'b1;

        i_en = 1'b1;
        i_cmd = 8'b00111111;

        // case 5 - enable & ms_runMiddle
        // 1. receive valid value from i_data_bus 
        // 2. store it into i_data_stream_reg
        // 3. do multiplication -- o_valid = 1 (use saved data from previous cycle)
        // 4. receive valid input forward data
        // 5. cut LS 8 bits
        // observed reg: i_data_stream_reg = i_data_bus
        //               i_data_stationary_reg
        //               o_fwd valid  
        //               o_data_bus valid  
        // all other regs are invalid
        // output expect (appear 1 cycle later; used after 2 cycles):
        #10
        $display("o_fwd_bus: %h; o_data_bus: %h\n", o_fwd_bus, o_data_bus);
        rst = 1'b0;
        i_valid = 1'b1;
        i_data_bus = {(DATA_WIDTH>>2){4'h5}};
        
        i_fwd_bus = {(DATA_WIDTH>>2){4'hC}};
        i_fwd_valid = 1'b1;

        i_en = 1'b1;
        i_cmd = 8'b00111000; 
        
        // case 6 - enable & ms_runREdgeFirst
        // 1. receive invalid value from i_data_bus
        // 2. store it into i_data_stream_reg
        // 3. do multiplication -- o_valid = 1 (use saved data from previous cycle)
        // 4. input forward value invalid 
        // 5. cut LS 8 bits
        // observed reg: i_data_stream_reg = i_data_bus
        //               i_data_stationary_reg
        //               o_fwd valid  
        //               o_data_bus valid  
        // all other regs are invalid
        // output expect (appear 1 cycle later; used after 2 cycles):
        #10
        $display("o_fwd_bus: %h; o_data_bus: %h\n", o_fwd_bus, o_data_bus);
        rst = 1'b0;
        i_valid = 1'b1;
        i_data_bus = {(DATA_WIDTH>>2){4'h6}};
        
        i_fwd_bus = {(DATA_WIDTH>>2){4'hD}};
        i_fwd_valid = 1'b1;

        i_en = 1'b1;
        i_cmd = 8'b00110111; 
        
        // case 7 - enable & ms_runREdge
        // 1. receive invalid value from i_data_bus
        // 2. store it into i_data_stream_reg
        // 3. do multiplication -- o_valid = 1 (use saved data from previous cycle)
        // 4. receive valid input forward data
        // 5. cut LS 8 bits
        // observed reg: i_data_stream_reg = i_data_bus
        //               i_data_stationary_reg
        //               o_fwd valid  
        //               o_data_bus valid  
        // all other regs are invalid
        // output expect (appear 1 cycle later; used after 2 cycles):
        #10
        $display("o_fwd_bus: %h; o_data_bus: %h\n", o_fwd_bus, o_data_bus);
        rst = 1'b0;
        i_valid = 1'b1;
        i_data_bus = {(DATA_WIDTH>>2){4'h7}};
        
        i_fwd_bus = {(DATA_WIDTH>>2){4'hE}};
        i_fwd_valid = 1'b1;

        i_en = 1'b1;
        i_cmd = 8'b00110000; 

        // case 8 - enable & ms_runREdge
        // 1. receive invalid value from i_data_bus
        // 2. store it into i_data_stream_reg
        // 3. do multiplication -- o_valid = 1 (use saved data from previous cycle)
        // 4. receive valid input forward data
        // 5. cut MS 8 bits
        // observed reg: i_data_stream_reg = i_data_bus
        //               i_data_stationary_reg
        //               o_fwd valid  
        //               o_data_bus valid  
        // all other regs are invalid
        // output expect (appear 1 cycle later; used after 2 cycles):
        #10
        $display("o_fwd_bus: %h; o_data_bus: %h\n", o_fwd_bus, o_data_bus);
        rst = 1'b0;
        i_valid = 1'b1;
        i_data_bus = {(DATA_WIDTH>>2){4'h7}};
        
        i_fwd_bus = {(DATA_WIDTH>>2){4'hE}};
        i_fwd_valid = 1'b1;

        i_en = 1'b1;
        i_cmd = 8'b11110000; 

        // case 9 - no valid input
        #10     
        $display("o_fwd_bus: %h; o_data_bus: %h\n", o_fwd_bus, o_data_bus);
        rst = 1'b0;
        i_valid = 2'b00;
        i_data_bus = {(DATA_WIDTH>>2){4'h7}};
        
        i_fwd_bus = {(DATA_WIDTH>>2){4'hE}};
        i_fwd_valid = 1'b0;

        i_en = 1'b1;
        i_cmd = 8'b00110000;

        #10     
        $display("o_fwd_bus: %h; o_data_bus: %h\n", o_fwd_bus, o_data_bus);
        #10     
        $display("o_fwd_bus: %h; o_data_bus: %h\n", o_fwd_bus, o_data_bus);
        $stop;
    end

    // instantiate DUT (device under test)
    multiplier_seq#(
        .DATA_WIDTH(DATA_WIDTH),         // could be arbitrary number
        .COMMAND_WIDTH(COMMAND_WIDTH)    // total input command bits.
    )dut (
        .clk(clk),
        .rst(rst),
        .i_valid(i_valid),               // valid input data signal
        .i_data_bus(i_data_bus),         // input data
        .i_fwd_valid(i_fwd_valid),       // valid forward data signal
        .i_fwd_bus(i_fwd_bus),           // data forward input from neighbor multiplier
        .o_valid(o_valid),               // output valid
        .o_data_bus(o_data_bus),         // output data 
        .o_fwd_valid(o_fwd_valid),       // output valid forward data signal
        .o_fwd_bus(o_fwd_bus),           // output data forward output to neighbor multiplier
        .i_en(i_en),                     // distribute switch enable
        .i_cmd(i_cmd)                    // command 
    );

    always#5 clk=~clk;

endmodule
`endif



`ifdef INPUT16
module tb_multiplier_seq();

	parameter DATA_WIDTH  = 16;
	parameter COMMAND_WIDTH  = 4 + $clog2(DATA_WIDTH) + 1;

    // timing signals
    reg                            clk;
    reg                            rst;

    // data signals
	reg                            i_valid;        // valid input data signal
	reg    [DATA_WIDTH-1:0]        i_data_bus;     // input data bus coming into mux
 
    reg                            i_fwd_valid;    // valid input data signal
	reg    [DATA_WIDTH-1:0]        i_fwd_bus;      // input data bus coming into mux
	
	wire                           o_valid;        // output valid
    wire   [DATA_WIDTH-1:0]        o_data_bus;     // output data 
	
	wire                           o_fwd_valid;    // output valid
    wire   [DATA_WIDTH-1:0]        o_fwd_bus;      // output data 

	// control signals
	reg                            i_en;           // mux enable
	reg    [COMMAND_WIDTH-1:0]     i_cmd;          // command 

/*
        Expected Output 
        # o_fwd_bus: 0000; o_data_bus: 0000
        # 
        # o_fwd_bus: 0000; o_data_bus: 0000
        # 
        # o_fwd_bus: 0000; o_data_bus: 0000
        # 
        # o_fwd_bus: 2222; o_data_bus: 8642
        # 
        # o_fwd_bus: 3333; o_data_bus: c963
        # 
        # o_fwd_bus: 4444; o_data_bus: 0c84
        # 
        # o_fwd_bus: cccc; o_data_bus: 258c
        # 
        # o_fwd_bus: 0000; o_data_bus: 92c6
        # 
        # o_fwd_bus: 0000; o_data_bus: 0fed
        # 
        # o_fwd_bus: 0000; o_data_bus: 0000
        # 
        # o_fwd_bus: 0000; o_data_bus: 0000
        # 
*/

    // Test case declaration
    initial
    begin
        // disable
        clk = 1'b1;
        rst = 1'b0;
        i_data_bus = {(DATA_WIDTH>>2){4'hA}};
        i_valid = 1'b1;

        i_fwd_bus = {(DATA_WIDTH>>2){4'h8}};
        i_fwd_valid = 1'b1;

        i_en = 1'b0;
        i_cmd = 9'b011110101;

        // reset
        #10
        rst = 1'b1;
        i_data_bus = {(DATA_WIDTH>>2){4'hA}};
        i_valid = 1'b1;

        i_fwd_bus = {(DATA_WIDTH>>2){4'h8}};
        i_fwd_valid = 1'b1;

        i_en = 1'b1;
        i_cmd = 9'b011110101;

        // case 1 - enable & ms_init_SteadyVal
        // 1. receive valid value from i_data_bus 
        // 2. store it into i_data_stationary_reg
        // 3. no multiplication -- output invalid
        // 4. forward data invalid
        // 5. cut LS 16 bits
        // observed reg: i_data_stationary_reg = i_data_bus
        // all other regs are invalid
        // output expect (appear 1 cycle later; used after 2 cycles):
        #10
        $display("o_fwd_bus: %h; o_data_bus: %h\n", o_fwd_bus, o_data_bus);
        rst = 1'b0;
        i_valid = 1'b1;
        i_data_bus = {(DATA_WIDTH>>2){4'h1}};
        
        i_fwd_bus = {(DATA_WIDTH>>2){4'h8}};
        i_fwd_valid = 1'b1;

        i_en = 1'b1;
        i_cmd = 9'b011110101;

        // case 2 - enable & ms_runLEdgeFirst
        // 1. receive valid value from i_data_bus 
        // 2. store it into i_data_stream_reg
        // 3. do multiplication -- o_valid = 1 (use saved data from previous cycle)
        // 4. input forward data invalid
        // 5. cut LS 16 bits
        // observed reg: i_data_stream_reg = i_data_bus
        //               i_data_stationary_reg
        //               o_fwd valid  
        //               o_data_bus valid  
        // all other regs are invalid
        // output expect (appear 1 cycle later; used after 2 cycles):
        #10
        $display("o_fwd_bus: %h; o_data_bus: %h\n", o_fwd_bus, o_data_bus);
        rst = 1'b0;
        i_valid = 1'b1;
        i_data_bus = {(DATA_WIDTH>>2){4'h2}};
        
        i_fwd_bus = {(DATA_WIDTH>>2){4'h9}};
        i_fwd_valid = 1'b1;

        i_en = 1'b1;
        i_cmd = 9'b011111111;
        
        // case 3 - enable & ms_runLEdge
        // 1. receive valid value from i_data_bus
        // 2. store it into i_data_stream_reg
        // 3. do multiplication -- o_valid = 1 (use saved data from previous cycle)
        // 4. input forward data invalid
        // 5. cut LS 16 bits
        // observed reg: i_data_stream_reg = i_data_bus
        //               i_data_stationary_reg
        //               o_fwd valid
        //               o_data_bus valid
        // all other regs are invalid
        // output expect (appear 1 cycle later; used after 2 cycles):

        #10
        $display("o_fwd_bus: %h; o_data_bus: %h\n", o_fwd_bus, o_data_bus);
        rst = 1'b0;
        i_valid = 1'b1;
        i_data_bus = {(DATA_WIDTH>>2){4'h3}};
        
        i_fwd_bus = {(DATA_WIDTH>>2){4'hA}};
        i_fwd_valid = 1'b1;

        i_en = 1'b1;
        i_cmd = 9'b011111111;

        // case 4 - enable & ms_runMiddleFirst
        // 1. receive valid value from i_data_bus
        // 2. store it into i_data_stream_reg
        // 3. do multiplication -- o_valid = 1 (use saved data from previous cycle)
        // 4. input forward data invalid
        // 5. cut LS 16 bits
        // observed reg: i_data_stream_reg = i_data_bus
        //               i_data_stationary_reg
        //               o_fwd valid
        //               o_data_bus valid
        // all other regs are invalid
        // output expect (appear 1 cycle later; used after 2 cycles):

        #10
        $display("o_fwd_bus: %h; o_data_bus: %h\n", o_fwd_bus, o_data_bus);
        rst = 1'b0;
        i_valid = 1'b1;
        i_data_bus = {(DATA_WIDTH>>2){4'h4}};
        
        i_fwd_bus = {(DATA_WIDTH>>2){4'hB}};
        i_fwd_valid = 1'b1;

        i_en = 1'b1;
        i_cmd = 9'b011111111;

        // case 5 - enable & ms_runMiddle
        // 1. receive valid value from i_data_bus 
        // 2. store it into i_data_stream_reg
        // 3. do multiplication -- o_valid = 1 (use saved data from previous cycle)
        // 4. receive valid input forward data
        // 5. cut LS 16 bits
        // observed reg: i_data_stream_reg = i_data_bus
        //               i_data_stationary_reg
        //               o_fwd valid  
        //               o_data_bus valid  
        // all other regs are invalid
        // output expect (appear 1 cycle later; used after 2 cycles):
        
        #10
        $display("o_fwd_bus: %h; o_data_bus: %h\n", o_fwd_bus, o_data_bus);
        rst = 1'b0;
        i_valid = 1'b1;
        i_data_bus = {(DATA_WIDTH>>2){4'h5}};
        
        i_fwd_bus = {(DATA_WIDTH>>2){4'hC}};
        i_fwd_valid = 1'b1;

        i_en = 1'b1;
        i_cmd = 9'b011111000; 
        
        // case 6 - enable & ms_runREdgeFirst
        // 1. receive invalid value from i_data_bus
        // 2. store it into i_data_stream_reg
        // 3. do multiplication -- o_valid = 1 (use saved data from previous cycle)
        // 4. input forward value invalid 
        // 5. cut LS 16 bits
        // observed reg: i_data_stream_reg = i_data_bus
        //               i_data_stationary_reg
        //               o_fwd valid  
        //               o_data_bus valid  
        // all other regs are invalid
        // output expect (appear 1 cycle later; used after 2 cycles):
        
        #10
        $display("o_fwd_bus: %h; o_data_bus: %h\n", o_fwd_bus, o_data_bus);
        rst = 1'b0;
        i_valid = 1'b1;
        i_data_bus = {(DATA_WIDTH>>2){4'h6}};
        
        i_fwd_bus = {(DATA_WIDTH>>2){4'hD}};
        i_fwd_valid = 1'b1;

        i_en = 1'b1;
        i_cmd = 9'b011110111; 
        
        // case 7 - enable & ms_runREdge
        // 1. receive invalid value from i_data_bus
        // 2. store it into i_data_stream_reg
        // 3. do multiplication -- o_valid = 1 (use saved data from previous cycle)
        // 4. receive valid input forward data
        // 5. cut LS 16 bits
        // observed reg: i_data_stream_reg = i_data_bus
        //               i_data_stationary_reg
        //               o_fwd valid  
        //               o_data_bus valid  
        // all other regs are invalid
        // output expect (appear 1 cycle later; used after 2 cycles):
        
        #10
        $display("o_fwd_bus: %h; o_data_bus: %h\n", o_fwd_bus, o_data_bus);
        rst = 1'b0;
        i_valid = 1'b1;
        i_data_bus = {(DATA_WIDTH>>2){4'h7}};
        
        i_fwd_bus = {(DATA_WIDTH>>2){4'hE}};
        i_fwd_valid = 1'b1;

        i_en = 1'b1;
        i_cmd = 9'b011110000; 

        // case 8 - enable & ms_runREdge
        // 1. receive invalid value from i_data_bus
        // 2. store it into i_data_stream_reg
        // 3. do multiplication -- o_valid = 1 (use saved data from previous cycle)
        // 4. receive valid input forward data
        // 5. cut MS 16 bits
        // observed reg: i_data_stream_reg = i_data_bus
        //               i_data_stationary_reg
        //               o_fwd valid  
        //               o_data_bus valid  
        // all other regs are invalid
        // output expect (appear 1 cycle later; used after 2 cycles):
        
        #10
        $display("o_fwd_bus: %h; o_data_bus: %h\n", o_fwd_bus, o_data_bus);
        rst = 1'b0;
        i_valid = 1'b1;
        i_data_bus = {(DATA_WIDTH>>2){4'h7}};
        
        i_fwd_bus = {(DATA_WIDTH>>2){4'hE}};
        i_fwd_valid = 1'b1;

        i_en = 1'b1;
        i_cmd = 9'b111110000; 

        // case 10 no valid input
        #10     
        $display("o_fwd_bus: %h; o_data_bus: %h\n", o_fwd_bus, o_data_bus);
        rst = 1'b0;
        i_valid = 1'b0;
        i_data_bus = {(DATA_WIDTH>>2){4'h7}};
        
        i_fwd_bus = {(DATA_WIDTH>>2){4'hE}};
        i_fwd_valid = 1'b0;

        i_en = 1'b1;
        i_cmd = 9'b011110000; 

        #10     
        $display("o_fwd_bus: %h; o_data_bus: %h\n", o_fwd_bus, o_data_bus);
        #10     
        $display("o_fwd_bus: %h; o_data_bus: %h\n", o_fwd_bus, o_data_bus);
        $stop;
    end

    // instantiate DUT (device under test)
    multiplier_seq#(
        .DATA_WIDTH(DATA_WIDTH),         // could be arbitrary number
        .COMMAND_WIDTH(COMMAND_WIDTH)    // total input command bits.
    )dut (
        .clk(clk),
        .rst(rst),
        .i_valid(i_valid),               // valid input data signal
        .i_data_bus(i_data_bus),         // input data
        .i_fwd_valid(i_fwd_valid),       // valid forward data signal
        .i_fwd_bus(i_fwd_bus),           // data forward input from neighbor multiplier
        .o_valid(o_valid),               // output valid
        .o_data_bus(o_data_bus),         // output data 
        .o_fwd_valid(o_fwd_valid),       // output valid forward data signal
        .o_fwd_bus(o_fwd_bus),           // output data forward output to neighbor multiplier
        .i_en(i_en),                     // distribute switch enable
        .i_cmd(i_cmd)                    // command 
    );

    always#5 clk=~clk;

endmodule

`endif