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
    	parameter N_sample = 1024;
	parameter datawidth = 16;
	parameter address_vector_width = 8; //can be 200 or 8: 8 for small tapeout
	parameter id_width = 4; // 16 local controllers in subscaled system
	parameter sample_address_width = 10; /// assuming 1024 rows and 64 columns: needs to change if arrangement is different
	parameter packet_width = 2*datawidth + address_vector_width;
	parameter size = 2;
	parameter T_clk = 0.6;
    
    	reg CLK;
    	reg reset;
	reg init;
	reg from_glob_controller_valid0;
	reg from_glob_prefetch_valid0;
	reg from_glob_controller_valid1;
	reg [sample_address_width - 1:0] from_glob_controller_delay_0;
	reg [sample_address_width - 1:0] from_glob_prefetch_start_0;
	reg [sample_address_width - 1:0] from_glob_prefetch_stop_0;
	reg [sample_address_width - 1:0] from_glob_controller_delay_1;
	reg [address_vector_width - 1:0] from_glob_dest_addr_0;
	reg [address_vector_width - 1:0] from_glob_prefetch_dest_0;
	reg [address_vector_width - 1:0] from_glob_dest_addr_1;
	reg [2*datawidth - 1:0] D_0;
	reg [2*datawidth - 1:0] BWEB_0;
	reg [2*datawidth - 1:0] BWEBM_0;
	reg [2*datawidth - 1:0] DM_0;
	reg input_boundary_flag;
	reg [address_vector_width - 1:0] prev_dest_address;
	reg [sample_address_width - 1:0] ext_sample_address;
	reg [sample_address_width - 1:0] ext_sample_address_M;


	reg WEB;
	reg WEBM;
	reg ext_CEB;
	reg write_flag;


	
	wire [packet_width - 1:0] packet_out_0;
	wire [packet_width - 1:0] prefetch_packet_out_0;
	wire [packet_width - 1:0] packet_out_1;
	wire boundary_next_0;
	wire boundary_next_1;
	wire [address_vector_width - 1:0] dest_address_0;
	wire [address_vector_width - 1:0] dest_address_1;

    initial begin
        	CLK <= 0;
        	reset <= 0;
		init <= 0;
		D_0 <= 32'b0;
		DM_0 <= 32'b0;
		BWEB_0 <= 32'hffffffff;
		BWEBM_0 <= 32'hffffffff;
		WEB <= 1;
		WEBM <= 1;
		ext_CEB <= 1;
		input_boundary_flag <= 0;
		prev_dest_address <= 8'b00000000;
		from_glob_dest_addr_0 <= 8'bz;
		from_glob_dest_addr_1 <= 8'bz;
		from_glob_controller_delay_0 <= 10'bz;
		from_glob_controller_delay_1 <= 10'bz;
		from_glob_controller_valid0 <= 0;
		from_glob_controller_valid1 <= 0;
		write_flag <= 0;
		ext_sample_address <= 10'h0;
		from_glob_prefetch_valid0 <= 0;
		from_glob_prefetch_start_0 <= 10'bz;
		from_glob_prefetch_stop_0 <= 10'bz;
		from_glob_prefetch_dest_0 <= 8'bz;

           #(T_clk + 0.2) reset <= 1;
	   #(3*T_clk + 0.2) reset <= 0;
			
	   #(T_clk + 0.2) WEB <= 0;
		write_flag <= 1;
		ext_CEB <= 0;
		BWEB_0 <= 32'h0;
	   //#0.1	
	   #(1024*T_clk) WEB <= 1;
	        write_flag <= 0;
		ext_CEB <= 1;
		BWEB_0 <= 32'hffffffff;

	     #(4*T_clk) init <= 1;
	   #(T_clk + 0.1) from_glob_controller_valid0 <= 1;
	        from_glob_controller_valid1 <= 0;
                from_glob_dest_addr_0 <= 8'b00001000;
		from_glob_controller_delay_0 <= 10'b0000011001;
	     #(2*T_clk) from_glob_controller_valid0 <= 0;
	        from_glob_controller_valid1 <= 0;
		from_glob_dest_addr_0 <= 8'bz;
		from_glob_controller_delay_0 <= 10'bz;
           #0.1 init <= 0;
	        from_glob_controller_valid0 <= 0;
	   #(5*T_clk)
	   #(3*T_clk + 0.2) input_boundary_flag <= 0;    //should be exactly at a positive clock edge
             #(2*T_clk) input_boundary_flag <= 0;

	   #(50*T_clk) from_glob_prefetch_valid0 <= 1;
		from_glob_prefetch_start_0 <= 10'h36;
		from_glob_prefetch_stop_0 <= 10'h50;
		from_glob_prefetch_dest_0 <= 8'b01101111;

	   #(51*T_clk) from_glob_prefetch_valid0 <= 0;
		from_glob_prefetch_start_0 <= 10'hz;
		from_glob_prefetch_stop_0 <= 10'hz;
		from_glob_prefetch_dest_0 <= 8'bz;



				 
        

    end

    always #(0.5*T_clk) CLK <= ~CLK;
    always #(T_clk) begin
    	if (write_flag == 1) begin
		D_0 <= D_0 + 1;
		ext_sample_address <= ext_sample_address + 1;
	end
		
    end


 
    local_controller_prefetch_full DUT0(.CLK(CLK), .reset(reset), .init(init),  .from_glob_controller_delay(from_glob_controller_delay_0),  .input_boundary_flag(input_boundary_flag), .prev_dest_address(prev_dest_address), .from_glob_dest_addr(from_glob_dest_addr_0), .packet_out(packet_out_0), .boundary_next(boundary_next_0), .dest_address(dest_address_0), .from_glob_controller_valid(from_glob_controller_valid0), .ext_CEB(ext_CEB), .WEB(WEB), .WEBM(WEBM), .D(D_0), .BWEB(BWEB_0), .DM(DM_0), .BWEBM(BWEBM_0), .ext_sample_address(ext_sample_address), .ext_sample_address_M(ext_sample_address_M),.write_flag(write_flag), .from_glob_prefetch_valid(from_glob_prefetch_valid0), .from_glob_prefetch_start(from_glob_prefetch_start_0), .from_glob_prefetch_stop(from_glob_prefetch_stop_0), .from_glob_prefetch_dest(from_glob_prefetch_dest_0), .prefetch_packet_out(prefetch_packet_out_0));
    
endmodule
