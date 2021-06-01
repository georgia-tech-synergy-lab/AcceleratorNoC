`timescale 1ns / 1ps

module Htree_Flat_clockedHiFeq_16(
	CLK,
	addr,
	en, 
	we,
	data_in,
     

	en_sub_0, en_sub_1, en_sub_2, en_sub_3, en_sub_4, en_sub_5, en_sub_6, en_sub_7, en_sub_8, en_sub_9, en_sub_10, en_sub_11, en_sub_12, en_sub_13, en_sub_14, en_sub_15,
	en_sub_16, 

	we_sub_0, we_sub_1, we_sub_2, we_sub_3, we_sub_4, we_sub_5, we_sub_6, we_sub_7, we_sub_8, we_sub_9, we_sub_10, we_sub_11, we_sub_12, we_sub_13, we_sub_14, we_sub_15,
	we_sub_16, 

	data_in_sub_0, data_in_sub_1, data_in_sub_2, data_in_sub_3, data_in_sub_4, data_in_sub_5, data_in_sub_6, data_in_sub_7, data_in_sub_8, data_in_sub_9, data_in_sub_10, data_in_sub_11, data_in_sub_12, data_in_sub_13, data_in_sub_14, data_in_sub_15,
	data_in_sub_16,

	data_out_sub_0, data_out_sub_1, data_out_sub_2, data_out_sub_3, data_out_sub_4, data_out_sub_5, data_out_sub_6, data_out_sub_7, data_out_sub_8, data_out_sub_9, data_out_sub_10, data_out_sub_11, data_out_sub_12, data_out_sub_13, data_out_sub_14, data_out_sub_15,
	data_out_sub_16, 
	);

	
	parameter BusWidth = 32;

	/////////////////////////////
	// write_IO_information()
	/////////////////////////////

	input CLK;
	input [11:0] addr; //(6+2)+2+2
	//input [13:0] addr; //(6+2)+2+2 //changed by mandovi
	input we;
    input en;
	input [BusWidth-1:0] data_in; 

	output reg en_sub_0, en_sub_1, en_sub_2, en_sub_3, en_sub_4, en_sub_5, en_sub_6, en_sub_7, en_sub_8, en_sub_9, en_sub_10, en_sub_11, en_sub_12, en_sub_13, en_sub_14, en_sub_15,
	en_sub_16;

    output reg we_sub_0, we_sub_1, we_sub_2, we_sub_3, we_sub_4, we_sub_5, we_sub_6, we_sub_7, we_sub_8, we_sub_9, we_sub_10, we_sub_11, we_sub_12, we_sub_13, we_sub_14, we_sub_15,
	we_sub_16;


	output reg[BusWidth-1:0] data_in_sub_0, data_in_sub_1, data_in_sub_2, data_in_sub_3, data_in_sub_4, data_in_sub_5, data_in_sub_6, data_in_sub_7, data_in_sub_8, data_in_sub_9, data_in_sub_10, data_in_sub_11, data_in_sub_12, data_in_sub_13, data_in_sub_14, data_in_sub_15,
	data_in_sub_16;
	
	output reg [BusWidth-1:0] data_out_sub_0, data_out_sub_1, data_out_sub_2, data_out_sub_3, data_out_sub_4, data_out_sub_5, data_out_sub_6, data_out_sub_7, data_out_sub_8, data_out_sub_9, data_out_sub_10, data_out_sub_11, data_out_sub_12, data_out_sub_13, data_out_sub_14, data_out_sub_15,
	data_out_sub_16;

	reg en_sub_tmp_0,en_sub_tmp_1,en_sub_tmp_2,en_sub_tmp_3;
	reg en_sub_tmp_03, en_sub_tmp_47, en_sub_tmp_811, en_sub_tmp_1215;

	reg we_sub_tmp_0,we_sub_tmp_1,we_sub_tmp_2,we_sub_tmp_3;
	reg we_sub_tmp_03, we_sub_tmp_47, we_sub_tmp_811, we_sub_tmp_1215;


	/////////////////////////////
	// write_input_registers()
	/////////////////////////////

	//addr

	reg [13:0] addr_reg;
	always @ (posedge CLK) begin
		
		if (en) begin
			addr_reg <= addr;
		end else begin
			addr_reg <= 0;
		end
	end

	//en

	reg  en_reg;
	always @ (posedge CLK) begin
		 if (en) begin
			en_reg <= en;
		end else begin
			en_reg <= 0;
		end
	end


	//we

	reg  we_reg;
	always @ (posedge CLK) begin
		if (en) begin
			we_reg <= we;
		end else begin
			we_reg <= 0;
		end
	end

	//data_in

	reg [BusWidth-1:0] data_in_reg;

	always @ (posedge CLK) begin
		if (en) begin
			data_in_reg <= data_in;
		end else begin
			data_in_reg <= 0;
		end
	end

	


	/////////////////////////////////////ENENENENENENENENEN//////////////////////////////////////////
	
	always @ (posedge CLK) begin
		if ((addr_reg[11:10]==0)) begin
			en_sub_tmp_03 <= 1'b1;
		end else begin
			en_sub_tmp_03 <= 1'b0;
		end
	end
   //---------------------------------------------------------------------------------------------------
	always @ (posedge CLK) begin
		if ((en_reg) && (addr_reg[9:8]==0)) begin
			en_sub_tmp_0 <= 1'b1;
		end else begin
			en_sub_tmp_0 <= 1'b0;
		end
	end
	
	always @ (posedge CLK) begin
		if ((en_sub_tmp_03) && (en_sub_tmp_0)) begin
			en_sub_0 <= 1'b1;
			data_in_sub_0 <= data_in_reg;
		end else begin
			en_sub_0 <= 1'b0;
			data_in_sub_0 <= 0;
		end
	end
	
   //----------------
   always @ (posedge CLK) begin
		if ((en_reg) && (addr_reg[9:8]==1)) begin
			en_sub_tmp_1 <= 1'b1;
		end else begin
			en_sub_tmp_1 <= 1'b0;
		end
	end
	
	always @ (posedge CLK) begin
		if ((en_sub_tmp_03) && (en_sub_tmp_1)) begin
			en_sub_1 <= 1'b1;
			data_in_sub_1 <= data_in_reg;
		end else begin
			en_sub_1 <= 1'b0;
			data_in_sub_1 <= 0;

		end
	end
    //----------------
    
	always @ (posedge CLK) begin
		if ((en_reg) && (addr_reg[9:8]==2)) begin
			en_sub_tmp_2 <= 1'b1;
		end else begin
			en_sub_tmp_2 <= 1'b0;
		end
	end
	
	always @ (posedge CLK) begin
		if ((en_sub_tmp_03) && (en_sub_tmp_2)) begin
			en_sub_2 <= 1'b1;
			data_in_sub_2 <= data_in_reg;
		end else begin
			en_sub_2 <= 1'b0;
			data_in_sub_2 <= 0;

		end
	end
	//--------------------

    always @ (posedge CLK) begin
		if ((en_reg) && (addr_reg[9:8]==3)) begin
			en_sub_tmp_3 <= 1'b1;
		end else begin
			en_sub_tmp_3 <= 1'b0;
		end
	end
	
	always @ (posedge CLK) begin
		if ((en_sub_tmp_03) && (en_sub_tmp_3)) begin
			en_sub_3 <= 1'b1;
			data_in_sub_3 <= data_in_reg;
		end else begin
			en_sub_3 <= 1'b0;
			data_in_sub_3 <= 0;
		end
	end
	//--------------------

   ///////////////////////////////////////////////////////////////////////////////////////////////

  always @ (posedge CLK) begin
		if ((addr_reg[11:10]==1) ) begin
			en_sub_tmp_47 <= 1'b1;
		end else begin
			en_sub_tmp_47 <= 1'b0;
		end
	end
   //---------------------------------------------------------------------------------------------------
	
	
	always @ (posedge CLK) begin
		if ((en_sub_tmp_47) && (en_sub_tmp_0)) begin
			en_sub_4 <= 1'b1;
			data_in_sub_4 <= data_in_reg;
		end else begin
			en_sub_4 <= 1'b0;
			data_in_sub_4 <= 0;
		end
	end
	
   //----------------
	
	always @ (posedge CLK) begin
		if ((en_sub_tmp_47) && (en_sub_tmp_1)) begin
			en_sub_5 <= 1'b1;
			data_in_sub_5 <= data_in_reg;
		end else begin
			en_sub_5 <= 1'b0;
			data_in_sub_5 <= 0;
		end
	end
    //----------------
    
	
	always @ (posedge CLK) begin
		if ((en_sub_tmp_47) && (en_sub_tmp_2)) begin
			en_sub_6 <= 1'b1;
			data_in_sub_6 <= data_in_reg;
		end else begin
			en_sub_6 <= 1'b0;
			data_in_sub_6 <= 0;
		end
	end
	//--------------------

	
	always @ (posedge CLK) begin
		if ((en_sub_tmp_47) && (en_sub_tmp_3)) begin
			en_sub_7 <= 1'b1;
			data_in_sub_7 <= data_in_reg;
		end else begin
			en_sub_7 <= 1'b0;
			data_in_sub_7 <= 0;
		end
	end
	//--------------------
   ///////////////////////////////////////////////////////////////////////////////////////////////

    always @ (posedge CLK) begin
		if ((addr_reg[11:10]==2) ) begin
			en_sub_tmp_811 <= 1'b1;
		end else begin
			en_sub_tmp_811 <= 1'b0;
		end
	end
   //---------------------------------------------------------------------------------------------------
	
	
	always @ (posedge CLK) begin
		if ((en_sub_tmp_811) && (en_sub_tmp_0)) begin
			en_sub_8 <= 1'b1;
			data_in_sub_8 <= data_in_reg;
		end else begin
			en_sub_8 <= 1'b0;
			data_in_sub_8 <= 0;
		end
	end
	
   //----------------
	
	always @ (posedge CLK) begin
		if ((en_sub_tmp_811) && (en_sub_tmp_1)) begin
			en_sub_9 <= 1'b1;
			data_in_sub_9 <= data_in_reg;
		end else begin
			en_sub_9 <= 1'b0;
			data_in_sub_9 <= 0;
		end
	end
    //----------------
    
	
	always @ (posedge CLK) begin
		if ((en_sub_tmp_811) && (en_sub_tmp_2)) begin
			en_sub_10 <= 1'b1;
			data_in_sub_10 <= data_in_reg;
		end else begin
			en_sub_10 <= 1'b0;
			data_in_sub_10 <= 0;
		end
	end
	//--------------------

	
	always @ (posedge CLK) begin
		if ((en_sub_tmp_811) && (en_sub_tmp_3)) begin
			en_sub_11 <= 1'b1;
			data_in_sub_11 <= data_in_reg;
		end else begin
			en_sub_11 <= 1'b0;
			data_in_sub_11 <= 0;
		end
	end
	//--------------------


   ///////////////////////////////////////////////////////////////////////////////////////////////

    always @ (posedge CLK) begin
		if ((addr_reg[11:10]==3)) begin
			en_sub_tmp_1215 <= 1'b1;
		end else begin
			en_sub_tmp_1215 <= 1'b0;
		end
	end
   //---------------------------------------------------------------------------------------------------
	
	
	always @ (posedge CLK) begin
		if ((en_sub_tmp_1215) && (en_sub_tmp_0)) begin
			en_sub_12 <= 1'b1;
			data_in_sub_12 <= data_in_reg;
		end else begin
			en_sub_12 <= 1'b0;
			data_in_sub_12 <= 0;

		end
	end
	
   //----------------
	
	always @ (posedge CLK) begin
		if ((en_sub_tmp_1215) && (en_sub_tmp_1)) begin
			en_sub_13 <= 1'b1;
			data_in_sub_13 <= data_in_reg;
		end else begin
			en_sub_13 <= 1'b0;
			data_in_sub_13 <= 0;
		end
	end
    //----------------
    
	
	always @ (posedge CLK) begin
		if ((en_sub_tmp_1215) && (en_sub_tmp_2)) begin
			en_sub_14 <= 1'b1;
			data_in_sub_14 <= data_in_reg;
		end else begin
			en_sub_14 <= 1'b0;
			data_in_sub_14 <= 0;
		end
	end
	//--------------------

	
	always @ (posedge CLK) begin
		if ((en_sub_tmp_1215) && (en_sub_tmp_3)) begin
			en_sub_15 <= 1'b1;
			data_in_sub_15 <= data_in_reg;
		end else begin
			en_sub_15 <= 1'b0;
			data_in_sub_15 <= 0;
		end
	end
	//--------------------

   ///////////////////////////////////////////////////////////////////////////////////////////////

  
   ///////////////////////////////////////////////////////////////////////////////////////////////
   ///////////////////////////////////////////////////////////////////////////////////////////////
   ///////////////////////////////////////////////////////////////////////////////////////////////
   //////////////////////////////////////////////////////////////////////////////////////////////


   /////////////////////////////////////WEWEWEWEWEWEWE//////////////////////////////////////////
	
	always @ (posedge CLK) begin
		if ((addr_reg[11:10]==0) ) begin
			we_sub_tmp_03 <= 1'b1;
		end else begin
			we_sub_tmp_03 <= 1'b0;
		end
	end
   //---------------------------------------------------------------------------------------------------
	always @ (posedge CLK) begin
		if ((we_reg) && (addr_reg[9:8]==0)) begin
			we_sub_tmp_0 <= 1'b1;
		end else begin
			we_sub_tmp_0 <= 1'b0;
		end
	end
	
	always @ (posedge CLK) begin
		if ((we_sub_tmp_03) && (we_sub_tmp_0)) begin
			we_sub_0 <= 1'b1;
		end else begin
			we_sub_0 <= 1'b0;
		end
	end
	
   //----------------
   always @ (posedge CLK) begin
		if ((we_reg) && (addr_reg[9:8]==1)) begin
			we_sub_tmp_1 <= 1'b1;
		end else begin
			we_sub_tmp_1 <= 1'b0;
		end
	end
	
	always @ (posedge CLK) begin
		if ((we_sub_tmp_03) && (we_sub_tmp_1)) begin
			we_sub_1 <= 1'b1;
		end else begin
			we_sub_1 <= 1'b0;
		end
	end
    //----------------
    
	always @ (posedge CLK) begin
		if ((we_reg) && (addr_reg[9:8]==2)) begin
			we_sub_tmp_2 <= 1'b1;
		end else begin
			we_sub_tmp_2 <= 1'b0;
		end
	end
	
	always @ (posedge CLK) begin
		if ((we_sub_tmp_03) && (we_sub_tmp_2)) begin
			we_sub_2 <= 1'b1;
		end else begin
			we_sub_2 <= 1'b0;
		end
	end
	//--------------------

    always @ (posedge CLK) begin
		if ((we_reg) && (addr_reg[9:8]==3)) begin
			we_sub_tmp_3 <= 1'b1;
		end else begin
			we_sub_tmp_3 <= 1'b0;
		end
	end
	
	always @ (posedge CLK) begin
		if ((we_sub_tmp_03) && (we_sub_tmp_3)) begin
			we_sub_3 <= 1'b1;
		end else begin
			we_sub_3 <= 1'b0;
		end
	end
	//--------------------

   ///////////////////////////////////////////////////////////////////////////////////////////////

  always @ (posedge CLK) begin
		if ((addr_reg[11:10]==1) ) begin
			we_sub_tmp_47 <= 1'b1;
		end else begin
			we_sub_tmp_47 <= 1'b0;
		end
	end
   //---------------------------------------------------------------------------------------------------
	
	
	always @ (posedge CLK) begin
		if ((we_sub_tmp_47) && (we_sub_tmp_0)) begin
			we_sub_4 <= 1'b1;
		end else begin
			we_sub_4 <= 1'b0;
		end
	end
	
   //----------------
	
	always @ (posedge CLK) begin
		if ((we_sub_tmp_47) && (we_sub_tmp_1)) begin
			we_sub_5 <= 1'b1;
		end else begin
			we_sub_5 <= 1'b0;
		end
	end
    //----------------
    
	
	always @ (posedge CLK) begin
		if ((we_sub_tmp_47) && (we_sub_tmp_2)) begin
			we_sub_6 <= 1'b1;
		end else begin
			we_sub_6 <= 1'b0;
		end
	end
	//--------------------

	
	always @ (posedge CLK) begin
		if ((we_sub_tmp_47) && (we_sub_tmp_3)) begin
			we_sub_7 <= 1'b1;
		end else begin
			we_sub_7 <= 1'b0;
		end
	end
	//--------------------
   ///////////////////////////////////////////////////////////////////////////////////////////////

    always @ (posedge CLK) begin
		if ((addr_reg[11:10]==2) ) begin
			we_sub_tmp_811 <= 1'b1;
		end else begin
			we_sub_tmp_811 <= 1'b0;
		end
	end
   //---------------------------------------------------------------------------------------------------
	
	
	always @ (posedge CLK) begin
		if ((we_sub_tmp_811) && (we_sub_tmp_0)) begin
			we_sub_8 <= 1'b1;
		end else begin
			we_sub_8 <= 1'b0;
		end
	end
	
   //----------------
	
	always @ (posedge CLK) begin
		if ((we_sub_tmp_811) && (we_sub_tmp_1)) begin
			we_sub_9 <= 1'b1;
		end else begin
			we_sub_9 <= 1'b0;
		end
	end
    //----------------
    
	
	always @ (posedge CLK) begin
		if ((we_sub_tmp_811) && (we_sub_tmp_2)) begin
			we_sub_10 <= 1'b1;
		end else begin
			we_sub_10 <= 1'b0;
		end
	end
	//--------------------

	
	always @ (posedge CLK) begin
		if ((we_sub_tmp_811) && (we_sub_tmp_3)) begin
			we_sub_11 <= 1'b1;
		end else begin
			we_sub_11 <= 1'b0;
		end
	end
	//--------------------


   ///////////////////////////////////////////////////////////////////////////////////////////////

    always @ (posedge CLK) begin
		if ((addr_reg[11:10]==3) ) begin
			we_sub_tmp_1215 <= 1'b1;
		end else begin
			we_sub_tmp_1215 <= 1'b0;
		end
	end
   //---------------------------------------------------------------------------------------------------
	
	
	always @ (posedge CLK) begin
		if ((we_sub_tmp_1215) && (we_sub_tmp_0)) begin
			we_sub_12 <= 1'b1;
		end else begin
			we_sub_12 <= 1'b0;
		end
	end
	
   //----------------
	
	always @ (posedge CLK) begin
		if ((we_sub_tmp_1215) && (we_sub_tmp_1)) begin
			we_sub_13 <= 1'b1;
		end else begin
			we_sub_13 <= 1'b0;
		end
	end
    //----------------
    
	
	always @ (posedge CLK) begin
		if ((we_sub_tmp_1215) && (we_sub_tmp_2)) begin
			we_sub_14 <= 1'b1;
		end else begin
			we_sub_14 <= 1'b0;
		end
	end
	//--------------------

	
	always @ (posedge CLK) begin
		if ((we_sub_tmp_1215) && (we_sub_tmp_3)) begin
			we_sub_15 <= 1'b1;
		end else begin
			we_sub_15 <= 1'b0;
		end
	end
	//--------------------

 

endmodule


