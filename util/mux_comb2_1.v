`timescale 1ns / 1ps
/////////////////////////////////////////////////////////////
// Top Module:  mux2_1
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

module mux_comb2_1#(
	parameter DATA_WIDTH = 32
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
	input                          i_valid;             

	output [DATA_WIDTH-1:0]        o_data_bus;
	output                         o_valid;             
	    
	input                          i_en;
	input                          i_cmd;
                                // 0 --> Branch_left
                                // 1 --> Branch_right

    // inner logic
    reg  [DATA_WIDTH-1:0]          o_data_bus_inner;
    reg                            o_valid_inner;

    always@(*)
    begin
        if(i_en)
        begin
            if(i_valid)
            begin
                case(i_cmd)
                    1'b0:
                    begin
                        o_valid_inner = 1'b1;
                        o_data_bus_inner = i_data_bus[0 +:DATA_WIDTH];
                    end						
                    1'b1:
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
                o_data_bus_inner = {DATA_WIDTH{1'b0}};
            end
        end
        else
        begin
            o_valid_inner <= 1'b0;
            o_data_bus_inner <= {DATA_WIDTH{1'bz}};
        end
    end

    assign o_data_bus = o_data_bus_inner;
    assign o_valid = o_valid_inner;

endmodule