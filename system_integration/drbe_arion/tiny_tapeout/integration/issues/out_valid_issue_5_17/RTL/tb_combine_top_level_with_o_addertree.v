`timescale 10ps / 1ps

module tb_combine_top_level_with_o_addertree();
    reg [15:0] data_real1, data_img1, data_real2, data_img2, data_real3, data_img3;
    reg [15:0] coe;
    reg [9:0] interp_coe;
    reg CLK, sel1,sel2,sel3,sel4,Reset;
    wire [15:0]output_real_with_multi_1, output_real_with_multi_2, output_real_with_multi_3;
    wire [15:0]output_img_with_multi_1, output_img_with_multi_2, output_img_with_multi_3;
    integer count=0;
    integer count1=0;
    integer count2=0;
    integer count3=0;
    integer count4=0;
    integer count5=0;
    initial begin
        CLK = 1'b0;
        forever #19 CLK = ~CLK;
    end

    initial begin
        Reset = 1'b1;
        #200 Reset=1'b0;
    end

    initial begin
    sel1=1'b0;  
    while (count1<10)
    	begin  
   	#190 sel1=1'b1;
    	#190 sel1=1'b0;    
    	#190 sel1=1'b1;
    	#190 sel1=1'b0;    
    	#190 sel1=1'b1;
    	#190 sel1=1'b0;
    	#190 sel1=1'b1;
    	#190 sel1=1'b0;
   	#190 sel1=1'b1;
    	#190 sel1=1'b0;    
    	#190 sel1=1'b1;
    	#190 sel1=1'b0;    
    	#190 sel1=1'b1;
    	#190 sel1=1'b0;
    	#190 sel1=1'b1;
    	#190 sel1=1'b0;
   	#190 sel1=1'b1;
    	#190 sel1=1'b0;    
    	#190 sel1=1'b1;
    	#190 sel1=1'b0;    
    	#190 sel1=1'b1;
    	#190 sel1=1'b0;
    	#190 sel1=1'b1;
    	#190 sel1=1'b0;
        #3800 sel1=1'b0;
        count1=count1+1;
    	end
    end
    initial begin
    sel2=1'b0;  
    	while (count2<10)
    	begin  
        #3420 sel2=1'b0;
   	#190 sel2=1'b1;
    	#190 sel2=1'b0;    
    	#190 sel2=1'b1;
    	#190 sel2=1'b0;    
    	#190 sel2=1'b1;
    	#190 sel2=1'b0;
        #3800 sel2=1'b0;
        count2=count2+1;
    	end
    end
    initial begin
               sel3=1'b0;
         #4560 sel3=1'b1;
         #38   sel3=1'b0;
         #3762 sel3=1'b0;
         #4560 sel3=1'b1;
         #38   sel3=1'b0;
         #3762 sel3=1'b0;
         #4560 sel3=1'b1;
         #38   sel3=1'b0;
         #3762 sel3=1'b0;

    end

    initial begin
               sel4=1'b0;
         #4560 sel4=1'b1;
         #38   sel4=1'b0;
         #3762 sel4=1'b0;
         #4560 sel4=1'b1;
         #38   sel4=1'b0;
         #3762 sel4=1'b0;
         #4560 sel4=1'b1;
         #38   sel4=1'b0;
         #3762 sel4=1'b0;

    end

   initial begin

        data_real1=16'b0011110000000000;
        data_img1 =16'b0011110000000000;
        data_real2=16'b0011110000000000;
        data_img2 =16'b0011110000000000;
        data_real3=16'b0011110000000000;
        data_img3 =16'b0011110000000000;
        while (count<100)
        begin
        #38
        data_real1=16'b0100000000000000;
        data_img1 =16'b0100000000000000;
        data_real2=16'b0100000000000000;
        data_img2 =16'b0100000000000000;
        data_real3=16'b0100000000000000;
        data_img3 =16'b0100000000000000;
        #38
        data_real1=16'b0100001000000000;
        data_img1 =16'b0100001000000000;
        data_real2=16'b0100001000000000;
        data_img2 =16'b0100001000000000;
        data_real3=16'b0100001000000000;
        data_img3 =16'b0100001000000000;
        #38
        data_real1=16'b0100010000000000;
        data_img1 =16'b0100010000000000;
        data_real2=16'b0100010000000000;
        data_img2 =16'b0100010000000000;
        data_real3=16'b0100010000000000;
        data_img3 =16'b0100010000000000;
        #38
        data_real1=16'b0100010100000000;
        data_img1 =16'b0100010100000000;
        data_real2=16'b0100010100000000;
        data_img2 =16'b0100010100000000;
        data_real3=16'b0100010100000000;
        data_img3 =16'b0100010100000000;
	#38
        data_real1=16'b0011110000000000;
        data_img1 =16'b0011110000000000;
        data_real2=16'b0011110000000000;
        data_img2 =16'b0011110000000000;
        data_real3=16'b0011110000000000;
        data_img3 =16'b0011110000000000;
        count<=count+1;
        end
   end
   initial begin
	interp_coe=10'b0000000000;
        while (count4<30)
        begin
  	#8360 interp_coe=10'b0011110000;
   	#8360 interp_coe=10'b0000000000;
        count4<=count4+1;
        end
   end
   initial begin
	coe=16'b0000000000000000;
        while (count5<30)
        begin
  	#8360 coe=16'b0011110000000000;
   	#8360 coe=16'b0000000000000000;
        count5<=count5+1;
        end
   end


   combine_top_level_with_o_addertree_1 CTL(
    .data_real1(data_real1), .data_img1(data_img1),
    .data_real2(data_real2), .data_img2(data_img2),
    .data_real3(data_real3), .data_img3(data_img3),
    .interp_coe(interp_coe),
    .coe(coe),.Reset(Reset),
    .CLK(CLK), .sel1(sel1), .sel2(sel2),.sel3(sel3),.sel4(sel4),
    .output_real_with_multi_1(output_real_with_multi_1), .output_real_with_multi_2(output_real_with_multi_2), .output_real_with_multi_3(output_real_with_multi_3),
    .output_img_with_multi_1(output_img_with_multi_1), .output_img_with_multi_2(output_img_with_multi_2), .output_img_with_multi_3(output_img_with_multi_3)
   );
     
endmodule
