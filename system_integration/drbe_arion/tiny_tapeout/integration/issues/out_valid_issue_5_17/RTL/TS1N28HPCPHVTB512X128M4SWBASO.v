`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////////////////////
// Company: Gatech	
// Engineer: Mandovi Mukherjee
// 
// Create Date: 01/08/2021 
// System Name: accelerator
// Module Name: local controller
// Project Name: ARION DRBE
// Description: fetch and push data out to network; assuming the output from
// global controller comes in the form of a packet
// Dependencies:
// Additional Comments: 
/////////////////////////////////////////////////////////////////////////////////////////////////////

module TS1N28HPCPHVTB512X128M4SWBASO (
            SLP,
            SD,
            CLK, CEB, WEB,
            CEBM, WEBM,
            AWT,
            A, D,
            BWEB,
            AM, DM, 
            BWEBM,
            BIST,
            Q);

parameter numWord = 512;
parameter numRow = 128;
parameter numCM = 4;
parameter numIOBit = 128;
parameter numBit = 128;
parameter numWordAddr = 9;
parameter numRowAddr = 7;
parameter numCMAddr = 2;
parameter numRowRedSize = 0;
parameter numColRedSize = 0;
parameter numSRSize = numRowRedSize + numColRedSize;
parameter numRR = 2;
parameter numCR = 1;
parameter numDC = 0;
parameter numStuckAt = 20;


//=== IO Ports ===//

// Mode Control
input BIST;
input AWT;
// Normal Mode Input
input SLP;
input SD;
input CLK;
input CEB;
input WEB;
input [8:0] A;
input [127:0] D;
input [127:0] BWEB;

// BIST Mode Input
input CEBM;
input WEBM;
input [8:0] AM;
input [127:0] DM;
input [127:0] BWEBM;

// Data Output
output [127:0] Q;
 

   
endmodule
    
