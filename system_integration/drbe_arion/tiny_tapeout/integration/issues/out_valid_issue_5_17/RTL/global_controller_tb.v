`timescale 1ns / 1ps

//`include "/home/green1/DKIT/tsmc_muse/IP/TSMC28_STD_CELLS/unzipped/tcbn28hpcplusbwp30p140_190a/tcbn28hpcplusbwp30p140_110a_vlg/TSMCHOME/digital/Front_End/verilog/tcbn28hpcplusbwp30p140_110a/tcbn28hpcplusbwp30p140.v"

`include "/home/green1/DKIT/tsmc_muse/IP/TSMC28_STD_CELLS/unzipped/tcbn28hpcplusbwp30p140lvt_190a/tcbn28hpcplusbwp30p140lvt_110a_vlg/TSMCHOME/digital/Front_End/verilog/tcbn28hpcplusbwp30p140lvt_110a/tcbn28hpcplusbwp30p140lvt.v"

////////////////////////////////////////////////////////////////////////////////////////////////
// Company: Gatech	
// Engineer: Mandovi Mukherjee
// 
// Create Date: 03/31/2021 
// System Name: accelerator
// Module Name: global_controller_tb
// Project Name: ARION DRBE
// Description: Testbench for local controller
// Dependencies:
// Additional Comments: 
/////////////////////////////////////////////////////////////////////////////////////////////////////

module global_controller_tb;

    // parameter
    	parameter N_sample = 256;
	parameter datawidth = 16;
	parameter address_vector_width = 4; //can be 200 or 8: 8 for small tapeout
	parameter N_obj = 4; //can be 200 or 8: 8 for small tapeout
	parameter id_width = 6; // 16 local controllers in subscaled system
	parameter sample_address_width = 8; /// assuming 256 words: needs to change if arrangement is different
	parameter packet_width = 2*datawidth + address_vector_width;
	parameter delay_length = 14; // log(id_width*N_sample)
	parameter obj_id_width = 2; // log(N_obj)
	parameter tapping_loc_packet_width = sample_address_width + obj_id_width; // log(N_obj)
	parameter scen_len_width = 11;   //needs to be revised
	parameter T_clk = 0.38;


/////////////////////////////////////////////////////////////////////////////////////    
    	reg CLK;
    	reg reset;
    	reg start;
	reg scenario_update;
	reg boot_up;
	reg table_parse;
	reg input_valid;
	reg glob_scen_noc_input_valid;
	reg [delay_length - 1:0] delay_matrix_element;
	reg [obj_id_width - 1:0] obj_id_element;
	reg [delay_length - 1:0] hardware_latency1;   ///keep as config to be input through spi?
	reg [delay_length - 1:0] hardware_latency2;   /// keep as config to be input through spi?
	reg [scen_len_width - 1:0] scenario_len;   /// keep as config to be input through spi?
	reg [2*datawidth - 1:0] data_in;


	wire [address_vector_width - 1:0] from_glob_prefetch_dest;
	wire [sample_address_width - 1:0] from_glob_prefetch_start;
	wire [sample_address_width - 1:0] from_glob_prefetch_stop;
	wire [id_width - 1:0] local_controller_id;			
	wire [tapping_loc_packet_width - 1:0] tapping_loc_packet;
	wire [address_vector_width - 1:0] prefetch_bypass_dest_addr_int;
	wire [sample_address_width - 1:0] prefetch_bypass_cycles;
	wire [delay_length - 1:0] prefetch_bypass_start_addr;
	wire [id_width - 1:0] addr;
	wire [2*datawidth - 1:0] h_tree_input_data;
	wire [id_width - 1:0] h_tree_input_addr;
	wire [2*datawidth - 1:0] prefetch_bypass_path_input_data;
	wire [address_vector_width - 1:0] prefetch_bypass_path_input_addr;
	wire prefetch_bypass_valid;


    initial begin
        	CLK <= 0;
        	reset <= 0;
        	start <= 0;
		scenario_update <= 0;
		delay_matrix_element <= 0;
		obj_id_element <= 0;
		boot_up <= 0;
		table_parse <= 0;
		input_valid <= 0;
		glob_scen_noc_input_valid <= 0;
		hardware_latency1 <= 0;
		hardware_latency2 <= 0;
		scenario_len <= 11'h7ff;
		data_in <= 0;



           #(T_clk ) reset <= 1;
	   #(3*T_clk) reset <= 0;
	   #(T_clk);
////////////////////////////// initial boot up phase /////////////////
	   #(5*T_clk) boot_up <= 1;
	   #(T_clk) input_valid <= 1;
		delay_matrix_element <= 400;  ///3696 after subtraction  //address e70
		obj_id_element <= 1;
	   #(T_clk) input_valid <= 0;

	   #(6*T_clk) input_valid <= 1;
		delay_matrix_element <= 500;  ///3596 after subtraction   //address e0c
		obj_id_element <= 0;
	   #(T_clk) input_valid <= 0;

	   #(6*T_clk) input_valid <= 1;
		delay_matrix_element <= 3000;   //1096 after subtraction   //448
		obj_id_element <= 2;
	   #(T_clk) input_valid <= 0;


	   #(6*T_clk) input_valid <= 1;
		delay_matrix_element <= 4000;   //1096 after subtraction   //448
		obj_id_element <= 3;
	   #(T_clk) input_valid <= 0;
	   #(5*T_clk) boot_up <= 0;


	   #(7*T_clk) table_parse <= 1;
	

	   #(5*T_clk) glob_scen_noc_input_valid <= 1;
		delay_matrix_element <= 400;   ///3695 after subtraction 
		obj_id_element <= 1;
	   #(T_clk) glob_scen_noc_input_valid <= 0;

	   #(6*T_clk) //glob_scen_noc_input_valid <= 1;
		//delay_matrix_element <= 510;      ///3586 after subtraction
		//obj_id_element <= 0;
	   #(T_clk) //glob_scen_noc_input_valid <= 0;

	   #(20*T_clk) scenario_update <= 0;
	   #(T_clk) scenario_update <= 0;

		#(100*T_clk)      start <= 1;



  
//	   #(12.5*T_clk) from_glob_controller_valid2 <= 1;
//			  from_glob_dest_addr_2 <= 8'b00001000;
//		          from_glob_controller_delay_2 <= 8'b00011001;

//	     #(T_clk)     from_glob_controller_valid2 <= 0;
//			  from_glob_dest_addr_2 <= 8'bz;
//			  from_glob_controller_delay_2 <= 8'bz;


///////////////write enabled //////////////////////////////////			



/////////////////////////////////////////////////////////////
//	   #(1300*T_clk) scenario_update <= 0;
//	   #(T_clk) scenario_update <= 0;
				 
        

    end

    always #(0.5*T_clk) CLK <= ~CLK;
	always @(posedge CLK) data_in <= data_in + 1;


 
global_controller DUT_global(.CLK(CLK), .reset(reset), .start(start), .boot_up(boot_up),  .table_parse(table_parse), .input_valid(input_valid), .glob_scen_noc_input_valid(glob_scen_noc_input_valid), .delay_matrix_element(delay_matrix_element), .obj_id_element(obj_id_element),.from_glob_prefetch_start(from_glob_prefetch_start),.from_glob_prefetch_dest(from_glob_prefetch_dest),  .scenario_update(scenario_update), .local_controller_id(local_controller_id), .tapping_loc_packet(tapping_loc_packet), .from_glob_prefetch_stop(from_glob_prefetch_stop), .hardware_latency1(hardware_latency1), .hardware_latency2(hardware_latency2), .scenario_len(scenario_len), .prefetch_bypass_dest_addr_int(prefetch_bypass_dest_addr_int), .prefetch_bypass_cycles(prefetch_bypass_cycles), .prefetch_bypass_start_addr(prefetch_bypass_start_addr), .addr(addr), .data_in(data_in), .h_tree_input_data(h_tree_input_data), .h_tree_input_addr(h_tree_input_addr), .prefetch_bypass_path_input_data(prefetch_bypass_path_input_data), .prefetch_bypass_path_input_addr(prefetch_bypass_path_input_addr), .prefetch_bypass_valid(prefetch_bypass_valid));

    
endmodule
