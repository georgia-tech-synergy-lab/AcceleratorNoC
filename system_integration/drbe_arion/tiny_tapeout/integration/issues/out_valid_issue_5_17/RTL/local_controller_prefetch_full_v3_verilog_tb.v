`timescale 1ns / 1ps

`include "/home/green1/DKIT/tsmc_muse/IP/TSMC28_STD_CELLS/unzipped/tcbn28hpcplusbwp30p140_190a/tcbn28hpcplusbwp30p140_110a_vlg/TSMCHOME/digital/Front_End/verilog/tcbn28hpcplusbwp30p140_110a/tcbn28hpcplusbwp30p140.v"

////////////////////////////////////////////////////////////////////////////////////////////////
// Company: Gatech	
// Engineer: Mandovi Mukherjee
// 
// Create Date: 01/08/2021 
// System Name: accelerator
// Module Name: local controller
// Project Name: ARION DRBE
// Description: Testbench for local controller
// Dependencies:
// Additional Comments: 
/////////////////////////////////////////////////////////////////////////////////////////////////////

module local_controller_prefetch_full_tb;

    // parameter
    	parameter N_sample = 256;
	parameter datawidth = 16;
	parameter address_vector_width = 8; //can be 200 or 8: 8 for small tapeout
	parameter id_width = 4; // 16 local controllers in subscaled system
	parameter sample_address_width = 8; /// assuming 1024 rows and 64 columns: needs to change if arrangement is different
	parameter packet_width = 2*datawidth + address_vector_width;
	parameter size = 2;
	parameter T_clk = 0.5;
    
    	reg CLK;
    	reg reset;
	reg init;
	reg from_glob_controller_valid0;
	reg from_glob_controller_valid1;
	reg from_glob_controller_valid2;
	reg from_glob_controller_valid3;
	reg from_glob_prefetch_valid0;
	reg from_glob_prefetch_valid1;
	reg from_glob_prefetch_valid2;
	reg from_glob_prefetch_valid3;

	reg [sample_address_width - 1:0] from_glob_controller_delay_0;
	reg [sample_address_width - 1:0] from_glob_controller_delay_1;
	reg [sample_address_width - 1:0] from_glob_controller_delay_2;
	reg [sample_address_width - 1:0] from_glob_controller_delay_3;
	reg [sample_address_width - 1:0] from_glob_prefetch_start_0;
	reg [sample_address_width - 1:0] from_glob_prefetch_start_1;
	reg [sample_address_width - 1:0] from_glob_prefetch_start_2;
	reg [sample_address_width - 1:0] from_glob_prefetch_start_3;
	reg [sample_address_width - 1:0] from_glob_prefetch_stop_0;
	reg [sample_address_width - 1:0] from_glob_prefetch_stop_1;
	reg [sample_address_width - 1:0] from_glob_prefetch_stop_2;
	reg [sample_address_width - 1:0] from_glob_prefetch_stop_3;

	reg [address_vector_width - 1:0] from_glob_dest_addr_0;
	reg [address_vector_width - 1:0] from_glob_dest_addr_1;
	reg [address_vector_width - 1:0] from_glob_dest_addr_2;
	reg [address_vector_width - 1:0] from_glob_dest_addr_3;

	reg [address_vector_width - 1:0] from_glob_prefetch_dest_0;
	reg [address_vector_width - 1:0] from_glob_prefetch_dest_1;
	reg [address_vector_width - 1:0] from_glob_prefetch_dest_2;
	reg [address_vector_width - 1:0] from_glob_prefetch_dest_3;

	reg [2*datawidth - 1:0] D;

	reg [2*datawidth - 1:0] BWEBM_0;
	reg [2*datawidth - 1:0] BWEBM_1;
	reg [2*datawidth - 1:0] BWEBM_2;
	reg [2*datawidth - 1:0] BWEBM_3;
	reg [2*datawidth - 1:0] DM_0;
	reg [2*datawidth - 1:0] DM_1;
	reg [2*datawidth - 1:0] DM_2;
	reg [2*datawidth - 1:0] DM_3;



	reg [sample_address_width - 1:0] ext_sample_address_M;


	reg WEB;
	reg WEBM;
	reg ext_CEB;
	reg write_flag_0;
	reg write_flag_1;
	reg write_flag_2;
	reg write_flag_3;

	reg write_start;  //for testbench: not used in design
	reg input_write_boundary;


	
	wire [packet_width - 1:0] packet_out_0;
	wire [packet_width - 1:0] packet_out_1;
	wire [packet_width - 1:0] packet_out_2;
	wire [packet_width - 1:0] packet_out_3;
	wire [packet_width - 1:0] prefetch_packet_out_0;
	wire [packet_width - 1:0] prefetch_packet_out_1;
	wire [packet_width - 1:0] prefetch_packet_out_2;
	wire [packet_width - 1:0] prefetch_packet_out_3;

	wire boundary_next_0;
	wire boundary_next_1;
	wire boundary_next_2;
	wire boundary_next_3;
	wire [address_vector_width - 1:0] dest_address_0;
	wire [address_vector_width - 1:0] dest_address_1;
	wire [address_vector_width - 1:0] dest_address_2;
	wire [address_vector_width - 1:0] dest_address_3;


	wire [sample_address_width - 1:0] prefetch_stop_address_0;
	wire [sample_address_width - 1:0] prefetch_stop_address_1;
	wire [sample_address_width - 1:0] prefetch_stop_address_2;
	wire [sample_address_width - 1:0] prefetch_stop_address_3;
	wire [address_vector_width - 1:0] prefetch_dest_addr_0;
	wire [address_vector_width - 1:0] prefetch_dest_addr_1;
	wire [address_vector_width - 1:0] prefetch_dest_addr_2;
	wire [address_vector_width - 1:0] prefetch_dest_addr_3;
	wire prefetch_boundary_prev_0;
	wire prefetch_boundary_prev_1;
	wire prefetch_boundary_prev_2;
	wire prefetch_boundary_prev_3;
	
	//assign CLK_p = CLK | CLK_1;
	//assign #(0.2*T_clk) CLK_1 = CLK;


    initial begin
        	CLK <= 0;
        	reset <= 0;
		D <= 32'hffffffff;
		DM_0 <= 32'b0;
		DM_1 <= 32'b0;
		DM_2 <= 32'b0;
		DM_3 <= 32'b0;
		WEBM <= 1;
		BWEBM_0 <= 32'hffffffff;
		BWEBM_1 <= 32'hffffffff;
		BWEBM_2 <= 32'hffffffff;
		BWEBM_3 <= 32'hffffffff;
		write_flag_0 <= 0;
		write_flag_1 <= 0;
		write_flag_2 <= 0;
		write_flag_3 <= 0;
		write_start <= 0;
		input_write_boundary <= 0;


		from_glob_dest_addr_0 <= 8'bz;
		from_glob_dest_addr_1 <= 8'bz;
		from_glob_dest_addr_2 <= 8'bz;
		from_glob_dest_addr_3 <= 8'bz;
		from_glob_controller_delay_0 <= 8'bz;
		from_glob_controller_delay_1 <= 8'bz;
		from_glob_controller_delay_2 <= 8'bz;
		from_glob_controller_delay_3 <= 8'bz;
		from_glob_controller_valid0 <= 0;
		from_glob_controller_valid1 <= 0;
		from_glob_controller_valid2 <= 0;
		from_glob_controller_valid3 <= 0;

		from_glob_prefetch_valid0 <= 0;
		from_glob_prefetch_valid1 <= 0;
		from_glob_prefetch_valid2 <= 0;
		from_glob_prefetch_valid3 <= 0;
		from_glob_prefetch_start_0 <= 8'bz;
		from_glob_prefetch_start_1 <= 8'bz;
		from_glob_prefetch_start_2 <= 8'bz;
		from_glob_prefetch_start_3 <= 8'bz;
		from_glob_prefetch_stop_0 <= 8'bz;
		from_glob_prefetch_stop_1 <= 8'bz;
		from_glob_prefetch_stop_2 <= 8'bz;
		from_glob_prefetch_stop_3 <= 8'bz;
		from_glob_prefetch_dest_0 <= 8'bz;
		from_glob_prefetch_dest_1 <= 8'bz;
		from_glob_prefetch_dest_2 <= 8'bz;
		from_glob_prefetch_dest_3 <= 8'bz;

           #(T_clk + 0.2) reset <= 1;
	   #(3*T_clk) reset <= 0;

