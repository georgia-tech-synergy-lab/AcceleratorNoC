`timescale 1ns / 1ps
/////////////////////////////////////////////////////////////
// Top Module:  mux_2x1_simple_comb
// Data:        Only data width matters.
// Format:      keeping the input format unchange
// Timing:      Combinational Logic
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

module mux_2x1_simple_comb#(
	parameter DATA_WIDTH = 32,
    parameter COMMMAND_WIDTH = 1
)(
    // data signals
	i_valid,        // valid input data signal
	i_data_bus,     // input data bus coming into mux
	
	o_valid,        // output valid
    o_data_bus,     // output data 

	// control signals
	i_en,           // mux enable
	i_cmd           // command 
);
	// interface
	input  [2*DATA_WIDTH-1:0]      i_data_bus;
	input  [1:0]                   i_valid;             

	output [DATA_WIDTH-1:0]        o_data_bus;
	output                         o_valid;             
	    
	input                          i_en;
	input  [COMMMAND_WIDTH-1:0]    i_cmd;
                                // 0 --> Branch High
                                // 1 --> Branch Low

    // inner logic
    reg    [DATA_WIDTH-1:0]        o_data_bus_inner;
    reg                            o_valid_inner;
    reg    [1:0]                   i_valid_inner; 

    always @(*) begin
        i_valid_inner = i_valid;
    end

    always@(*)
    begin
        if(i_en)
        begin 
            casex({i_cmd,i_valid_inner[1],i_valid_inner[0]})
                3'b0x1:
                begin
                    o_valid_inner = 1'b1;
                    o_data_bus_inner = i_data_bus[0 +:DATA_WIDTH];
                end						
                3'b11x:
                begin
                    o_valid_inner = 1'b1;
                    o_data_bus_inner = i_data_bus[DATA_WIDTH +:DATA_WIDTH];
                end						
                default:
                begin
                    o_valid_inner = 1'b0;
                    o_data_bus_inner = {DATA_WIDTH{1'b0}};
                end											
            endcase
        end
        else
        begin
            o_valid_inner = 1'b0;
            o_data_bus_inner = {DATA_WIDTH{1'bz}};
        end
    end

    assign o_data_bus = o_data_bus_inner;
    assign o_valid = o_valid_inner;

endmodule