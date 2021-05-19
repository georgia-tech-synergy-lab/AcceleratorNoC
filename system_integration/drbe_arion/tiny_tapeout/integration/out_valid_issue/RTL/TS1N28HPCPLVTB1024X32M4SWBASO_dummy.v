`timescale 1ns/1ps

module TS1N28HPCPLVTB1024X32M4SWBASO (
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

parameter numWord = 1024;
parameter numRow = 256;
parameter numCM = 4;
parameter numIOBit = 32;
parameter numBit = 32;
parameter numWordAddr = 10;
parameter numRowAddr = 8;
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
input [9:0] A;
input [31:0] D;
input [31:0] BWEB;

// BIST Mode Input
input CEBM;
input WEBM;
input [9:0] AM;
input [31:0] DM;
input [31:0] BWEBM;

// Data Output
output [31:0] Q;

endmodule

