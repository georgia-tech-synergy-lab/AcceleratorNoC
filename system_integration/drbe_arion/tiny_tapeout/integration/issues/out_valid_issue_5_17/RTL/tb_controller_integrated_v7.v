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
    	parameter N_sample = 1024;
	parameter datawidth = 16;
	parameter address_vector_width =4; //can be 200 or 8: 8 for small tapeout
	parameter full_address_vector_width =8; //can be 200 or 8: 8 for small tapeout
	parameter N_obj = 4; //can be 200 or 8: 8 for small tapeout
	parameter id_width = 4; // 16 local controllers in subscaled system
	parameter sample_address_width = 10; /// assuming 256 words: needs to change if arrangement is different
	parameter packet_width = 2 + 2*datawidth + full_address_vector_width;
	parameter delay_length = 14; // log(id_width*N_sample)
	parameter obj_id_width = 2; // log(N_obj)
	parameter tapping_loc_packet_width = sample_address_width + obj_id_width; // log(N_obj)
	parameter scen_len_width = 13;   //needs to be revised
	parameter T_clk = 0.6;//0.52;   //needs to be revised
 	parameter noc_output_half = 8;   //needs to be revised
   
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

	wire [address_vector_width - 1:0] real_bypass_dest_addr_int;
	wire real_bypass_reqd;
 	wire [tapping_loc_packet_width - 1:0] real_bypass_tap_loc;

	wire [2*datawidth - 1:0] real_bypass_path_input_data;
	wire [address_vector_width - 1:0] real_bypass_path_input_addr;
	wire real_bypass_valid;
	wire real_bypass_tap_loc_valid;

        wire [2*datawidth-1:0] noc_out_0_final;   
        wire [2*datawidth-1:0] noc_out_1_final;   
        wire [2*datawidth-1:0] noc_out_2_final;   
        wire [2*datawidth-1:0] noc_out_3_final;   
        wire [2*datawidth-1:0] noc_out_4_final;   
        wire [2*datawidth-1:0] noc_out_5_final;   
        wire [2*datawidth-1:0] noc_out_6_final;   
        wire [2*datawidth-1:0] noc_out_7_final;   
	wire [noc_output_half - 1:0] from_noc_output_valid;

	wire [2*datawidth-1:0] shift_reg_out_0;
	wire [2*datawidth-1:0] shift_reg_out_1;
	wire [2*datawidth-1:0] shift_reg_out_2;
	wire [2*datawidth-1:0] shift_reg_out_3;


	reg [7:0] tapping_loc_pe_0;
	reg [7:0] tapping_loc_pe_1;
	reg [7:0] tapping_loc_pe_2;
	reg [7:0] tapping_loc_pe_3;

	reg tapping_loc_valid_pe_0;
	reg tapping_loc_valid_pe_1;
	reg tapping_loc_valid_pe_2;
	reg tapping_loc_valid_pe_3;



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
		scenario_len <= 13'h1ff0;
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



		from_glob_prefetch_start_0 <= 10'bz;
		from_glob_prefetch_start_1 <= 10'bz;
		from_glob_prefetch_start_2 <= 10'bz;
		from_glob_prefetch_start_3 <= 10'bz;
		from_glob_prefetch_start_4 <= 10'bz;
		from_glob_prefetch_start_5 <= 10'bz;
		from_glob_prefetch_start_6 <= 10'bz;
		from_glob_prefetch_start_7 <= 10'bz;
		from_glob_prefetch_start_8 <= 10'bz;
		from_glob_prefetch_start_9 <= 10'bz;
		from_glob_prefetch_start_10 <= 10'bz;
		from_glob_prefetch_start_11 <= 10'bz;
		from_glob_prefetch_start_12 <= 10'bz;
		from_glob_prefetch_start_13 <= 10'bz;
		from_glob_prefetch_start_14 <= 10'bz;
		from_glob_prefetch_start_15 <= 10'bz;

		from_glob_prefetch_stop_0 <= 10'bz;
		from_glob_prefetch_stop_1 <= 10'bz;
		from_glob_prefetch_stop_2 <= 10'bz;
		from_glob_prefetch_stop_3 <= 10'bz;
		from_glob_prefetch_stop_4 <= 10'bz;
		from_glob_prefetch_stop_5 <= 10'bz;
		from_glob_prefetch_stop_6 <= 10'bz;
		from_glob_prefetch_stop_7 <= 10'bz;
		from_glob_prefetch_stop_8 <= 10'bz;
		from_glob_prefetch_stop_9 <= 10'bz;
		from_glob_prefetch_stop_10 <= 10'bz;
		from_glob_prefetch_stop_11 <= 10'bz;
		from_glob_prefetch_stop_12 <= 10'bz;
		from_glob_prefetch_stop_13 <= 10'bz;
		from_glob_prefetch_stop_14 <= 10'bz;
		from_glob_prefetch_stop_15 <= 10'bz;

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

		tapping_loc_pe_0 <= 8'hz;
		tapping_loc_pe_1 <= 8'hz;
		tapping_loc_pe_2 <= 8'hz;
		tapping_loc_pe_3 <= 8'hz;

		tapping_loc_valid_pe_0 <= 1'b0;
		tapping_loc_valid_pe_1 <= 1'b0;
		tapping_loc_valid_pe_2 <= 1'b0;
		tapping_loc_valid_pe_3 <= 1'b0;




		delay_matrix_element <= 0;
		obj_id_element <= 0;

           #(T_clk + 0.2*T_clk) reset <= 1;
	   #(3*T_clk) reset <= 0;
	   #(0.8*T_clk);
