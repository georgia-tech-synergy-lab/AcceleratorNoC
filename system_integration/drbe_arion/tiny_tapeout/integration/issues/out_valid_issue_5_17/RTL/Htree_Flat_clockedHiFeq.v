module Htree_Flat(
	CLK,
	addr,
	en, 
	we,
	data_in, 

	en_sub_0, en_sub_1, en_sub_2, en_sub_3, en_sub_4, en_sub_5, en_sub_6, en_sub_7, en_sub_8, en_sub_9, en_sub_10, en_sub_11, en_sub_12, en_sub_13, en_sub_14, en_sub_15,
	en_sub_16, en_sub_17, en_sub_18, en_sub_19, en_sub_20, en_sub_21, en_sub_22, en_sub_23, en_sub_24, en_sub_25, en_sub_26, en_sub_27, en_sub_28, en_sub_29, en_sub_30, en_sub_31,
	en_sub_32, en_sub_33, en_sub_34, en_sub_35, en_sub_36, en_sub_37, en_sub_38, en_sub_39, en_sub_40, en_sub_41, en_sub_42, en_sub_43, en_sub_44, en_sub_45, en_sub_46, en_sub_47,
	en_sub_48, en_sub_49, en_sub_50, en_sub_51, en_sub_52, en_sub_53, en_sub_54, en_sub_55, en_sub_56, en_sub_57, en_sub_58, en_sub_59, en_sub_60, en_sub_61, en_sub_62, en_sub_63,
    
	we_sub_0, we_sub_1, we_sub_2, we_sub_3, we_sub_4, we_sub_5, we_sub_6, we_sub_7, we_sub_8, we_sub_9, we_sub_10, we_sub_11, we_sub_12, we_sub_13, we_sub_14, we_sub_15,
	we_sub_16, we_sub_17, we_sub_18, we_sub_19, we_sub_20, we_sub_21, we_sub_22, we_sub_23, we_sub_24, we_sub_25, we_sub_26, we_sub_27, we_sub_28, we_sub_29, we_sub_30, we_sub_31,
	we_sub_32, we_sub_33, we_sub_34, we_sub_35, we_sub_36, we_sub_37, we_sub_38, we_sub_39, we_sub_40, we_sub_41, we_sub_42, we_sub_43, we_sub_44, we_sub_45, we_sub_46, we_sub_47,
	we_sub_48, we_sub_49, we_sub_50, we_sub_51, we_sub_52, we_sub_53, we_sub_54, we_sub_55, we_sub_56, we_sub_57, we_sub_58, we_sub_59, we_sub_60, we_sub_61, we_sub_62, we_sub_63,

	data_in_sub_0, data_in_sub_1, data_in_sub_2, data_in_sub_3, data_in_sub_4, data_in_sub_5, data_in_sub_6, data_in_sub_7, data_in_sub_8, data_in_sub_9, data_in_sub_10, data_in_sub_11, data_in_sub_12, data_in_sub_13, data_in_sub_14, data_in_sub_15,
	data_in_sub_16, data_in_sub_17, data_in_sub_18, data_in_sub_19, data_in_sub_20, data_in_sub_21, data_in_sub_22, data_in_sub_23, data_in_sub_24, data_in_sub_25, data_in_sub_26, data_in_sub_27, data_in_sub_28, data_in_sub_29, data_in_sub_30, data_in_sub_31,
	data_in_sub_32, data_in_sub_33, data_in_sub_34, data_in_sub_35, data_in_sub_36, data_in_sub_37, data_in_sub_38, data_in_sub_39, data_in_sub_40, data_in_sub_41, data_in_sub_42, data_in_sub_43, data_in_sub_44, data_in_sub_45, data_in_sub_46, data_in_sub_47,
	data_in_sub_48, data_in_sub_49, data_in_sub_50, data_in_sub_51, data_in_sub_52, data_in_sub_53, data_in_sub_54, data_in_sub_55, data_in_sub_56, data_in_sub_57, data_in_sub_58, data_in_sub_59, data_in_sub_60, data_in_sub_61, data_in_sub_62, data_in_sub_63,
	
	data_out_sub_0, data_out_sub_1, data_out_sub_2, data_out_sub_3, data_out_sub_4, data_out_sub_5, data_out_sub_6, data_out_sub_7, data_out_sub_8, data_out_sub_9, data_out_sub_10, data_out_sub_11, data_out_sub_12, data_out_sub_13, data_out_sub_14, data_out_sub_15,
	data_out_sub_16, data_out_sub_17, data_out_sub_18, data_out_sub_19, data_out_sub_20, data_out_sub_21, data_out_sub_22, data_out_sub_23, data_out_sub_24, data_out_sub_25, data_out_sub_26, data_out_sub_27, data_out_sub_28, data_out_sub_29, data_out_sub_30, data_out_sub_31,
	data_out_sub_32, data_out_sub_33, data_out_sub_34, data_out_sub_35, data_out_sub_36, data_out_sub_37, data_out_sub_38, data_out_sub_39, data_out_sub_40, data_out_sub_41, data_out_sub_42, data_out_sub_43, data_out_sub_44, data_out_sub_45, data_out_sub_46, data_out_sub_47,
	data_out_sub_48, data_out_sub_49, data_out_sub_50, data_out_sub_51, data_out_sub_52, data_out_sub_53, data_out_sub_54, data_out_sub_55, data_out_sub_56, data_out_sub_57, data_out_sub_58, data_out_sub_59, data_out_sub_60, data_out_sub_61, data_out_sub_62, data_out_sub_63
	
	);

	
	parameter BusWidth = 32;

	/////////////////////////////
	// write_IO_information()
	/////////////////////////////

	input CLK;
	input [13:0] addr; //(6+2)+2+2+2
	input we;
    input en;
	input [BusWidth-1:0] data_in; 

	output reg en_sub_0, en_sub_1, en_sub_2, en_sub_3, en_sub_4, en_sub_5, en_sub_6, en_sub_7, en_sub_8, en_sub_9, en_sub_10, en_sub_11, en_sub_12, en_sub_13, en_sub_14, en_sub_15,
	en_sub_16, en_sub_17, en_sub_18, en_sub_19, en_sub_20, en_sub_21, en_sub_22, en_sub_23, en_sub_24, en_sub_25, en_sub_26, en_sub_27, en_sub_28, en_sub_29, en_sub_30, en_sub_31,
	en_sub_32, en_sub_33, en_sub_34, en_sub_35, en_sub_36, en_sub_37, en_sub_38, en_sub_39, en_sub_40, en_sub_41, en_sub_42, en_sub_43, en_sub_44, en_sub_45, en_sub_46, en_sub_47,
	en_sub_48, en_sub_49, en_sub_50, en_sub_51, en_sub_52, en_sub_53, en_sub_54, en_sub_55, en_sub_56, en_sub_57, en_sub_58, en_sub_59, en_sub_60, en_sub_61, en_sub_62, en_sub_63;
 
    output reg we_sub_0, we_sub_1, we_sub_2, we_sub_3, we_sub_4, we_sub_5, we_sub_6, we_sub_7, we_sub_8, we_sub_9, we_sub_10, we_sub_11, we_sub_12, we_sub_13, we_sub_14, we_sub_15,
	we_sub_16, we_sub_17, we_sub_18, we_sub_19, we_sub_20, we_sub_21, we_sub_22, we_sub_23, we_sub_24, we_sub_25, we_sub_26, we_sub_27, we_sub_28, we_sub_29, we_sub_30, we_sub_31,
	we_sub_32, we_sub_33, we_sub_34, we_sub_35, we_sub_36, we_sub_37, we_sub_38, we_sub_39, we_sub_40, we_sub_41, we_sub_42, we_sub_43, we_sub_44, we_sub_45, we_sub_46, we_sub_47,
	we_sub_48, we_sub_49, we_sub_50, we_sub_51, we_sub_52, we_sub_53, we_sub_54, we_sub_55, we_sub_56, we_sub_57, we_sub_58, we_sub_59, we_sub_60, we_sub_61, we_sub_62, we_sub_63;
   


	output reg[BusWidth-1:0] data_in_sub_0, data_in_sub_1, data_in_sub_2, data_in_sub_3, data_in_sub_4, data_in_sub_5, data_in_sub_6, data_in_sub_7, data_in_sub_8, data_in_sub_9, data_in_sub_10, data_in_sub_11, data_in_sub_12, data_in_sub_13, data_in_sub_14, data_in_sub_15,
	data_in_sub_16, data_in_sub_17, data_in_sub_18, data_in_sub_19, data_in_sub_20, data_in_sub_21, data_in_sub_22, data_in_sub_23, data_in_sub_24, data_in_sub_25, data_in_sub_26, data_in_sub_27, data_in_sub_28, data_in_sub_29, data_in_sub_30, data_in_sub_31,
	data_in_sub_32, data_in_sub_33, data_in_sub_34, data_in_sub_35, data_in_sub_36, data_in_sub_37, data_in_sub_38, data_in_sub_39, data_in_sub_40, data_in_sub_41, data_in_sub_42, data_in_sub_43, data_in_sub_44, data_in_sub_45, data_in_sub_46, data_in_sub_47,
	data_in_sub_48, data_in_sub_49, data_in_sub_50, data_in_sub_51, data_in_sub_52, data_in_sub_53, data_in_sub_54, data_in_sub_55, data_in_sub_56, data_in_sub_57, data_in_sub_58, data_in_sub_59, data_in_sub_60, data_in_sub_61, data_in_sub_62, data_in_sub_63;

	
	output reg [BusWidth-1:0] data_out_sub_0, data_out_sub_1, data_out_sub_2, data_out_sub_3, data_out_sub_4, data_out_sub_5, data_out_sub_6, data_out_sub_7, data_out_sub_8, data_out_sub_9, data_out_sub_10, data_out_sub_11, data_out_sub_12, data_out_sub_13, data_out_sub_14, data_out_sub_15,
	data_out_sub_16, data_out_sub_17, data_out_sub_18, data_out_sub_19, data_out_sub_20, data_out_sub_21, data_out_sub_22, data_out_sub_23, data_out_sub_24, data_out_sub_25, data_out_sub_26, data_out_sub_27, data_out_sub_28, data_out_sub_29, data_out_sub_30, data_out_sub_31,
	data_out_sub_32, data_out_sub_33, data_out_sub_34, data_out_sub_35, data_out_sub_36, data_out_sub_37, data_out_sub_38, data_out_sub_39, data_out_sub_40, data_out_sub_41, data_out_sub_42, data_out_sub_43, data_out_sub_44, data_out_sub_45, data_out_sub_46, data_out_sub_47,
	data_out_sub_48, data_out_sub_49, data_out_sub_50, data_out_sub_51, data_out_sub_52, data_out_sub_53, data_out_sub_54, data_out_sub_55, data_out_sub_56, data_out_sub_57, data_out_sub_58, data_out_sub_59, data_out_sub_60, data_out_sub_61, data_out_sub_62, data_out_sub_63;
    
	reg en_sub_tmp_0,en_sub_tmp_1,en_sub_tmp_2,en_sub_tmp_3;
	reg en_sub_tmp_03, en_sub_tmp_47, en_sub_tmp_811, en_sub_tmp_1215, en_sub_tmp_1619, en_sub_tmp_2023, en_sub_tmp_2427,en_sub_tmp_2831,
	en_sub_tmp_3235, en_sub_tmp_3639, en_sub_tmp_4043, en_sub_tmp_4447, en_sub_tmp_4851, en_sub_tmp_5255, en_sub_tmp_5659,en_sub_tmp_6063;
	
	reg we_sub_tmp_0,we_sub_tmp_1,we_sub_tmp_2,we_sub_tmp_3;
	reg we_sub_tmp_03, we_sub_tmp_47, we_sub_tmp_811, we_sub_tmp_1215, we_sub_tmp_1619, we_sub_tmp_2023, we_sub_tmp_2427,we_sub_tmp_2831,
	we_sub_tmp_3235, we_sub_tmp_3639, we_sub_tmp_4043, we_sub_tmp_4447, we_sub_tmp_4851, we_sub_tmp_5255, we_sub_tmp_5659,we_sub_tmp_6063;


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
		if ((addr_reg[11:10]==0) && (addr_reg[13:12]==0)) begin
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
			data_in_sub_8 <= 0;
		end
	end
	//--------------------

   ///////////////////////////////////////////////////////////////////////////////////////////////

  always @ (posedge CLK) begin
		if ((addr_reg[11:10]==1) && (addr_reg[13:12]==0)) begin
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
		if ((addr_reg[11:10]==2) && (addr_reg[13:12]==0)) begin
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
		if ((addr_reg[11:10]==3) && (addr_reg[13:12]==0)) begin
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
			data_in_sub_12 <= data_in_reg;

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

  always @ (posedge CLK) begin
		if ((addr_reg[11:10]==0) && (addr_reg[13:12]==1)) begin
			en_sub_tmp_1619 <= 1'b1;
			data_in_sub_0 <= data_in_reg;
		end else begin
			en_sub_tmp_1619 <= 1'b0;
			data_in_sub_0 <= 0;
		end
	end
   //---------------------------------------------------------------------------------------------------
	
	
	always @ (posedge CLK) begin
		if ((en_sub_tmp_1619) && (en_sub_tmp_0)) begin
			en_sub_16 <= 1'b1;
			data_in_sub_16 <= data_in_reg;
		end else begin
			en_sub_16 <= 1'b0;
			data_in_sub_16 <= 0;
		end
	end
	
   //----------------
	
	always @ (posedge CLK) begin
		if ((en_sub_tmp_1619) && (en_sub_tmp_1)) begin
			en_sub_17 <= 1'b1;
			data_in_sub_17 <= data_in_reg;
		end else begin
			en_sub_17 <= 1'b0;
			data_in_sub_17 <= 0;
		end
	end
    //----------------
    
	
	always @ (posedge CLK) begin
		if ((en_sub_tmp_1619) && (en_sub_tmp_2)) begin
			en_sub_18 <= 1'b1;
			data_in_sub_18 <= data_in_reg;
		end else begin
			en_sub_18 <= 1'b0;
			data_in_sub_18 <= 0;
		end
	end
	//--------------------

	
	always @ (posedge CLK) begin
		if ((en_sub_tmp_1619) && (en_sub_tmp_3)) begin
			en_sub_19 <= 1'b1;
			data_in_sub_19 <= data_in_reg;
		end else begin
			en_sub_19 <= 1'b0;
			data_in_sub_19 <= 0;
		end
	end
	//--------------------

   ///////////////////////////////////////////////////////////////////////////////////////////////

  always @ (posedge CLK) begin
		if ((addr_reg[11:10]==1) && (addr_reg[13:12]==1)) begin
			en_sub_tmp_2023 <= 1'b1;
		end else begin
			en_sub_tmp_2023 <= 1'b0;
		end
	end
   //---------------------------------------------------------------------------------------------------
	
	
	always @ (posedge CLK) begin
		if ((en_sub_tmp_2023) && (en_sub_tmp_0)) begin
			en_sub_20 <= 1'b1;
			data_in_sub_20 <= data_in_reg;
		end else begin
			en_sub_20 <= 1'b0;
			data_in_sub_20 <= 0;
		end
	end
	
   //----------------
	
	always @ (posedge CLK) begin
		if ((en_sub_tmp_2023) && (en_sub_tmp_1)) begin
			en_sub_21 <= 1'b1;
			data_in_sub_21 <= data_in_reg;
		end else begin
			en_sub_21 <= 1'b0;
			data_in_sub_21 <= 0;
		end
	end
    //----------------
    
	
	always @ (posedge CLK) begin
		if ((en_sub_tmp_2023) && (en_sub_tmp_2)) begin
			en_sub_22 <= 1'b1;
			data_in_sub_22 <= data_in_reg;
		end else begin
			en_sub_22 <= 1'b0;
			data_in_sub_22 <= 0;
		end
	end
	//--------------------

	
	always @ (posedge CLK) begin
		if ((en_sub_tmp_2023) && (en_sub_tmp_3)) begin
			en_sub_23 <= 1'b1;
			data_in_sub_23 <= data_in_reg;
		end else begin
			en_sub_23 <= 1'b0;
			data_in_sub_23 <= 0;
		end
	end
	//--------------------

   ///////////////////////////////////////////////////////////////////////////////////////////////

   always @ (posedge CLK) begin
		if ((addr_reg[11:10]==2) && (addr_reg[13:12]==1)) begin
			en_sub_tmp_2427 <= 1'b1;
		end else begin
			en_sub_tmp_2427 <= 1'b0;
		end
	end
   //---------------------------------------------------------------------------------------------------
	
	
	always @ (posedge CLK) begin
		if ((en_sub_tmp_2427) && (en_sub_tmp_0)) begin
			en_sub_24 <= 1'b1;
			data_in_sub_24 <= data_in_reg;
		end else begin
			en_sub_24 <= 1'b0;
			data_in_sub_24 <= 0;
		end
	end
	
   //----------------
	
	always @ (posedge CLK) begin
		if ((en_sub_tmp_2427) && (en_sub_tmp_1)) begin
			en_sub_25 <= 1'b1;
			data_in_sub_25 <= data_in_reg;
		end else begin
			en_sub_25 <= 1'b0;
			data_in_sub_25 <= 0;
		end
	end
    //----------------
    
	
	always @ (posedge CLK) begin
		if ((en_sub_tmp_2427) && (en_sub_tmp_2)) begin
			en_sub_26 <= 1'b1;
			data_in_sub_26 <= data_in_reg;
		end else begin
			en_sub_26 <= 1'b0;
			data_in_sub_26 <= 0;

		end
	end
	//--------------------

	
	always @ (posedge CLK) begin
		if ((en_sub_tmp_2427) && (en_sub_tmp_3)) begin
			en_sub_27 <= 1'b1;
			data_in_sub_27 <= data_in_reg;
		end else begin
			en_sub_27 <= 1'b0;
			data_in_sub_27 <= 0;
		end
	end
	//--------------------

   ///////////////////////////////////////////////////////////////////////////////////////////////
  
  always @ (posedge CLK) begin
		if ((addr_reg[11:10]==3) && (addr_reg[13:12]==1)) begin
			en_sub_tmp_2831 <= 1'b1;
			data_in_sub_0 <= data_in_reg;
		end else begin
			en_sub_tmp_2831 <= 1'b0;
			data_in_sub_0 <= 0;
		end
	end
   //---------------------------------------------------------------------------------------------------
	
	
	always @ (posedge CLK) begin
		if ((en_sub_tmp_2831) && (en_sub_tmp_0)) begin
			en_sub_28 <= 1'b1;
			data_in_sub_28 <= data_in_reg;
		end else begin
			en_sub_28 <= 1'b0;
			data_in_sub_28 <= 0;
		end
	end
	
   //----------------
	
	always @ (posedge CLK) begin
		if ((en_sub_tmp_2831) && (en_sub_tmp_1)) begin
			en_sub_29 <= 1'b1;
			data_in_sub_29 <= data_in_reg;
		end else begin
			en_sub_29 <= 1'b0;
			data_in_sub_29 <= 0;
		end
	end
    //----------------
    
	
	always @ (posedge CLK) begin
		if ((en_sub_tmp_2831) && (en_sub_tmp_2)) begin
			en_sub_30 <= 1'b1;
			data_in_sub_30 <= data_in_reg;
		end else begin
			en_sub_30 <= 1'b0;
			data_in_sub_30 <= 0;
		end
	end
	//--------------------

	
	always @ (posedge CLK) begin
		if ((en_sub_tmp_2831) && (en_sub_tmp_3)) begin
			en_sub_31 <= 1'b1;
			data_in_sub_31 <= data_in_reg;
		end else begin
			en_sub_31 <= 1'b0;
			data_in_sub_31 <= 0;
		end
	end
	//--------------------

   ///////////////////////////////////////////////////////////////////////////////////////////////

    always @ (posedge CLK) begin
		if ((addr_reg[11:10]==0) && (addr_reg[13:12]==2)) begin
			en_sub_tmp_3235 <= 1'b1;
			data_in_sub_0 <= data_in_reg;
		end else begin
			en_sub_tmp_3235 <= 1'b0;
			data_in_sub_0 <= 0;

		end
	end
   //---------------------------------------------------------------------------------------------------
	
	
	always @ (posedge CLK) begin
		if ((en_sub_tmp_3235) && (en_sub_tmp_0)) begin
			en_sub_32 <= 1'b1;
			data_in_sub_32 <= data_in_reg;
		end else begin
			en_sub_32 <= 1'b0;
			data_in_sub_32 <= 0;
		end
	end
	
   //----------------
	
	always @ (posedge CLK) begin
		if ((en_sub_tmp_3235) && (en_sub_tmp_1)) begin
			en_sub_33 <= 1'b1;
			data_in_sub_33 <= data_in_reg;
		end else begin
			en_sub_33 <= 1'b0;
			data_in_sub_33 <= 0;
		end
	end
    //----------------
    
	
	always @ (posedge CLK) begin
		if ((en_sub_tmp_3235) && (en_sub_tmp_2)) begin
			en_sub_34 <= 1'b1;
			data_in_sub_34 <= data_in_reg;
		end else begin
			en_sub_34 <= 1'b0;
			data_in_sub_34 <= 0;
		end
	end
	//--------------------

	
	always @ (posedge CLK) begin
		if ((en_sub_tmp_3235) && (en_sub_tmp_3)) begin
			en_sub_35 <= 1'b1;
			data_in_sub_35 <= data_in_reg;
		end else begin
			en_sub_35 <= 1'b0;
			data_in_sub_35 <= 0;
		end
	end
	//--------------------

   ///////////////////////////////////////////////////////////////////////////////////////////////
   always @ (posedge CLK) begin
		if ((addr_reg[11:10]==1) && (addr_reg[13:12]==2)) begin
			en_sub_tmp_3639 <= 1'b1;
			data_in_sub_0 <= data_in_reg;
		end else begin
			en_sub_tmp_3639 <= 1'b0;
			data_in_sub_0 <= 0;
		end
	end
   //---------------------------------------------------------------------------------------------------
	
	
	always @ (posedge CLK) begin
		if ((en_sub_tmp_3639) && (en_sub_tmp_0)) begin
			en_sub_36 <= 1'b1;
			data_in_sub_36 <= data_in_reg;
		end else begin
			en_sub_36 <= 1'b0;
			data_in_sub_36 <= 0;
		end
	end
	
   //----------------
	
	always @ (posedge CLK) begin
		if ((en_sub_tmp_3639) && (en_sub_tmp_1)) begin
			en_sub_37 <= 1'b1;
			data_in_sub_37 <= data_in_reg;
		end else begin
			en_sub_37 <= 1'b0;
			data_in_sub_37 <= 0;
		end
	end
    //----------------
    
	
	always @ (posedge CLK) begin
		if ((en_sub_tmp_3639) && (en_sub_tmp_2)) begin
			en_sub_38 <= 1'b1;
			data_in_sub_38 <= data_in_reg;
		end else begin
			en_sub_38 <= 1'b0;
			data_in_sub_38 <= 0;
		end
	end
	//--------------------

	
	always @ (posedge CLK) begin
		if ((en_sub_tmp_3639) && (en_sub_tmp_3)) begin
			en_sub_39 <= 1'b1;
			data_in_sub_39 <= data_in_reg;
		end else begin
			en_sub_39 <= 1'b0;
			data_in_sub_39 <= 0;
		end
	end
	//--------------------

   ///////////////////////////////////////////////////////////////////////////////////////////////

	always @ (posedge CLK) begin
		if ((addr_reg[11:10]==2) && (addr_reg[13:12]==2)) begin
			en_sub_tmp_4043 <= 1'b1;
		end else begin
			en_sub_tmp_4043 <= 1'b0;
		end
	end
   //---------------------------------------------------------------------------------------------------
	
	
	always @ (posedge CLK) begin
		if ((en_sub_tmp_4043) && (en_sub_tmp_0)) begin
			en_sub_40 <= 1'b1;
			data_in_sub_40 <= data_in_reg;
		end else begin
			en_sub_40 <= 1'b0;
			data_in_sub_40 <= 0;
		end
	end
	
   //----------------
	
	always @ (posedge CLK) begin
		if ((en_sub_tmp_4043) && (en_sub_tmp_1)) begin
			en_sub_41 <= 1'b1;
			data_in_sub_41 <= data_in_reg;
		end else begin
			en_sub_41 <= 1'b0;
			data_in_sub_41 <= 0;
		end
	end
    //----------------
    
	
	always @ (posedge CLK) begin
		if ((en_sub_tmp_4043) && (en_sub_tmp_2)) begin
			en_sub_42 <= 1'b1;
			data_in_sub_42 <= data_in_reg;
		end else begin
			en_sub_42 <= 1'b0;
			data_in_sub_42 <= 0;
		end
	end
	//--------------------

	
	always @ (posedge CLK) begin
		if ((en_sub_tmp_4043) && (en_sub_tmp_3)) begin
			en_sub_43 <= 1'b1;
			data_in_sub_43 <= data_in_reg;
		end else begin
			en_sub_43 <= 1'b0;
			data_in_sub_43 <= 0;

		end
	end
	//--------------------

   ///////////////////////////////////////////////////////////////////////////////////////////////

    always @ (posedge CLK) begin
		if ((addr_reg[11:10]==3) && (addr_reg[13:12]==2)) begin
			en_sub_tmp_4447 <= 1'b1;
		end else begin
			en_sub_tmp_4447 <= 1'b0;
		end
	end
   //---------------------------------------------------------------------------------------------------
	
	
	always @ (posedge CLK) begin
		if ((en_sub_tmp_4447) && (en_sub_tmp_0)) begin
			en_sub_44 <= 1'b1;
			data_in_sub_44 <= data_in_reg;
		end else begin
			en_sub_44 <= 1'b0;
			data_in_sub_44 <= 0;
		end
	end
	
   //----------------
	
	always @ (posedge CLK) begin
		if ((en_sub_tmp_4447) && (en_sub_tmp_1)) begin
			en_sub_45 <= 1'b1;
			data_in_sub_45 <= data_in_reg;
		end else begin
			en_sub_45 <= 1'b0;
			data_in_sub_45 <= data_in_reg;
		end
	end
    //----------------
    
	
	always @ (posedge CLK) begin
		if ((en_sub_tmp_4447) && (en_sub_tmp_2)) begin
			en_sub_46 <= 1'b1;
			data_in_sub_46 <= data_in_reg;
		end else begin
			en_sub_46 <= 1'b0;
			data_in_sub_46 <= 0;
		end
	end
	//--------------------

	
	always @ (posedge CLK) begin
		if ((en_sub_tmp_4447) && (en_sub_tmp_3)) begin
			en_sub_47 <= 1'b1;
			data_in_sub_47 <= data_in_reg;

		end else begin
			en_sub_47 <= 1'b0;
			data_in_sub_47 <= 0;

		end
	end
	//--------------------

   ///////////////////////////////////////////////////////////////////////////////////////////////



   always @ (posedge CLK) begin
		if ((addr_reg[11:10]==0) && (addr_reg[13:12]==3)) begin
			en_sub_tmp_4851 <= 1'b1;
		end else begin
			en_sub_tmp_4851 <= 1'b0;
		end
	end
   //---------------------------------------------------------------------------------------------------
	
	
	always @ (posedge CLK) begin
		if ((en_sub_tmp_4851) && (en_sub_tmp_0)) begin
			en_sub_48<= 1'b1;
			data_in_sub_48 <= data_in_reg;

		end else begin
			en_sub_48 <= 1'b0;
			data_in_sub_48 <= 0;

		end
	end
	
   //----------------
	
	always @ (posedge CLK) begin
		if ((en_sub_tmp_4851) && (en_sub_tmp_1)) begin
			en_sub_49 <= 1'b1;
			data_in_sub_49 <= data_in_reg;
		end else begin
			en_sub_49 <= 1'b0;
			data_in_sub_49 <= 0;
		end
	end
    //----------------
    
	
	always @ (posedge CLK) begin
		if ((en_sub_tmp_4851) && (en_sub_tmp_2)) begin
			en_sub_50 <= 1'b1;
			data_in_sub_50 <= data_in_reg;
		end else begin
			en_sub_50 <= 1'b0;
			data_in_sub_50 <= 0;
		end
	end
	//--------------------

	
	always @ (posedge CLK) begin
		if ((en_sub_tmp_4851) && (en_sub_tmp_3)) begin
			en_sub_51 <= 1'b1;
			data_in_sub_51 <= data_in_reg;
		end else begin
			en_sub_51 <= 1'b0;
			data_in_sub_51 <= 0;
		end
	end
	//--------------------

   ///////////////////////////////////////////////////////////////////////////////////////////////
   always @ (posedge CLK) begin
		if ((addr_reg[11:10]==1) && (addr_reg[13:12]==3)) begin
			en_sub_tmp_5255 <= 1'b1;
		end else begin
			en_sub_tmp_5255 <= 1'b0;
		end
	end
   //---------------------------------------------------------------------------------------------------
	
	
	always @ (posedge CLK) begin
		if ((en_sub_tmp_5255) && (en_sub_tmp_0)) begin
			en_sub_52 <= 1'b1;
			data_in_sub_52 <= data_in_reg;
		end else begin
			en_sub_52 <= 1'b0;
			data_in_sub_52 <= 0;
		end
	end
	
   //----------------
	
	always @ (posedge CLK) begin
		if ((en_sub_tmp_5255) && (en_sub_tmp_1)) begin
			en_sub_53 <= 1'b1;
			data_in_sub_53 <= data_in_reg;
		end else begin
			en_sub_53 <= 1'b0;
			data_in_sub_53 <= 0;
		end
	end
    //----------------
    
	
	always @ (posedge CLK) begin
		if ((en_sub_tmp_5255) && (en_sub_tmp_2)) begin
			en_sub_54 <= 1'b1;
			data_in_sub_54 <= data_in_reg;
		end else begin
			en_sub_54 <= 1'b0;
			data_in_sub_54 <= 0;
		end
	end
	//--------------------

	
	always @ (posedge CLK) begin
		if ((en_sub_tmp_5255) && (en_sub_tmp_3)) begin
			en_sub_55 <= 1'b1;
			data_in_sub_55 <= data_in_reg;
		end else begin
			en_sub_55 <= 1'b0;
			data_in_sub_55 <= 0;
		end
	end
	//--------------------

   ///////////////////////////////////////////////////////////////////////////////////////////////

    always @ (posedge CLK) begin
		if ((addr_reg[11:10]==2) && (addr_reg[13:12]==3)) begin
			en_sub_tmp_5659 <= 1'b1;
		end else begin
			en_sub_tmp_5659 <= 1'b0;
		end
	end
   //---------------------------------------------------------------------------------------------------
	
	
	always @ (posedge CLK) begin
		if ((en_sub_tmp_5659) && (en_sub_tmp_0)) begin
			en_sub_56 <= 1'b1;
			data_in_sub_56 <= data_in_reg;
		end else begin
			en_sub_56 <= 1'b0;
			data_in_sub_56 <= 0;
		end
	end
	
   //----------------
	
	always @ (posedge CLK) begin
		if ((en_sub_tmp_5659) && (en_sub_tmp_1)) begin
			en_sub_57 <= 1'b1;
			data_in_sub_57 <= data_in_reg;
		end else begin
			en_sub_57 <= 1'b0;
			data_in_sub_57 <= 0;	
		end
	end
    //----------------
    
	
	always @ (posedge CLK) begin
		if ((en_sub_tmp_5659) && (en_sub_tmp_2)) begin
			en_sub_58 <= 1'b1;
			data_in_sub_58 <= data_in_reg;
		end else begin
			en_sub_58 <= 1'b0;
			data_in_sub_58 <= 0;
		end
	end
	//--------------------

	
	always @ (posedge CLK) begin
		if ((en_sub_tmp_5659) && (en_sub_tmp_3)) begin
			en_sub_59 <= 1'b1;
			data_in_sub_59 <= data_in_reg;
		end else begin
			en_sub_59 <= 1'b0;
			data_in_sub_59 <= 0;
		end
	end
	//--------------------

   ///////////////////////////////////////////////////////////////////////////////////////////////

  always @ (posedge CLK) begin
		if ((addr_reg[11:10]==3) && (addr_reg[13:12]==3)) begin
			en_sub_tmp_6063 <= 1'b1;
		end else begin
			en_sub_tmp_6063 <= 1'b0;
		end
	end
   //---------------------------------------------------------------------------------------------------
	
	
	always @ (posedge CLK) begin
		if ((en_sub_tmp_6063) && (en_sub_tmp_0)) begin
			en_sub_60 <= 1'b1;
			data_in_sub_60 <= data_in_reg;
		end else begin
			en_sub_60 <= 1'b0;
			data_in_sub_60 <= 0;
		end
	end
	
   //----------------
	
	always @ (posedge CLK) begin
		if ((en_sub_tmp_6063) && (en_sub_tmp_1)) begin
			en_sub_61 <= 1'b1;
			data_in_sub_61 <= data_in_reg;
		end else begin
			en_sub_61 <= 1'b0;
			data_in_sub_61 <= 0;
		end
	end
    //----------------
    
	
	always @ (posedge CLK) begin
		if ((en_sub_tmp_6063) && (en_sub_tmp_2)) begin
			en_sub_62 <= 1'b1;
			data_in_sub_62 <= data_in_reg;
		end else begin
			en_sub_62 <= 1'b0;
			data_in_sub_62 <= 0;
		end
	end
	//--------------------

	
	always @ (posedge CLK) begin
		if ((en_sub_tmp_6063) && (en_sub_tmp_3)) begin
			en_sub_63 <= 1'b1;
			data_in_sub_63 <= data_in_reg;
		end else begin
			en_sub_63 <= 1'b0;
			data_in_sub_63 <= 0;
		end
	end
	//--------------------

   ///////////////////////////////////////////////////////////////////////////////////////////////
   ///////////////////////////////////////////////////////////////////////////////////////////////
   ///////////////////////////////////////////////////////////////////////////////////////////////
   //////////////////////////////////////////////////////////////////////////////////////////////


   /////////////////////////////////////WEWEWEWEWEWEWE//////////////////////////////////////////
	
	always @ (posedge CLK) begin
		if ((addr_reg[11:10]==0) && (addr_reg[13:12]==0)) begin
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
		if ((addr_reg[11:10]==1) && (addr_reg[13:12]==0)) begin
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
		if ((addr_reg[11:10]==2) && (addr_reg[13:12]==0)) begin
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
		if ((addr_reg[11:10]==3) && (addr_reg[13:12]==0)) begin
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

   ///////////////////////////////////////////////////////////////////////////////////////////////

  always @ (posedge CLK) begin
		if ((addr_reg[11:10]==0) && (addr_reg[13:12]==1)) begin
			we_sub_tmp_1619 <= 1'b1;
		end else begin
			we_sub_tmp_1619 <= 1'b0;
		end
	end
   //---------------------------------------------------------------------------------------------------
	
	
	always @ (posedge CLK) begin
		if ((we_sub_tmp_1619) && (we_sub_tmp_0)) begin
			we_sub_16 <= 1'b1;
		end else begin
			we_sub_16 <= 1'b0;
		end
	end
	
   //----------------
	
	always @ (posedge CLK) begin
		if ((we_sub_tmp_1619) && (we_sub_tmp_1)) begin
			we_sub_17 <= 1'b1;
		end else begin
			we_sub_17 <= 1'b0;
		end
	end
    //----------------
    
	
	always @ (posedge CLK) begin
		if ((we_sub_tmp_1619) && (we_sub_tmp_2)) begin
			we_sub_18 <= 1'b1;
		end else begin
			we_sub_18 <= 1'b0;
		end
	end
	//--------------------

	
	always @ (posedge CLK) begin
		if ((we_sub_tmp_1619) && (we_sub_tmp_3)) begin
			we_sub_19 <= 1'b1;
		end else begin
			we_sub_19 <= 1'b0;
		end
	end
	//--------------------

   ///////////////////////////////////////////////////////////////////////////////////////////////

  always @ (posedge CLK) begin
		if ((addr_reg[11:10]==1) && (addr_reg[13:12]==1)) begin
			we_sub_tmp_2023 <= 1'b1;
		end else begin
			we_sub_tmp_2023 <= 1'b0;
		end
	end
   //---------------------------------------------------------------------------------------------------
	
	
	always @ (posedge CLK) begin
		if ((we_sub_tmp_2023) && (we_sub_tmp_0)) begin
			we_sub_20 <= 1'b1;
		end else begin
			en_sub_20 <= 1'b0;
		end
	end
	
   //----------------
	
	always @ (posedge CLK) begin
		if ((we_sub_tmp_2023) && (we_sub_tmp_1)) begin
			we_sub_21 <= 1'b1;
		end else begin
			we_sub_21 <= 1'b0;
		end
	end
    //----------------
    
	
	always @ (posedge CLK) begin
		if ((we_sub_tmp_2023) && (we_sub_tmp_2)) begin
			we_sub_22 <= 1'b1;
		end else begin
			we_sub_22 <= 1'b0;
		end
	end
	//--------------------

	
	always @ (posedge CLK) begin
		if ((we_sub_tmp_2023) && (we_sub_tmp_3)) begin
			we_sub_23 <= 1'b1;
		end else begin
			we_sub_23 <= 1'b0;
		end
	end
	//--------------------

   ///////////////////////////////////////////////////////////////////////////////////////////////

   always @ (posedge CLK) begin
		if ((addr_reg[11:10]==2) && (addr_reg[13:12]==1)) begin
			we_sub_tmp_2427 <= 1'b1;
		end else begin
			we_sub_tmp_2427 <= 1'b0;
		end
	end
   //---------------------------------------------------------------------------------------------------
	
	
	always @ (posedge CLK) begin
		if ((we_sub_tmp_2427) && (we_sub_tmp_0)) begin
			we_sub_24 <= 1'b1;
		end else begin
			we_sub_24 <= 1'b0;
		end
	end
	
   //----------------
	
	always @ (posedge CLK) begin
		if ((we_sub_tmp_2427) && (we_sub_tmp_1)) begin
			we_sub_25 <= 1'b1;
		end else begin
			we_sub_25 <= 1'b0;
		end
	end
    //----------------
    
	
	always @ (posedge CLK) begin
		if ((we_sub_tmp_2427) && (we_sub_tmp_2)) begin
			we_sub_26 <= 1'b1;
		end else begin
			we_sub_26 <= 1'b0;
		end
	end
	//--------------------

	
	always @ (posedge CLK) begin
		if ((we_sub_tmp_2427) && (we_sub_tmp_3)) begin
			we_sub_27 <= 1'b1;
		end else begin
			we_sub_27 <= 1'b0;
		end
	end
	//--------------------

   ///////////////////////////////////////////////////////////////////////////////////////////////
  
  always @ (posedge CLK) begin
		if ((addr_reg[11:10]==3) && (addr_reg[13:12]==1)) begin
			we_sub_tmp_2831 <= 1'b1;
		end else begin
			we_sub_tmp_2831 <= 1'b0;
		end
	end
   //---------------------------------------------------------------------------------------------------
	
	
	always @ (posedge CLK) begin
		if ((we_sub_tmp_2831) && (we_sub_tmp_0)) begin
			we_sub_28 <= 1'b1;
		end else begin
			we_sub_28 <= 1'b0;
		end
	end
	
   //----------------
	
	always @ (posedge CLK) begin
		if ((we_sub_tmp_2831) && (we_sub_tmp_1)) begin
			we_sub_29 <= 1'b1;
		end else begin
			we_sub_29 <= 1'b0;
		end
	end
    //----------------
    
	
	always @ (posedge CLK) begin
		if ((we_sub_tmp_2831) && (we_sub_tmp_2)) begin
			we_sub_30 <= 1'b1;
		end else begin
			we_sub_30 <= 1'b0;
		end
	end
	//--------------------

	
	always @ (posedge CLK) begin
		if ((we_sub_tmp_2831) && (we_sub_tmp_3)) begin
			we_sub_31 <= 1'b1;
		end else begin
			we_sub_31 <= 1'b0;
		end
	end
	//--------------------

   ///////////////////////////////////////////////////////////////////////////////////////////////

    always @ (posedge CLK) begin
		if ((addr_reg[11:10]==0) && (addr_reg[13:12]==2)) begin
			we_sub_tmp_3235 <= 1'b1;
		end else begin
			we_sub_tmp_3235 <= 1'b0;
		end
	end
   //---------------------------------------------------------------------------------------------------
	
	
	always @ (posedge CLK) begin
		if ((we_sub_tmp_3235) && (we_sub_tmp_0)) begin
			we_sub_32 <= 1'b1;
		end else begin
			we_sub_32 <= 1'b0;
		end
	end
	
   //----------------
	
	always @ (posedge CLK) begin
		if ((we_sub_tmp_3235) && (we_sub_tmp_1)) begin
			we_sub_33 <= 1'b1;
		end else begin
			we_sub_33 <= 1'b0;
		end
	end
    //----------------
    
	
	always @ (posedge CLK) begin
		if ((we_sub_tmp_3235) && (we_sub_tmp_2)) begin
			we_sub_34 <= 1'b1;
		end else begin
			we_sub_34 <= 1'b0;
		end
	end
	//--------------------

	
	always @ (posedge CLK) begin
		if ((we_sub_tmp_3235) && (we_sub_tmp_3)) begin
			we_sub_35 <= 1'b1;
		end else begin
			we_sub_35 <= 1'b0;
		end
	end
	//--------------------

   ///////////////////////////////////////////////////////////////////////////////////////////////
   always @ (posedge CLK) begin
		if ((addr_reg[11:10]==1) && (addr_reg[13:12]==2)) begin
			we_sub_tmp_3639 <= 1'b1;
		end else begin
			we_sub_tmp_3639 <= 1'b0;
		end
	end
   //---------------------------------------------------------------------------------------------------
	
	
	always @ (posedge CLK) begin
		if ((we_sub_tmp_3639) && (we_sub_tmp_0)) begin
			we_sub_36 <= 1'b1;
		end else begin
			we_sub_36 <= 1'b0;
		end
	end
	
   //----------------
	
	always @ (posedge CLK) begin
		if ((we_sub_tmp_3639) && (we_sub_tmp_1)) begin
			we_sub_37 <= 1'b1;
		end else begin
			we_sub_37 <= 1'b0;
		end
	end
    //----------------
    
	
	always @ (posedge CLK) begin
		if ((we_sub_tmp_3639) && (we_sub_tmp_2)) begin
			we_sub_38 <= 1'b1;
		end else begin
			we_sub_38 <= 1'b0;
		end
	end
	//--------------------

	
	always @ (posedge CLK) begin
		if ((we_sub_tmp_3639) && (we_sub_tmp_3)) begin
			we_sub_39 <= 1'b1;
		end else begin
			we_sub_39 <= 1'b0;
		end
	end
	//--------------------

   ///////////////////////////////////////////////////////////////////////////////////////////////

	always @ (posedge CLK) begin
		if ((addr_reg[11:10]==2) && (addr_reg[13:12]==2)) begin
			we_sub_tmp_4043 <= 1'b1;
		end else begin
			we_sub_tmp_4043 <= 1'b0;
		end
	end
   //---------------------------------------------------------------------------------------------------
	
	
	always @ (posedge CLK) begin
		if ((we_sub_tmp_4043) && (we_sub_tmp_0)) begin
			we_sub_40 <= 1'b1;
		end else begin
			we_sub_40 <= 1'b0;
		end
	end
	
   //----------------
	
	always @ (posedge CLK) begin
		if ((we_sub_tmp_4043) && (we_sub_tmp_1)) begin
			we_sub_41 <= 1'b1;
		end else begin
			we_sub_41 <= 1'b0;
		end
	end
    //----------------
    
	
	always @ (posedge CLK) begin
		if ((we_sub_tmp_4043) && (we_sub_tmp_2)) begin
			we_sub_42 <= 1'b1;
		end else begin
			we_sub_42 <= 1'b0;
		end
	end
	//--------------------

	
	always @ (posedge CLK) begin
		if ((we_sub_tmp_4043) && (we_sub_tmp_3)) begin
			we_sub_43 <= 1'b1;
		end else begin
			we_sub_43 <= 1'b0;
		end
	end
	//--------------------

   ///////////////////////////////////////////////////////////////////////////////////////////////

    always @ (posedge CLK) begin
		if ((addr_reg[11:10]==3) && (addr_reg[13:12]==2)) begin
			we_sub_tmp_4447 <= 1'b1;
		end else begin
			we_sub_tmp_4447 <= 1'b0;
		end
	end
   //---------------------------------------------------------------------------------------------------
	
	
	always @ (posedge CLK) begin
		if ((we_sub_tmp_4447) && (we_sub_tmp_0)) begin
			we_sub_44 <= 1'b1;
		end else begin
			we_sub_44 <= 1'b0;
		end
	end
	
   //----------------
	
	always @ (posedge CLK) begin
		if ((we_sub_tmp_4447) && (we_sub_tmp_1)) begin
			we_sub_45 <= 1'b1;
		end else begin
			we_sub_45 <= 1'b0;
		end
	end
    //----------------
    
	
	always @ (posedge CLK) begin
		if ((we_sub_tmp_4447) && (we_sub_tmp_2)) begin
			we_sub_46 <= 1'b1;
		end else begin
			we_sub_46 <= 1'b0;
		end
	end
	//--------------------

	
	always @ (posedge CLK) begin
		if ((we_sub_tmp_4447) && (we_sub_tmp_3)) begin
			we_sub_47 <= 1'b1;
		end else begin
			we_sub_47 <= 1'b0;
		end
	end
	//--------------------

   ///////////////////////////////////////////////////////////////////////////////////////////////



   always @ (posedge CLK) begin
		if ((addr_reg[11:10]==0) && (addr_reg[13:12]==3)) begin
			we_sub_tmp_4851 <= 1'b1;
		end else begin
			we_sub_tmp_4851 <= 1'b0;
		end
	end
   //---------------------------------------------------------------------------------------------------
	
	
	always @ (posedge CLK) begin
		if ((we_sub_tmp_4851) && (we_sub_tmp_0)) begin
			we_sub_48<= 1'b1;
		end else begin
			we_sub_48 <= 1'b0;
		end
	end
	
   //----------------
	
	always @ (posedge CLK) begin
		if ((we_sub_tmp_4851) && (we_sub_tmp_1)) begin
			we_sub_49 <= 1'b1;
		end else begin
			we_sub_49 <= 1'b0;
		end
	end
    //----------------
    
	
	always @ (posedge CLK) begin
		if ((we_sub_tmp_4851) && (we_sub_tmp_2)) begin
			we_sub_50 <= 1'b1;
		end else begin
			we_sub_50 <= 1'b0;
		end
	end
	//--------------------

	
	always @ (posedge CLK) begin
		if ((we_sub_tmp_4851) && (we_sub_tmp_3)) begin
			we_sub_51 <= 1'b1;
		end else begin
			we_sub_51 <= 1'b0;
		end
	end
	//--------------------

   ///////////////////////////////////////////////////////////////////////////////////////////////
   always @ (posedge CLK) begin
		if ((addr_reg[11:10]==1) && (addr_reg[13:12]==3)) begin
			we_sub_tmp_5255 <= 1'b1;
		end else begin
			we_sub_tmp_5255 <= 1'b0;
		end
	end
   //---------------------------------------------------------------------------------------------------
	
	
	always @ (posedge CLK) begin
		if ((we_sub_tmp_5255) && (we_sub_tmp_0)) begin
			we_sub_52 <= 1'b1;
		end else begin
			we_sub_52 <= 1'b0;
		end
	end
	
   //----------------
	
	always @ (posedge CLK) begin
		if ((we_sub_tmp_5255) && (we_sub_tmp_1)) begin
			we_sub_53 <= 1'b1;
		end else begin
			we_sub_53 <= 1'b0;
		end
	end
    //----------------
    
	
	always @ (posedge CLK) begin
		if ((we_sub_tmp_5255) && (we_sub_tmp_2)) begin
			we_sub_54 <= 1'b1;
		end else begin
			we_sub_54 <= 1'b0;
		end
	end
	//--------------------

	
	always @ (posedge CLK) begin
		if ((we_sub_tmp_5255) && (we_sub_tmp_3)) begin
			we_sub_55 <= 1'b1;
		end else begin
			we_sub_55 <= 1'b0;
		end
	end
	//--------------------

   ///////////////////////////////////////////////////////////////////////////////////////////////

    always @ (posedge CLK) begin
		if ((addr_reg[11:10]==2) && (addr_reg[13:12]==3)) begin
			we_sub_tmp_5659 <= 1'b1;
		end else begin
			we_sub_tmp_5659 <= 1'b0;
		end
	end
   //---------------------------------------------------------------------------------------------------
	
	
	always @ (posedge CLK) begin
		if ((we_sub_tmp_5659) && (we_sub_tmp_0)) begin
			we_sub_56 <= 1'b1;
		end else begin
			we_sub_56 <= 1'b0;
		end
	end
	
   //----------------
	
	always @ (posedge CLK) begin
		if ((we_sub_tmp_5659) && (we_sub_tmp_1)) begin
			we_sub_57 <= 1'b1;
		end else begin
			we_sub_57 <= 1'b0;
		end
	end
    //----------------
    
	
	always @ (posedge CLK) begin
		if ((we_sub_tmp_5659) && (we_sub_tmp_2)) begin
			we_sub_58 <= 1'b1;
		end else begin
			we_sub_58 <= 1'b0;
		end
	end
	//--------------------

	
	always @ (posedge CLK) begin
		if ((we_sub_tmp_5659) && (we_sub_tmp_3)) begin
			we_sub_59 <= 1'b1;
		end else begin
			we_sub_59 <= 1'b0;
		end
	end
	//--------------------

   ///////////////////////////////////////////////////////////////////////////////////////////////

  always @ (posedge CLK) begin
		if ((addr_reg[11:10]==3) && (addr_reg[13:12]==3)) begin
			we_sub_tmp_6063 <= 1'b1;
		end else begin
			we_sub_tmp_6063 <= 1'b0;
		end
	end
   //---------------------------------------------------------------------------------------------------
	
	
	always @ (posedge CLK) begin
		if ((we_sub_tmp_6063) && (we_sub_tmp_0)) begin
			we_sub_60 <= 1'b1;
		end else begin
			we_sub_60 <= 1'b0;
		end
	end
	
   //----------------
	
	always @ (posedge CLK) begin
		if ((we_sub_tmp_6063) && (we_sub_tmp_1)) begin
			we_sub_61 <= 1'b1;
		end else begin
			we_sub_61 <= 1'b0;
		end
	end
    //----------------
    
	
	always @ (posedge CLK) begin
		if ((we_sub_tmp_6063) && (we_sub_tmp_2)) begin
			we_sub_62 <= 1'b1;
		end else begin
			we_sub_62 <= 1'b0;
		end
	end
	//--------------------

	
	always @ (posedge CLK) begin
		if ((we_sub_tmp_6063) && (we_sub_tmp_3)) begin
			we_sub_63 <= 1'b1;
		end else begin
			we_sub_63 <= 1'b0;
		end
	end
	//--------------------

