`timescale 1ns / 1ps
/*
    Top Module:  file_to_data_binary
    Data:        Only data width matters.
    Format:      keeping the input format unchange
    Timing:      Sequential Logic
    Reset:       Asynchronized Reset [Low Reset]
    Dummy Data:  {DATA_WIDTH{1'b0}}

    Function:    
                                                                                                                     
            ________       _____________________                     __    __    __     __    __    __                                                              
       0   |        |     |                     |              clk _|  |__|  |__|  |__//  |__|  |__|  |                                                                   
       1   |        |     |                     |                                                                                                 
       ... |  file  | --> | file_to_data_binary | --> o_data_bus    0     1     2     ...    n-1    n                                                                                           
       n-1 |        |     |                     |                                                                                                 
       n   |________|     |_____________________|                                                                                                 
                                                                                                                                               
                                                                                                                                               
    Author:      Jianming Tong (jianming.tong@gatech.edu)
*/

/*
    // testbench instantiate template
    file_to_data_binary#(
        .file("/home/jimmy/test_input.coe"),
        .DATA_WIDTH(DATA_WIDTH),
        .DEPTH_MEM(DEPTH_MEM)
    ) i_data_a_read_from_mem (
        .clk(clk),
        .rst_n(rst_n),
        .i_en(i_en),
        .i_ren(i_ren),
        .o_valid(o_valid),
        .o_data_bus(o_data_bus)
    );
*/

module file_to_data_binary#(
    parameter file = 0,
    parameter DATA_WIDTH = 64,
    parameter DEPTH_MEM = 4096
)
(
    // timing signals
    clk,
    rst_n,

    // control signals
    i_en,
    i_ren,

    // data signals
    o_valid,
    o_data_bus
);

    localparam  ADDR_CNT_WIDTH = $clog2(DEPTH_MEM);

    // interface
    input                                        clk;
    input                                        rst_n;

    output                                       o_valid;
    output [DATA_WIDTH-1:0]                      o_data_bus;

    input                                        i_en;
    input                                        i_ren;
    
    // inner logic 
    reg    [ADDR_CNT_WIDTH-1:0]                  addr_cnt;
    reg                                          inner_valid;
    reg    [DATA_WIDTH-1:0]                      inner_data_bus;

    reg    [DATA_WIDTH-1:0]                      mem[0:DEPTH_MEM-1];
    
    // read from memory file
    initial begin
        $readmemb(file, mem);
    end

    always @(posedge clk or negedge rst_n) begin
        if(!rst_n)
        begin
            inner_data_bus <= {DATA_WIDTH{1'b0}};
            inner_valid <= 1'b0;
            addr_cnt <= {ADDR_CNT_WIDTH{1'b0}};           
        end
        else if(i_en & i_ren)
        begin
            inner_data_bus <= mem[addr_cnt];
            inner_valid <= 1'b1;
            addr_cnt <= addr_cnt + 1'b1;
        end
        else
        begin
            inner_data_bus <= o_data_bus;
            inner_valid <= o_valid;
            addr_cnt <= addr_cnt;
        end
    end
    
    assign o_data_bus = inner_data_bus;
    assign o_valid = inner_valid;

endmodule