////////////////////////////// initial boot up phase /////////////////
	   #(5*T_clk) boot_up <= 1;
	   #(T_clk) input_valid <= 1;
		delay_matrix_element <= 4000;  ///1096 after subtraction  //address 830
		obj_id_element <= 1;
	   #(T_clk) input_valid <= 0;

	   #(T_clk) input_valid <= 1;
	   	delay_matrix_element <= 4010;  ///896 after subtraction  //
	  	obj_id_element <= 0;
	   #(T_clk) input_valid <= 0;

	   #(T_clk) input_valid <= 1;
	  	delay_matrix_element <= 12000;  ///896 after subtraction  //
	 	obj_id_element <= 2;
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
		delay_matrix_element <= 4000;   ///3695 after subtraction 
		obj_id_element <= 1;
	   #(T_clk) glob_scen_noc_input_valid <= 0;

	   #(T_clk) glob_scen_noc_input_valid <= 1;
		delay_matrix_element <= 4009;   /// 
		obj_id_element <= 0;
	   #(T_clk) glob_scen_noc_input_valid <= 0;

	   #(T_clk) glob_scen_noc_input_valid <= 1;
		delay_matrix_element <= 12000;   /// 
		obj_id_element <= 2;
	   #(T_clk) glob_scen_noc_input_valid <= 0;


	   #(4*T_clk) boot_up_table_update <= 1;
	   #(T_clk) boot_up_table_update <= 0;

	   #(85*T_clk)




	   #(2*T_clk )   write_start <= 1; 
			  dummy_start <= 1;
	   #(T_clk)
			  dummy_start <= 0;

	   #(5*T_clk) glob_scen_noc_input_valid <= 1;
		delay_matrix_element <= 4000;   
		obj_id_element <= 1;
	   #(T_clk) glob_scen_noc_input_valid <= 0;

	   #(T_clk) glob_scen_noc_input_valid <= 1;
		delay_matrix_element <= 4008;  
		obj_id_element <= 0;
	   #(T_clk) glob_scen_noc_input_valid <= 0;

	   #(T_clk) glob_scen_noc_input_valid <= 1;
		delay_matrix_element <= 12000;   /// 
		obj_id_element <= 2;
	   #(T_clk) glob_scen_noc_input_valid <= 0;






	   #(9000*T_clk) glob_scen_noc_input_valid <= 1;
		delay_matrix_element <= 10000;   
		obj_id_element <= 1;
	   #(T_clk) glob_scen_noc_input_valid <= 0;

	   #(T_clk) glob_scen_noc_input_valid <= 1;
		delay_matrix_element <= 10010;  
		obj_id_element <= 0;
	   #(T_clk) glob_scen_noc_input_valid <= 0;

	   #(T_clk) glob_scen_noc_input_valid <= 1;
		delay_matrix_element <= 12000;   /// 
		obj_id_element <= 2;
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


	always @(posedge CLK) begin
		if (tapping_loc_packet[1:0] == 00) begin
			tapping_loc_pe_0 <= tapping_loc_packet[9:2];
			tapping_loc_pe_1 <= 0;
			tapping_loc_pe_2 <= 0;
			tapping_loc_pe_3 <= 0;
			tapping_loc_valid_pe_0 <= tapping_loc_valid;
			tapping_loc_valid_pe_1 <= 0;
			tapping_loc_valid_pe_2 <= 0;
			tapping_loc_valid_pe_3 <= 0;

		end
		else if (tapping_loc_packet[1:0] == 01) begin
			tapping_loc_pe_0 <= 0;
			tapping_loc_pe_1 <= tapping_loc_packet[9:2];
			tapping_loc_pe_2 <= 0;
			tapping_loc_pe_3 <= 0;
			tapping_loc_valid_pe_0 <= 0;
			tapping_loc_valid_pe_1 <= tapping_loc_valid;
			tapping_loc_valid_pe_2 <= 0;
			tapping_loc_valid_pe_3 <= 0;
		end
		else if (tapping_loc_packet[1:0] == 10) begin
			tapping_loc_pe_0 <= 0;
			tapping_loc_pe_1 <= 0;
			tapping_loc_pe_2 <= tapping_loc_packet[9:2];
			tapping_loc_pe_3 <= 0;
			tapping_loc_valid_pe_0 <= 0;
			tapping_loc_valid_pe_1 <= 0;
			tapping_loc_valid_pe_2 <= tapping_loc_valid;
			tapping_loc_valid_pe_3 <= 0;
		end
		else if (tapping_loc_packet[1:0] == 11) begin
			tapping_loc_pe_0 <= 0;
			tapping_loc_pe_1 <= 0;
			tapping_loc_pe_2 <= 0;
			tapping_loc_pe_3 <= tapping_loc_packet[9:2];
			tapping_loc_valid_pe_0 <= 0;
			tapping_loc_valid_pe_1 <= 0;
			tapping_loc_valid_pe_2 <= 0;
			tapping_loc_valid_pe_3 <= tapping_loc_valid;
		end
		else begin
			tapping_loc_pe_0 <= 0;
			tapping_loc_pe_1 <= 0;
			tapping_loc_pe_2 <= 0;
			tapping_loc_pe_3 <= 0;
			tapping_loc_valid_pe_0 <= 0;
			tapping_loc_valid_pe_1 <= 0;
			tapping_loc_valid_pe_2 <= 0;
			tapping_loc_valid_pe_3 <= 0;
		end




	end







 

