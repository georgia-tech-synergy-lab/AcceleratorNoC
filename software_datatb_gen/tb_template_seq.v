`include "monox_defines.vh"
/*
    Top Module:  tb_bram_cross_seq.v
    Data:        Unsign format, 64 bit (most significant (64-35) bits are 0)
    Format:      read the corresponding address from BRAM and execute negate or bypass
    Warm-up:     Not input & output valid, start process when detecting high i_en.
                 the first data comes out "1" cycles after i_en set high.   
                 initial interval (II = 1)
    Timing:      Sequential Logic, 1-cycle latency
                  first cycle: modulus subtraction & add
    Dummy Data:  {DATA_WIDTH{1'b0}}
    Function:                           
                                          
                                             ||                                     ||
                                             ||                                     ||
                 first clock cycle           ||        second clock cycle           ||     third clock cycle
                                             ||                                     ||
                                             ||                                     ||
                                                               o_select_ctrl[0]                                                           
                                                         >modulus  _______                                                                            
                                                           |-------|_reg_|--------------------------                                                                    
                             _________                     |                                       |                                         
                             |       |                     |     __________                        |                                                   
             A      -------> |       |  res_uncorrected    |    |          |    res_corrected    |\v                                                    
             B      -------> |       | [MODULUS_WIDTH:0]   |    |  normal  |    [0*IRW+:IRW]     | \                                                   
                             |normal |------------------------->|   sub    |-------------------->|1 \         _______________                                  
     [MODULUS_WIDTH-1:0]     |  ADD  |             |----------->|in-modulus|                     |   |----->  |zero extension|  ---> o_data_bus[DATA_WIDTH-1:0]
                             |       |             |            |__________|                     |   |        |______________|                                               
                             |_______|             |                          ------------------>|0 /                                         
                                 _____             |                          res_uncorrected    | /                                                                    
          i_modulus  ----------->__|_|-------------|                             [0*MW+:MW]      |/                                                                     
                                          i_modulus_reg   
                                                                
                                                               o_select_ctrl[1]    
                                                         >modulus  _______                                                                   
                             ________                      |-------|_reg_|--------------------------                                         
                             |       |                     |                                       |                                                                                      
             C      -------> |       |                     |     __________                        |                                                                                      
             D      -------> |       |  res_uncorrected    |    |          |    res_corrected    |\v                                                                                      
                             |normal |  [1*IRW+:IRW]       |    |  normal  |     [1*IRW+:IRW]    | \                                                                                   
     [MODULUS_WIDTH-1:0]     |  ADD  |------------------------->|   sub    |-------------------->|1 \         ________________                                                                            
                             |       |             |----------->|in-modulus|                     |   |----->  |zero extension|  ---> o_data_bus[1*DATA_WIDTH+:DATA_WIDTH]                                                
                             |_______|             |            |__________|                     |   |        |______________|                                                            
                                                   |                          ------------------>|0 /                                     
                                 _____             |                          res_uncorrected    | /                                                                    
          i_modulus  ----------->__|_|-------------|                             [1*MW+:MW]      |/                                                                     
                                          i_modulus_reg          
                                                                                                       
                                                               o_select_ctrl[2]                                                                                   
                                                         >modulus  _______                                                                                                
                             _________                     |-------|_reg_|--------------------------                                                                                      
                             |       |                     |                                       |                                                                                      
             A      -------> |       |                     |     __________                        |                                                                                      
             B      -------> |  SUB  |  res_uncorrected    |    |          |    res_corrected    |\v                                                                                      
                             |normal |   [2*IRW+:IRW]      |    |  normal  |     [2*IRW+:IRW]    | \                                                                                      
     [MODULUS_WIDTH-1:0]     |  A-B  |------------------------->|   sub    |-------------------->|1 \                                                                                     
                             |       |             |----------->|in-modulus|                     |   |-----> o_data_bus[2*MW+:MW]                                                
                             |_______|             |            |__________|                     |   |                                                                                    
                                                   |                          ------------------>|0 /                                     
                                 _____             |                          res_uncorrected    | /                                                                    
          i_modulus  ----------->__|_|-------------|                             [2*MW+:MW]      |/                                                                     
                                          i_modulus_reg          
                                                          
                                                               o_select_ctrl[3]                                                                               
                                                         >modulus  _______                                                                                      
                                                           |-------|_reg_|--------------------------                                                                                                                   
                             _________                     |                                       |                                                                                                                                                                                                                             
                             |       |                     |     __________                        |                                                                                                                                               
             C      -------> |       |  res_uncorrected    |    |          |    res_corrected    |\v                                                                                      
             D      -------> |  SUB  |   [3*IRW+:IRW]      |    |  normal  |     [3*IRW+:IRW]    | \                                                                                      
                             |normal |------------------------->|   sub    |-------------------->|1 \                                                                                     
     [MODULUS_WIDTH-1:0]     |  C-D  |             |----------->|in-modulus|                     |   |-----> o_data_bus[3*MW+:MW]                                               
                             |       |             |            |__________|                     |   |                                                                                    
                             |_______|             |                          ------------------>|0 /                                                                                     
                                 _____             |                          res_uncorrected    | /                                                                    
          i_modulus  ----------->__|_|-------------|                             [3*MW+:MW]      |/                                                                     
                                          i_modulus_reg
    
     Abbreviate:
      IRW = INNER_RES_WIDTH = MODULUS_WIDTH + 1
      MW  = MODULUS_WIDTH
   
     Data layout:
            i_data layout                                                                 
           MSB                                                            LSB                                                                
            [MODULUS_WIDTH | MODULUS_WIDTH | MODULUS_WIDTH | MODULUS_WIDTH]                                                                
                   D               C              B               A
           
            res_uncorrected 
           MSB                                                            LSB
            [MODULUS_WIDTH | MODULUS_WIDTH | MODULUS_WIDTH | MODULUS_WIDTH]
                   C-D            A-B             C+D             A+B
          
            o_data layout 
           MSB                                                            LSB
            [MODULUS_WIDTH | MODULUS_WIDTH | MODULUS_WIDTH | MODULUS_WIDTH]
                   C-D            A-B             C+D             A+B
    Note:
      In this design, we assume the bit length of the modulus is smaller than the bit length of the data.
   
    Author:      Jianming Tong (jianming.tong@gatech.edu)
*/

`define PERIOD 10
`define NUM_IN_DATA 4096
`define MODULE_LATENCY 2

