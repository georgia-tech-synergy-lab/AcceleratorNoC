`timescale 1ns / 100ps

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

module local_controller_tb;

    // parameter
    parameter N_row = 1024;
	parameter datawidth = 32;
	parameter address_vector_width = 8; //can be 200 or 8: 8 for subscaled system
	parameter id_width = 11; // 1221 local controllers in subscaled system
	parameter row_address_width = 10; /// assuming 1024 rows and 64 columns: needs to change if arrangement is different
	parameter packet_width = 2*datawidth + address_vector_width;
	parameter size = 2;
    
    reg clk;
    reg reset;
	reg init;
	reg [id_width - 1:0] controller_id;
	reg write_flag;
	reg [size - 1:0] glob_controller_sending;
	reg [row_address_width - 1:0] from_glob_controller_delay;
	reg [address_vector_width - 1:0] from_glob_dest_addr;
	reg [2*datawidth - 1:0] data_from_sram_0;
	reg [2*datawidth - 1:0] data_from_sram_1;
	reg input_boundary_flag;
	reg [address_vector_width - 1:0] prev_dest_address;
	
	wire [packet_width - 1:0] packet_out_0;
	wire [packet_width - 1:0] packet_out_1;
	wire boundary_next_0;
	wire boundary_next_1;
	wire [address_vector_width - 1:0] dest_address_0;
	wire [address_vector_width - 1:0] dest_address_1;

    initial begin
        clk <= 0;
        reset <= 0;
		init <= 0;
		glob_controller_sending <= 0;
		data_from_sram_0 <= 64'b0;
		data_from_sram_1 <= 64'b0;
		controller_id <= 11'b0;
		input_boundary_flag <= 0;
		write_flag <= 0;
		prev_dest_address <= 8'b00000000;
		from_glob_dest_addr <= 8'b00000000;
		from_glob_controller_delay <= 10'b0;
        #0.7 reset <= 1;
		#1.7 reset <= 0;
		#2 init <= 1;
		#0.6 glob_controller_sending[0] <= 1;
		     from_glob_dest_addr <= 8'b00001000;
		     from_glob_controller_delay <= 10'b0000011001;
		#1 glob_controller_sending[0] <= 0;
		     from_glob_dest_addr <= 8'b00000000;
		     from_glob_controller_delay <= 10'b0000000000;
		#2.6 init <= 0;
		#1.7 input_boundary_flag <= 0;    //should be exactly at a positive clock edge
		#1 input_boundary_flag <= 0;	 
        

    end

    always #0.5 clk = ~clk;
    always #0.5 data_from_sram_0 = data_from_sram_0 + 2;
    always #0.5 data_from_sram_1 = data_from_sram_1 + 3;

 
    local_controller DUT0(.clk(clk), .reset(reset), .init(init), .controller_id(controller_id), .write_flag(write_flag), .glob_controller_sending(glob_controller_sending[0]), .from_glob_controller_delay(from_glob_controller_delay), .data_from_sram(data_from_sram_0), .input_boundary_flag(input_boundary_flag), .prev_dest_address(prev_dest_address), .from_glob_dest_addr(from_glob_dest_addr), .packet_out(packet_out_0), .boundary_next(boundary_next_0), .dest_address(dest_address_0));
    local_controller DUT1(.clk(clk), .reset(reset), .init(init), .controller_id(controller_id), .write_flag(write_flag), .glob_controller_sending(glob_controller_sending[1]), .from_glob_controller_delay(from_glob_controller_delay), .data_from_sram(data_from_sram_1), .input_boundary_flag(boundary_next_0), .prev_dest_address(dest_address_0), .from_glob_dest_addr(from_glob_dest_addr), .packet_out(packet_out_1), .boundary_next(boundary_next_1), .dest_address(dest_address_1));
endmodule
