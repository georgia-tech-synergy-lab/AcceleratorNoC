
module spi_module(config_delay_matrix_element0,config_delay_matrix_element1,config_delay_matrix_element2,config_delay_matrix_element3,config_obj_id_element0,config_obj_id_element1,config_obj_id_element2,config_obj_id_element3,CLK,reset,delay_matrix_element,obj_id_element,load);


	parameter delay_length = 14; // log(id_width*N_sample)
	parameter obj_id_width = 2; // log(N_obj)
	parameter N_obj = 4; //can be 200 or 8: 8 for small tapeout

	input [delay_length - 1:0] config_delay_matrix_element0;
	input [delay_length - 1:0] config_delay_matrix_element1;
	input [delay_length - 1:0] config_delay_matrix_element2;
	input [delay_length - 1:0] config_delay_matrix_element3;

	input [obj_id_width - 1:0] config_obj_id_element0;
	input [obj_id_width - 1:0] config_obj_id_element1;
	input [obj_id_width - 1:0] config_obj_id_element2;
	input [obj_id_width - 1:0] config_obj_id_element3;

input CLK,reset;

input load;
//load din in the shift registers

output reg [delay_length - 1:0] delay_matrix_element;
output reg [obj_id_width - 1:0] obj_id_element;
reg [delay_length - 1:0] din_reg [N_obj - 1:0];
reg [obj_id_width - 1:0] din_obj_reg [N_obj - 1:0];

reg [1:0] cnt;//Counter for Parallel out
always @(posedge CLK or posedge reset or posedge load)

begin
	if(reset==1'b1)
		begin
			delay_matrix_element <= 14'd0;
			obj_id_element <= 2'b0;
			din_reg[0]<=14'd0;
			din_reg[1]<=14'd0;
			din_reg[2]<=14'd0;	
			din_reg[3]<=14'd0;
			din_obj_reg[0]<=2'd0;
			din_obj_reg[1]<=2'd0;
			din_obj_reg[2]<=2'd0;
			din_obj_reg[3]<=2'd0;
			cnt<=2'd0;
		end

	else
		begin

			if(load==1'b1)
				begin

					din_reg[0]<=config_delay_matrix_element0;
					din_reg[1]<=config_delay_matrix_element1;
					din_reg[2]<=config_delay_matrix_element2;	
					din_reg[3]<=config_delay_matrix_element3;
					din_obj_reg[0]<=config_obj_id_element0;
					din_obj_reg[1]<=config_obj_id_element1;
					din_obj_reg[2]<=config_obj_id_element2;
					din_obj_reg[3]<=config_obj_id_element3;

				end

			else

				begin
//					dout=din_reg[3];
//					din_reg[3]=din_reg[2];
//					din_reg[2]=din_reg[1];
//					din_reg[1]=din_reg[0];
//					din_reg[0]=dout;

                    //Circular shift will not meet timing
                    case(cnt)
                    2'd0:begin
                            delay_matrix_element <=din_reg[0];
                            obj_id_element <=din_obj_reg[0];
                            cnt<=cnt+2'd1;
                          end
                    2'd1:begin
                            delay_matrix_element <= din_reg[1];
                            obj_id_element <= din_obj_reg[1];

                            cnt<=cnt+2'd1;
                         end
                    2'd2:begin
                            delay_matrix_element <= din_reg[2];
                            obj_id_element <=din_obj_reg[2];

                            cnt<=cnt+2'd1;
                         end
                    2'd3:begin
                           delay_matrix_element <=din_reg[3];
                            obj_id_element <=din_obj_reg[3];

                            cnt<=2'd0;
                         end
                    default:begin
                    
                            din_reg[3]<=din_reg[3];
                            din_reg[2]<=din_reg[2];
                            din_reg[1]<=din_reg[1];
                            din_reg[0]<=din_reg[0];

                            din_obj_reg[3]<=din_obj_reg[3];
                            din_obj_reg[2]<=din_obj_reg[2];
                            din_obj_reg[1]<=din_obj_reg[1];
                            din_obj_reg[0]<=din_obj_reg[0];

                            cnt<=cnt;
                        
                             end
                    
                    endcase
					
				end
		end


end

endmodule
