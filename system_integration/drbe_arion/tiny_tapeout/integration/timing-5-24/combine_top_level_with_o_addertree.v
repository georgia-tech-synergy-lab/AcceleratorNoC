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
    //wire      [15:0] output_real_1,output_real_2,output_real_3,output_img_1,output_img_2,output_img_3;
    output    [15:0] output_real_with_multi_1, output_real_with_multi_2, output_real_with_multi_3;
    output    [15:0] output_img_with_multi_1, output_img_with_multi_2, output_img_with_multi_3;

endmodule
