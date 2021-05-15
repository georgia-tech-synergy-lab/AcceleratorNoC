
module top_mod_cm_1(CLK, scen_ch, reset, ts_inc, din_0, din_1, din_2, int1_real, int1_img, int2_real, int2_img, int3_real, int3_img,
					out1_real, out1_img, out2_real, out2_img, out3_real, out3_img);



input [15:0] int1_real,int1_img,int2_real,int2_img,int3_real,int3_img;

input [15:0] ts_inc;
input CLK,scen_ch,reset;

input [15:0] din_0,din_1,din_2;

output [15:0] out1_real,out1_img,out2_real,out2_img,out3_real,out3_img;


endmodule
