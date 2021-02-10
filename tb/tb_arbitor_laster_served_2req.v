`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/05/2021 08:24:09 PM
// Design Name: 
// Module Name: tb_arbitor_last_served_2req
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module tb_arbitor_last_served_2req();
	parameter NUM_REQ  = 2;

    // timing signals
    reg                            clk;
    reg                            rst;
    
    // data signals
	reg                            i_valid;        // valid input data signal
	reg    [NUM_REQ-1:0]           i_req_bus;      // input data bus coming into arbiter
	
	wire                           o_valid;        // output valid
    wire                           o_grant_b;      // output grant 

	// control signals
	reg                            i_en;           // module enable
    
    // inner test
    reg                            req_a;
    reg                            req_b;

    // Test case declaration
    initial 
    begin
        clk = 1'b0;
        rst = 1'b0;
        // i_req_bus = {req_b,req_a}; 
        
        // don't enable
        i_valid = 1'b1;
        req_a = 1'b0;
        req_b = 1'b1;
        i_req_bus = {req_b, req_a};
        i_en = 1'b0;
        
        // reset
        #10
        rst = 1'b1;
        i_valid = 1'b1;
        req_a = 1'b0;
        req_b = 1'b1;
        i_req_bus = {req_b, req_a};
        i_en = 1'b1;
        
        // default: previous grant A; A doesn't request; B request -> should grant B output 1; valid
        #10
        rst = 1'b0;
        i_valid = 1'b1;
        req_a = 1'b0;
        req_b = 1'b1;
        i_req_bus = {req_b, req_a};
        i_en = 1'b1;
        
        // previous grant B; A request; B doesn't request -> should grant A output 0; valid
        #10
        i_valid = 1'b1;
        req_a = 1'b1;
        req_b = 1'b0;
        i_req_bus = {req_b, req_a};
        i_en = 1'b1;
        
        //  previous grant A; both A & B request -> should grant B output 1; valid
        #10
        i_valid = 1'b1;
        req_a = 1'b1;
        req_b = 1'b1;
        i_req_bus = {req_b, req_a};
        i_en = 1'b1;
        
        
        //  previous grant B; both A & B request -> should grant A output 0; valid
        #10
        i_valid = 1'b1;
        req_a = 1'b1;
        req_b = 1'b1;
        i_req_bus = {req_b, req_a};
        i_en = 1'b1;
        
        //  previous grant A; A request, B doesn't request -> should grant A output 0; valid
        #10
        i_valid = 1'b1;
        req_a = 1'b1;
        req_b = 1'b0;
        i_req_bus = {req_b, req_a};
        i_en = 1'b1;
        
        //  previous grant A; both A & B don't request -> should output 0; invalid doesn't grant anything
        #10
        i_valid = 1'b1;
        req_a = 1'b0;
        req_b = 1'b0;
        i_req_bus = {req_b, req_a};
        i_en = 1'b1;
        
        //  previous grant A; A doesn't request, B request -> should grant B output 1; valid
        #10
        i_valid = 1'b1;
        req_a = 1'b0;
        req_b = 1'b1;
        i_req_bus = {req_b, req_a};
        i_en = 1'b1;
        
        //  previous grant B; A request, B doesn't request -> should grant A output 0; valid
        #10
        i_valid = 1'b1;
        req_a = 1'b1;
        req_b = 1'b0;
        i_req_bus = {req_b, req_a};
        i_en = 1'b1;
        
        //  previous grant A; A doesn't request, B request -> should grant B output 1; valid
        #10
        i_valid = 1'b1;
        req_a = 1'b0;
        req_b = 1'b1;
        i_req_bus = {req_b, req_a};
        i_en = 1'b1;
 
        //  previous grant B; both A & B don't request -> should output 0; invalid -> don't grant anything
        #10
        i_valid = 1'b1;
        req_a = 1'b0;
        req_b = 1'b0;
        i_req_bus = {req_b, req_a};
        i_en = 1'b1;
         
        // disable -> should output z; invalid -> don't grant anything
        #10
        i_valid = 1'b1;
        req_a = 1'b0;
        req_b = 1'b0;
        i_req_bus = {req_b, req_a};
        i_en = 1'b0;
   
        // reset after enable
        #10
        rst = 1'b1;
        i_valid = 1'b1;
        req_a = 1'b0;
        req_b = 1'b1;
        i_req_bus = {req_b, req_a};
        i_en = 1'b1; 
        
         
        //  previous grant A; A doesn't request, B request -> should grant B output 1; valid
        #10
        rst = 1'b0;
        i_valid = 1'b1;
        req_a = 1'b0;
        req_b = 1'b1;
        i_req_bus = {req_b, req_a};
        i_en = 1'b1;     
        $stop;                     
end


    // instantiate DUT (device under test)
    arbitor_last_served_2req dut(
        .clk(clk),
        .rst(rst),
		.i_valid(i_valid),
		.i_req_bus(i_req_bus),
		.o_valid(o_valid),
		.o_grant_b(o_grant_b),
		.i_en(i_en)
	);

    always#5 clk=~clk;

endmodule