///////////////////////////////////////////////////////////////////////////////////////////////
   ///////////////////////////////////////////////////////////////////////////////////////////////
   ///////////////////////////////////////////////////////////////////////////////////////////////
   //////////////////////////////////////////////////////////////////////////////////////////////


/////////////////////////////////////data_in/data_in/////////////////////////////////////////
/*	
always @ (posedge CLK) begin
		if ((addr_reg[11:10]==0) && (addr_reg[13:12]==0)) begin
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
			data_in_sub_0 <= data_in_reg;
		end else begin
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
			data_in_sub_1 <= data_in_reg;
		end else begin
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
			data_in_sub_2 <= data_in_reg;
		end else begin
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
			data_in_sub_3 <= data_in_reg;
		end else begin
			data_in_sub_3 <= 0;
		end
	end
	//--------------------

   ///////////////////////////////////////////////////////////////////////////////////////////////

  always @ (posedge CLK) begin
		if ((addr_reg[11:10]==1) && (addr_reg[13:12]==0)) begin
			en_sub_tmp_47 <= 1'b1;
		end else begin
			en_sub_tmp_47 <= 1'b0;
		end
	end
   //---------------------------------------------------------------------------------------------------
	
	
	always @ (posedge CLK) begin
		if ((en_sub_tmp_47) && (en_sub_tmp_0)) begin
			en_sub_4 <= 1'b1;
		end else begin
			en_sub_4 <= 1'b0;
		end
	end
	
   //----------------
	
	always @ (posedge CLK) begin
		if ((en_sub_tmp_47) && (en_sub_tmp_1)) begin
			data_in_sub_5 <= data_in_reg;
		end else begin
			data_in_sub_5 <= 0;
		end
	end
    //----------------
    
	
	always @ (posedge CLK) begin
		if ((en_sub_tmp_47) && (en_sub_tmp_2)) begin
			data_in_sub_6 <= data_in_reg;
		end else begin
			data_in_sub_6 <= 0;
		end
	end
	//--------------------

	
	always @ (posedge CLK) begin
		if ((en_sub_tmp_47) && (en_sub_tmp_3)) begin
			data_in_sub_7 <= data_in_reg;
		end else begin
			data_in_sub_7 <= 0;
		end
	end
	//--------------------
   ///////////////////////////////////////////////////////////////////////////////////////////////

    always @ (posedge CLK) begin
		if ((addr_reg[11:10]==2) && (addr_reg[13:12]==0)) begin
			en_sub_tmp_811 <= 1'b1;
		end else begin
			en_sub_tmp_811 <= 1'b0;
		end
	end
   //---------------------------------------------------------------------------------------------------
	
	
	always @ (posedge CLK) begin
		if ((en_sub_tmp_811) && (en_sub_tmp_0)) begin
			data_in_sub_8 <= data_in_reg;
		end else begin
			data_in_sub_8 <= 0;
		end
	end
	
   //----------------
	
	always @ (posedge CLK) begin
		if ((en_sub_tmp_811) && (en_sub_tmp_1)) begin
			data_in_sub_9 <= data_in_reg;
		end else begin
			data_in_sub_9 <= 0;
		end
	end
    //----------------
    
	
	always @ (posedge CLK) begin
		if ((en_sub_tmp_811) && (en_sub_tmp_2)) begin
			data_in_sub_10 <= data_in_reg;
		end else begin
			data_in_sub_10 <= 0;
		end
	end
	//--------------------

	
	always @ (posedge CLK) begin
		if ((en_sub_tmp_811) && (en_sub_tmp_3)) begin
			data_in_sub_11 <= data_in_reg;
		end else begin
			data_in_sub_11 <= 0;
		end
	end
	//--------------------


   ///////////////////////////////////////////////////////////////////////////////////////////////

    always @ (posedge CLK) begin
		if ((addr_reg[11:10]==3) && (addr_reg[13:12]==0)) begin
			en_sub_tmp_1215 <= 1'b1;
		end else begin
			en_sub_tmp_1215 <= 1'b0;
		end
	end
   //---------------------------------------------------------------------------------------------------
	
	
	always @ (posedge CLK) begin
		if ((en_sub_tmp_1215) && (en_sub_tmp_0)) begin
			data_in_sub_12 <= data_in_reg;
		end else begin
			data_in_sub_12 <= 0;
		end
	end
	
   //----------------
	
	always @ (posedge CLK) begin
		if ((en_sub_tmp_1215) && (en_sub_tmp_1)) begin
			data_in_sub_13 <= data_in_reg;
		end else begin
			data_in_sub_13 <= 0;
		end
	end
    //----------------
    
	
	always @ (posedge CLK) begin
		if ((en_sub_tmp_1215) && (en_sub_tmp_2)) begin
			data_in_sub_14 <= data_in_reg;
		end else begin
			data_in_sub_14 <= 0;
		end
	end
	//--------------------

	
	always @ (posedge CLK) begin
		if ((en_sub_tmp_1215) && (en_sub_tmp_3)) begin
			data_in_sub_15 <= data_in_reg;
		end else begin
			data_in_sub_15 <= 0;
		end
	end
	//--------------------

   ///////////////////////////////////////////////////////////////////////////////////////////////

  always @ (posedge CLK) begin
		if ((addr_reg[11:10]==0) && (addr_reg[13:12]==1)) begin
			en_sub_tmp_1619 <= 1'b1;
		end else begin
			en_sub_tmp_1619 <= 1'b0;
		end
	end
   //---------------------------------------------------------------------------------------------------
	
	
	always @ (posedge CLK) begin
		if ((en_sub_tmp_1619) && (en_sub_tmp_0)) begin
			data_in_sub_16 <= data_in_reg;
		end else begin
			data_in_sub_16 <= 0;
		end
	end
	
   //----------------
	
	always @ (posedge CLK) begin
		if ((en_sub_tmp_1619) && (en_sub_tmp_1)) begin
			data_in_sub_17 <= data_in_reg;
		end else begin
			data_in_sub_17 <= 0;
		end
	end
    //----------------
    
	
	always @ (posedge CLK) begin
		if ((en_sub_tmp_1619) && (en_sub_tmp_2)) begin
			data_in_sub_18 <= data_in_reg;
		end else begin
			data_in_sub_18 <= 0;
		end
	end
	//--------------------

	
	always @ (posedge CLK) begin
		if ((en_sub_tmp_1619) && (en_sub_tmp_3)) begin
			data_in_sub_19 <= data_in_reg;
		end else begin
			data_in_sub_19 <= 0;
		end
	end
	//--------------------

   ///////////////////////////////////////////////////////////////////////////////////////////////

  always @ (posedge CLK) begin
		if ((addr_reg[11:10]==1) && (addr_reg[13:12]==1)) begin
			en_sub_tmp_2023 <= 1'b1;
		end else begin
			en_sub_tmp_2023 <= 1'b0;
		end
	end
   //---------------------------------------------------------------------------------------------------
	
	
	always @ (posedge CLK) begin
		if ((en_sub_tmp_2023) && (en_sub_tmp_0)) begin
			data_in_sub_20 <= data_in_reg;
		end else begin
			data_in_sub_20 <= 0;
		end
	end
	
   //----------------
	
	always @ (posedge CLK) begin
		if ((en_sub_tmp_2023) && (en_sub_tmp_1)) begin
			data_in_sub_21 <= data_in_reg;
		end else begin
			data_in_sub_21 <= 0;
		end
	end
    //----------------
    
	
	always @ (posedge CLK) begin
		if ((en_sub_tmp_2023) && (en_sub_tmp_2)) begin
			data_in_sub_22 <= data_in_reg;
		end else begin
			data_in_sub_22 <= 0;
		end
	end
	//--------------------

	
	always @ (posedge CLK) begin
		if ((en_sub_tmp_2023) && (en_sub_tmp_3)) begin
			data_in_sub_23 <= data_in_reg;
		end else begin
			data_in_sub_23 <= 0;
		end
	end
	//--------------------

   ///////////////////////////////////////////////////////////////////////////////////////////////

   always @ (posedge CLK) begin
		if ((addr_reg[11:10]==2) && (addr_reg[13:12]==1)) begin
			en_sub_tmp_2427 <= 1'b1;
		end else begin
			en_sub_tmp_2427 <= 1'b0;
		end
	end
   //---------------------------------------------------------------------------------------------------
	
	
	always @ (posedge CLK) begin
		if ((en_sub_tmp_2427) && (en_sub_tmp_0)) begin
			data_in_sub_24 <= data_in_reg;
		end else begin
			data_in_sub_24 <= 0;
		end
	end
	
   //----------------
	
	always @ (posedge CLK) begin
		if ((en_sub_tmp_2427) && (en_sub_tmp_1)) begin
			data_in_sub_25 <= data_in_reg;
		end else begin
			data_in_sub_25 <= 0;
		end
	end
    //----------------
    
	
	always @ (posedge CLK) begin
		if ((en_sub_tmp_2427) && (en_sub_tmp_2)) begin
			data_in_sub_26 <= data_in_reg;
		end else begin
			data_in_sub_26 <= 0;
		end
	end
	//--------------------

	
	always @ (posedge CLK) begin
		if ((en_sub_tmp_2427) && (en_sub_tmp_3)) begin
			data_in_sub_27 <= data_in_reg;
		end else begin
			data_in_sub_27 <= 0;
		end
	end
	//--------------------

   ///////////////////////////////////////////////////////////////////////////////////////////////
  
  always @ (posedge CLK) begin
		if ((addr_reg[11:10]==3) && (addr_reg[13:12]==1)) begin
			en_sub_tmp_2831 <= 1'b1;
		end else begin
			en_sub_tmp_2831 <= 1'b0;
		end
	end
   //---------------------------------------------------------------------------------------------------
	
	
	always @ (posedge CLK) begin
		if ((en_sub_tmp_2831) && (en_sub_tmp_0)) begin
			data_in_sub_28 <= data_in_reg;
		end else begin
			data_in_sub_28 <= 0;
		end
	end
	
   //----------------
	
	always @ (posedge CLK) begin
		if ((en_sub_tmp_2831) && (en_sub_tmp_1)) begin
			data_in_sub_29 <= data_in_reg;
		end else begin
			data_in_sub_29 <= 0;
		end
	end
    //----------------
    
	
	always @ (posedge CLK) begin
		if ((en_sub_tmp_2831) && (en_sub_tmp_2)) begin
			data_in_sub_30 <= data_in_reg;
		end else begin
			data_in_sub_30 <= 0;
		end
	end
	//--------------------

	
	always @ (posedge CLK) begin
		if ((en_sub_tmp_2831) && (en_sub_tmp_3)) begin
			data_in_sub_31 <= data_in_reg;
		end else begin
			data_in_sub_31 <= 0;
		end
	end
	//--------------------

   ///////////////////////////////////////////////////////////////////////////////////////////////

    always @ (posedge CLK) begin
		if ((addr_reg[11:10]==0) && (addr_reg[13:12]==2)) begin
			data_in_sub_tmp_3235 <= 1'b1;
		end else begin
			data_in_sub_tmp_3235 <= 1'b0;
		end
	end
   //---------------------------------------------------------------------------------------------------
	
	
	always @ (posedge CLK) begin
		if ((en_sub_tmp_3235) && (en_sub_tmp_0)) begin
			data_in_sub_32 <= data_in_reg;
		end else begin
			data_in_sub_32 <= 0;
		end
	end
	
   //----------------
	
	always @ (posedge CLK) begin
		if ((en_sub_tmp_3235) && (en_sub_tmp_1)) begin
			data_in_sub_33 <= data_in_reg;
		end else begin
			data_in_sub_33 <= 0;
		end
	end
    //----------------
    
	
	always @ (posedge CLK) begin
		if ((en_sub_tmp_3235) && (en_sub_tmp_2)) begin
			data_in_sub_34 <= data_in_reg;
		end else begin
			data_in_sub_34 <= 0;
		end
	end
	//--------------------

	
	always @ (posedge CLK) begin
		if ((en_sub_tmp_3235) && (en_sub_tmp_3)) begin
			data_in_sub_35 <= data_in_reg;
		end else begin
			data_in_sub_35 <= 0;
		end
	end
	//--------------------

   ///////////////////////////////////////////////////////////////////////////////////////////////
   always @ (posedge CLK) begin
		if ((addr_reg[11:10]==1) && (addr_reg[13:12]==2)) begin
			data_in_sub_tmp_3639 <= 1'b1;
		end else begin
			data_in_sub_tmp_3639 <= 0;
		end
	end
   //---------------------------------------------------------------------------------------------------
	
	
	always @ (posedge CLK) begin
		if ((en_sub_tmp_3639) && (en_sub_tmp_0)) begin
			data_in_sub_36 <= data_in_reg;
		end else begin
			data_in_sub_36 <= 0;
		end
	end
	
   //----------------
	
	always @ (posedge CLK) begin
		if ((en_sub_tmp_3639) && (en_sub_tmp_1)) begin
			data_in_sub_37 <= data_in_reg;
		end else begin
			data_in_sub_37 <= 0;
		end
	end
    //----------------
    
	
	always @ (posedge CLK) begin
		if ((en_sub_tmp_3639) && (en_sub_tmp_2)) begin
			data_in_sub_38 <= data_in_reg;
		end else begin
			data_in_sub_38 <= 0;
		end
	end
	//--------------------

	
	always @ (posedge CLK) begin
		if ((en_sub_tmp_3639) && (en_sub_tmp_3)) begin
			data_in_sub_39 <= data_in_reg;
		end else begin
			data_in_sub_39 <= 0;
		end
	end
	//--------------------

   ///////////////////////////////////////////////////////////////////////////////////////////////

	always @ (posedge CLK) begin
		if ((addr_reg[11:10]==2) && (addr_reg[13:12]==2)) begin
			en_sub_tmp_4043 <= 1'b1;
		end else begin
			en_sub_tmp_4043 <= 0;
		end
	end
   //---------------------------------------------------------------------------------------------------
	
	
	always @ (posedge CLK) begin
		if ((en_sub_tmp_4043) && (en_sub_tmp_0)) begin
			data_in_sub_40 <= data_in_reg;
		end else begin
			data_in_sub_40 <= 0;
		end
	end
	
   //----------------
	
	always @ (posedge CLK) begin
		if ((en_sub_tmp_4043) && (en_sub_tmp_1)) begin
			data_in_sub_41 <= data_in_reg;
		end else begin
			data_in_sub_41 <= 0;
		end
	end
    //----------------
    
	
	always @ (posedge CLK) begin
		if ((en_sub_tmp_4043) && (en_sub_tmp_2)) begin
			data_in_sub_42 <= data_in_reg;
		end else begin
			data_in_sub_42 <= 0;
		end
	end
	//--------------------

	
	always @ (posedge CLK) begin
		if ((en_sub_tmp_4043) && (en_sub_tmp_3)) begin
			data_in_sub_43 <= data_in_reg;
		end else begin
			data_in_sub_43 <= 0;
		end
	end
	//--------------------

   ///////////////////////////////////////////////////////////////////////////////////////////////

    always @ (posedge CLK) begin
		if ((addr_reg[11:10]==3) && (addr_reg[13:12]==2)) begin
			en_sub_tmp_4447 <= 1'b1;
		end else begin
			en_sub_tmp_4447 <= 0;
		end
	end
   //---------------------------------------------------------------------------------------------------
	
	
	always @ (posedge CLK) begin
		if ((en_sub_tmp_4447) && (en_sub_tmp_0)) begin
			data_in_sub_44 <= data_in_reg;
		end else begin
			data_in_sub_44 <= 0;
		end
	end
	
   //----------------
	
	always @ (posedge CLK) begin
		if ((en_sub_tmp_4447) && (en_sub_tmp_1)) begin
			data_in_sub_45 <= data_in_reg;
		end else begin
			data_in_sub_45 <= 0;
		end
	end
    //----------------
    
	
	always @ (posedge CLK) begin
		if ((en_sub_tmp_4447) && (en_sub_tmp_2)) begin
			data_in_sub_46 <= data_in_reg;
		end else begin
			data_in_sub_46 <= 0;
		end
	end
	//--------------------

	
	always @ (posedge CLK) begin
		if ((en_sub_tmp_4447) && (en_sub_tmp_3)) begin
			data_in_sub_47 <= data_in_reg;
		end else begin
			data_in_sub_47 <= 0;
		end
	end
	//--------------------

   ///////////////////////////////////////////////////////////////////////////////////////////////



   always @ (posedge CLK) begin
		if ((addr_reg[11:10]==0) && (addr_reg[13:12]==3)) begin
			en_sub_tmp_4851 <= 1'b1;
		end else begin
			en_sub_tmp_4851 <= 0;
		end
	end
   //---------------------------------------------------------------------------------------------------
	
	
	always @ (posedge CLK) begin
		if ((en_sub_tmp_4851) && (en_sub_tmp_0)) begin
			data_in_sub_48<= data_in_reg;
		end else begin
			data_in_sub_48 <= 0;
		end
	end
	
   //----------------
	
	always @ (posedge CLK) begin
		if ((en_sub_tmp_4851) && (en_sub_tmp_1)) begin
			data_in_sub_49 <= data_in_reg;
		end else begin
			data_in_sub_49 <= 0;
		end
	end
    //----------------
    
	
	always @ (posedge CLK) begin
		if ((en_sub_tmp_4851) && (en_sub_tmp_2)) begin
			data_in_sub_50 <= data_in_reg;
		end else begin
			data_in_sub_50 <= 0;
		end
	end
	//--------------------

	
	always @ (posedge CLK) begin
		if ((en_sub_tmp_4851) && (en_sub_tmp_3)) begin
			data_in_sub_51 <= data_in_reg;
		end else begin
			data_in_sub_51 <= 0;
		end
	end
	//--------------------

   ///////////////////////////////////////////////////////////////////////////////////////////////
   always @ (posedge CLK) begin
		if ((addr_reg[11:10]==1) && (addr_reg[13:12]==3)) begin
			en_sub_tmp_5255 <= 1'b1;
		end else begin
			en_sub_tmp_5255 <= 0;
		end
	end
   //---------------------------------------------------------------------------------------------------
	
	
	always @ (posedge CLK) begin
		if ((en_sub_tmp_5255) && (en_sub_tmp_0)) begin
			data_in_sub_52 <= data_in_reg;
		end else begin
			data_in_sub_52 <= 0;
		end
	end
	
   //----------------
	
	always @ (posedge CLK) begin
		if ((en_sub_tmp_5255) && (en_sub_tmp_1)) begin
			data_in_sub_53 <= data_in_reg;
		end else begin
			data_in_sub_53 <= 0;
		end
	end
    //----------------
    
	
	always @ (posedge CLK) begin
		if ((en_sub_tmp_5255) && (en_sub_tmp_2)) begin
			data_in_sub_54 <= data_in_reg;
		end else begin
			data_in_sub_54 <= 0;
		end
	end
	//--------------------

	
	always @ (posedge CLK) begin
		if ((en_sub_tmp_5255) && (en_sub_tmp_3)) begin
			data_in_sub_55 <= data_in_reg;
		end else begin
			data_in_sub_55 <= 0;
		end
	end
	//--------------------

   ///////////////////////////////////////////////////////////////////////////////////////////////

    always @ (posedge CLK) begin
		if ((addr_reg[11:10]==2) && (addr_reg[13:12]==3)) begin
			data_in_sub_tmp_5659 <= 1'b1;
		end else begin
			data_in_sub_tmp_5659 <= 0;
		end
	end
   //---------------------------------------------------------------------------------------------------
	
	
	always @ (posedge CLK) begin
		if ((en_sub_tmp_5659) && (en_sub_tmp_0)) begin
			data_in_sub_56 <= data_in_reg;
		end else begin
			data_in_sub_56 <= 0;
		end
	end
	
   //----------------
	
	always @ (posedge CLK) begin
		if ((en_sub_tmp_5659) && (en_sub_tmp_1)) begin
			data_in_sub_57 <= data_in_reg;
		end else begin
			data_in_sub_57 <= 0;
		end
	end
    //----------------
    
	
	always @ (posedge CLK) begin
		if ((en_sub_tmp_5659) && (en_sub_tmp_2)) begin
			data_in_sub_58 <= data_in_reg;
		end else begin
			data_in_sub_58 <= 0;
		end
	end
	//--------------------

	
	always @ (posedge CLK) begin
		if ((en_sub_tmp_5659) && (en_sub_tmp_3)) begin
			data_in_sub_59 <= data_in_reg;
		end else begin
			data_in_sub_59 <= 0;
		end
	end
	//--------------------

   ///////////////////////////////////////////////////////////////////////////////////////////////

  always @ (posedge CLK) begin
		if ((addr_reg[11:10]==3) && (addr_reg[13:12]==3)) begin
			data_in_sub_tmp_6063 <= 1'b1;
		end else begin
			data_in_sub_tmp_6063 <= 0;
		end
	end
   //---------------------------------------------------------------------------------------------------
	
	
	always @ (posedge CLK) begin
		if ((en_sub_tmp_6063) && (en_sub_tmp_0)) begin
			data_in_sub_60 <= data_in_reg;
		end else begin
			data_in_sub_60 <= 0;
		end
	end
	
   //----------------
	
	always @ (posedge CLK) begin
		if ((en_sub_tmp_6063) && (en_sub_tmp_1)) begin
			data_in_sub_61 <= data_in_reg;
		end else begin
			data_in_sub_61 <= 0;
		end
	end
    //----------------
    
	
	always @ (posedge CLK) begin
		if ((en_sub_tmp_6063) && (en_sub_tmp_2)) begin
			data_in_sub_62 <= data_in_reg;
		end else begin
			data_in_sub_62 <= 0;
		end
	end
	//--------------------

	
	always @ (posedge CLK) begin
		if ((en_sub_tmp_6063) && (en_sub_tmp_3)) begin
			data_in_sub_63 <= data_in_reg;
		end else begin
			data_in_sub_63 <= 0;
		end
	end
	//--------------------
*/

