`timescale 1ns / 1ps

//`include "/home/green1/DKIT/tsmc_muse/IP/TSMC28_STD_CELLS/unzipped/tcbn28hpcplusbwp30p140_190a/tcbn28hpcplusbwp30p140_110a_vlg/TSMCHOME/digital/Front_End/verilog/tcbn28hpcplusbwp30p140_110a/tcbn28hpcplusbwp30p140.v"

`include "/home/jimmy/work/work_tushar/AcceleratorNoC/system_integration/drbe_arion/tiny_tapeout/integration/lib/lib.v"

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
	parameter T_clk = 1;//0.52;   //needs to be revised
 	parameter noc_output_half = 8;   //needs to be revised
   
    	reg CLK;
    	reg reset;
    	reg boot_up;
    	reg start;
	reg table_parse;
	reg input_valid;
	reg glob_scen_noc_input_valid;
	reg init_sram;
	reg direct_tap;
	wire [2*datawidth - 1:0] D;
	reg [datawidth - 1:0] D_real;
	reg [datawidth - 1:0] D_img;

	//reg scenario_update;
	


	reg write_start;	
	reg dummy_start;	
	reg [delay_length - 1:0] delay_matrix_element;
	reg [obj_id_width - 1:0] obj_id_element;
	reg [delay_length - 1:0] hardware_latency1;   ///keep as config to be input through spi?
	reg [delay_length - 1:0] hardware_latency2;
	reg [scen_len_width - 1:0] scenario_len;
	reg boot_up_local;
	reg boot_up_table_update;

	//wire [2*datawidth-1:0] final_out_0;
	//wire [2*datawidth-1:0] final_out_1;
	//wire [2*datawidth-1:0] final_out_2;
	//wire [2*datawidth-1:0] final_out_3;

	reg     sel1,sel2,sel3,sel4;
    	//input     [15:0] data_real1, data_img1,data_real2, data_img2,data_real3, data_img3;
    	reg     [15:0] coe;
    	reg     [9:0]  interp_coe;
	//output [2*datawidth-1:0] final_out_3;

	reg [15:0] ts_inc;
	reg scen_ch;

	reg [15:0] din_0,din_1,din_2;

	wire [15:0] out1_real,out1_img,out2_real,out2_img,out3_real,out3_img;
	reg load_same_scenario;
	reg [delay_length - 1:0] input_block_latency; 
	reg [delay_length - 1:0] input_block_scen_pipeline ;
	wire scenario_update_input_block;

    initial begin
        	CLK <= 0;
        	reset <= 0;
        	boot_up <= 0;
        	dummy_start <= 0;
		//D <= 32'h00fffffe; //adjust based on when operation starts for address = data pattern
		D_real <= 16'b0011110000100000; //adjust based on when operation starts for address = data pattern
		D_img <= 16'b0011110000100000; //adjust based on when operation starts for address = data pattern
		write_start <= 0;
		input_valid <= 0;
		table_parse <= 0;
		hardware_latency1 <= 14'ha;
		hardware_latency2 <= 0;
		scenario_len <= 13'h1ff0;
		glob_scen_noc_input_valid <= 0;
		boot_up_local <= 0;
		boot_up_table_update <= 0;
		direct_tap <= 0;
		init_sram <= 0;
		coe <= 16'b0011110000000000;
		interp_coe <= 10'b0011110000;
		sel1 <= 0;
		sel2 <= 0;
		sel3 <= 0;
		sel4 <= 0;
		ts_inc <= 16'b0010100010011100;
		din_0 <= 16'b0110111100101001;
		din_1 <= 16'b0110111100101001;
		din_2 <= 16'b0110111100101001;
		input_block_latency <= 0;
		input_block_scen_pipeline <= 0;
		load_same_scenario <= 0;

		delay_matrix_element <= 0;
		obj_id_element <= 0;

           #(T_clk + 0.2*T_clk) reset <= 1;
	   #(3*T_clk) reset <= 0;
	   #(0.8*T_clk);


	   #(10*T_clk) init_sram <= 1;
	   #(1050*T_clk) init_sram <= 0;

           #(2*T_clk + 0.2*T_clk) reset <= 1;
	   #(3*T_clk) reset <= 0;
	   #(0.8*T_clk);


////////////////////////////// initial boot up phase /////////////////
	   #(5*T_clk) boot_up <= 1;
	   #(T_clk) input_valid <= 1;
		    sel1 <= 1;
		    sel2 <= 1;
		delay_matrix_element <= 10000;  ///1096 after subtraction  //address 830
		obj_id_element <= 1;
	   #(T_clk) input_valid <= 0;
		    sel1 <= 0;
		    sel2 <= 0;

	   #(T_clk) input_valid <= 1;
		    sel1 <= 1;
		    sel2 <= 1;
	   	delay_matrix_element <= 10010;  ///896 after subtraction  //
	  	obj_id_element <= 0;
	   #(T_clk) input_valid <= 0;
		    sel1 <= 0;
		    sel2 <= 0;

	  // #(T_clk) input_valid <= 1;
	//	    sel1 <= 1;
	//	    sel2 <= 1;
	  //	delay_matrix_element <= 12000;  ///896 after subtraction  //
	 //	obj_id_element <= 2;
	  // #(T_clk) input_valid <= 0;
		    sel1 <= 0;
		    sel2 <= 0;


	   #(2*T_clk) sel1 <= 1;
	   #(T_clk) sel1 <= 0;
	   #(2*T_clk) sel1 <= 1;
	   #(T_clk) sel1 <= 0;
	   #(2*T_clk) sel1 <= 1;
	   #(T_clk) sel1 <= 0;
	   #(2*T_clk) sel1 <= 1;
	   #(T_clk) sel1 <= 0;
	   #(2*T_clk) sel1 <= 1;
	   #(T_clk) sel1 <= 0;
	   #(T_clk)	sel3 <= 1;
			sel4 <= 1;
	   #(T_clk)	sel3 <= 0;
			sel4 <= 0;


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
		delay_matrix_element <= 10010;   /// 
		obj_id_element <= 0;
	   #(T_clk) glob_scen_noc_input_valid <= 0;

	  // #(T_clk) glob_scen_noc_input_valid <= 1;
	//	delay_matrix_element <= 12000;   /// 
	//	obj_id_element <= 2;
	  // #(T_clk) glob_scen_noc_input_valid <= 0;


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
		delay_matrix_element <= 10010;  
		obj_id_element <= 0;
	   #(T_clk) glob_scen_noc_input_valid <= 0;

	//   #(T_clk) glob_scen_noc_input_valid <= 1;
	//	delay_matrix_element <= 12000;   /// 
	//	obj_id_element <= 2;
	  // #(T_clk) glob_scen_noc_input_valid <= 0;






	   #(9000*T_clk) glob_scen_noc_input_valid <= 1;
		delay_matrix_element <= 10001;   
		obj_id_element <= 1;
	   #(T_clk) glob_scen_noc_input_valid <= 0;

	   #(T_clk) glob_scen_noc_input_valid <= 1;
		delay_matrix_element <= 10010;  
		obj_id_element <= 0;
	   #(T_clk) glob_scen_noc_input_valid <= 0;

	 //  #(T_clk) glob_scen_noc_input_valid <= 1;
	//	delay_matrix_element <= 12000;   /// 
	//	obj_id_element <= 2;
	  // #(T_clk) glob_scen_noc_input_valid <= 0;


				 
        

    end

    always #(0.5*T_clk) CLK <= ~CLK;
    always @(posedge CLK) begin
	if (write_start) begin
		D_real <= D_real + 1;
		D_img <= D_img + 1;
	end
		
    end

    always @(posedge CLK) begin
	if (dummy_start) begin
		start <= 1;
	end
	else start <= 0;
		
    end

	assign D = {D_real, D_img}; 

//controller_integrated DUT(.CLK(CLK), .reset(reset), .boot_up(boot_up), .boot_up_local(boot_up_local), .boot_up_table_update(boot_up_table_update), .start(start), .init_sram(init_sram), .direct_tap(direct_tap), .table_parse(table_parse), .input_valid(input_valid), .glob_scen_noc_input_valid(glob_scen_noc_input_valid), .delay_matrix_element(delay_matrix_element), .obj_id_element(obj_id_element), .scenario_update(scenario_update), .hardware_latency1(hardware_latency1), .hardware_latency2(hardware_latency2), .scenario_len(scenario_len), .data_in(D), .final_out_0(final_out_0), .final_out_1(final_out_1), .final_out_2(final_out_2), .final_out_3(final_out_3));

controller_integrated DUT(.CLK(CLK), .reset(reset), .boot_up(boot_up), .boot_up_local(boot_up_local), .boot_up_table_update(boot_up_table_update), .start(start), .init_sram(init_sram), .direct_tap(direct_tap), .table_parse(table_parse), .input_valid(input_valid), .glob_scen_noc_input_valid(glob_scen_noc_input_valid), .delay_matrix_element(delay_matrix_element), .obj_id_element(obj_id_element), .hardware_latency1(hardware_latency1), .hardware_latency2(hardware_latency2), .scenario_len(scenario_len), .data_in(D), .coe(coe), .interp_coe(interp_coe), .sel1(sel1), .sel2(sel2), .sel3(sel3), .sel4(sel4), .out1_real(out1_real), .out1_img(out1_img), .out2_real(out2_real), .out2_img(out2_img), .out3_real(out3_real), .out3_img(out3_img), .ts_inc(ts_inc), .din_0(din_0), .din_1(din_1), .din_2(din_2), .scen_ch(start));
//controller_integrated DUT(.CLK(CLK), .reset(reset), .boot_up(boot_up), .boot_up_local(boot_up_local), .boot_up_table_update(boot_up_table_update), .start(start), .init_sram(init_sram), .direct_tap(direct_tap), .table_parse(table_parse), .input_valid(input_valid), .glob_scen_noc_input_valid(glob_scen_noc_input_valid), .delay_matrix_element(delay_matrix_element), .obj_id_element(obj_id_element), .hardware_latency1(hardware_latency1), .hardware_latency2(hardware_latency2), .scenario_len(scenario_len), .data_in(D), .coe(coe), .interp_coe(interp_coe), .sel1(sel1), .sel2(sel2), .sel3(sel3), .sel4(sel4), .out1_real(out1_real), .out1_img(out1_img), .out2_real(out2_real), .out2_img(out2_img), .out3_real(out3_real), .out3_img(out3_img), .ts_inc(ts_inc), .din_0(din_0), .din_1(din_1), .din_2(din_2), .scen_ch(start), .input_block_latency(input_block_latency), .input_block_scen_pipeline(input_block_scen_pipeline), .load_same_scenario(load_same_scenario), .scenario_update_input_block(scenario_update_input_block));

    
endmodule
