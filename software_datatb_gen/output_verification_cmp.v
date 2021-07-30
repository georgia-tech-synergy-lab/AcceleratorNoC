`timescale 1ns / 1ps
/*
    Top Module:  output_verification_cmp
    Data:        Only data width matters.
    Format:      keeping the input format unchange
    Timing:      Sequential Logic
    Reset:       Asynchronized Reset [Low Reset]
    Dummy Data:  {DATA_WIDTH{1'b0}}

    Function:    
                                                                                                                     
                                                                     ________       __________________________                                                                            
                                                                0   |        |     |                         |                                                                                 
                                                                1   |        |     |                         |                                                                                                 
                                                                ... |  file  | --> | output_verification_cmp |                                                                                            
                                                                n-1 |        |     |                         |                                                                                                 
                                                                n   |________|     |_________________________|  
                                                                                         ^
                                                                     _______             |                                                                                                              
                     __    __    __     __    __    __          0   |       |            |                                                                                                              
               clk _|  |__|  |__|  |__//  |__|  |__|  |         1   |       |            | comparison at every address                                                                                                              
                                                         -->    ... |  mem  |  ----------|                                                                                                                        
      i_data_bus    0     1     2     ...    n-1    n           n-1 |       |                                                                                                                          
                                                                n   |_______|             


    Author:      Jianming Tong (jianming.tong@gatech.edu)
*/


/*
    // testbench instantiate template
    output_verification_cmp#(
        .file("/home/jimmy/test_input.coe"),
        .DATA_WIDTH(32),
        .DEPTH_MEM(4096)
    ) rst_cmp_with_verification (
        .clk(clk),
        .rst_n(rst_n),
        .i_en(i_en),
        .i_valid(i_valid),
        .i_data_bus(i_data_bus),
        .i_cmp_start(i_cmp_start)
    );
*/

module output_verification_cmp#(
    parameter file = 0,
    parameter DATA_WIDTH = 32,
    parameter DEPTH_MEM = 4096
)
(
    // timing signals
    clk,
    rst_n,

    // control signals
    i_en,
    i_valid,

    // data signals
    i_data_bus,
    i_cmp_start,
    o_pass
);

    // parameter
    localparam    CNT_WIDTH = $clog2(DEPTH_MEM);

    // interface
    input                                        clk;
    input                                        rst_n;

    input  [DATA_WIDTH-1:0]                      i_data_bus;

    input                                        i_en;
    input                                        i_valid;
    input                                        i_cmp_start;
    output                                        o_pass;

    reg    [CNT_WIDTH-1:0]                       cnt;
    reg    [DATA_WIDTH-1:0]                      mem[0:DEPTH_MEM-1];
    reg    [DATA_WIDTH-1:0]                      mem_verification[0:DEPTH_MEM-1];

    reg                                          i_cmp_start_shift;
    reg                                          wrong_flag;

    // store input i_cmp_start for 1 cycle
    always @(posedge clk) begin
        if(!rst_n)
        begin
            i_cmp_start_shift <= 1'b0;
        end
        else if(i_en) 
        begin
            i_cmp_start_shift <= i_cmp_start;
        end
        else
        begin
            i_cmp_start_shift <= 1'b0;
        end
    end

    // read from memory file
    initial begin
        $readmemh(file, mem_verification);
    end

    always @(posedge clk) begin
        if(!rst_n)
        begin
            mem[cnt] <= {DATA_WIDTH{1'b0}};
            cnt <= {CNT_WIDTH{1'b0}};
        end
        else if(i_en & i_valid)
        begin
            mem[cnt] <= i_data_bus;
            cnt <= cnt + 1;
        end
        else
        begin
            mem[cnt] <= mem[cnt];
            cnt <= cnt;
        end
    end

    integer i, flag;
    always @(posedge clk) begin
        if(i_cmp_start)
        begin
            flag = 1;
            for (i = 0; i<DEPTH_MEM; i=i+1)
            begin
                if(mem[i] != mem_verification[i])
                begin
                    flag = 0;
                    $display("[File: %s] RESULT DISMATCH: addr: %016x, expected data: %050x, real data: %050x", file, i, mem_verification[i], mem[i]);
                end
            end
            if(flag == 1)
            begin
                $display("All results match verification\n");
            end
        end
    end
    
    assign o_pass = wrong_flag;

endmodule
