module combine_top_level_with_o_addertree_1( 
    data_real1, data_img1, data_real2, data_img2, data_real3, data_img3,
    coe,
    interp_coe,
    CLK,sel1,sel2,sel3,sel4,Reset,
    output_real_with_multi_1, output_real_with_multi_2, output_real_with_multi_3,
    output_img_with_multi_1, output_img_with_multi_2, output_img_with_multi_3);

    input     CLK,sel1,sel2,sel3,sel4,Reset;
    input     [15:0] data_real1, data_img1,data_real2, data_img2,data_real3, data_img3;
    input     [15:0] coe;
    input     [9:0]  interp_coe;
    wire      [15:0] output_real_1,output_real_2,output_real_3,output_img_1,output_img_2,output_img_3;
    output    [15:0] output_real_with_multi_1, output_real_with_multi_2, output_real_with_multi_3;
    output    [15:0] output_img_with_multi_1, output_img_with_multi_2, output_img_with_multi_3;

    wire [15:0] d1_real1,d1_real2,d1_real3,d1_real4;
    wire [15:0] d2_real1,d2_real2,d2_real3,d2_real4;
    wire [15:0] d3_real1,d3_real2,d3_real3,d3_real4;

    wire [15:0] d1_img1,d1_img2,d1_img3,d1_img4;
    wire [15:0] d2_img1,d2_img2,d2_img3,d2_img4;
    wire [15:0] d3_img1,d3_img2,d3_img3,d3_img4;

    wire [9:0] c1,c2,c3,c4,c5,c6,c7,c8,c9,c10,c11,c12;
    wire [9:0] m1,m2,m3,m4,m5,m6,m7,m8,m9,m10,m11,m12;

    wire [15:0] cc1,cc2,cc3;
    wire [15:0] mm1,mm2,mm3;

    //wire [15:0] output_s_1,output_s_2;
    //interp_coe
    shift_register_10bits_combine COE(
    .CLK(sel1),.din(interp_coe),.Q1(c1),.Q2(c2),.Q3(c3),.Q4(c4),.Q5(c5),
    .Q6(c6),.Q7(c7),.Q8(c8),.Q9(c9),.Q10(c10),.Q11(c11),.Q12(c12),.Reset(Reset)
    );
    buffer_block_10bits_combine COE_BUFFER(
    .CLK(sel3),.Reset(Reset),
    .D1(c1),.D2(c2),.D3(c3),.D4(c4),.D5(c5),.D6(c6),.D7(c7),.D8(c8),.D9(c9),.D10(c10),.D11(c11),.D12(c12),
    .Q1(m1),.Q2(m2),.Q3(m3),.Q4(m4),.Q5(m5),.Q6(m6),.Q7(m7),.Q8(m8),.Q9(m9),.Q10(m10),.Q11(m11),.Q12(m12)
    );


    //data1
    shift_register_16bits Data_S1(
    .CLK(CLK),.din(data_real1),.Q1(d1_real1),.Q2(d1_real2),.Q3(d1_real3),.Q4(d1_real4),.Reset(Reset)
    );    
    shift_register_16bits Data_S2(
    .CLK(CLK),.din(data_img1),.Q1(d1_img1), .Q2(d1_img2),.Q3(d1_img3),.Q4(d1_img4),.Reset(Reset)
    );

    //data2
    shift_register_16bits Data_S5(
    .CLK(CLK),.din(data_real2),.Q1(d2_real1),.Q2(d2_real2),.Q3(d2_real3),.Q4(d2_real4),.Reset(Reset)
    );    
    shift_register_16bits Data_S6(
    .CLK(CLK),.din(data_img2),.Q1(d2_img1), .Q2(d2_img2),.Q3(d2_img3),.Q4(d2_img4),.Reset(Reset)
    );

    //data3
    shift_register_16bits Data_S9(
    .CLK(CLK),.din(data_real3),.Q1(d3_real1),.Q2(d3_real2),.Q3(d3_real3),.Q4(d3_real4),.Reset(Reset)
    );    
    shift_register_16bits Data_S10(
    .CLK(CLK),.din(data_img3),.Q1(d3_img1), .Q2(d3_img2),.Q3(d3_img3),.Q4(d3_img4),.Reset(Reset)
    );


    //interpolation_filters
    interpolation_filter IF1(
         .multi1_a(d1_real1), .multi2_a(d1_real2), .multi3_a(d1_real3), .multi4_a(d1_real4),
         .multi5_a(d1_img1), .multi6_a(d1_img2), .multi7_a(d1_img3), .multi8_a(d1_img4),
         .multi1_b(m1), .multi2_b(m2), .multi3_b(m3), .multi4_b(m4),
	 .CLK(CLK),.Reset(Reset),
         .output_real(output_real_1),
         .output_img(output_img_1)
    );
    interpolation_filter IF2(
         .multi1_a(d2_real1), .multi2_a(d2_real2), .multi3_a(d2_real3), .multi4_a(d2_real4),
         .multi5_a(d2_img1), .multi6_a(d2_img2), .multi7_a(d2_img3), .multi8_a(d2_img4),
         .multi1_b(m5), .multi2_b(m6), .multi3_b(m7), .multi4_b(m8),
	 .CLK(CLK),.Reset(Reset),
         .output_real(output_real_2),
         .output_img(output_img_2)
    );
    interpolation_filter IF3(
         .multi1_a(d3_real1), .multi2_a(d3_real2), .multi3_a(d3_real3), .multi4_a(d3_real4),
         .multi5_a(d3_img1), .multi6_a(d3_img2), .multi7_a(d3_img3), .multi8_a(d3_img4),
         .multi1_b(m9), .multi2_b(m10), .multi3_b(m11), .multi4_b(m12),
	 .CLK(CLK),.Reset(Reset),
         .output_real(output_real_3),
         .output_img(output_img_3)
    );

    //coe
    shift_register_16bits_combine P1(
    .CLK(sel2),.din(coe),.Q1(cc1),.Q2(cc2),.Q3(cc3),.Reset(Reset)
    );
    buffer_block_16bits_combine P2(
    .CLK(sel4),.D1(cc1),.D2(cc2),.D3(cc3),.Q1(mm1),.Q2(mm2),.Q3(mm3),.Reset(Reset)
    );

    //multipliers
    multiplier_16FP MUL1(.num1_(mm1), .CLK(CLK),.num2_(output_real_1), .result(output_real_with_multi_1),.reset(Reset));
    multiplier_16FP MUL2(.num1_(mm1), .CLK(CLK),.num2_(output_img_1), .result(output_img_with_multi_1),.reset(Reset));
    multiplier_16FP MUL3(.num1_(mm2), .CLK(CLK),.num2_(output_real_2), .result(output_real_with_multi_2),.reset(Reset));
    multiplier_16FP MUL4(.num1_(mm2), .CLK(CLK),.num2_(output_img_2), .result(output_img_with_multi_2),.reset(Reset));
    multiplier_16FP MUL5(.num1_(mm3), .CLK(CLK),.num2_(output_real_3), .result(output_real_with_multi_3),.reset(Reset));
    multiplier_16FP MUL6(.num1_(mm3), .CLK(CLK),.num2_(output_img_3), .result(output_img_with_multi_3),.reset(Reset));

endmodule
