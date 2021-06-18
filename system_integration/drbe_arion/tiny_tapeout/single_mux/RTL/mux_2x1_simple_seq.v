`timescale 1ns / 1ps
/////////////////////////////////////////////////////////////
// Top Module:  mux_2x1_simple_seq
// Data:        Only data width matters.
// Format:      keeping the input format unchange
// Timing:      Sequential Logic
// Reset:       Synchronized Reset [High Reset]
// Dummy Data:  {DATA_WIDTH{1'b0}}
// 
// Function:   bydefault output  {DATA_WIDTH{1'b0}}
// 
//       i_data_bus(high)          i_data_bus(low)
//    [DATA_WIDTH+:DATA_WIDTH]    [DATA_WIDTH-1:0]  
//                           \     /     
//                            v   v      
//                           \¯¯¯¯¯/       
//                            \___/ <--- i_cmd(1 choose high, 0 choose low)    
//                              |        
//                              v    
//                          o_data_bus
//
// Author:      Jianming Tong (jianming.tong@gatech.edu)
/////////////////////////////////////////////////////////////

module mux_2x1_simple_seq#(
	parameter DATA_WIDTH = 32,
    parameter COMMAND_WIDTH = 1
)(
    // timeing signals
    clk,
	rst,
	
    // data signals
	i_valid,        // valid input data signal
	i_data_bus,     // input data bus coming into mux
	
	o_valid,        // output valid
    o_data_bus,     // output data 

	// control signals
	i_en            // mux enable
);

    // parameters
    localparam  NUM_BUF_LEVEL  = 4;
    
    // timing signals
    input                          clk;
    input                          rst;
    
	// interface
	input  [2*DATA_WIDTH-1:0]      i_data_bus;
	input  [1:0]                   i_valid;             

	output [DATA_WIDTH-1:0]        o_data_bus;
	output                         o_valid;             
	    
	input                          i_en;
                                // 0 --> Branch Low
                                // 1 --> Branch High
	
    // inner logics
	reg    [DATA_WIDTH-1:0]        o_data_bus_inner;
	reg                            o_valid_inner;
    reg    [1:0]                   i_valid_inner; 

    always @(*) begin
        i_valid_inner = i_valid;
    end

    genvar i,j;

    generate
       // define the buffer for the input of last level
        for (i = 0; i< NUM_BUF_LEVEL; i=i+1)
        begin: buf_def
            wire      [2*DATA_WIDTH-1:0]         i_data_o_buf;
        end

        // assign the buffer for the second last level
        for (j=0; j<2*DATA_WIDTH; j=j+1)
        begin: UI_buf_assign
            BUFFD0BWP30P140LVT UI_BUF_o_data_bus_first (.I(i_data_bus[j]), .Z(buf_def[0].i_data_o_buf[j]));
            for (i = 0; i< NUM_BUF_LEVEL-1; i=i+1)
            begin: buf_level
                BUFFD0BWP30P140LVT UI_BUF_o_data_bus_stage_after (.I(buf_def[i].i_data_o_buf[j]), .Z(buf_def[i+1].i_data_o_buf[j]));
            end
        end

        always@(posedge clk)
        begin
            if(i_en)
            begin
                if(rst)
                begin
                    o_data_bus_inner <= {DATA_WIDTH{1'b0}};
                    o_valid_inner <= 1'b0;
                end
                else
                begin
                    case({i_valid_inner})
                        2'b01:
                        begin
                            begin
                                o_valid_inner <= 1'b1;
                                o_data_bus_inner <= buf_def[NUM_BUF_LEVEL-1].i_data_o_buf[0 +:DATA_WIDTH];
                            end
                        end						
                        2'b10:
                        begin
                            o_valid_inner <= 1'b1;
                            o_data_bus_inner <= buf_def[NUM_BUF_LEVEL-1].i_data_o_buf[DATA_WIDTH +:DATA_WIDTH];
                        end						
                        default:
                        begin
                            o_valid_inner <= 1'b0;
                            o_data_bus_inner <= {DATA_WIDTH{1'b0}};
                        end											
                    endcase
                end
            end
            else
            begin
                o_valid_inner <= 1'b0;
                o_data_bus_inner <= {DATA_WIDTH{1'b0}};
            end
        end
        
    endgenerate
	// output inner logic
	assign  o_data_bus = o_data_bus_inner;
	assign  o_valid = o_valid_inner;

endmodule