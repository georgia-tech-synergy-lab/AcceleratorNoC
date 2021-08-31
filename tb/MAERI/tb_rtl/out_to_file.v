`timescale 1ns / 1ps
/*
    Top Module:  out_to_file
    Data:        Only data width matters.
    Format:      keeping the input format unchange
    Timing:      Sequential Logic
    Reset:       Asynchronized Reset [Low Reset]
    Dummy Data:  {DATA_WIDTH{1'b0}}

    Function:    
                                                                                                                     
                      __    __    __     __    __    __        _____________        ________                                                                
                clk _|  |__|  |__|  |__//  |__|  |__|  |      |             |      |        | 0                                                                   
                                                              |             |      |        | 1                                           
       i_data_bus    0     1     2     ...    n-1    n    --> |  memory_in  | -->  |  file  | ...                                                                                       
                                                              |             |      |        | n-1                                         
                                                              |_____________|      |________| n                                           


    Author:      Jianming Tong (jianming.tong@gatech.edu)
*/

/*
    // testbench instantiate template
    out_to_file#(
        .file("/home/jimmy/test_input.coe"),
        .DATA_WIDTH(64),
        .NUM_INPUT_DATA(1)
    ) i_data_a_write_to_file (
        .clk(clk),
        .i_en(i_en),
        .i_valid(i_valid),
        .i_data_bus(i_data_bus)
    );
*/

module out_to_file#(
    parameter file = 0,
    parameter DATA_WIDTH = 64,
    parameter NUM_INPUT_DATA = 1
)
(
    // timing signals
    clk,

    // control signals
    i_en,
    i_valid,

    // data signals
    i_data_bus
);

    // parameter
    localparam    WIDTH_INPUT_DATA = NUM_INPUT_DATA * DATA_WIDTH;
    
    // interface
    input                                        clk;

    input                                        i_valid;
    input        [WIDTH_INPUT_DATA-1:0]          i_data_bus;

    input                                        i_en;

    integer fd_w;
    
    initial begin
        fd_w = $fopen(file, "w");
    end

    always @(posedge clk) begin
        if(i_en & i_valid)
        begin
            $fwrite(fd_w, "%h\n", $signed(i_data_bus)); 
        end
    end

endmodule
