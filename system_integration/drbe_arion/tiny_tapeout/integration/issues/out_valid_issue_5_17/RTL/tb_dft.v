`timescale 1ps/1fs



module tb_dft;

	parameter delay_length = 14; // log(id_width*N_sample)
	parameter obj_id_width = 2; // log(N_obj)
	parameter N_obj = 4; //can be 200 or 8: 8 for small tapeout



reg CLK,reset,upload;
wire dft_clk_out;
wire ready;
reg dft_clk_out_reg;
wire [delay_length - 1:0] delay_matrix_element;
wire [obj_id_width - 1:0] obj_id_element;

gen_dft_clk UUT1(CLK,reset,upload,dft_clk_out,ready);






//always @(*)
//begin

//dft_clk_out_reg=dft_clk_out;

//end

reg [15:0] din0;
reg [15:0] din1;
reg [15:0] din2;
reg [15:0] din3;

wire [15:0] dout;
reg [15:0] dout_spi_reg;
reg load;

	reg [delay_length - 1:0] config_delay_matrix_element0;
	reg [delay_length - 1:0] config_delay_matrix_element1;
	reg [delay_length - 1:0] config_delay_matrix_element2;
	reg [delay_length - 1:0] config_delay_matrix_element3;

	reg [obj_id_width - 1:0] config_obj_id_element0;
	reg [obj_id_width - 1:0] config_obj_id_element1;
	reg [obj_id_width - 1:0] config_obj_id_element2;
	reg [obj_id_width - 1:0] config_obj_id_element3;


//spi_module UUT2(din0,din1,din2,din3,dft_clk_out_reg,reset,dout,load);
  spi_module UUT2(config_delay_matrix_element0,config_delay_matrix_element1,config_delay_matrix_element2,config_delay_matrix_element3,config_obj_id_element0,config_obj_id_element1,config_obj_id_element2,config_obj_id_element3,dft_clk_out,reset,delay_matrix_element,obj_id_element,load);



//always@(*)
//begin

//dout_spi_reg=dout;
//end

//reg scen_ch;
//wire [15:0] dout0;
//wire [15:0] dout1;
//wire [15:0] dout2;
//wire [15:0] dout3;


//dft_doppler UUT3(~dft_clk_out_reg,reset,dout_spi_reg,dout0,dout1,dout2,dout3,scen_ch);



always
begin

CLK=1'b1;
#192;
CLK=1'b0;
#192;

end



initial 
begin

#1000;
//scen_ch=0;
upload=0;
load=0;
reset=0;
config_delay_matrix_element0=14'd10000;
config_obj_id_element0=2'd0;
config_delay_matrix_element1=14'd10010;
config_obj_id_element1=2'd1;
config_delay_matrix_element2=14'h3fff;
config_obj_id_element2=2'd2;
config_delay_matrix_element3=14'h3fff;
config_obj_id_element3=2'd3;

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
//scen_ch=1;
//scenario change-> Check the out of the dft_doppler
#1000;
#1000;






end
















endmodule
