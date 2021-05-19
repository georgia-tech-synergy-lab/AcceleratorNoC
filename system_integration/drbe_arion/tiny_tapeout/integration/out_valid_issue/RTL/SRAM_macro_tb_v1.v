`timescale 1ns / 1ps

//`include "/home/green1/DKIT/tsmc_muse/IP/TSMC28_STD_CELLS/unzipped/tcbn28hpcplusbwp30p140_190a/tcbn28hpcplusbwp30p140_110a_vlg/TSMCHOME/digital/Front_End/verilog/tcbn28hpcplusbwp30p140_110a/tcbn28hpcplusbwp30p140.v"

////////////////////////////////////////////////////////////////////////////////////////////////
// Company: Gatech	
// Engineer: Mandovi Mukherjee
// 
// Create Date: 03/15/2021 
// System Name: accelerator
// Module Name: SRAM_macro_tb
// Project Name: ARION DRBE
// Description: Testbench for SRAM generated from memory compiler 
// Dependencies:
// Additional Comments: 
/////////////////////////////////////////////////////////////////////////////////////////////////////

module SRAM_macro_tb;

//parameters
parameter numWord = 256;
parameter numRow = 64;
parameter numCM = 4;
parameter numIOBit = 32;
parameter numBit = 32;
parameter numWordAddr = 8;
parameter numRowAddr = 6;
parameter numCMAddr = 2;
parameter numRowRedSize = 0;
parameter numColRedSize = 0;
parameter numSRSize = numRowRedSize + numColRedSize;
parameter numRR = 2;
parameter numCR = 1;
parameter numDC = 0;
parameter numStuckAt = 20;

parameter clk_half_period =0.25;

//=== IO Ports ===//

// Mode Control
reg BIST;
reg AWT;
// Normal Mode Input
reg SLP;
reg SD;
reg CLK;
reg CEB;
reg WEB;
reg [7:0] A;
reg [31:0] D;
reg [31:0] BWEB;

// BIST Mode Input
reg CEBM;
reg WEBM;
reg [7:0] AM;
reg [31:0] DM;
reg [31:0] BWEBM;

// Data Output
wire [31:0] Q;


// internal reg for data setup
reg [127:0] data;
reg [8:0] sample_address;

    initial begin
        	CLK <= 0;
		SLP <= 0;
		SD <= 0;
		AWT <= 0;
		BIST <= 0;
		CEB <= 1;
		WEB <= 1;
		A <= 8'b11111111;
		D <= 32'hffffffff;
		BWEB <= 32'hffffffff;

	#(2*clk_half_period) CEB <= 0;
	     WEB <= 0;
	     BWEB <= 0;
	     A    <= 8'b00011001;
	     D    <= 8'h56;
	#(2*clk_half_period) WEB <= 1;
	   BWEB <= 32'hffffffff;
	   A <= 6'b0;
	#(10*clk_half_period)   A <= 6'b011001;  	 	     

        

    end

    always #clk_half_period CLK <= ~CLK;
    always #(2*clk_half_period) A <= A + 1;
    always #(2*clk_half_period) D <= ~D + 1;

 
    TS1N28HPCPLVTB256X32M4SWBASO DUT( .SLP(SLP), .SD(SD), .CLK(CLK), .CEB(CEB), .WEB(WEB), .CEBM(CEBM), .WEBM(WEBM), .AWT(AWT), .A(A), .D(D), .BWEB(BWEB), .AM(AM), .DM(DM), .BWEBM(BWEBM), .BIST(BIST), .Q(Q));
    
endmodule
