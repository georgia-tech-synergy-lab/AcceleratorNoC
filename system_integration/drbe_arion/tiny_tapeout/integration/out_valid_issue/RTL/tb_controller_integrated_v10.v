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


		delay_matrix_element <= 0;
		obj_id_element <= 0;

           #(T_clk + 0.2*T_clk) reset <= 1;
	   #(3*T_clk) reset <= 0;
	   #(0.8*T_clk);
////////////////////////////// initial boot up phase /////////////////
	   #(5*T_clk) boot_up <= 1;
	   #(T_clk) input_valid <= 1;
		delay_matrix_element <= 10000;  ///1096 after subtraction  //address 830
		obj_id_element <= 1;
	   #(T_clk) input_valid <= 0;

	   #(T_clk) input_valid <= 1;
	   	delay_matrix_element <= 10010;  ///896 after subtraction  //
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
		delay_matrix_element <= 10000;   ///3695 after subtraction 
		obj_id_element <= 1;
	   #(T_clk) glob_scen_noc_input_valid <= 0;

	   #(T_clk) glob_scen_noc_input_valid <= 1;
		delay_matrix_element <= 10009;   /// 
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
		delay_matrix_element <= 10000;   
		obj_id_element <= 1;
	   #(T_clk) glob_scen_noc_input_valid <= 0;

	   #(T_clk) glob_scen_noc_input_valid <= 1;
		delay_matrix_element <= 10008;  
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
 

controller_integrated DUT(.CLK(CLK), .reset(reset), .boot_up(boot_up), .boot_up_local(boot_up_local), .boot_up_table_update(boot_up_table_update), .start(start), .table_parse(table_parse), .input_valid(input_valid), .glob_scen_noc_input_valid(glob_scen_noc_input_valid), .delay_matrix_element(delay_matrix_element), .obj_id_element(obj_id_element), .from_glob_prefetch_start(from_glob_prefetch_start),  .from_glob_prefetch_dest(from_glob_prefetch_dest),  .scenario_update(scenario_update_global), .local_controller_id(local_controller_id), .tapping_loc_packet(tapping_loc_packet), .from_glob_prefetch_stop(from_glob_prefetch_stop), .hardware_latency1(hardware_latency1), .hardware_latency2(hardware_latency2), .scenario_len(scenario_len), .prefetch_bypass_dest_addr_int(prefetch_bypass_dest_addr_int), .prefetch_bypass_cycles(prefetch_bypass_cycles), .prefetch_bypass_start_addr(prefetch_bypass_start_addr), .addr(), .data_in(D), .prefetch_bypass_path_input_data(prefetch_bypass_path_input_data), .prefetch_bypass_path_input_addr(prefetch_bypass_path_input_addr), .prefetch_bypass_valid(prefetch_bypass_valid),
 
	.noc_out_0_final(noc_out_0_final), .noc_out_1_final(noc_out_1_final), .noc_out_2_final(noc_out_2_final), .noc_out_3_final(noc_out_3_final),  .noc_out_4_final(noc_out_4_final), .noc_out_5_final(noc_out_5_final), .noc_out_6_final(noc_out_6_final), .noc_out_7_final(noc_out_7_final),  .from_noc_output_valid(from_noc_output_valid),

	 .shift_reg_out_0(shift_reg_out_0), .shift_reg_out_1(shift_reg_out_1), .shift_reg_out_2(shift_reg_out_2), .shift_reg_out_3(shift_reg_out_3),

	.scenario_counter(scenario_counter), .scenario_update_global(scenario_update_global), .valid_bit(valid_bit), .prefetch_enable(prefetch_enable), .tapping_loc_valid(tapping_loc_valid), .real_bypass_dest_addr_int(real_bypass_dest_addr_int), .real_bypass_reqd(real_bypass_reqd), .real_bypass_tap_loc(real_bypass_tap_loc), .real_bypass_path_input_data(real_bypass_path_input_data), .real_bypass_path_input_addr(real_bypass_path_input_addr), .real_bypass_valid(real_bypass_valid), .real_bypass_tap_loc_valid(real_bypass_tap_loc_valid));

    
endmodule