controller_integrated DUT(.CLK(CLK), .reset(reset), .boot_up(boot_up), .boot_up_local(boot_up_local), .boot_up_table_update(boot_up_table_update), .start(start), .table_parse(table_parse), .input_valid(input_valid), .glob_scen_noc_input_valid(glob_scen_noc_input_valid), .delay_matrix_element(delay_matrix_element), .obj_id_element(obj_id_element), .from_glob_prefetch_start(from_glob_prefetch_start),  .from_glob_prefetch_dest(from_glob_prefetch_dest),  .scenario_update(scenario_update_global), .local_controller_id(local_controller_id), .tapping_loc_packet(tapping_loc_packet), .from_glob_prefetch_stop(from_glob_prefetch_stop), .hardware_latency1(hardware_latency1), .hardware_latency2(hardware_latency2), .scenario_len(scenario_len), .prefetch_bypass_dest_addr_int(prefetch_bypass_dest_addr_int), .prefetch_bypass_cycles(prefetch_bypass_cycles), .prefetch_bypass_start_addr(prefetch_bypass_start_addr), .addr(), .data_in(D), .prefetch_bypass_path_input_data(prefetch_bypass_path_input_data), .prefetch_bypass_path_input_addr(prefetch_bypass_path_input_addr), .prefetch_bypass_valid(prefetch_bypass_valid),
 
	.noc_out_0_final(noc_out_0_final), .noc_out_1_final(noc_out_1_final), .noc_out_2_final(noc_out_2_final), .noc_out_3_final(noc_out_3_final),  .noc_out_4_final(noc_out_4_final), .noc_out_5_final(noc_out_5_final), .noc_out_6_final(noc_out_6_final), .noc_out_7_final(noc_out_7_final),  .from_noc_output_valid(from_noc_output_valid),

	.from_glob_prefetch_start_0(from_glob_prefetch_start_0), .from_glob_prefetch_start_1(from_glob_prefetch_start_1), .from_glob_prefetch_start_2(from_glob_prefetch_start_2), .from_glob_prefetch_start_3(from_glob_prefetch_start_3), .from_glob_prefetch_start_4(from_glob_prefetch_start_4), .from_glob_prefetch_start_5(from_glob_prefetch_start_5), .from_glob_prefetch_start_6(from_glob_prefetch_start_6), .from_glob_prefetch_start_7(from_glob_prefetch_start_7), .from_glob_prefetch_start_8(from_glob_prefetch_start_8), .from_glob_prefetch_start_9(from_glob_prefetch_start_9), .from_glob_prefetch_start_10(from_glob_prefetch_start_10), .from_glob_prefetch_start_11(from_glob_prefetch_start_11), .from_glob_prefetch_start_12(from_glob_prefetch_start_12), .from_glob_prefetch_start_13(from_glob_prefetch_start_13), .from_glob_prefetch_start_14(from_glob_prefetch_start_14), .from_glob_prefetch_start_15(from_glob_prefetch_start_15),

	.from_glob_prefetch_stop_0(from_glob_prefetch_stop_0), .from_glob_prefetch_stop_1(from_glob_prefetch_stop_1), .from_glob_prefetch_stop_2(from_glob_prefetch_stop_2), .from_glob_prefetch_stop_3(from_glob_prefetch_stop_3), .from_glob_prefetch_stop_4(from_glob_prefetch_stop_4), .from_glob_prefetch_stop_5(from_glob_prefetch_stop_5), .from_glob_prefetch_stop_6(from_glob_prefetch_stop_6), .from_glob_prefetch_stop_7(from_glob_prefetch_stop_7), .from_glob_prefetch_stop_8(from_glob_prefetch_stop_8), .from_glob_prefetch_stop_9(from_glob_prefetch_stop_9), .from_glob_prefetch_stop_10(from_glob_prefetch_stop_10), .from_glob_prefetch_stop_11(from_glob_prefetch_stop_11), .from_glob_prefetch_stop_12(from_glob_prefetch_stop_12), .from_glob_prefetch_stop_13(from_glob_prefetch_stop_13), .from_glob_prefetch_stop_14(from_glob_prefetch_stop_14), .from_glob_prefetch_stop_15(from_glob_prefetch_stop_15),

	.from_glob_prefetch_dest_0(from_glob_prefetch_dest_0), .from_glob_prefetch_dest_1(from_glob_prefetch_dest_1), .from_glob_prefetch_dest_2(from_glob_prefetch_dest_2), .from_glob_prefetch_dest_3(from_glob_prefetch_dest_3), .from_glob_prefetch_dest_4(from_glob_prefetch_dest_4), .from_glob_prefetch_dest_5(from_glob_prefetch_dest_5), .from_glob_prefetch_dest_6(from_glob_prefetch_dest_6), .from_glob_prefetch_dest_7(from_glob_prefetch_dest_7), .from_glob_prefetch_dest_8(from_glob_prefetch_dest_8), .from_glob_prefetch_dest_9(from_glob_prefetch_dest_9), .from_glob_prefetch_dest_10(from_glob_prefetch_dest_10), .from_glob_prefetch_dest_11(from_glob_prefetch_dest_11), .from_glob_prefetch_dest_12(from_glob_prefetch_dest_12), .from_glob_prefetch_dest_13(from_glob_prefetch_dest_13), .from_glob_prefetch_dest_14(from_glob_prefetch_dest_14), .from_glob_prefetch_dest_15(from_glob_prefetch_dest_15), 
 
	.from_glob_prefetch_valid0(from_glob_prefetch_valid0), .from_glob_prefetch_valid1(from_glob_prefetch_valid1), .from_glob_prefetch_valid2(from_glob_prefetch_valid2), .from_glob_prefetch_valid3(from_glob_prefetch_valid3), .from_glob_prefetch_valid4(from_glob_prefetch_valid4), .from_glob_prefetch_valid5(from_glob_prefetch_valid5), .from_glob_prefetch_valid6(from_glob_prefetch_valid6), .from_glob_prefetch_valid7(from_glob_prefetch_valid7), .from_glob_prefetch_valid8(from_glob_prefetch_valid8), .from_glob_prefetch_valid9(from_glob_prefetch_valid9), .from_glob_prefetch_valid10(from_glob_prefetch_valid10), .from_glob_prefetch_valid11(from_glob_prefetch_valid11), .from_glob_prefetch_valid12(from_glob_prefetch_valid12), .from_glob_prefetch_valid13(from_glob_prefetch_valid13), .from_glob_prefetch_valid14(from_glob_prefetch_valid14), .from_glob_prefetch_valid15(from_glob_prefetch_valid15),

	.from_glob_prefetch_enable0(from_glob_prefetch_enable0), .from_glob_prefetch_enable1(from_glob_prefetch_enable1), .from_glob_prefetch_enable2(from_glob_prefetch_enable2), .from_glob_prefetch_enable3(from_glob_prefetch_enable3), .from_glob_prefetch_enable4(from_glob_prefetch_enable4), .from_glob_prefetch_enable5(from_glob_prefetch_enable5), .from_glob_prefetch_enable6(from_glob_prefetch_enable6), .from_glob_prefetch_enable7(from_glob_prefetch_enable7), .from_glob_prefetch_enable8(from_glob_prefetch_enable8), .from_glob_prefetch_enable9(from_glob_prefetch_enable9), .from_glob_prefetch_enable10(from_glob_prefetch_enable10), .from_glob_prefetch_enable11(from_glob_prefetch_enable11), .from_glob_prefetch_enable12(from_glob_prefetch_enable12), .from_glob_prefetch_enable13(from_glob_prefetch_enable13), .from_glob_prefetch_enable14(from_glob_prefetch_enable14), .from_glob_prefetch_enable15(from_glob_prefetch_enable15),

	 .shift_reg_out_0(shift_reg_out_0), .shift_reg_out_1(shift_reg_out_1), .shift_reg_out_2(shift_reg_out_2), .shift_reg_out_3(shift_reg_out_3),

	.scenario_counter(scenario_counter), .scenario_update_global(scenario_update_global), .valid_bit(valid_bit), .prefetch_enable(prefetch_enable), .tapping_loc_valid(tapping_loc_valid), .real_bypass_dest_addr_int(real_bypass_dest_addr_int), .real_bypass_reqd(real_bypass_reqd), .real_bypass_tap_loc(real_bypass_tap_loc), .real_bypass_path_input_data(real_bypass_path_input_data), .real_bypass_path_input_addr(real_bypass_path_input_addr), .real_bypass_valid(real_bypass_valid), .real_bypass_tap_loc_valid(real_bypass_tap_loc_valid));

    
endmodule
