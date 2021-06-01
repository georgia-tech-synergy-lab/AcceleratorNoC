
module top_mod_cm_1 ( doppler_dft_clk, CLK, scen_ch, reset, din, int1_real, 
        int1_img, int2_real, int2_img, int3_real, int3_img, out1_real, 
        out1_img, out2_real, out2_img, out3_real, out3_img );
  input [15:0] din;
  input [15:0] int1_real;
  input [15:0] int1_img;
  input [15:0] int2_real;
  input [15:0] int2_img;
  input [15:0] int3_real;
  input [15:0] int3_img;
  output [15:0] out1_real;
  output [15:0] out1_img;
  output [15:0] out2_real;
  output [15:0] out2_img;
  output [15:0] out3_real;
  output [15:0] out3_img;
  input doppler_dft_clk, CLK, scen_ch, reset;


endmodule