module tb_bram_cross_seq();
    parameter    DATA_WIDTH = 64;
    parameter    MODULUS_WIDTH = 35;
    localparam   NUM_INPUT_DATA = 4;
    localparam   DEPTH_MEM = 4096;
    localparam   WIDTH_INPUT_DATA = NUM_INPUT_DATA * MODULUS_WIDTH;
    localparam   WIDTH_OUTPUT_DATA = (NUM_INPUT_DATA>>1) * (MODULUS_WIDTH + DATA_WIDTH);
    localparam   IN_MODULUS = 35'h4_0008_0001;

    // interface
    reg                                        clk;
    reg                                        rst_n;
    
    wire [WIDTH_INPUT_DATA-1:0]                i_data;
    
    wire [WIDTH_OUTPUT_DATA-1:0]               o_data; 
  
    reg                                        i_en;
    reg                                        i_ren;
    reg                                        output_valid;
    reg                                        i_cmp_start;

    // control generation
    initial begin
        clk = 1'b0;
        // not enable at start
        rst_n = 1'b1;
        i_en = 1'b0;
        i_ren = 1'b0;
        i_cmp_start <= 1'b0;

        // rst active;
        #(`PERIOD)
        $display("o_data: %h\n", o_data);
        rst_n = 1'b0;
        i_en = 1'b1;

        // test input: input data smaller than modulus data -> a-b & c-d need correction.
        #(`PERIOD)
        rst_n = 1'b1;
        i_ren = 1'b1;

        #(`PERIOD*(`MODULE_LATENCY+1))
        output_valid = 1'b1;
        
        #(`PERIOD*(`NUM_IN_DATA-`MODULE_LATENCY-1))
        i_ren = 1'b0;
        
        #(`PERIOD*(`MODULE_LATENCY))
        i_cmp_start = 1'b1; 

        #(`PERIOD)
        i_cmp_start = 1'b0; 
        output_valid = 1'b0;
        
        #(`PERIOD)
        $stop;
    end

    always #5 clk = ~clk;

    // read data from input mem file
    file_to_data#(
        .file("/home/jimmy/work/intern/damo_summer_2021/code/VPU_first_module/sim/data/random_gen_input0.mem"),
        .DATA_WIDTH(MODULUS_WIDTH)
    ) i_data_a_read_from_mem (
        .clk(clk),
        .rst_n(rst_n),
        .i_en(i_en),
        .i_ren(i_ren),
        .o_valid(),
        .o_data_bus(i_data[0*MODULUS_WIDTH+:MODULUS_WIDTH])
    );

    file_to_data#(
        .file("/home/jimmy/work/intern/damo_summer_2021/code/VPU_first_module/sim/data/random_gen_input1.mem"),
        .DATA_WIDTH(MODULUS_WIDTH)
    ) i_data_b_read_from_mem (
        .clk(clk),
        .rst_n(rst_n),
        .i_en(i_en),
        .i_ren(i_ren),
        .o_valid(),
        .o_data_bus(i_data[1*MODULUS_WIDTH+:MODULUS_WIDTH])
    );

    file_to_data#(
        .file("/home/jimmy/work/intern/damo_summer_2021/code/VPU_first_module/sim/data/random_gen_input2.mem"),
        .DATA_WIDTH(MODULUS_WIDTH)
    ) i_data_c_read_from_mem (
        .clk(clk),
        .rst_n(rst_n),
        .i_en(i_en),
        .i_ren(i_ren),
        .o_valid(),
        .o_data_bus(i_data[2*MODULUS_WIDTH+:MODULUS_WIDTH])
    );

    file_to_data#(
        .file("/home/jimmy/work/intern/damo_summer_2021/code/VPU_first_module/sim/data/random_gen_input3.mem"),
        .DATA_WIDTH(MODULUS_WIDTH)
    ) i_data_d_read_from_mem (
        .clk(clk),
        .rst_n(rst_n),
        .i_en(i_en),
        .i_ren(i_ren),
        .o_valid(),
        .o_data_bus(i_data[3*MODULUS_WIDTH+:MODULUS_WIDTH])
    );

    // write data into extern memory file
    out_bram_to_file#(
        .file("/home/jimmy/work/intern/damo_summer_2021/code/VPU_first_module/sim/hw_data/hw_output.mem"),
        .DATA_WIDTH(DATA_WIDTH),
        .MODULUS_WIDTH(MODULUS_WIDTH)
    ) o_write_to_file (
        .clk(clk),
        .i_en(i_en),
        .i_valid(output_valid),
        .i_data_bus({1'b0, o_data[2*DATA_WIDTH+MODULUS_WIDTH+:MODULUS_WIDTH], 1'b0, o_data[2*DATA_WIDTH+:MODULUS_WIDTH], o_data[0+:2*DATA_WIDTH]})
    );

    // compare data with verification memory
    output_cross_verification_cmp#(
        .file("/home/jimmy/work/intern/damo_summer_2021/code/VPU_first_module/sim/data/verification_rst.mem"),
        .DATA_WIDTH(DATA_WIDTH),
        .MODULUS_WIDTH(MODULUS_WIDTH),
        .DEPTH_MEM(DEPTH_MEM)
    ) rst_cmp_with_verification (
        .clk(clk),
        .rst_n(rst_n),
        .i_en(i_en),
        .i_valid(output_valid),
        .i_data_bus({1'b0, o_data[2*DATA_WIDTH+MODULUS_WIDTH+:MODULUS_WIDTH], 1'b0, o_data[2*DATA_WIDTH+:MODULUS_WIDTH], o_data[0+:2*DATA_WIDTH]}),
        .i_cmp_start(i_cmp_start)
    );

    // testbench instantiate template
    out_bram_to_file#(
        .file("/home/jimmy/work/intern/damo_summer_2021/code/VPU_first_module/sim/hw_data/hw_output.mem"),
        .DATA_WIDTH(64),
        .MODULUS_WIDTH(35)
    ) o_data_to_file (
        .clk(clk),
        .i_en(i_en),
        .i_valid(output_valid),
        .i_data_bus(o_data)
    );


    // device under test
    cross_aggressive_seq #(
        .DATA_WIDTH(DATA_WIDTH),
        .MODULUS_WIDTH(MODULUS_WIDTH),
        .IN_MODULUS(IN_MODULUS)
    ) dut(
        .clk(clk),
        .rst_n(rst_n),
        .i_data(i_data),
        .o_data(o_data),
        .i_en(i_en)
    );

endmodule
