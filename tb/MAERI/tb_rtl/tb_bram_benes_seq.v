`include "monox_defines.vh"
/*
    Top Module:  tb_bram_benes_seq.v
    Data:        Unsign format, 64 bit (most significant (64-35) bits are 0)
    Format:      read the corresponding address from BRAM and execute negate or bypass
    Warm-up:     Not input & output valid, start process when detecting high i_en.
                 the first data comes out "4" cycles after i_en set high.   
                 initial interval (II = 1)
    Timing:      Sequential Logic, 4-cycle latency
                  first half: register the input or shift&negate the input. (1-cycle latency)
                  second half: cross operation, (3-cycle latency)
    Dummy Data:  {DATA_WIDTH{1'b0}}
    Function:                           
                                                              ||                                                 ||                         
                                          first part          ||               second part                       ||       third part                                
                                         Shift&Negate         ||                  cross                          ||         shuffle           
                                                              ||                                                 ||                             
                                            cycle 1                            cycle 2 & 3                               cycle 4 & 5                          
                                                                             ________________                                                                                                            
                                      ______       ______                    |              |                                                                               
             i_data (A) ------------> _|_|_| ----> _|_|_|   ---------------> | A        A+B | ----->    o_data                                                                     
     [0*MODULUS_WIDTH+:MODULUS_WIDTH]                        connection_data |              |   [0*DATA_WIDTH+:DATA_WIDTH]                                             
                                                  [0*DATA_WIDTH+:DATA_WIDTH] |              |                                                                     
                                      ____________________                   |              |     
             i_data (B) ------------> |    modulus sub    | ---------------> | B        C+D | ------>   o_data                                                                                                
     [1*MODULUS_WIDTH+:MODULUS_WIDTH] |___________________|  connection_data |              |   [1*DATA_WIDTH+:DATA_WIDTH]                                                                        
                                                  [1*DATA_WIDTH+:DATA_WIDTH] |    Cross     |                                                                                            
                                      ______                                 |              |                     ________________________                                                                               
             i_data (C) ------------> _|_|_| ------------------------------> | C        A-B | ------------------> |       shuffle        |  -->        o_data                                                                                          
     [2*MODULUS_WIDTH+:MODULUS_WIDTH]                        connection_data |              |   cross_res_wire    |______________________|   [2*DATA_WIDTH+:DATA_WIDTH]                                               
                                                  [2*DATA_WIDTH+:DATA_WIDTH] |              | [0*MODULUS_WIDTH+:MODULUS_WIDTH]                                                                                             
                                      _____________________                  |              |                     _______________________                                                                   
             i_data (D) ------------> |    modulus sub    | ---------------> | D        C-D | ------------------> |       shuffle        |  -->        o_data                                                                                              
     [3*MODULUS_WIDTH+:MODULUS_WIDTH] |___________________|  connection_data |              |   cross_res_wire    |______________________|   [3*DATA_WIDTH+:DATA_WIDTH]                                                               
                                                  [3*DATA_WIDTH+:DATA_WIDTH] |______________| [1*MODULUS_WIDTH+:MODULUS_WIDTH]                       
                                                                                         
     Output Control:                                                                                   
           ________________________                                                                              
          |        shuffle         | --> o_addr                                                       
          |________________________| --> o_we                                                                                        
                                                                                         
                                                                               
     Data layout:
            i_data layout                                                        
           MSB                                                           LSB     
            [MODULUS_WIDTH | MODULUS_WIDTH | MODULUS_WIDTH | MODULUS_WIDTH]      
                   D               C              B               A
   
            o_data layout 
           MSB                                                           LSB
            [  DATA_WIDTH  |   DATA_WIDTH  |   DATA_WIDTH  |  DATA_WIDTH  ]
                   C-D            A-B             C+D             A+B                                      
                                                  
    Author:      Jianming Tong (jianming.tong@gatech.edu)
*/

`define PERIOD 10
`define NUM_IN_DATA 4096
`define MODULE_LATENCY 3

