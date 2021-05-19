


module dft_doppler(clk,reset,din,dout0,dout1,dout2,dout3,scen_ch);

input clk,reset,scen_ch;
//clk of this is the negation of the spi clock
//scen_ch is the scenario change

input [15:0] din;
output reg [15:0] dout0;
output reg [15:0] dout1;
output reg [15:0] dout2;
output reg [15:0] dout3;

reg [15:0] shift_reg [3:0];
always @(posedge clk or posedge reset or scen_ch)

begin
	if(reset==1'b1)
		begin
			dout0=16'd0;
			dout1=16'd0;
			dout2=16'd0;
			dout3=16'd0;

			shift_reg[0]=16'd0;
			shift_reg[1]=16'd0;
			shift_reg[2]=16'd0;
			shift_reg[3]=16'd0;

		end
	else

		begin

			if(scen_ch==1'b1)

				begin

					dout0=shift_reg[0];
					dout1=shift_reg[1];
					dout2=shift_reg[2];
					dout3=shift_reg[3];
				end

			else

				begin

					shift_reg[3]=shift_reg[2];
					shift_reg[2]=shift_reg[1];
					shift_reg[1]=shift_reg[0];
					shift_reg[0]=din;			

				end

		end
	


end



endmodule