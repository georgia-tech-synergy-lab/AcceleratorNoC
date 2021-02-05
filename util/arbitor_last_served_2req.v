`timescale 1ns / 1ps
/////////////////////////////////////////////////////////////
// Top Module:  arbitor_last_served_2req
// Data:        1 bit request signal
// Timing:      Combinational Logic
// 
// Function:    bydefault output  {1'b0}. Only support 2 req.
// Note:        Grant has no meaning when both Req are 0.
//                                  ________
//                                  \       \ 
//        req A -------->[not]------>|       |--------> Grant
//                              ---->|       |    |
//                              |   /______ /     | 
//                  _______     |      OR         |
//                 |       \    |                 |
//      req B ---->|        |------> out_and      |
//       -->[not]->|        |                     |                  
//       |         |_______/                      |
//       |            AND                         |
//       |                                        |
//    |¯¯¯¯|                                      |
//    |    |<--------------------------------------
//    | /\ |   
//    |/__\|
//  Last Used Reg
//
// Author:      Jianming Tong (jianming.tong@gatech.edu)
/////////////////////////////////////////////////////////////

module arbitor_last_served_2req(
    // data signals
	i_valid,        // valid input data signal
	i_req_bus,      // input req bus coming into arbitor
	
	o_valid,        // output valid
    o_grant_b,      // output grant

	// control signals
	i_en            // arbitor enable
);
    // local parameter
    localparam  NUM_REQ = 2; // only support 2 request

	// interface
	input  [NUM_REQ-1:0]           i_req_bus; // bit 0 = Req A; bit 1 = Req B 
	input                          i_valid;             

	output                         o_grant_b; // 0 grants Req A; 1 grants Req B 
	output                         o_valid;             
	    
	input                          i_en;
   
    // inner logic
    reg                            o_grant_b_inner;
    reg                            o_valid_inner;

    reg  out_and;
    wire req_a = i_req_bus[0];
    wire req_b = i_req_bus[1];

    initial begin
        o_grant_b_inner = 1'b0;
    end

    always@(*)
    begin
        if(i_en)
        begin
            if(i_valid)
            begin
                out_and = req_b & (~o_grant_b_inner);
                o_grant_b_inner = (~req_a) | out_and;
                o_valid_inner = 1'b1;
            end
        end
        else
        begin
            o_grant_b_inner = 1'bz;
            o_valid_inner = 1'b0;
        end
    end
    
    assign o_grant_b = o_grant_b_inner;
    assign o_valid = o_valid_inner;

endmodule