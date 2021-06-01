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
	input  [13:0] addr; //(6+2)+2+2+2
	input we;
    input en;
	input [BusWidth-1:0] data_in; 

	output en_sub_0, en_sub_1, en_sub_2, en_sub_3, en_sub_4, en_sub_5, en_sub_6, en_sub_7, en_sub_8, en_sub_9, en_sub_10, en_sub_11, en_sub_12, en_sub_13, en_sub_14, en_sub_15,
	en_sub_16, en_sub_17, en_sub_18, en_sub_19, en_sub_20, en_sub_21, en_sub_22, en_sub_23, en_sub_24, en_sub_25, en_sub_26, en_sub_27, en_sub_28, en_sub_29, en_sub_30, en_sub_31,
	en_sub_32, en_sub_33, en_sub_34, en_sub_35, en_sub_36, en_sub_37, en_sub_38, en_sub_39, en_sub_40, en_sub_41, en_sub_42, en_sub_43, en_sub_44, en_sub_45, en_sub_46, en_sub_47,
	en_sub_48, en_sub_49, en_sub_50, en_sub_51, en_sub_52, en_sub_53, en_sub_54, en_sub_55, en_sub_56, en_sub_57, en_sub_58, en_sub_59, en_sub_60, en_sub_61, en_sub_62, en_sub_63;
 
    output we_sub_0, we_sub_1, we_sub_2, we_sub_3, we_sub_4, we_sub_5, we_sub_6, we_sub_7, we_sub_8, we_sub_9, we_sub_10, we_sub_11, we_sub_12, we_sub_13, we_sub_14, we_sub_15,
	we_sub_16, we_sub_17, we_sub_18, we_sub_19, we_sub_20, we_sub_21, we_sub_22, we_sub_23, we_sub_24, we_sub_25, we_sub_26, we_sub_27, we_sub_28, we_sub_29, we_sub_30, we_sub_31,
	we_sub_32, we_sub_33, we_sub_34, we_sub_35, we_sub_36, we_sub_37, we_sub_38, we_sub_39, we_sub_40, we_sub_41, we_sub_42, we_sub_43, we_sub_44, we_sub_45, we_sub_46, we_sub_47,
	we_sub_48, we_sub_49, we_sub_50, we_sub_51, we_sub_52, we_sub_53, we_sub_54, we_sub_55, we_sub_56, we_sub_57, we_sub_58, we_sub_59, we_sub_60, we_sub_61, we_sub_62, we_sub_63;
   


	output [BusWidth-1:0] data_in_sub_0, data_in_sub_1, data_in_sub_2, data_in_sub_3, data_in_sub_4, data_in_sub_5, data_in_sub_6, data_in_sub_7, data_in_sub_8, data_in_sub_9, data_in_sub_10, data_in_sub_11, data_in_sub_12, data_in_sub_13, data_in_sub_14, data_in_sub_15,
	data_in_sub_16, data_in_sub_17, data_in_sub_18, data_in_sub_19, data_in_sub_20, data_in_sub_21, data_in_sub_22, data_in_sub_23, data_in_sub_24, data_in_sub_25, data_in_sub_26, data_in_sub_27, data_in_sub_28, data_in_sub_29, data_in_sub_30, data_in_sub_31,
	data_in_sub_32, data_in_sub_33, data_in_sub_34, data_in_sub_35, data_in_sub_36, data_in_sub_37, data_in_sub_38, data_in_sub_39, data_in_sub_40, data_in_sub_41, data_in_sub_42, data_in_sub_43, data_in_sub_44, data_in_sub_45, data_in_sub_46, data_in_sub_47,
	data_in_sub_48, data_in_sub_49, data_in_sub_50, data_in_sub_51, data_in_sub_52, data_in_sub_53, data_in_sub_54, data_in_sub_55, data_in_sub_56, data_in_sub_57, data_in_sub_58, data_in_sub_59, data_in_sub_60, data_in_sub_61, data_in_sub_62, data_in_sub_63;

	
	output reg [BusWidth-1:0] data_out_sub_0, data_out_sub_1, data_out_sub_2, data_out_sub_3, data_out_sub_4, data_out_sub_5, data_out_sub_6, data_out_sub_7, data_out_sub_8, data_out_sub_9, data_out_sub_10, data_out_sub_11, data_out_sub_12, data_out_sub_13, data_out_sub_14, data_out_sub_15,
	data_out_sub_16, data_out_sub_17, data_out_sub_18, data_out_sub_19, data_out_sub_20, data_out_sub_21, data_out_sub_22, data_out_sub_23, data_out_sub_24, data_out_sub_25, data_out_sub_26, data_out_sub_27, data_out_sub_28, data_out_sub_29, data_out_sub_30, data_out_sub_31,
	data_out_sub_32, data_out_sub_33, data_out_sub_34, data_out_sub_35, data_out_sub_36, data_out_sub_37, data_out_sub_38, data_out_sub_39, data_out_sub_40, data_out_sub_41, data_out_sub_42, data_out_sub_43, data_out_sub_44, data_out_sub_45, data_out_sub_46, data_out_sub_47,
	data_out_sub_48, data_out_sub_49, data_out_sub_50, data_out_sub_51, data_out_sub_52, data_out_sub_53, data_out_sub_54, data_out_sub_55, data_out_sub_56, data_out_sub_57, data_out_sub_58, data_out_sub_59, data_out_sub_60, data_out_sub_61, data_out_sub_62, data_out_sub_63;


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
	assign en_sub_0 = (en_reg & addr_reg[9:8]==0 & addr_reg[11:10]==0 & addr_reg[13:12]==0);
	assign en_sub_1 = (en_reg & addr_reg[9:8]==1 & addr_reg[11:10]==0 & addr_reg[13:12]==0);
	assign en_sub_2 = (en_reg & addr_reg[9:8]==2 & addr_reg[11:10]==0 & addr_reg[13:12]==0);
	assign en_sub_3 = (en_reg & addr_reg[9:8]==3 & addr_reg[11:10]==0 & addr_reg[13:12]==0);

	assign en_sub_4 = (en_reg & addr_reg[9:8]==0 & addr_reg[11:10]==1 & addr_reg[13:12]==0);
	assign en_sub_5 = (en_reg & addr_reg[9:8]==1 & addr_reg[11:10]==1 & addr_reg[13:12]==0);
	assign en_sub_6 = (en_reg & addr_reg[9:8]==2 & addr_reg[11:10]==1 & addr_reg[13:12]==0);
	assign en_sub_7 = (en_reg & addr_reg[9:8]==3 & addr_reg[11:10]==1 & addr_reg[13:12]==0);

	assign en_sub_8 = (en_reg & addr_reg[9:8]==0 & addr_reg[11:10]==2 & addr_reg[13:12]==0);
	assign en_sub_9 = (en_reg & addr_reg[9:8]==1 & addr_reg[11:10]==2 & addr_reg[13:12]==0);
	assign en_sub_10 = (en_reg & addr_reg[9:8]==2 & addr_reg[11:10]==2 & addr_reg[13:12]==0);
	assign en_sub_11 = (en_reg & addr_reg[9:8]==3 & addr_reg[11:10]==2 & addr_reg[13:12]==0);

	assign en_sub_12 = (en_reg & addr_reg[9:8]==0 & addr_reg[11:10]==3 & addr_reg[13:12]==0);
	assign en_sub_13 = (en_reg & addr_reg[9:8]==1 & addr_reg[11:10]==3 & addr_reg[13:12]==0);
	assign en_sub_14 = (en_reg & addr_reg[9:8]==2 & addr_reg[11:10]==3 & addr_reg[13:12]==0);
	assign en_sub_15 = (en_reg & addr_reg[9:8]==3 & addr_reg[11:10]==3 & addr_reg[13:12]==0);




	assign en_sub_16 = (en_reg & addr_reg[9:8]==0 & addr_reg[11:10]==0 & addr_reg[13:12]==1);
	assign en_sub_17 = (en_reg & addr_reg[9:8]==1 & addr_reg[11:10]==0 & addr_reg[13:12]==1);
	assign en_sub_18 = (en_reg & addr_reg[9:8]==2 & addr_reg[11:10]==0 & addr_reg[13:12]==1);
	assign en_sub_19= (en_reg & addr_reg[9:8]==3 & addr_reg[11:10]==0 & addr_reg[13:12]==1);

	assign en_sub_20 = (en_reg & addr_reg[9:8]==0 & addr_reg[11:10]==1 & addr_reg[13:12]==1);
	assign en_sub_21 = (en_reg & addr_reg[9:8]==1 & addr_reg[11:10]==1 & addr_reg[13:12]==1);
	assign en_sub_22 = (en_reg & addr_reg[9:8]==2 & addr_reg[11:10]==1 & addr_reg[13:12]==1);
	assign en_sub_23 = (en_reg & addr_reg[9:8]==3 & addr_reg[11:10]==1 & addr_reg[13:12]==1);

	assign en_sub_24 = (en_reg & addr_reg[9:8]==0 & addr_reg[11:10]==2 & addr_reg[13:12]==1);
	assign en_sub_25 = (en_reg & addr_reg[9:8]==1 & addr_reg[11:10]==2 & addr_reg[13:12]==1);
	assign en_sub_26 = (en_reg & addr_reg[9:8]==2 & addr_reg[11:10]==2 & addr_reg[13:12]==1);
	assign en_sub_27 = (en_reg & addr_reg[9:8]==3 & addr_reg[11:10]==2 & addr_reg[13:12]==1);

	assign en_sub_28 = (en_reg & addr_reg[9:8]==0 & addr_reg[11:10]==3 & addr_reg[13:12]==1);
	assign en_sub_29 = (en_reg & addr_reg[9:8]==1 & addr_reg[11:10]==3 & addr_reg[13:12]==1);
	assign en_sub_30 = (en_reg & addr_reg[9:8]==2 & addr_reg[11:10]==3 & addr_reg[13:12]==1);
	assign en_sub_31 = (en_reg & addr_reg[9:8]==3 & addr_reg[11:10]==3 & addr_reg[13:12]==1);

	



	assign en_sub_32 = (en_reg & addr_reg[9:8]==0 & addr_reg[11:10]==0 & addr_reg[13:12]==2);
	assign en_sub_33 = (en_reg & addr_reg[9:8]==1 & addr_reg[11:10]==0 & addr_reg[13:12]==2);
	assign en_sub_34 = (en_reg & addr_reg[9:8]==2 & addr_reg[11:10]==0 & addr_reg[13:12]==2);
	assign en_sub_35 = (en_reg & addr_reg[9:8]==3 & addr_reg[11:10]==0 & addr_reg[13:12]==2);

	assign en_sub_36 = (en_reg & addr_reg[9:8]==0 & addr_reg[11:10]==1 & addr_reg[13:12]==2);
	assign en_sub_37 = (en_reg & addr_reg[9:8]==1 & addr_reg[11:10]==1 & addr_reg[13:12]==2);
	assign en_sub_38 = (en_reg & addr_reg[9:8]==2 & addr_reg[11:10]==1 & addr_reg[13:12]==2);
	assign en_sub_39 = (en_reg & addr_reg[9:8]==3 & addr_reg[11:10]==1 & addr_reg[13:12]==2);

	assign en_sub_40 = (en_reg & addr_reg[9:8]==0 & addr_reg[11:10]==2 & addr_reg[13:12]==2);
	assign en_sub_41 = (en_reg & addr_reg[9:8]==1 & addr_reg[11:10]==2 & addr_reg[13:12]==2);
	assign en_sub_42 = (en_reg & addr_reg[9:8]==2 & addr_reg[11:10]==2 & addr_reg[13:12]==2);
	assign en_sub_43 = (en_reg & addr_reg[9:8]==3 & addr_reg[11:10]==2 & addr_reg[13:12]==2);

	assign en_sub_44 = (en_reg & addr_reg[9:8]==0 & addr_reg[11:10]==3 & addr_reg[13:12]==2);
	assign en_sub_45 = (en_reg & addr_reg[9:8]==1 & addr_reg[11:10]==3 & addr_reg[13:12]==2);
	assign en_sub_46 = (en_reg & addr_reg[9:8]==2 & addr_reg[11:10]==3 & addr_reg[13:12]==2);
	assign en_sub_47 = (en_reg & addr_reg[9:8]==3 & addr_reg[11:10]==3 & addr_reg[13:12]==2);





	assign en_sub_48 = (en_reg & addr_reg[9:8]==0 & addr_reg[11:10]==0 & addr_reg[13:12]==3);
	assign en_sub_49 = (en_reg & addr_reg[9:8]==1 & addr_reg[11:10]==0 & addr_reg[13:12]==3);
	assign en_sub_50 = (en_reg & addr_reg[9:8]==2 & addr_reg[11:10]==0 & addr_reg[13:12]==3);
	assign en_sub_51 = (en_reg & addr_reg[9:8]==3 & addr_reg[11:10]==0 & addr_reg[13:12]==3);

	assign en_sub_52 = (en_reg & addr_reg[9:8]==0 & addr_reg[11:10]==1 & addr_reg[13:12]==3);
	assign en_sub_53 = (en_reg & addr_reg[9:8]==1 & addr_reg[11:10]==1 & addr_reg[13:12]==3);
	assign en_sub_54 = (en_reg & addr_reg[9:8]==2 & addr_reg[11:10]==1 & addr_reg[13:12]==3);
	assign en_sub_55 = (en_reg & addr_reg[9:8]==3 & addr_reg[11:10]==1 & addr_reg[13:12]==3);

	assign en_sub_56 = (en_reg & addr_reg[9:8]==0 & addr_reg[11:10]==2 & addr_reg[13:12]==3);
	assign en_sub_57 = (en_reg & addr_reg[9:8]==1 & addr_reg[11:10]==2 & addr_reg[13:12]==3);
	assign en_sub_58 = (en_reg & addr_reg[9:8]==2 & addr_reg[11:10]==2 & addr_reg[13:12]==3);
	assign en_sub_59 = (en_reg & addr_reg[9:8]==3 & addr_reg[11:10]==2 & addr_reg[13:12]==3);

	assign en_sub_60 = (en_reg & addr_reg[9:8]==0 & addr_reg[11:10]==3 & addr_reg[13:12]==3);
	assign en_sub_61 = (en_reg & addr_reg[9:8]==1 & addr_reg[11:10]==3 & addr_reg[13:12]==3);
	assign en_sub_62 = (en_reg & addr_reg[9:8]==2 & addr_reg[11:10]==3 & addr_reg[13:12]==3);
	assign en_sub_63 = (en_reg & addr_reg[9:8]==3 & addr_reg[11:10]==3 & addr_reg[13:12]==3);