module tb_bram_benes_seq();
    localparam   DATA_WIDTH = 64;
    localparam   NUM_INPUT_DATA = 8;
    localparam   NUM_SWITCH_IN = NUM_INPUT_DATA >> 1;
    localparam   LEVEL = $clog2(NUM_INPUT_DATA);
    localparam   TOTAL_STAGE = 2*LEVEL-1;
    localparam   COMMAND_WIDTH = 2;
    localparam   TOTAL_COMMAND = TOTAL_STAGE * NUM_SWITCH_IN * COMMAND_WIDTH;
    localparam   IN_COMMAND_WIDTH = 30; //
    localparam   DEPTH_MEM = 4096;
    localparam   WIDTH_INPUT_DATA = NUM_INPUT_DATA * DATA_WIDTH;
    localparam   WIDTH_OUTPUT_DATA = NUM_INPUT_DATA * DATA_WIDTH;
    localparam   OUT_COMMAND_WIDTH =(TOTAL_COMMAND - NUM_SWITCH_IN*TOTAL_STAGE*COMMAND_WIDTH)?(TOTAL_COMMAND - NUM_SWITCH_IN*TOTAL_STAGE*COMMAND_WIDTH):1'b1;
    
    // interface
    reg                                        clk;
    reg                                        rst_n;

    wire [NUM_INPUT_DATA-1:0]                  i_valid;
    wire [WIDTH_INPUT_DATA-1:0]                i_data_bus;

    wire [NUM_INPUT_DATA-1:0]                  o_valid;
    wire [WIDTH_INPUT_DATA-1:0]                o_data_bus; //{o_data_a, o_data_b}

    reg                                        i_en;
    reg                                        i_ren;
    wire [TOTAL_COMMAND-1:0]                   i_cmd;
    wire [OUT_COMMAND_WIDTH-1:0]               o_cmd;
    reg                                        i_cmp_start;
    
    // control generation
    initial begin
        clk = 1'b0;
        // not enable at start
        rst_n = 1'b1;
        i_en = 1'b0;
        i_ren = 1'b0;
        i_cmp_start = 1'b0;
        // i_data_bus = {{(DATA_WIDTH>>2){4'h7}}, {(DATA_WIDTH>>2){4'h6}}, {(DATA_WIDTH>>2){4'h5}}, {(DATA_WIDTH>>2){4'h4}},{(DATA_WIDTH>>2){4'h3}}, {(DATA_WIDTH>>2){4'h2}}, {(DATA_WIDTH>>2){4'h1}}, {(DATA_WIDTH>>2){4'h0}}};

        // rst active;
        #(`PERIOD)
        $display("o_data: %h\n", o_data_bus);
        rst_n = 1'b0;
        i_en = 1'b1;

        // test input: input data smaller than modulus data -> a-b & c-d need correction.
        #(`PERIOD)
        rst_n = 1'b1;
        i_ren = 1'b1;

        #(`PERIOD)
        
        #(`PERIOD*(`MODULE_LATENCY))
        
        #(`PERIOD*(`NUM_IN_DATA-`MODULE_LATENCY-1))
        i_ren = 1'b0;
        
        #(`PERIOD*(`MODULE_LATENCY))
        i_cmp_start = 1'b1; 

        #(`PERIOD)
        i_cmp_start = 1'b0; 
        
        #(`PERIOD)
        $stop;
    end

    always #5 clk = ~clk;

    // read data from input mem file
    file_to_data#(
        .file("/home/jimmy/work/work_tushar/AcceleratorNoC/tb/MAERI/data/random_gen_input0.mem"),
        .DATA_WIDTH(DATA_WIDTH)
    ) i_data_a_read_from_mem (
        .clk(clk),
        .rst_n(rst_n),
        .i_en(i_en),
        .i_ren(i_ren),
        .o_valid(i_valid[0]),
        .o_data_bus(i_data_bus[0*DATA_WIDTH+:DATA_WIDTH])
    );

    file_to_data#(
        .file("/home/jimmy/work/work_tushar/AcceleratorNoC/tb/MAERI/data/random_gen_input1.mem"),
        .DATA_WIDTH(DATA_WIDTH)
    ) i_data_b_read_from_mem (
        .clk(clk),
        .rst_n(rst_n),
        .i_en(i_en),
        .i_ren(i_ren),
        .o_valid(i_valid[1]),
        .o_data_bus(i_data_bus[1*DATA_WIDTH+:DATA_WIDTH])
    );

    file_to_data#(
        .file("/home/jimmy/work/work_tushar/AcceleratorNoC/tb/MAERI/data/random_gen_input2.mem"),
        .DATA_WIDTH(DATA_WIDTH)
    ) i_data_c_read_from_mem (
        .clk(clk),
        .rst_n(rst_n),
        .i_en(i_en),
        .i_ren(i_ren),
        .o_valid(i_valid[2]),
        .o_data_bus(i_data_bus[2*DATA_WIDTH+:DATA_WIDTH])
    );

    file_to_data#(
        .file("/home/jimmy/work/work_tushar/AcceleratorNoC/tb/MAERI/data/random_gen_input3.mem"),
        .DATA_WIDTH(DATA_WIDTH)
    ) i_data_d_read_from_mem (
        .clk(clk),
        .rst_n(rst_n),
        .i_en(i_en),
        .i_ren(i_ren),
        .o_valid(i_valid[3]),
        .o_data_bus(i_data_bus[3*DATA_WIDTH+:DATA_WIDTH])
    );

    file_to_data#(
        .file("/home/jimmy/work/work_tushar/AcceleratorNoC/tb/MAERI/data/random_gen_input4.mem"),
        .DATA_WIDTH(DATA_WIDTH)
    ) i_data_e_read_from_mem (
        .clk(clk),
        .rst_n(rst_n),
        .i_en(i_en),
        .i_ren(i_ren),
        .o_valid(i_valid[4]),
        .o_data_bus(i_data_bus[4*DATA_WIDTH+:DATA_WIDTH])
    );

    file_to_data#(
        .file("/home/jimmy/work/work_tushar/AcceleratorNoC/tb/MAERI/data/random_gen_input5.mem"),
        .DATA_WIDTH(DATA_WIDTH)
    ) i_data_f_read_from_mem (
        .clk(clk),
        .rst_n(rst_n),
        .i_en(i_en),
        .i_ren(i_ren),
        .o_valid(i_valid[5]),
        .o_data_bus(i_data_bus[5*DATA_WIDTH+:DATA_WIDTH])
    );

    file_to_data#(
        .file("/home/jimmy/work/work_tushar/AcceleratorNoC/tb/MAERI/data/random_gen_input6.mem"),
        .DATA_WIDTH(DATA_WIDTH)
    ) i_data_g_read_from_mem (
        .clk(clk),
        .rst_n(rst_n),
        .i_en(i_en),
        .i_ren(i_ren),
        .o_valid(i_valid[6]),
        .o_data_bus(i_data_bus[6*DATA_WIDTH+:DATA_WIDTH])
    );

    file_to_data#(
        .file("/home/jimmy/work/work_tushar/AcceleratorNoC/tb/MAERI/data/random_gen_input7.mem"),
        .DATA_WIDTH(DATA_WIDTH)
    ) i_data_h_read_from_mem (
        .clk(clk),
        .rst_n(rst_n),
        .i_en(i_en),
        .i_ren(i_ren),
        .o_valid(i_valid[7]),
        .o_data_bus(i_data_bus[7*DATA_WIDTH+:DATA_WIDTH])
    );

    file_to_data_binary#(
        .file("/home/jimmy/work/work_tushar/AcceleratorNoC/tb/MAERI/data/random_cmd_input.mem"),
        .DATA_WIDTH(TOTAL_COMMAND)
    ) i_data_cmd_read_from_mem (
        .clk(clk),
        .rst_n(rst_n),
        .i_en(i_en),
        .i_ren(i_ren),
        .o_valid(),
        .o_data_bus(i_cmd)
    );

    // compare data with verification memory
    output_verification_cmp#(
        .file("/home/jimmy/work/work_tushar/AcceleratorNoC/tb/MAERI/data/res_verification.mem"),
        .DATA_WIDTH(DATA_WIDTH),
        .NUM_INPUT_DATA(NUM_INPUT_DATA),
        .DEPTH_MEM(DEPTH_MEM)
    ) data_cmp_with_verification (
        .clk(clk),
        .rst_n(rst_n),
        .i_en(i_en),
        .i_valid(o_valid),
        .i_data_bus(o_data_bus),
        .i_cmp_start(i_cmp_start),
        .o_pass()
    );

    // instantiate DUT (device under test)
    benes_simple_cmd_flow_seq #(
        .DATA_WIDTH(DATA_WIDTH),
        .COMMAND_WIDTH(COMMAND_WIDTH),
        .NUM_INPUT_DATA(NUM_INPUT_DATA),
        .IN_COMMAND_WIDTH(IN_COMMAND_WIDTH)
    ) dut(
        .clk(clk),
        .rst_n(rst_n),
        .i_valid(i_valid),
        .i_data_bus(i_data_bus),
        .o_valid(o_valid),
        .o_data_bus(o_data_bus),
        .i_en(i_en),
        .i_cmd(i_cmd),
        .o_cmd(o_cmd)
    );

endmodule
