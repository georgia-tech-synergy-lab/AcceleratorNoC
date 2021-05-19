`timescale 1ns / 1ps

//`include "/home/green1/DKIT/tsmc_muse/IP/TSMC28_STD_CELLS/unzipped/tcbn28hpcplusbwp30p140_190a/tcbn28hpcplusbwp30p140_110a_vlg/TSMCHOME/digital/Front_End/verilog/tcbn28hpcplusbwp30p140_110a/tcbn28hpcplusbwp30p140.v"

`include "/home/green1/DKIT/tsmc_muse/IP/TSMC28_STD_CELLS/unzipped/tcbn28hpcplusbwp30p140lvt_190a/tcbn28hpcplusbwp30p140lvt_110a_vlg/TSMCHOME/digital/Front_End/verilog/tcbn28hpcplusbwp30p140lvt_110a/tcbn28hpcplusbwp30p140lvt.v"

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

module tb_controller_integrated;

    // parameter
    	parameter N_sample = 256;
	parameter datawidth = 16;
	parameter address_vector_width = 4; //can be 200 or 8: 8 for small tapeout
	parameter N_obj = 4; //can be 200 or 8: 8 for small tapeout
	parameter id_width = 4; // 16 local controllers in subscaled system
	parameter sample_address_width = 8; /// assuming 256 words: needs to change if arrangement is different
	parameter packet_width = 2 + 2*datawidth + address_vector_width;
	parameter delay_length = 12; // log(id_width*N_sample)
	parameter obj_id_width = 2; // log(N_obj)
	parameter tapping_loc_packet_width = sample_address_width + obj_id_width; // log(N_obj)
	parameter scen_len_width = 11;   //needs to be revised
	parameter T_clk = 0.6;//0.52;   //needs to be revised
    
    	reg CLK;
    	reg reset;
    	reg boot_up;
    	reg start;
	reg table_parse;
	reg input_valid;
	reg glob_scen_noc_input_valid;


	reg from_glob_prefetch_valid0;
	reg from_glob_prefetch_valid1;
	reg from_glob_prefetch_valid2;
	reg from_glob_prefetch_valid3;
	reg from_glob_prefetch_valid4;
	reg from_glob_prefetch_valid5;
	reg from_glob_prefetch_valid6;
	reg from_glob_prefetch_valid7;
	reg from_glob_prefetch_valid8;
	reg from_glob_prefetch_valid9;
	reg from_glob_prefetch_valid10;
	reg from_glob_prefetch_valid11;
	reg from_glob_prefetch_valid12;
	reg from_glob_prefetch_valid13;
	reg from_glob_prefetch_valid14;
	reg from_glob_prefetch_valid15;

	reg from_glob_prefetch_enable0;
	reg from_glob_prefetch_enable1;
	reg from_glob_prefetch_enable2;
	reg from_glob_prefetch_enable3;
	reg from_glob_prefetch_enable4;
	reg from_glob_prefetch_enable5;
	reg from_glob_prefetch_enable6;
	reg from_glob_prefetch_enable7;
	reg from_glob_prefetch_enable8;
	reg from_glob_prefetch_enable9;
	reg from_glob_prefetch_enable10;
	reg from_glob_prefetch_enable11;
	reg from_glob_prefetch_enable12;
	reg from_glob_prefetch_enable13;
	reg from_glob_prefetch_enable14;
	reg from_glob_prefetch_enable15;



	reg [sample_address_width - 1:0] from_glob_prefetch_start_0;
	reg [sample_address_width - 1:0] from_glob_prefetch_start_1;
	reg [sample_address_width - 1:0] from_glob_prefetch_start_2;
	reg [sample_address_width - 1:0] from_glob_prefetch_start_3;
	reg [sample_address_width - 1:0] from_glob_prefetch_start_4;
	reg [sample_address_width - 1:0] from_glob_prefetch_start_5;
	reg [sample_address_width - 1:0] from_glob_prefetch_start_6;
	reg [sample_address_width - 1:0] from_glob_prefetch_start_7;
	reg [sample_address_width - 1:0] from_glob_prefetch_start_8;
	reg [sample_address_width - 1:0] from_glob_prefetch_start_9;
	reg [sample_address_width - 1:0] from_glob_prefetch_start_10;
	reg [sample_address_width - 1:0] from_glob_prefetch_start_11;
	reg [sample_address_width - 1:0] from_glob_prefetch_start_12;
	reg [sample_address_width - 1:0] from_glob_prefetch_start_13;
	reg [sample_address_width - 1:0] from_glob_prefetch_start_14;
	reg [sample_address_width - 1:0] from_glob_prefetch_start_15;


	reg [sample_address_width - 1:0] from_glob_prefetch_stop_0;
	reg [sample_address_width - 1:0] from_glob_prefetch_stop_1;
	reg [sample_address_width - 1:0] from_glob_prefetch_stop_2;
	reg [sample_address_width - 1:0] from_glob_prefetch_stop_3;
	reg [sample_address_width - 1:0] from_glob_prefetch_stop_4;
	reg [sample_address_width - 1:0] from_glob_prefetch_stop_5;
	reg [sample_address_width - 1:0] from_glob_prefetch_stop_6;
	reg [sample_address_width - 1:0] from_glob_prefetch_stop_7;
	reg [sample_address_width - 1:0] from_glob_prefetch_stop_8;
	reg [sample_address_width - 1:0] from_glob_prefetch_stop_9;
	reg [sample_address_width - 1:0] from_glob_prefetch_stop_10;
	reg [sample_address_width - 1:0] from_glob_prefetch_stop_11;
	reg [sample_address_width - 1:0] from_glob_prefetch_stop_12;
	reg [sample_address_width - 1:0] from_glob_prefetch_stop_13;
	reg [sample_address_width - 1:0] from_glob_prefetch_stop_14;
	reg [sample_address_width - 1:0] from_glob_prefetch_stop_15;


	reg [address_vector_width - 1:0] from_glob_prefetch_dest_0;
	reg [address_vector_width - 1:0] from_glob_prefetch_dest_1;
	reg [address_vector_width - 1:0] from_glob_prefetch_dest_2;
	reg [address_vector_width - 1:0] from_glob_prefetch_dest_3;
	reg [address_vector_width - 1:0] from_glob_prefetch_dest_4;
	reg [address_vector_width - 1:0] from_glob_prefetch_dest_5;
	reg [address_vector_width - 1:0] from_glob_prefetch_dest_6;
	reg [address_vector_width - 1:0] from_glob_prefetch_dest_7;
	reg [address_vector_width - 1:0] from_glob_prefetch_dest_8;
	reg [address_vector_width - 1:0] from_glob_prefetch_dest_9;
	reg [address_vector_width - 1:0] from_glob_prefetch_dest_10;
	reg [address_vector_width - 1:0] from_glob_prefetch_dest_11;
	reg [address_vector_width - 1:0] from_glob_prefetch_dest_12;
	reg [address_vector_width - 1:0] from_glob_prefetch_dest_13;
	reg [address_vector_width - 1:0] from_glob_prefetch_dest_14;
	reg [address_vector_width - 1:0] from_glob_prefetch_dest_15;


	reg [2*datawidth - 1:0] D;

	//reg scenario_update;
	
	wire [packet_width - 1:0] packet_out_0;
	wire [packet_width - 1:0] packet_out_1;
	wire [packet_width - 1:0] packet_out_2;
	wire [packet_width - 1:0] packet_out_3;
	wire [packet_width - 1:0] packet_out_4;
	wire [packet_width - 1:0] packet_out_5;
	wire [packet_width - 1:0] packet_out_6;
	wire [packet_width - 1:0] packet_out_7;
	wire [packet_width - 1:0] packet_out_8;
	wire [packet_width - 1:0] packet_out_9;
	wire [packet_width - 1:0] packet_out_10;
	wire [packet_width - 1:0] packet_out_11;
	wire [packet_width - 1:0] packet_out_12;
	wire [packet_width - 1:0] packet_out_13;
	wire [packet_width - 1:0] packet_out_14;
	wire [packet_width - 1:0] packet_out_15;


	reg write_start;	
	reg dummy_start;	

	reg [delay_length - 1:0] delay_matrix_element;
	reg [obj_id_width - 1:0] obj_id_element;
	wire [sample_address_width - 1:0] from_glob_prefetch_start;
	wire [address_vector_width - 1:0] from_glob_prefetch_dest;
	wire [id_width - 1:0] local_controller_id;
	wire [tapping_loc_packet_width - 1:0] tapping_loc_packet;
	wire [sample_address_width - 1:0] from_glob_prefetch_stop;
	reg [delay_length - 1:0] hardware_latency1;   ///keep as config to be input through spi?
	reg [delay_length - 1:0] hardware_latency2;
	reg [scen_len_width - 1:0] scenario_len;

	wire [scen_len_width - 1:0] scenario_counter;

	wire scenario_update_global; 
	wire valid_bit;
	wire prefetch_enable;
	reg boot_up_local;
	reg boot_up_table_update;

	wire [address_vector_width - 1:0] prefetch_bypass_dest_addr_int;
	wire [sample_address_width - 1:0] prefetch_bypass_cycles;
	wire [delay_length - 1:0] prefetch_bypass_start_addr;
	wire [2*datawidth - 1:0] prefetch_bypass_path_input_data;
	wire [address_vector_width - 1:0] prefetch_bypass_path_input_addr;
	wire prefetch_bypass_valid;
	wire tapping_loc_valid;


    initial begin
        	CLK <= 0;
        	reset <= 0;
        	boot_up <= 0;
        	dummy_start <= 0;
		D <= 32'h00fffffe; //adjust based on when operation starts for address = data pattern
		write_start <= 0;
		input_valid <= 0;
		table_parse <= 0;
		hardware_latency1 <= 0;
		hardware_latency2 <= 0;
		scenario_len <= 11'h7f0;
		glob_scen_noc_input_valid <= 0;
		boot_up_local <= 0;
		boot_up_table_update <= 0;

		from_glob_prefetch_valid0 <= 0;
		from_glob_prefetch_valid1 <= 0;
		from_glob_prefetch_valid2 <= 0;
		from_glob_prefetch_valid3 <= 0;
		from_glob_prefetch_valid4 <= 0;
		from_glob_prefetch_valid5 <= 0;
		from_glob_prefetch_valid6 <= 0;
		from_glob_prefetch_valid7 <= 0;
		from_glob_prefetch_valid8 <= 0;
		from_glob_prefetch_valid9 <= 0;
		from_glob_prefetch_valid10 <= 0;
		from_glob_prefetch_valid11 <= 0;
		from_glob_prefetch_valid12 <= 0;
		from_glob_prefetch_valid13 <= 0;
		from_glob_prefetch_valid14 <= 0;
		from_glob_prefetch_valid15 <= 0;

		from_glob_prefetch_enable0 <= 0;
		from_glob_prefetch_enable1 <= 0;
		from_glob_prefetch_enable2 <= 0;
		from_glob_prefetch_enable3 <= 0;
		from_glob_prefetch_enable4 <= 0;
		from_glob_prefetch_enable5 <= 0;
		from_glob_prefetch_enable6 <= 0;
		from_glob_prefetch_enable7 <= 0;
		from_glob_prefetch_enable8 <= 0;
		from_glob_prefetch_enable9 <= 0;
		from_glob_prefetch_enable10 <= 0;
		from_glob_prefetch_enable11 <= 0;
		from_glob_prefetch_enable12 <= 0;
		from_glob_prefetch_enable13 <= 0;
		from_glob_prefetch_enable14 <= 0;
		from_glob_prefetch_enable15 <= 0;



		from_glob_prefetch_start_0 <= 8'bz;
		from_glob_prefetch_start_1 <= 8'bz;
		from_glob_prefetch_start_2 <= 8'bz;
		from_glob_prefetch_start_3 <= 8'bz;
		from_glob_prefetch_start_4 <= 8'bz;
		from_glob_prefetch_start_5 <= 8'bz;
		from_glob_prefetch_start_6 <= 8'bz;
		from_glob_prefetch_start_7 <= 8'bz;
		from_glob_prefetch_start_8 <= 8'bz;
		from_glob_prefetch_start_9 <= 8'bz;
		from_glob_prefetch_start_10 <= 8'bz;
		from_glob_prefetch_start_11 <= 8'bz;
		from_glob_prefetch_start_12 <= 8'bz;
		from_glob_prefetch_start_13 <= 8'bz;
		from_glob_prefetch_start_14 <= 8'bz;
		from_glob_prefetch_start_15 <= 8'bz;

		from_glob_prefetch_stop_0 <= 8'bz;
		from_glob_prefetch_stop_1 <= 8'bz;
		from_glob_prefetch_stop_2 <= 8'bz;
		from_glob_prefetch_stop_3 <= 8'bz;
		from_glob_prefetch_stop_4 <= 8'bz;
		from_glob_prefetch_stop_5 <= 8'bz;
		from_glob_prefetch_stop_6 <= 8'bz;
		from_glob_prefetch_stop_7 <= 8'bz;
		from_glob_prefetch_stop_8 <= 8'bz;
		from_glob_prefetch_stop_9 <= 8'bz;
		from_glob_prefetch_stop_10 <= 8'bz;
		from_glob_prefetch_stop_11 <= 8'bz;
		from_glob_prefetch_stop_12 <= 8'bz;
		from_glob_prefetch_stop_13 <= 8'bz;
		from_glob_prefetch_stop_14 <= 8'bz;
		from_glob_prefetch_stop_15 <= 8'bz;

		from_glob_prefetch_dest_0 <= 4'bz;
		from_glob_prefetch_dest_1 <= 4'bz;
		from_glob_prefetch_dest_2 <= 4'bz;
		from_glob_prefetch_dest_3 <= 4'bz;
		from_glob_prefetch_dest_4 <= 4'bz;
		from_glob_prefetch_dest_5 <= 4'bz;
		from_glob_prefetch_dest_6 <= 4'bz;
		from_glob_prefetch_dest_7 <= 4'bz;
		from_glob_prefetch_dest_8 <= 4'bz;
		from_glob_prefetch_dest_9 <= 4'bz;
		from_glob_prefetch_dest_10 <= 4'bz;
		from_glob_prefetch_dest_11 <= 4'bz;
		from_glob_prefetch_dest_12 <= 4'bz;
		from_glob_prefetch_dest_13 <= 4'bz;
		from_glob_prefetch_dest_14 <= 4'bz;
		from_glob_prefetch_dest_15 <= 4'bz;


		delay_matrix_element <= 0;
		obj_id_element <= 0;

           #(T_clk + 0.2*T_clk) reset <= 1;
	   #(3*T_clk) reset <= 0;
	   #(0.8*T_clk);
////////////////////////////// initial boot up phase /////////////////
	   #(5*T_clk) boot_up <= 1;
	   #(T_clk) input_valid <= 1;
		delay_matrix_element <= 26;  ///1096 after subtraction  //address 830
		obj_id_element <= 1;
	   #(T_clk) input_valid <= 0;

	   #(T_clk) input_valid <= 1;
		delay_matrix_element <= 3000;  ///896 after subtraction  //
		obj_id_element <= 0;
	   #(T_clk) input_valid <= 0;


	   #(4*T_clk) boot_up <= 0;


	   #(7*T_clk) table_parse <= 1;
		      boot_up_local <= 1;


	   #(6*T_clk) //glob_scen_noc_input_valid <= 1;
		//delay_matrix_element <= 510;      ///3586 after subtraction
		//obj_id_element <= 0;
	   #(T_clk) //glob_scen_noc_input_valid <= 0;

	   #(20*T_clk)
	   #(T_clk)

	   #(10*T_clk) boot_up_local <= 0;


	   #(5*T_clk) glob_scen_noc_input_valid <= 1;
		delay_matrix_element <= 26;   ///3695 after subtraction 
		obj_id_element <= 1;
	   #(T_clk) glob_scen_noc_input_valid <= 0;

	   #(T_clk) glob_scen_noc_input_valid <= 1;
		delay_matrix_element <= 3000;   /// 
		obj_id_element <= 0;
	   #(T_clk) glob_scen_noc_input_valid <= 0;


	   #(4*T_clk) boot_up_table_update <= 1;
	   #(T_clk) boot_up_table_update <= 0;

	   #(85*T_clk)




	   #(2*T_clk )   write_start <= 1; 
			  dummy_start <= 1;
	   #(T_clk)
			  dummy_start <= 0;

	   #(5*T_clk) glob_scen_noc_input_valid <= 1;
		delay_matrix_element <= 26;   
		obj_id_element <= 1;
	   #(T_clk) glob_scen_noc_input_valid <= 0;

	   #(T_clk) glob_scen_noc_input_valid <= 1;
		delay_matrix_element <= 3000;  
		obj_id_element <= 0;
	   #(T_clk) glob_scen_noc_input_valid <= 0;






	   #(2049*T_clk) glob_scen_noc_input_valid <= 1;
		delay_matrix_element <= 26;   
		obj_id_element <= 1;
	   #(T_clk) glob_scen_noc_input_valid <= 0;


				 
        

    end

    always #(0.5*T_clk) CLK <= ~CLK;
    always @(posedge CLK) begin
	if (write_start) begin
		D <= D + 1;
	end
		
    end

    always @(posedge CLK) begin
	if (dummy_start) begin
		start <= 1;
	end
	else start <= 0;
		
    end


 ///////////////////////// arrangement for local scenario NoC emulation //////
 	always @(posedge CLK) begin
		if (reset) begin
			from_glob_prefetch_valid0 <= 0;
			from_glob_prefetch_valid1 <= 0;
			from_glob_prefetch_valid2 <= 0;
			from_glob_prefetch_valid3 <= 0;
			from_glob_prefetch_valid4 <= 0;
			from_glob_prefetch_valid5 <= 0;
			from_glob_prefetch_valid6 <= 0;
			from_glob_prefetch_valid7 <= 0;
			from_glob_prefetch_valid8 <= 0;
			from_glob_prefetch_valid9 <= 0;
			from_glob_prefetch_valid10 <= 0;
			from_glob_prefetch_valid11 <= 0;
			from_glob_prefetch_valid12 <= 0;
			from_glob_prefetch_valid13 <= 0;
			from_glob_prefetch_valid14 <= 0;
			from_glob_prefetch_valid15 <= 0;
		end
		else if (local_controller_id == 4'h0 && valid_bit == 1) begin
			from_glob_prefetch_valid0 <= 1;
			from_glob_prefetch_valid1 <= 0;
			from_glob_prefetch_valid2 <= 0;
			from_glob_prefetch_valid3 <= 0;
			from_glob_prefetch_valid4 <= 0;
			from_glob_prefetch_valid5 <= 0;
			from_glob_prefetch_valid6 <= 0;
			from_glob_prefetch_valid7 <= 0;
			from_glob_prefetch_valid8 <= 0;
			from_glob_prefetch_valid9 <= 0;
			from_glob_prefetch_valid10 <= 0;
			from_glob_prefetch_valid11 <= 0;
			from_glob_prefetch_valid12 <= 0;
			from_glob_prefetch_valid13 <= 0;
			from_glob_prefetch_valid14 <= 0;
			from_glob_prefetch_valid15 <= 0;
			
			from_glob_prefetch_start_0 <= from_glob_prefetch_start;
			from_glob_prefetch_stop_0 <= from_glob_prefetch_stop;
			from_glob_prefetch_dest_0 <= from_glob_prefetch_dest;
			from_glob_prefetch_enable0 <= prefetch_enable;

		end
		else if (local_controller_id == 4'h1 && valid_bit == 1) begin
			from_glob_prefetch_valid0 <= 0;
			from_glob_prefetch_valid1 <= 1;
			from_glob_prefetch_valid2 <= 0;
			from_glob_prefetch_valid3 <= 0;
			from_glob_prefetch_valid4 <= 0;
			from_glob_prefetch_valid5 <= 0;
			from_glob_prefetch_valid6 <= 0;
			from_glob_prefetch_valid7 <= 0;
			from_glob_prefetch_valid8 <= 0;
			from_glob_prefetch_valid9 <= 0;
			from_glob_prefetch_valid10 <= 0;
			from_glob_prefetch_valid11 <= 0;
			from_glob_prefetch_valid12 <= 0;
			from_glob_prefetch_valid13 <= 0;
			from_glob_prefetch_valid14 <= 0;
			from_glob_prefetch_valid15 <= 0;

			from_glob_prefetch_start_1 <= from_glob_prefetch_start;
			from_glob_prefetch_stop_1 <= from_glob_prefetch_stop;
			from_glob_prefetch_dest_1 <= from_glob_prefetch_dest;
			from_glob_prefetch_enable1 <= prefetch_enable;


		end
		else if (local_controller_id == 4'h2  && valid_bit == 1) begin
			from_glob_prefetch_valid0 <= 0;
			from_glob_prefetch_valid1 <= 0;
			from_glob_prefetch_valid2 <= 1;
			from_glob_prefetch_valid3 <= 0;
			from_glob_prefetch_valid4 <= 0;
			from_glob_prefetch_valid5 <= 0;
			from_glob_prefetch_valid6 <= 0;
			from_glob_prefetch_valid7 <= 0;
			from_glob_prefetch_valid8 <= 0;
			from_glob_prefetch_valid9 <= 0;
			from_glob_prefetch_valid10 <= 0;
			from_glob_prefetch_valid11 <= 0;
			from_glob_prefetch_valid12 <= 0;
			from_glob_prefetch_valid13 <= 0;
			from_glob_prefetch_valid14 <= 0;
			from_glob_prefetch_valid15 <= 0;

			from_glob_prefetch_start_2 <= from_glob_prefetch_start;
			from_glob_prefetch_stop_2 <= from_glob_prefetch_stop;
			from_glob_prefetch_dest_2 <= from_glob_prefetch_dest;
			from_glob_prefetch_enable2 <= prefetch_enable;


		end
		else if (local_controller_id == 4'h3  && valid_bit == 1) begin
			from_glob_prefetch_valid0 <= 0;
			from_glob_prefetch_valid1 <= 0;
			from_glob_prefetch_valid2 <= 0;
			from_glob_prefetch_valid3 <= 1;
			from_glob_prefetch_valid4 <= 0;
			from_glob_prefetch_valid5 <= 0;
			from_glob_prefetch_valid6 <= 0;
			from_glob_prefetch_valid7 <= 0;
			from_glob_prefetch_valid8 <= 0;
			from_glob_prefetch_valid9 <= 0;
			from_glob_prefetch_valid10 <= 0;
			from_glob_prefetch_valid11 <= 0;
			from_glob_prefetch_valid12 <= 0;
			from_glob_prefetch_valid13 <= 0;
			from_glob_prefetch_valid14 <= 0;
			from_glob_prefetch_valid15 <= 0;

			from_glob_prefetch_start_3 <= from_glob_prefetch_start;
			from_glob_prefetch_stop_3 <= from_glob_prefetch_stop;
			from_glob_prefetch_dest_3 <= from_glob_prefetch_dest;
			from_glob_prefetch_enable3 <= prefetch_enable;


		end

		else if (local_controller_id == 4'h4  && valid_bit == 1) begin
			from_glob_prefetch_valid0 <= 0;
			from_glob_prefetch_valid1 <= 0;
			from_glob_prefetch_valid2 <= 0;
			from_glob_prefetch_valid3 <= 0;
			from_glob_prefetch_valid4 <= 1;
			from_glob_prefetch_valid5 <= 0;
			from_glob_prefetch_valid6 <= 0;
			from_glob_prefetch_valid7 <= 0;
			from_glob_prefetch_valid8 <= 0;
			from_glob_prefetch_valid9 <= 0;
			from_glob_prefetch_valid10 <= 0;
			from_glob_prefetch_valid11 <= 0;
			from_glob_prefetch_valid12 <= 0;
			from_glob_prefetch_valid13 <= 0;
			from_glob_prefetch_valid14 <= 0;
			from_glob_prefetch_valid15 <= 0;
			
			from_glob_prefetch_start_4 <= from_glob_prefetch_start;
			from_glob_prefetch_stop_4 <= from_glob_prefetch_stop;
			from_glob_prefetch_dest_4 <= from_glob_prefetch_dest;
			from_glob_prefetch_enable4 <= prefetch_enable;

		end
		else if (local_controller_id == 4'h5  && valid_bit == 1) begin
			from_glob_prefetch_valid0 <= 0;
			from_glob_prefetch_valid1 <= 0;
			from_glob_prefetch_valid2 <= 0;
			from_glob_prefetch_valid3 <= 0;
			from_glob_prefetch_valid4 <= 0;
			from_glob_prefetch_valid5 <= 1;
			from_glob_prefetch_valid6 <= 0;
			from_glob_prefetch_valid7 <= 0;
			from_glob_prefetch_valid8 <= 0;
			from_glob_prefetch_valid9 <= 0;
			from_glob_prefetch_valid10 <= 0;
			from_glob_prefetch_valid11 <= 0;
			from_glob_prefetch_valid12 <= 0;
			from_glob_prefetch_valid13 <= 0;
			from_glob_prefetch_valid14 <= 0;
			from_glob_prefetch_valid15 <= 0;

			from_glob_prefetch_start_5 <= from_glob_prefetch_start;
			from_glob_prefetch_stop_5 <= from_glob_prefetch_stop;
			from_glob_prefetch_dest_5 <= from_glob_prefetch_dest;
			from_glob_prefetch_enable5 <= prefetch_enable;



		end
		else if (local_controller_id == 4'h6  && valid_bit == 1) begin
			from_glob_prefetch_valid0 <= 0;
			from_glob_prefetch_valid1 <= 0;
			from_glob_prefetch_valid2 <= 0;
			from_glob_prefetch_valid3 <= 0;
			from_glob_prefetch_valid4 <= 0;
			from_glob_prefetch_valid5 <= 0;
			from_glob_prefetch_valid6 <= 1;
			from_glob_prefetch_valid7 <= 0;
			from_glob_prefetch_valid8 <= 0;
			from_glob_prefetch_valid9 <= 0;
			from_glob_prefetch_valid10 <= 0;
			from_glob_prefetch_valid11 <= 0;
			from_glob_prefetch_valid12 <= 0;
			from_glob_prefetch_valid13 <= 0;
			from_glob_prefetch_valid14 <= 0;
			from_glob_prefetch_valid15 <= 0;

			from_glob_prefetch_start_6 <= from_glob_prefetch_start;
			from_glob_prefetch_stop_6 <= from_glob_prefetch_stop;
			from_glob_prefetch_dest_6 <= from_glob_prefetch_dest;
			from_glob_prefetch_enable6 <= prefetch_enable;


		end
		else if (local_controller_id == 4'h7  && valid_bit == 1) begin
			from_glob_prefetch_valid0 <= 0;
			from_glob_prefetch_valid1 <= 0;
			from_glob_prefetch_valid2 <= 0;
			from_glob_prefetch_valid3 <= 0;
			from_glob_prefetch_valid4 <= 0;
			from_glob_prefetch_valid5 <= 0;
			from_glob_prefetch_valid6 <= 0;
			from_glob_prefetch_valid7 <= 1;
			from_glob_prefetch_valid8 <= 0;
			from_glob_prefetch_valid9 <= 0;
			from_glob_prefetch_valid10 <= 0;
			from_glob_prefetch_valid11 <= 0;
			from_glob_prefetch_valid12 <= 0;
			from_glob_prefetch_valid13 <= 0;
			from_glob_prefetch_valid14 <= 0;
			from_glob_prefetch_valid15 <= 0;

			from_glob_prefetch_start_7 <= from_glob_prefetch_start;
			from_glob_prefetch_stop_7 <= from_glob_prefetch_stop;
			from_glob_prefetch_dest_7 <= from_glob_prefetch_dest;
			from_glob_prefetch_enable7 <= prefetch_enable;


		end

		else if (local_controller_id == 4'h8  && valid_bit == 1) begin
			from_glob_prefetch_valid0 <= 0;
			from_glob_prefetch_valid1 <= 0;
			from_glob_prefetch_valid2 <= 0;
			from_glob_prefetch_valid3 <= 0;
			from_glob_prefetch_valid4 <= 0;
			from_glob_prefetch_valid5 <= 0;
			from_glob_prefetch_valid6 <= 0;
			from_glob_prefetch_valid7 <= 0;
			from_glob_prefetch_valid8 <= 1;
			from_glob_prefetch_valid9 <= 0;
			from_glob_prefetch_valid10 <= 0;
			from_glob_prefetch_valid11 <= 0;
			from_glob_prefetch_valid12 <= 0;
			from_glob_prefetch_valid13 <= 0;
			from_glob_prefetch_valid14 <= 0;
			from_glob_prefetch_valid15 <= 0;
			
			from_glob_prefetch_start_8 <= from_glob_prefetch_start;
			from_glob_prefetch_stop_8 <= from_glob_prefetch_stop;
			from_glob_prefetch_dest_8 <= from_glob_prefetch_dest;
			from_glob_prefetch_enable8 <= prefetch_enable;

		end
		else if (local_controller_id == 4'h9  && valid_bit == 1) begin
			from_glob_prefetch_valid0 <= 0;
			from_glob_prefetch_valid1 <= 0;
			from_glob_prefetch_valid2 <= 0;
			from_glob_prefetch_valid3 <= 0;
			from_glob_prefetch_valid4 <= 0;
			from_glob_prefetch_valid5 <= 0;
			from_glob_prefetch_valid6 <= 0;
			from_glob_prefetch_valid7 <= 0;
			from_glob_prefetch_valid8 <= 0;
			from_glob_prefetch_valid9 <= 1;
			from_glob_prefetch_valid10 <= 0;
			from_glob_prefetch_valid11 <= 0;
			from_glob_prefetch_valid12 <= 0;
			from_glob_prefetch_valid13 <= 0;
			from_glob_prefetch_valid14 <= 0;
			from_glob_prefetch_valid15 <= 0;

			from_glob_prefetch_start_9 <= from_glob_prefetch_start;
			from_glob_prefetch_stop_9 <= from_glob_prefetch_stop;
			from_glob_prefetch_dest_9 <= from_glob_prefetch_dest;
			from_glob_prefetch_enable9 <= prefetch_enable;



		end
		else if (local_controller_id == 4'ha  && valid_bit == 1) begin
			from_glob_prefetch_valid0 <= 0;
			from_glob_prefetch_valid1 <= 0;
			from_glob_prefetch_valid2 <= 0;
			from_glob_prefetch_valid3 <= 0;
			from_glob_prefetch_valid4 <= 0;
			from_glob_prefetch_valid5 <= 0;
			from_glob_prefetch_valid6 <= 0;
			from_glob_prefetch_valid7 <= 0;
			from_glob_prefetch_valid8 <= 0;
			from_glob_prefetch_valid9 <= 0;
			from_glob_prefetch_valid10 <= 1;
			from_glob_prefetch_valid11 <= 0;
			from_glob_prefetch_valid12 <= 0;
			from_glob_prefetch_valid13 <= 0;
			from_glob_prefetch_valid14 <= 0;
			from_glob_prefetch_valid15 <= 0;

			from_glob_prefetch_start_10 <= from_glob_prefetch_start;
			from_glob_prefetch_stop_10 <= from_glob_prefetch_stop;
			from_glob_prefetch_dest_10 <= from_glob_prefetch_dest;
			from_glob_prefetch_enable10 <= prefetch_enable;


		end
		else if (local_controller_id == 4'hb  && valid_bit == 1) begin
			from_glob_prefetch_valid0 <= 0;
			from_glob_prefetch_valid1 <= 0;
			from_glob_prefetch_valid2 <= 0;
			from_glob_prefetch_valid3 <= 0;
			from_glob_prefetch_valid4 <= 0;
			from_glob_prefetch_valid5 <= 0;
			from_glob_prefetch_valid6 <= 0;
			from_glob_prefetch_valid7 <= 0;
			from_glob_prefetch_valid8 <= 0;
			from_glob_prefetch_valid9 <= 0;
			from_glob_prefetch_valid10 <= 0;
			from_glob_prefetch_valid11 <= 1;
			from_glob_prefetch_valid12 <= 0;
			from_glob_prefetch_valid13 <= 0;
			from_glob_prefetch_valid14 <= 0;
			from_glob_prefetch_valid15 <= 0;

			from_glob_prefetch_start_11 <= from_glob_prefetch_start;
			from_glob_prefetch_stop_11 <= from_glob_prefetch_stop;
			from_glob_prefetch_dest_11 <= from_glob_prefetch_dest;
			from_glob_prefetch_enable11 <= prefetch_enable;


		end

		else if (local_controller_id == 4'hc  && valid_bit == 1) begin
			from_glob_prefetch_valid0 <= 0;
			from_glob_prefetch_valid1 <= 0;
			from_glob_prefetch_valid2 <= 0;
			from_glob_prefetch_valid3 <= 0;
			from_glob_prefetch_valid4 <= 0;
			from_glob_prefetch_valid5 <= 0;
			from_glob_prefetch_valid6 <= 0;
			from_glob_prefetch_valid7 <= 0;
			from_glob_prefetch_valid8 <= 0;
			from_glob_prefetch_valid9 <= 0;
			from_glob_prefetch_valid10 <= 0;
			from_glob_prefetch_valid11 <= 0;
			from_glob_prefetch_valid12 <= 1;
			from_glob_prefetch_valid13 <= 0;
			from_glob_prefetch_valid14 <= 0;
			from_glob_prefetch_valid15 <= 0;
			
			from_glob_prefetch_start_12 <= from_glob_prefetch_start;
			from_glob_prefetch_stop_12 <= from_glob_prefetch_stop;
			from_glob_prefetch_dest_12 <= from_glob_prefetch_dest;
			from_glob_prefetch_enable12 <= prefetch_enable;

		end
		else if (local_controller_id == 4'hd  && valid_bit == 1) begin
			from_glob_prefetch_valid0 <= 0;
			from_glob_prefetch_valid1 <= 0;
			from_glob_prefetch_valid2 <= 0;
			from_glob_prefetch_valid3 <= 0;
			from_glob_prefetch_valid4 <= 0;
			from_glob_prefetch_valid5 <= 0;
			from_glob_prefetch_valid6 <= 0;
			from_glob_prefetch_valid7 <= 0;
			from_glob_prefetch_valid8 <= 0;
			from_glob_prefetch_valid9 <= 0;
			from_glob_prefetch_valid10 <= 0;
			from_glob_prefetch_valid11 <= 0;
			from_glob_prefetch_valid12 <= 0;
			from_glob_prefetch_valid13 <= 1;
			from_glob_prefetch_valid14 <= 0;
			from_glob_prefetch_valid15 <= 0;

			from_glob_prefetch_start_13 <= from_glob_prefetch_start;
			from_glob_prefetch_stop_13 <= from_glob_prefetch_stop;
			from_glob_prefetch_dest_13 <= from_glob_prefetch_dest;
			from_glob_prefetch_enable13 <= prefetch_enable;



		end
		else if (local_controller_id == 4'he  && valid_bit == 1) begin
			from_glob_prefetch_valid0 <= 0;
			from_glob_prefetch_valid1 <= 0;
			from_glob_prefetch_valid2 <= 0;
			from_glob_prefetch_valid3 <= 0;
			from_glob_prefetch_valid4 <= 0;
			from_glob_prefetch_valid5 <= 0;
			from_glob_prefetch_valid6 <= 0;
			from_glob_prefetch_valid7 <= 0;
			from_glob_prefetch_valid8 <= 0;
			from_glob_prefetch_valid9 <= 0;
			from_glob_prefetch_valid10 <= 0;
			from_glob_prefetch_valid11 <= 0;
			from_glob_prefetch_valid12 <= 0;
			from_glob_prefetch_valid13 <= 0;
			from_glob_prefetch_valid14 <= 1;
			from_glob_prefetch_valid15 <= 0;

			from_glob_prefetch_start_14 <= from_glob_prefetch_start;
			from_glob_prefetch_stop_14 <= from_glob_prefetch_stop;
			from_glob_prefetch_dest_14 <= from_glob_prefetch_dest;
			from_glob_prefetch_enable14 <= prefetch_enable;


		end
		else if (local_controller_id == 4'hf  && valid_bit == 1) begin
			from_glob_prefetch_valid0 <= 0;
			from_glob_prefetch_valid1 <= 0;
			from_glob_prefetch_valid2 <= 0;
			from_glob_prefetch_valid3 <= 0;
			from_glob_prefetch_valid4 <= 0;
			from_glob_prefetch_valid5 <= 0;
			from_glob_prefetch_valid6 <= 0;
			from_glob_prefetch_valid7 <= 0;
			from_glob_prefetch_valid8 <= 0;
			from_glob_prefetch_valid9 <= 0;
			from_glob_prefetch_valid10 <= 0;
			from_glob_prefetch_valid11 <= 0;
			from_glob_prefetch_valid12 <= 0;
			from_glob_prefetch_valid13 <= 0;
			from_glob_prefetch_valid14 <= 0;
			from_glob_prefetch_valid15 <= 1;

			from_glob_prefetch_start_15 <= from_glob_prefetch_start;
			from_glob_prefetch_stop_15 <= from_glob_prefetch_stop;
			from_glob_prefetch_dest_15 <= from_glob_prefetch_dest;
			from_glob_prefetch_enable15 <= prefetch_enable;


		end
		else begin
			from_glob_prefetch_valid0 <= 0;
			from_glob_prefetch_valid1 <= 0;
			from_glob_prefetch_valid2 <= 0;
			from_glob_prefetch_valid3 <= 0;
			from_glob_prefetch_valid4 <= 0;
			from_glob_prefetch_valid5 <= 0;
			from_glob_prefetch_valid6 <= 0;
			from_glob_prefetch_valid7 <= 0;
			from_glob_prefetch_valid8 <= 0;
			from_glob_prefetch_valid9 <= 0;
			from_glob_prefetch_valid10 <= 0;
			from_glob_prefetch_valid11 <= 0;
			from_glob_prefetch_valid12 <= 0;
			from_glob_prefetch_valid13 <= 0;
			from_glob_prefetch_valid14 <= 0;
			from_glob_prefetch_valid15 <= 0;


		from_glob_prefetch_enable0 <= 0;
		from_glob_prefetch_enable1 <= 0;
		from_glob_prefetch_enable2 <= 0;
		from_glob_prefetch_enable3 <= 0;
		from_glob_prefetch_enable4 <= 0;
		from_glob_prefetch_enable5 <= 0;
		from_glob_prefetch_enable6 <= 0;
		from_glob_prefetch_enable7 <= 0;
		from_glob_prefetch_enable8 <= 0;
		from_glob_prefetch_enable9 <= 0;
		from_glob_prefetch_enable10 <= 0;
		from_glob_prefetch_enable11 <= 0;
		from_glob_prefetch_enable12 <= 0;
		from_glob_prefetch_enable13 <= 0;
		from_glob_prefetch_enable14 <= 0;
		from_glob_prefetch_enable15 <= 0;



		end
	end










 
   //controller_integrated DUT(.CLK(CLK), .reset(reset), .boot_up(boot_up), .start(start), .table_parse(table_parse), .input_valid(input_valid), .glob_scen_noc_input_valid(glob_scen_noc_input_valid), .scenario_update(scenario_update), .data_in(D), .packet_out_0(packet_out_0), .packet_out_1(packet_out_1), .packet_out_2(packet_out_2), .packet_out_3(packet_out_3), .from_glob_prefetch_start_0(from_glob_prefetch_start_0), .from_glob_prefetch_start_1(from_glob_prefetch_start_1), .from_glob_prefetch_start_2(from_glob_prefetch_start_2), .from_glob_prefetch_start_3(from_glob_prefetch_start_3), .from_glob_prefetch_stop_0(from_glob_prefetch_stop_0), .from_glob_prefetch_stop_1(from_glob_prefetch_stop_1), .from_glob_prefetch_stop_2(from_glob_prefetch_stop_2), .from_glob_prefetch_stop_3(from_glob_prefetch_stop_3), .from_glob_prefetch_dest_0(from_glob_prefetch_dest_0), .from_glob_prefetch_dest_1(from_glob_prefetch_dest_1), .from_glob_prefetch_dest_2(from_glob_prefetch_dest_2), .from_glob_prefetch_dest_3(from_glob_prefetch_dest_3), .from_glob_prefetch_valid0(from_glob_prefetch_valid0), .from_glob_prefetch_valid1(from_glob_prefetch_valid1), .from_glob_prefetch_valid2(from_glob_prefetch_valid2), .from_glob_prefetch_valid3(from_glob_prefetch_valid3));

controller_integrated DUT(.CLK(CLK), .reset(reset), .boot_up(boot_up), .boot_up_local(boot_up_local), .boot_up_table_update(boot_up_table_update), .start(start), .table_parse(table_parse), .input_valid(input_valid), .glob_scen_noc_input_valid(glob_scen_noc_input_valid), .delay_matrix_element(delay_matrix_element), .obj_id_element(obj_id_element), .from_glob_prefetch_start(from_glob_prefetch_start),  .from_glob_prefetch_dest(from_glob_prefetch_dest),  .scenario_update(scenario_update_global), .local_controller_id(local_controller_id), .tapping_loc_packet(tapping_loc_packet), .from_glob_prefetch_stop(from_glob_prefetch_stop), .hardware_latency1(hardware_latency1), .hardware_latency2(hardware_latency2), .scenario_len(scenario_len), .prefetch_bypass_dest_addr_int(prefetch_bypass_dest_addr_int), .prefetch_bypass_cycles(prefetch_bypass_cycles), .prefetch_bypass_start_addr(prefetch_bypass_start_addr), .addr(), .data_in(D), .prefetch_bypass_path_input_data(prefetch_bypass_path_input_data), .prefetch_bypass_path_input_addr(prefetch_bypass_path_input_addr), .prefetch_bypass_valid(prefetch_bypass_valid),
 
	.packet_out_0(packet_out_0), .packet_out_1(packet_out_1), .packet_out_2(packet_out_2), .packet_out_3(packet_out_3),  .packet_out_4(packet_out_4), .packet_out_5(packet_out_5), .packet_out_6(packet_out_6), .packet_out_7(packet_out_7), .packet_out_8(packet_out_8), .packet_out_9(packet_out_9), .packet_out_10(packet_out_10), .packet_out_11(packet_out_11), .packet_out_12(packet_out_12), .packet_out_13(packet_out_13), .packet_out_14(packet_out_14), .packet_out_15(packet_out_15),

	.from_glob_prefetch_start_0(from_glob_prefetch_start_0), .from_glob_prefetch_start_1(from_glob_prefetch_start_1), .from_glob_prefetch_start_2(from_glob_prefetch_start_2), .from_glob_prefetch_start_3(from_glob_prefetch_start_3), .from_glob_prefetch_start_4(from_glob_prefetch_start_4), .from_glob_prefetch_start_5(from_glob_prefetch_start_5), .from_glob_prefetch_start_6(from_glob_prefetch_start_6), .from_glob_prefetch_start_7(from_glob_prefetch_start_7), .from_glob_prefetch_start_8(from_glob_prefetch_start_8), .from_glob_prefetch_start_9(from_glob_prefetch_start_9), .from_glob_prefetch_start_10(from_glob_prefetch_start_10), .from_glob_prefetch_start_11(from_glob_prefetch_start_11), .from_glob_prefetch_start_12(from_glob_prefetch_start_12), .from_glob_prefetch_start_13(from_glob_prefetch_start_13), .from_glob_prefetch_start_14(from_glob_prefetch_start_14), .from_glob_prefetch_start_15(from_glob_prefetch_start_15),

	.from_glob_prefetch_stop_0(from_glob_prefetch_stop_0), .from_glob_prefetch_stop_1(from_glob_prefetch_stop_1), .from_glob_prefetch_stop_2(from_glob_prefetch_stop_2), .from_glob_prefetch_stop_3(from_glob_prefetch_stop_3), .from_glob_prefetch_stop_4(from_glob_prefetch_stop_4), .from_glob_prefetch_stop_5(from_glob_prefetch_stop_5), .from_glob_prefetch_stop_6(from_glob_prefetch_stop_6), .from_glob_prefetch_stop_7(from_glob_prefetch_stop_7), .from_glob_prefetch_stop_8(from_glob_prefetch_stop_8), .from_glob_prefetch_stop_9(from_glob_prefetch_stop_9), .from_glob_prefetch_stop_10(from_glob_prefetch_stop_10), .from_glob_prefetch_stop_11(from_glob_prefetch_stop_11), .from_glob_prefetch_stop_12(from_glob_prefetch_stop_12), .from_glob_prefetch_stop_13(from_glob_prefetch_stop_13), .from_glob_prefetch_stop_14(from_glob_prefetch_stop_14), .from_glob_prefetch_stop_15(from_glob_prefetch_stop_15),

	.from_glob_prefetch_dest_0(from_glob_prefetch_dest_0), .from_glob_prefetch_dest_1(from_glob_prefetch_dest_1), .from_glob_prefetch_dest_2(from_glob_prefetch_dest_2), .from_glob_prefetch_dest_3(from_glob_prefetch_dest_3), .from_glob_prefetch_dest_4(from_glob_prefetch_dest_4), .from_glob_prefetch_dest_5(from_glob_prefetch_dest_5), .from_glob_prefetch_dest_6(from_glob_prefetch_dest_6), .from_glob_prefetch_dest_7(from_glob_prefetch_dest_7), .from_glob_prefetch_dest_8(from_glob_prefetch_dest_8), .from_glob_prefetch_dest_9(from_glob_prefetch_dest_9), .from_glob_prefetch_dest_10(from_glob_prefetch_dest_10), .from_glob_prefetch_dest_11(from_glob_prefetch_dest_11), .from_glob_prefetch_dest_12(from_glob_prefetch_dest_12), .from_glob_prefetch_dest_13(from_glob_prefetch_dest_13), .from_glob_prefetch_dest_14(from_glob_prefetch_dest_14), .from_glob_prefetch_dest_15(from_glob_prefetch_dest_15), 
 
	.from_glob_prefetch_valid0(from_glob_prefetch_valid0), .from_glob_prefetch_valid1(from_glob_prefetch_valid1), .from_glob_prefetch_valid2(from_glob_prefetch_valid2), .from_glob_prefetch_valid3(from_glob_prefetch_valid3), .from_glob_prefetch_valid4(from_glob_prefetch_valid4), .from_glob_prefetch_valid5(from_glob_prefetch_valid5), .from_glob_prefetch_valid6(from_glob_prefetch_valid6), .from_glob_prefetch_valid7(from_glob_prefetch_valid7), .from_glob_prefetch_valid8(from_glob_prefetch_valid8), .from_glob_prefetch_valid9(from_glob_prefetch_valid9), .from_glob_prefetch_valid10(from_glob_prefetch_valid10), .from_glob_prefetch_valid11(from_glob_prefetch_valid11), .from_glob_prefetch_valid12(from_glob_prefetch_valid12), .from_glob_prefetch_valid13(from_glob_prefetch_valid13), .from_glob_prefetch_valid14(from_glob_prefetch_valid14), .from_glob_prefetch_valid15(from_glob_prefetch_valid15),

	.from_glob_prefetch_enable0(from_glob_prefetch_enable0), .from_glob_prefetch_enable1(from_glob_prefetch_enable1), .from_glob_prefetch_enable2(from_glob_prefetch_enable2), .from_glob_prefetch_enable3(from_glob_prefetch_enable3), .from_glob_prefetch_enable4(from_glob_prefetch_enable4), .from_glob_prefetch_enable5(from_glob_prefetch_enable5), .from_glob_prefetch_enable6(from_glob_prefetch_enable6), .from_glob_prefetch_enable7(from_glob_prefetch_enable7), .from_glob_prefetch_enable8(from_glob_prefetch_enable8), .from_glob_prefetch_enable9(from_glob_prefetch_enable9), .from_glob_prefetch_enable10(from_glob_prefetch_enable10), .from_glob_prefetch_enable11(from_glob_prefetch_enable11), .from_glob_prefetch_enable12(from_glob_prefetch_enable12), .from_glob_prefetch_enable13(from_glob_prefetch_enable13), .from_glob_prefetch_enable14(from_glob_prefetch_enable14), .from_glob_prefetch_enable15(from_glob_prefetch_enable15),


	.scenario_counter(scenario_counter), .scenario_update_global(scenario_update_global), .valid_bit(valid_bit), .prefetch_enable(prefetch_enable), .tapping_loc_valid(tapping_loc_valid));

    
endmodule
