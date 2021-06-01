`timescale 1ps/1fs



module tb_dft;




reg clk,reset,upload;
wire dft_clk_out;
wire ready;
reg dft_clk_out_reg;

gen_dft_clk UUT1(clk,reset,upload,dft_clk_out,ready);






always @(*)
begin

dft_clk_out_reg=dft_clk_out;

end

reg [15:0] din0;
reg [15:0] din1;
reg [15:0] din2;
reg [15:0] din3;

wire [15:0] dout;
reg [15:0] dout_spi_reg;
reg load;

spi_module UUT2(din0,din1,din2,din3,dft_clk_out_reg,reset,dout,load);



always@(*)
begin

dout_spi_reg=dout;
end

reg scen_ch;
wire [15:0] dout0;
wire [15:0] dout1;
wire [15:0] dout2;
wire [15:0] dout3;


dft_doppler UUT3(~dft_clk_out_reg,reset,dout_spi_reg,dout0,dout1,dout2,dout3,scen_ch);



always
begin

clk=1'b1;
#192;
clk=1'b0;
#192;

end



initial 
begin

#1000;
scen_ch=0;
upload=0;
load=0;
reset=0;
din0=16'd1;
din1=16'd2;
din2=16'd3;
din3=16'd4;

#1000;

reset=1;

#1000;

reset=0;

#1000;

load=1;
//load din in the shift registers

#1000;
load=0;

#1000;

upload=1;
//Start the dft clock

#1000;
#1000;
#1000;
#1000;
#1000;
#1000;
#1000;
#1000;
#1000;
#1000;
scen_ch=1;
//scenario change-> Check the out of the dft_doppler
#1000;
#1000;






end
















endmodule