////////////////////////////// initial boot up phase /////////////////


	   #(T_clk + 0.1) from_glob_controller_valid2 <= 1;
			  from_glob_dest_addr_2 <= 8'b00001000;
		          from_glob_controller_delay_2 <= 8'b00011001;

	     #(T_clk)     from_glob_controller_valid2 <= 0;
			  from_glob_dest_addr_2 <= 8'bz;
			  from_glob_controller_delay_2 <= 8'bz;


///////////////write enabled //////////////////////////////////			
	   #(T_clk + 0.1) write_start <= 1; 
			  write_flag_0 <= 1;
	   #(T_clk)       write_flag_0 <= 0;


///////////////// prefetch condition added //////////////////////
	   #(1000*T_clk) from_glob_prefetch_valid3 <= 1;
		from_glob_prefetch_start_3 <= 8'h50;
		from_glob_prefetch_stop_3 <= 8'h60;
		from_glob_prefetch_dest_3 <= 8'b01101111;

	   #(T_clk) from_glob_prefetch_valid3 <= 0;
		from_glob_prefetch_start_3 <= 8'hz;
		from_glob_prefetch_stop_3 <= 8'hz;
		from_glob_prefetch_dest_3 <= 8'bz;

/////////////////////////////////////////////////////////////

				 
        

    end

    always #(0.5*T_clk) CLK <= ~CLK;
    always #(T_clk) begin
	if (write_start) begin
		D <= D + 1;
	end
		
    end


 
    local_controller_prefetch_full DUT0(.CLK(CLK), .reset(reset), .init(init),  .from_glob_controller_delay(from_glob_controller_delay_0),  .input_boundary_flag(boundary_next_3), .prev_dest_address(dest_address_3), .from_glob_dest_addr(from_glob_dest_addr_0), .packet_out(packet_out_0), .boundary_next(boundary_next_0), .dest_address(dest_address_0), .from_glob_controller_valid(from_glob_controller_valid0),  .WEBM(WEBM), .D(D),  .DM(DM_0), .BWEBM(BWEBM_0),  .ext_sample_address_M(ext_sample_address_M),.write_flag(write_flag_0), .from_glob_prefetch_valid(from_glob_prefetch_valid0), .from_glob_prefetch_start(from_glob_prefetch_start_0), .from_glob_prefetch_stop(from_glob_prefetch_stop_0), .from_glob_prefetch_dest(from_glob_prefetch_dest_0), .prefetch_packet_out(prefetch_packet_out_0), .write_boundary_next(write_boundary_next_0), .input_write_boundary(write_boundary_next_3), .prefetch_next_dest_addr(prefetch_dest_addr_1), .prefetch_next_stop_address(prefetch_stop_address_1), .prefetch_boundary_prev(prefetch_boundary_prev_0), .input_prefetch_boundary_flag(prefetch_boundary_prev_1), .prefetch_stop_address(prefetch_stop_address_0), .prefetch_dest_addr(prefetch_dest_addr_0));

    local_controller_prefetch_full DUT1(.CLK(CLK), .reset(reset), .init(init),  .from_glob_controller_delay(from_glob_controller_delay_1),  .input_boundary_flag(boundary_next_0), .prev_dest_address(dest_address_0), .from_glob_dest_addr(from_glob_dest_addr_1), .packet_out(packet_out_1), .boundary_next(boundary_next_1), .dest_address(dest_address_1), .from_glob_controller_valid(from_glob_controller_valid1),  .WEBM(WEBM), .D(D),  .DM(DM_1), .BWEBM(BWEBM_1),  .ext_sample_address_M(ext_sample_address_M),.write_flag(write_flag_1), .from_glob_prefetch_valid(from_glob_prefetch_valid1), .from_glob_prefetch_start(from_glob_prefetch_start_1), .from_glob_prefetch_stop(from_glob_prefetch_stop_1), .from_glob_prefetch_dest(from_glob_prefetch_dest_1), .prefetch_packet_out(prefetch_packet_out_1),  .write_boundary_next(write_boundary_next_1), .input_write_boundary(write_boundary_next_0), .prefetch_next_dest_addr(prefetch_dest_addr_2), .prefetch_next_stop_address(prefetch_stop_address_2), .prefetch_boundary_prev(prefetch_boundary_prev_1), .input_prefetch_boundary_flag(prefetch_boundary_prev_2), .prefetch_stop_address(prefetch_stop_address_1), .prefetch_dest_addr(prefetch_dest_addr_1));

    local_controller_prefetch_full DUT2(.CLK(CLK), .reset(reset), .init(init),  .from_glob_controller_delay(from_glob_controller_delay_2),  .input_boundary_flag(boundary_next_1), .prev_dest_address(dest_address_1), .from_glob_dest_addr(from_glob_dest_addr_2), .packet_out(packet_out_2), .boundary_next(boundary_next_2), .dest_address(dest_address_2), .from_glob_controller_valid(from_glob_controller_valid2),  .WEBM(WEBM), .D(D),  .DM(DM_2), .BWEBM(BWEBM_2), .ext_sample_address_M(ext_sample_address_M),.write_flag(write_flag_2), .from_glob_prefetch_valid(from_glob_prefetch_valid2), .from_glob_prefetch_start(from_glob_prefetch_start_2), .from_glob_prefetch_stop(from_glob_prefetch_stop_2), .from_glob_prefetch_dest(from_glob_prefetch_dest_2), .prefetch_packet_out(prefetch_packet_out_2), .write_boundary_next(write_boundary_next_2), .input_write_boundary(write_boundary_next_1), .prefetch_next_dest_addr(prefetch_dest_addr_3), .prefetch_next_stop_address(prefetch_stop_address_3), .prefetch_boundary_prev(prefetch_boundary_prev_2), .input_prefetch_boundary_flag(prefetch_boundary_prev_3), .prefetch_stop_address(prefetch_stop_address_2), .prefetch_dest_addr(prefetch_dest_addr_2));

    local_controller_prefetch_full DUT3(.CLK(CLK), .reset(reset), .init(init),  .from_glob_controller_delay(from_glob_controller_delay_3),  .input_boundary_flag(boundary_next_2), .prev_dest_address(dest_address_2), .from_glob_dest_addr(from_glob_dest_addr_3), .packet_out(packet_out_3), .boundary_next(boundary_next_3), .dest_address(dest_address_3), .from_glob_controller_valid(from_glob_controller_valid3),  .WEBM(WEBM), .D(D), .DM(DM_3), .BWEBM(BWEBM_3),  .ext_sample_address_M(ext_sample_address_M),.write_flag(write_flag_3), .from_glob_prefetch_valid(from_glob_prefetch_valid3), .from_glob_prefetch_start(from_glob_prefetch_start_3), .from_glob_prefetch_stop(from_glob_prefetch_stop_3), .from_glob_prefetch_dest(from_glob_prefetch_dest_3), .prefetch_packet_out(prefetch_packet_out_3), .write_boundary_next(write_boundary_next_3), .input_write_boundary(write_boundary_next_2), .prefetch_next_dest_addr(prefetch_dest_addr_0), .prefetch_next_stop_address(prefetch_stop_address_0), .prefetch_boundary_prev(prefetch_boundary_prev_3), .input_prefetch_boundary_flag(prefetch_boundary_prev_0), .prefetch_stop_address(prefetch_stop_address_3), .prefetch_dest_addr(prefetch_dest_addr_3));


    
endmodule