/////////////////////////////////////////////////////////////////////////////////////////////////////
  ////////////////////////////////////////////WEWEWEWEWE///////////////////////////////////
	assign we_sub_0 = (we_reg & addr_reg[9:8]==0 & addr_reg[11:10]==0 & addr_reg[13:12]==0);
	assign we_sub_1 = (we_reg & addr_reg[9:8]==1 & addr_reg[11:10]==0 & addr_reg[13:12]==0);
	assign we_sub_2 = (we_reg & addr_reg[9:8]==2 & addr_reg[11:10]==0 & addr_reg[13:12]==0);
	assign we_sub_3 = (we_reg & addr_reg[9:8]==3 & addr_reg[11:10]==0 & addr_reg[13:12]==0);

	assign we_sub_4 = (we_reg & addr_reg[9:8]==0 & addr_reg[11:10]==1 & addr_reg[13:12]==0);
	assign we_sub_5 = (we_reg & addr_reg[9:8]==1 & addr_reg[11:10]==1 & addr_reg[13:12]==0);
	assign we_sub_6 = (we_reg & addr_reg[9:8]==2 & addr_reg[11:10]==1 & addr_reg[13:12]==0);
	assign we_sub_7 = (we_reg & addr_reg[9:8]==3 & addr_reg[11:10]==1 & addr_reg[13:12]==0);

	assign we_sub_8 = (we_reg & addr_reg[9:8]==0 & addr_reg[11:10]==2 & addr_reg[13:12]==0);
	assign we_sub_9 = (we_reg & addr_reg[9:8]==1 & addr_reg[11:10]==2 & addr_reg[13:12]==0);
	assign we_sub_10 = (we_reg & addr_reg[9:8]==2 & addr_reg[11:10]==2 & addr_reg[13:12]==0);
	assign we_sub_11 = (we_reg & addr_reg[9:8]==3 & addr_reg[11:10]==2 & addr_reg[13:12]==0);

	assign we_sub_12 = (we_reg & addr_reg[9:8]==0 & addr_reg[11:10]==3 & addr_reg[13:12]==0);
	assign we_sub_13 = (we_reg & addr_reg[9:8]==1 & addr_reg[11:10]==3 & addr_reg[13:12]==0);
	assign we_sub_14 = (we_reg & addr_reg[9:8]==2 & addr_reg[11:10]==3 & addr_reg[13:12]==0);
	assign we_sub_15 = (we_reg & addr_reg[9:8]==3 & addr_reg[11:10]==3 & addr_reg[13:12]==0);




	assign we_sub_16 = (we_reg & addr_reg[9:8]==0 & addr_reg[11:10]==0 & addr_reg[13:12]==1);
	assign we_sub_17 = (we_reg & addr_reg[9:8]==1 & addr_reg[11:10]==0 & addr_reg[13:12]==1);
	assign we_sub_18 = (we_reg & addr_reg[9:8]==2 & addr_reg[11:10]==0 & addr_reg[13:12]==1);
	assign we_sub_19= (we_reg & addr_reg[9:8]==3 & addr_reg[11:10]==0 & addr_reg[13:12]==1);

	assign we_sub_20 = (we_reg & addr_reg[9:8]==0 & addr_reg[11:10]==1 & addr_reg[13:12]==1);
	assign we_sub_21 = (we_reg & addr_reg[9:8]==1 & addr_reg[11:10]==1 & addr_reg[13:12]==1);
	assign we_sub_22 = (we_reg & addr_reg[9:8]==2 & addr_reg[11:10]==1 & addr_reg[13:12]==1);
	assign we_sub_23 = (we_reg & addr_reg[9:8]==3 & addr_reg[11:10]==1 & addr_reg[13:12]==1);

	assign we_sub_24 = (we_reg & addr_reg[9:8]==0 & addr_reg[11:10]==2 & addr_reg[13:12]==1);
	assign we_sub_25 = (we_reg & addr_reg[9:8]==1 & addr_reg[11:10]==2 & addr_reg[13:12]==1);
	assign we_sub_26 = (we_reg & addr_reg[9:8]==2 & addr_reg[11:10]==2 & addr_reg[13:12]==1);
	assign we_sub_27 = (we_reg & addr_reg[9:8]==3 & addr_reg[11:10]==2 & addr_reg[13:12]==1);

	assign we_sub_28 = (we_reg & addr_reg[9:8]==0 & addr_reg[11:10]==3 & addr_reg[13:12]==1);
	assign we_sub_29 = (we_reg & addr_reg[9:8]==1 & addr_reg[11:10]==3 & addr_reg[13:12]==1);
	assign we_sub_30 = (we_reg & addr_reg[9:8]==2 & addr_reg[11:10]==3 & addr_reg[13:12]==1);
	assign we_sub_31 = (we_reg & addr_reg[9:8]==3 & addr_reg[11:10]==3 & addr_reg[13:12]==1);

	



	assign we_sub_32 = (we_reg & addr_reg[9:8]==0 & addr_reg[11:10]==0 & addr_reg[13:12]==2);
	assign we_sub_33 = (we_reg & addr_reg[9:8]==1 & addr_reg[11:10]==0 & addr_reg[13:12]==2);
	assign we_sub_34 = (we_reg & addr_reg[9:8]==2 & addr_reg[11:10]==0 & addr_reg[13:12]==2);
	assign we_sub_35 = (we_reg & addr_reg[9:8]==3 & addr_reg[11:10]==0 & addr_reg[13:12]==2);

	assign we_sub_36 = (we_reg & addr_reg[9:8]==0 & addr_reg[11:10]==1 & addr_reg[13:12]==2);
	assign we_sub_37 = (we_reg & addr_reg[9:8]==1 & addr_reg[11:10]==1 & addr_reg[13:12]==2);
	assign we_sub_38 = (we_reg & addr_reg[9:8]==2 & addr_reg[11:10]==1 & addr_reg[13:12]==2);
	assign we_sub_39 = (we_reg & addr_reg[9:8]==3 & addr_reg[11:10]==1 & addr_reg[13:12]==2);

	assign we_sub_40 = (we_reg & addr_reg[9:8]==0 & addr_reg[11:10]==2 & addr_reg[13:12]==2);
	assign we_sub_41 = (we_reg & addr_reg[9:8]==1 & addr_reg[11:10]==2 & addr_reg[13:12]==2);
	assign we_sub_42 = (we_reg & addr_reg[9:8]==2 & addr_reg[11:10]==2 & addr_reg[13:12]==2);
	assign we_sub_43 = (we_reg & addr_reg[9:8]==3 & addr_reg[11:10]==2 & addr_reg[13:12]==2);

	assign we_sub_44 = (we_reg & addr_reg[9:8]==0 & addr_reg[11:10]==3 & addr_reg[13:12]==2);
	assign we_sub_45 = (we_reg & addr_reg[9:8]==1 & addr_reg[11:10]==3 & addr_reg[13:12]==2);
	assign we_sub_46 = (we_reg & addr_reg[9:8]==2 & addr_reg[11:10]==3 & addr_reg[13:12]==2);
	assign we_sub_47 = (we_reg & addr_reg[9:8]==3 & addr_reg[11:10]==3 & addr_reg[13:12]==2);





	assign we_sub_48 = (we_reg & addr_reg[9:8]==0 & addr_reg[11:10]==0 & addr_reg[13:12]==3);
	assign we_sub_49 = (we_reg & addr_reg[9:8]==1 & addr_reg[11:10]==0 & addr_reg[13:12]==3);
	assign we_sub_50 = (we_reg & addr_reg[9:8]==2 & addr_reg[11:10]==0 & addr_reg[13:12]==3);
	assign we_sub_51 = (we_reg & addr_reg[9:8]==3 & addr_reg[11:10]==0 & addr_reg[13:12]==3);

	assign we_sub_52 = (we_reg & addr_reg[9:8]==0 & addr_reg[11:10]==1 & addr_reg[13:12]==3);
	assign we_sub_53 = (we_reg & addr_reg[9:8]==1 & addr_reg[11:10]==1 & addr_reg[13:12]==3);
	assign we_sub_54 = (we_reg & addr_reg[9:8]==2 & addr_reg[11:10]==1 & addr_reg[13:12]==3);
	assign we_sub_55 = (we_reg & addr_reg[9:8]==3 & addr_reg[11:10]==1 & addr_reg[13:12]==3);

	assign we_sub_56 = (we_reg & addr_reg[9:8]==0 & addr_reg[11:10]==2 & addr_reg[13:12]==3);
	assign we_sub_57 = (we_reg & addr_reg[9:8]==1 & addr_reg[11:10]==2 & addr_reg[13:12]==3);
	assign we_sub_58 = (we_reg & addr_reg[9:8]==2 & addr_reg[11:10]==2 & addr_reg[13:12]==3);
	assign we_sub_59 = (we_reg & addr_reg[9:8]==3 & addr_reg[11:10]==2 & addr_reg[13:12]==3);

	assign we_sub_60 = (we_reg & addr_reg[9:8]==0 & addr_reg[11:10]==3 & addr_reg[13:12]==3);
	assign we_sub_61 = (we_reg & addr_reg[9:8]==1 & addr_reg[11:10]==3 & addr_reg[13:12]==3);
	assign we_sub_62 = (we_reg & addr_reg[9:8]==2 & addr_reg[11:10]==3 & addr_reg[13:12]==3);
	assign we_sub_63 = (en_reg & addr_reg[9:8]==3 & addr_reg[11:10]==3 & addr_reg[13:12]==3);

  ////////////////////////////////////////////Data_IN///////////////////////////////////////////

    assign data_in_sub_0 = (en_reg & addr_reg[9:8]==0 & addr_reg[11:10]==0 & addr_reg[13:12]==0) ? data_in_reg: 0;
	assign data_in_sub_1 = (en_reg & addr_reg[9:8]==1 & addr_reg[11:10]==0 & addr_reg[13:12]==0) ? data_in_reg: 0;
	assign data_in_sub_2 = (en_reg & addr_reg[9:8]==2 & addr_reg[11:10]==0 & addr_reg[13:12]==0) ? data_in_reg: 0;
	assign data_in_sub_3 = (en_reg & addr_reg[9:8]==3 & addr_reg[11:10]==0 & addr_reg[13:12]==0) ? data_in_reg: 0;

	assign data_in_sub_4 = (en_reg & addr_reg[9:8]==0 & addr_reg[11:10]==1 & addr_reg[13:12]==0) ? data_in_reg: 0;
	assign data_in_sub_5 = (en_reg & addr_reg[9:8]==1 & addr_reg[11:10]==1 & addr_reg[13:12]==0) ? data_in_reg: 0;
	assign data_in_sub_6 = (en_reg & addr_reg[9:8]==2 & addr_reg[11:10]==1 & addr_reg[13:12]==0) ? data_in_reg: 0;
	assign data_in_sub_7 = (en_reg & addr_reg[9:8]==3 & addr_reg[11:10]==1 & addr_reg[13:12]==0) ? data_in_reg: 0;

	assign data_in_sub_8 = (en_reg & addr_reg[9:8]==0 & addr_reg[11:10]==2 & addr_reg[13:12]==0) ? data_in_reg: 0;
	assign data_in_sub_9 = (en_reg & addr_reg[9:8]==1 & addr_reg[11:10]==2 & addr_reg[13:12]==0) ? data_in_reg: 0;
	assign data_in_sub_10 = (en_reg & addr_reg[9:8]==2 & addr_reg[11:10]==2 & addr_reg[13:12]==0) ? data_in_reg: 0;
	assign data_in_sub_11 = (en_reg & addr_reg[9:8]==3 & addr_reg[11:10]==2 & addr_reg[13:12]==0) ? data_in_reg: 0;

	assign data_in_sub_12 = (en_reg & addr_reg[9:8]==0 & addr_reg[11:10]==3 & addr_reg[13:12]==0) ? data_in_reg: 0;
	assign data_in_sub_13 = (en_reg & addr_reg[9:8]==1 & addr_reg[11:10]==3 & addr_reg[13:12]==0) ? data_in_reg: 0;
	assign data_in_sub_14 = (en_reg & addr_reg[9:8]==2 & addr_reg[11:10]==3 & addr_reg[13:12]==0) ? data_in_reg: 0;
	assign data_in_sub_15 = (en_reg & addr_reg[9:8]==3 & addr_reg[11:10]==3 & addr_reg[13:12]==0) ? data_in_reg: 0;




	assign data_in_sub_16 = (en_reg & addr_reg[9:8]==0 & addr_reg[11:10]==0 & addr_reg[13:12]==1) ? data_in_reg: 0;
	assign data_in_sub_17 = (en_reg & addr_reg[9:8]==1 & addr_reg[11:10]==0 & addr_reg[13:12]==1) ? data_in_reg: 0;
	assign data_in_sub_18 = (en_reg & addr_reg[9:8]==2 & addr_reg[11:10]==0 & addr_reg[13:12]==1) ? data_in_reg: 0;
	assign data_in_sub_19 = (en_reg & addr_reg[9:8]==3 & addr_reg[11:10]==0 & addr_reg[13:12]==1) ? data_in_reg: 0;

	assign data_in_sub_20 = (en_reg & addr_reg[9:8]==0 & addr_reg[11:10]==1 & addr_reg[13:12]==1) ? data_in_reg: 0;
	assign data_in_sub_21 = (en_reg & addr_reg[9:8]==1 & addr_reg[11:10]==1 & addr_reg[13:12]==1) ? data_in_reg: 0;
	assign data_in_sub_22 = (en_reg & addr_reg[9:8]==2 & addr_reg[11:10]==1 & addr_reg[13:12]==1) ? data_in_reg: 0;
	assign data_in_sub_23 = (en_reg & addr_reg[9:8]==3 & addr_reg[11:10]==1 & addr_reg[13:12]==1) ? data_in_reg: 0;

	assign data_in_sub_24 = (en_reg & addr_reg[9:8]==0 & addr_reg[11:10]==2 & addr_reg[13:12]==1) ? data_in_reg: 0;
	assign data_in_sub_25 = (en_reg & addr_reg[9:8]==1 & addr_reg[11:10]==2 & addr_reg[13:12]==1) ? data_in_reg: 0;
	assign data_in_sub_26 = (en_reg & addr_reg[9:8]==2 & addr_reg[11:10]==2 & addr_reg[13:12]==1) ? data_in_reg: 0;
	assign data_in_sub_27 = (en_reg & addr_reg[9:8]==3 & addr_reg[11:10]==2 & addr_reg[13:12]==1) ? data_in_reg: 0;

	assign data_in_sub_28 = (en_reg & addr_reg[9:8]==0 & addr_reg[11:10]==3 & addr_reg[13:12]==1) ? data_in_reg: 0;
	assign data_in_sub_29 = (en_reg & addr_reg[9:8]==1 & addr_reg[11:10]==3 & addr_reg[13:12]==1) ? data_in_reg: 0;
	assign data_in_sub_30 = (en_reg & addr_reg[9:8]==2 & addr_reg[11:10]==3 & addr_reg[13:12]==1) ? data_in_reg: 0;
	assign data_in_sub_31 = (en_reg & addr_reg[9:8]==3 & addr_reg[11:10]==3 & addr_reg[13:12]==1) ? data_in_reg: 0;

	



	assign data_in_sub_32 = (en_reg & addr_reg[9:8]==0 & addr_reg[11:10]==0 & addr_reg[13:12]==2) ? data_in_reg: 0;
	assign data_in_sub_33 = (en_reg & addr_reg[9:8]==1 & addr_reg[11:10]==0 & addr_reg[13:12]==2) ? data_in_reg: 0;
	assign data_in_sub_34 = (en_reg & addr_reg[9:8]==2 & addr_reg[11:10]==0 & addr_reg[13:12]==2) ? data_in_reg: 0;
	assign data_in_sub_35 = (en_reg & addr_reg[9:8]==3 & addr_reg[11:10]==0 & addr_reg[13:12]==2) ? data_in_reg: 0;

	assign data_in_sub_36 = (en_reg & addr_reg[9:8]==0 & addr_reg[11:10]==1 & addr_reg[13:12]==2) ? data_in_reg: 0;
	assign data_in_sub_37 = (en_reg & addr_reg[9:8]==1 & addr_reg[11:10]==1 & addr_reg[13:12]==2) ? data_in_reg: 0;
	assign data_in_sub_38 = (en_reg & addr_reg[9:8]==2 & addr_reg[11:10]==1 & addr_reg[13:12]==2) ? data_in_reg: 0;
	assign data_in_sub_39 = (en_reg & addr_reg[9:8]==3 & addr_reg[11:10]==1 & addr_reg[13:12]==2) ? data_in_reg: 0;

	assign data_in_sub_40 = (en_reg & addr_reg[9:8]==0 & addr_reg[11:10]==2 & addr_reg[13:12]==2) ? data_in_reg: 0;
	assign data_in_sub_41 = (en_reg & addr_reg[9:8]==1 & addr_reg[11:10]==2 & addr_reg[13:12]==2) ? data_in_reg: 0;
	assign data_in_sub_42 = (en_reg & addr_reg[9:8]==2 & addr_reg[11:10]==2 & addr_reg[13:12]==2) ? data_in_reg: 0;
	assign data_in_sub_43 = (en_reg & addr_reg[9:8]==3 & addr_reg[11:10]==2 & addr_reg[13:12]==2) ? data_in_reg: 0;

	assign data_in_sub_44 = (en_reg & addr_reg[9:8]==0 & addr_reg[11:10]==3 & addr_reg[13:12]==2) ? data_in_reg: 0;
	assign data_in_sub_45 = (en_reg & addr_reg[9:8]==1 & addr_reg[11:10]==3 & addr_reg[13:12]==2) ? data_in_reg: 0;
	assign data_in_sub_46 = (en_reg & addr_reg[9:8]==2 & addr_reg[11:10]==3 & addr_reg[13:12]==2) ? data_in_reg: 0;
	assign data_in_sub_47 = (en_reg & addr_reg[9:8]==3 & addr_reg[11:10]==3 & addr_reg[13:12]==2) ? data_in_reg: 0;





	assign data_in_sub_48 = (en_reg & addr_reg[9:8]==0 & addr_reg[11:10]==0 & addr_reg[13:12]==3) ? data_in_reg: 0;
	assign data_in_sub_49 = (en_reg & addr_reg[9:8]==1 & addr_reg[11:10]==0 & addr_reg[13:12]==3) ? data_in_reg: 0;
	assign data_in_sub_50 = (en_reg & addr_reg[9:8]==2 & addr_reg[11:10]==0 & addr_reg[13:12]==3) ? data_in_reg: 0;
	assign data_in_sub_51 = (en_reg & addr_reg[9:8]==3 & addr_reg[11:10]==0 & addr_reg[13:12]==3) ? data_in_reg: 0;

	assign data_in_sub_52 = (en_reg & addr_reg[9:8]==0 & addr_reg[11:10]==1 & addr_reg[13:12]==3) ? data_in_reg: 0;
	assign data_in_sub_53 = (en_reg & addr_reg[9:8]==1 & addr_reg[11:10]==1 & addr_reg[13:12]==3) ? data_in_reg: 0;
	assign data_in_sub_54 = (en_reg & addr_reg[9:8]==2 & addr_reg[11:10]==1 & addr_reg[13:12]==3) ? data_in_reg: 0;
	assign data_in_sub_55 = (en_reg & addr_reg[9:8]==3 & addr_reg[11:10]==1 & addr_reg[13:12]==3) ? data_in_reg: 0;

	assign data_in_sub_56 = (en_reg & addr_reg[9:8]==0 & addr_reg[11:10]==2 & addr_reg[13:12]==3) ? data_in_reg: 0;
	assign data_in_sub_57 = (en_reg & addr_reg[9:8]==1 & addr_reg[11:10]==2 & addr_reg[13:12]==3) ? data_in_reg: 0;
	assign data_in_sub_58 = (en_reg & addr_reg[9:8]==2 & addr_reg[11:10]==2 & addr_reg[13:12]==3) ? data_in_reg: 0;
	assign data_in_sub_59 = (en_reg & addr_reg[9:8]==3 & addr_reg[11:10]==2 & addr_reg[13:12]==3) ? data_in_reg: 0;

	assign data_in_sub_60 = (en_reg & addr_reg[9:8]==0 & addr_reg[11:10]==3 & addr_reg[13:12]==3) ? data_in_reg: 0;
	assign data_in_sub_61 = (en_reg & addr_reg[9:8]==1 & addr_reg[11:10]==3 & addr_reg[13:12]==3) ? data_in_reg: 0;
	assign data_in_sub_62 = (en_reg & addr_reg[9:8]==2 & addr_reg[11:10]==3 & addr_reg[13:12]==3) ? data_in_reg: 0;
	assign data_in_sub_63 = (en_reg & addr_reg[9:8]==3 & addr_reg[11:10]==3 & addr_reg[13:12]==3) ? data_in_reg: 0;


	/////////////////////////////
	// write_submodule_instances()
	/////////////////////////////

	// Define the output wire data_out

	//wire [BusWidth-1:0] data_out_sub_0;
	//wire [BusWidth-1:0] data_out_sub_1;
	//wire [BusWidth-1:0] data_out_sub_2;
	//wire [BusWidth-1:0] data_out_sub_3;


	
	TS1N28HPCPLVTB256X32M4SWBASO SRAM_0(
		.CLK(CLK),
		.A(addr_sub_0),
		.CEB(~en_sub_0),
		.WEB(~we_sub_0),
		.D(data_in_sub_0),
		.Q(data_out_sub_0)
	);

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