///////////////////////////////////////////////////////////////////////////////////////////////
   ///////////////////////////////////////////////////////////////////////////////////////////////
   ///////////////////////////////////////////////////////////////////////////////////////////////
   //////////////////////////////////////////////////////////////////////////////////////////////








	/////////////////////////////
	// write_submodule_instances()
	/////////////////////////////

	// Define the output wire data_out

	//wire [BusWidth-1:0] data_out_sub_0;
	//wire [BusWidth-1:0] data_out_sub_1;
	//wire [BusWidth-1:0] data_out_sub_2;
	//wire [BusWidth-1:0] data_out_sub_3;


/*	
	TS1N28HPCPLVTB256X32M4SWBASO SRAM_0(
		.CLK(CLK),
		.A(addr_sub_0),
		.CEB(~en_sub_0),
		.WEB(~we_sub_0),
		.D(data_in_sub_0),
		.Q(data_out_sub_0)
	);
*/
	/////////////////////////////
	// save_addr_for_mux()
	/////////////////////////////

	

	/////////////////////////////
	// write_output_mux()
	/////////////////////////////

	//write_output_mux(), addr

	

	//write_output_mux(), en

	

	//write_output_mux(), data_out

	//wire [BusWidth-1:0] data_out_tmp;
	//assign data_out_tmp = 
	//	en_sub_0 == 1 ? data_out_sub_0 :
	//	en_sub_1 == 1 ? data_out_sub_1 :
	//	en_sub_2 == 1 ? data_out_sub_2 :
	//	en_sub_3 == 1 ? data_out_sub_3 :
		

	/////////////////////////////
	// write_output_reg()
	/////////////////////////////



	//always @ (posedge CLK) begin
		 
	//		data_out <= data_out_tmp;
	//	end


endmodule


