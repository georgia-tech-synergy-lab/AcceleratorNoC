// Code your design here
//`timescale 1ns / 1ns

module addrGen ( CLK, rst, addr);

input CLK, rst;
output reg [5:0] addr;

reg [7:0] counter_up;

// up counter + addr gen
always @(posedge CLK)
begin
   if (rst == 1'b1)  begin
           addr <= 6'd0;
           counter_up <= 8'd0;
    end else if  ((counter_up == 8'd255) && (addr !== 6'd2)) begin
  		addr <= addr + 6'd1;
                counter_up <= 8'd0;
    end else if ((counter_up == 8'd255) && (addr == 6'd2)) begin
                addr <= 6'd0;
                counter_up <= 8'd0;
    end else begin
 	   counter_up <= counter_up + 8'd1;
    end
 end

endmodule
