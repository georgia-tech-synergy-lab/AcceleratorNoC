`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////////////////////
// Company: Gatech	
// Engineer: Mandovi Mukherjee
// 
// Create Date: 01/08/2021 
// System Name: accelerator
// Module Name: local controller
// Project Name: ARION DRBE
// Description: fetch and push data out to network; assuming the output from
// global controller comes in the form of a packet
// Dependencies:
// Additional Comments: 
/////////////////////////////////////////////////////////////////////////////////////////////////////

module local_controller_prefetch_full(CLK, reset, boot_up, start, input_boundary_flag, prev_dest_address, packet_out, boundary_next, dest_address, D, write_flag, from_glob_prefetch_valid, from_glob_prefetch_start, from_glob_prefetch_stop, from_glob_prefetch_dest,  write_boundary_next, input_write_boundary, prefetch_next_dest_addr, prefetch_next_stop_address, prefetch_boundary_prev, input_prefetch_boundary_flag, prefetch_stop_address, prefetch_dest_addr, scenario_update, prefetch_enable, init_sram);

    // parameter
    	parameter N_sample = 1024;
	parameter datawidth = 16;
	parameter address_vector_width = 4; //can be 200: 4 for tiny tapeout
	parameter full_address_vector_width = 8; //can be 200: 4 for tiny tapeout
	parameter id_width = 4; // 16 local controllers in subscaled system
	parameter sample_address_width = 10; /// assuming 1024 rows and 64 columns: needs to change if arrangement is different
	parameter packet_width = 2 + 2*datawidth + full_address_vector_width;  ///valid bit, real/prefetch flag, data, dest
	

//=== IO Ports ===//

     // Normal Mode Input
        input [31:0] D;
    	input CLK; // system clock, generated by VCO
	input reset;
	input boot_up;
	input start;
	input init_sram;
	
	input input_boundary_flag;
	input input_prefetch_boundary_flag;
	input input_write_boundary;
	input [address_vector_width - 1:0] prev_dest_address;
	input [address_vector_width - 1:0] prefetch_next_dest_addr;
        input [sample_address_width - 1:0] prefetch_next_stop_address;
	input [address_vector_width - 1:0] from_glob_prefetch_dest;
	
	

	input write_flag;

	input from_glob_prefetch_valid;
	input [sample_address_width - 1:0] from_glob_prefetch_start;
	input [sample_address_width - 1:0] from_glob_prefetch_stop;
	input scenario_update;
	input prefetch_enable;

    // output
        output reg [packet_width-1:0] packet_out;   
        output reg boundary_next;
        output reg write_boundary_next;
        output reg [address_vector_width - 1:0] dest_address;
        output reg prefetch_boundary_prev;
	output reg [address_vector_width - 1:0] prefetch_dest_addr;
    	output reg [sample_address_width - 1:0] prefetch_stop_address;

endmodule

