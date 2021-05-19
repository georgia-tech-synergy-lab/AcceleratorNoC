

//Designer-Sudarshan Sharma

//This module generates the CLK for the DFT block








//This needs to be automated
//Checking for initial test

module gen_dft_clk(CLK,reset,upload,dft_clk_out,ready);

//////////Changes these parameters for your dft CLK////////////

parameter num_cycles=8;
parameter cnt_bits=3; //ceil(log(num_cycles,2))-1
//Change the count variable assignment 3'd to (cnt_bits+1)'d
//////////End of variable parameters////////////



input CLK,reset;
input upload;
output dft_clk_out;
output reg ready;
reg run;



//assign dft_clk_out=~CLK&run;
assign dft_clk_out = run;

reg [cnt_bits:0] count;

always @(posedge CLK or posedge reset)
	begin
		if(reset==1'b1)
			begin
				count<=3'd0;
				run<=1'b0;
				ready<=1'b0;
			end
		else

			begin
				if(upload==1'b1 )
					begin

						if(count==num_cycles)
							begin
								count<=count;
								run<=1'b0;
								ready<=1'b1;
							end
						else
							begin
								count<=count+3'd1;
								run<=run + 1'b1;
								ready<=1'b0;
								
							end
				

				
					end
				else

					begin
						count<=3'd0;

					end
				

			end

	end
endmodule
