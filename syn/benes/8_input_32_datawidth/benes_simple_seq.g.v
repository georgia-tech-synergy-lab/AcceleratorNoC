
module distribute_2x2_simple_seq_DATA_WIDTH32_COMMAND_WIDTH2_0 ( clk, rst, 
        i_valid, i_data_bus, o_valid, o_data_bus, i_en, i_cmd );
  input [1:0] i_valid;
  input [63:0] i_data_bus;
  output [1:0] o_valid;
  output [63:0] o_data_bus;
  input [1:0] i_cmd;
  input clk, rst, i_en;
  wire   N287, N288, N289, N290, N291, N292, N293, N294, N295, N296, N297,
         N298, N299, N300, N301, N302, N303, N304, N305, N306, N307, N308,
         N309, N310, N311, N312, N313, N314, N315, N316, N317, N318, N319,
         N320, N321, N322, N323, N324, N325, N326, N327, N328, N329, N330,
         N331, N332, N333, N334, N335, N336, N337, N338, N339, N340, N341,
         N342, N343, N344, N345, N346, N347, N348, N349, N350, N353, N354, n1,
         n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30,
         n31, n32, n33, n34, n35, n36, n37, n38, n39, n40, n41, n42, n43, n44,
         n45, n46;

  DFQD1BWP30P140LVT o_data_bus_inner_reg_63_ ( .D(N350), .CP(clk), .Q(
        o_data_bus[63]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_62_ ( .D(N349), .CP(clk), .Q(
        o_data_bus[62]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_61_ ( .D(N348), .CP(clk), .Q(
        o_data_bus[61]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_60_ ( .D(N347), .CP(clk), .Q(
        o_data_bus[60]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_59_ ( .D(N346), .CP(clk), .Q(
        o_data_bus[59]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_58_ ( .D(N345), .CP(clk), .Q(
        o_data_bus[58]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_57_ ( .D(N344), .CP(clk), .Q(
        o_data_bus[57]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_56_ ( .D(N343), .CP(clk), .Q(
        o_data_bus[56]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_55_ ( .D(N342), .CP(clk), .Q(
        o_data_bus[55]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_54_ ( .D(N341), .CP(clk), .Q(
        o_data_bus[54]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_53_ ( .D(N340), .CP(clk), .Q(
        o_data_bus[53]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_52_ ( .D(N339), .CP(clk), .Q(
        o_data_bus[52]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_51_ ( .D(N338), .CP(clk), .Q(
        o_data_bus[51]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_50_ ( .D(N337), .CP(clk), .Q(
        o_data_bus[50]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_49_ ( .D(N336), .CP(clk), .Q(
        o_data_bus[49]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_48_ ( .D(N335), .CP(clk), .Q(
        o_data_bus[48]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_47_ ( .D(N334), .CP(clk), .Q(
        o_data_bus[47]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_46_ ( .D(N333), .CP(clk), .Q(
        o_data_bus[46]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_45_ ( .D(N332), .CP(clk), .Q(
        o_data_bus[45]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_44_ ( .D(N331), .CP(clk), .Q(
        o_data_bus[44]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_43_ ( .D(N330), .CP(clk), .Q(
        o_data_bus[43]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_42_ ( .D(N329), .CP(clk), .Q(
        o_data_bus[42]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_41_ ( .D(N328), .CP(clk), .Q(
        o_data_bus[41]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_40_ ( .D(N327), .CP(clk), .Q(
        o_data_bus[40]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_39_ ( .D(N326), .CP(clk), .Q(
        o_data_bus[39]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_38_ ( .D(N325), .CP(clk), .Q(
        o_data_bus[38]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_37_ ( .D(N324), .CP(clk), .Q(
        o_data_bus[37]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_36_ ( .D(N323), .CP(clk), .Q(
        o_data_bus[36]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_35_ ( .D(N322), .CP(clk), .Q(
        o_data_bus[35]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_34_ ( .D(N321), .CP(clk), .Q(
        o_data_bus[34]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_33_ ( .D(N320), .CP(clk), .Q(
        o_data_bus[33]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_32_ ( .D(N319), .CP(clk), .Q(
        o_data_bus[32]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_31_ ( .D(N318), .CP(clk), .Q(
        o_data_bus[31]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_30_ ( .D(N317), .CP(clk), .Q(
        o_data_bus[30]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_29_ ( .D(N316), .CP(clk), .Q(
        o_data_bus[29]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_28_ ( .D(N315), .CP(clk), .Q(
        o_data_bus[28]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_27_ ( .D(N314), .CP(clk), .Q(
        o_data_bus[27]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_26_ ( .D(N313), .CP(clk), .Q(
        o_data_bus[26]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_25_ ( .D(N312), .CP(clk), .Q(
        o_data_bus[25]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_24_ ( .D(N311), .CP(clk), .Q(
        o_data_bus[24]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_23_ ( .D(N310), .CP(clk), .Q(
        o_data_bus[23]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_22_ ( .D(N309), .CP(clk), .Q(
        o_data_bus[22]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_21_ ( .D(N308), .CP(clk), .Q(
        o_data_bus[21]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_20_ ( .D(N307), .CP(clk), .Q(
        o_data_bus[20]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_19_ ( .D(N306), .CP(clk), .Q(
        o_data_bus[19]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_18_ ( .D(N305), .CP(clk), .Q(
        o_data_bus[18]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_17_ ( .D(N304), .CP(clk), .Q(
        o_data_bus[17]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_16_ ( .D(N303), .CP(clk), .Q(
        o_data_bus[16]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_15_ ( .D(N302), .CP(clk), .Q(
        o_data_bus[15]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_14_ ( .D(N301), .CP(clk), .Q(
        o_data_bus[14]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_13_ ( .D(N300), .CP(clk), .Q(
        o_data_bus[13]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_12_ ( .D(N299), .CP(clk), .Q(
        o_data_bus[12]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_11_ ( .D(N298), .CP(clk), .Q(
        o_data_bus[11]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_10_ ( .D(N297), .CP(clk), .Q(
        o_data_bus[10]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_9_ ( .D(N296), .CP(clk), .Q(
        o_data_bus[9]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_8_ ( .D(N295), .CP(clk), .Q(
        o_data_bus[8]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_7_ ( .D(N294), .CP(clk), .Q(
        o_data_bus[7]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_6_ ( .D(N293), .CP(clk), .Q(
        o_data_bus[6]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_5_ ( .D(N292), .CP(clk), .Q(
        o_data_bus[5]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_4_ ( .D(N291), .CP(clk), .Q(
        o_data_bus[4]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_3_ ( .D(N290), .CP(clk), .Q(
        o_data_bus[3]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_2_ ( .D(N289), .CP(clk), .Q(
        o_data_bus[2]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_1_ ( .D(N288), .CP(clk), .Q(
        o_data_bus[1]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_0_ ( .D(N287), .CP(clk), .Q(
        o_data_bus[0]) );
  DFQD1BWP30P140LVT o_valid_inner_reg_1_ ( .D(N354), .CP(clk), .Q(o_valid[1])
         );
  DFQD1BWP30P140LVT o_valid_inner_reg_0_ ( .D(N353), .CP(clk), .Q(o_valid[0])
         );
  BUFFD4BWP30P140LVT U3 ( .I(n8), .Z(n9) );
  BUFFD6BWP30P140LVT U4 ( .I(n13), .Z(n14) );
  OAI211OPTREPBD1BWP30P140LVT U5 ( .A1(i_cmd[1]), .A2(i_valid[0]), .B(i_cmd[0]), .C(n7), .ZN(n8) );
  NR2D3BWP30P140LVT U6 ( .A1(i_cmd[0]), .A2(n5), .ZN(n2) );
  INVD1BWP30P140LVT U7 ( .I(i_valid[1]), .ZN(n12) );
  ND2OPTIBD1BWP30P140LVT U8 ( .A1(n10), .A2(i_valid[0]), .ZN(n5) );
  ND3D2BWP30P140LVT U9 ( .A1(n10), .A2(i_cmd[1]), .A3(i_valid[1]), .ZN(n1) );
  ND3D2BWP30P140LVT U10 ( .A1(n10), .A2(i_cmd[1]), .A3(i_valid[1]), .ZN(n4) );
  INR2D1BWP30P140LVT U11 ( .A1(i_en), .B1(rst), .ZN(n10) );
  AOI31D1BWP30P140LVT U12 ( .A1(i_cmd[0]), .A2(n10), .A3(i_valid[1]), .B(n2), 
        .ZN(n3) );
  INVD1BWP30P140LVT U13 ( .I(n3), .ZN(N353) );
  OAI21D1BWP30P140LVT U14 ( .A1(i_cmd[1]), .A2(n5), .B(n4), .ZN(N354) );
  INVD1BWP30P140LVT U15 ( .I(i_data_bus[32]), .ZN(n15) );
  INVD1BWP30P140LVT U16 ( .I(n10), .ZN(n6) );
  AOI21D1BWP30P140LVT U17 ( .A1(i_cmd[1]), .A2(n12), .B(n6), .ZN(n7) );
  MOAI22D1BWP30P140LVT U18 ( .A1(n15), .A2(n9), .B1(i_data_bus[0]), .B2(n2), 
        .ZN(N287) );
  INVD1BWP30P140LVT U19 ( .I(i_data_bus[33]), .ZN(n16) );
  MOAI22D1BWP30P140LVT U20 ( .A1(n9), .A2(n16), .B1(n2), .B2(i_data_bus[1]), 
        .ZN(N288) );
  INVD1BWP30P140LVT U21 ( .I(i_data_bus[34]), .ZN(n17) );
  MOAI22D1BWP30P140LVT U22 ( .A1(n9), .A2(n17), .B1(n2), .B2(i_data_bus[2]), 
        .ZN(N289) );
  INVD1BWP30P140LVT U23 ( .I(i_data_bus[35]), .ZN(n18) );
  MOAI22D1BWP30P140LVT U24 ( .A1(n9), .A2(n18), .B1(n2), .B2(i_data_bus[3]), 
        .ZN(N290) );
  INVD1BWP30P140LVT U25 ( .I(i_data_bus[36]), .ZN(n19) );
  MOAI22D1BWP30P140LVT U26 ( .A1(n9), .A2(n19), .B1(n2), .B2(i_data_bus[4]), 
        .ZN(N291) );
  INVD1BWP30P140LVT U27 ( .I(i_data_bus[37]), .ZN(n20) );
  MOAI22D1BWP30P140LVT U28 ( .A1(n9), .A2(n20), .B1(n2), .B2(i_data_bus[5]), 
        .ZN(N292) );
  INVD1BWP30P140LVT U29 ( .I(i_data_bus[38]), .ZN(n21) );
  MOAI22D1BWP30P140LVT U30 ( .A1(n9), .A2(n21), .B1(n2), .B2(i_data_bus[6]), 
        .ZN(N293) );
  INVD1BWP30P140LVT U31 ( .I(i_data_bus[39]), .ZN(n22) );
  MOAI22D1BWP30P140LVT U32 ( .A1(n9), .A2(n22), .B1(n2), .B2(i_data_bus[7]), 
        .ZN(N294) );
  INVD1BWP30P140LVT U33 ( .I(i_data_bus[40]), .ZN(n23) );
  MOAI22D1BWP30P140LVT U34 ( .A1(n9), .A2(n23), .B1(n2), .B2(i_data_bus[8]), 
        .ZN(N295) );
  INVD1BWP30P140LVT U35 ( .I(i_data_bus[41]), .ZN(n24) );
  MOAI22D1BWP30P140LVT U36 ( .A1(n9), .A2(n24), .B1(n2), .B2(i_data_bus[9]), 
        .ZN(N296) );
  INVD1BWP30P140LVT U37 ( .I(i_data_bus[42]), .ZN(n25) );
  MOAI22D1BWP30P140LVT U38 ( .A1(n9), .A2(n25), .B1(n2), .B2(i_data_bus[10]), 
        .ZN(N297) );
  INVD1BWP30P140LVT U39 ( .I(i_data_bus[43]), .ZN(n26) );
  MOAI22D1BWP30P140LVT U40 ( .A1(n9), .A2(n26), .B1(n2), .B2(i_data_bus[11]), 
        .ZN(N298) );
  INVD1BWP30P140LVT U41 ( .I(i_data_bus[44]), .ZN(n27) );
  MOAI22D1BWP30P140LVT U42 ( .A1(n9), .A2(n27), .B1(n2), .B2(i_data_bus[12]), 
        .ZN(N299) );
  INVD1BWP30P140LVT U43 ( .I(i_data_bus[45]), .ZN(n28) );
  MOAI22D1BWP30P140LVT U44 ( .A1(n9), .A2(n28), .B1(n2), .B2(i_data_bus[13]), 
        .ZN(N300) );
  INVD1BWP30P140LVT U45 ( .I(i_data_bus[46]), .ZN(n29) );
  MOAI22D1BWP30P140LVT U46 ( .A1(n9), .A2(n29), .B1(n2), .B2(i_data_bus[14]), 
        .ZN(N301) );
  INVD1BWP30P140LVT U47 ( .I(i_data_bus[47]), .ZN(n30) );
  MOAI22D1BWP30P140LVT U48 ( .A1(n9), .A2(n30), .B1(n2), .B2(i_data_bus[15]), 
        .ZN(N302) );
  INVD1BWP30P140LVT U49 ( .I(i_data_bus[48]), .ZN(n31) );
  MOAI22D1BWP30P140LVT U50 ( .A1(n9), .A2(n31), .B1(n2), .B2(i_data_bus[16]), 
        .ZN(N303) );
  INVD1BWP30P140LVT U51 ( .I(i_data_bus[49]), .ZN(n32) );
  MOAI22D1BWP30P140LVT U52 ( .A1(n9), .A2(n32), .B1(n2), .B2(i_data_bus[17]), 
        .ZN(N304) );
  INVD1BWP30P140LVT U53 ( .I(i_data_bus[50]), .ZN(n33) );
  MOAI22D1BWP30P140LVT U54 ( .A1(n9), .A2(n33), .B1(n2), .B2(i_data_bus[18]), 
        .ZN(N305) );
  INVD1BWP30P140LVT U55 ( .I(i_data_bus[51]), .ZN(n34) );
  MOAI22D1BWP30P140LVT U56 ( .A1(n9), .A2(n34), .B1(n2), .B2(i_data_bus[19]), 
        .ZN(N306) );
  INVD1BWP30P140LVT U57 ( .I(i_data_bus[52]), .ZN(n35) );
  MOAI22D1BWP30P140LVT U58 ( .A1(n9), .A2(n35), .B1(n2), .B2(i_data_bus[20]), 
        .ZN(N307) );
  INVD1BWP30P140LVT U59 ( .I(i_data_bus[53]), .ZN(n36) );
  MOAI22D1BWP30P140LVT U60 ( .A1(n9), .A2(n36), .B1(n2), .B2(i_data_bus[21]), 
        .ZN(N308) );
  INVD1BWP30P140LVT U61 ( .I(i_data_bus[54]), .ZN(n37) );
  MOAI22D1BWP30P140LVT U62 ( .A1(n9), .A2(n37), .B1(n2), .B2(i_data_bus[22]), 
        .ZN(N309) );
  INVD1BWP30P140LVT U63 ( .I(i_data_bus[55]), .ZN(n38) );
  MOAI22D1BWP30P140LVT U64 ( .A1(n9), .A2(n38), .B1(n2), .B2(i_data_bus[23]), 
        .ZN(N310) );
  INVD1BWP30P140LVT U65 ( .I(i_data_bus[56]), .ZN(n39) );
  MOAI22D1BWP30P140LVT U66 ( .A1(n9), .A2(n39), .B1(n2), .B2(i_data_bus[24]), 
        .ZN(N311) );
  INVD1BWP30P140LVT U67 ( .I(i_data_bus[57]), .ZN(n40) );
  MOAI22D1BWP30P140LVT U68 ( .A1(n9), .A2(n40), .B1(n2), .B2(i_data_bus[25]), 
        .ZN(N312) );
  INVD1BWP30P140LVT U69 ( .I(i_data_bus[58]), .ZN(n41) );
  MOAI22D1BWP30P140LVT U70 ( .A1(n9), .A2(n41), .B1(n2), .B2(i_data_bus[26]), 
        .ZN(N313) );
  INVD1BWP30P140LVT U71 ( .I(i_data_bus[59]), .ZN(n42) );
  MOAI22D1BWP30P140LVT U72 ( .A1(n9), .A2(n42), .B1(n2), .B2(i_data_bus[27]), 
        .ZN(N314) );
  INVD1BWP30P140LVT U73 ( .I(i_data_bus[60]), .ZN(n43) );
  MOAI22D1BWP30P140LVT U74 ( .A1(n9), .A2(n43), .B1(n2), .B2(i_data_bus[28]), 
        .ZN(N315) );
  INVD1BWP30P140LVT U75 ( .I(i_data_bus[61]), .ZN(n44) );
  MOAI22D1BWP30P140LVT U76 ( .A1(n9), .A2(n44), .B1(n2), .B2(i_data_bus[29]), 
        .ZN(N316) );
  INVD1BWP30P140LVT U77 ( .I(i_data_bus[62]), .ZN(n45) );
  MOAI22D1BWP30P140LVT U78 ( .A1(n9), .A2(n45), .B1(n2), .B2(i_data_bus[30]), 
        .ZN(N317) );
  INVD1BWP30P140LVT U79 ( .I(i_data_bus[63]), .ZN(n46) );
  MOAI22D1BWP30P140LVT U80 ( .A1(n9), .A2(n46), .B1(n2), .B2(i_data_bus[31]), 
        .ZN(N318) );
  OAI21D2BWP30P140LVT U81 ( .A1(i_cmd[0]), .A2(i_valid[0]), .B(n10), .ZN(n11)
         );
  AOI211D2BWP30P140LVT U82 ( .A1(i_cmd[0]), .A2(n12), .B(i_cmd[1]), .C(n11), 
        .ZN(n13) );
  MOAI22D1BWP30P140LVT U83 ( .A1(n15), .A2(n1), .B1(i_data_bus[0]), .B2(n14), 
        .ZN(N319) );
  MOAI22D1BWP30P140LVT U84 ( .A1(n16), .A2(n4), .B1(i_data_bus[1]), .B2(n14), 
        .ZN(N320) );
  MOAI22D1BWP30P140LVT U85 ( .A1(n17), .A2(n1), .B1(i_data_bus[2]), .B2(n14), 
        .ZN(N321) );
  MOAI22D1BWP30P140LVT U86 ( .A1(n18), .A2(n4), .B1(i_data_bus[3]), .B2(n14), 
        .ZN(N322) );
  MOAI22D1BWP30P140LVT U87 ( .A1(n19), .A2(n1), .B1(i_data_bus[4]), .B2(n14), 
        .ZN(N323) );
  MOAI22D1BWP30P140LVT U88 ( .A1(n20), .A2(n4), .B1(i_data_bus[5]), .B2(n14), 
        .ZN(N324) );
  MOAI22D1BWP30P140LVT U89 ( .A1(n21), .A2(n1), .B1(i_data_bus[6]), .B2(n14), 
        .ZN(N325) );
  MOAI22D1BWP30P140LVT U90 ( .A1(n22), .A2(n4), .B1(i_data_bus[7]), .B2(n14), 
        .ZN(N326) );
  MOAI22D1BWP30P140LVT U91 ( .A1(n23), .A2(n1), .B1(i_data_bus[8]), .B2(n14), 
        .ZN(N327) );
  MOAI22D1BWP30P140LVT U92 ( .A1(n24), .A2(n4), .B1(i_data_bus[9]), .B2(n14), 
        .ZN(N328) );
  MOAI22D1BWP30P140LVT U93 ( .A1(n25), .A2(n1), .B1(i_data_bus[10]), .B2(n14), 
        .ZN(N329) );
  MOAI22D1BWP30P140LVT U94 ( .A1(n26), .A2(n4), .B1(i_data_bus[11]), .B2(n14), 
        .ZN(N330) );
  MOAI22D1BWP30P140LVT U95 ( .A1(n27), .A2(n1), .B1(i_data_bus[12]), .B2(n14), 
        .ZN(N331) );
  MOAI22D1BWP30P140LVT U96 ( .A1(n28), .A2(n4), .B1(i_data_bus[13]), .B2(n14), 
        .ZN(N332) );
  MOAI22D1BWP30P140LVT U97 ( .A1(n29), .A2(n1), .B1(i_data_bus[14]), .B2(n14), 
        .ZN(N333) );
  MOAI22D1BWP30P140LVT U98 ( .A1(n30), .A2(n4), .B1(i_data_bus[15]), .B2(n14), 
        .ZN(N334) );
  MOAI22D1BWP30P140LVT U99 ( .A1(n31), .A2(n1), .B1(i_data_bus[16]), .B2(n14), 
        .ZN(N335) );
  MOAI22D1BWP30P140LVT U100 ( .A1(n32), .A2(n4), .B1(i_data_bus[17]), .B2(n14), 
        .ZN(N336) );
  MOAI22D1BWP30P140LVT U101 ( .A1(n33), .A2(n1), .B1(i_data_bus[18]), .B2(n14), 
        .ZN(N337) );
  MOAI22D1BWP30P140LVT U102 ( .A1(n34), .A2(n4), .B1(i_data_bus[19]), .B2(n14), 
        .ZN(N338) );
  MOAI22D1BWP30P140LVT U103 ( .A1(n35), .A2(n1), .B1(i_data_bus[20]), .B2(n14), 
        .ZN(N339) );
  MOAI22D1BWP30P140LVT U104 ( .A1(n36), .A2(n4), .B1(i_data_bus[21]), .B2(n14), 
        .ZN(N340) );
  MOAI22D1BWP30P140LVT U105 ( .A1(n37), .A2(n1), .B1(i_data_bus[22]), .B2(n14), 
        .ZN(N341) );
  MOAI22D1BWP30P140LVT U106 ( .A1(n38), .A2(n4), .B1(i_data_bus[23]), .B2(n14), 
        .ZN(N342) );
  MOAI22D1BWP30P140LVT U107 ( .A1(n39), .A2(n1), .B1(i_data_bus[24]), .B2(n14), 
        .ZN(N343) );
  MOAI22D1BWP30P140LVT U108 ( .A1(n40), .A2(n4), .B1(i_data_bus[25]), .B2(n14), 
        .ZN(N344) );
  MOAI22D1BWP30P140LVT U109 ( .A1(n41), .A2(n1), .B1(i_data_bus[26]), .B2(n14), 
        .ZN(N345) );
  MOAI22D1BWP30P140LVT U110 ( .A1(n42), .A2(n4), .B1(i_data_bus[27]), .B2(n14), 
        .ZN(N346) );
  MOAI22D1BWP30P140LVT U111 ( .A1(n43), .A2(n1), .B1(i_data_bus[28]), .B2(n14), 
        .ZN(N347) );
  MOAI22D1BWP30P140LVT U112 ( .A1(n44), .A2(n4), .B1(i_data_bus[29]), .B2(n14), 
        .ZN(N348) );
  MOAI22D1BWP30P140LVT U113 ( .A1(n45), .A2(n1), .B1(i_data_bus[30]), .B2(n14), 
        .ZN(N349) );
  MOAI22D1BWP30P140LVT U114 ( .A1(n46), .A2(n4), .B1(i_data_bus[31]), .B2(n14), 
        .ZN(N350) );
endmodule


module distribute_2x2_simple_seq_DATA_WIDTH32_COMMAND_WIDTH2_1 ( clk, rst, 
        i_valid, i_data_bus, o_valid, o_data_bus, i_en, i_cmd );
  input [1:0] i_valid;
  input [63:0] i_data_bus;
  output [1:0] o_valid;
  output [63:0] o_data_bus;
  input [1:0] i_cmd;
  input clk, rst, i_en;
  wire   N287, N288, N289, N290, N291, N292, N293, N294, N295, N296, N297,
         N298, N299, N300, N301, N302, N303, N304, N305, N306, N307, N308,
         N309, N310, N311, N312, N313, N314, N315, N316, N317, N318, N319,
         N320, N321, N322, N323, N324, N325, N326, N327, N328, N329, N330,
         N331, N332, N333, N334, N335, N336, N337, N338, N339, N340, N341,
         N342, N343, N344, N345, N346, N347, N348, N349, N350, N353, N354, n1,
         n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30,
         n31, n32, n33, n34, n35, n36, n37, n38, n39, n40, n41, n42, n43, n44,
         n45, n46, n47, n48, n49, n50, n51, n52, n53, n54, n55, n56, n57, n58,
         n59, n60, n61, n62, n63, n64, n65, n66, n67, n68, n69, n70, n71, n72,
         n73, n74, n75, n76, n77, n78, n79, n80, n81, n82;

  DFQD1BWP30P140LVT o_valid_inner_reg_1_ ( .D(N354), .CP(clk), .Q(o_valid[1])
         );
  DFQD1BWP30P140LVT o_valid_inner_reg_0_ ( .D(N353), .CP(clk), .Q(o_valid[0])
         );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_63_ ( .D(N350), .CP(clk), .Q(
        o_data_bus[63]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_62_ ( .D(N349), .CP(clk), .Q(
        o_data_bus[62]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_61_ ( .D(N348), .CP(clk), .Q(
        o_data_bus[61]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_60_ ( .D(N347), .CP(clk), .Q(
        o_data_bus[60]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_59_ ( .D(N346), .CP(clk), .Q(
        o_data_bus[59]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_58_ ( .D(N345), .CP(clk), .Q(
        o_data_bus[58]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_57_ ( .D(N344), .CP(clk), .Q(
        o_data_bus[57]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_56_ ( .D(N343), .CP(clk), .Q(
        o_data_bus[56]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_55_ ( .D(N342), .CP(clk), .Q(
        o_data_bus[55]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_54_ ( .D(N341), .CP(clk), .Q(
        o_data_bus[54]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_53_ ( .D(N340), .CP(clk), .Q(
        o_data_bus[53]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_52_ ( .D(N339), .CP(clk), .Q(
        o_data_bus[52]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_51_ ( .D(N338), .CP(clk), .Q(
        o_data_bus[51]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_50_ ( .D(N337), .CP(clk), .Q(
        o_data_bus[50]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_49_ ( .D(N336), .CP(clk), .Q(
        o_data_bus[49]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_48_ ( .D(N335), .CP(clk), .Q(
        o_data_bus[48]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_47_ ( .D(N334), .CP(clk), .Q(
        o_data_bus[47]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_46_ ( .D(N333), .CP(clk), .Q(
        o_data_bus[46]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_45_ ( .D(N332), .CP(clk), .Q(
        o_data_bus[45]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_44_ ( .D(N331), .CP(clk), .Q(
        o_data_bus[44]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_43_ ( .D(N330), .CP(clk), .Q(
        o_data_bus[43]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_42_ ( .D(N329), .CP(clk), .Q(
        o_data_bus[42]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_41_ ( .D(N328), .CP(clk), .Q(
        o_data_bus[41]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_40_ ( .D(N327), .CP(clk), .Q(
        o_data_bus[40]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_39_ ( .D(N326), .CP(clk), .Q(
        o_data_bus[39]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_38_ ( .D(N325), .CP(clk), .Q(
        o_data_bus[38]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_37_ ( .D(N324), .CP(clk), .Q(
        o_data_bus[37]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_36_ ( .D(N323), .CP(clk), .Q(
        o_data_bus[36]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_35_ ( .D(N322), .CP(clk), .Q(
        o_data_bus[35]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_34_ ( .D(N321), .CP(clk), .Q(
        o_data_bus[34]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_33_ ( .D(N320), .CP(clk), .Q(
        o_data_bus[33]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_32_ ( .D(N319), .CP(clk), .Q(
        o_data_bus[32]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_31_ ( .D(N318), .CP(clk), .Q(
        o_data_bus[31]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_30_ ( .D(N317), .CP(clk), .Q(
        o_data_bus[30]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_29_ ( .D(N316), .CP(clk), .Q(
        o_data_bus[29]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_28_ ( .D(N315), .CP(clk), .Q(
        o_data_bus[28]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_27_ ( .D(N314), .CP(clk), .Q(
        o_data_bus[27]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_26_ ( .D(N313), .CP(clk), .Q(
        o_data_bus[26]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_25_ ( .D(N312), .CP(clk), .Q(
        o_data_bus[25]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_24_ ( .D(N311), .CP(clk), .Q(
        o_data_bus[24]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_23_ ( .D(N310), .CP(clk), .Q(
        o_data_bus[23]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_22_ ( .D(N309), .CP(clk), .Q(
        o_data_bus[22]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_21_ ( .D(N308), .CP(clk), .Q(
        o_data_bus[21]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_20_ ( .D(N307), .CP(clk), .Q(
        o_data_bus[20]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_19_ ( .D(N306), .CP(clk), .Q(
        o_data_bus[19]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_18_ ( .D(N305), .CP(clk), .Q(
        o_data_bus[18]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_17_ ( .D(N304), .CP(clk), .Q(
        o_data_bus[17]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_16_ ( .D(N303), .CP(clk), .Q(
        o_data_bus[16]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_15_ ( .D(N302), .CP(clk), .Q(
        o_data_bus[15]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_14_ ( .D(N301), .CP(clk), .Q(
        o_data_bus[14]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_13_ ( .D(N300), .CP(clk), .Q(
        o_data_bus[13]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_12_ ( .D(N299), .CP(clk), .Q(
        o_data_bus[12]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_11_ ( .D(N298), .CP(clk), .Q(
        o_data_bus[11]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_10_ ( .D(N297), .CP(clk), .Q(
        o_data_bus[10]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_9_ ( .D(N296), .CP(clk), .Q(
        o_data_bus[9]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_8_ ( .D(N295), .CP(clk), .Q(
        o_data_bus[8]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_7_ ( .D(N294), .CP(clk), .Q(
        o_data_bus[7]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_6_ ( .D(N293), .CP(clk), .Q(
        o_data_bus[6]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_5_ ( .D(N292), .CP(clk), .Q(
        o_data_bus[5]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_4_ ( .D(N291), .CP(clk), .Q(
        o_data_bus[4]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_3_ ( .D(N290), .CP(clk), .Q(
        o_data_bus[3]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_2_ ( .D(N289), .CP(clk), .Q(
        o_data_bus[2]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_1_ ( .D(N288), .CP(clk), .Q(
        o_data_bus[1]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_0_ ( .D(N287), .CP(clk), .Q(
        o_data_bus[0]) );
  INVD1BWP30P140LVT U3 ( .I(n4), .ZN(n14) );
  INVD1BWP30P140LVT U4 ( .I(n14), .ZN(n47) );
  INVD1BWP30P140LVT U5 ( .I(i_cmd[0]), .ZN(n13) );
  ND2D1BWP30P140LVT U6 ( .A1(n2), .A2(i_en), .ZN(n6) );
  INR2D1BWP30P140LVT U7 ( .A1(i_valid[0]), .B1(n6), .ZN(n3) );
  INVD1BWP30P140LVT U8 ( .I(n14), .ZN(n80) );
  OA211D1BWP30P140LVT U9 ( .A1(i_valid[1]), .A2(n13), .B(n12), .C(n11), .Z(n31) );
  ND2OPTIBD2BWP30P140LVT U10 ( .A1(n12), .A2(n9), .ZN(n1) );
  INVD1BWP30P140LVT U11 ( .I(rst), .ZN(n2) );
  INVD1BWP30P140LVT U12 ( .I(i_valid[1]), .ZN(n8) );
  ND2OPTIBD2BWP30P140LVT U13 ( .A1(n3), .A2(n13), .ZN(n10) );
  OAI31D1BWP30P140LVT U14 ( .A1(n6), .A2(n8), .A3(n13), .B(n10), .ZN(N353) );
  INVD1BWP30P140LVT U15 ( .I(n3), .ZN(n5) );
  IND3D1BWP30P140LVT U16 ( .A1(n6), .B1(i_cmd[1]), .B2(i_valid[1]), .ZN(n4) );
  OAI21D1BWP30P140LVT U17 ( .A1(n5), .A2(i_cmd[1]), .B(n80), .ZN(N354) );
  INVD1BWP30P140LVT U18 ( .I(i_data_bus[2]), .ZN(n66) );
  INVD1BWP30P140LVT U19 ( .I(n6), .ZN(n12) );
  OAI21D1BWP30P140LVT U20 ( .A1(i_cmd[1]), .A2(i_valid[0]), .B(i_cmd[0]), .ZN(
        n7) );
  AOI21OPTREPBD1BWP30P140LVT U21 ( .A1(i_cmd[1]), .A2(n8), .B(n7), .ZN(n9) );
  INVD1BWP30P140LVT U22 ( .I(i_data_bus[34]), .ZN(n65) );
  OAI22D1BWP30P140LVT U23 ( .A1(n10), .A2(n66), .B1(n1), .B2(n65), .ZN(N289)
         );
  INVD1BWP30P140LVT U24 ( .I(i_data_bus[1]), .ZN(n81) );
  INVD1BWP30P140LVT U25 ( .I(i_data_bus[33]), .ZN(n79) );
  OAI22D1BWP30P140LVT U26 ( .A1(n10), .A2(n81), .B1(n1), .B2(n79), .ZN(N288)
         );
  INVD1BWP30P140LVT U27 ( .I(i_data_bus[4]), .ZN(n70) );
  INVD1BWP30P140LVT U28 ( .I(i_data_bus[36]), .ZN(n69) );
  OAI22D1BWP30P140LVT U29 ( .A1(n10), .A2(n70), .B1(n1), .B2(n69), .ZN(N291)
         );
  INVD1BWP30P140LVT U30 ( .I(i_data_bus[3]), .ZN(n68) );
  INVD1BWP30P140LVT U31 ( .I(i_data_bus[35]), .ZN(n67) );
  OAI22D1BWP30P140LVT U32 ( .A1(n10), .A2(n68), .B1(n1), .B2(n67), .ZN(N290)
         );
  INVD1BWP30P140LVT U33 ( .I(i_data_bus[6]), .ZN(n58) );
  INVD1BWP30P140LVT U34 ( .I(i_data_bus[38]), .ZN(n57) );
  OAI22D1BWP30P140LVT U35 ( .A1(n10), .A2(n58), .B1(n1), .B2(n57), .ZN(N293)
         );
  INVD1BWP30P140LVT U36 ( .I(i_data_bus[7]), .ZN(n74) );
  INVD1BWP30P140LVT U37 ( .I(i_data_bus[39]), .ZN(n73) );
  OAI22D1BWP30P140LVT U38 ( .A1(n10), .A2(n74), .B1(n1), .B2(n73), .ZN(N294)
         );
  INVD1BWP30P140LVT U39 ( .I(i_data_bus[5]), .ZN(n72) );
  INVD1BWP30P140LVT U40 ( .I(i_data_bus[37]), .ZN(n71) );
  OAI22D1BWP30P140LVT U41 ( .A1(n10), .A2(n72), .B1(n1), .B2(n71), .ZN(N292)
         );
  INVD1BWP30P140LVT U42 ( .I(i_data_bus[0]), .ZN(n56) );
  INVD1BWP30P140LVT U43 ( .I(i_data_bus[32]), .ZN(n55) );
  OAI22D1BWP30P140LVT U44 ( .A1(n10), .A2(n56), .B1(n1), .B2(n55), .ZN(N287)
         );
  INVD1BWP30P140LVT U45 ( .I(i_data_bus[11]), .ZN(n60) );
  INVD1BWP30P140LVT U46 ( .I(i_data_bus[43]), .ZN(n59) );
  OAI22D1BWP30P140LVT U47 ( .A1(n10), .A2(n60), .B1(n1), .B2(n59), .ZN(N298)
         );
  INVD1BWP30P140LVT U48 ( .I(i_data_bus[8]), .ZN(n76) );
  INVD1BWP30P140LVT U49 ( .I(i_data_bus[40]), .ZN(n75) );
  OAI22D1BWP30P140LVT U50 ( .A1(n10), .A2(n76), .B1(n1), .B2(n75), .ZN(N295)
         );
  INVD1BWP30P140LVT U51 ( .I(i_data_bus[23]), .ZN(n22) );
  INVD1BWP30P140LVT U52 ( .I(i_data_bus[55]), .ZN(n21) );
  OAI22D1BWP30P140LVT U53 ( .A1(n10), .A2(n22), .B1(n1), .B2(n21), .ZN(N310)
         );
  INVD1BWP30P140LVT U54 ( .I(i_data_bus[10]), .ZN(n62) );
  INVD1BWP30P140LVT U55 ( .I(i_data_bus[42]), .ZN(n61) );
  OAI22D1BWP30P140LVT U56 ( .A1(n10), .A2(n62), .B1(n1), .B2(n61), .ZN(N297)
         );
  INVD1BWP30P140LVT U57 ( .I(i_data_bus[18]), .ZN(n33) );
  INVD1BWP30P140LVT U58 ( .I(i_data_bus[50]), .ZN(n32) );
  OAI22D1BWP30P140LVT U59 ( .A1(n10), .A2(n33), .B1(n1), .B2(n32), .ZN(N305)
         );
  INVD1BWP30P140LVT U60 ( .I(i_data_bus[14]), .ZN(n41) );
  INVD1BWP30P140LVT U61 ( .I(i_data_bus[46]), .ZN(n40) );
  OAI22D1BWP30P140LVT U62 ( .A1(n10), .A2(n41), .B1(n1), .B2(n40), .ZN(N301)
         );
  INVD1BWP30P140LVT U63 ( .I(i_data_bus[9]), .ZN(n64) );
  INVD1BWP30P140LVT U64 ( .I(i_data_bus[41]), .ZN(n63) );
  OAI22D1BWP30P140LVT U65 ( .A1(n10), .A2(n64), .B1(n1), .B2(n63), .ZN(N296)
         );
  INVD1BWP30P140LVT U66 ( .I(i_data_bus[22]), .ZN(n24) );
  INVD1BWP30P140LVT U67 ( .I(i_data_bus[54]), .ZN(n23) );
  OAI22D1BWP30P140LVT U68 ( .A1(n10), .A2(n24), .B1(n1), .B2(n23), .ZN(N309)
         );
  INVD1BWP30P140LVT U69 ( .I(i_data_bus[15]), .ZN(n39) );
  INVD1BWP30P140LVT U70 ( .I(i_data_bus[47]), .ZN(n38) );
  OAI22D1BWP30P140LVT U71 ( .A1(n10), .A2(n39), .B1(n1), .B2(n38), .ZN(N302)
         );
  INVD1BWP30P140LVT U72 ( .I(i_data_bus[12]), .ZN(n45) );
  INVD1BWP30P140LVT U73 ( .I(i_data_bus[44]), .ZN(n44) );
  OAI22D1BWP30P140LVT U74 ( .A1(n10), .A2(n45), .B1(n1), .B2(n44), .ZN(N299)
         );
  INVD1BWP30P140LVT U75 ( .I(i_data_bus[13]), .ZN(n43) );
  INVD1BWP30P140LVT U76 ( .I(i_data_bus[45]), .ZN(n42) );
  OAI22D1BWP30P140LVT U77 ( .A1(n10), .A2(n43), .B1(n1), .B2(n42), .ZN(N300)
         );
  INVD1BWP30P140LVT U78 ( .I(i_data_bus[17]), .ZN(n35) );
  INVD1BWP30P140LVT U79 ( .I(i_data_bus[49]), .ZN(n34) );
  OAI22D1BWP30P140LVT U80 ( .A1(n10), .A2(n35), .B1(n1), .B2(n34), .ZN(N304)
         );
  INVD1BWP30P140LVT U81 ( .I(i_data_bus[16]), .ZN(n37) );
  INVD1BWP30P140LVT U82 ( .I(i_data_bus[48]), .ZN(n36) );
  OAI22D1BWP30P140LVT U83 ( .A1(n10), .A2(n37), .B1(n1), .B2(n36), .ZN(N303)
         );
  INVD1BWP30P140LVT U84 ( .I(i_data_bus[19]), .ZN(n48) );
  INVD1BWP30P140LVT U85 ( .I(i_data_bus[51]), .ZN(n46) );
  OAI22D1BWP30P140LVT U86 ( .A1(n10), .A2(n48), .B1(n1), .B2(n46), .ZN(N306)
         );
  INVD1BWP30P140LVT U87 ( .I(i_data_bus[20]), .ZN(n28) );
  INVD1BWP30P140LVT U88 ( .I(i_data_bus[52]), .ZN(n27) );
  OAI22D1BWP30P140LVT U89 ( .A1(n10), .A2(n28), .B1(n1), .B2(n27), .ZN(N307)
         );
  INVD1BWP30P140LVT U90 ( .I(i_data_bus[27]), .ZN(n16) );
  INVD1BWP30P140LVT U91 ( .I(i_data_bus[59]), .ZN(n15) );
  OAI22D1BWP30P140LVT U92 ( .A1(n10), .A2(n16), .B1(n1), .B2(n15), .ZN(N314)
         );
  INVD1BWP30P140LVT U93 ( .I(i_data_bus[24]), .ZN(n78) );
  INVD1BWP30P140LVT U94 ( .I(i_data_bus[56]), .ZN(n77) );
  OAI22D1BWP30P140LVT U95 ( .A1(n10), .A2(n78), .B1(n1), .B2(n77), .ZN(N311)
         );
  INVD1BWP30P140LVT U96 ( .I(i_data_bus[25]), .ZN(n30) );
  INVD1BWP30P140LVT U97 ( .I(i_data_bus[57]), .ZN(n29) );
  OAI22D1BWP30P140LVT U98 ( .A1(n10), .A2(n30), .B1(n1), .B2(n29), .ZN(N312)
         );
  INVD1BWP30P140LVT U99 ( .I(i_data_bus[26]), .ZN(n54) );
  INVD1BWP30P140LVT U100 ( .I(i_data_bus[58]), .ZN(n53) );
  OAI22D1BWP30P140LVT U101 ( .A1(n10), .A2(n54), .B1(n1), .B2(n53), .ZN(N313)
         );
  INVD1BWP30P140LVT U102 ( .I(i_data_bus[28]), .ZN(n52) );
  INVD1BWP30P140LVT U103 ( .I(i_data_bus[60]), .ZN(n51) );
  OAI22D1BWP30P140LVT U104 ( .A1(n10), .A2(n52), .B1(n1), .B2(n51), .ZN(N315)
         );
  INVD1BWP30P140LVT U105 ( .I(i_data_bus[29]), .ZN(n18) );
  INVD1BWP30P140LVT U106 ( .I(i_data_bus[61]), .ZN(n17) );
  OAI22D1BWP30P140LVT U107 ( .A1(n10), .A2(n18), .B1(n1), .B2(n17), .ZN(N316)
         );
  INVD1BWP30P140LVT U108 ( .I(i_data_bus[21]), .ZN(n26) );
  INVD1BWP30P140LVT U109 ( .I(i_data_bus[53]), .ZN(n25) );
  OAI22D1BWP30P140LVT U110 ( .A1(n10), .A2(n26), .B1(n1), .B2(n25), .ZN(N308)
         );
  INVD1BWP30P140LVT U111 ( .I(i_data_bus[30]), .ZN(n50) );
  INVD1BWP30P140LVT U112 ( .I(i_data_bus[62]), .ZN(n49) );
  OAI22D1BWP30P140LVT U113 ( .A1(n10), .A2(n50), .B1(n1), .B2(n49), .ZN(N317)
         );
  INVD1BWP30P140LVT U114 ( .I(i_data_bus[31]), .ZN(n20) );
  INVD1BWP30P140LVT U115 ( .I(i_data_bus[63]), .ZN(n19) );
  OAI22D1BWP30P140LVT U116 ( .A1(n10), .A2(n20), .B1(n1), .B2(n19), .ZN(N318)
         );
  IAO21D1BWP30P140LVT U117 ( .A1(i_cmd[0]), .A2(i_valid[0]), .B(i_cmd[1]), 
        .ZN(n11) );
  INVD2BWP30P140LVT U118 ( .I(n31), .ZN(n82) );
  OAI22D1BWP30P140LVT U119 ( .A1(n82), .A2(n16), .B1(n47), .B2(n15), .ZN(N346)
         );
  OAI22D1BWP30P140LVT U120 ( .A1(n82), .A2(n18), .B1(n47), .B2(n17), .ZN(N348)
         );
  OAI22D1BWP30P140LVT U121 ( .A1(n82), .A2(n20), .B1(n47), .B2(n19), .ZN(N350)
         );
  OAI22D1BWP30P140LVT U122 ( .A1(n82), .A2(n22), .B1(n47), .B2(n21), .ZN(N342)
         );
  OAI22D1BWP30P140LVT U123 ( .A1(n82), .A2(n24), .B1(n47), .B2(n23), .ZN(N341)
         );
  OAI22D1BWP30P140LVT U124 ( .A1(n82), .A2(n26), .B1(n47), .B2(n25), .ZN(N340)
         );
  OAI22D1BWP30P140LVT U125 ( .A1(n82), .A2(n28), .B1(n47), .B2(n27), .ZN(N339)
         );
  OAI22D1BWP30P140LVT U126 ( .A1(n82), .A2(n30), .B1(n47), .B2(n29), .ZN(N344)
         );
  OAI22D1BWP30P140LVT U127 ( .A1(n82), .A2(n33), .B1(n47), .B2(n32), .ZN(N337)
         );
  OAI22D1BWP30P140LVT U128 ( .A1(n82), .A2(n35), .B1(n47), .B2(n34), .ZN(N336)
         );
  OAI22D1BWP30P140LVT U129 ( .A1(n82), .A2(n37), .B1(n47), .B2(n36), .ZN(N335)
         );
  OAI22D1BWP30P140LVT U130 ( .A1(n82), .A2(n39), .B1(n47), .B2(n38), .ZN(N334)
         );
  OAI22D1BWP30P140LVT U131 ( .A1(n82), .A2(n41), .B1(n47), .B2(n40), .ZN(N333)
         );
  OAI22D1BWP30P140LVT U132 ( .A1(n82), .A2(n43), .B1(n47), .B2(n42), .ZN(N332)
         );
  OAI22D1BWP30P140LVT U133 ( .A1(n82), .A2(n45), .B1(n47), .B2(n44), .ZN(N331)
         );
  OAI22D1BWP30P140LVT U134 ( .A1(n82), .A2(n48), .B1(n47), .B2(n46), .ZN(N338)
         );
  OAI22D1BWP30P140LVT U135 ( .A1(n82), .A2(n50), .B1(n80), .B2(n49), .ZN(N349)
         );
  OAI22D1BWP30P140LVT U136 ( .A1(n82), .A2(n52), .B1(n80), .B2(n51), .ZN(N347)
         );
  OAI22D1BWP30P140LVT U137 ( .A1(n82), .A2(n54), .B1(n80), .B2(n53), .ZN(N345)
         );
  OAI22D1BWP30P140LVT U138 ( .A1(n82), .A2(n56), .B1(n80), .B2(n55), .ZN(N319)
         );
  OAI22D1BWP30P140LVT U139 ( .A1(n82), .A2(n58), .B1(n80), .B2(n57), .ZN(N325)
         );
  OAI22D1BWP30P140LVT U140 ( .A1(n82), .A2(n60), .B1(n80), .B2(n59), .ZN(N330)
         );
  OAI22D1BWP30P140LVT U141 ( .A1(n82), .A2(n62), .B1(n80), .B2(n61), .ZN(N329)
         );
  OAI22D1BWP30P140LVT U142 ( .A1(n82), .A2(n64), .B1(n80), .B2(n63), .ZN(N328)
         );
  OAI22D1BWP30P140LVT U143 ( .A1(n82), .A2(n66), .B1(n80), .B2(n65), .ZN(N321)
         );
  OAI22D1BWP30P140LVT U144 ( .A1(n82), .A2(n68), .B1(n80), .B2(n67), .ZN(N322)
         );
  OAI22D1BWP30P140LVT U145 ( .A1(n82), .A2(n70), .B1(n80), .B2(n69), .ZN(N323)
         );
  OAI22D1BWP30P140LVT U146 ( .A1(n82), .A2(n72), .B1(n80), .B2(n71), .ZN(N324)
         );
  OAI22D1BWP30P140LVT U147 ( .A1(n82), .A2(n74), .B1(n80), .B2(n73), .ZN(N326)
         );
  OAI22D1BWP30P140LVT U148 ( .A1(n82), .A2(n76), .B1(n80), .B2(n75), .ZN(N327)
         );
  OAI22D1BWP30P140LVT U149 ( .A1(n82), .A2(n78), .B1(n80), .B2(n77), .ZN(N343)
         );
  OAI22D1BWP30P140LVT U150 ( .A1(n82), .A2(n81), .B1(n80), .B2(n79), .ZN(N320)
         );
endmodule


module distribute_2x2_simple_seq_DATA_WIDTH32_COMMAND_WIDTH2_2 ( clk, rst, 
        i_valid, i_data_bus, o_valid, o_data_bus, i_en, i_cmd );
  input [1:0] i_valid;
  input [63:0] i_data_bus;
  output [1:0] o_valid;
  output [63:0] o_data_bus;
  input [1:0] i_cmd;
  input clk, rst, i_en;
  wire   N287, N288, N289, N290, N291, N292, N293, N294, N295, N296, N297,
         N298, N299, N300, N301, N302, N303, N304, N305, N306, N307, N308,
         N309, N310, N311, N312, N313, N314, N315, N316, N317, N318, N319,
         N320, N321, N322, N323, N324, N325, N326, N327, N328, N329, N330,
         N331, N332, N333, N334, N335, N336, N337, N338, N339, N340, N341,
         N342, N343, N344, N345, N346, N347, N348, N349, N350, N353, N354, n1,
         n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30,
         n31, n32, n33, n34, n35, n36, n37, n38, n39, n40, n41, n42, n43, n44,
         n45, n46, n47, n48, n49, n50, n51, n52, n53, n54, n55, n56, n57, n58,
         n59, n60, n61, n62, n63, n64, n65, n66, n67, n68, n69, n70, n71, n72,
         n73, n74, n75, n76, n77, n78, n79, n80, n81, n82;

  DFQD1BWP30P140LVT o_valid_inner_reg_1_ ( .D(N354), .CP(clk), .Q(o_valid[1])
         );
  DFQD1BWP30P140LVT o_valid_inner_reg_0_ ( .D(N353), .CP(clk), .Q(o_valid[0])
         );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_63_ ( .D(N350), .CP(clk), .Q(
        o_data_bus[63]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_62_ ( .D(N349), .CP(clk), .Q(
        o_data_bus[62]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_61_ ( .D(N348), .CP(clk), .Q(
        o_data_bus[61]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_60_ ( .D(N347), .CP(clk), .Q(
        o_data_bus[60]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_59_ ( .D(N346), .CP(clk), .Q(
        o_data_bus[59]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_58_ ( .D(N345), .CP(clk), .Q(
        o_data_bus[58]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_57_ ( .D(N344), .CP(clk), .Q(
        o_data_bus[57]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_56_ ( .D(N343), .CP(clk), .Q(
        o_data_bus[56]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_55_ ( .D(N342), .CP(clk), .Q(
        o_data_bus[55]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_54_ ( .D(N341), .CP(clk), .Q(
        o_data_bus[54]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_53_ ( .D(N340), .CP(clk), .Q(
        o_data_bus[53]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_52_ ( .D(N339), .CP(clk), .Q(
        o_data_bus[52]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_51_ ( .D(N338), .CP(clk), .Q(
        o_data_bus[51]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_50_ ( .D(N337), .CP(clk), .Q(
        o_data_bus[50]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_49_ ( .D(N336), .CP(clk), .Q(
        o_data_bus[49]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_48_ ( .D(N335), .CP(clk), .Q(
        o_data_bus[48]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_47_ ( .D(N334), .CP(clk), .Q(
        o_data_bus[47]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_46_ ( .D(N333), .CP(clk), .Q(
        o_data_bus[46]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_45_ ( .D(N332), .CP(clk), .Q(
        o_data_bus[45]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_44_ ( .D(N331), .CP(clk), .Q(
        o_data_bus[44]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_43_ ( .D(N330), .CP(clk), .Q(
        o_data_bus[43]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_42_ ( .D(N329), .CP(clk), .Q(
        o_data_bus[42]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_41_ ( .D(N328), .CP(clk), .Q(
        o_data_bus[41]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_40_ ( .D(N327), .CP(clk), .Q(
        o_data_bus[40]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_39_ ( .D(N326), .CP(clk), .Q(
        o_data_bus[39]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_38_ ( .D(N325), .CP(clk), .Q(
        o_data_bus[38]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_37_ ( .D(N324), .CP(clk), .Q(
        o_data_bus[37]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_36_ ( .D(N323), .CP(clk), .Q(
        o_data_bus[36]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_35_ ( .D(N322), .CP(clk), .Q(
        o_data_bus[35]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_34_ ( .D(N321), .CP(clk), .Q(
        o_data_bus[34]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_33_ ( .D(N320), .CP(clk), .Q(
        o_data_bus[33]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_32_ ( .D(N319), .CP(clk), .Q(
        o_data_bus[32]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_31_ ( .D(N318), .CP(clk), .Q(
        o_data_bus[31]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_30_ ( .D(N317), .CP(clk), .Q(
        o_data_bus[30]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_29_ ( .D(N316), .CP(clk), .Q(
        o_data_bus[29]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_28_ ( .D(N315), .CP(clk), .Q(
        o_data_bus[28]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_27_ ( .D(N314), .CP(clk), .Q(
        o_data_bus[27]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_26_ ( .D(N313), .CP(clk), .Q(
        o_data_bus[26]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_25_ ( .D(N312), .CP(clk), .Q(
        o_data_bus[25]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_24_ ( .D(N311), .CP(clk), .Q(
        o_data_bus[24]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_23_ ( .D(N310), .CP(clk), .Q(
        o_data_bus[23]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_22_ ( .D(N309), .CP(clk), .Q(
        o_data_bus[22]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_21_ ( .D(N308), .CP(clk), .Q(
        o_data_bus[21]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_20_ ( .D(N307), .CP(clk), .Q(
        o_data_bus[20]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_19_ ( .D(N306), .CP(clk), .Q(
        o_data_bus[19]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_18_ ( .D(N305), .CP(clk), .Q(
        o_data_bus[18]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_17_ ( .D(N304), .CP(clk), .Q(
        o_data_bus[17]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_16_ ( .D(N303), .CP(clk), .Q(
        o_data_bus[16]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_15_ ( .D(N302), .CP(clk), .Q(
        o_data_bus[15]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_14_ ( .D(N301), .CP(clk), .Q(
        o_data_bus[14]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_13_ ( .D(N300), .CP(clk), .Q(
        o_data_bus[13]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_12_ ( .D(N299), .CP(clk), .Q(
        o_data_bus[12]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_11_ ( .D(N298), .CP(clk), .Q(
        o_data_bus[11]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_10_ ( .D(N297), .CP(clk), .Q(
        o_data_bus[10]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_9_ ( .D(N296), .CP(clk), .Q(
        o_data_bus[9]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_8_ ( .D(N295), .CP(clk), .Q(
        o_data_bus[8]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_7_ ( .D(N294), .CP(clk), .Q(
        o_data_bus[7]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_6_ ( .D(N293), .CP(clk), .Q(
        o_data_bus[6]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_5_ ( .D(N292), .CP(clk), .Q(
        o_data_bus[5]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_4_ ( .D(N291), .CP(clk), .Q(
        o_data_bus[4]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_3_ ( .D(N290), .CP(clk), .Q(
        o_data_bus[3]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_2_ ( .D(N289), .CP(clk), .Q(
        o_data_bus[2]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_1_ ( .D(N288), .CP(clk), .Q(
        o_data_bus[1]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_0_ ( .D(N287), .CP(clk), .Q(
        o_data_bus[0]) );
  INVD1BWP30P140LVT U3 ( .I(n4), .ZN(n14) );
  INVD1BWP30P140LVT U4 ( .I(n14), .ZN(n47) );
  INVD1BWP30P140LVT U5 ( .I(i_cmd[0]), .ZN(n13) );
  ND2D1BWP30P140LVT U6 ( .A1(n2), .A2(i_en), .ZN(n6) );
  INR2D1BWP30P140LVT U7 ( .A1(i_valid[0]), .B1(n6), .ZN(n3) );
  INVD1BWP30P140LVT U8 ( .I(n14), .ZN(n80) );
  OA211D1BWP30P140LVT U9 ( .A1(i_valid[1]), .A2(n13), .B(n12), .C(n11), .Z(n31) );
  ND2OPTIBD2BWP30P140LVT U10 ( .A1(n12), .A2(n9), .ZN(n1) );
  INVD1BWP30P140LVT U11 ( .I(rst), .ZN(n2) );
  INVD1BWP30P140LVT U12 ( .I(i_valid[1]), .ZN(n8) );
  ND2OPTIBD2BWP30P140LVT U13 ( .A1(n3), .A2(n13), .ZN(n10) );
  OAI31D1BWP30P140LVT U14 ( .A1(n6), .A2(n8), .A3(n13), .B(n10), .ZN(N353) );
  INVD1BWP30P140LVT U15 ( .I(n3), .ZN(n5) );
  IND3D1BWP30P140LVT U16 ( .A1(n6), .B1(i_cmd[1]), .B2(i_valid[1]), .ZN(n4) );
  OAI21D1BWP30P140LVT U17 ( .A1(n5), .A2(i_cmd[1]), .B(n80), .ZN(N354) );
  INVD1BWP30P140LVT U18 ( .I(i_data_bus[5]), .ZN(n50) );
  INVD1BWP30P140LVT U19 ( .I(n6), .ZN(n12) );
  OAI21D1BWP30P140LVT U20 ( .A1(i_cmd[1]), .A2(i_valid[0]), .B(i_cmd[0]), .ZN(
        n7) );
  AOI21OPTREPBD1BWP30P140LVT U21 ( .A1(i_cmd[1]), .A2(n8), .B(n7), .ZN(n9) );
  INVD1BWP30P140LVT U22 ( .I(i_data_bus[37]), .ZN(n49) );
  OAI22D1BWP30P140LVT U23 ( .A1(n10), .A2(n50), .B1(n1), .B2(n49), .ZN(N292)
         );
  INVD1BWP30P140LVT U24 ( .I(i_data_bus[6]), .ZN(n62) );
  INVD1BWP30P140LVT U25 ( .I(i_data_bus[38]), .ZN(n61) );
  OAI22D1BWP30P140LVT U26 ( .A1(n10), .A2(n62), .B1(n1), .B2(n61), .ZN(N293)
         );
  INVD1BWP30P140LVT U27 ( .I(i_data_bus[4]), .ZN(n58) );
  INVD1BWP30P140LVT U28 ( .I(i_data_bus[36]), .ZN(n57) );
  OAI22D1BWP30P140LVT U29 ( .A1(n10), .A2(n58), .B1(n1), .B2(n57), .ZN(N291)
         );
  INVD1BWP30P140LVT U30 ( .I(i_data_bus[7]), .ZN(n64) );
  INVD1BWP30P140LVT U31 ( .I(i_data_bus[39]), .ZN(n63) );
  OAI22D1BWP30P140LVT U32 ( .A1(n10), .A2(n64), .B1(n1), .B2(n63), .ZN(N294)
         );
  INVD1BWP30P140LVT U33 ( .I(i_data_bus[1]), .ZN(n52) );
  INVD1BWP30P140LVT U34 ( .I(i_data_bus[33]), .ZN(n51) );
  OAI22D1BWP30P140LVT U35 ( .A1(n10), .A2(n52), .B1(n1), .B2(n51), .ZN(N288)
         );
  INVD1BWP30P140LVT U36 ( .I(i_data_bus[0]), .ZN(n81) );
  INVD1BWP30P140LVT U37 ( .I(i_data_bus[32]), .ZN(n79) );
  OAI22D1BWP30P140LVT U38 ( .A1(n10), .A2(n81), .B1(n1), .B2(n79), .ZN(N287)
         );
  INVD1BWP30P140LVT U39 ( .I(i_data_bus[3]), .ZN(n56) );
  INVD1BWP30P140LVT U40 ( .I(i_data_bus[35]), .ZN(n55) );
  OAI22D1BWP30P140LVT U41 ( .A1(n10), .A2(n56), .B1(n1), .B2(n55), .ZN(N290)
         );
  INVD1BWP30P140LVT U42 ( .I(i_data_bus[2]), .ZN(n54) );
  INVD1BWP30P140LVT U43 ( .I(i_data_bus[34]), .ZN(n53) );
  OAI22D1BWP30P140LVT U44 ( .A1(n10), .A2(n54), .B1(n1), .B2(n53), .ZN(N289)
         );
  INVD1BWP30P140LVT U45 ( .I(i_data_bus[31]), .ZN(n48) );
  INVD1BWP30P140LVT U46 ( .I(i_data_bus[63]), .ZN(n46) );
  OAI22D1BWP30P140LVT U47 ( .A1(n10), .A2(n48), .B1(n1), .B2(n46), .ZN(N318)
         );
  INVD1BWP30P140LVT U48 ( .I(i_data_bus[30]), .ZN(n76) );
  INVD1BWP30P140LVT U49 ( .I(i_data_bus[62]), .ZN(n75) );
  OAI22D1BWP30P140LVT U50 ( .A1(n10), .A2(n76), .B1(n1), .B2(n75), .ZN(N317)
         );
  INVD1BWP30P140LVT U51 ( .I(i_data_bus[29]), .ZN(n45) );
  INVD1BWP30P140LVT U52 ( .I(i_data_bus[61]), .ZN(n44) );
  OAI22D1BWP30P140LVT U53 ( .A1(n10), .A2(n45), .B1(n1), .B2(n44), .ZN(N316)
         );
  INVD1BWP30P140LVT U54 ( .I(i_data_bus[28]), .ZN(n74) );
  INVD1BWP30P140LVT U55 ( .I(i_data_bus[60]), .ZN(n73) );
  OAI22D1BWP30P140LVT U56 ( .A1(n10), .A2(n74), .B1(n1), .B2(n73), .ZN(N315)
         );
  INVD1BWP30P140LVT U57 ( .I(i_data_bus[27]), .ZN(n43) );
  INVD1BWP30P140LVT U58 ( .I(i_data_bus[59]), .ZN(n42) );
  OAI22D1BWP30P140LVT U59 ( .A1(n10), .A2(n43), .B1(n1), .B2(n42), .ZN(N314)
         );
  INVD1BWP30P140LVT U60 ( .I(i_data_bus[26]), .ZN(n72) );
  INVD1BWP30P140LVT U61 ( .I(i_data_bus[58]), .ZN(n71) );
  OAI22D1BWP30P140LVT U62 ( .A1(n10), .A2(n72), .B1(n1), .B2(n71), .ZN(N313)
         );
  INVD1BWP30P140LVT U63 ( .I(i_data_bus[25]), .ZN(n41) );
  INVD1BWP30P140LVT U64 ( .I(i_data_bus[57]), .ZN(n40) );
  OAI22D1BWP30P140LVT U65 ( .A1(n10), .A2(n41), .B1(n1), .B2(n40), .ZN(N312)
         );
  INVD1BWP30P140LVT U66 ( .I(i_data_bus[24]), .ZN(n60) );
  INVD1BWP30P140LVT U67 ( .I(i_data_bus[56]), .ZN(n59) );
  OAI22D1BWP30P140LVT U68 ( .A1(n10), .A2(n60), .B1(n1), .B2(n59), .ZN(N311)
         );
  INVD1BWP30P140LVT U69 ( .I(i_data_bus[23]), .ZN(n39) );
  INVD1BWP30P140LVT U70 ( .I(i_data_bus[55]), .ZN(n38) );
  OAI22D1BWP30P140LVT U71 ( .A1(n10), .A2(n39), .B1(n1), .B2(n38), .ZN(N310)
         );
  INVD1BWP30P140LVT U72 ( .I(i_data_bus[22]), .ZN(n37) );
  INVD1BWP30P140LVT U73 ( .I(i_data_bus[54]), .ZN(n36) );
  OAI22D1BWP30P140LVT U74 ( .A1(n10), .A2(n37), .B1(n1), .B2(n36), .ZN(N309)
         );
  INVD1BWP30P140LVT U75 ( .I(i_data_bus[21]), .ZN(n35) );
  INVD1BWP30P140LVT U76 ( .I(i_data_bus[53]), .ZN(n34) );
  OAI22D1BWP30P140LVT U77 ( .A1(n10), .A2(n35), .B1(n1), .B2(n34), .ZN(N308)
         );
  INVD1BWP30P140LVT U78 ( .I(i_data_bus[20]), .ZN(n33) );
  INVD1BWP30P140LVT U79 ( .I(i_data_bus[52]), .ZN(n32) );
  OAI22D1BWP30P140LVT U80 ( .A1(n10), .A2(n33), .B1(n1), .B2(n32), .ZN(N307)
         );
  INVD1BWP30P140LVT U81 ( .I(i_data_bus[18]), .ZN(n28) );
  INVD1BWP30P140LVT U82 ( .I(i_data_bus[50]), .ZN(n27) );
  OAI22D1BWP30P140LVT U83 ( .A1(n10), .A2(n28), .B1(n1), .B2(n27), .ZN(N305)
         );
  INVD1BWP30P140LVT U84 ( .I(i_data_bus[17]), .ZN(n26) );
  INVD1BWP30P140LVT U85 ( .I(i_data_bus[49]), .ZN(n25) );
  OAI22D1BWP30P140LVT U86 ( .A1(n10), .A2(n26), .B1(n1), .B2(n25), .ZN(N304)
         );
  INVD1BWP30P140LVT U87 ( .I(i_data_bus[16]), .ZN(n24) );
  INVD1BWP30P140LVT U88 ( .I(i_data_bus[48]), .ZN(n23) );
  OAI22D1BWP30P140LVT U89 ( .A1(n10), .A2(n24), .B1(n1), .B2(n23), .ZN(N303)
         );
  INVD1BWP30P140LVT U90 ( .I(i_data_bus[15]), .ZN(n22) );
  INVD1BWP30P140LVT U91 ( .I(i_data_bus[47]), .ZN(n21) );
  OAI22D1BWP30P140LVT U92 ( .A1(n10), .A2(n22), .B1(n1), .B2(n21), .ZN(N302)
         );
  INVD1BWP30P140LVT U93 ( .I(i_data_bus[14]), .ZN(n20) );
  INVD1BWP30P140LVT U94 ( .I(i_data_bus[46]), .ZN(n19) );
  OAI22D1BWP30P140LVT U95 ( .A1(n10), .A2(n20), .B1(n1), .B2(n19), .ZN(N301)
         );
  INVD1BWP30P140LVT U96 ( .I(i_data_bus[13]), .ZN(n18) );
  INVD1BWP30P140LVT U97 ( .I(i_data_bus[45]), .ZN(n17) );
  OAI22D1BWP30P140LVT U98 ( .A1(n10), .A2(n18), .B1(n1), .B2(n17), .ZN(N300)
         );
  INVD1BWP30P140LVT U99 ( .I(i_data_bus[19]), .ZN(n30) );
  INVD1BWP30P140LVT U100 ( .I(i_data_bus[51]), .ZN(n29) );
  OAI22D1BWP30P140LVT U101 ( .A1(n10), .A2(n30), .B1(n1), .B2(n29), .ZN(N306)
         );
  INVD1BWP30P140LVT U102 ( .I(i_data_bus[12]), .ZN(n16) );
  INVD1BWP30P140LVT U103 ( .I(i_data_bus[44]), .ZN(n15) );
  OAI22D1BWP30P140LVT U104 ( .A1(n10), .A2(n16), .B1(n1), .B2(n15), .ZN(N299)
         );
  INVD1BWP30P140LVT U105 ( .I(i_data_bus[11]), .ZN(n70) );
  INVD1BWP30P140LVT U106 ( .I(i_data_bus[43]), .ZN(n69) );
  OAI22D1BWP30P140LVT U107 ( .A1(n10), .A2(n70), .B1(n1), .B2(n69), .ZN(N298)
         );
  INVD1BWP30P140LVT U108 ( .I(i_data_bus[10]), .ZN(n78) );
  INVD1BWP30P140LVT U109 ( .I(i_data_bus[42]), .ZN(n77) );
  OAI22D1BWP30P140LVT U110 ( .A1(n10), .A2(n78), .B1(n1), .B2(n77), .ZN(N297)
         );
  INVD1BWP30P140LVT U111 ( .I(i_data_bus[9]), .ZN(n68) );
  INVD1BWP30P140LVT U112 ( .I(i_data_bus[41]), .ZN(n67) );
  OAI22D1BWP30P140LVT U113 ( .A1(n10), .A2(n68), .B1(n1), .B2(n67), .ZN(N296)
         );
  INVD1BWP30P140LVT U114 ( .I(i_data_bus[8]), .ZN(n66) );
  INVD1BWP30P140LVT U115 ( .I(i_data_bus[40]), .ZN(n65) );
  OAI22D1BWP30P140LVT U116 ( .A1(n10), .A2(n66), .B1(n1), .B2(n65), .ZN(N295)
         );
  IAO21D1BWP30P140LVT U117 ( .A1(i_cmd[0]), .A2(i_valid[0]), .B(i_cmd[1]), 
        .ZN(n11) );
  INVD2BWP30P140LVT U118 ( .I(n31), .ZN(n82) );
  OAI22D1BWP30P140LVT U119 ( .A1(n82), .A2(n16), .B1(n47), .B2(n15), .ZN(N331)
         );
  OAI22D1BWP30P140LVT U120 ( .A1(n82), .A2(n18), .B1(n47), .B2(n17), .ZN(N332)
         );
  OAI22D1BWP30P140LVT U121 ( .A1(n82), .A2(n20), .B1(n47), .B2(n19), .ZN(N333)
         );
  OAI22D1BWP30P140LVT U122 ( .A1(n82), .A2(n22), .B1(n47), .B2(n21), .ZN(N334)
         );
  OAI22D1BWP30P140LVT U123 ( .A1(n82), .A2(n24), .B1(n47), .B2(n23), .ZN(N335)
         );
  OAI22D1BWP30P140LVT U124 ( .A1(n82), .A2(n26), .B1(n47), .B2(n25), .ZN(N336)
         );
  OAI22D1BWP30P140LVT U125 ( .A1(n82), .A2(n28), .B1(n47), .B2(n27), .ZN(N337)
         );
  OAI22D1BWP30P140LVT U126 ( .A1(n82), .A2(n30), .B1(n47), .B2(n29), .ZN(N338)
         );
  OAI22D1BWP30P140LVT U127 ( .A1(n82), .A2(n33), .B1(n47), .B2(n32), .ZN(N339)
         );
  OAI22D1BWP30P140LVT U128 ( .A1(n82), .A2(n35), .B1(n47), .B2(n34), .ZN(N340)
         );
  OAI22D1BWP30P140LVT U129 ( .A1(n82), .A2(n37), .B1(n47), .B2(n36), .ZN(N341)
         );
  OAI22D1BWP30P140LVT U130 ( .A1(n82), .A2(n39), .B1(n47), .B2(n38), .ZN(N342)
         );
  OAI22D1BWP30P140LVT U131 ( .A1(n82), .A2(n41), .B1(n47), .B2(n40), .ZN(N344)
         );
  OAI22D1BWP30P140LVT U132 ( .A1(n82), .A2(n43), .B1(n47), .B2(n42), .ZN(N346)
         );
  OAI22D1BWP30P140LVT U133 ( .A1(n82), .A2(n45), .B1(n47), .B2(n44), .ZN(N348)
         );
  OAI22D1BWP30P140LVT U134 ( .A1(n82), .A2(n48), .B1(n47), .B2(n46), .ZN(N350)
         );
  OAI22D1BWP30P140LVT U135 ( .A1(n82), .A2(n50), .B1(n80), .B2(n49), .ZN(N324)
         );
  OAI22D1BWP30P140LVT U136 ( .A1(n82), .A2(n52), .B1(n80), .B2(n51), .ZN(N320)
         );
  OAI22D1BWP30P140LVT U137 ( .A1(n82), .A2(n54), .B1(n80), .B2(n53), .ZN(N321)
         );
  OAI22D1BWP30P140LVT U138 ( .A1(n82), .A2(n56), .B1(n80), .B2(n55), .ZN(N322)
         );
  OAI22D1BWP30P140LVT U139 ( .A1(n82), .A2(n58), .B1(n80), .B2(n57), .ZN(N323)
         );
  OAI22D1BWP30P140LVT U140 ( .A1(n82), .A2(n60), .B1(n80), .B2(n59), .ZN(N343)
         );
  OAI22D1BWP30P140LVT U141 ( .A1(n82), .A2(n62), .B1(n80), .B2(n61), .ZN(N325)
         );
  OAI22D1BWP30P140LVT U142 ( .A1(n82), .A2(n64), .B1(n80), .B2(n63), .ZN(N326)
         );
  OAI22D1BWP30P140LVT U143 ( .A1(n82), .A2(n66), .B1(n80), .B2(n65), .ZN(N327)
         );
  OAI22D1BWP30P140LVT U144 ( .A1(n82), .A2(n68), .B1(n80), .B2(n67), .ZN(N328)
         );
  OAI22D1BWP30P140LVT U145 ( .A1(n82), .A2(n70), .B1(n80), .B2(n69), .ZN(N330)
         );
  OAI22D1BWP30P140LVT U146 ( .A1(n82), .A2(n72), .B1(n80), .B2(n71), .ZN(N345)
         );
  OAI22D1BWP30P140LVT U147 ( .A1(n82), .A2(n74), .B1(n80), .B2(n73), .ZN(N347)
         );
  OAI22D1BWP30P140LVT U148 ( .A1(n82), .A2(n76), .B1(n80), .B2(n75), .ZN(N349)
         );
  OAI22D1BWP30P140LVT U149 ( .A1(n82), .A2(n78), .B1(n80), .B2(n77), .ZN(N329)
         );
  OAI22D1BWP30P140LVT U150 ( .A1(n82), .A2(n81), .B1(n80), .B2(n79), .ZN(N319)
         );
endmodule


module distribute_2x2_simple_seq_DATA_WIDTH32_COMMAND_WIDTH2_3 ( clk, rst, 
        i_valid, i_data_bus, o_valid, o_data_bus, i_en, i_cmd );
  input [1:0] i_valid;
  input [63:0] i_data_bus;
  output [1:0] o_valid;
  output [63:0] o_data_bus;
  input [1:0] i_cmd;
  input clk, rst, i_en;
  wire   N287, N288, N289, N290, N291, N292, N293, N294, N295, N296, N297,
         N298, N299, N300, N301, N302, N303, N304, N305, N306, N307, N308,
         N309, N310, N311, N312, N313, N314, N315, N316, N317, N318, N319,
         N320, N321, N322, N323, N324, N325, N326, N327, N328, N329, N330,
         N331, N332, N333, N334, N335, N336, N337, N338, N339, N340, N341,
         N342, N343, N344, N345, N346, N347, N348, N349, N350, N353, N354, n1,
         n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30,
         n31, n32, n33, n34, n35, n36, n37, n38, n39, n40, n41, n42, n43, n44,
         n45, n46, n47, n48, n49, n50, n51, n52, n53, n54, n55, n56, n57, n58,
         n59, n60, n61, n62, n63, n64, n65, n66, n67, n68, n69, n70, n71, n72,
         n73, n74, n75, n76, n77, n78, n79, n80, n81, n82;

  DFQD1BWP30P140LVT o_valid_inner_reg_1_ ( .D(N354), .CP(clk), .Q(o_valid[1])
         );
  DFQD1BWP30P140LVT o_valid_inner_reg_0_ ( .D(N353), .CP(clk), .Q(o_valid[0])
         );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_63_ ( .D(N350), .CP(clk), .Q(
        o_data_bus[63]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_62_ ( .D(N349), .CP(clk), .Q(
        o_data_bus[62]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_61_ ( .D(N348), .CP(clk), .Q(
        o_data_bus[61]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_60_ ( .D(N347), .CP(clk), .Q(
        o_data_bus[60]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_59_ ( .D(N346), .CP(clk), .Q(
        o_data_bus[59]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_58_ ( .D(N345), .CP(clk), .Q(
        o_data_bus[58]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_57_ ( .D(N344), .CP(clk), .Q(
        o_data_bus[57]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_56_ ( .D(N343), .CP(clk), .Q(
        o_data_bus[56]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_55_ ( .D(N342), .CP(clk), .Q(
        o_data_bus[55]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_54_ ( .D(N341), .CP(clk), .Q(
        o_data_bus[54]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_53_ ( .D(N340), .CP(clk), .Q(
        o_data_bus[53]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_52_ ( .D(N339), .CP(clk), .Q(
        o_data_bus[52]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_51_ ( .D(N338), .CP(clk), .Q(
        o_data_bus[51]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_50_ ( .D(N337), .CP(clk), .Q(
        o_data_bus[50]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_49_ ( .D(N336), .CP(clk), .Q(
        o_data_bus[49]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_48_ ( .D(N335), .CP(clk), .Q(
        o_data_bus[48]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_47_ ( .D(N334), .CP(clk), .Q(
        o_data_bus[47]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_46_ ( .D(N333), .CP(clk), .Q(
        o_data_bus[46]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_45_ ( .D(N332), .CP(clk), .Q(
        o_data_bus[45]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_44_ ( .D(N331), .CP(clk), .Q(
        o_data_bus[44]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_43_ ( .D(N330), .CP(clk), .Q(
        o_data_bus[43]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_42_ ( .D(N329), .CP(clk), .Q(
        o_data_bus[42]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_41_ ( .D(N328), .CP(clk), .Q(
        o_data_bus[41]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_40_ ( .D(N327), .CP(clk), .Q(
        o_data_bus[40]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_39_ ( .D(N326), .CP(clk), .Q(
        o_data_bus[39]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_38_ ( .D(N325), .CP(clk), .Q(
        o_data_bus[38]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_37_ ( .D(N324), .CP(clk), .Q(
        o_data_bus[37]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_36_ ( .D(N323), .CP(clk), .Q(
        o_data_bus[36]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_35_ ( .D(N322), .CP(clk), .Q(
        o_data_bus[35]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_34_ ( .D(N321), .CP(clk), .Q(
        o_data_bus[34]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_33_ ( .D(N320), .CP(clk), .Q(
        o_data_bus[33]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_32_ ( .D(N319), .CP(clk), .Q(
        o_data_bus[32]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_31_ ( .D(N318), .CP(clk), .Q(
        o_data_bus[31]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_30_ ( .D(N317), .CP(clk), .Q(
        o_data_bus[30]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_29_ ( .D(N316), .CP(clk), .Q(
        o_data_bus[29]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_28_ ( .D(N315), .CP(clk), .Q(
        o_data_bus[28]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_27_ ( .D(N314), .CP(clk), .Q(
        o_data_bus[27]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_26_ ( .D(N313), .CP(clk), .Q(
        o_data_bus[26]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_25_ ( .D(N312), .CP(clk), .Q(
        o_data_bus[25]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_24_ ( .D(N311), .CP(clk), .Q(
        o_data_bus[24]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_23_ ( .D(N310), .CP(clk), .Q(
        o_data_bus[23]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_22_ ( .D(N309), .CP(clk), .Q(
        o_data_bus[22]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_21_ ( .D(N308), .CP(clk), .Q(
        o_data_bus[21]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_20_ ( .D(N307), .CP(clk), .Q(
        o_data_bus[20]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_19_ ( .D(N306), .CP(clk), .Q(
        o_data_bus[19]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_18_ ( .D(N305), .CP(clk), .Q(
        o_data_bus[18]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_17_ ( .D(N304), .CP(clk), .Q(
        o_data_bus[17]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_16_ ( .D(N303), .CP(clk), .Q(
        o_data_bus[16]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_15_ ( .D(N302), .CP(clk), .Q(
        o_data_bus[15]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_14_ ( .D(N301), .CP(clk), .Q(
        o_data_bus[14]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_13_ ( .D(N300), .CP(clk), .Q(
        o_data_bus[13]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_12_ ( .D(N299), .CP(clk), .Q(
        o_data_bus[12]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_11_ ( .D(N298), .CP(clk), .Q(
        o_data_bus[11]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_10_ ( .D(N297), .CP(clk), .Q(
        o_data_bus[10]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_9_ ( .D(N296), .CP(clk), .Q(
        o_data_bus[9]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_8_ ( .D(N295), .CP(clk), .Q(
        o_data_bus[8]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_7_ ( .D(N294), .CP(clk), .Q(
        o_data_bus[7]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_6_ ( .D(N293), .CP(clk), .Q(
        o_data_bus[6]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_5_ ( .D(N292), .CP(clk), .Q(
        o_data_bus[5]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_4_ ( .D(N291), .CP(clk), .Q(
        o_data_bus[4]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_3_ ( .D(N290), .CP(clk), .Q(
        o_data_bus[3]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_2_ ( .D(N289), .CP(clk), .Q(
        o_data_bus[2]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_1_ ( .D(N288), .CP(clk), .Q(
        o_data_bus[1]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_0_ ( .D(N287), .CP(clk), .Q(
        o_data_bus[0]) );
  INVD1BWP30P140LVT U3 ( .I(n4), .ZN(n14) );
  INVD1BWP30P140LVT U4 ( .I(n14), .ZN(n47) );
  INVD1BWP30P140LVT U5 ( .I(i_cmd[0]), .ZN(n13) );
  ND2D1BWP30P140LVT U6 ( .A1(n2), .A2(i_en), .ZN(n6) );
  INR2D1BWP30P140LVT U7 ( .A1(i_valid[0]), .B1(n6), .ZN(n3) );
  INVD1BWP30P140LVT U8 ( .I(n14), .ZN(n80) );
  OA211D1BWP30P140LVT U9 ( .A1(i_valid[1]), .A2(n13), .B(n12), .C(n11), .Z(n31) );
  ND2OPTIBD2BWP30P140LVT U10 ( .A1(n12), .A2(n9), .ZN(n1) );
  INVD1BWP30P140LVT U11 ( .I(rst), .ZN(n2) );
  INVD1BWP30P140LVT U12 ( .I(i_valid[1]), .ZN(n8) );
  ND2OPTIBD2BWP30P140LVT U13 ( .A1(n3), .A2(n13), .ZN(n10) );
  OAI31D1BWP30P140LVT U14 ( .A1(n6), .A2(n8), .A3(n13), .B(n10), .ZN(N353) );
  INVD1BWP30P140LVT U15 ( .I(n3), .ZN(n5) );
  IND3D1BWP30P140LVT U16 ( .A1(n6), .B1(i_cmd[1]), .B2(i_valid[1]), .ZN(n4) );
  OAI21D1BWP30P140LVT U17 ( .A1(n5), .A2(i_cmd[1]), .B(n80), .ZN(N354) );
  INVD1BWP30P140LVT U18 ( .I(i_data_bus[6]), .ZN(n54) );
  INVD1BWP30P140LVT U19 ( .I(n6), .ZN(n12) );
  OAI21D1BWP30P140LVT U20 ( .A1(i_cmd[1]), .A2(i_valid[0]), .B(i_cmd[0]), .ZN(
        n7) );
  AOI21OPTREPBD1BWP30P140LVT U21 ( .A1(i_cmd[1]), .A2(n8), .B(n7), .ZN(n9) );
  INVD1BWP30P140LVT U22 ( .I(i_data_bus[38]), .ZN(n53) );
  OAI22D1BWP30P140LVT U23 ( .A1(n10), .A2(n54), .B1(n1), .B2(n53), .ZN(N293)
         );
  INVD1BWP30P140LVT U24 ( .I(i_data_bus[5]), .ZN(n50) );
  INVD1BWP30P140LVT U25 ( .I(i_data_bus[37]), .ZN(n49) );
  OAI22D1BWP30P140LVT U26 ( .A1(n10), .A2(n50), .B1(n1), .B2(n49), .ZN(N292)
         );
  INVD1BWP30P140LVT U27 ( .I(i_data_bus[7]), .ZN(n68) );
  INVD1BWP30P140LVT U28 ( .I(i_data_bus[39]), .ZN(n67) );
  OAI22D1BWP30P140LVT U29 ( .A1(n10), .A2(n68), .B1(n1), .B2(n67), .ZN(N294)
         );
  INVD1BWP30P140LVT U30 ( .I(i_data_bus[2]), .ZN(n60) );
  INVD1BWP30P140LVT U31 ( .I(i_data_bus[34]), .ZN(n59) );
  OAI22D1BWP30P140LVT U32 ( .A1(n10), .A2(n60), .B1(n1), .B2(n59), .ZN(N289)
         );
  INVD1BWP30P140LVT U33 ( .I(i_data_bus[0]), .ZN(n66) );
  INVD1BWP30P140LVT U34 ( .I(i_data_bus[32]), .ZN(n65) );
  OAI22D1BWP30P140LVT U35 ( .A1(n10), .A2(n66), .B1(n1), .B2(n65), .ZN(N287)
         );
  INVD1BWP30P140LVT U36 ( .I(i_data_bus[1]), .ZN(n64) );
  INVD1BWP30P140LVT U37 ( .I(i_data_bus[33]), .ZN(n63) );
  OAI22D1BWP30P140LVT U38 ( .A1(n10), .A2(n64), .B1(n1), .B2(n63), .ZN(N288)
         );
  INVD1BWP30P140LVT U39 ( .I(i_data_bus[4]), .ZN(n52) );
  INVD1BWP30P140LVT U40 ( .I(i_data_bus[36]), .ZN(n51) );
  OAI22D1BWP30P140LVT U41 ( .A1(n10), .A2(n52), .B1(n1), .B2(n51), .ZN(N291)
         );
  INVD1BWP30P140LVT U42 ( .I(i_data_bus[3]), .ZN(n56) );
  INVD1BWP30P140LVT U43 ( .I(i_data_bus[35]), .ZN(n55) );
  OAI22D1BWP30P140LVT U44 ( .A1(n10), .A2(n56), .B1(n1), .B2(n55), .ZN(N290)
         );
  INVD1BWP30P140LVT U45 ( .I(i_data_bus[9]), .ZN(n72) );
  INVD1BWP30P140LVT U46 ( .I(i_data_bus[41]), .ZN(n71) );
  OAI22D1BWP30P140LVT U47 ( .A1(n10), .A2(n72), .B1(n1), .B2(n71), .ZN(N296)
         );
  INVD1BWP30P140LVT U48 ( .I(i_data_bus[31]), .ZN(n16) );
  INVD1BWP30P140LVT U49 ( .I(i_data_bus[63]), .ZN(n15) );
  OAI22D1BWP30P140LVT U50 ( .A1(n10), .A2(n16), .B1(n1), .B2(n15), .ZN(N318)
         );
  INVD1BWP30P140LVT U51 ( .I(i_data_bus[30]), .ZN(n81) );
  INVD1BWP30P140LVT U52 ( .I(i_data_bus[62]), .ZN(n79) );
  OAI22D1BWP30P140LVT U53 ( .A1(n10), .A2(n81), .B1(n1), .B2(n79), .ZN(N317)
         );
  INVD1BWP30P140LVT U54 ( .I(i_data_bus[29]), .ZN(n18) );
  INVD1BWP30P140LVT U55 ( .I(i_data_bus[61]), .ZN(n17) );
  OAI22D1BWP30P140LVT U56 ( .A1(n10), .A2(n18), .B1(n1), .B2(n17), .ZN(N316)
         );
  INVD1BWP30P140LVT U57 ( .I(i_data_bus[28]), .ZN(n62) );
  INVD1BWP30P140LVT U58 ( .I(i_data_bus[60]), .ZN(n61) );
  OAI22D1BWP30P140LVT U59 ( .A1(n10), .A2(n62), .B1(n1), .B2(n61), .ZN(N315)
         );
  INVD1BWP30P140LVT U60 ( .I(i_data_bus[27]), .ZN(n20) );
  INVD1BWP30P140LVT U61 ( .I(i_data_bus[59]), .ZN(n19) );
  OAI22D1BWP30P140LVT U62 ( .A1(n10), .A2(n20), .B1(n1), .B2(n19), .ZN(N314)
         );
  INVD1BWP30P140LVT U63 ( .I(i_data_bus[26]), .ZN(n78) );
  INVD1BWP30P140LVT U64 ( .I(i_data_bus[58]), .ZN(n77) );
  OAI22D1BWP30P140LVT U65 ( .A1(n10), .A2(n78), .B1(n1), .B2(n77), .ZN(N313)
         );
  INVD1BWP30P140LVT U66 ( .I(i_data_bus[25]), .ZN(n22) );
  INVD1BWP30P140LVT U67 ( .I(i_data_bus[57]), .ZN(n21) );
  OAI22D1BWP30P140LVT U68 ( .A1(n10), .A2(n22), .B1(n1), .B2(n21), .ZN(N312)
         );
  INVD1BWP30P140LVT U69 ( .I(i_data_bus[24]), .ZN(n58) );
  INVD1BWP30P140LVT U70 ( .I(i_data_bus[56]), .ZN(n57) );
  OAI22D1BWP30P140LVT U71 ( .A1(n10), .A2(n58), .B1(n1), .B2(n57), .ZN(N311)
         );
  INVD1BWP30P140LVT U72 ( .I(i_data_bus[23]), .ZN(n24) );
  INVD1BWP30P140LVT U73 ( .I(i_data_bus[55]), .ZN(n23) );
  OAI22D1BWP30P140LVT U74 ( .A1(n10), .A2(n24), .B1(n1), .B2(n23), .ZN(N310)
         );
  INVD1BWP30P140LVT U75 ( .I(i_data_bus[22]), .ZN(n26) );
  INVD1BWP30P140LVT U76 ( .I(i_data_bus[54]), .ZN(n25) );
  OAI22D1BWP30P140LVT U77 ( .A1(n10), .A2(n26), .B1(n1), .B2(n25), .ZN(N309)
         );
  INVD1BWP30P140LVT U78 ( .I(i_data_bus[21]), .ZN(n28) );
  INVD1BWP30P140LVT U79 ( .I(i_data_bus[53]), .ZN(n27) );
  OAI22D1BWP30P140LVT U80 ( .A1(n10), .A2(n28), .B1(n1), .B2(n27), .ZN(N308)
         );
  INVD1BWP30P140LVT U81 ( .I(i_data_bus[20]), .ZN(n30) );
  INVD1BWP30P140LVT U82 ( .I(i_data_bus[52]), .ZN(n29) );
  OAI22D1BWP30P140LVT U83 ( .A1(n10), .A2(n30), .B1(n1), .B2(n29), .ZN(N307)
         );
  INVD1BWP30P140LVT U84 ( .I(i_data_bus[19]), .ZN(n33) );
  INVD1BWP30P140LVT U85 ( .I(i_data_bus[51]), .ZN(n32) );
  OAI22D1BWP30P140LVT U86 ( .A1(n10), .A2(n33), .B1(n1), .B2(n32), .ZN(N306)
         );
  INVD1BWP30P140LVT U87 ( .I(i_data_bus[18]), .ZN(n35) );
  INVD1BWP30P140LVT U88 ( .I(i_data_bus[50]), .ZN(n34) );
  OAI22D1BWP30P140LVT U89 ( .A1(n10), .A2(n35), .B1(n1), .B2(n34), .ZN(N305)
         );
  INVD1BWP30P140LVT U90 ( .I(i_data_bus[17]), .ZN(n37) );
  INVD1BWP30P140LVT U91 ( .I(i_data_bus[49]), .ZN(n36) );
  OAI22D1BWP30P140LVT U92 ( .A1(n10), .A2(n37), .B1(n1), .B2(n36), .ZN(N304)
         );
  INVD1BWP30P140LVT U93 ( .I(i_data_bus[16]), .ZN(n39) );
  INVD1BWP30P140LVT U94 ( .I(i_data_bus[48]), .ZN(n38) );
  OAI22D1BWP30P140LVT U95 ( .A1(n10), .A2(n39), .B1(n1), .B2(n38), .ZN(N303)
         );
  INVD1BWP30P140LVT U96 ( .I(i_data_bus[15]), .ZN(n41) );
  INVD1BWP30P140LVT U97 ( .I(i_data_bus[47]), .ZN(n40) );
  OAI22D1BWP30P140LVT U98 ( .A1(n10), .A2(n41), .B1(n1), .B2(n40), .ZN(N302)
         );
  INVD1BWP30P140LVT U99 ( .I(i_data_bus[14]), .ZN(n43) );
  INVD1BWP30P140LVT U100 ( .I(i_data_bus[46]), .ZN(n42) );
  OAI22D1BWP30P140LVT U101 ( .A1(n10), .A2(n43), .B1(n1), .B2(n42), .ZN(N301)
         );
  INVD1BWP30P140LVT U102 ( .I(i_data_bus[13]), .ZN(n45) );
  INVD1BWP30P140LVT U103 ( .I(i_data_bus[45]), .ZN(n44) );
  OAI22D1BWP30P140LVT U104 ( .A1(n10), .A2(n45), .B1(n1), .B2(n44), .ZN(N300)
         );
  INVD1BWP30P140LVT U105 ( .I(i_data_bus[10]), .ZN(n74) );
  INVD1BWP30P140LVT U106 ( .I(i_data_bus[42]), .ZN(n73) );
  OAI22D1BWP30P140LVT U107 ( .A1(n10), .A2(n74), .B1(n1), .B2(n73), .ZN(N297)
         );
  INVD1BWP30P140LVT U108 ( .I(i_data_bus[12]), .ZN(n48) );
  INVD1BWP30P140LVT U109 ( .I(i_data_bus[44]), .ZN(n46) );
  OAI22D1BWP30P140LVT U110 ( .A1(n10), .A2(n48), .B1(n1), .B2(n46), .ZN(N299)
         );
  INVD1BWP30P140LVT U111 ( .I(i_data_bus[11]), .ZN(n76) );
  INVD1BWP30P140LVT U112 ( .I(i_data_bus[43]), .ZN(n75) );
  OAI22D1BWP30P140LVT U113 ( .A1(n10), .A2(n76), .B1(n1), .B2(n75), .ZN(N298)
         );
  INVD1BWP30P140LVT U114 ( .I(i_data_bus[8]), .ZN(n70) );
  INVD1BWP30P140LVT U115 ( .I(i_data_bus[40]), .ZN(n69) );
  OAI22D1BWP30P140LVT U116 ( .A1(n10), .A2(n70), .B1(n1), .B2(n69), .ZN(N295)
         );
  IAO21D1BWP30P140LVT U117 ( .A1(i_cmd[0]), .A2(i_valid[0]), .B(i_cmd[1]), 
        .ZN(n11) );
  INVD2BWP30P140LVT U118 ( .I(n31), .ZN(n82) );
  OAI22D1BWP30P140LVT U119 ( .A1(n82), .A2(n16), .B1(n47), .B2(n15), .ZN(N350)
         );
  OAI22D1BWP30P140LVT U120 ( .A1(n82), .A2(n18), .B1(n47), .B2(n17), .ZN(N348)
         );
  OAI22D1BWP30P140LVT U121 ( .A1(n82), .A2(n20), .B1(n47), .B2(n19), .ZN(N346)
         );
  OAI22D1BWP30P140LVT U122 ( .A1(n82), .A2(n22), .B1(n47), .B2(n21), .ZN(N344)
         );
  OAI22D1BWP30P140LVT U123 ( .A1(n82), .A2(n24), .B1(n47), .B2(n23), .ZN(N342)
         );
  OAI22D1BWP30P140LVT U124 ( .A1(n82), .A2(n26), .B1(n47), .B2(n25), .ZN(N341)
         );
  OAI22D1BWP30P140LVT U125 ( .A1(n82), .A2(n28), .B1(n47), .B2(n27), .ZN(N340)
         );
  OAI22D1BWP30P140LVT U126 ( .A1(n82), .A2(n30), .B1(n47), .B2(n29), .ZN(N339)
         );
  OAI22D1BWP30P140LVT U127 ( .A1(n82), .A2(n33), .B1(n47), .B2(n32), .ZN(N338)
         );
  OAI22D1BWP30P140LVT U128 ( .A1(n82), .A2(n35), .B1(n47), .B2(n34), .ZN(N337)
         );
  OAI22D1BWP30P140LVT U129 ( .A1(n82), .A2(n37), .B1(n47), .B2(n36), .ZN(N336)
         );
  OAI22D1BWP30P140LVT U130 ( .A1(n82), .A2(n39), .B1(n47), .B2(n38), .ZN(N335)
         );
  OAI22D1BWP30P140LVT U131 ( .A1(n82), .A2(n41), .B1(n47), .B2(n40), .ZN(N334)
         );
  OAI22D1BWP30P140LVT U132 ( .A1(n82), .A2(n43), .B1(n47), .B2(n42), .ZN(N333)
         );
  OAI22D1BWP30P140LVT U133 ( .A1(n82), .A2(n45), .B1(n47), .B2(n44), .ZN(N332)
         );
  OAI22D1BWP30P140LVT U134 ( .A1(n82), .A2(n48), .B1(n47), .B2(n46), .ZN(N331)
         );
  OAI22D1BWP30P140LVT U135 ( .A1(n82), .A2(n50), .B1(n80), .B2(n49), .ZN(N324)
         );
  OAI22D1BWP30P140LVT U136 ( .A1(n82), .A2(n52), .B1(n80), .B2(n51), .ZN(N323)
         );
  OAI22D1BWP30P140LVT U137 ( .A1(n82), .A2(n54), .B1(n80), .B2(n53), .ZN(N325)
         );
  OAI22D1BWP30P140LVT U138 ( .A1(n82), .A2(n56), .B1(n80), .B2(n55), .ZN(N322)
         );
  OAI22D1BWP30P140LVT U139 ( .A1(n82), .A2(n58), .B1(n80), .B2(n57), .ZN(N343)
         );
  OAI22D1BWP30P140LVT U140 ( .A1(n82), .A2(n60), .B1(n80), .B2(n59), .ZN(N321)
         );
  OAI22D1BWP30P140LVT U141 ( .A1(n82), .A2(n62), .B1(n80), .B2(n61), .ZN(N347)
         );
  OAI22D1BWP30P140LVT U142 ( .A1(n82), .A2(n64), .B1(n80), .B2(n63), .ZN(N320)
         );
  OAI22D1BWP30P140LVT U143 ( .A1(n82), .A2(n66), .B1(n80), .B2(n65), .ZN(N319)
         );
  OAI22D1BWP30P140LVT U144 ( .A1(n82), .A2(n68), .B1(n80), .B2(n67), .ZN(N326)
         );
  OAI22D1BWP30P140LVT U145 ( .A1(n82), .A2(n70), .B1(n80), .B2(n69), .ZN(N327)
         );
  OAI22D1BWP30P140LVT U146 ( .A1(n82), .A2(n72), .B1(n80), .B2(n71), .ZN(N328)
         );
  OAI22D1BWP30P140LVT U147 ( .A1(n82), .A2(n74), .B1(n80), .B2(n73), .ZN(N329)
         );
  OAI22D1BWP30P140LVT U148 ( .A1(n82), .A2(n76), .B1(n80), .B2(n75), .ZN(N330)
         );
  OAI22D1BWP30P140LVT U149 ( .A1(n82), .A2(n78), .B1(n80), .B2(n77), .ZN(N345)
         );
  OAI22D1BWP30P140LVT U150 ( .A1(n82), .A2(n81), .B1(n80), .B2(n79), .ZN(N349)
         );
endmodule


module distribute_2x2_simple_seq_DATA_WIDTH32_COMMAND_WIDTH2_4 ( clk, rst, 
        i_valid, i_data_bus, o_valid, o_data_bus, i_en, i_cmd );
  input [1:0] i_valid;
  input [63:0] i_data_bus;
  output [1:0] o_valid;
  output [63:0] o_data_bus;
  input [1:0] i_cmd;
  input clk, rst, i_en;
  wire   N287, N288, N289, N290, N291, N292, N293, N294, N295, N296, N297,
         N298, N299, N300, N301, N302, N303, N304, N305, N306, N307, N308,
         N309, N310, N311, N312, N313, N314, N315, N316, N317, N318, N319,
         N320, N321, N322, N323, N324, N325, N326, N327, N328, N329, N330,
         N331, N332, N333, N334, N335, N336, N337, N338, N339, N340, N341,
         N342, N343, N344, N345, N346, N347, N348, N349, N350, N353, N354, n1,
         n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30,
         n31, n32, n33, n34, n35, n36, n37, n38, n39, n40, n41, n42, n43, n44,
         n45, n46, n47, n48, n49, n50, n51, n52, n53, n54, n55, n56, n57, n58,
         n59, n60, n61, n62, n63, n64, n65, n66, n67, n68, n69, n70, n71, n72,
         n73, n74, n75, n76, n77, n78, n79, n80, n81, n82;

  DFQD1BWP30P140LVT o_valid_inner_reg_1_ ( .D(N354), .CP(clk), .Q(o_valid[1])
         );
  DFQD1BWP30P140LVT o_valid_inner_reg_0_ ( .D(N353), .CP(clk), .Q(o_valid[0])
         );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_63_ ( .D(N350), .CP(clk), .Q(
        o_data_bus[63]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_62_ ( .D(N349), .CP(clk), .Q(
        o_data_bus[62]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_61_ ( .D(N348), .CP(clk), .Q(
        o_data_bus[61]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_60_ ( .D(N347), .CP(clk), .Q(
        o_data_bus[60]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_59_ ( .D(N346), .CP(clk), .Q(
        o_data_bus[59]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_58_ ( .D(N345), .CP(clk), .Q(
        o_data_bus[58]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_57_ ( .D(N344), .CP(clk), .Q(
        o_data_bus[57]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_56_ ( .D(N343), .CP(clk), .Q(
        o_data_bus[56]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_55_ ( .D(N342), .CP(clk), .Q(
        o_data_bus[55]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_54_ ( .D(N341), .CP(clk), .Q(
        o_data_bus[54]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_53_ ( .D(N340), .CP(clk), .Q(
        o_data_bus[53]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_52_ ( .D(N339), .CP(clk), .Q(
        o_data_bus[52]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_51_ ( .D(N338), .CP(clk), .Q(
        o_data_bus[51]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_50_ ( .D(N337), .CP(clk), .Q(
        o_data_bus[50]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_49_ ( .D(N336), .CP(clk), .Q(
        o_data_bus[49]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_48_ ( .D(N335), .CP(clk), .Q(
        o_data_bus[48]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_47_ ( .D(N334), .CP(clk), .Q(
        o_data_bus[47]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_46_ ( .D(N333), .CP(clk), .Q(
        o_data_bus[46]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_45_ ( .D(N332), .CP(clk), .Q(
        o_data_bus[45]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_44_ ( .D(N331), .CP(clk), .Q(
        o_data_bus[44]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_43_ ( .D(N330), .CP(clk), .Q(
        o_data_bus[43]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_42_ ( .D(N329), .CP(clk), .Q(
        o_data_bus[42]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_41_ ( .D(N328), .CP(clk), .Q(
        o_data_bus[41]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_40_ ( .D(N327), .CP(clk), .Q(
        o_data_bus[40]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_39_ ( .D(N326), .CP(clk), .Q(
        o_data_bus[39]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_38_ ( .D(N325), .CP(clk), .Q(
        o_data_bus[38]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_37_ ( .D(N324), .CP(clk), .Q(
        o_data_bus[37]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_36_ ( .D(N323), .CP(clk), .Q(
        o_data_bus[36]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_35_ ( .D(N322), .CP(clk), .Q(
        o_data_bus[35]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_34_ ( .D(N321), .CP(clk), .Q(
        o_data_bus[34]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_33_ ( .D(N320), .CP(clk), .Q(
        o_data_bus[33]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_32_ ( .D(N319), .CP(clk), .Q(
        o_data_bus[32]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_31_ ( .D(N318), .CP(clk), .Q(
        o_data_bus[31]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_30_ ( .D(N317), .CP(clk), .Q(
        o_data_bus[30]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_29_ ( .D(N316), .CP(clk), .Q(
        o_data_bus[29]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_28_ ( .D(N315), .CP(clk), .Q(
        o_data_bus[28]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_27_ ( .D(N314), .CP(clk), .Q(
        o_data_bus[27]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_26_ ( .D(N313), .CP(clk), .Q(
        o_data_bus[26]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_25_ ( .D(N312), .CP(clk), .Q(
        o_data_bus[25]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_24_ ( .D(N311), .CP(clk), .Q(
        o_data_bus[24]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_23_ ( .D(N310), .CP(clk), .Q(
        o_data_bus[23]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_22_ ( .D(N309), .CP(clk), .Q(
        o_data_bus[22]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_21_ ( .D(N308), .CP(clk), .Q(
        o_data_bus[21]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_20_ ( .D(N307), .CP(clk), .Q(
        o_data_bus[20]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_19_ ( .D(N306), .CP(clk), .Q(
        o_data_bus[19]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_18_ ( .D(N305), .CP(clk), .Q(
        o_data_bus[18]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_17_ ( .D(N304), .CP(clk), .Q(
        o_data_bus[17]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_16_ ( .D(N303), .CP(clk), .Q(
        o_data_bus[16]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_15_ ( .D(N302), .CP(clk), .Q(
        o_data_bus[15]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_14_ ( .D(N301), .CP(clk), .Q(
        o_data_bus[14]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_13_ ( .D(N300), .CP(clk), .Q(
        o_data_bus[13]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_12_ ( .D(N299), .CP(clk), .Q(
        o_data_bus[12]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_11_ ( .D(N298), .CP(clk), .Q(
        o_data_bus[11]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_10_ ( .D(N297), .CP(clk), .Q(
        o_data_bus[10]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_9_ ( .D(N296), .CP(clk), .Q(
        o_data_bus[9]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_8_ ( .D(N295), .CP(clk), .Q(
        o_data_bus[8]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_7_ ( .D(N294), .CP(clk), .Q(
        o_data_bus[7]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_6_ ( .D(N293), .CP(clk), .Q(
        o_data_bus[6]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_5_ ( .D(N292), .CP(clk), .Q(
        o_data_bus[5]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_4_ ( .D(N291), .CP(clk), .Q(
        o_data_bus[4]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_3_ ( .D(N290), .CP(clk), .Q(
        o_data_bus[3]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_2_ ( .D(N289), .CP(clk), .Q(
        o_data_bus[2]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_1_ ( .D(N288), .CP(clk), .Q(
        o_data_bus[1]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_0_ ( .D(N287), .CP(clk), .Q(
        o_data_bus[0]) );
  INVD1BWP30P140LVT U3 ( .I(n4), .ZN(n14) );
  INVD1BWP30P140LVT U4 ( .I(n14), .ZN(n47) );
  INVD1BWP30P140LVT U5 ( .I(i_cmd[0]), .ZN(n13) );
  ND2D1BWP30P140LVT U6 ( .A1(n2), .A2(i_en), .ZN(n6) );
  INR2D1BWP30P140LVT U7 ( .A1(i_valid[0]), .B1(n6), .ZN(n3) );
  INVD1BWP30P140LVT U8 ( .I(n14), .ZN(n80) );
  OA211D1BWP30P140LVT U9 ( .A1(i_valid[1]), .A2(n13), .B(n12), .C(n11), .Z(n17) );
  ND2OPTIBD2BWP30P140LVT U10 ( .A1(n12), .A2(n9), .ZN(n1) );
  INVD1BWP30P140LVT U11 ( .I(rst), .ZN(n2) );
  INVD1BWP30P140LVT U12 ( .I(i_valid[1]), .ZN(n8) );
  ND2OPTIBD2BWP30P140LVT U13 ( .A1(n3), .A2(n13), .ZN(n10) );
  OAI31D1BWP30P140LVT U14 ( .A1(n6), .A2(n8), .A3(n13), .B(n10), .ZN(N353) );
  INVD1BWP30P140LVT U15 ( .I(n3), .ZN(n5) );
  IND3D1BWP30P140LVT U16 ( .A1(n6), .B1(i_cmd[1]), .B2(i_valid[1]), .ZN(n4) );
  OAI21D1BWP30P140LVT U17 ( .A1(n5), .A2(i_cmd[1]), .B(n80), .ZN(N354) );
  INVD1BWP30P140LVT U18 ( .I(i_data_bus[1]), .ZN(n81) );
  INVD1BWP30P140LVT U19 ( .I(n6), .ZN(n12) );
  OAI21D1BWP30P140LVT U20 ( .A1(i_cmd[1]), .A2(i_valid[0]), .B(i_cmd[0]), .ZN(
        n7) );
  AOI21OPTREPBD1BWP30P140LVT U21 ( .A1(i_cmd[1]), .A2(n8), .B(n7), .ZN(n9) );
  INVD1BWP30P140LVT U22 ( .I(i_data_bus[33]), .ZN(n79) );
  OAI22D1BWP30P140LVT U23 ( .A1(n10), .A2(n81), .B1(n1), .B2(n79), .ZN(N288)
         );
  INVD1BWP30P140LVT U24 ( .I(i_data_bus[0]), .ZN(n64) );
  INVD1BWP30P140LVT U25 ( .I(i_data_bus[32]), .ZN(n63) );
  OAI22D1BWP30P140LVT U26 ( .A1(n10), .A2(n64), .B1(n1), .B2(n63), .ZN(N287)
         );
  INVD1BWP30P140LVT U27 ( .I(i_data_bus[6]), .ZN(n58) );
  INVD1BWP30P140LVT U28 ( .I(i_data_bus[38]), .ZN(n57) );
  OAI22D1BWP30P140LVT U29 ( .A1(n10), .A2(n58), .B1(n1), .B2(n57), .ZN(N293)
         );
  INVD1BWP30P140LVT U30 ( .I(i_data_bus[2]), .ZN(n50) );
  INVD1BWP30P140LVT U31 ( .I(i_data_bus[34]), .ZN(n49) );
  OAI22D1BWP30P140LVT U32 ( .A1(n10), .A2(n50), .B1(n1), .B2(n49), .ZN(N289)
         );
  INVD1BWP30P140LVT U33 ( .I(i_data_bus[3]), .ZN(n68) );
  INVD1BWP30P140LVT U34 ( .I(i_data_bus[35]), .ZN(n67) );
  OAI22D1BWP30P140LVT U35 ( .A1(n10), .A2(n68), .B1(n1), .B2(n67), .ZN(N290)
         );
  INVD1BWP30P140LVT U36 ( .I(i_data_bus[4]), .ZN(n60) );
  INVD1BWP30P140LVT U37 ( .I(i_data_bus[36]), .ZN(n59) );
  OAI22D1BWP30P140LVT U38 ( .A1(n10), .A2(n60), .B1(n1), .B2(n59), .ZN(N291)
         );
  INVD1BWP30P140LVT U39 ( .I(i_data_bus[5]), .ZN(n72) );
  INVD1BWP30P140LVT U40 ( .I(i_data_bus[37]), .ZN(n71) );
  OAI22D1BWP30P140LVT U41 ( .A1(n10), .A2(n72), .B1(n1), .B2(n71), .ZN(N292)
         );
  INVD1BWP30P140LVT U42 ( .I(i_data_bus[7]), .ZN(n52) );
  INVD1BWP30P140LVT U43 ( .I(i_data_bus[39]), .ZN(n51) );
  OAI22D1BWP30P140LVT U44 ( .A1(n10), .A2(n52), .B1(n1), .B2(n51), .ZN(N294)
         );
  INVD1BWP30P140LVT U45 ( .I(i_data_bus[8]), .ZN(n76) );
  INVD1BWP30P140LVT U46 ( .I(i_data_bus[40]), .ZN(n75) );
  OAI22D1BWP30P140LVT U47 ( .A1(n10), .A2(n76), .B1(n1), .B2(n75), .ZN(N295)
         );
  INVD1BWP30P140LVT U48 ( .I(i_data_bus[9]), .ZN(n54) );
  INVD1BWP30P140LVT U49 ( .I(i_data_bus[41]), .ZN(n53) );
  OAI22D1BWP30P140LVT U50 ( .A1(n10), .A2(n54), .B1(n1), .B2(n53), .ZN(N296)
         );
  INVD1BWP30P140LVT U51 ( .I(i_data_bus[10]), .ZN(n56) );
  INVD1BWP30P140LVT U52 ( .I(i_data_bus[42]), .ZN(n55) );
  OAI22D1BWP30P140LVT U53 ( .A1(n10), .A2(n56), .B1(n1), .B2(n55), .ZN(N297)
         );
  INVD1BWP30P140LVT U54 ( .I(i_data_bus[11]), .ZN(n62) );
  INVD1BWP30P140LVT U55 ( .I(i_data_bus[43]), .ZN(n61) );
  OAI22D1BWP30P140LVT U56 ( .A1(n10), .A2(n62), .B1(n1), .B2(n61), .ZN(N298)
         );
  INVD1BWP30P140LVT U57 ( .I(i_data_bus[12]), .ZN(n39) );
  INVD1BWP30P140LVT U58 ( .I(i_data_bus[44]), .ZN(n38) );
  OAI22D1BWP30P140LVT U59 ( .A1(n10), .A2(n39), .B1(n1), .B2(n38), .ZN(N299)
         );
  INVD1BWP30P140LVT U60 ( .I(i_data_bus[13]), .ZN(n43) );
  INVD1BWP30P140LVT U61 ( .I(i_data_bus[45]), .ZN(n42) );
  OAI22D1BWP30P140LVT U62 ( .A1(n10), .A2(n43), .B1(n1), .B2(n42), .ZN(N300)
         );
  INVD1BWP30P140LVT U63 ( .I(i_data_bus[14]), .ZN(n45) );
  INVD1BWP30P140LVT U64 ( .I(i_data_bus[46]), .ZN(n44) );
  OAI22D1BWP30P140LVT U65 ( .A1(n10), .A2(n45), .B1(n1), .B2(n44), .ZN(N301)
         );
  INVD1BWP30P140LVT U66 ( .I(i_data_bus[15]), .ZN(n27) );
  INVD1BWP30P140LVT U67 ( .I(i_data_bus[47]), .ZN(n26) );
  OAI22D1BWP30P140LVT U68 ( .A1(n10), .A2(n27), .B1(n1), .B2(n26), .ZN(N302)
         );
  INVD1BWP30P140LVT U69 ( .I(i_data_bus[16]), .ZN(n29) );
  INVD1BWP30P140LVT U70 ( .I(i_data_bus[48]), .ZN(n28) );
  OAI22D1BWP30P140LVT U71 ( .A1(n10), .A2(n29), .B1(n1), .B2(n28), .ZN(N303)
         );
  INVD1BWP30P140LVT U72 ( .I(i_data_bus[17]), .ZN(n31) );
  INVD1BWP30P140LVT U73 ( .I(i_data_bus[49]), .ZN(n30) );
  OAI22D1BWP30P140LVT U74 ( .A1(n10), .A2(n31), .B1(n1), .B2(n30), .ZN(N304)
         );
  INVD1BWP30P140LVT U75 ( .I(i_data_bus[18]), .ZN(n33) );
  INVD1BWP30P140LVT U76 ( .I(i_data_bus[50]), .ZN(n32) );
  OAI22D1BWP30P140LVT U77 ( .A1(n10), .A2(n33), .B1(n1), .B2(n32), .ZN(N305)
         );
  INVD1BWP30P140LVT U78 ( .I(i_data_bus[19]), .ZN(n19) );
  INVD1BWP30P140LVT U79 ( .I(i_data_bus[51]), .ZN(n18) );
  OAI22D1BWP30P140LVT U80 ( .A1(n10), .A2(n19), .B1(n1), .B2(n18), .ZN(N306)
         );
  INVD1BWP30P140LVT U81 ( .I(i_data_bus[20]), .ZN(n37) );
  INVD1BWP30P140LVT U82 ( .I(i_data_bus[52]), .ZN(n36) );
  OAI22D1BWP30P140LVT U83 ( .A1(n10), .A2(n37), .B1(n1), .B2(n36), .ZN(N307)
         );
  INVD1BWP30P140LVT U84 ( .I(i_data_bus[21]), .ZN(n21) );
  INVD1BWP30P140LVT U85 ( .I(i_data_bus[53]), .ZN(n20) );
  OAI22D1BWP30P140LVT U86 ( .A1(n10), .A2(n21), .B1(n1), .B2(n20), .ZN(N308)
         );
  INVD1BWP30P140LVT U87 ( .I(i_data_bus[22]), .ZN(n41) );
  INVD1BWP30P140LVT U88 ( .I(i_data_bus[54]), .ZN(n40) );
  OAI22D1BWP30P140LVT U89 ( .A1(n10), .A2(n41), .B1(n1), .B2(n40), .ZN(N309)
         );
  INVD1BWP30P140LVT U90 ( .I(i_data_bus[23]), .ZN(n23) );
  INVD1BWP30P140LVT U91 ( .I(i_data_bus[55]), .ZN(n22) );
  OAI22D1BWP30P140LVT U92 ( .A1(n10), .A2(n23), .B1(n1), .B2(n22), .ZN(N310)
         );
  INVD1BWP30P140LVT U93 ( .I(i_data_bus[24]), .ZN(n66) );
  INVD1BWP30P140LVT U94 ( .I(i_data_bus[56]), .ZN(n65) );
  OAI22D1BWP30P140LVT U95 ( .A1(n10), .A2(n66), .B1(n1), .B2(n65), .ZN(N311)
         );
  INVD1BWP30P140LVT U96 ( .I(i_data_bus[25]), .ZN(n25) );
  INVD1BWP30P140LVT U97 ( .I(i_data_bus[57]), .ZN(n24) );
  OAI22D1BWP30P140LVT U98 ( .A1(n10), .A2(n25), .B1(n1), .B2(n24), .ZN(N312)
         );
  INVD1BWP30P140LVT U99 ( .I(i_data_bus[26]), .ZN(n70) );
  INVD1BWP30P140LVT U100 ( .I(i_data_bus[58]), .ZN(n69) );
  OAI22D1BWP30P140LVT U101 ( .A1(n10), .A2(n70), .B1(n1), .B2(n69), .ZN(N313)
         );
  INVD1BWP30P140LVT U102 ( .I(i_data_bus[27]), .ZN(n48) );
  INVD1BWP30P140LVT U103 ( .I(i_data_bus[59]), .ZN(n46) );
  OAI22D1BWP30P140LVT U104 ( .A1(n10), .A2(n48), .B1(n1), .B2(n46), .ZN(N314)
         );
  INVD1BWP30P140LVT U105 ( .I(i_data_bus[28]), .ZN(n74) );
  INVD1BWP30P140LVT U106 ( .I(i_data_bus[60]), .ZN(n73) );
  OAI22D1BWP30P140LVT U107 ( .A1(n10), .A2(n74), .B1(n1), .B2(n73), .ZN(N315)
         );
  INVD1BWP30P140LVT U108 ( .I(i_data_bus[29]), .ZN(n16) );
  INVD1BWP30P140LVT U109 ( .I(i_data_bus[61]), .ZN(n15) );
  OAI22D1BWP30P140LVT U110 ( .A1(n10), .A2(n16), .B1(n1), .B2(n15), .ZN(N316)
         );
  INVD1BWP30P140LVT U111 ( .I(i_data_bus[30]), .ZN(n78) );
  INVD1BWP30P140LVT U112 ( .I(i_data_bus[62]), .ZN(n77) );
  OAI22D1BWP30P140LVT U113 ( .A1(n10), .A2(n78), .B1(n1), .B2(n77), .ZN(N317)
         );
  INVD1BWP30P140LVT U114 ( .I(i_data_bus[31]), .ZN(n35) );
  INVD1BWP30P140LVT U115 ( .I(i_data_bus[63]), .ZN(n34) );
  OAI22D1BWP30P140LVT U116 ( .A1(n10), .A2(n35), .B1(n1), .B2(n34), .ZN(N318)
         );
  IAO21D1BWP30P140LVT U117 ( .A1(i_cmd[0]), .A2(i_valid[0]), .B(i_cmd[1]), 
        .ZN(n11) );
  INVD2BWP30P140LVT U118 ( .I(n17), .ZN(n82) );
  OAI22D1BWP30P140LVT U119 ( .A1(n82), .A2(n16), .B1(n47), .B2(n15), .ZN(N348)
         );
  OAI22D1BWP30P140LVT U120 ( .A1(n82), .A2(n19), .B1(n47), .B2(n18), .ZN(N338)
         );
  OAI22D1BWP30P140LVT U121 ( .A1(n82), .A2(n21), .B1(n47), .B2(n20), .ZN(N340)
         );
  OAI22D1BWP30P140LVT U122 ( .A1(n82), .A2(n23), .B1(n47), .B2(n22), .ZN(N342)
         );
  OAI22D1BWP30P140LVT U123 ( .A1(n82), .A2(n25), .B1(n47), .B2(n24), .ZN(N344)
         );
  OAI22D1BWP30P140LVT U124 ( .A1(n82), .A2(n27), .B1(n47), .B2(n26), .ZN(N334)
         );
  OAI22D1BWP30P140LVT U125 ( .A1(n82), .A2(n29), .B1(n47), .B2(n28), .ZN(N335)
         );
  OAI22D1BWP30P140LVT U126 ( .A1(n82), .A2(n31), .B1(n47), .B2(n30), .ZN(N336)
         );
  OAI22D1BWP30P140LVT U127 ( .A1(n82), .A2(n33), .B1(n47), .B2(n32), .ZN(N337)
         );
  OAI22D1BWP30P140LVT U128 ( .A1(n82), .A2(n35), .B1(n47), .B2(n34), .ZN(N350)
         );
  OAI22D1BWP30P140LVT U129 ( .A1(n82), .A2(n37), .B1(n47), .B2(n36), .ZN(N339)
         );
  OAI22D1BWP30P140LVT U130 ( .A1(n82), .A2(n39), .B1(n47), .B2(n38), .ZN(N331)
         );
  OAI22D1BWP30P140LVT U131 ( .A1(n82), .A2(n41), .B1(n47), .B2(n40), .ZN(N341)
         );
  OAI22D1BWP30P140LVT U132 ( .A1(n82), .A2(n43), .B1(n47), .B2(n42), .ZN(N332)
         );
  OAI22D1BWP30P140LVT U133 ( .A1(n82), .A2(n45), .B1(n47), .B2(n44), .ZN(N333)
         );
  OAI22D1BWP30P140LVT U134 ( .A1(n82), .A2(n48), .B1(n47), .B2(n46), .ZN(N346)
         );
  OAI22D1BWP30P140LVT U135 ( .A1(n82), .A2(n50), .B1(n80), .B2(n49), .ZN(N321)
         );
  OAI22D1BWP30P140LVT U136 ( .A1(n82), .A2(n52), .B1(n80), .B2(n51), .ZN(N326)
         );
  OAI22D1BWP30P140LVT U137 ( .A1(n82), .A2(n54), .B1(n80), .B2(n53), .ZN(N328)
         );
  OAI22D1BWP30P140LVT U138 ( .A1(n82), .A2(n56), .B1(n80), .B2(n55), .ZN(N329)
         );
  OAI22D1BWP30P140LVT U139 ( .A1(n82), .A2(n58), .B1(n80), .B2(n57), .ZN(N325)
         );
  OAI22D1BWP30P140LVT U140 ( .A1(n82), .A2(n60), .B1(n80), .B2(n59), .ZN(N323)
         );
  OAI22D1BWP30P140LVT U141 ( .A1(n82), .A2(n62), .B1(n80), .B2(n61), .ZN(N330)
         );
  OAI22D1BWP30P140LVT U142 ( .A1(n82), .A2(n64), .B1(n80), .B2(n63), .ZN(N319)
         );
  OAI22D1BWP30P140LVT U143 ( .A1(n82), .A2(n66), .B1(n80), .B2(n65), .ZN(N343)
         );
  OAI22D1BWP30P140LVT U144 ( .A1(n82), .A2(n68), .B1(n80), .B2(n67), .ZN(N322)
         );
  OAI22D1BWP30P140LVT U145 ( .A1(n82), .A2(n70), .B1(n80), .B2(n69), .ZN(N345)
         );
  OAI22D1BWP30P140LVT U146 ( .A1(n82), .A2(n72), .B1(n80), .B2(n71), .ZN(N324)
         );
  OAI22D1BWP30P140LVT U147 ( .A1(n82), .A2(n74), .B1(n80), .B2(n73), .ZN(N347)
         );
  OAI22D1BWP30P140LVT U148 ( .A1(n82), .A2(n76), .B1(n80), .B2(n75), .ZN(N327)
         );
  OAI22D1BWP30P140LVT U149 ( .A1(n82), .A2(n78), .B1(n80), .B2(n77), .ZN(N349)
         );
  OAI22D1BWP30P140LVT U150 ( .A1(n82), .A2(n81), .B1(n80), .B2(n79), .ZN(N320)
         );
endmodule


module distribute_2x2_simple_seq_DATA_WIDTH32_COMMAND_WIDTH2_5 ( clk, rst, 
        i_valid, i_data_bus, o_valid, o_data_bus, i_en, i_cmd );
  input [1:0] i_valid;
  input [63:0] i_data_bus;
  output [1:0] o_valid;
  output [63:0] o_data_bus;
  input [1:0] i_cmd;
  input clk, rst, i_en;
  wire   N287, N288, N289, N290, N291, N292, N293, N294, N295, N296, N297,
         N298, N299, N300, N301, N302, N303, N304, N305, N306, N307, N308,
         N309, N310, N311, N312, N313, N314, N315, N316, N317, N318, N319,
         N320, N321, N322, N323, N324, N325, N326, N327, N328, N329, N330,
         N331, N332, N333, N334, N335, N336, N337, N338, N339, N340, N341,
         N342, N343, N344, N345, N346, N347, N348, N349, N350, N353, N354, n1,
         n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30,
         n31, n32, n33, n34, n35, n36, n37, n38, n39, n40, n41, n42, n43, n44,
         n45;

  DFQD1BWP30P140LVT o_data_bus_inner_reg_63_ ( .D(N350), .CP(clk), .Q(
        o_data_bus[63]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_62_ ( .D(N349), .CP(clk), .Q(
        o_data_bus[62]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_61_ ( .D(N348), .CP(clk), .Q(
        o_data_bus[61]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_60_ ( .D(N347), .CP(clk), .Q(
        o_data_bus[60]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_59_ ( .D(N346), .CP(clk), .Q(
        o_data_bus[59]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_58_ ( .D(N345), .CP(clk), .Q(
        o_data_bus[58]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_57_ ( .D(N344), .CP(clk), .Q(
        o_data_bus[57]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_56_ ( .D(N343), .CP(clk), .Q(
        o_data_bus[56]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_55_ ( .D(N342), .CP(clk), .Q(
        o_data_bus[55]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_54_ ( .D(N341), .CP(clk), .Q(
        o_data_bus[54]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_53_ ( .D(N340), .CP(clk), .Q(
        o_data_bus[53]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_52_ ( .D(N339), .CP(clk), .Q(
        o_data_bus[52]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_51_ ( .D(N338), .CP(clk), .Q(
        o_data_bus[51]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_50_ ( .D(N337), .CP(clk), .Q(
        o_data_bus[50]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_49_ ( .D(N336), .CP(clk), .Q(
        o_data_bus[49]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_48_ ( .D(N335), .CP(clk), .Q(
        o_data_bus[48]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_47_ ( .D(N334), .CP(clk), .Q(
        o_data_bus[47]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_46_ ( .D(N333), .CP(clk), .Q(
        o_data_bus[46]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_45_ ( .D(N332), .CP(clk), .Q(
        o_data_bus[45]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_44_ ( .D(N331), .CP(clk), .Q(
        o_data_bus[44]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_43_ ( .D(N330), .CP(clk), .Q(
        o_data_bus[43]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_42_ ( .D(N329), .CP(clk), .Q(
        o_data_bus[42]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_41_ ( .D(N328), .CP(clk), .Q(
        o_data_bus[41]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_40_ ( .D(N327), .CP(clk), .Q(
        o_data_bus[40]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_39_ ( .D(N326), .CP(clk), .Q(
        o_data_bus[39]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_38_ ( .D(N325), .CP(clk), .Q(
        o_data_bus[38]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_37_ ( .D(N324), .CP(clk), .Q(
        o_data_bus[37]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_36_ ( .D(N323), .CP(clk), .Q(
        o_data_bus[36]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_35_ ( .D(N322), .CP(clk), .Q(
        o_data_bus[35]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_34_ ( .D(N321), .CP(clk), .Q(
        o_data_bus[34]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_33_ ( .D(N320), .CP(clk), .Q(
        o_data_bus[33]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_32_ ( .D(N319), .CP(clk), .Q(
        o_data_bus[32]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_31_ ( .D(N318), .CP(clk), .Q(
        o_data_bus[31]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_30_ ( .D(N317), .CP(clk), .Q(
        o_data_bus[30]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_29_ ( .D(N316), .CP(clk), .Q(
        o_data_bus[29]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_28_ ( .D(N315), .CP(clk), .Q(
        o_data_bus[28]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_27_ ( .D(N314), .CP(clk), .Q(
        o_data_bus[27]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_26_ ( .D(N313), .CP(clk), .Q(
        o_data_bus[26]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_25_ ( .D(N312), .CP(clk), .Q(
        o_data_bus[25]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_24_ ( .D(N311), .CP(clk), .Q(
        o_data_bus[24]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_23_ ( .D(N310), .CP(clk), .Q(
        o_data_bus[23]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_22_ ( .D(N309), .CP(clk), .Q(
        o_data_bus[22]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_21_ ( .D(N308), .CP(clk), .Q(
        o_data_bus[21]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_20_ ( .D(N307), .CP(clk), .Q(
        o_data_bus[20]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_19_ ( .D(N306), .CP(clk), .Q(
        o_data_bus[19]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_18_ ( .D(N305), .CP(clk), .Q(
        o_data_bus[18]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_17_ ( .D(N304), .CP(clk), .Q(
        o_data_bus[17]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_16_ ( .D(N303), .CP(clk), .Q(
        o_data_bus[16]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_15_ ( .D(N302), .CP(clk), .Q(
        o_data_bus[15]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_14_ ( .D(N301), .CP(clk), .Q(
        o_data_bus[14]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_13_ ( .D(N300), .CP(clk), .Q(
        o_data_bus[13]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_12_ ( .D(N299), .CP(clk), .Q(
        o_data_bus[12]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_11_ ( .D(N298), .CP(clk), .Q(
        o_data_bus[11]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_10_ ( .D(N297), .CP(clk), .Q(
        o_data_bus[10]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_9_ ( .D(N296), .CP(clk), .Q(
        o_data_bus[9]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_8_ ( .D(N295), .CP(clk), .Q(
        o_data_bus[8]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_7_ ( .D(N294), .CP(clk), .Q(
        o_data_bus[7]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_6_ ( .D(N293), .CP(clk), .Q(
        o_data_bus[6]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_5_ ( .D(N292), .CP(clk), .Q(
        o_data_bus[5]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_4_ ( .D(N291), .CP(clk), .Q(
        o_data_bus[4]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_3_ ( .D(N290), .CP(clk), .Q(
        o_data_bus[3]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_2_ ( .D(N289), .CP(clk), .Q(
        o_data_bus[2]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_1_ ( .D(N288), .CP(clk), .Q(
        o_data_bus[1]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_0_ ( .D(N287), .CP(clk), .Q(
        o_data_bus[0]) );
  DFQD1BWP30P140LVT o_valid_inner_reg_1_ ( .D(N354), .CP(clk), .Q(o_valid[1])
         );
  DFQD1BWP30P140LVT o_valid_inner_reg_0_ ( .D(N353), .CP(clk), .Q(o_valid[0])
         );
  ND2OPTIBD1BWP30P140LVT U3 ( .A1(n8), .A2(i_valid[0]), .ZN(n3) );
  INVD1BWP30P140LVT U4 ( .I(i_valid[1]), .ZN(n10) );
  BUFFD2BWP30P140LVT U5 ( .I(n6), .Z(n1) );
  OAI211D1BWP30P140LVT U6 ( .A1(i_cmd[1]), .A2(i_valid[0]), .B(i_cmd[0]), .C(
        n5), .ZN(n6) );
  INR2D1BWP30P140LVT U7 ( .A1(i_en), .B1(rst), .ZN(n8) );
  NR2OPTPAD1BWP30P140LVT U8 ( .A1(i_cmd[0]), .A2(n3), .ZN(n7) );
  AOI31D1BWP30P140LVT U9 ( .A1(i_cmd[0]), .A2(n8), .A3(i_valid[1]), .B(n7), 
        .ZN(n2) );
  INVD1BWP30P140LVT U10 ( .I(n2), .ZN(N353) );
  ND3D2BWP30P140LVT U11 ( .A1(n8), .A2(i_cmd[1]), .A3(i_valid[1]), .ZN(n44) );
  OAI21D1BWP30P140LVT U12 ( .A1(i_cmd[1]), .A2(n3), .B(n44), .ZN(N354) );
  INVD1BWP30P140LVT U13 ( .I(i_data_bus[32]), .ZN(n12) );
  INVD1BWP30P140LVT U14 ( .I(n8), .ZN(n4) );
  AOI21D1BWP30P140LVT U15 ( .A1(i_cmd[1]), .A2(n10), .B(n4), .ZN(n5) );
  MOAI22D1BWP30P140LVT U16 ( .A1(n12), .A2(n6), .B1(i_data_bus[0]), .B2(n7), 
        .ZN(N287) );
  INVD1BWP30P140LVT U17 ( .I(i_data_bus[33]), .ZN(n13) );
  MOAI22D1BWP30P140LVT U18 ( .A1(n1), .A2(n13), .B1(n7), .B2(i_data_bus[1]), 
        .ZN(N288) );
  INVD1BWP30P140LVT U19 ( .I(i_data_bus[34]), .ZN(n14) );
  MOAI22D1BWP30P140LVT U20 ( .A1(n1), .A2(n14), .B1(n7), .B2(i_data_bus[2]), 
        .ZN(N289) );
  INVD1BWP30P140LVT U21 ( .I(i_data_bus[35]), .ZN(n15) );
  MOAI22D1BWP30P140LVT U22 ( .A1(n1), .A2(n15), .B1(n7), .B2(i_data_bus[3]), 
        .ZN(N290) );
  INVD1BWP30P140LVT U23 ( .I(i_data_bus[36]), .ZN(n16) );
  MOAI22D1BWP30P140LVT U24 ( .A1(n1), .A2(n16), .B1(n7), .B2(i_data_bus[4]), 
        .ZN(N291) );
  INVD1BWP30P140LVT U25 ( .I(i_data_bus[37]), .ZN(n17) );
  MOAI22D1BWP30P140LVT U26 ( .A1(n1), .A2(n17), .B1(n7), .B2(i_data_bus[5]), 
        .ZN(N292) );
  INVD1BWP30P140LVT U27 ( .I(i_data_bus[38]), .ZN(n18) );
  MOAI22D1BWP30P140LVT U28 ( .A1(n1), .A2(n18), .B1(n7), .B2(i_data_bus[6]), 
        .ZN(N293) );
  INVD1BWP30P140LVT U29 ( .I(i_data_bus[39]), .ZN(n19) );
  MOAI22D1BWP30P140LVT U30 ( .A1(n1), .A2(n19), .B1(n7), .B2(i_data_bus[7]), 
        .ZN(N294) );
  INVD1BWP30P140LVT U31 ( .I(i_data_bus[40]), .ZN(n20) );
  MOAI22D1BWP30P140LVT U32 ( .A1(n1), .A2(n20), .B1(n7), .B2(i_data_bus[8]), 
        .ZN(N295) );
  INVD1BWP30P140LVT U33 ( .I(i_data_bus[41]), .ZN(n21) );
  MOAI22D1BWP30P140LVT U34 ( .A1(n1), .A2(n21), .B1(n7), .B2(i_data_bus[9]), 
        .ZN(N296) );
  INVD1BWP30P140LVT U35 ( .I(i_data_bus[42]), .ZN(n22) );
  MOAI22D1BWP30P140LVT U36 ( .A1(n1), .A2(n22), .B1(n7), .B2(i_data_bus[10]), 
        .ZN(N297) );
  INVD1BWP30P140LVT U37 ( .I(i_data_bus[43]), .ZN(n23) );
  MOAI22D1BWP30P140LVT U38 ( .A1(n1), .A2(n23), .B1(n7), .B2(i_data_bus[11]), 
        .ZN(N298) );
  INVD1BWP30P140LVT U39 ( .I(i_data_bus[44]), .ZN(n24) );
  MOAI22D1BWP30P140LVT U40 ( .A1(n1), .A2(n24), .B1(n7), .B2(i_data_bus[12]), 
        .ZN(N299) );
  INVD1BWP30P140LVT U41 ( .I(i_data_bus[45]), .ZN(n25) );
  MOAI22D1BWP30P140LVT U42 ( .A1(n1), .A2(n25), .B1(n7), .B2(i_data_bus[13]), 
        .ZN(N300) );
  INVD1BWP30P140LVT U43 ( .I(i_data_bus[46]), .ZN(n26) );
  MOAI22D1BWP30P140LVT U44 ( .A1(n1), .A2(n26), .B1(n7), .B2(i_data_bus[14]), 
        .ZN(N301) );
  INVD1BWP30P140LVT U45 ( .I(i_data_bus[47]), .ZN(n27) );
  MOAI22D1BWP30P140LVT U46 ( .A1(n1), .A2(n27), .B1(n7), .B2(i_data_bus[15]), 
        .ZN(N302) );
  INVD1BWP30P140LVT U47 ( .I(i_data_bus[48]), .ZN(n28) );
  MOAI22D1BWP30P140LVT U48 ( .A1(n1), .A2(n28), .B1(n7), .B2(i_data_bus[16]), 
        .ZN(N303) );
  INVD1BWP30P140LVT U49 ( .I(i_data_bus[49]), .ZN(n29) );
  MOAI22D1BWP30P140LVT U50 ( .A1(n1), .A2(n29), .B1(n7), .B2(i_data_bus[17]), 
        .ZN(N304) );
  INVD1BWP30P140LVT U51 ( .I(i_data_bus[50]), .ZN(n30) );
  MOAI22D1BWP30P140LVT U52 ( .A1(n1), .A2(n30), .B1(n7), .B2(i_data_bus[18]), 
        .ZN(N305) );
  INVD1BWP30P140LVT U53 ( .I(i_data_bus[51]), .ZN(n31) );
  MOAI22D1BWP30P140LVT U54 ( .A1(n1), .A2(n31), .B1(n7), .B2(i_data_bus[19]), 
        .ZN(N306) );
  INVD1BWP30P140LVT U55 ( .I(i_data_bus[52]), .ZN(n32) );
  MOAI22D1BWP30P140LVT U56 ( .A1(n1), .A2(n32), .B1(n7), .B2(i_data_bus[20]), 
        .ZN(N307) );
  INVD1BWP30P140LVT U57 ( .I(i_data_bus[53]), .ZN(n33) );
  MOAI22D1BWP30P140LVT U58 ( .A1(n1), .A2(n33), .B1(n7), .B2(i_data_bus[21]), 
        .ZN(N308) );
  INVD1BWP30P140LVT U59 ( .I(i_data_bus[54]), .ZN(n34) );
  MOAI22D1BWP30P140LVT U60 ( .A1(n1), .A2(n34), .B1(n7), .B2(i_data_bus[22]), 
        .ZN(N309) );
  INVD1BWP30P140LVT U61 ( .I(i_data_bus[55]), .ZN(n35) );
  MOAI22D1BWP30P140LVT U62 ( .A1(n1), .A2(n35), .B1(n7), .B2(i_data_bus[23]), 
        .ZN(N310) );
  INVD1BWP30P140LVT U63 ( .I(i_data_bus[56]), .ZN(n36) );
  MOAI22D1BWP30P140LVT U64 ( .A1(n1), .A2(n36), .B1(n7), .B2(i_data_bus[24]), 
        .ZN(N311) );
  INVD1BWP30P140LVT U65 ( .I(i_data_bus[57]), .ZN(n37) );
  MOAI22D1BWP30P140LVT U66 ( .A1(n1), .A2(n37), .B1(n7), .B2(i_data_bus[25]), 
        .ZN(N312) );
  INVD1BWP30P140LVT U67 ( .I(i_data_bus[58]), .ZN(n38) );
  MOAI22D1BWP30P140LVT U68 ( .A1(n1), .A2(n38), .B1(n7), .B2(i_data_bus[26]), 
        .ZN(N313) );
  INVD1BWP30P140LVT U69 ( .I(i_data_bus[59]), .ZN(n39) );
  MOAI22D1BWP30P140LVT U70 ( .A1(n1), .A2(n39), .B1(n7), .B2(i_data_bus[27]), 
        .ZN(N314) );
  INVD1BWP30P140LVT U71 ( .I(i_data_bus[60]), .ZN(n40) );
  MOAI22D1BWP30P140LVT U72 ( .A1(n1), .A2(n40), .B1(n7), .B2(i_data_bus[28]), 
        .ZN(N315) );
  INVD1BWP30P140LVT U73 ( .I(i_data_bus[61]), .ZN(n41) );
  MOAI22D1BWP30P140LVT U74 ( .A1(n1), .A2(n41), .B1(n7), .B2(i_data_bus[29]), 
        .ZN(N316) );
  INVD1BWP30P140LVT U75 ( .I(i_data_bus[62]), .ZN(n42) );
  MOAI22D1BWP30P140LVT U76 ( .A1(n1), .A2(n42), .B1(n7), .B2(i_data_bus[30]), 
        .ZN(N317) );
  INVD1BWP30P140LVT U77 ( .I(i_data_bus[63]), .ZN(n45) );
  MOAI22D1BWP30P140LVT U78 ( .A1(n1), .A2(n45), .B1(n7), .B2(i_data_bus[31]), 
        .ZN(N318) );
  OAI21D1BWP30P140LVT U79 ( .A1(i_cmd[0]), .A2(i_valid[0]), .B(n8), .ZN(n9) );
  AO211D1BWP30P140LVT U80 ( .A1(i_cmd[0]), .A2(n10), .B(i_cmd[1]), .C(n9), .Z(
        n11) );
  INVD2BWP30P140LVT U81 ( .I(n11), .ZN(n43) );
  MOAI22D1BWP30P140LVT U82 ( .A1(n12), .A2(n44), .B1(i_data_bus[0]), .B2(n43), 
        .ZN(N319) );
  MOAI22D1BWP30P140LVT U83 ( .A1(n13), .A2(n44), .B1(i_data_bus[1]), .B2(n43), 
        .ZN(N320) );
  MOAI22D1BWP30P140LVT U84 ( .A1(n14), .A2(n44), .B1(i_data_bus[2]), .B2(n43), 
        .ZN(N321) );
  MOAI22D1BWP30P140LVT U85 ( .A1(n15), .A2(n44), .B1(i_data_bus[3]), .B2(n43), 
        .ZN(N322) );
  MOAI22D1BWP30P140LVT U86 ( .A1(n16), .A2(n44), .B1(i_data_bus[4]), .B2(n43), 
        .ZN(N323) );
  MOAI22D1BWP30P140LVT U87 ( .A1(n17), .A2(n44), .B1(i_data_bus[5]), .B2(n43), 
        .ZN(N324) );
  MOAI22D1BWP30P140LVT U88 ( .A1(n18), .A2(n44), .B1(i_data_bus[6]), .B2(n43), 
        .ZN(N325) );
  MOAI22D1BWP30P140LVT U89 ( .A1(n19), .A2(n44), .B1(i_data_bus[7]), .B2(n43), 
        .ZN(N326) );
  MOAI22D1BWP30P140LVT U90 ( .A1(n20), .A2(n44), .B1(i_data_bus[8]), .B2(n43), 
        .ZN(N327) );
  MOAI22D1BWP30P140LVT U91 ( .A1(n21), .A2(n44), .B1(i_data_bus[9]), .B2(n43), 
        .ZN(N328) );
  MOAI22D1BWP30P140LVT U92 ( .A1(n22), .A2(n44), .B1(i_data_bus[10]), .B2(n43), 
        .ZN(N329) );
  MOAI22D1BWP30P140LVT U93 ( .A1(n23), .A2(n44), .B1(i_data_bus[11]), .B2(n43), 
        .ZN(N330) );
  MOAI22D1BWP30P140LVT U94 ( .A1(n24), .A2(n44), .B1(i_data_bus[12]), .B2(n43), 
        .ZN(N331) );
  MOAI22D1BWP30P140LVT U95 ( .A1(n25), .A2(n44), .B1(i_data_bus[13]), .B2(n43), 
        .ZN(N332) );
  MOAI22D1BWP30P140LVT U96 ( .A1(n26), .A2(n44), .B1(i_data_bus[14]), .B2(n43), 
        .ZN(N333) );
  MOAI22D1BWP30P140LVT U97 ( .A1(n27), .A2(n44), .B1(i_data_bus[15]), .B2(n43), 
        .ZN(N334) );
  MOAI22D1BWP30P140LVT U98 ( .A1(n28), .A2(n44), .B1(i_data_bus[16]), .B2(n43), 
        .ZN(N335) );
  MOAI22D1BWP30P140LVT U99 ( .A1(n29), .A2(n44), .B1(i_data_bus[17]), .B2(n43), 
        .ZN(N336) );
  MOAI22D1BWP30P140LVT U100 ( .A1(n30), .A2(n44), .B1(i_data_bus[18]), .B2(n43), .ZN(N337) );
  MOAI22D1BWP30P140LVT U101 ( .A1(n31), .A2(n44), .B1(i_data_bus[19]), .B2(n43), .ZN(N338) );
  MOAI22D1BWP30P140LVT U102 ( .A1(n32), .A2(n44), .B1(i_data_bus[20]), .B2(n43), .ZN(N339) );
  MOAI22D1BWP30P140LVT U103 ( .A1(n33), .A2(n44), .B1(i_data_bus[21]), .B2(n43), .ZN(N340) );
  MOAI22D1BWP30P140LVT U104 ( .A1(n34), .A2(n44), .B1(i_data_bus[22]), .B2(n43), .ZN(N341) );
  MOAI22D1BWP30P140LVT U105 ( .A1(n35), .A2(n44), .B1(i_data_bus[23]), .B2(n43), .ZN(N342) );
  MOAI22D1BWP30P140LVT U106 ( .A1(n36), .A2(n44), .B1(i_data_bus[24]), .B2(n43), .ZN(N343) );
  MOAI22D1BWP30P140LVT U107 ( .A1(n37), .A2(n44), .B1(i_data_bus[25]), .B2(n43), .ZN(N344) );
  MOAI22D1BWP30P140LVT U108 ( .A1(n38), .A2(n44), .B1(i_data_bus[26]), .B2(n43), .ZN(N345) );
  MOAI22D1BWP30P140LVT U109 ( .A1(n39), .A2(n44), .B1(i_data_bus[27]), .B2(n43), .ZN(N346) );
  MOAI22D1BWP30P140LVT U110 ( .A1(n40), .A2(n44), .B1(i_data_bus[28]), .B2(n43), .ZN(N347) );
  MOAI22D1BWP30P140LVT U111 ( .A1(n41), .A2(n44), .B1(i_data_bus[29]), .B2(n43), .ZN(N348) );
  MOAI22D1BWP30P140LVT U112 ( .A1(n42), .A2(n44), .B1(i_data_bus[30]), .B2(n43), .ZN(N349) );
  MOAI22D1BWP30P140LVT U113 ( .A1(n45), .A2(n44), .B1(i_data_bus[31]), .B2(n43), .ZN(N350) );
endmodule


module distribute_2x2_simple_seq_DATA_WIDTH32_COMMAND_WIDTH2_6 ( clk, rst, 
        i_valid, i_data_bus, o_valid, o_data_bus, i_en, i_cmd );
  input [1:0] i_valid;
  input [63:0] i_data_bus;
  output [1:0] o_valid;
  output [63:0] o_data_bus;
  input [1:0] i_cmd;
  input clk, rst, i_en;
  wire   N287, N288, N289, N290, N291, N292, N293, N294, N295, N296, N297,
         N298, N299, N300, N301, N302, N303, N304, N305, N306, N307, N308,
         N309, N310, N311, N312, N313, N314, N315, N316, N317, N318, N319,
         N320, N321, N322, N323, N324, N325, N326, N327, N328, N329, N330,
         N331, N332, N333, N334, N335, N336, N337, N338, N339, N340, N341,
         N342, N343, N344, N345, N346, N347, N348, N349, N350, N353, N354, n1,
         n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30,
         n31, n32, n33, n34, n35, n36, n37, n38, n39, n40, n41, n42, n43, n44,
         n45;

  DFQD1BWP30P140LVT o_data_bus_inner_reg_63_ ( .D(N350), .CP(clk), .Q(
        o_data_bus[63]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_62_ ( .D(N349), .CP(clk), .Q(
        o_data_bus[62]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_61_ ( .D(N348), .CP(clk), .Q(
        o_data_bus[61]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_60_ ( .D(N347), .CP(clk), .Q(
        o_data_bus[60]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_59_ ( .D(N346), .CP(clk), .Q(
        o_data_bus[59]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_58_ ( .D(N345), .CP(clk), .Q(
        o_data_bus[58]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_57_ ( .D(N344), .CP(clk), .Q(
        o_data_bus[57]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_56_ ( .D(N343), .CP(clk), .Q(
        o_data_bus[56]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_55_ ( .D(N342), .CP(clk), .Q(
        o_data_bus[55]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_54_ ( .D(N341), .CP(clk), .Q(
        o_data_bus[54]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_53_ ( .D(N340), .CP(clk), .Q(
        o_data_bus[53]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_52_ ( .D(N339), .CP(clk), .Q(
        o_data_bus[52]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_51_ ( .D(N338), .CP(clk), .Q(
        o_data_bus[51]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_50_ ( .D(N337), .CP(clk), .Q(
        o_data_bus[50]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_49_ ( .D(N336), .CP(clk), .Q(
        o_data_bus[49]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_48_ ( .D(N335), .CP(clk), .Q(
        o_data_bus[48]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_47_ ( .D(N334), .CP(clk), .Q(
        o_data_bus[47]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_46_ ( .D(N333), .CP(clk), .Q(
        o_data_bus[46]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_45_ ( .D(N332), .CP(clk), .Q(
        o_data_bus[45]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_44_ ( .D(N331), .CP(clk), .Q(
        o_data_bus[44]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_43_ ( .D(N330), .CP(clk), .Q(
        o_data_bus[43]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_42_ ( .D(N329), .CP(clk), .Q(
        o_data_bus[42]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_41_ ( .D(N328), .CP(clk), .Q(
        o_data_bus[41]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_40_ ( .D(N327), .CP(clk), .Q(
        o_data_bus[40]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_39_ ( .D(N326), .CP(clk), .Q(
        o_data_bus[39]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_38_ ( .D(N325), .CP(clk), .Q(
        o_data_bus[38]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_37_ ( .D(N324), .CP(clk), .Q(
        o_data_bus[37]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_36_ ( .D(N323), .CP(clk), .Q(
        o_data_bus[36]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_35_ ( .D(N322), .CP(clk), .Q(
        o_data_bus[35]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_34_ ( .D(N321), .CP(clk), .Q(
        o_data_bus[34]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_33_ ( .D(N320), .CP(clk), .Q(
        o_data_bus[33]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_32_ ( .D(N319), .CP(clk), .Q(
        o_data_bus[32]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_31_ ( .D(N318), .CP(clk), .Q(
        o_data_bus[31]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_30_ ( .D(N317), .CP(clk), .Q(
        o_data_bus[30]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_29_ ( .D(N316), .CP(clk), .Q(
        o_data_bus[29]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_28_ ( .D(N315), .CP(clk), .Q(
        o_data_bus[28]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_27_ ( .D(N314), .CP(clk), .Q(
        o_data_bus[27]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_26_ ( .D(N313), .CP(clk), .Q(
        o_data_bus[26]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_25_ ( .D(N312), .CP(clk), .Q(
        o_data_bus[25]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_24_ ( .D(N311), .CP(clk), .Q(
        o_data_bus[24]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_23_ ( .D(N310), .CP(clk), .Q(
        o_data_bus[23]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_22_ ( .D(N309), .CP(clk), .Q(
        o_data_bus[22]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_21_ ( .D(N308), .CP(clk), .Q(
        o_data_bus[21]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_20_ ( .D(N307), .CP(clk), .Q(
        o_data_bus[20]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_19_ ( .D(N306), .CP(clk), .Q(
        o_data_bus[19]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_18_ ( .D(N305), .CP(clk), .Q(
        o_data_bus[18]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_17_ ( .D(N304), .CP(clk), .Q(
        o_data_bus[17]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_16_ ( .D(N303), .CP(clk), .Q(
        o_data_bus[16]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_15_ ( .D(N302), .CP(clk), .Q(
        o_data_bus[15]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_14_ ( .D(N301), .CP(clk), .Q(
        o_data_bus[14]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_13_ ( .D(N300), .CP(clk), .Q(
        o_data_bus[13]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_12_ ( .D(N299), .CP(clk), .Q(
        o_data_bus[12]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_11_ ( .D(N298), .CP(clk), .Q(
        o_data_bus[11]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_10_ ( .D(N297), .CP(clk), .Q(
        o_data_bus[10]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_9_ ( .D(N296), .CP(clk), .Q(
        o_data_bus[9]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_8_ ( .D(N295), .CP(clk), .Q(
        o_data_bus[8]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_7_ ( .D(N294), .CP(clk), .Q(
        o_data_bus[7]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_6_ ( .D(N293), .CP(clk), .Q(
        o_data_bus[6]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_5_ ( .D(N292), .CP(clk), .Q(
        o_data_bus[5]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_4_ ( .D(N291), .CP(clk), .Q(
        o_data_bus[4]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_3_ ( .D(N290), .CP(clk), .Q(
        o_data_bus[3]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_2_ ( .D(N289), .CP(clk), .Q(
        o_data_bus[2]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_1_ ( .D(N288), .CP(clk), .Q(
        o_data_bus[1]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_0_ ( .D(N287), .CP(clk), .Q(
        o_data_bus[0]) );
  DFQD1BWP30P140LVT o_valid_inner_reg_1_ ( .D(N354), .CP(clk), .Q(o_valid[1])
         );
  DFQD1BWP30P140LVT o_valid_inner_reg_0_ ( .D(N353), .CP(clk), .Q(o_valid[0])
         );
  ND2OPTIBD1BWP30P140LVT U3 ( .A1(n8), .A2(i_valid[0]), .ZN(n3) );
  INVD1BWP30P140LVT U4 ( .I(i_valid[1]), .ZN(n10) );
  BUFFD2BWP30P140LVT U5 ( .I(n6), .Z(n1) );
  OAI211D1BWP30P140LVT U6 ( .A1(i_cmd[1]), .A2(i_valid[0]), .B(i_cmd[0]), .C(
        n5), .ZN(n6) );
  INR2D1BWP30P140LVT U7 ( .A1(i_en), .B1(rst), .ZN(n8) );
  NR2OPTPAD1BWP30P140LVT U8 ( .A1(i_cmd[0]), .A2(n3), .ZN(n7) );
  AOI31D1BWP30P140LVT U9 ( .A1(i_cmd[0]), .A2(n8), .A3(i_valid[1]), .B(n7), 
        .ZN(n2) );
  INVD1BWP30P140LVT U10 ( .I(n2), .ZN(N353) );
  ND3D2BWP30P140LVT U11 ( .A1(n8), .A2(i_cmd[1]), .A3(i_valid[1]), .ZN(n44) );
  OAI21D1BWP30P140LVT U12 ( .A1(i_cmd[1]), .A2(n3), .B(n44), .ZN(N354) );
  INVD1BWP30P140LVT U13 ( .I(i_data_bus[32]), .ZN(n12) );
  INVD1BWP30P140LVT U14 ( .I(n8), .ZN(n4) );
  AOI21D1BWP30P140LVT U15 ( .A1(i_cmd[1]), .A2(n10), .B(n4), .ZN(n5) );
  MOAI22D1BWP30P140LVT U16 ( .A1(n12), .A2(n6), .B1(i_data_bus[0]), .B2(n7), 
        .ZN(N287) );
  INVD1BWP30P140LVT U17 ( .I(i_data_bus[33]), .ZN(n13) );
  MOAI22D1BWP30P140LVT U18 ( .A1(n1), .A2(n13), .B1(n7), .B2(i_data_bus[1]), 
        .ZN(N288) );
  INVD1BWP30P140LVT U19 ( .I(i_data_bus[34]), .ZN(n14) );
  MOAI22D1BWP30P140LVT U20 ( .A1(n1), .A2(n14), .B1(n7), .B2(i_data_bus[2]), 
        .ZN(N289) );
  INVD1BWP30P140LVT U21 ( .I(i_data_bus[35]), .ZN(n15) );
  MOAI22D1BWP30P140LVT U22 ( .A1(n1), .A2(n15), .B1(n7), .B2(i_data_bus[3]), 
        .ZN(N290) );
  INVD1BWP30P140LVT U23 ( .I(i_data_bus[36]), .ZN(n16) );
  MOAI22D1BWP30P140LVT U24 ( .A1(n1), .A2(n16), .B1(n7), .B2(i_data_bus[4]), 
        .ZN(N291) );
  INVD1BWP30P140LVT U25 ( .I(i_data_bus[37]), .ZN(n17) );
  MOAI22D1BWP30P140LVT U26 ( .A1(n1), .A2(n17), .B1(n7), .B2(i_data_bus[5]), 
        .ZN(N292) );
  INVD1BWP30P140LVT U27 ( .I(i_data_bus[38]), .ZN(n18) );
  MOAI22D1BWP30P140LVT U28 ( .A1(n1), .A2(n18), .B1(n7), .B2(i_data_bus[6]), 
        .ZN(N293) );
  INVD1BWP30P140LVT U29 ( .I(i_data_bus[39]), .ZN(n19) );
  MOAI22D1BWP30P140LVT U30 ( .A1(n1), .A2(n19), .B1(n7), .B2(i_data_bus[7]), 
        .ZN(N294) );
  INVD1BWP30P140LVT U31 ( .I(i_data_bus[40]), .ZN(n20) );
  MOAI22D1BWP30P140LVT U32 ( .A1(n1), .A2(n20), .B1(n7), .B2(i_data_bus[8]), 
        .ZN(N295) );
  INVD1BWP30P140LVT U33 ( .I(i_data_bus[41]), .ZN(n21) );
  MOAI22D1BWP30P140LVT U34 ( .A1(n1), .A2(n21), .B1(n7), .B2(i_data_bus[9]), 
        .ZN(N296) );
  INVD1BWP30P140LVT U35 ( .I(i_data_bus[42]), .ZN(n22) );
  MOAI22D1BWP30P140LVT U36 ( .A1(n1), .A2(n22), .B1(n7), .B2(i_data_bus[10]), 
        .ZN(N297) );
  INVD1BWP30P140LVT U37 ( .I(i_data_bus[43]), .ZN(n23) );
  MOAI22D1BWP30P140LVT U38 ( .A1(n1), .A2(n23), .B1(n7), .B2(i_data_bus[11]), 
        .ZN(N298) );
  INVD1BWP30P140LVT U39 ( .I(i_data_bus[44]), .ZN(n24) );
  MOAI22D1BWP30P140LVT U40 ( .A1(n1), .A2(n24), .B1(n7), .B2(i_data_bus[12]), 
        .ZN(N299) );
  INVD1BWP30P140LVT U41 ( .I(i_data_bus[45]), .ZN(n25) );
  MOAI22D1BWP30P140LVT U42 ( .A1(n1), .A2(n25), .B1(n7), .B2(i_data_bus[13]), 
        .ZN(N300) );
  INVD1BWP30P140LVT U43 ( .I(i_data_bus[46]), .ZN(n26) );
  MOAI22D1BWP30P140LVT U44 ( .A1(n1), .A2(n26), .B1(n7), .B2(i_data_bus[14]), 
        .ZN(N301) );
  INVD1BWP30P140LVT U45 ( .I(i_data_bus[47]), .ZN(n27) );
  MOAI22D1BWP30P140LVT U46 ( .A1(n1), .A2(n27), .B1(n7), .B2(i_data_bus[15]), 
        .ZN(N302) );
  INVD1BWP30P140LVT U47 ( .I(i_data_bus[48]), .ZN(n28) );
  MOAI22D1BWP30P140LVT U48 ( .A1(n1), .A2(n28), .B1(n7), .B2(i_data_bus[16]), 
        .ZN(N303) );
  INVD1BWP30P140LVT U49 ( .I(i_data_bus[49]), .ZN(n29) );
  MOAI22D1BWP30P140LVT U50 ( .A1(n1), .A2(n29), .B1(n7), .B2(i_data_bus[17]), 
        .ZN(N304) );
  INVD1BWP30P140LVT U51 ( .I(i_data_bus[50]), .ZN(n30) );
  MOAI22D1BWP30P140LVT U52 ( .A1(n1), .A2(n30), .B1(n7), .B2(i_data_bus[18]), 
        .ZN(N305) );
  INVD1BWP30P140LVT U53 ( .I(i_data_bus[51]), .ZN(n31) );
  MOAI22D1BWP30P140LVT U54 ( .A1(n1), .A2(n31), .B1(n7), .B2(i_data_bus[19]), 
        .ZN(N306) );
  INVD1BWP30P140LVT U55 ( .I(i_data_bus[52]), .ZN(n32) );
  MOAI22D1BWP30P140LVT U56 ( .A1(n1), .A2(n32), .B1(n7), .B2(i_data_bus[20]), 
        .ZN(N307) );
  INVD1BWP30P140LVT U57 ( .I(i_data_bus[53]), .ZN(n33) );
  MOAI22D1BWP30P140LVT U58 ( .A1(n1), .A2(n33), .B1(n7), .B2(i_data_bus[21]), 
        .ZN(N308) );
  INVD1BWP30P140LVT U59 ( .I(i_data_bus[54]), .ZN(n34) );
  MOAI22D1BWP30P140LVT U60 ( .A1(n1), .A2(n34), .B1(n7), .B2(i_data_bus[22]), 
        .ZN(N309) );
  INVD1BWP30P140LVT U61 ( .I(i_data_bus[55]), .ZN(n35) );
  MOAI22D1BWP30P140LVT U62 ( .A1(n1), .A2(n35), .B1(n7), .B2(i_data_bus[23]), 
        .ZN(N310) );
  INVD1BWP30P140LVT U63 ( .I(i_data_bus[56]), .ZN(n36) );
  MOAI22D1BWP30P140LVT U64 ( .A1(n1), .A2(n36), .B1(n7), .B2(i_data_bus[24]), 
        .ZN(N311) );
  INVD1BWP30P140LVT U65 ( .I(i_data_bus[57]), .ZN(n37) );
  MOAI22D1BWP30P140LVT U66 ( .A1(n1), .A2(n37), .B1(n7), .B2(i_data_bus[25]), 
        .ZN(N312) );
  INVD1BWP30P140LVT U67 ( .I(i_data_bus[58]), .ZN(n38) );
  MOAI22D1BWP30P140LVT U68 ( .A1(n1), .A2(n38), .B1(n7), .B2(i_data_bus[26]), 
        .ZN(N313) );
  INVD1BWP30P140LVT U69 ( .I(i_data_bus[59]), .ZN(n39) );
  MOAI22D1BWP30P140LVT U70 ( .A1(n1), .A2(n39), .B1(n7), .B2(i_data_bus[27]), 
        .ZN(N314) );
  INVD1BWP30P140LVT U71 ( .I(i_data_bus[60]), .ZN(n40) );
  MOAI22D1BWP30P140LVT U72 ( .A1(n1), .A2(n40), .B1(n7), .B2(i_data_bus[28]), 
        .ZN(N315) );
  INVD1BWP30P140LVT U73 ( .I(i_data_bus[61]), .ZN(n41) );
  MOAI22D1BWP30P140LVT U74 ( .A1(n1), .A2(n41), .B1(n7), .B2(i_data_bus[29]), 
        .ZN(N316) );
  INVD1BWP30P140LVT U75 ( .I(i_data_bus[62]), .ZN(n42) );
  MOAI22D1BWP30P140LVT U76 ( .A1(n1), .A2(n42), .B1(n7), .B2(i_data_bus[30]), 
        .ZN(N317) );
  INVD1BWP30P140LVT U77 ( .I(i_data_bus[63]), .ZN(n45) );
  MOAI22D1BWP30P140LVT U78 ( .A1(n1), .A2(n45), .B1(n7), .B2(i_data_bus[31]), 
        .ZN(N318) );
  OAI21D1BWP30P140LVT U79 ( .A1(i_cmd[0]), .A2(i_valid[0]), .B(n8), .ZN(n9) );
  AO211D1BWP30P140LVT U80 ( .A1(i_cmd[0]), .A2(n10), .B(i_cmd[1]), .C(n9), .Z(
        n11) );
  INVD2BWP30P140LVT U81 ( .I(n11), .ZN(n43) );
  MOAI22D1BWP30P140LVT U82 ( .A1(n12), .A2(n44), .B1(i_data_bus[0]), .B2(n43), 
        .ZN(N319) );
  MOAI22D1BWP30P140LVT U83 ( .A1(n13), .A2(n44), .B1(i_data_bus[1]), .B2(n43), 
        .ZN(N320) );
  MOAI22D1BWP30P140LVT U84 ( .A1(n14), .A2(n44), .B1(i_data_bus[2]), .B2(n43), 
        .ZN(N321) );
  MOAI22D1BWP30P140LVT U85 ( .A1(n15), .A2(n44), .B1(i_data_bus[3]), .B2(n43), 
        .ZN(N322) );
  MOAI22D1BWP30P140LVT U86 ( .A1(n16), .A2(n44), .B1(i_data_bus[4]), .B2(n43), 
        .ZN(N323) );
  MOAI22D1BWP30P140LVT U87 ( .A1(n17), .A2(n44), .B1(i_data_bus[5]), .B2(n43), 
        .ZN(N324) );
  MOAI22D1BWP30P140LVT U88 ( .A1(n18), .A2(n44), .B1(i_data_bus[6]), .B2(n43), 
        .ZN(N325) );
  MOAI22D1BWP30P140LVT U89 ( .A1(n19), .A2(n44), .B1(i_data_bus[7]), .B2(n43), 
        .ZN(N326) );
  MOAI22D1BWP30P140LVT U90 ( .A1(n20), .A2(n44), .B1(i_data_bus[8]), .B2(n43), 
        .ZN(N327) );
  MOAI22D1BWP30P140LVT U91 ( .A1(n21), .A2(n44), .B1(i_data_bus[9]), .B2(n43), 
        .ZN(N328) );
  MOAI22D1BWP30P140LVT U92 ( .A1(n22), .A2(n44), .B1(i_data_bus[10]), .B2(n43), 
        .ZN(N329) );
  MOAI22D1BWP30P140LVT U93 ( .A1(n23), .A2(n44), .B1(i_data_bus[11]), .B2(n43), 
        .ZN(N330) );
  MOAI22D1BWP30P140LVT U94 ( .A1(n24), .A2(n44), .B1(i_data_bus[12]), .B2(n43), 
        .ZN(N331) );
  MOAI22D1BWP30P140LVT U95 ( .A1(n25), .A2(n44), .B1(i_data_bus[13]), .B2(n43), 
        .ZN(N332) );
  MOAI22D1BWP30P140LVT U96 ( .A1(n26), .A2(n44), .B1(i_data_bus[14]), .B2(n43), 
        .ZN(N333) );
  MOAI22D1BWP30P140LVT U97 ( .A1(n27), .A2(n44), .B1(i_data_bus[15]), .B2(n43), 
        .ZN(N334) );
  MOAI22D1BWP30P140LVT U98 ( .A1(n28), .A2(n44), .B1(i_data_bus[16]), .B2(n43), 
        .ZN(N335) );
  MOAI22D1BWP30P140LVT U99 ( .A1(n29), .A2(n44), .B1(i_data_bus[17]), .B2(n43), 
        .ZN(N336) );
  MOAI22D1BWP30P140LVT U100 ( .A1(n30), .A2(n44), .B1(i_data_bus[18]), .B2(n43), .ZN(N337) );
  MOAI22D1BWP30P140LVT U101 ( .A1(n31), .A2(n44), .B1(i_data_bus[19]), .B2(n43), .ZN(N338) );
  MOAI22D1BWP30P140LVT U102 ( .A1(n32), .A2(n44), .B1(i_data_bus[20]), .B2(n43), .ZN(N339) );
  MOAI22D1BWP30P140LVT U103 ( .A1(n33), .A2(n44), .B1(i_data_bus[21]), .B2(n43), .ZN(N340) );
  MOAI22D1BWP30P140LVT U104 ( .A1(n34), .A2(n44), .B1(i_data_bus[22]), .B2(n43), .ZN(N341) );
  MOAI22D1BWP30P140LVT U105 ( .A1(n35), .A2(n44), .B1(i_data_bus[23]), .B2(n43), .ZN(N342) );
  MOAI22D1BWP30P140LVT U106 ( .A1(n36), .A2(n44), .B1(i_data_bus[24]), .B2(n43), .ZN(N343) );
  MOAI22D1BWP30P140LVT U107 ( .A1(n37), .A2(n44), .B1(i_data_bus[25]), .B2(n43), .ZN(N344) );
  MOAI22D1BWP30P140LVT U108 ( .A1(n38), .A2(n44), .B1(i_data_bus[26]), .B2(n43), .ZN(N345) );
  MOAI22D1BWP30P140LVT U109 ( .A1(n39), .A2(n44), .B1(i_data_bus[27]), .B2(n43), .ZN(N346) );
  MOAI22D1BWP30P140LVT U110 ( .A1(n40), .A2(n44), .B1(i_data_bus[28]), .B2(n43), .ZN(N347) );
  MOAI22D1BWP30P140LVT U111 ( .A1(n41), .A2(n44), .B1(i_data_bus[29]), .B2(n43), .ZN(N348) );
  MOAI22D1BWP30P140LVT U112 ( .A1(n42), .A2(n44), .B1(i_data_bus[30]), .B2(n43), .ZN(N349) );
  MOAI22D1BWP30P140LVT U113 ( .A1(n45), .A2(n44), .B1(i_data_bus[31]), .B2(n43), .ZN(N350) );
endmodule


module distribute_2x2_simple_seq_DATA_WIDTH32_COMMAND_WIDTH2_7 ( clk, rst, 
        i_valid, i_data_bus, o_valid, o_data_bus, i_en, i_cmd );
  input [1:0] i_valid;
  input [63:0] i_data_bus;
  output [1:0] o_valid;
  output [63:0] o_data_bus;
  input [1:0] i_cmd;
  input clk, rst, i_en;
  wire   N287, N288, N289, N290, N291, N292, N293, N294, N295, N296, N297,
         N298, N299, N300, N301, N302, N303, N304, N305, N306, N307, N308,
         N309, N310, N311, N312, N313, N314, N315, N316, N317, N318, N319,
         N320, N321, N322, N323, N324, N325, N326, N327, N328, N329, N330,
         N331, N332, N333, N334, N335, N336, N337, N338, N339, N340, N341,
         N342, N343, N344, N345, N346, N347, N348, N349, N350, N353, N354, n1,
         n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30,
         n31, n32, n33, n34, n35, n36, n37, n38, n39, n40, n41, n42, n43, n44,
         n45;

  DFQD1BWP30P140LVT o_data_bus_inner_reg_63_ ( .D(N350), .CP(clk), .Q(
        o_data_bus[63]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_62_ ( .D(N349), .CP(clk), .Q(
        o_data_bus[62]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_61_ ( .D(N348), .CP(clk), .Q(
        o_data_bus[61]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_60_ ( .D(N347), .CP(clk), .Q(
        o_data_bus[60]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_59_ ( .D(N346), .CP(clk), .Q(
        o_data_bus[59]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_58_ ( .D(N345), .CP(clk), .Q(
        o_data_bus[58]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_57_ ( .D(N344), .CP(clk), .Q(
        o_data_bus[57]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_56_ ( .D(N343), .CP(clk), .Q(
        o_data_bus[56]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_55_ ( .D(N342), .CP(clk), .Q(
        o_data_bus[55]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_54_ ( .D(N341), .CP(clk), .Q(
        o_data_bus[54]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_53_ ( .D(N340), .CP(clk), .Q(
        o_data_bus[53]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_52_ ( .D(N339), .CP(clk), .Q(
        o_data_bus[52]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_51_ ( .D(N338), .CP(clk), .Q(
        o_data_bus[51]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_50_ ( .D(N337), .CP(clk), .Q(
        o_data_bus[50]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_49_ ( .D(N336), .CP(clk), .Q(
        o_data_bus[49]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_48_ ( .D(N335), .CP(clk), .Q(
        o_data_bus[48]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_47_ ( .D(N334), .CP(clk), .Q(
        o_data_bus[47]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_46_ ( .D(N333), .CP(clk), .Q(
        o_data_bus[46]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_45_ ( .D(N332), .CP(clk), .Q(
        o_data_bus[45]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_44_ ( .D(N331), .CP(clk), .Q(
        o_data_bus[44]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_43_ ( .D(N330), .CP(clk), .Q(
        o_data_bus[43]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_42_ ( .D(N329), .CP(clk), .Q(
        o_data_bus[42]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_41_ ( .D(N328), .CP(clk), .Q(
        o_data_bus[41]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_40_ ( .D(N327), .CP(clk), .Q(
        o_data_bus[40]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_39_ ( .D(N326), .CP(clk), .Q(
        o_data_bus[39]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_38_ ( .D(N325), .CP(clk), .Q(
        o_data_bus[38]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_37_ ( .D(N324), .CP(clk), .Q(
        o_data_bus[37]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_36_ ( .D(N323), .CP(clk), .Q(
        o_data_bus[36]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_35_ ( .D(N322), .CP(clk), .Q(
        o_data_bus[35]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_34_ ( .D(N321), .CP(clk), .Q(
        o_data_bus[34]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_33_ ( .D(N320), .CP(clk), .Q(
        o_data_bus[33]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_32_ ( .D(N319), .CP(clk), .Q(
        o_data_bus[32]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_31_ ( .D(N318), .CP(clk), .Q(
        o_data_bus[31]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_30_ ( .D(N317), .CP(clk), .Q(
        o_data_bus[30]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_29_ ( .D(N316), .CP(clk), .Q(
        o_data_bus[29]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_28_ ( .D(N315), .CP(clk), .Q(
        o_data_bus[28]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_27_ ( .D(N314), .CP(clk), .Q(
        o_data_bus[27]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_26_ ( .D(N313), .CP(clk), .Q(
        o_data_bus[26]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_25_ ( .D(N312), .CP(clk), .Q(
        o_data_bus[25]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_24_ ( .D(N311), .CP(clk), .Q(
        o_data_bus[24]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_23_ ( .D(N310), .CP(clk), .Q(
        o_data_bus[23]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_22_ ( .D(N309), .CP(clk), .Q(
        o_data_bus[22]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_21_ ( .D(N308), .CP(clk), .Q(
        o_data_bus[21]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_20_ ( .D(N307), .CP(clk), .Q(
        o_data_bus[20]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_19_ ( .D(N306), .CP(clk), .Q(
        o_data_bus[19]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_18_ ( .D(N305), .CP(clk), .Q(
        o_data_bus[18]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_17_ ( .D(N304), .CP(clk), .Q(
        o_data_bus[17]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_16_ ( .D(N303), .CP(clk), .Q(
        o_data_bus[16]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_15_ ( .D(N302), .CP(clk), .Q(
        o_data_bus[15]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_14_ ( .D(N301), .CP(clk), .Q(
        o_data_bus[14]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_13_ ( .D(N300), .CP(clk), .Q(
        o_data_bus[13]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_12_ ( .D(N299), .CP(clk), .Q(
        o_data_bus[12]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_11_ ( .D(N298), .CP(clk), .Q(
        o_data_bus[11]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_10_ ( .D(N297), .CP(clk), .Q(
        o_data_bus[10]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_9_ ( .D(N296), .CP(clk), .Q(
        o_data_bus[9]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_8_ ( .D(N295), .CP(clk), .Q(
        o_data_bus[8]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_7_ ( .D(N294), .CP(clk), .Q(
        o_data_bus[7]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_6_ ( .D(N293), .CP(clk), .Q(
        o_data_bus[6]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_5_ ( .D(N292), .CP(clk), .Q(
        o_data_bus[5]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_4_ ( .D(N291), .CP(clk), .Q(
        o_data_bus[4]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_3_ ( .D(N290), .CP(clk), .Q(
        o_data_bus[3]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_2_ ( .D(N289), .CP(clk), .Q(
        o_data_bus[2]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_1_ ( .D(N288), .CP(clk), .Q(
        o_data_bus[1]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_0_ ( .D(N287), .CP(clk), .Q(
        o_data_bus[0]) );
  DFQD1BWP30P140LVT o_valid_inner_reg_1_ ( .D(N354), .CP(clk), .Q(o_valid[1])
         );
  DFQD1BWP30P140LVT o_valid_inner_reg_0_ ( .D(N353), .CP(clk), .Q(o_valid[0])
         );
  ND2OPTIBD1BWP30P140LVT U3 ( .A1(n8), .A2(i_valid[0]), .ZN(n3) );
  INVD1BWP30P140LVT U4 ( .I(i_valid[1]), .ZN(n10) );
  BUFFD2BWP30P140LVT U5 ( .I(n6), .Z(n1) );
  OAI211D1BWP30P140LVT U6 ( .A1(i_cmd[1]), .A2(i_valid[0]), .B(i_cmd[0]), .C(
        n5), .ZN(n6) );
  INR2D1BWP30P140LVT U7 ( .A1(i_en), .B1(rst), .ZN(n8) );
  NR2OPTPAD1BWP30P140LVT U8 ( .A1(i_cmd[0]), .A2(n3), .ZN(n7) );
  AOI31D1BWP30P140LVT U9 ( .A1(i_cmd[0]), .A2(n8), .A3(i_valid[1]), .B(n7), 
        .ZN(n2) );
  INVD1BWP30P140LVT U10 ( .I(n2), .ZN(N353) );
  ND3D2BWP30P140LVT U11 ( .A1(n8), .A2(i_cmd[1]), .A3(i_valid[1]), .ZN(n44) );
  OAI21D1BWP30P140LVT U12 ( .A1(i_cmd[1]), .A2(n3), .B(n44), .ZN(N354) );
  INVD1BWP30P140LVT U13 ( .I(i_data_bus[32]), .ZN(n12) );
  INVD1BWP30P140LVT U14 ( .I(n8), .ZN(n4) );
  AOI21D1BWP30P140LVT U15 ( .A1(i_cmd[1]), .A2(n10), .B(n4), .ZN(n5) );
  MOAI22D1BWP30P140LVT U16 ( .A1(n12), .A2(n6), .B1(i_data_bus[0]), .B2(n7), 
        .ZN(N287) );
  INVD1BWP30P140LVT U17 ( .I(i_data_bus[33]), .ZN(n13) );
  MOAI22D1BWP30P140LVT U18 ( .A1(n1), .A2(n13), .B1(n7), .B2(i_data_bus[1]), 
        .ZN(N288) );
  INVD1BWP30P140LVT U19 ( .I(i_data_bus[34]), .ZN(n14) );
  MOAI22D1BWP30P140LVT U20 ( .A1(n1), .A2(n14), .B1(n7), .B2(i_data_bus[2]), 
        .ZN(N289) );
  INVD1BWP30P140LVT U21 ( .I(i_data_bus[35]), .ZN(n15) );
  MOAI22D1BWP30P140LVT U22 ( .A1(n1), .A2(n15), .B1(n7), .B2(i_data_bus[3]), 
        .ZN(N290) );
  INVD1BWP30P140LVT U23 ( .I(i_data_bus[36]), .ZN(n16) );
  MOAI22D1BWP30P140LVT U24 ( .A1(n1), .A2(n16), .B1(n7), .B2(i_data_bus[4]), 
        .ZN(N291) );
  INVD1BWP30P140LVT U25 ( .I(i_data_bus[37]), .ZN(n17) );
  MOAI22D1BWP30P140LVT U26 ( .A1(n1), .A2(n17), .B1(n7), .B2(i_data_bus[5]), 
        .ZN(N292) );
  INVD1BWP30P140LVT U27 ( .I(i_data_bus[38]), .ZN(n18) );
  MOAI22D1BWP30P140LVT U28 ( .A1(n1), .A2(n18), .B1(n7), .B2(i_data_bus[6]), 
        .ZN(N293) );
  INVD1BWP30P140LVT U29 ( .I(i_data_bus[39]), .ZN(n19) );
  MOAI22D1BWP30P140LVT U30 ( .A1(n1), .A2(n19), .B1(n7), .B2(i_data_bus[7]), 
        .ZN(N294) );
  INVD1BWP30P140LVT U31 ( .I(i_data_bus[40]), .ZN(n20) );
  MOAI22D1BWP30P140LVT U32 ( .A1(n1), .A2(n20), .B1(n7), .B2(i_data_bus[8]), 
        .ZN(N295) );
  INVD1BWP30P140LVT U33 ( .I(i_data_bus[41]), .ZN(n21) );
  MOAI22D1BWP30P140LVT U34 ( .A1(n1), .A2(n21), .B1(n7), .B2(i_data_bus[9]), 
        .ZN(N296) );
  INVD1BWP30P140LVT U35 ( .I(i_data_bus[42]), .ZN(n22) );
  MOAI22D1BWP30P140LVT U36 ( .A1(n1), .A2(n22), .B1(n7), .B2(i_data_bus[10]), 
        .ZN(N297) );
  INVD1BWP30P140LVT U37 ( .I(i_data_bus[43]), .ZN(n23) );
  MOAI22D1BWP30P140LVT U38 ( .A1(n1), .A2(n23), .B1(n7), .B2(i_data_bus[11]), 
        .ZN(N298) );
  INVD1BWP30P140LVT U39 ( .I(i_data_bus[44]), .ZN(n24) );
  MOAI22D1BWP30P140LVT U40 ( .A1(n1), .A2(n24), .B1(n7), .B2(i_data_bus[12]), 
        .ZN(N299) );
  INVD1BWP30P140LVT U41 ( .I(i_data_bus[45]), .ZN(n25) );
  MOAI22D1BWP30P140LVT U42 ( .A1(n1), .A2(n25), .B1(n7), .B2(i_data_bus[13]), 
        .ZN(N300) );
  INVD1BWP30P140LVT U43 ( .I(i_data_bus[46]), .ZN(n26) );
  MOAI22D1BWP30P140LVT U44 ( .A1(n1), .A2(n26), .B1(n7), .B2(i_data_bus[14]), 
        .ZN(N301) );
  INVD1BWP30P140LVT U45 ( .I(i_data_bus[47]), .ZN(n27) );
  MOAI22D1BWP30P140LVT U46 ( .A1(n1), .A2(n27), .B1(n7), .B2(i_data_bus[15]), 
        .ZN(N302) );
  INVD1BWP30P140LVT U47 ( .I(i_data_bus[48]), .ZN(n28) );
  MOAI22D1BWP30P140LVT U48 ( .A1(n1), .A2(n28), .B1(n7), .B2(i_data_bus[16]), 
        .ZN(N303) );
  INVD1BWP30P140LVT U49 ( .I(i_data_bus[49]), .ZN(n29) );
  MOAI22D1BWP30P140LVT U50 ( .A1(n1), .A2(n29), .B1(n7), .B2(i_data_bus[17]), 
        .ZN(N304) );
  INVD1BWP30P140LVT U51 ( .I(i_data_bus[50]), .ZN(n30) );
  MOAI22D1BWP30P140LVT U52 ( .A1(n1), .A2(n30), .B1(n7), .B2(i_data_bus[18]), 
        .ZN(N305) );
  INVD1BWP30P140LVT U53 ( .I(i_data_bus[51]), .ZN(n31) );
  MOAI22D1BWP30P140LVT U54 ( .A1(n1), .A2(n31), .B1(n7), .B2(i_data_bus[19]), 
        .ZN(N306) );
  INVD1BWP30P140LVT U55 ( .I(i_data_bus[52]), .ZN(n32) );
  MOAI22D1BWP30P140LVT U56 ( .A1(n1), .A2(n32), .B1(n7), .B2(i_data_bus[20]), 
        .ZN(N307) );
  INVD1BWP30P140LVT U57 ( .I(i_data_bus[53]), .ZN(n33) );
  MOAI22D1BWP30P140LVT U58 ( .A1(n1), .A2(n33), .B1(n7), .B2(i_data_bus[21]), 
        .ZN(N308) );
  INVD1BWP30P140LVT U59 ( .I(i_data_bus[54]), .ZN(n34) );
  MOAI22D1BWP30P140LVT U60 ( .A1(n1), .A2(n34), .B1(n7), .B2(i_data_bus[22]), 
        .ZN(N309) );
  INVD1BWP30P140LVT U61 ( .I(i_data_bus[55]), .ZN(n35) );
  MOAI22D1BWP30P140LVT U62 ( .A1(n1), .A2(n35), .B1(n7), .B2(i_data_bus[23]), 
        .ZN(N310) );
  INVD1BWP30P140LVT U63 ( .I(i_data_bus[56]), .ZN(n36) );
  MOAI22D1BWP30P140LVT U64 ( .A1(n1), .A2(n36), .B1(n7), .B2(i_data_bus[24]), 
        .ZN(N311) );
  INVD1BWP30P140LVT U65 ( .I(i_data_bus[57]), .ZN(n37) );
  MOAI22D1BWP30P140LVT U66 ( .A1(n1), .A2(n37), .B1(n7), .B2(i_data_bus[25]), 
        .ZN(N312) );
  INVD1BWP30P140LVT U67 ( .I(i_data_bus[58]), .ZN(n38) );
  MOAI22D1BWP30P140LVT U68 ( .A1(n1), .A2(n38), .B1(n7), .B2(i_data_bus[26]), 
        .ZN(N313) );
  INVD1BWP30P140LVT U69 ( .I(i_data_bus[59]), .ZN(n39) );
  MOAI22D1BWP30P140LVT U70 ( .A1(n1), .A2(n39), .B1(n7), .B2(i_data_bus[27]), 
        .ZN(N314) );
  INVD1BWP30P140LVT U71 ( .I(i_data_bus[60]), .ZN(n40) );
  MOAI22D1BWP30P140LVT U72 ( .A1(n1), .A2(n40), .B1(n7), .B2(i_data_bus[28]), 
        .ZN(N315) );
  INVD1BWP30P140LVT U73 ( .I(i_data_bus[61]), .ZN(n41) );
  MOAI22D1BWP30P140LVT U74 ( .A1(n1), .A2(n41), .B1(n7), .B2(i_data_bus[29]), 
        .ZN(N316) );
  INVD1BWP30P140LVT U75 ( .I(i_data_bus[62]), .ZN(n42) );
  MOAI22D1BWP30P140LVT U76 ( .A1(n1), .A2(n42), .B1(n7), .B2(i_data_bus[30]), 
        .ZN(N317) );
  INVD1BWP30P140LVT U77 ( .I(i_data_bus[63]), .ZN(n45) );
  MOAI22D1BWP30P140LVT U78 ( .A1(n1), .A2(n45), .B1(n7), .B2(i_data_bus[31]), 
        .ZN(N318) );
  OAI21D1BWP30P140LVT U79 ( .A1(i_cmd[0]), .A2(i_valid[0]), .B(n8), .ZN(n9) );
  AO211D1BWP30P140LVT U80 ( .A1(i_cmd[0]), .A2(n10), .B(i_cmd[1]), .C(n9), .Z(
        n11) );
  INVD2BWP30P140LVT U81 ( .I(n11), .ZN(n43) );
  MOAI22D1BWP30P140LVT U82 ( .A1(n12), .A2(n44), .B1(i_data_bus[0]), .B2(n43), 
        .ZN(N319) );
  MOAI22D1BWP30P140LVT U83 ( .A1(n13), .A2(n44), .B1(i_data_bus[1]), .B2(n43), 
        .ZN(N320) );
  MOAI22D1BWP30P140LVT U84 ( .A1(n14), .A2(n44), .B1(i_data_bus[2]), .B2(n43), 
        .ZN(N321) );
  MOAI22D1BWP30P140LVT U85 ( .A1(n15), .A2(n44), .B1(i_data_bus[3]), .B2(n43), 
        .ZN(N322) );
  MOAI22D1BWP30P140LVT U86 ( .A1(n16), .A2(n44), .B1(i_data_bus[4]), .B2(n43), 
        .ZN(N323) );
  MOAI22D1BWP30P140LVT U87 ( .A1(n17), .A2(n44), .B1(i_data_bus[5]), .B2(n43), 
        .ZN(N324) );
  MOAI22D1BWP30P140LVT U88 ( .A1(n18), .A2(n44), .B1(i_data_bus[6]), .B2(n43), 
        .ZN(N325) );
  MOAI22D1BWP30P140LVT U89 ( .A1(n19), .A2(n44), .B1(i_data_bus[7]), .B2(n43), 
        .ZN(N326) );
  MOAI22D1BWP30P140LVT U90 ( .A1(n20), .A2(n44), .B1(i_data_bus[8]), .B2(n43), 
        .ZN(N327) );
  MOAI22D1BWP30P140LVT U91 ( .A1(n21), .A2(n44), .B1(i_data_bus[9]), .B2(n43), 
        .ZN(N328) );
  MOAI22D1BWP30P140LVT U92 ( .A1(n22), .A2(n44), .B1(i_data_bus[10]), .B2(n43), 
        .ZN(N329) );
  MOAI22D1BWP30P140LVT U93 ( .A1(n23), .A2(n44), .B1(i_data_bus[11]), .B2(n43), 
        .ZN(N330) );
  MOAI22D1BWP30P140LVT U94 ( .A1(n24), .A2(n44), .B1(i_data_bus[12]), .B2(n43), 
        .ZN(N331) );
  MOAI22D1BWP30P140LVT U95 ( .A1(n25), .A2(n44), .B1(i_data_bus[13]), .B2(n43), 
        .ZN(N332) );
  MOAI22D1BWP30P140LVT U96 ( .A1(n26), .A2(n44), .B1(i_data_bus[14]), .B2(n43), 
        .ZN(N333) );
  MOAI22D1BWP30P140LVT U97 ( .A1(n27), .A2(n44), .B1(i_data_bus[15]), .B2(n43), 
        .ZN(N334) );
  MOAI22D1BWP30P140LVT U98 ( .A1(n28), .A2(n44), .B1(i_data_bus[16]), .B2(n43), 
        .ZN(N335) );
  MOAI22D1BWP30P140LVT U99 ( .A1(n29), .A2(n44), .B1(i_data_bus[17]), .B2(n43), 
        .ZN(N336) );
  MOAI22D1BWP30P140LVT U100 ( .A1(n30), .A2(n44), .B1(i_data_bus[18]), .B2(n43), .ZN(N337) );
  MOAI22D1BWP30P140LVT U101 ( .A1(n31), .A2(n44), .B1(i_data_bus[19]), .B2(n43), .ZN(N338) );
  MOAI22D1BWP30P140LVT U102 ( .A1(n32), .A2(n44), .B1(i_data_bus[20]), .B2(n43), .ZN(N339) );
  MOAI22D1BWP30P140LVT U103 ( .A1(n33), .A2(n44), .B1(i_data_bus[21]), .B2(n43), .ZN(N340) );
  MOAI22D1BWP30P140LVT U104 ( .A1(n34), .A2(n44), .B1(i_data_bus[22]), .B2(n43), .ZN(N341) );
  MOAI22D1BWP30P140LVT U105 ( .A1(n35), .A2(n44), .B1(i_data_bus[23]), .B2(n43), .ZN(N342) );
  MOAI22D1BWP30P140LVT U106 ( .A1(n36), .A2(n44), .B1(i_data_bus[24]), .B2(n43), .ZN(N343) );
  MOAI22D1BWP30P140LVT U107 ( .A1(n37), .A2(n44), .B1(i_data_bus[25]), .B2(n43), .ZN(N344) );
  MOAI22D1BWP30P140LVT U108 ( .A1(n38), .A2(n44), .B1(i_data_bus[26]), .B2(n43), .ZN(N345) );
  MOAI22D1BWP30P140LVT U109 ( .A1(n39), .A2(n44), .B1(i_data_bus[27]), .B2(n43), .ZN(N346) );
  MOAI22D1BWP30P140LVT U110 ( .A1(n40), .A2(n44), .B1(i_data_bus[28]), .B2(n43), .ZN(N347) );
  MOAI22D1BWP30P140LVT U111 ( .A1(n41), .A2(n44), .B1(i_data_bus[29]), .B2(n43), .ZN(N348) );
  MOAI22D1BWP30P140LVT U112 ( .A1(n42), .A2(n44), .B1(i_data_bus[30]), .B2(n43), .ZN(N349) );
  MOAI22D1BWP30P140LVT U113 ( .A1(n45), .A2(n44), .B1(i_data_bus[31]), .B2(n43), .ZN(N350) );
endmodule


module distribute_2x2_simple_seq_DATA_WIDTH32_COMMAND_WIDTH2_8 ( clk, rst, 
        i_valid, i_data_bus, o_valid, o_data_bus, i_en, i_cmd );
  input [1:0] i_valid;
  input [63:0] i_data_bus;
  output [1:0] o_valid;
  output [63:0] o_data_bus;
  input [1:0] i_cmd;
  input clk, rst, i_en;
  wire   N287, N288, N289, N290, N291, N292, N293, N294, N295, N296, N297,
         N298, N299, N300, N301, N302, N303, N304, N305, N306, N307, N308,
         N309, N310, N311, N312, N313, N314, N315, N316, N317, N318, N319,
         N320, N321, N322, N323, N324, N325, N326, N327, N328, N329, N330,
         N331, N332, N333, N334, N335, N336, N337, N338, N339, N340, N341,
         N342, N343, N344, N345, N346, N347, N348, N349, N350, N353, N354, n1,
         n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30,
         n31, n32, n33, n34, n35, n36, n37, n38, n39, n40, n41, n42, n43, n44,
         n45;

  DFQD1BWP30P140LVT o_data_bus_inner_reg_63_ ( .D(N350), .CP(clk), .Q(
        o_data_bus[63]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_62_ ( .D(N349), .CP(clk), .Q(
        o_data_bus[62]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_61_ ( .D(N348), .CP(clk), .Q(
        o_data_bus[61]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_60_ ( .D(N347), .CP(clk), .Q(
        o_data_bus[60]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_59_ ( .D(N346), .CP(clk), .Q(
        o_data_bus[59]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_58_ ( .D(N345), .CP(clk), .Q(
        o_data_bus[58]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_57_ ( .D(N344), .CP(clk), .Q(
        o_data_bus[57]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_56_ ( .D(N343), .CP(clk), .Q(
        o_data_bus[56]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_55_ ( .D(N342), .CP(clk), .Q(
        o_data_bus[55]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_54_ ( .D(N341), .CP(clk), .Q(
        o_data_bus[54]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_53_ ( .D(N340), .CP(clk), .Q(
        o_data_bus[53]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_52_ ( .D(N339), .CP(clk), .Q(
        o_data_bus[52]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_51_ ( .D(N338), .CP(clk), .Q(
        o_data_bus[51]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_50_ ( .D(N337), .CP(clk), .Q(
        o_data_bus[50]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_49_ ( .D(N336), .CP(clk), .Q(
        o_data_bus[49]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_48_ ( .D(N335), .CP(clk), .Q(
        o_data_bus[48]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_47_ ( .D(N334), .CP(clk), .Q(
        o_data_bus[47]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_46_ ( .D(N333), .CP(clk), .Q(
        o_data_bus[46]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_45_ ( .D(N332), .CP(clk), .Q(
        o_data_bus[45]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_44_ ( .D(N331), .CP(clk), .Q(
        o_data_bus[44]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_43_ ( .D(N330), .CP(clk), .Q(
        o_data_bus[43]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_42_ ( .D(N329), .CP(clk), .Q(
        o_data_bus[42]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_41_ ( .D(N328), .CP(clk), .Q(
        o_data_bus[41]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_40_ ( .D(N327), .CP(clk), .Q(
        o_data_bus[40]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_39_ ( .D(N326), .CP(clk), .Q(
        o_data_bus[39]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_38_ ( .D(N325), .CP(clk), .Q(
        o_data_bus[38]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_37_ ( .D(N324), .CP(clk), .Q(
        o_data_bus[37]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_36_ ( .D(N323), .CP(clk), .Q(
        o_data_bus[36]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_35_ ( .D(N322), .CP(clk), .Q(
        o_data_bus[35]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_34_ ( .D(N321), .CP(clk), .Q(
        o_data_bus[34]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_33_ ( .D(N320), .CP(clk), .Q(
        o_data_bus[33]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_32_ ( .D(N319), .CP(clk), .Q(
        o_data_bus[32]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_31_ ( .D(N318), .CP(clk), .Q(
        o_data_bus[31]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_30_ ( .D(N317), .CP(clk), .Q(
        o_data_bus[30]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_29_ ( .D(N316), .CP(clk), .Q(
        o_data_bus[29]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_28_ ( .D(N315), .CP(clk), .Q(
        o_data_bus[28]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_27_ ( .D(N314), .CP(clk), .Q(
        o_data_bus[27]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_26_ ( .D(N313), .CP(clk), .Q(
        o_data_bus[26]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_25_ ( .D(N312), .CP(clk), .Q(
        o_data_bus[25]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_24_ ( .D(N311), .CP(clk), .Q(
        o_data_bus[24]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_23_ ( .D(N310), .CP(clk), .Q(
        o_data_bus[23]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_22_ ( .D(N309), .CP(clk), .Q(
        o_data_bus[22]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_21_ ( .D(N308), .CP(clk), .Q(
        o_data_bus[21]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_20_ ( .D(N307), .CP(clk), .Q(
        o_data_bus[20]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_19_ ( .D(N306), .CP(clk), .Q(
        o_data_bus[19]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_18_ ( .D(N305), .CP(clk), .Q(
        o_data_bus[18]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_17_ ( .D(N304), .CP(clk), .Q(
        o_data_bus[17]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_16_ ( .D(N303), .CP(clk), .Q(
        o_data_bus[16]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_15_ ( .D(N302), .CP(clk), .Q(
        o_data_bus[15]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_14_ ( .D(N301), .CP(clk), .Q(
        o_data_bus[14]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_13_ ( .D(N300), .CP(clk), .Q(
        o_data_bus[13]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_12_ ( .D(N299), .CP(clk), .Q(
        o_data_bus[12]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_11_ ( .D(N298), .CP(clk), .Q(
        o_data_bus[11]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_10_ ( .D(N297), .CP(clk), .Q(
        o_data_bus[10]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_9_ ( .D(N296), .CP(clk), .Q(
        o_data_bus[9]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_8_ ( .D(N295), .CP(clk), .Q(
        o_data_bus[8]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_7_ ( .D(N294), .CP(clk), .Q(
        o_data_bus[7]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_6_ ( .D(N293), .CP(clk), .Q(
        o_data_bus[6]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_5_ ( .D(N292), .CP(clk), .Q(
        o_data_bus[5]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_4_ ( .D(N291), .CP(clk), .Q(
        o_data_bus[4]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_3_ ( .D(N290), .CP(clk), .Q(
        o_data_bus[3]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_2_ ( .D(N289), .CP(clk), .Q(
        o_data_bus[2]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_1_ ( .D(N288), .CP(clk), .Q(
        o_data_bus[1]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_0_ ( .D(N287), .CP(clk), .Q(
        o_data_bus[0]) );
  DFQD1BWP30P140LVT o_valid_inner_reg_1_ ( .D(N354), .CP(clk), .Q(o_valid[1])
         );
  DFQD1BWP30P140LVT o_valid_inner_reg_0_ ( .D(N353), .CP(clk), .Q(o_valid[0])
         );
  ND2OPTIBD1BWP30P140LVT U3 ( .A1(n8), .A2(i_valid[0]), .ZN(n3) );
  INVD1BWP30P140LVT U4 ( .I(i_valid[1]), .ZN(n10) );
  BUFFD2BWP30P140LVT U5 ( .I(n6), .Z(n1) );
  OAI211D1BWP30P140LVT U6 ( .A1(i_cmd[1]), .A2(i_valid[0]), .B(i_cmd[0]), .C(
        n5), .ZN(n6) );
  INR2D1BWP30P140LVT U7 ( .A1(i_en), .B1(rst), .ZN(n8) );
  NR2OPTPAD1BWP30P140LVT U8 ( .A1(i_cmd[0]), .A2(n3), .ZN(n7) );
  AOI31D1BWP30P140LVT U9 ( .A1(i_cmd[0]), .A2(n8), .A3(i_valid[1]), .B(n7), 
        .ZN(n2) );
  INVD1BWP30P140LVT U10 ( .I(n2), .ZN(N353) );
  ND3D2BWP30P140LVT U11 ( .A1(n8), .A2(i_cmd[1]), .A3(i_valid[1]), .ZN(n44) );
  OAI21D1BWP30P140LVT U12 ( .A1(i_cmd[1]), .A2(n3), .B(n44), .ZN(N354) );
  INVD1BWP30P140LVT U13 ( .I(i_data_bus[32]), .ZN(n12) );
  INVD1BWP30P140LVT U14 ( .I(n8), .ZN(n4) );
  AOI21D1BWP30P140LVT U15 ( .A1(i_cmd[1]), .A2(n10), .B(n4), .ZN(n5) );
  MOAI22D1BWP30P140LVT U16 ( .A1(n12), .A2(n6), .B1(i_data_bus[0]), .B2(n7), 
        .ZN(N287) );
  INVD1BWP30P140LVT U17 ( .I(i_data_bus[33]), .ZN(n13) );
  MOAI22D1BWP30P140LVT U18 ( .A1(n1), .A2(n13), .B1(n7), .B2(i_data_bus[1]), 
        .ZN(N288) );
  INVD1BWP30P140LVT U19 ( .I(i_data_bus[34]), .ZN(n14) );
  MOAI22D1BWP30P140LVT U20 ( .A1(n1), .A2(n14), .B1(n7), .B2(i_data_bus[2]), 
        .ZN(N289) );
  INVD1BWP30P140LVT U21 ( .I(i_data_bus[35]), .ZN(n15) );
  MOAI22D1BWP30P140LVT U22 ( .A1(n1), .A2(n15), .B1(n7), .B2(i_data_bus[3]), 
        .ZN(N290) );
  INVD1BWP30P140LVT U23 ( .I(i_data_bus[36]), .ZN(n16) );
  MOAI22D1BWP30P140LVT U24 ( .A1(n1), .A2(n16), .B1(n7), .B2(i_data_bus[4]), 
        .ZN(N291) );
  INVD1BWP30P140LVT U25 ( .I(i_data_bus[37]), .ZN(n17) );
  MOAI22D1BWP30P140LVT U26 ( .A1(n1), .A2(n17), .B1(n7), .B2(i_data_bus[5]), 
        .ZN(N292) );
  INVD1BWP30P140LVT U27 ( .I(i_data_bus[38]), .ZN(n18) );
  MOAI22D1BWP30P140LVT U28 ( .A1(n1), .A2(n18), .B1(n7), .B2(i_data_bus[6]), 
        .ZN(N293) );
  INVD1BWP30P140LVT U29 ( .I(i_data_bus[39]), .ZN(n19) );
  MOAI22D1BWP30P140LVT U30 ( .A1(n1), .A2(n19), .B1(n7), .B2(i_data_bus[7]), 
        .ZN(N294) );
  INVD1BWP30P140LVT U31 ( .I(i_data_bus[40]), .ZN(n20) );
  MOAI22D1BWP30P140LVT U32 ( .A1(n1), .A2(n20), .B1(n7), .B2(i_data_bus[8]), 
        .ZN(N295) );
  INVD1BWP30P140LVT U33 ( .I(i_data_bus[41]), .ZN(n21) );
  MOAI22D1BWP30P140LVT U34 ( .A1(n1), .A2(n21), .B1(n7), .B2(i_data_bus[9]), 
        .ZN(N296) );
  INVD1BWP30P140LVT U35 ( .I(i_data_bus[42]), .ZN(n22) );
  MOAI22D1BWP30P140LVT U36 ( .A1(n1), .A2(n22), .B1(n7), .B2(i_data_bus[10]), 
        .ZN(N297) );
  INVD1BWP30P140LVT U37 ( .I(i_data_bus[43]), .ZN(n23) );
  MOAI22D1BWP30P140LVT U38 ( .A1(n1), .A2(n23), .B1(n7), .B2(i_data_bus[11]), 
        .ZN(N298) );
  INVD1BWP30P140LVT U39 ( .I(i_data_bus[44]), .ZN(n24) );
  MOAI22D1BWP30P140LVT U40 ( .A1(n1), .A2(n24), .B1(n7), .B2(i_data_bus[12]), 
        .ZN(N299) );
  INVD1BWP30P140LVT U41 ( .I(i_data_bus[45]), .ZN(n25) );
  MOAI22D1BWP30P140LVT U42 ( .A1(n1), .A2(n25), .B1(n7), .B2(i_data_bus[13]), 
        .ZN(N300) );
  INVD1BWP30P140LVT U43 ( .I(i_data_bus[46]), .ZN(n26) );
  MOAI22D1BWP30P140LVT U44 ( .A1(n1), .A2(n26), .B1(n7), .B2(i_data_bus[14]), 
        .ZN(N301) );
  INVD1BWP30P140LVT U45 ( .I(i_data_bus[47]), .ZN(n27) );
  MOAI22D1BWP30P140LVT U46 ( .A1(n1), .A2(n27), .B1(n7), .B2(i_data_bus[15]), 
        .ZN(N302) );
  INVD1BWP30P140LVT U47 ( .I(i_data_bus[48]), .ZN(n28) );
  MOAI22D1BWP30P140LVT U48 ( .A1(n1), .A2(n28), .B1(n7), .B2(i_data_bus[16]), 
        .ZN(N303) );
  INVD1BWP30P140LVT U49 ( .I(i_data_bus[49]), .ZN(n29) );
  MOAI22D1BWP30P140LVT U50 ( .A1(n1), .A2(n29), .B1(n7), .B2(i_data_bus[17]), 
        .ZN(N304) );
  INVD1BWP30P140LVT U51 ( .I(i_data_bus[50]), .ZN(n30) );
  MOAI22D1BWP30P140LVT U52 ( .A1(n1), .A2(n30), .B1(n7), .B2(i_data_bus[18]), 
        .ZN(N305) );
  INVD1BWP30P140LVT U53 ( .I(i_data_bus[51]), .ZN(n31) );
  MOAI22D1BWP30P140LVT U54 ( .A1(n1), .A2(n31), .B1(n7), .B2(i_data_bus[19]), 
        .ZN(N306) );
  INVD1BWP30P140LVT U55 ( .I(i_data_bus[52]), .ZN(n32) );
  MOAI22D1BWP30P140LVT U56 ( .A1(n1), .A2(n32), .B1(n7), .B2(i_data_bus[20]), 
        .ZN(N307) );
  INVD1BWP30P140LVT U57 ( .I(i_data_bus[53]), .ZN(n33) );
  MOAI22D1BWP30P140LVT U58 ( .A1(n1), .A2(n33), .B1(n7), .B2(i_data_bus[21]), 
        .ZN(N308) );
  INVD1BWP30P140LVT U59 ( .I(i_data_bus[54]), .ZN(n34) );
  MOAI22D1BWP30P140LVT U60 ( .A1(n1), .A2(n34), .B1(n7), .B2(i_data_bus[22]), 
        .ZN(N309) );
  INVD1BWP30P140LVT U61 ( .I(i_data_bus[55]), .ZN(n35) );
  MOAI22D1BWP30P140LVT U62 ( .A1(n1), .A2(n35), .B1(n7), .B2(i_data_bus[23]), 
        .ZN(N310) );
  INVD1BWP30P140LVT U63 ( .I(i_data_bus[56]), .ZN(n36) );
  MOAI22D1BWP30P140LVT U64 ( .A1(n1), .A2(n36), .B1(n7), .B2(i_data_bus[24]), 
        .ZN(N311) );
  INVD1BWP30P140LVT U65 ( .I(i_data_bus[57]), .ZN(n37) );
  MOAI22D1BWP30P140LVT U66 ( .A1(n1), .A2(n37), .B1(n7), .B2(i_data_bus[25]), 
        .ZN(N312) );
  INVD1BWP30P140LVT U67 ( .I(i_data_bus[58]), .ZN(n38) );
  MOAI22D1BWP30P140LVT U68 ( .A1(n1), .A2(n38), .B1(n7), .B2(i_data_bus[26]), 
        .ZN(N313) );
  INVD1BWP30P140LVT U69 ( .I(i_data_bus[59]), .ZN(n39) );
  MOAI22D1BWP30P140LVT U70 ( .A1(n1), .A2(n39), .B1(n7), .B2(i_data_bus[27]), 
        .ZN(N314) );
  INVD1BWP30P140LVT U71 ( .I(i_data_bus[60]), .ZN(n40) );
  MOAI22D1BWP30P140LVT U72 ( .A1(n1), .A2(n40), .B1(n7), .B2(i_data_bus[28]), 
        .ZN(N315) );
  INVD1BWP30P140LVT U73 ( .I(i_data_bus[61]), .ZN(n41) );
  MOAI22D1BWP30P140LVT U74 ( .A1(n1), .A2(n41), .B1(n7), .B2(i_data_bus[29]), 
        .ZN(N316) );
  INVD1BWP30P140LVT U75 ( .I(i_data_bus[62]), .ZN(n42) );
  MOAI22D1BWP30P140LVT U76 ( .A1(n1), .A2(n42), .B1(n7), .B2(i_data_bus[30]), 
        .ZN(N317) );
  INVD1BWP30P140LVT U77 ( .I(i_data_bus[63]), .ZN(n45) );
  MOAI22D1BWP30P140LVT U78 ( .A1(n1), .A2(n45), .B1(n7), .B2(i_data_bus[31]), 
        .ZN(N318) );
  OAI21D1BWP30P140LVT U79 ( .A1(i_cmd[0]), .A2(i_valid[0]), .B(n8), .ZN(n9) );
  AO211D1BWP30P140LVT U80 ( .A1(i_cmd[0]), .A2(n10), .B(i_cmd[1]), .C(n9), .Z(
        n11) );
  INVD2BWP30P140LVT U81 ( .I(n11), .ZN(n43) );
  MOAI22D1BWP30P140LVT U82 ( .A1(n12), .A2(n44), .B1(i_data_bus[0]), .B2(n43), 
        .ZN(N319) );
  MOAI22D1BWP30P140LVT U83 ( .A1(n13), .A2(n44), .B1(i_data_bus[1]), .B2(n43), 
        .ZN(N320) );
  MOAI22D1BWP30P140LVT U84 ( .A1(n14), .A2(n44), .B1(i_data_bus[2]), .B2(n43), 
        .ZN(N321) );
  MOAI22D1BWP30P140LVT U85 ( .A1(n15), .A2(n44), .B1(i_data_bus[3]), .B2(n43), 
        .ZN(N322) );
  MOAI22D1BWP30P140LVT U86 ( .A1(n16), .A2(n44), .B1(i_data_bus[4]), .B2(n43), 
        .ZN(N323) );
  MOAI22D1BWP30P140LVT U87 ( .A1(n17), .A2(n44), .B1(i_data_bus[5]), .B2(n43), 
        .ZN(N324) );
  MOAI22D1BWP30P140LVT U88 ( .A1(n18), .A2(n44), .B1(i_data_bus[6]), .B2(n43), 
        .ZN(N325) );
  MOAI22D1BWP30P140LVT U89 ( .A1(n19), .A2(n44), .B1(i_data_bus[7]), .B2(n43), 
        .ZN(N326) );
  MOAI22D1BWP30P140LVT U90 ( .A1(n20), .A2(n44), .B1(i_data_bus[8]), .B2(n43), 
        .ZN(N327) );
  MOAI22D1BWP30P140LVT U91 ( .A1(n21), .A2(n44), .B1(i_data_bus[9]), .B2(n43), 
        .ZN(N328) );
  MOAI22D1BWP30P140LVT U92 ( .A1(n22), .A2(n44), .B1(i_data_bus[10]), .B2(n43), 
        .ZN(N329) );
  MOAI22D1BWP30P140LVT U93 ( .A1(n23), .A2(n44), .B1(i_data_bus[11]), .B2(n43), 
        .ZN(N330) );
  MOAI22D1BWP30P140LVT U94 ( .A1(n24), .A2(n44), .B1(i_data_bus[12]), .B2(n43), 
        .ZN(N331) );
  MOAI22D1BWP30P140LVT U95 ( .A1(n25), .A2(n44), .B1(i_data_bus[13]), .B2(n43), 
        .ZN(N332) );
  MOAI22D1BWP30P140LVT U96 ( .A1(n26), .A2(n44), .B1(i_data_bus[14]), .B2(n43), 
        .ZN(N333) );
  MOAI22D1BWP30P140LVT U97 ( .A1(n27), .A2(n44), .B1(i_data_bus[15]), .B2(n43), 
        .ZN(N334) );
  MOAI22D1BWP30P140LVT U98 ( .A1(n28), .A2(n44), .B1(i_data_bus[16]), .B2(n43), 
        .ZN(N335) );
  MOAI22D1BWP30P140LVT U99 ( .A1(n29), .A2(n44), .B1(i_data_bus[17]), .B2(n43), 
        .ZN(N336) );
  MOAI22D1BWP30P140LVT U100 ( .A1(n30), .A2(n44), .B1(i_data_bus[18]), .B2(n43), .ZN(N337) );
  MOAI22D1BWP30P140LVT U101 ( .A1(n31), .A2(n44), .B1(i_data_bus[19]), .B2(n43), .ZN(N338) );
  MOAI22D1BWP30P140LVT U102 ( .A1(n32), .A2(n44), .B1(i_data_bus[20]), .B2(n43), .ZN(N339) );
  MOAI22D1BWP30P140LVT U103 ( .A1(n33), .A2(n44), .B1(i_data_bus[21]), .B2(n43), .ZN(N340) );
  MOAI22D1BWP30P140LVT U104 ( .A1(n34), .A2(n44), .B1(i_data_bus[22]), .B2(n43), .ZN(N341) );
  MOAI22D1BWP30P140LVT U105 ( .A1(n35), .A2(n44), .B1(i_data_bus[23]), .B2(n43), .ZN(N342) );
  MOAI22D1BWP30P140LVT U106 ( .A1(n36), .A2(n44), .B1(i_data_bus[24]), .B2(n43), .ZN(N343) );
  MOAI22D1BWP30P140LVT U107 ( .A1(n37), .A2(n44), .B1(i_data_bus[25]), .B2(n43), .ZN(N344) );
  MOAI22D1BWP30P140LVT U108 ( .A1(n38), .A2(n44), .B1(i_data_bus[26]), .B2(n43), .ZN(N345) );
  MOAI22D1BWP30P140LVT U109 ( .A1(n39), .A2(n44), .B1(i_data_bus[27]), .B2(n43), .ZN(N346) );
  MOAI22D1BWP30P140LVT U110 ( .A1(n40), .A2(n44), .B1(i_data_bus[28]), .B2(n43), .ZN(N347) );
  MOAI22D1BWP30P140LVT U111 ( .A1(n41), .A2(n44), .B1(i_data_bus[29]), .B2(n43), .ZN(N348) );
  MOAI22D1BWP30P140LVT U112 ( .A1(n42), .A2(n44), .B1(i_data_bus[30]), .B2(n43), .ZN(N349) );
  MOAI22D1BWP30P140LVT U113 ( .A1(n45), .A2(n44), .B1(i_data_bus[31]), .B2(n43), .ZN(N350) );
endmodule


module distribute_2x2_simple_seq_DATA_WIDTH32_COMMAND_WIDTH2_9 ( clk, rst, 
        i_valid, i_data_bus, o_valid, o_data_bus, i_en, i_cmd );
  input [1:0] i_valid;
  input [63:0] i_data_bus;
  output [1:0] o_valid;
  output [63:0] o_data_bus;
  input [1:0] i_cmd;
  input clk, rst, i_en;
  wire   N287, N288, N289, N290, N291, N292, N293, N294, N295, N296, N297,
         N298, N299, N300, N301, N302, N303, N304, N305, N306, N307, N308,
         N309, N310, N311, N312, N313, N314, N315, N316, N317, N318, N319,
         N320, N321, N322, N323, N324, N325, N326, N327, N328, N329, N330,
         N331, N332, N333, N334, N335, N336, N337, N338, N339, N340, N341,
         N342, N343, N344, N345, N346, N347, N348, N349, N350, N353, N354, n1,
         n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30,
         n31, n32, n33, n34, n35, n36, n37, n38, n39, n40, n41, n42, n43, n44,
         n45;

  DFQD1BWP30P140LVT o_data_bus_inner_reg_63_ ( .D(N350), .CP(clk), .Q(
        o_data_bus[63]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_62_ ( .D(N349), .CP(clk), .Q(
        o_data_bus[62]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_61_ ( .D(N348), .CP(clk), .Q(
        o_data_bus[61]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_60_ ( .D(N347), .CP(clk), .Q(
        o_data_bus[60]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_59_ ( .D(N346), .CP(clk), .Q(
        o_data_bus[59]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_58_ ( .D(N345), .CP(clk), .Q(
        o_data_bus[58]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_57_ ( .D(N344), .CP(clk), .Q(
        o_data_bus[57]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_56_ ( .D(N343), .CP(clk), .Q(
        o_data_bus[56]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_55_ ( .D(N342), .CP(clk), .Q(
        o_data_bus[55]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_54_ ( .D(N341), .CP(clk), .Q(
        o_data_bus[54]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_53_ ( .D(N340), .CP(clk), .Q(
        o_data_bus[53]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_52_ ( .D(N339), .CP(clk), .Q(
        o_data_bus[52]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_51_ ( .D(N338), .CP(clk), .Q(
        o_data_bus[51]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_50_ ( .D(N337), .CP(clk), .Q(
        o_data_bus[50]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_49_ ( .D(N336), .CP(clk), .Q(
        o_data_bus[49]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_48_ ( .D(N335), .CP(clk), .Q(
        o_data_bus[48]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_47_ ( .D(N334), .CP(clk), .Q(
        o_data_bus[47]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_46_ ( .D(N333), .CP(clk), .Q(
        o_data_bus[46]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_45_ ( .D(N332), .CP(clk), .Q(
        o_data_bus[45]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_44_ ( .D(N331), .CP(clk), .Q(
        o_data_bus[44]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_43_ ( .D(N330), .CP(clk), .Q(
        o_data_bus[43]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_42_ ( .D(N329), .CP(clk), .Q(
        o_data_bus[42]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_41_ ( .D(N328), .CP(clk), .Q(
        o_data_bus[41]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_40_ ( .D(N327), .CP(clk), .Q(
        o_data_bus[40]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_39_ ( .D(N326), .CP(clk), .Q(
        o_data_bus[39]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_38_ ( .D(N325), .CP(clk), .Q(
        o_data_bus[38]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_37_ ( .D(N324), .CP(clk), .Q(
        o_data_bus[37]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_36_ ( .D(N323), .CP(clk), .Q(
        o_data_bus[36]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_35_ ( .D(N322), .CP(clk), .Q(
        o_data_bus[35]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_34_ ( .D(N321), .CP(clk), .Q(
        o_data_bus[34]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_33_ ( .D(N320), .CP(clk), .Q(
        o_data_bus[33]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_32_ ( .D(N319), .CP(clk), .Q(
        o_data_bus[32]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_31_ ( .D(N318), .CP(clk), .Q(
        o_data_bus[31]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_30_ ( .D(N317), .CP(clk), .Q(
        o_data_bus[30]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_29_ ( .D(N316), .CP(clk), .Q(
        o_data_bus[29]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_28_ ( .D(N315), .CP(clk), .Q(
        o_data_bus[28]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_27_ ( .D(N314), .CP(clk), .Q(
        o_data_bus[27]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_26_ ( .D(N313), .CP(clk), .Q(
        o_data_bus[26]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_25_ ( .D(N312), .CP(clk), .Q(
        o_data_bus[25]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_24_ ( .D(N311), .CP(clk), .Q(
        o_data_bus[24]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_23_ ( .D(N310), .CP(clk), .Q(
        o_data_bus[23]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_22_ ( .D(N309), .CP(clk), .Q(
        o_data_bus[22]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_21_ ( .D(N308), .CP(clk), .Q(
        o_data_bus[21]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_20_ ( .D(N307), .CP(clk), .Q(
        o_data_bus[20]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_19_ ( .D(N306), .CP(clk), .Q(
        o_data_bus[19]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_18_ ( .D(N305), .CP(clk), .Q(
        o_data_bus[18]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_17_ ( .D(N304), .CP(clk), .Q(
        o_data_bus[17]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_16_ ( .D(N303), .CP(clk), .Q(
        o_data_bus[16]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_15_ ( .D(N302), .CP(clk), .Q(
        o_data_bus[15]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_14_ ( .D(N301), .CP(clk), .Q(
        o_data_bus[14]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_13_ ( .D(N300), .CP(clk), .Q(
        o_data_bus[13]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_12_ ( .D(N299), .CP(clk), .Q(
        o_data_bus[12]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_11_ ( .D(N298), .CP(clk), .Q(
        o_data_bus[11]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_10_ ( .D(N297), .CP(clk), .Q(
        o_data_bus[10]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_9_ ( .D(N296), .CP(clk), .Q(
        o_data_bus[9]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_8_ ( .D(N295), .CP(clk), .Q(
        o_data_bus[8]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_7_ ( .D(N294), .CP(clk), .Q(
        o_data_bus[7]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_6_ ( .D(N293), .CP(clk), .Q(
        o_data_bus[6]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_5_ ( .D(N292), .CP(clk), .Q(
        o_data_bus[5]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_4_ ( .D(N291), .CP(clk), .Q(
        o_data_bus[4]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_3_ ( .D(N290), .CP(clk), .Q(
        o_data_bus[3]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_2_ ( .D(N289), .CP(clk), .Q(
        o_data_bus[2]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_1_ ( .D(N288), .CP(clk), .Q(
        o_data_bus[1]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_0_ ( .D(N287), .CP(clk), .Q(
        o_data_bus[0]) );
  DFQD1BWP30P140LVT o_valid_inner_reg_1_ ( .D(N354), .CP(clk), .Q(o_valid[1])
         );
  DFQD1BWP30P140LVT o_valid_inner_reg_0_ ( .D(N353), .CP(clk), .Q(o_valid[0])
         );
  ND2OPTIBD1BWP30P140LVT U3 ( .A1(n8), .A2(i_valid[0]), .ZN(n3) );
  INVD1BWP30P140LVT U4 ( .I(i_valid[1]), .ZN(n10) );
  BUFFD2BWP30P140LVT U5 ( .I(n6), .Z(n1) );
  OAI211D1BWP30P140LVT U6 ( .A1(i_cmd[1]), .A2(i_valid[0]), .B(i_cmd[0]), .C(
        n5), .ZN(n6) );
  INR2D1BWP30P140LVT U7 ( .A1(i_en), .B1(rst), .ZN(n8) );
  NR2OPTPAD1BWP30P140LVT U8 ( .A1(i_cmd[0]), .A2(n3), .ZN(n7) );
  AOI31D1BWP30P140LVT U9 ( .A1(i_cmd[0]), .A2(n8), .A3(i_valid[1]), .B(n7), 
        .ZN(n2) );
  INVD1BWP30P140LVT U10 ( .I(n2), .ZN(N353) );
  ND3D2BWP30P140LVT U11 ( .A1(n8), .A2(i_cmd[1]), .A3(i_valid[1]), .ZN(n44) );
  OAI21D1BWP30P140LVT U12 ( .A1(i_cmd[1]), .A2(n3), .B(n44), .ZN(N354) );
  INVD1BWP30P140LVT U13 ( .I(i_data_bus[32]), .ZN(n12) );
  INVD1BWP30P140LVT U14 ( .I(n8), .ZN(n4) );
  AOI21D1BWP30P140LVT U15 ( .A1(i_cmd[1]), .A2(n10), .B(n4), .ZN(n5) );
  MOAI22D1BWP30P140LVT U16 ( .A1(n12), .A2(n6), .B1(i_data_bus[0]), .B2(n7), 
        .ZN(N287) );
  INVD1BWP30P140LVT U17 ( .I(i_data_bus[33]), .ZN(n13) );
  MOAI22D1BWP30P140LVT U18 ( .A1(n1), .A2(n13), .B1(n7), .B2(i_data_bus[1]), 
        .ZN(N288) );
  INVD1BWP30P140LVT U19 ( .I(i_data_bus[34]), .ZN(n14) );
  MOAI22D1BWP30P140LVT U20 ( .A1(n1), .A2(n14), .B1(n7), .B2(i_data_bus[2]), 
        .ZN(N289) );
  INVD1BWP30P140LVT U21 ( .I(i_data_bus[35]), .ZN(n15) );
  MOAI22D1BWP30P140LVT U22 ( .A1(n1), .A2(n15), .B1(n7), .B2(i_data_bus[3]), 
        .ZN(N290) );
  INVD1BWP30P140LVT U23 ( .I(i_data_bus[36]), .ZN(n16) );
  MOAI22D1BWP30P140LVT U24 ( .A1(n1), .A2(n16), .B1(n7), .B2(i_data_bus[4]), 
        .ZN(N291) );
  INVD1BWP30P140LVT U25 ( .I(i_data_bus[37]), .ZN(n17) );
  MOAI22D1BWP30P140LVT U26 ( .A1(n1), .A2(n17), .B1(n7), .B2(i_data_bus[5]), 
        .ZN(N292) );
  INVD1BWP30P140LVT U27 ( .I(i_data_bus[38]), .ZN(n18) );
  MOAI22D1BWP30P140LVT U28 ( .A1(n1), .A2(n18), .B1(n7), .B2(i_data_bus[6]), 
        .ZN(N293) );
  INVD1BWP30P140LVT U29 ( .I(i_data_bus[39]), .ZN(n19) );
  MOAI22D1BWP30P140LVT U30 ( .A1(n1), .A2(n19), .B1(n7), .B2(i_data_bus[7]), 
        .ZN(N294) );
  INVD1BWP30P140LVT U31 ( .I(i_data_bus[40]), .ZN(n20) );
  MOAI22D1BWP30P140LVT U32 ( .A1(n1), .A2(n20), .B1(n7), .B2(i_data_bus[8]), 
        .ZN(N295) );
  INVD1BWP30P140LVT U33 ( .I(i_data_bus[41]), .ZN(n21) );
  MOAI22D1BWP30P140LVT U34 ( .A1(n1), .A2(n21), .B1(n7), .B2(i_data_bus[9]), 
        .ZN(N296) );
  INVD1BWP30P140LVT U35 ( .I(i_data_bus[42]), .ZN(n22) );
  MOAI22D1BWP30P140LVT U36 ( .A1(n1), .A2(n22), .B1(n7), .B2(i_data_bus[10]), 
        .ZN(N297) );
  INVD1BWP30P140LVT U37 ( .I(i_data_bus[43]), .ZN(n23) );
  MOAI22D1BWP30P140LVT U38 ( .A1(n1), .A2(n23), .B1(n7), .B2(i_data_bus[11]), 
        .ZN(N298) );
  INVD1BWP30P140LVT U39 ( .I(i_data_bus[44]), .ZN(n24) );
  MOAI22D1BWP30P140LVT U40 ( .A1(n1), .A2(n24), .B1(n7), .B2(i_data_bus[12]), 
        .ZN(N299) );
  INVD1BWP30P140LVT U41 ( .I(i_data_bus[45]), .ZN(n25) );
  MOAI22D1BWP30P140LVT U42 ( .A1(n1), .A2(n25), .B1(n7), .B2(i_data_bus[13]), 
        .ZN(N300) );
  INVD1BWP30P140LVT U43 ( .I(i_data_bus[46]), .ZN(n26) );
  MOAI22D1BWP30P140LVT U44 ( .A1(n1), .A2(n26), .B1(n7), .B2(i_data_bus[14]), 
        .ZN(N301) );
  INVD1BWP30P140LVT U45 ( .I(i_data_bus[47]), .ZN(n27) );
  MOAI22D1BWP30P140LVT U46 ( .A1(n1), .A2(n27), .B1(n7), .B2(i_data_bus[15]), 
        .ZN(N302) );
  INVD1BWP30P140LVT U47 ( .I(i_data_bus[48]), .ZN(n28) );
  MOAI22D1BWP30P140LVT U48 ( .A1(n1), .A2(n28), .B1(n7), .B2(i_data_bus[16]), 
        .ZN(N303) );
  INVD1BWP30P140LVT U49 ( .I(i_data_bus[49]), .ZN(n29) );
  MOAI22D1BWP30P140LVT U50 ( .A1(n1), .A2(n29), .B1(n7), .B2(i_data_bus[17]), 
        .ZN(N304) );
  INVD1BWP30P140LVT U51 ( .I(i_data_bus[50]), .ZN(n30) );
  MOAI22D1BWP30P140LVT U52 ( .A1(n1), .A2(n30), .B1(n7), .B2(i_data_bus[18]), 
        .ZN(N305) );
  INVD1BWP30P140LVT U53 ( .I(i_data_bus[51]), .ZN(n31) );
  MOAI22D1BWP30P140LVT U54 ( .A1(n1), .A2(n31), .B1(n7), .B2(i_data_bus[19]), 
        .ZN(N306) );
  INVD1BWP30P140LVT U55 ( .I(i_data_bus[52]), .ZN(n32) );
  MOAI22D1BWP30P140LVT U56 ( .A1(n1), .A2(n32), .B1(n7), .B2(i_data_bus[20]), 
        .ZN(N307) );
  INVD1BWP30P140LVT U57 ( .I(i_data_bus[53]), .ZN(n33) );
  MOAI22D1BWP30P140LVT U58 ( .A1(n1), .A2(n33), .B1(n7), .B2(i_data_bus[21]), 
        .ZN(N308) );
  INVD1BWP30P140LVT U59 ( .I(i_data_bus[54]), .ZN(n34) );
  MOAI22D1BWP30P140LVT U60 ( .A1(n1), .A2(n34), .B1(n7), .B2(i_data_bus[22]), 
        .ZN(N309) );
  INVD1BWP30P140LVT U61 ( .I(i_data_bus[55]), .ZN(n35) );
  MOAI22D1BWP30P140LVT U62 ( .A1(n1), .A2(n35), .B1(n7), .B2(i_data_bus[23]), 
        .ZN(N310) );
  INVD1BWP30P140LVT U63 ( .I(i_data_bus[56]), .ZN(n36) );
  MOAI22D1BWP30P140LVT U64 ( .A1(n1), .A2(n36), .B1(n7), .B2(i_data_bus[24]), 
        .ZN(N311) );
  INVD1BWP30P140LVT U65 ( .I(i_data_bus[57]), .ZN(n37) );
  MOAI22D1BWP30P140LVT U66 ( .A1(n1), .A2(n37), .B1(n7), .B2(i_data_bus[25]), 
        .ZN(N312) );
  INVD1BWP30P140LVT U67 ( .I(i_data_bus[58]), .ZN(n38) );
  MOAI22D1BWP30P140LVT U68 ( .A1(n1), .A2(n38), .B1(n7), .B2(i_data_bus[26]), 
        .ZN(N313) );
  INVD1BWP30P140LVT U69 ( .I(i_data_bus[59]), .ZN(n39) );
  MOAI22D1BWP30P140LVT U70 ( .A1(n1), .A2(n39), .B1(n7), .B2(i_data_bus[27]), 
        .ZN(N314) );
  INVD1BWP30P140LVT U71 ( .I(i_data_bus[60]), .ZN(n40) );
  MOAI22D1BWP30P140LVT U72 ( .A1(n1), .A2(n40), .B1(n7), .B2(i_data_bus[28]), 
        .ZN(N315) );
  INVD1BWP30P140LVT U73 ( .I(i_data_bus[61]), .ZN(n41) );
  MOAI22D1BWP30P140LVT U74 ( .A1(n1), .A2(n41), .B1(n7), .B2(i_data_bus[29]), 
        .ZN(N316) );
  INVD1BWP30P140LVT U75 ( .I(i_data_bus[62]), .ZN(n42) );
  MOAI22D1BWP30P140LVT U76 ( .A1(n1), .A2(n42), .B1(n7), .B2(i_data_bus[30]), 
        .ZN(N317) );
  INVD1BWP30P140LVT U77 ( .I(i_data_bus[63]), .ZN(n45) );
  MOAI22D1BWP30P140LVT U78 ( .A1(n1), .A2(n45), .B1(n7), .B2(i_data_bus[31]), 
        .ZN(N318) );
  OAI21D1BWP30P140LVT U79 ( .A1(i_cmd[0]), .A2(i_valid[0]), .B(n8), .ZN(n9) );
  AO211D1BWP30P140LVT U80 ( .A1(i_cmd[0]), .A2(n10), .B(i_cmd[1]), .C(n9), .Z(
        n11) );
  INVD2BWP30P140LVT U81 ( .I(n11), .ZN(n43) );
  MOAI22D1BWP30P140LVT U82 ( .A1(n12), .A2(n44), .B1(i_data_bus[0]), .B2(n43), 
        .ZN(N319) );
  MOAI22D1BWP30P140LVT U83 ( .A1(n13), .A2(n44), .B1(i_data_bus[1]), .B2(n43), 
        .ZN(N320) );
  MOAI22D1BWP30P140LVT U84 ( .A1(n14), .A2(n44), .B1(i_data_bus[2]), .B2(n43), 
        .ZN(N321) );
  MOAI22D1BWP30P140LVT U85 ( .A1(n15), .A2(n44), .B1(i_data_bus[3]), .B2(n43), 
        .ZN(N322) );
  MOAI22D1BWP30P140LVT U86 ( .A1(n16), .A2(n44), .B1(i_data_bus[4]), .B2(n43), 
        .ZN(N323) );
  MOAI22D1BWP30P140LVT U87 ( .A1(n17), .A2(n44), .B1(i_data_bus[5]), .B2(n43), 
        .ZN(N324) );
  MOAI22D1BWP30P140LVT U88 ( .A1(n18), .A2(n44), .B1(i_data_bus[6]), .B2(n43), 
        .ZN(N325) );
  MOAI22D1BWP30P140LVT U89 ( .A1(n19), .A2(n44), .B1(i_data_bus[7]), .B2(n43), 
        .ZN(N326) );
  MOAI22D1BWP30P140LVT U90 ( .A1(n20), .A2(n44), .B1(i_data_bus[8]), .B2(n43), 
        .ZN(N327) );
  MOAI22D1BWP30P140LVT U91 ( .A1(n21), .A2(n44), .B1(i_data_bus[9]), .B2(n43), 
        .ZN(N328) );
  MOAI22D1BWP30P140LVT U92 ( .A1(n22), .A2(n44), .B1(i_data_bus[10]), .B2(n43), 
        .ZN(N329) );
  MOAI22D1BWP30P140LVT U93 ( .A1(n23), .A2(n44), .B1(i_data_bus[11]), .B2(n43), 
        .ZN(N330) );
  MOAI22D1BWP30P140LVT U94 ( .A1(n24), .A2(n44), .B1(i_data_bus[12]), .B2(n43), 
        .ZN(N331) );
  MOAI22D1BWP30P140LVT U95 ( .A1(n25), .A2(n44), .B1(i_data_bus[13]), .B2(n43), 
        .ZN(N332) );
  MOAI22D1BWP30P140LVT U96 ( .A1(n26), .A2(n44), .B1(i_data_bus[14]), .B2(n43), 
        .ZN(N333) );
  MOAI22D1BWP30P140LVT U97 ( .A1(n27), .A2(n44), .B1(i_data_bus[15]), .B2(n43), 
        .ZN(N334) );
  MOAI22D1BWP30P140LVT U98 ( .A1(n28), .A2(n44), .B1(i_data_bus[16]), .B2(n43), 
        .ZN(N335) );
  MOAI22D1BWP30P140LVT U99 ( .A1(n29), .A2(n44), .B1(i_data_bus[17]), .B2(n43), 
        .ZN(N336) );
  MOAI22D1BWP30P140LVT U100 ( .A1(n30), .A2(n44), .B1(i_data_bus[18]), .B2(n43), .ZN(N337) );
  MOAI22D1BWP30P140LVT U101 ( .A1(n31), .A2(n44), .B1(i_data_bus[19]), .B2(n43), .ZN(N338) );
  MOAI22D1BWP30P140LVT U102 ( .A1(n32), .A2(n44), .B1(i_data_bus[20]), .B2(n43), .ZN(N339) );
  MOAI22D1BWP30P140LVT U103 ( .A1(n33), .A2(n44), .B1(i_data_bus[21]), .B2(n43), .ZN(N340) );
  MOAI22D1BWP30P140LVT U104 ( .A1(n34), .A2(n44), .B1(i_data_bus[22]), .B2(n43), .ZN(N341) );
  MOAI22D1BWP30P140LVT U105 ( .A1(n35), .A2(n44), .B1(i_data_bus[23]), .B2(n43), .ZN(N342) );
  MOAI22D1BWP30P140LVT U106 ( .A1(n36), .A2(n44), .B1(i_data_bus[24]), .B2(n43), .ZN(N343) );
  MOAI22D1BWP30P140LVT U107 ( .A1(n37), .A2(n44), .B1(i_data_bus[25]), .B2(n43), .ZN(N344) );
  MOAI22D1BWP30P140LVT U108 ( .A1(n38), .A2(n44), .B1(i_data_bus[26]), .B2(n43), .ZN(N345) );
  MOAI22D1BWP30P140LVT U109 ( .A1(n39), .A2(n44), .B1(i_data_bus[27]), .B2(n43), .ZN(N346) );
  MOAI22D1BWP30P140LVT U110 ( .A1(n40), .A2(n44), .B1(i_data_bus[28]), .B2(n43), .ZN(N347) );
  MOAI22D1BWP30P140LVT U111 ( .A1(n41), .A2(n44), .B1(i_data_bus[29]), .B2(n43), .ZN(N348) );
  MOAI22D1BWP30P140LVT U112 ( .A1(n42), .A2(n44), .B1(i_data_bus[30]), .B2(n43), .ZN(N349) );
  MOAI22D1BWP30P140LVT U113 ( .A1(n45), .A2(n44), .B1(i_data_bus[31]), .B2(n43), .ZN(N350) );
endmodule


module distribute_2x2_simple_seq_DATA_WIDTH32_COMMAND_WIDTH2_10 ( clk, rst, 
        i_valid, i_data_bus, o_valid, o_data_bus, i_en, i_cmd );
  input [1:0] i_valid;
  input [63:0] i_data_bus;
  output [1:0] o_valid;
  output [63:0] o_data_bus;
  input [1:0] i_cmd;
  input clk, rst, i_en;
  wire   N287, N288, N289, N290, N291, N292, N293, N294, N295, N296, N297,
         N298, N299, N300, N301, N302, N303, N304, N305, N306, N307, N308,
         N309, N310, N311, N312, N313, N314, N315, N316, N317, N318, N319,
         N320, N321, N322, N323, N324, N325, N326, N327, N328, N329, N330,
         N331, N332, N333, N334, N335, N336, N337, N338, N339, N340, N341,
         N342, N343, N344, N345, N346, N347, N348, N349, N350, N353, N354, n1,
         n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30,
         n31, n32, n33, n34, n35, n36, n37, n38, n39, n40, n41, n42, n43, n44,
         n45;

  DFQD1BWP30P140LVT o_data_bus_inner_reg_63_ ( .D(N350), .CP(clk), .Q(
        o_data_bus[63]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_62_ ( .D(N349), .CP(clk), .Q(
        o_data_bus[62]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_61_ ( .D(N348), .CP(clk), .Q(
        o_data_bus[61]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_60_ ( .D(N347), .CP(clk), .Q(
        o_data_bus[60]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_59_ ( .D(N346), .CP(clk), .Q(
        o_data_bus[59]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_58_ ( .D(N345), .CP(clk), .Q(
        o_data_bus[58]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_57_ ( .D(N344), .CP(clk), .Q(
        o_data_bus[57]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_56_ ( .D(N343), .CP(clk), .Q(
        o_data_bus[56]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_55_ ( .D(N342), .CP(clk), .Q(
        o_data_bus[55]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_54_ ( .D(N341), .CP(clk), .Q(
        o_data_bus[54]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_53_ ( .D(N340), .CP(clk), .Q(
        o_data_bus[53]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_52_ ( .D(N339), .CP(clk), .Q(
        o_data_bus[52]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_51_ ( .D(N338), .CP(clk), .Q(
        o_data_bus[51]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_50_ ( .D(N337), .CP(clk), .Q(
        o_data_bus[50]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_49_ ( .D(N336), .CP(clk), .Q(
        o_data_bus[49]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_48_ ( .D(N335), .CP(clk), .Q(
        o_data_bus[48]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_47_ ( .D(N334), .CP(clk), .Q(
        o_data_bus[47]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_46_ ( .D(N333), .CP(clk), .Q(
        o_data_bus[46]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_45_ ( .D(N332), .CP(clk), .Q(
        o_data_bus[45]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_44_ ( .D(N331), .CP(clk), .Q(
        o_data_bus[44]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_43_ ( .D(N330), .CP(clk), .Q(
        o_data_bus[43]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_42_ ( .D(N329), .CP(clk), .Q(
        o_data_bus[42]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_41_ ( .D(N328), .CP(clk), .Q(
        o_data_bus[41]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_40_ ( .D(N327), .CP(clk), .Q(
        o_data_bus[40]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_39_ ( .D(N326), .CP(clk), .Q(
        o_data_bus[39]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_38_ ( .D(N325), .CP(clk), .Q(
        o_data_bus[38]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_37_ ( .D(N324), .CP(clk), .Q(
        o_data_bus[37]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_36_ ( .D(N323), .CP(clk), .Q(
        o_data_bus[36]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_35_ ( .D(N322), .CP(clk), .Q(
        o_data_bus[35]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_34_ ( .D(N321), .CP(clk), .Q(
        o_data_bus[34]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_33_ ( .D(N320), .CP(clk), .Q(
        o_data_bus[33]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_32_ ( .D(N319), .CP(clk), .Q(
        o_data_bus[32]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_31_ ( .D(N318), .CP(clk), .Q(
        o_data_bus[31]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_30_ ( .D(N317), .CP(clk), .Q(
        o_data_bus[30]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_29_ ( .D(N316), .CP(clk), .Q(
        o_data_bus[29]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_28_ ( .D(N315), .CP(clk), .Q(
        o_data_bus[28]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_27_ ( .D(N314), .CP(clk), .Q(
        o_data_bus[27]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_26_ ( .D(N313), .CP(clk), .Q(
        o_data_bus[26]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_25_ ( .D(N312), .CP(clk), .Q(
        o_data_bus[25]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_24_ ( .D(N311), .CP(clk), .Q(
        o_data_bus[24]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_23_ ( .D(N310), .CP(clk), .Q(
        o_data_bus[23]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_22_ ( .D(N309), .CP(clk), .Q(
        o_data_bus[22]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_21_ ( .D(N308), .CP(clk), .Q(
        o_data_bus[21]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_20_ ( .D(N307), .CP(clk), .Q(
        o_data_bus[20]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_19_ ( .D(N306), .CP(clk), .Q(
        o_data_bus[19]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_18_ ( .D(N305), .CP(clk), .Q(
        o_data_bus[18]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_17_ ( .D(N304), .CP(clk), .Q(
        o_data_bus[17]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_16_ ( .D(N303), .CP(clk), .Q(
        o_data_bus[16]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_15_ ( .D(N302), .CP(clk), .Q(
        o_data_bus[15]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_14_ ( .D(N301), .CP(clk), .Q(
        o_data_bus[14]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_13_ ( .D(N300), .CP(clk), .Q(
        o_data_bus[13]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_12_ ( .D(N299), .CP(clk), .Q(
        o_data_bus[12]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_11_ ( .D(N298), .CP(clk), .Q(
        o_data_bus[11]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_10_ ( .D(N297), .CP(clk), .Q(
        o_data_bus[10]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_9_ ( .D(N296), .CP(clk), .Q(
        o_data_bus[9]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_8_ ( .D(N295), .CP(clk), .Q(
        o_data_bus[8]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_7_ ( .D(N294), .CP(clk), .Q(
        o_data_bus[7]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_6_ ( .D(N293), .CP(clk), .Q(
        o_data_bus[6]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_5_ ( .D(N292), .CP(clk), .Q(
        o_data_bus[5]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_4_ ( .D(N291), .CP(clk), .Q(
        o_data_bus[4]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_3_ ( .D(N290), .CP(clk), .Q(
        o_data_bus[3]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_2_ ( .D(N289), .CP(clk), .Q(
        o_data_bus[2]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_1_ ( .D(N288), .CP(clk), .Q(
        o_data_bus[1]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_0_ ( .D(N287), .CP(clk), .Q(
        o_data_bus[0]) );
  DFQD1BWP30P140LVT o_valid_inner_reg_1_ ( .D(N354), .CP(clk), .Q(o_valid[1])
         );
  DFQD1BWP30P140LVT o_valid_inner_reg_0_ ( .D(N353), .CP(clk), .Q(o_valid[0])
         );
  ND2OPTIBD1BWP30P140LVT U3 ( .A1(n8), .A2(i_valid[0]), .ZN(n3) );
  INVD1BWP30P140LVT U4 ( .I(i_valid[1]), .ZN(n10) );
  BUFFD2BWP30P140LVT U5 ( .I(n6), .Z(n1) );
  OAI211D1BWP30P140LVT U6 ( .A1(i_cmd[1]), .A2(i_valid[0]), .B(i_cmd[0]), .C(
        n5), .ZN(n6) );
  INR2D1BWP30P140LVT U7 ( .A1(i_en), .B1(rst), .ZN(n8) );
  NR2OPTPAD1BWP30P140LVT U8 ( .A1(i_cmd[0]), .A2(n3), .ZN(n7) );
  AOI31D1BWP30P140LVT U9 ( .A1(i_cmd[0]), .A2(n8), .A3(i_valid[1]), .B(n7), 
        .ZN(n2) );
  INVD1BWP30P140LVT U10 ( .I(n2), .ZN(N353) );
  ND3D2BWP30P140LVT U11 ( .A1(n8), .A2(i_cmd[1]), .A3(i_valid[1]), .ZN(n44) );
  OAI21D1BWP30P140LVT U12 ( .A1(i_cmd[1]), .A2(n3), .B(n44), .ZN(N354) );
  INVD1BWP30P140LVT U13 ( .I(i_data_bus[32]), .ZN(n12) );
  INVD1BWP30P140LVT U14 ( .I(n8), .ZN(n4) );
  AOI21D1BWP30P140LVT U15 ( .A1(i_cmd[1]), .A2(n10), .B(n4), .ZN(n5) );
  MOAI22D1BWP30P140LVT U16 ( .A1(n12), .A2(n6), .B1(i_data_bus[0]), .B2(n7), 
        .ZN(N287) );
  INVD1BWP30P140LVT U17 ( .I(i_data_bus[33]), .ZN(n13) );
  MOAI22D1BWP30P140LVT U18 ( .A1(n1), .A2(n13), .B1(n7), .B2(i_data_bus[1]), 
        .ZN(N288) );
  INVD1BWP30P140LVT U19 ( .I(i_data_bus[34]), .ZN(n14) );
  MOAI22D1BWP30P140LVT U20 ( .A1(n1), .A2(n14), .B1(n7), .B2(i_data_bus[2]), 
        .ZN(N289) );
  INVD1BWP30P140LVT U21 ( .I(i_data_bus[35]), .ZN(n15) );
  MOAI22D1BWP30P140LVT U22 ( .A1(n1), .A2(n15), .B1(n7), .B2(i_data_bus[3]), 
        .ZN(N290) );
  INVD1BWP30P140LVT U23 ( .I(i_data_bus[36]), .ZN(n16) );
  MOAI22D1BWP30P140LVT U24 ( .A1(n1), .A2(n16), .B1(n7), .B2(i_data_bus[4]), 
        .ZN(N291) );
  INVD1BWP30P140LVT U25 ( .I(i_data_bus[37]), .ZN(n17) );
  MOAI22D1BWP30P140LVT U26 ( .A1(n1), .A2(n17), .B1(n7), .B2(i_data_bus[5]), 
        .ZN(N292) );
  INVD1BWP30P140LVT U27 ( .I(i_data_bus[38]), .ZN(n18) );
  MOAI22D1BWP30P140LVT U28 ( .A1(n1), .A2(n18), .B1(n7), .B2(i_data_bus[6]), 
        .ZN(N293) );
  INVD1BWP30P140LVT U29 ( .I(i_data_bus[39]), .ZN(n19) );
  MOAI22D1BWP30P140LVT U30 ( .A1(n1), .A2(n19), .B1(n7), .B2(i_data_bus[7]), 
        .ZN(N294) );
  INVD1BWP30P140LVT U31 ( .I(i_data_bus[40]), .ZN(n20) );
  MOAI22D1BWP30P140LVT U32 ( .A1(n1), .A2(n20), .B1(n7), .B2(i_data_bus[8]), 
        .ZN(N295) );
  INVD1BWP30P140LVT U33 ( .I(i_data_bus[41]), .ZN(n21) );
  MOAI22D1BWP30P140LVT U34 ( .A1(n1), .A2(n21), .B1(n7), .B2(i_data_bus[9]), 
        .ZN(N296) );
  INVD1BWP30P140LVT U35 ( .I(i_data_bus[42]), .ZN(n22) );
  MOAI22D1BWP30P140LVT U36 ( .A1(n1), .A2(n22), .B1(n7), .B2(i_data_bus[10]), 
        .ZN(N297) );
  INVD1BWP30P140LVT U37 ( .I(i_data_bus[43]), .ZN(n23) );
  MOAI22D1BWP30P140LVT U38 ( .A1(n1), .A2(n23), .B1(n7), .B2(i_data_bus[11]), 
        .ZN(N298) );
  INVD1BWP30P140LVT U39 ( .I(i_data_bus[44]), .ZN(n24) );
  MOAI22D1BWP30P140LVT U40 ( .A1(n1), .A2(n24), .B1(n7), .B2(i_data_bus[12]), 
        .ZN(N299) );
  INVD1BWP30P140LVT U41 ( .I(i_data_bus[45]), .ZN(n25) );
  MOAI22D1BWP30P140LVT U42 ( .A1(n1), .A2(n25), .B1(n7), .B2(i_data_bus[13]), 
        .ZN(N300) );
  INVD1BWP30P140LVT U43 ( .I(i_data_bus[46]), .ZN(n26) );
  MOAI22D1BWP30P140LVT U44 ( .A1(n1), .A2(n26), .B1(n7), .B2(i_data_bus[14]), 
        .ZN(N301) );
  INVD1BWP30P140LVT U45 ( .I(i_data_bus[47]), .ZN(n27) );
  MOAI22D1BWP30P140LVT U46 ( .A1(n1), .A2(n27), .B1(n7), .B2(i_data_bus[15]), 
        .ZN(N302) );
  INVD1BWP30P140LVT U47 ( .I(i_data_bus[48]), .ZN(n28) );
  MOAI22D1BWP30P140LVT U48 ( .A1(n1), .A2(n28), .B1(n7), .B2(i_data_bus[16]), 
        .ZN(N303) );
  INVD1BWP30P140LVT U49 ( .I(i_data_bus[49]), .ZN(n29) );
  MOAI22D1BWP30P140LVT U50 ( .A1(n1), .A2(n29), .B1(n7), .B2(i_data_bus[17]), 
        .ZN(N304) );
  INVD1BWP30P140LVT U51 ( .I(i_data_bus[50]), .ZN(n30) );
  MOAI22D1BWP30P140LVT U52 ( .A1(n1), .A2(n30), .B1(n7), .B2(i_data_bus[18]), 
        .ZN(N305) );
  INVD1BWP30P140LVT U53 ( .I(i_data_bus[51]), .ZN(n31) );
  MOAI22D1BWP30P140LVT U54 ( .A1(n1), .A2(n31), .B1(n7), .B2(i_data_bus[19]), 
        .ZN(N306) );
  INVD1BWP30P140LVT U55 ( .I(i_data_bus[52]), .ZN(n32) );
  MOAI22D1BWP30P140LVT U56 ( .A1(n1), .A2(n32), .B1(n7), .B2(i_data_bus[20]), 
        .ZN(N307) );
  INVD1BWP30P140LVT U57 ( .I(i_data_bus[53]), .ZN(n33) );
  MOAI22D1BWP30P140LVT U58 ( .A1(n1), .A2(n33), .B1(n7), .B2(i_data_bus[21]), 
        .ZN(N308) );
  INVD1BWP30P140LVT U59 ( .I(i_data_bus[54]), .ZN(n34) );
  MOAI22D1BWP30P140LVT U60 ( .A1(n1), .A2(n34), .B1(n7), .B2(i_data_bus[22]), 
        .ZN(N309) );
  INVD1BWP30P140LVT U61 ( .I(i_data_bus[55]), .ZN(n35) );
  MOAI22D1BWP30P140LVT U62 ( .A1(n1), .A2(n35), .B1(n7), .B2(i_data_bus[23]), 
        .ZN(N310) );
  INVD1BWP30P140LVT U63 ( .I(i_data_bus[56]), .ZN(n36) );
  MOAI22D1BWP30P140LVT U64 ( .A1(n1), .A2(n36), .B1(n7), .B2(i_data_bus[24]), 
        .ZN(N311) );
  INVD1BWP30P140LVT U65 ( .I(i_data_bus[57]), .ZN(n37) );
  MOAI22D1BWP30P140LVT U66 ( .A1(n1), .A2(n37), .B1(n7), .B2(i_data_bus[25]), 
        .ZN(N312) );
  INVD1BWP30P140LVT U67 ( .I(i_data_bus[58]), .ZN(n38) );
  MOAI22D1BWP30P140LVT U68 ( .A1(n1), .A2(n38), .B1(n7), .B2(i_data_bus[26]), 
        .ZN(N313) );
  INVD1BWP30P140LVT U69 ( .I(i_data_bus[59]), .ZN(n39) );
  MOAI22D1BWP30P140LVT U70 ( .A1(n1), .A2(n39), .B1(n7), .B2(i_data_bus[27]), 
        .ZN(N314) );
  INVD1BWP30P140LVT U71 ( .I(i_data_bus[60]), .ZN(n40) );
  MOAI22D1BWP30P140LVT U72 ( .A1(n1), .A2(n40), .B1(n7), .B2(i_data_bus[28]), 
        .ZN(N315) );
  INVD1BWP30P140LVT U73 ( .I(i_data_bus[61]), .ZN(n41) );
  MOAI22D1BWP30P140LVT U74 ( .A1(n1), .A2(n41), .B1(n7), .B2(i_data_bus[29]), 
        .ZN(N316) );
  INVD1BWP30P140LVT U75 ( .I(i_data_bus[62]), .ZN(n42) );
  MOAI22D1BWP30P140LVT U76 ( .A1(n1), .A2(n42), .B1(n7), .B2(i_data_bus[30]), 
        .ZN(N317) );
  INVD1BWP30P140LVT U77 ( .I(i_data_bus[63]), .ZN(n45) );
  MOAI22D1BWP30P140LVT U78 ( .A1(n1), .A2(n45), .B1(n7), .B2(i_data_bus[31]), 
        .ZN(N318) );
  OAI21D1BWP30P140LVT U79 ( .A1(i_cmd[0]), .A2(i_valid[0]), .B(n8), .ZN(n9) );
  AO211D1BWP30P140LVT U80 ( .A1(i_cmd[0]), .A2(n10), .B(i_cmd[1]), .C(n9), .Z(
        n11) );
  INVD2BWP30P140LVT U81 ( .I(n11), .ZN(n43) );
  MOAI22D1BWP30P140LVT U82 ( .A1(n12), .A2(n44), .B1(i_data_bus[0]), .B2(n43), 
        .ZN(N319) );
  MOAI22D1BWP30P140LVT U83 ( .A1(n13), .A2(n44), .B1(i_data_bus[1]), .B2(n43), 
        .ZN(N320) );
  MOAI22D1BWP30P140LVT U84 ( .A1(n14), .A2(n44), .B1(i_data_bus[2]), .B2(n43), 
        .ZN(N321) );
  MOAI22D1BWP30P140LVT U85 ( .A1(n15), .A2(n44), .B1(i_data_bus[3]), .B2(n43), 
        .ZN(N322) );
  MOAI22D1BWP30P140LVT U86 ( .A1(n16), .A2(n44), .B1(i_data_bus[4]), .B2(n43), 
        .ZN(N323) );
  MOAI22D1BWP30P140LVT U87 ( .A1(n17), .A2(n44), .B1(i_data_bus[5]), .B2(n43), 
        .ZN(N324) );
  MOAI22D1BWP30P140LVT U88 ( .A1(n18), .A2(n44), .B1(i_data_bus[6]), .B2(n43), 
        .ZN(N325) );
  MOAI22D1BWP30P140LVT U89 ( .A1(n19), .A2(n44), .B1(i_data_bus[7]), .B2(n43), 
        .ZN(N326) );
  MOAI22D1BWP30P140LVT U90 ( .A1(n20), .A2(n44), .B1(i_data_bus[8]), .B2(n43), 
        .ZN(N327) );
  MOAI22D1BWP30P140LVT U91 ( .A1(n21), .A2(n44), .B1(i_data_bus[9]), .B2(n43), 
        .ZN(N328) );
  MOAI22D1BWP30P140LVT U92 ( .A1(n22), .A2(n44), .B1(i_data_bus[10]), .B2(n43), 
        .ZN(N329) );
  MOAI22D1BWP30P140LVT U93 ( .A1(n23), .A2(n44), .B1(i_data_bus[11]), .B2(n43), 
        .ZN(N330) );
  MOAI22D1BWP30P140LVT U94 ( .A1(n24), .A2(n44), .B1(i_data_bus[12]), .B2(n43), 
        .ZN(N331) );
  MOAI22D1BWP30P140LVT U95 ( .A1(n25), .A2(n44), .B1(i_data_bus[13]), .B2(n43), 
        .ZN(N332) );
  MOAI22D1BWP30P140LVT U96 ( .A1(n26), .A2(n44), .B1(i_data_bus[14]), .B2(n43), 
        .ZN(N333) );
  MOAI22D1BWP30P140LVT U97 ( .A1(n27), .A2(n44), .B1(i_data_bus[15]), .B2(n43), 
        .ZN(N334) );
  MOAI22D1BWP30P140LVT U98 ( .A1(n28), .A2(n44), .B1(i_data_bus[16]), .B2(n43), 
        .ZN(N335) );
  MOAI22D1BWP30P140LVT U99 ( .A1(n29), .A2(n44), .B1(i_data_bus[17]), .B2(n43), 
        .ZN(N336) );
  MOAI22D1BWP30P140LVT U100 ( .A1(n30), .A2(n44), .B1(i_data_bus[18]), .B2(n43), .ZN(N337) );
  MOAI22D1BWP30P140LVT U101 ( .A1(n31), .A2(n44), .B1(i_data_bus[19]), .B2(n43), .ZN(N338) );
  MOAI22D1BWP30P140LVT U102 ( .A1(n32), .A2(n44), .B1(i_data_bus[20]), .B2(n43), .ZN(N339) );
  MOAI22D1BWP30P140LVT U103 ( .A1(n33), .A2(n44), .B1(i_data_bus[21]), .B2(n43), .ZN(N340) );
  MOAI22D1BWP30P140LVT U104 ( .A1(n34), .A2(n44), .B1(i_data_bus[22]), .B2(n43), .ZN(N341) );
  MOAI22D1BWP30P140LVT U105 ( .A1(n35), .A2(n44), .B1(i_data_bus[23]), .B2(n43), .ZN(N342) );
  MOAI22D1BWP30P140LVT U106 ( .A1(n36), .A2(n44), .B1(i_data_bus[24]), .B2(n43), .ZN(N343) );
  MOAI22D1BWP30P140LVT U107 ( .A1(n37), .A2(n44), .B1(i_data_bus[25]), .B2(n43), .ZN(N344) );
  MOAI22D1BWP30P140LVT U108 ( .A1(n38), .A2(n44), .B1(i_data_bus[26]), .B2(n43), .ZN(N345) );
  MOAI22D1BWP30P140LVT U109 ( .A1(n39), .A2(n44), .B1(i_data_bus[27]), .B2(n43), .ZN(N346) );
  MOAI22D1BWP30P140LVT U110 ( .A1(n40), .A2(n44), .B1(i_data_bus[28]), .B2(n43), .ZN(N347) );
  MOAI22D1BWP30P140LVT U111 ( .A1(n41), .A2(n44), .B1(i_data_bus[29]), .B2(n43), .ZN(N348) );
  MOAI22D1BWP30P140LVT U112 ( .A1(n42), .A2(n44), .B1(i_data_bus[30]), .B2(n43), .ZN(N349) );
  MOAI22D1BWP30P140LVT U113 ( .A1(n45), .A2(n44), .B1(i_data_bus[31]), .B2(n43), .ZN(N350) );
endmodule


module distribute_2x2_simple_seq_DATA_WIDTH32_COMMAND_WIDTH2_11 ( clk, rst, 
        i_valid, i_data_bus, o_valid, o_data_bus, i_en, i_cmd );
  input [1:0] i_valid;
  input [63:0] i_data_bus;
  output [1:0] o_valid;
  output [63:0] o_data_bus;
  input [1:0] i_cmd;
  input clk, rst, i_en;
  wire   N287, N288, N289, N290, N291, N292, N293, N294, N295, N296, N297,
         N298, N299, N300, N301, N302, N303, N304, N305, N306, N307, N308,
         N309, N310, N311, N312, N313, N314, N315, N316, N317, N318, N319,
         N320, N321, N322, N323, N324, N325, N326, N327, N328, N329, N330,
         N331, N332, N333, N334, N335, N336, N337, N338, N339, N340, N341,
         N342, N343, N344, N345, N346, N347, N348, N349, N350, N353, N354, n1,
         n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30,
         n31, n32, n33, n34, n35, n36, n37, n38, n39, n40, n41, n42, n43, n44,
         n45;

  DFQD1BWP30P140LVT o_data_bus_inner_reg_63_ ( .D(N350), .CP(clk), .Q(
        o_data_bus[63]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_62_ ( .D(N349), .CP(clk), .Q(
        o_data_bus[62]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_61_ ( .D(N348), .CP(clk), .Q(
        o_data_bus[61]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_60_ ( .D(N347), .CP(clk), .Q(
        o_data_bus[60]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_59_ ( .D(N346), .CP(clk), .Q(
        o_data_bus[59]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_58_ ( .D(N345), .CP(clk), .Q(
        o_data_bus[58]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_57_ ( .D(N344), .CP(clk), .Q(
        o_data_bus[57]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_56_ ( .D(N343), .CP(clk), .Q(
        o_data_bus[56]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_55_ ( .D(N342), .CP(clk), .Q(
        o_data_bus[55]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_54_ ( .D(N341), .CP(clk), .Q(
        o_data_bus[54]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_53_ ( .D(N340), .CP(clk), .Q(
        o_data_bus[53]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_52_ ( .D(N339), .CP(clk), .Q(
        o_data_bus[52]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_51_ ( .D(N338), .CP(clk), .Q(
        o_data_bus[51]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_50_ ( .D(N337), .CP(clk), .Q(
        o_data_bus[50]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_49_ ( .D(N336), .CP(clk), .Q(
        o_data_bus[49]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_48_ ( .D(N335), .CP(clk), .Q(
        o_data_bus[48]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_47_ ( .D(N334), .CP(clk), .Q(
        o_data_bus[47]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_46_ ( .D(N333), .CP(clk), .Q(
        o_data_bus[46]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_45_ ( .D(N332), .CP(clk), .Q(
        o_data_bus[45]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_44_ ( .D(N331), .CP(clk), .Q(
        o_data_bus[44]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_43_ ( .D(N330), .CP(clk), .Q(
        o_data_bus[43]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_42_ ( .D(N329), .CP(clk), .Q(
        o_data_bus[42]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_41_ ( .D(N328), .CP(clk), .Q(
        o_data_bus[41]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_40_ ( .D(N327), .CP(clk), .Q(
        o_data_bus[40]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_39_ ( .D(N326), .CP(clk), .Q(
        o_data_bus[39]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_38_ ( .D(N325), .CP(clk), .Q(
        o_data_bus[38]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_37_ ( .D(N324), .CP(clk), .Q(
        o_data_bus[37]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_36_ ( .D(N323), .CP(clk), .Q(
        o_data_bus[36]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_35_ ( .D(N322), .CP(clk), .Q(
        o_data_bus[35]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_34_ ( .D(N321), .CP(clk), .Q(
        o_data_bus[34]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_33_ ( .D(N320), .CP(clk), .Q(
        o_data_bus[33]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_32_ ( .D(N319), .CP(clk), .Q(
        o_data_bus[32]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_31_ ( .D(N318), .CP(clk), .Q(
        o_data_bus[31]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_30_ ( .D(N317), .CP(clk), .Q(
        o_data_bus[30]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_29_ ( .D(N316), .CP(clk), .Q(
        o_data_bus[29]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_28_ ( .D(N315), .CP(clk), .Q(
        o_data_bus[28]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_27_ ( .D(N314), .CP(clk), .Q(
        o_data_bus[27]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_26_ ( .D(N313), .CP(clk), .Q(
        o_data_bus[26]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_25_ ( .D(N312), .CP(clk), .Q(
        o_data_bus[25]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_24_ ( .D(N311), .CP(clk), .Q(
        o_data_bus[24]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_23_ ( .D(N310), .CP(clk), .Q(
        o_data_bus[23]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_22_ ( .D(N309), .CP(clk), .Q(
        o_data_bus[22]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_21_ ( .D(N308), .CP(clk), .Q(
        o_data_bus[21]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_20_ ( .D(N307), .CP(clk), .Q(
        o_data_bus[20]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_19_ ( .D(N306), .CP(clk), .Q(
        o_data_bus[19]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_18_ ( .D(N305), .CP(clk), .Q(
        o_data_bus[18]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_17_ ( .D(N304), .CP(clk), .Q(
        o_data_bus[17]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_16_ ( .D(N303), .CP(clk), .Q(
        o_data_bus[16]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_15_ ( .D(N302), .CP(clk), .Q(
        o_data_bus[15]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_14_ ( .D(N301), .CP(clk), .Q(
        o_data_bus[14]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_13_ ( .D(N300), .CP(clk), .Q(
        o_data_bus[13]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_12_ ( .D(N299), .CP(clk), .Q(
        o_data_bus[12]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_11_ ( .D(N298), .CP(clk), .Q(
        o_data_bus[11]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_10_ ( .D(N297), .CP(clk), .Q(
        o_data_bus[10]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_9_ ( .D(N296), .CP(clk), .Q(
        o_data_bus[9]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_8_ ( .D(N295), .CP(clk), .Q(
        o_data_bus[8]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_7_ ( .D(N294), .CP(clk), .Q(
        o_data_bus[7]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_6_ ( .D(N293), .CP(clk), .Q(
        o_data_bus[6]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_5_ ( .D(N292), .CP(clk), .Q(
        o_data_bus[5]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_4_ ( .D(N291), .CP(clk), .Q(
        o_data_bus[4]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_3_ ( .D(N290), .CP(clk), .Q(
        o_data_bus[3]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_2_ ( .D(N289), .CP(clk), .Q(
        o_data_bus[2]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_1_ ( .D(N288), .CP(clk), .Q(
        o_data_bus[1]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_0_ ( .D(N287), .CP(clk), .Q(
        o_data_bus[0]) );
  DFQD1BWP30P140LVT o_valid_inner_reg_1_ ( .D(N354), .CP(clk), .Q(o_valid[1])
         );
  DFQD1BWP30P140LVT o_valid_inner_reg_0_ ( .D(N353), .CP(clk), .Q(o_valid[0])
         );
  ND2OPTIBD1BWP30P140LVT U3 ( .A1(n8), .A2(i_valid[0]), .ZN(n3) );
  INVD1BWP30P140LVT U4 ( .I(i_valid[1]), .ZN(n10) );
  BUFFD2BWP30P140LVT U5 ( .I(n6), .Z(n1) );
  OAI211D1BWP30P140LVT U6 ( .A1(i_cmd[1]), .A2(i_valid[0]), .B(i_cmd[0]), .C(
        n5), .ZN(n6) );
  INR2D1BWP30P140LVT U7 ( .A1(i_en), .B1(rst), .ZN(n8) );
  NR2OPTPAD1BWP30P140LVT U8 ( .A1(i_cmd[0]), .A2(n3), .ZN(n7) );
  AOI31D1BWP30P140LVT U9 ( .A1(i_cmd[0]), .A2(n8), .A3(i_valid[1]), .B(n7), 
        .ZN(n2) );
  INVD1BWP30P140LVT U10 ( .I(n2), .ZN(N353) );
  ND3D2BWP30P140LVT U11 ( .A1(n8), .A2(i_cmd[1]), .A3(i_valid[1]), .ZN(n44) );
  OAI21D1BWP30P140LVT U12 ( .A1(i_cmd[1]), .A2(n3), .B(n44), .ZN(N354) );
  INVD1BWP30P140LVT U13 ( .I(i_data_bus[32]), .ZN(n12) );
  INVD1BWP30P140LVT U14 ( .I(n8), .ZN(n4) );
  AOI21D1BWP30P140LVT U15 ( .A1(i_cmd[1]), .A2(n10), .B(n4), .ZN(n5) );
  MOAI22D1BWP30P140LVT U16 ( .A1(n12), .A2(n6), .B1(i_data_bus[0]), .B2(n7), 
        .ZN(N287) );
  INVD1BWP30P140LVT U17 ( .I(i_data_bus[33]), .ZN(n13) );
  MOAI22D1BWP30P140LVT U18 ( .A1(n1), .A2(n13), .B1(n7), .B2(i_data_bus[1]), 
        .ZN(N288) );
  INVD1BWP30P140LVT U19 ( .I(i_data_bus[34]), .ZN(n14) );
  MOAI22D1BWP30P140LVT U20 ( .A1(n1), .A2(n14), .B1(n7), .B2(i_data_bus[2]), 
        .ZN(N289) );
  INVD1BWP30P140LVT U21 ( .I(i_data_bus[35]), .ZN(n15) );
  MOAI22D1BWP30P140LVT U22 ( .A1(n1), .A2(n15), .B1(n7), .B2(i_data_bus[3]), 
        .ZN(N290) );
  INVD1BWP30P140LVT U23 ( .I(i_data_bus[36]), .ZN(n16) );
  MOAI22D1BWP30P140LVT U24 ( .A1(n1), .A2(n16), .B1(n7), .B2(i_data_bus[4]), 
        .ZN(N291) );
  INVD1BWP30P140LVT U25 ( .I(i_data_bus[37]), .ZN(n17) );
  MOAI22D1BWP30P140LVT U26 ( .A1(n1), .A2(n17), .B1(n7), .B2(i_data_bus[5]), 
        .ZN(N292) );
  INVD1BWP30P140LVT U27 ( .I(i_data_bus[38]), .ZN(n18) );
  MOAI22D1BWP30P140LVT U28 ( .A1(n1), .A2(n18), .B1(n7), .B2(i_data_bus[6]), 
        .ZN(N293) );
  INVD1BWP30P140LVT U29 ( .I(i_data_bus[39]), .ZN(n19) );
  MOAI22D1BWP30P140LVT U30 ( .A1(n1), .A2(n19), .B1(n7), .B2(i_data_bus[7]), 
        .ZN(N294) );
  INVD1BWP30P140LVT U31 ( .I(i_data_bus[40]), .ZN(n20) );
  MOAI22D1BWP30P140LVT U32 ( .A1(n1), .A2(n20), .B1(n7), .B2(i_data_bus[8]), 
        .ZN(N295) );
  INVD1BWP30P140LVT U33 ( .I(i_data_bus[41]), .ZN(n21) );
  MOAI22D1BWP30P140LVT U34 ( .A1(n1), .A2(n21), .B1(n7), .B2(i_data_bus[9]), 
        .ZN(N296) );
  INVD1BWP30P140LVT U35 ( .I(i_data_bus[42]), .ZN(n22) );
  MOAI22D1BWP30P140LVT U36 ( .A1(n1), .A2(n22), .B1(n7), .B2(i_data_bus[10]), 
        .ZN(N297) );
  INVD1BWP30P140LVT U37 ( .I(i_data_bus[43]), .ZN(n23) );
  MOAI22D1BWP30P140LVT U38 ( .A1(n1), .A2(n23), .B1(n7), .B2(i_data_bus[11]), 
        .ZN(N298) );
  INVD1BWP30P140LVT U39 ( .I(i_data_bus[44]), .ZN(n24) );
  MOAI22D1BWP30P140LVT U40 ( .A1(n1), .A2(n24), .B1(n7), .B2(i_data_bus[12]), 
        .ZN(N299) );
  INVD1BWP30P140LVT U41 ( .I(i_data_bus[45]), .ZN(n25) );
  MOAI22D1BWP30P140LVT U42 ( .A1(n1), .A2(n25), .B1(n7), .B2(i_data_bus[13]), 
        .ZN(N300) );
  INVD1BWP30P140LVT U43 ( .I(i_data_bus[46]), .ZN(n26) );
  MOAI22D1BWP30P140LVT U44 ( .A1(n1), .A2(n26), .B1(n7), .B2(i_data_bus[14]), 
        .ZN(N301) );
  INVD1BWP30P140LVT U45 ( .I(i_data_bus[47]), .ZN(n27) );
  MOAI22D1BWP30P140LVT U46 ( .A1(n1), .A2(n27), .B1(n7), .B2(i_data_bus[15]), 
        .ZN(N302) );
  INVD1BWP30P140LVT U47 ( .I(i_data_bus[48]), .ZN(n28) );
  MOAI22D1BWP30P140LVT U48 ( .A1(n1), .A2(n28), .B1(n7), .B2(i_data_bus[16]), 
        .ZN(N303) );
  INVD1BWP30P140LVT U49 ( .I(i_data_bus[49]), .ZN(n29) );
  MOAI22D1BWP30P140LVT U50 ( .A1(n1), .A2(n29), .B1(n7), .B2(i_data_bus[17]), 
        .ZN(N304) );
  INVD1BWP30P140LVT U51 ( .I(i_data_bus[50]), .ZN(n30) );
  MOAI22D1BWP30P140LVT U52 ( .A1(n1), .A2(n30), .B1(n7), .B2(i_data_bus[18]), 
        .ZN(N305) );
  INVD1BWP30P140LVT U53 ( .I(i_data_bus[51]), .ZN(n31) );
  MOAI22D1BWP30P140LVT U54 ( .A1(n1), .A2(n31), .B1(n7), .B2(i_data_bus[19]), 
        .ZN(N306) );
  INVD1BWP30P140LVT U55 ( .I(i_data_bus[52]), .ZN(n32) );
  MOAI22D1BWP30P140LVT U56 ( .A1(n1), .A2(n32), .B1(n7), .B2(i_data_bus[20]), 
        .ZN(N307) );
  INVD1BWP30P140LVT U57 ( .I(i_data_bus[53]), .ZN(n33) );
  MOAI22D1BWP30P140LVT U58 ( .A1(n1), .A2(n33), .B1(n7), .B2(i_data_bus[21]), 
        .ZN(N308) );
  INVD1BWP30P140LVT U59 ( .I(i_data_bus[54]), .ZN(n34) );
  MOAI22D1BWP30P140LVT U60 ( .A1(n1), .A2(n34), .B1(n7), .B2(i_data_bus[22]), 
        .ZN(N309) );
  INVD1BWP30P140LVT U61 ( .I(i_data_bus[55]), .ZN(n35) );
  MOAI22D1BWP30P140LVT U62 ( .A1(n1), .A2(n35), .B1(n7), .B2(i_data_bus[23]), 
        .ZN(N310) );
  INVD1BWP30P140LVT U63 ( .I(i_data_bus[56]), .ZN(n36) );
  MOAI22D1BWP30P140LVT U64 ( .A1(n1), .A2(n36), .B1(n7), .B2(i_data_bus[24]), 
        .ZN(N311) );
  INVD1BWP30P140LVT U65 ( .I(i_data_bus[57]), .ZN(n37) );
  MOAI22D1BWP30P140LVT U66 ( .A1(n1), .A2(n37), .B1(n7), .B2(i_data_bus[25]), 
        .ZN(N312) );
  INVD1BWP30P140LVT U67 ( .I(i_data_bus[58]), .ZN(n38) );
  MOAI22D1BWP30P140LVT U68 ( .A1(n1), .A2(n38), .B1(n7), .B2(i_data_bus[26]), 
        .ZN(N313) );
  INVD1BWP30P140LVT U69 ( .I(i_data_bus[59]), .ZN(n39) );
  MOAI22D1BWP30P140LVT U70 ( .A1(n1), .A2(n39), .B1(n7), .B2(i_data_bus[27]), 
        .ZN(N314) );
  INVD1BWP30P140LVT U71 ( .I(i_data_bus[60]), .ZN(n40) );
  MOAI22D1BWP30P140LVT U72 ( .A1(n1), .A2(n40), .B1(n7), .B2(i_data_bus[28]), 
        .ZN(N315) );
  INVD1BWP30P140LVT U73 ( .I(i_data_bus[61]), .ZN(n41) );
  MOAI22D1BWP30P140LVT U74 ( .A1(n1), .A2(n41), .B1(n7), .B2(i_data_bus[29]), 
        .ZN(N316) );
  INVD1BWP30P140LVT U75 ( .I(i_data_bus[62]), .ZN(n42) );
  MOAI22D1BWP30P140LVT U76 ( .A1(n1), .A2(n42), .B1(n7), .B2(i_data_bus[30]), 
        .ZN(N317) );
  INVD1BWP30P140LVT U77 ( .I(i_data_bus[63]), .ZN(n45) );
  MOAI22D1BWP30P140LVT U78 ( .A1(n1), .A2(n45), .B1(n7), .B2(i_data_bus[31]), 
        .ZN(N318) );
  OAI21D1BWP30P140LVT U79 ( .A1(i_cmd[0]), .A2(i_valid[0]), .B(n8), .ZN(n9) );
  AO211D1BWP30P140LVT U80 ( .A1(i_cmd[0]), .A2(n10), .B(i_cmd[1]), .C(n9), .Z(
        n11) );
  INVD2BWP30P140LVT U81 ( .I(n11), .ZN(n43) );
  MOAI22D1BWP30P140LVT U82 ( .A1(n12), .A2(n44), .B1(i_data_bus[0]), .B2(n43), 
        .ZN(N319) );
  MOAI22D1BWP30P140LVT U83 ( .A1(n13), .A2(n44), .B1(i_data_bus[1]), .B2(n43), 
        .ZN(N320) );
  MOAI22D1BWP30P140LVT U84 ( .A1(n14), .A2(n44), .B1(i_data_bus[2]), .B2(n43), 
        .ZN(N321) );
  MOAI22D1BWP30P140LVT U85 ( .A1(n15), .A2(n44), .B1(i_data_bus[3]), .B2(n43), 
        .ZN(N322) );
  MOAI22D1BWP30P140LVT U86 ( .A1(n16), .A2(n44), .B1(i_data_bus[4]), .B2(n43), 
        .ZN(N323) );
  MOAI22D1BWP30P140LVT U87 ( .A1(n17), .A2(n44), .B1(i_data_bus[5]), .B2(n43), 
        .ZN(N324) );
  MOAI22D1BWP30P140LVT U88 ( .A1(n18), .A2(n44), .B1(i_data_bus[6]), .B2(n43), 
        .ZN(N325) );
  MOAI22D1BWP30P140LVT U89 ( .A1(n19), .A2(n44), .B1(i_data_bus[7]), .B2(n43), 
        .ZN(N326) );
  MOAI22D1BWP30P140LVT U90 ( .A1(n20), .A2(n44), .B1(i_data_bus[8]), .B2(n43), 
        .ZN(N327) );
  MOAI22D1BWP30P140LVT U91 ( .A1(n21), .A2(n44), .B1(i_data_bus[9]), .B2(n43), 
        .ZN(N328) );
  MOAI22D1BWP30P140LVT U92 ( .A1(n22), .A2(n44), .B1(i_data_bus[10]), .B2(n43), 
        .ZN(N329) );
  MOAI22D1BWP30P140LVT U93 ( .A1(n23), .A2(n44), .B1(i_data_bus[11]), .B2(n43), 
        .ZN(N330) );
  MOAI22D1BWP30P140LVT U94 ( .A1(n24), .A2(n44), .B1(i_data_bus[12]), .B2(n43), 
        .ZN(N331) );
  MOAI22D1BWP30P140LVT U95 ( .A1(n25), .A2(n44), .B1(i_data_bus[13]), .B2(n43), 
        .ZN(N332) );
  MOAI22D1BWP30P140LVT U96 ( .A1(n26), .A2(n44), .B1(i_data_bus[14]), .B2(n43), 
        .ZN(N333) );
  MOAI22D1BWP30P140LVT U97 ( .A1(n27), .A2(n44), .B1(i_data_bus[15]), .B2(n43), 
        .ZN(N334) );
  MOAI22D1BWP30P140LVT U98 ( .A1(n28), .A2(n44), .B1(i_data_bus[16]), .B2(n43), 
        .ZN(N335) );
  MOAI22D1BWP30P140LVT U99 ( .A1(n29), .A2(n44), .B1(i_data_bus[17]), .B2(n43), 
        .ZN(N336) );
  MOAI22D1BWP30P140LVT U100 ( .A1(n30), .A2(n44), .B1(i_data_bus[18]), .B2(n43), .ZN(N337) );
  MOAI22D1BWP30P140LVT U101 ( .A1(n31), .A2(n44), .B1(i_data_bus[19]), .B2(n43), .ZN(N338) );
  MOAI22D1BWP30P140LVT U102 ( .A1(n32), .A2(n44), .B1(i_data_bus[20]), .B2(n43), .ZN(N339) );
  MOAI22D1BWP30P140LVT U103 ( .A1(n33), .A2(n44), .B1(i_data_bus[21]), .B2(n43), .ZN(N340) );
  MOAI22D1BWP30P140LVT U104 ( .A1(n34), .A2(n44), .B1(i_data_bus[22]), .B2(n43), .ZN(N341) );
  MOAI22D1BWP30P140LVT U105 ( .A1(n35), .A2(n44), .B1(i_data_bus[23]), .B2(n43), .ZN(N342) );
  MOAI22D1BWP30P140LVT U106 ( .A1(n36), .A2(n44), .B1(i_data_bus[24]), .B2(n43), .ZN(N343) );
  MOAI22D1BWP30P140LVT U107 ( .A1(n37), .A2(n44), .B1(i_data_bus[25]), .B2(n43), .ZN(N344) );
  MOAI22D1BWP30P140LVT U108 ( .A1(n38), .A2(n44), .B1(i_data_bus[26]), .B2(n43), .ZN(N345) );
  MOAI22D1BWP30P140LVT U109 ( .A1(n39), .A2(n44), .B1(i_data_bus[27]), .B2(n43), .ZN(N346) );
  MOAI22D1BWP30P140LVT U110 ( .A1(n40), .A2(n44), .B1(i_data_bus[28]), .B2(n43), .ZN(N347) );
  MOAI22D1BWP30P140LVT U111 ( .A1(n41), .A2(n44), .B1(i_data_bus[29]), .B2(n43), .ZN(N348) );
  MOAI22D1BWP30P140LVT U112 ( .A1(n42), .A2(n44), .B1(i_data_bus[30]), .B2(n43), .ZN(N349) );
  MOAI22D1BWP30P140LVT U113 ( .A1(n45), .A2(n44), .B1(i_data_bus[31]), .B2(n43), .ZN(N350) );
endmodule


module distribute_2x2_simple_seq_DATA_WIDTH32_COMMAND_WIDTH2_12 ( clk, rst, 
        i_valid, i_data_bus, o_valid, o_data_bus, i_en, i_cmd );
  input [1:0] i_valid;
  input [63:0] i_data_bus;
  output [1:0] o_valid;
  output [63:0] o_data_bus;
  input [1:0] i_cmd;
  input clk, rst, i_en;
  wire   N287, N288, N289, N290, N291, N292, N293, N294, N295, N296, N297,
         N298, N299, N300, N301, N302, N303, N304, N305, N306, N307, N308,
         N309, N310, N311, N312, N313, N314, N315, N316, N317, N318, N319,
         N320, N321, N322, N323, N324, N325, N326, N327, N328, N329, N330,
         N331, N332, N333, N334, N335, N336, N337, N338, N339, N340, N341,
         N342, N343, N344, N345, N346, N347, N348, N349, N350, N353, N354, n1,
         n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30,
         n31, n32, n33, n34, n35, n36, n37, n38, n39, n40, n41, n42, n43, n44,
         n45;

  DFQD1BWP30P140LVT o_data_bus_inner_reg_63_ ( .D(N350), .CP(clk), .Q(
        o_data_bus[63]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_62_ ( .D(N349), .CP(clk), .Q(
        o_data_bus[62]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_61_ ( .D(N348), .CP(clk), .Q(
        o_data_bus[61]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_60_ ( .D(N347), .CP(clk), .Q(
        o_data_bus[60]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_59_ ( .D(N346), .CP(clk), .Q(
        o_data_bus[59]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_58_ ( .D(N345), .CP(clk), .Q(
        o_data_bus[58]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_57_ ( .D(N344), .CP(clk), .Q(
        o_data_bus[57]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_56_ ( .D(N343), .CP(clk), .Q(
        o_data_bus[56]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_55_ ( .D(N342), .CP(clk), .Q(
        o_data_bus[55]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_54_ ( .D(N341), .CP(clk), .Q(
        o_data_bus[54]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_53_ ( .D(N340), .CP(clk), .Q(
        o_data_bus[53]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_52_ ( .D(N339), .CP(clk), .Q(
        o_data_bus[52]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_51_ ( .D(N338), .CP(clk), .Q(
        o_data_bus[51]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_50_ ( .D(N337), .CP(clk), .Q(
        o_data_bus[50]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_49_ ( .D(N336), .CP(clk), .Q(
        o_data_bus[49]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_48_ ( .D(N335), .CP(clk), .Q(
        o_data_bus[48]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_47_ ( .D(N334), .CP(clk), .Q(
        o_data_bus[47]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_46_ ( .D(N333), .CP(clk), .Q(
        o_data_bus[46]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_45_ ( .D(N332), .CP(clk), .Q(
        o_data_bus[45]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_44_ ( .D(N331), .CP(clk), .Q(
        o_data_bus[44]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_43_ ( .D(N330), .CP(clk), .Q(
        o_data_bus[43]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_42_ ( .D(N329), .CP(clk), .Q(
        o_data_bus[42]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_41_ ( .D(N328), .CP(clk), .Q(
        o_data_bus[41]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_40_ ( .D(N327), .CP(clk), .Q(
        o_data_bus[40]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_39_ ( .D(N326), .CP(clk), .Q(
        o_data_bus[39]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_38_ ( .D(N325), .CP(clk), .Q(
        o_data_bus[38]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_37_ ( .D(N324), .CP(clk), .Q(
        o_data_bus[37]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_36_ ( .D(N323), .CP(clk), .Q(
        o_data_bus[36]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_35_ ( .D(N322), .CP(clk), .Q(
        o_data_bus[35]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_34_ ( .D(N321), .CP(clk), .Q(
        o_data_bus[34]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_33_ ( .D(N320), .CP(clk), .Q(
        o_data_bus[33]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_32_ ( .D(N319), .CP(clk), .Q(
        o_data_bus[32]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_31_ ( .D(N318), .CP(clk), .Q(
        o_data_bus[31]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_30_ ( .D(N317), .CP(clk), .Q(
        o_data_bus[30]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_29_ ( .D(N316), .CP(clk), .Q(
        o_data_bus[29]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_28_ ( .D(N315), .CP(clk), .Q(
        o_data_bus[28]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_27_ ( .D(N314), .CP(clk), .Q(
        o_data_bus[27]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_26_ ( .D(N313), .CP(clk), .Q(
        o_data_bus[26]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_25_ ( .D(N312), .CP(clk), .Q(
        o_data_bus[25]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_24_ ( .D(N311), .CP(clk), .Q(
        o_data_bus[24]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_23_ ( .D(N310), .CP(clk), .Q(
        o_data_bus[23]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_22_ ( .D(N309), .CP(clk), .Q(
        o_data_bus[22]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_21_ ( .D(N308), .CP(clk), .Q(
        o_data_bus[21]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_20_ ( .D(N307), .CP(clk), .Q(
        o_data_bus[20]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_19_ ( .D(N306), .CP(clk), .Q(
        o_data_bus[19]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_18_ ( .D(N305), .CP(clk), .Q(
        o_data_bus[18]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_17_ ( .D(N304), .CP(clk), .Q(
        o_data_bus[17]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_16_ ( .D(N303), .CP(clk), .Q(
        o_data_bus[16]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_15_ ( .D(N302), .CP(clk), .Q(
        o_data_bus[15]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_14_ ( .D(N301), .CP(clk), .Q(
        o_data_bus[14]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_13_ ( .D(N300), .CP(clk), .Q(
        o_data_bus[13]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_12_ ( .D(N299), .CP(clk), .Q(
        o_data_bus[12]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_11_ ( .D(N298), .CP(clk), .Q(
        o_data_bus[11]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_10_ ( .D(N297), .CP(clk), .Q(
        o_data_bus[10]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_9_ ( .D(N296), .CP(clk), .Q(
        o_data_bus[9]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_8_ ( .D(N295), .CP(clk), .Q(
        o_data_bus[8]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_7_ ( .D(N294), .CP(clk), .Q(
        o_data_bus[7]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_6_ ( .D(N293), .CP(clk), .Q(
        o_data_bus[6]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_5_ ( .D(N292), .CP(clk), .Q(
        o_data_bus[5]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_4_ ( .D(N291), .CP(clk), .Q(
        o_data_bus[4]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_3_ ( .D(N290), .CP(clk), .Q(
        o_data_bus[3]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_2_ ( .D(N289), .CP(clk), .Q(
        o_data_bus[2]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_1_ ( .D(N288), .CP(clk), .Q(
        o_data_bus[1]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_0_ ( .D(N287), .CP(clk), .Q(
        o_data_bus[0]) );
  DFQD1BWP30P140LVT o_valid_inner_reg_1_ ( .D(N354), .CP(clk), .Q(o_valid[1])
         );
  DFQD1BWP30P140LVT o_valid_inner_reg_0_ ( .D(N353), .CP(clk), .Q(o_valid[0])
         );
  ND2OPTIBD1BWP30P140LVT U3 ( .A1(n8), .A2(i_valid[0]), .ZN(n3) );
  INVD1BWP30P140LVT U4 ( .I(i_valid[1]), .ZN(n10) );
  BUFFD2BWP30P140LVT U5 ( .I(n6), .Z(n1) );
  OAI211D1BWP30P140LVT U6 ( .A1(i_cmd[1]), .A2(i_valid[0]), .B(i_cmd[0]), .C(
        n5), .ZN(n6) );
  INR2D1BWP30P140LVT U7 ( .A1(i_en), .B1(rst), .ZN(n8) );
  NR2OPTPAD1BWP30P140LVT U8 ( .A1(i_cmd[0]), .A2(n3), .ZN(n7) );
  AOI31D1BWP30P140LVT U9 ( .A1(i_cmd[0]), .A2(n8), .A3(i_valid[1]), .B(n7), 
        .ZN(n2) );
  INVD1BWP30P140LVT U10 ( .I(n2), .ZN(N353) );
  ND3D2BWP30P140LVT U11 ( .A1(n8), .A2(i_cmd[1]), .A3(i_valid[1]), .ZN(n44) );
  OAI21D1BWP30P140LVT U12 ( .A1(i_cmd[1]), .A2(n3), .B(n44), .ZN(N354) );
  INVD1BWP30P140LVT U13 ( .I(i_data_bus[32]), .ZN(n12) );
  INVD1BWP30P140LVT U14 ( .I(n8), .ZN(n4) );
  AOI21D1BWP30P140LVT U15 ( .A1(i_cmd[1]), .A2(n10), .B(n4), .ZN(n5) );
  MOAI22D1BWP30P140LVT U16 ( .A1(n12), .A2(n6), .B1(i_data_bus[0]), .B2(n7), 
        .ZN(N287) );
  INVD1BWP30P140LVT U17 ( .I(i_data_bus[33]), .ZN(n13) );
  MOAI22D1BWP30P140LVT U18 ( .A1(n1), .A2(n13), .B1(n7), .B2(i_data_bus[1]), 
        .ZN(N288) );
  INVD1BWP30P140LVT U19 ( .I(i_data_bus[34]), .ZN(n14) );
  MOAI22D1BWP30P140LVT U20 ( .A1(n1), .A2(n14), .B1(n7), .B2(i_data_bus[2]), 
        .ZN(N289) );
  INVD1BWP30P140LVT U21 ( .I(i_data_bus[35]), .ZN(n15) );
  MOAI22D1BWP30P140LVT U22 ( .A1(n1), .A2(n15), .B1(n7), .B2(i_data_bus[3]), 
        .ZN(N290) );
  INVD1BWP30P140LVT U23 ( .I(i_data_bus[36]), .ZN(n16) );
  MOAI22D1BWP30P140LVT U24 ( .A1(n1), .A2(n16), .B1(n7), .B2(i_data_bus[4]), 
        .ZN(N291) );
  INVD1BWP30P140LVT U25 ( .I(i_data_bus[37]), .ZN(n17) );
  MOAI22D1BWP30P140LVT U26 ( .A1(n1), .A2(n17), .B1(n7), .B2(i_data_bus[5]), 
        .ZN(N292) );
  INVD1BWP30P140LVT U27 ( .I(i_data_bus[38]), .ZN(n18) );
  MOAI22D1BWP30P140LVT U28 ( .A1(n1), .A2(n18), .B1(n7), .B2(i_data_bus[6]), 
        .ZN(N293) );
  INVD1BWP30P140LVT U29 ( .I(i_data_bus[39]), .ZN(n19) );
  MOAI22D1BWP30P140LVT U30 ( .A1(n1), .A2(n19), .B1(n7), .B2(i_data_bus[7]), 
        .ZN(N294) );
  INVD1BWP30P140LVT U31 ( .I(i_data_bus[40]), .ZN(n20) );
  MOAI22D1BWP30P140LVT U32 ( .A1(n1), .A2(n20), .B1(n7), .B2(i_data_bus[8]), 
        .ZN(N295) );
  INVD1BWP30P140LVT U33 ( .I(i_data_bus[41]), .ZN(n21) );
  MOAI22D1BWP30P140LVT U34 ( .A1(n1), .A2(n21), .B1(n7), .B2(i_data_bus[9]), 
        .ZN(N296) );
  INVD1BWP30P140LVT U35 ( .I(i_data_bus[42]), .ZN(n22) );
  MOAI22D1BWP30P140LVT U36 ( .A1(n1), .A2(n22), .B1(n7), .B2(i_data_bus[10]), 
        .ZN(N297) );
  INVD1BWP30P140LVT U37 ( .I(i_data_bus[43]), .ZN(n23) );
  MOAI22D1BWP30P140LVT U38 ( .A1(n1), .A2(n23), .B1(n7), .B2(i_data_bus[11]), 
        .ZN(N298) );
  INVD1BWP30P140LVT U39 ( .I(i_data_bus[44]), .ZN(n24) );
  MOAI22D1BWP30P140LVT U40 ( .A1(n1), .A2(n24), .B1(n7), .B2(i_data_bus[12]), 
        .ZN(N299) );
  INVD1BWP30P140LVT U41 ( .I(i_data_bus[45]), .ZN(n25) );
  MOAI22D1BWP30P140LVT U42 ( .A1(n1), .A2(n25), .B1(n7), .B2(i_data_bus[13]), 
        .ZN(N300) );
  INVD1BWP30P140LVT U43 ( .I(i_data_bus[46]), .ZN(n26) );
  MOAI22D1BWP30P140LVT U44 ( .A1(n1), .A2(n26), .B1(n7), .B2(i_data_bus[14]), 
        .ZN(N301) );
  INVD1BWP30P140LVT U45 ( .I(i_data_bus[47]), .ZN(n27) );
  MOAI22D1BWP30P140LVT U46 ( .A1(n1), .A2(n27), .B1(n7), .B2(i_data_bus[15]), 
        .ZN(N302) );
  INVD1BWP30P140LVT U47 ( .I(i_data_bus[48]), .ZN(n28) );
  MOAI22D1BWP30P140LVT U48 ( .A1(n1), .A2(n28), .B1(n7), .B2(i_data_bus[16]), 
        .ZN(N303) );
  INVD1BWP30P140LVT U49 ( .I(i_data_bus[49]), .ZN(n29) );
  MOAI22D1BWP30P140LVT U50 ( .A1(n1), .A2(n29), .B1(n7), .B2(i_data_bus[17]), 
        .ZN(N304) );
  INVD1BWP30P140LVT U51 ( .I(i_data_bus[50]), .ZN(n30) );
  MOAI22D1BWP30P140LVT U52 ( .A1(n1), .A2(n30), .B1(n7), .B2(i_data_bus[18]), 
        .ZN(N305) );
  INVD1BWP30P140LVT U53 ( .I(i_data_bus[51]), .ZN(n31) );
  MOAI22D1BWP30P140LVT U54 ( .A1(n1), .A2(n31), .B1(n7), .B2(i_data_bus[19]), 
        .ZN(N306) );
  INVD1BWP30P140LVT U55 ( .I(i_data_bus[52]), .ZN(n32) );
  MOAI22D1BWP30P140LVT U56 ( .A1(n1), .A2(n32), .B1(n7), .B2(i_data_bus[20]), 
        .ZN(N307) );
  INVD1BWP30P140LVT U57 ( .I(i_data_bus[53]), .ZN(n33) );
  MOAI22D1BWP30P140LVT U58 ( .A1(n1), .A2(n33), .B1(n7), .B2(i_data_bus[21]), 
        .ZN(N308) );
  INVD1BWP30P140LVT U59 ( .I(i_data_bus[54]), .ZN(n34) );
  MOAI22D1BWP30P140LVT U60 ( .A1(n1), .A2(n34), .B1(n7), .B2(i_data_bus[22]), 
        .ZN(N309) );
  INVD1BWP30P140LVT U61 ( .I(i_data_bus[55]), .ZN(n35) );
  MOAI22D1BWP30P140LVT U62 ( .A1(n1), .A2(n35), .B1(n7), .B2(i_data_bus[23]), 
        .ZN(N310) );
  INVD1BWP30P140LVT U63 ( .I(i_data_bus[56]), .ZN(n36) );
  MOAI22D1BWP30P140LVT U64 ( .A1(n1), .A2(n36), .B1(n7), .B2(i_data_bus[24]), 
        .ZN(N311) );
  INVD1BWP30P140LVT U65 ( .I(i_data_bus[57]), .ZN(n37) );
  MOAI22D1BWP30P140LVT U66 ( .A1(n1), .A2(n37), .B1(n7), .B2(i_data_bus[25]), 
        .ZN(N312) );
  INVD1BWP30P140LVT U67 ( .I(i_data_bus[58]), .ZN(n38) );
  MOAI22D1BWP30P140LVT U68 ( .A1(n1), .A2(n38), .B1(n7), .B2(i_data_bus[26]), 
        .ZN(N313) );
  INVD1BWP30P140LVT U69 ( .I(i_data_bus[59]), .ZN(n39) );
  MOAI22D1BWP30P140LVT U70 ( .A1(n1), .A2(n39), .B1(n7), .B2(i_data_bus[27]), 
        .ZN(N314) );
  INVD1BWP30P140LVT U71 ( .I(i_data_bus[60]), .ZN(n40) );
  MOAI22D1BWP30P140LVT U72 ( .A1(n1), .A2(n40), .B1(n7), .B2(i_data_bus[28]), 
        .ZN(N315) );
  INVD1BWP30P140LVT U73 ( .I(i_data_bus[61]), .ZN(n41) );
  MOAI22D1BWP30P140LVT U74 ( .A1(n1), .A2(n41), .B1(n7), .B2(i_data_bus[29]), 
        .ZN(N316) );
  INVD1BWP30P140LVT U75 ( .I(i_data_bus[62]), .ZN(n42) );
  MOAI22D1BWP30P140LVT U76 ( .A1(n1), .A2(n42), .B1(n7), .B2(i_data_bus[30]), 
        .ZN(N317) );
  INVD1BWP30P140LVT U77 ( .I(i_data_bus[63]), .ZN(n45) );
  MOAI22D1BWP30P140LVT U78 ( .A1(n1), .A2(n45), .B1(n7), .B2(i_data_bus[31]), 
        .ZN(N318) );
  OAI21D1BWP30P140LVT U79 ( .A1(i_cmd[0]), .A2(i_valid[0]), .B(n8), .ZN(n9) );
  AO211D1BWP30P140LVT U80 ( .A1(i_cmd[0]), .A2(n10), .B(i_cmd[1]), .C(n9), .Z(
        n11) );
  INVD2BWP30P140LVT U81 ( .I(n11), .ZN(n43) );
  MOAI22D1BWP30P140LVT U82 ( .A1(n12), .A2(n44), .B1(i_data_bus[0]), .B2(n43), 
        .ZN(N319) );
  MOAI22D1BWP30P140LVT U83 ( .A1(n13), .A2(n44), .B1(i_data_bus[1]), .B2(n43), 
        .ZN(N320) );
  MOAI22D1BWP30P140LVT U84 ( .A1(n14), .A2(n44), .B1(i_data_bus[2]), .B2(n43), 
        .ZN(N321) );
  MOAI22D1BWP30P140LVT U85 ( .A1(n15), .A2(n44), .B1(i_data_bus[3]), .B2(n43), 
        .ZN(N322) );
  MOAI22D1BWP30P140LVT U86 ( .A1(n16), .A2(n44), .B1(i_data_bus[4]), .B2(n43), 
        .ZN(N323) );
  MOAI22D1BWP30P140LVT U87 ( .A1(n17), .A2(n44), .B1(i_data_bus[5]), .B2(n43), 
        .ZN(N324) );
  MOAI22D1BWP30P140LVT U88 ( .A1(n18), .A2(n44), .B1(i_data_bus[6]), .B2(n43), 
        .ZN(N325) );
  MOAI22D1BWP30P140LVT U89 ( .A1(n19), .A2(n44), .B1(i_data_bus[7]), .B2(n43), 
        .ZN(N326) );
  MOAI22D1BWP30P140LVT U90 ( .A1(n20), .A2(n44), .B1(i_data_bus[8]), .B2(n43), 
        .ZN(N327) );
  MOAI22D1BWP30P140LVT U91 ( .A1(n21), .A2(n44), .B1(i_data_bus[9]), .B2(n43), 
        .ZN(N328) );
  MOAI22D1BWP30P140LVT U92 ( .A1(n22), .A2(n44), .B1(i_data_bus[10]), .B2(n43), 
        .ZN(N329) );
  MOAI22D1BWP30P140LVT U93 ( .A1(n23), .A2(n44), .B1(i_data_bus[11]), .B2(n43), 
        .ZN(N330) );
  MOAI22D1BWP30P140LVT U94 ( .A1(n24), .A2(n44), .B1(i_data_bus[12]), .B2(n43), 
        .ZN(N331) );
  MOAI22D1BWP30P140LVT U95 ( .A1(n25), .A2(n44), .B1(i_data_bus[13]), .B2(n43), 
        .ZN(N332) );
  MOAI22D1BWP30P140LVT U96 ( .A1(n26), .A2(n44), .B1(i_data_bus[14]), .B2(n43), 
        .ZN(N333) );
  MOAI22D1BWP30P140LVT U97 ( .A1(n27), .A2(n44), .B1(i_data_bus[15]), .B2(n43), 
        .ZN(N334) );
  MOAI22D1BWP30P140LVT U98 ( .A1(n28), .A2(n44), .B1(i_data_bus[16]), .B2(n43), 
        .ZN(N335) );
  MOAI22D1BWP30P140LVT U99 ( .A1(n29), .A2(n44), .B1(i_data_bus[17]), .B2(n43), 
        .ZN(N336) );
  MOAI22D1BWP30P140LVT U100 ( .A1(n30), .A2(n44), .B1(i_data_bus[18]), .B2(n43), .ZN(N337) );
  MOAI22D1BWP30P140LVT U101 ( .A1(n31), .A2(n44), .B1(i_data_bus[19]), .B2(n43), .ZN(N338) );
  MOAI22D1BWP30P140LVT U102 ( .A1(n32), .A2(n44), .B1(i_data_bus[20]), .B2(n43), .ZN(N339) );
  MOAI22D1BWP30P140LVT U103 ( .A1(n33), .A2(n44), .B1(i_data_bus[21]), .B2(n43), .ZN(N340) );
  MOAI22D1BWP30P140LVT U104 ( .A1(n34), .A2(n44), .B1(i_data_bus[22]), .B2(n43), .ZN(N341) );
  MOAI22D1BWP30P140LVT U105 ( .A1(n35), .A2(n44), .B1(i_data_bus[23]), .B2(n43), .ZN(N342) );
  MOAI22D1BWP30P140LVT U106 ( .A1(n36), .A2(n44), .B1(i_data_bus[24]), .B2(n43), .ZN(N343) );
  MOAI22D1BWP30P140LVT U107 ( .A1(n37), .A2(n44), .B1(i_data_bus[25]), .B2(n43), .ZN(N344) );
  MOAI22D1BWP30P140LVT U108 ( .A1(n38), .A2(n44), .B1(i_data_bus[26]), .B2(n43), .ZN(N345) );
  MOAI22D1BWP30P140LVT U109 ( .A1(n39), .A2(n44), .B1(i_data_bus[27]), .B2(n43), .ZN(N346) );
  MOAI22D1BWP30P140LVT U110 ( .A1(n40), .A2(n44), .B1(i_data_bus[28]), .B2(n43), .ZN(N347) );
  MOAI22D1BWP30P140LVT U111 ( .A1(n41), .A2(n44), .B1(i_data_bus[29]), .B2(n43), .ZN(N348) );
  MOAI22D1BWP30P140LVT U112 ( .A1(n42), .A2(n44), .B1(i_data_bus[30]), .B2(n43), .ZN(N349) );
  MOAI22D1BWP30P140LVT U113 ( .A1(n45), .A2(n44), .B1(i_data_bus[31]), .B2(n43), .ZN(N350) );
endmodule


module distribute_2x2_simple_seq_DATA_WIDTH32_COMMAND_WIDTH2_13 ( clk, rst, 
        i_valid, i_data_bus, o_valid, o_data_bus, i_en, i_cmd );
  input [1:0] i_valid;
  input [63:0] i_data_bus;
  output [1:0] o_valid;
  output [63:0] o_data_bus;
  input [1:0] i_cmd;
  input clk, rst, i_en;
  wire   N287, N288, N289, N290, N291, N292, N293, N294, N295, N296, N297,
         N298, N299, N300, N301, N302, N303, N304, N305, N306, N307, N308,
         N309, N310, N311, N312, N313, N314, N315, N316, N317, N318, N319,
         N320, N321, N322, N323, N324, N325, N326, N327, N328, N329, N330,
         N331, N332, N333, N334, N335, N336, N337, N338, N339, N340, N341,
         N342, N343, N344, N345, N346, N347, N348, N349, N350, N353, N354, n1,
         n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30,
         n31, n32, n33, n34, n35, n36, n37, n38, n39, n40, n41, n42, n43, n44,
         n45;

  DFQD1BWP30P140LVT o_data_bus_inner_reg_63_ ( .D(N350), .CP(clk), .Q(
        o_data_bus[63]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_62_ ( .D(N349), .CP(clk), .Q(
        o_data_bus[62]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_61_ ( .D(N348), .CP(clk), .Q(
        o_data_bus[61]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_60_ ( .D(N347), .CP(clk), .Q(
        o_data_bus[60]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_59_ ( .D(N346), .CP(clk), .Q(
        o_data_bus[59]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_58_ ( .D(N345), .CP(clk), .Q(
        o_data_bus[58]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_57_ ( .D(N344), .CP(clk), .Q(
        o_data_bus[57]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_56_ ( .D(N343), .CP(clk), .Q(
        o_data_bus[56]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_55_ ( .D(N342), .CP(clk), .Q(
        o_data_bus[55]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_54_ ( .D(N341), .CP(clk), .Q(
        o_data_bus[54]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_53_ ( .D(N340), .CP(clk), .Q(
        o_data_bus[53]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_52_ ( .D(N339), .CP(clk), .Q(
        o_data_bus[52]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_51_ ( .D(N338), .CP(clk), .Q(
        o_data_bus[51]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_50_ ( .D(N337), .CP(clk), .Q(
        o_data_bus[50]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_49_ ( .D(N336), .CP(clk), .Q(
        o_data_bus[49]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_48_ ( .D(N335), .CP(clk), .Q(
        o_data_bus[48]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_47_ ( .D(N334), .CP(clk), .Q(
        o_data_bus[47]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_46_ ( .D(N333), .CP(clk), .Q(
        o_data_bus[46]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_45_ ( .D(N332), .CP(clk), .Q(
        o_data_bus[45]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_44_ ( .D(N331), .CP(clk), .Q(
        o_data_bus[44]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_43_ ( .D(N330), .CP(clk), .Q(
        o_data_bus[43]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_42_ ( .D(N329), .CP(clk), .Q(
        o_data_bus[42]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_41_ ( .D(N328), .CP(clk), .Q(
        o_data_bus[41]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_40_ ( .D(N327), .CP(clk), .Q(
        o_data_bus[40]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_39_ ( .D(N326), .CP(clk), .Q(
        o_data_bus[39]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_38_ ( .D(N325), .CP(clk), .Q(
        o_data_bus[38]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_37_ ( .D(N324), .CP(clk), .Q(
        o_data_bus[37]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_36_ ( .D(N323), .CP(clk), .Q(
        o_data_bus[36]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_35_ ( .D(N322), .CP(clk), .Q(
        o_data_bus[35]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_34_ ( .D(N321), .CP(clk), .Q(
        o_data_bus[34]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_33_ ( .D(N320), .CP(clk), .Q(
        o_data_bus[33]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_32_ ( .D(N319), .CP(clk), .Q(
        o_data_bus[32]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_31_ ( .D(N318), .CP(clk), .Q(
        o_data_bus[31]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_30_ ( .D(N317), .CP(clk), .Q(
        o_data_bus[30]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_29_ ( .D(N316), .CP(clk), .Q(
        o_data_bus[29]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_28_ ( .D(N315), .CP(clk), .Q(
        o_data_bus[28]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_27_ ( .D(N314), .CP(clk), .Q(
        o_data_bus[27]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_26_ ( .D(N313), .CP(clk), .Q(
        o_data_bus[26]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_25_ ( .D(N312), .CP(clk), .Q(
        o_data_bus[25]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_24_ ( .D(N311), .CP(clk), .Q(
        o_data_bus[24]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_23_ ( .D(N310), .CP(clk), .Q(
        o_data_bus[23]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_22_ ( .D(N309), .CP(clk), .Q(
        o_data_bus[22]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_21_ ( .D(N308), .CP(clk), .Q(
        o_data_bus[21]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_20_ ( .D(N307), .CP(clk), .Q(
        o_data_bus[20]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_19_ ( .D(N306), .CP(clk), .Q(
        o_data_bus[19]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_18_ ( .D(N305), .CP(clk), .Q(
        o_data_bus[18]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_17_ ( .D(N304), .CP(clk), .Q(
        o_data_bus[17]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_16_ ( .D(N303), .CP(clk), .Q(
        o_data_bus[16]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_15_ ( .D(N302), .CP(clk), .Q(
        o_data_bus[15]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_14_ ( .D(N301), .CP(clk), .Q(
        o_data_bus[14]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_13_ ( .D(N300), .CP(clk), .Q(
        o_data_bus[13]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_12_ ( .D(N299), .CP(clk), .Q(
        o_data_bus[12]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_11_ ( .D(N298), .CP(clk), .Q(
        o_data_bus[11]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_10_ ( .D(N297), .CP(clk), .Q(
        o_data_bus[10]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_9_ ( .D(N296), .CP(clk), .Q(
        o_data_bus[9]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_8_ ( .D(N295), .CP(clk), .Q(
        o_data_bus[8]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_7_ ( .D(N294), .CP(clk), .Q(
        o_data_bus[7]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_6_ ( .D(N293), .CP(clk), .Q(
        o_data_bus[6]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_5_ ( .D(N292), .CP(clk), .Q(
        o_data_bus[5]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_4_ ( .D(N291), .CP(clk), .Q(
        o_data_bus[4]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_3_ ( .D(N290), .CP(clk), .Q(
        o_data_bus[3]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_2_ ( .D(N289), .CP(clk), .Q(
        o_data_bus[2]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_1_ ( .D(N288), .CP(clk), .Q(
        o_data_bus[1]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_0_ ( .D(N287), .CP(clk), .Q(
        o_data_bus[0]) );
  DFQD1BWP30P140LVT o_valid_inner_reg_1_ ( .D(N354), .CP(clk), .Q(o_valid[1])
         );
  DFQD1BWP30P140LVT o_valid_inner_reg_0_ ( .D(N353), .CP(clk), .Q(o_valid[0])
         );
  ND2OPTIBD1BWP30P140LVT U3 ( .A1(n8), .A2(i_valid[0]), .ZN(n3) );
  INVD1BWP30P140LVT U4 ( .I(i_valid[1]), .ZN(n10) );
  BUFFD2BWP30P140LVT U5 ( .I(n6), .Z(n1) );
  OAI211D1BWP30P140LVT U6 ( .A1(i_cmd[1]), .A2(i_valid[0]), .B(i_cmd[0]), .C(
        n5), .ZN(n6) );
  INR2D1BWP30P140LVT U7 ( .A1(i_en), .B1(rst), .ZN(n8) );
  NR2OPTPAD1BWP30P140LVT U8 ( .A1(i_cmd[0]), .A2(n3), .ZN(n7) );
  AOI31D1BWP30P140LVT U9 ( .A1(i_cmd[0]), .A2(n8), .A3(i_valid[1]), .B(n7), 
        .ZN(n2) );
  INVD1BWP30P140LVT U10 ( .I(n2), .ZN(N353) );
  ND3D2BWP30P140LVT U11 ( .A1(n8), .A2(i_cmd[1]), .A3(i_valid[1]), .ZN(n44) );
  OAI21D1BWP30P140LVT U12 ( .A1(i_cmd[1]), .A2(n3), .B(n44), .ZN(N354) );
  INVD1BWP30P140LVT U13 ( .I(i_data_bus[32]), .ZN(n12) );
  INVD1BWP30P140LVT U14 ( .I(n8), .ZN(n4) );
  AOI21D1BWP30P140LVT U15 ( .A1(i_cmd[1]), .A2(n10), .B(n4), .ZN(n5) );
  MOAI22D1BWP30P140LVT U16 ( .A1(n12), .A2(n6), .B1(i_data_bus[0]), .B2(n7), 
        .ZN(N287) );
  INVD1BWP30P140LVT U17 ( .I(i_data_bus[33]), .ZN(n13) );
  MOAI22D1BWP30P140LVT U18 ( .A1(n1), .A2(n13), .B1(n7), .B2(i_data_bus[1]), 
        .ZN(N288) );
  INVD1BWP30P140LVT U19 ( .I(i_data_bus[34]), .ZN(n14) );
  MOAI22D1BWP30P140LVT U20 ( .A1(n1), .A2(n14), .B1(n7), .B2(i_data_bus[2]), 
        .ZN(N289) );
  INVD1BWP30P140LVT U21 ( .I(i_data_bus[35]), .ZN(n15) );
  MOAI22D1BWP30P140LVT U22 ( .A1(n1), .A2(n15), .B1(n7), .B2(i_data_bus[3]), 
        .ZN(N290) );
  INVD1BWP30P140LVT U23 ( .I(i_data_bus[36]), .ZN(n16) );
  MOAI22D1BWP30P140LVT U24 ( .A1(n1), .A2(n16), .B1(n7), .B2(i_data_bus[4]), 
        .ZN(N291) );
  INVD1BWP30P140LVT U25 ( .I(i_data_bus[37]), .ZN(n17) );
  MOAI22D1BWP30P140LVT U26 ( .A1(n1), .A2(n17), .B1(n7), .B2(i_data_bus[5]), 
        .ZN(N292) );
  INVD1BWP30P140LVT U27 ( .I(i_data_bus[38]), .ZN(n18) );
  MOAI22D1BWP30P140LVT U28 ( .A1(n1), .A2(n18), .B1(n7), .B2(i_data_bus[6]), 
        .ZN(N293) );
  INVD1BWP30P140LVT U29 ( .I(i_data_bus[39]), .ZN(n19) );
  MOAI22D1BWP30P140LVT U30 ( .A1(n1), .A2(n19), .B1(n7), .B2(i_data_bus[7]), 
        .ZN(N294) );
  INVD1BWP30P140LVT U31 ( .I(i_data_bus[40]), .ZN(n20) );
  MOAI22D1BWP30P140LVT U32 ( .A1(n1), .A2(n20), .B1(n7), .B2(i_data_bus[8]), 
        .ZN(N295) );
  INVD1BWP30P140LVT U33 ( .I(i_data_bus[41]), .ZN(n21) );
  MOAI22D1BWP30P140LVT U34 ( .A1(n1), .A2(n21), .B1(n7), .B2(i_data_bus[9]), 
        .ZN(N296) );
  INVD1BWP30P140LVT U35 ( .I(i_data_bus[42]), .ZN(n22) );
  MOAI22D1BWP30P140LVT U36 ( .A1(n1), .A2(n22), .B1(n7), .B2(i_data_bus[10]), 
        .ZN(N297) );
  INVD1BWP30P140LVT U37 ( .I(i_data_bus[43]), .ZN(n23) );
  MOAI22D1BWP30P140LVT U38 ( .A1(n1), .A2(n23), .B1(n7), .B2(i_data_bus[11]), 
        .ZN(N298) );
  INVD1BWP30P140LVT U39 ( .I(i_data_bus[44]), .ZN(n24) );
  MOAI22D1BWP30P140LVT U40 ( .A1(n1), .A2(n24), .B1(n7), .B2(i_data_bus[12]), 
        .ZN(N299) );
  INVD1BWP30P140LVT U41 ( .I(i_data_bus[45]), .ZN(n25) );
  MOAI22D1BWP30P140LVT U42 ( .A1(n1), .A2(n25), .B1(n7), .B2(i_data_bus[13]), 
        .ZN(N300) );
  INVD1BWP30P140LVT U43 ( .I(i_data_bus[46]), .ZN(n26) );
  MOAI22D1BWP30P140LVT U44 ( .A1(n1), .A2(n26), .B1(n7), .B2(i_data_bus[14]), 
        .ZN(N301) );
  INVD1BWP30P140LVT U45 ( .I(i_data_bus[47]), .ZN(n27) );
  MOAI22D1BWP30P140LVT U46 ( .A1(n1), .A2(n27), .B1(n7), .B2(i_data_bus[15]), 
        .ZN(N302) );
  INVD1BWP30P140LVT U47 ( .I(i_data_bus[48]), .ZN(n28) );
  MOAI22D1BWP30P140LVT U48 ( .A1(n1), .A2(n28), .B1(n7), .B2(i_data_bus[16]), 
        .ZN(N303) );
  INVD1BWP30P140LVT U49 ( .I(i_data_bus[49]), .ZN(n29) );
  MOAI22D1BWP30P140LVT U50 ( .A1(n1), .A2(n29), .B1(n7), .B2(i_data_bus[17]), 
        .ZN(N304) );
  INVD1BWP30P140LVT U51 ( .I(i_data_bus[50]), .ZN(n30) );
  MOAI22D1BWP30P140LVT U52 ( .A1(n1), .A2(n30), .B1(n7), .B2(i_data_bus[18]), 
        .ZN(N305) );
  INVD1BWP30P140LVT U53 ( .I(i_data_bus[51]), .ZN(n31) );
  MOAI22D1BWP30P140LVT U54 ( .A1(n1), .A2(n31), .B1(n7), .B2(i_data_bus[19]), 
        .ZN(N306) );
  INVD1BWP30P140LVT U55 ( .I(i_data_bus[52]), .ZN(n32) );
  MOAI22D1BWP30P140LVT U56 ( .A1(n1), .A2(n32), .B1(n7), .B2(i_data_bus[20]), 
        .ZN(N307) );
  INVD1BWP30P140LVT U57 ( .I(i_data_bus[53]), .ZN(n33) );
  MOAI22D1BWP30P140LVT U58 ( .A1(n1), .A2(n33), .B1(n7), .B2(i_data_bus[21]), 
        .ZN(N308) );
  INVD1BWP30P140LVT U59 ( .I(i_data_bus[54]), .ZN(n34) );
  MOAI22D1BWP30P140LVT U60 ( .A1(n1), .A2(n34), .B1(n7), .B2(i_data_bus[22]), 
        .ZN(N309) );
  INVD1BWP30P140LVT U61 ( .I(i_data_bus[55]), .ZN(n35) );
  MOAI22D1BWP30P140LVT U62 ( .A1(n1), .A2(n35), .B1(n7), .B2(i_data_bus[23]), 
        .ZN(N310) );
  INVD1BWP30P140LVT U63 ( .I(i_data_bus[56]), .ZN(n36) );
  MOAI22D1BWP30P140LVT U64 ( .A1(n1), .A2(n36), .B1(n7), .B2(i_data_bus[24]), 
        .ZN(N311) );
  INVD1BWP30P140LVT U65 ( .I(i_data_bus[57]), .ZN(n37) );
  MOAI22D1BWP30P140LVT U66 ( .A1(n1), .A2(n37), .B1(n7), .B2(i_data_bus[25]), 
        .ZN(N312) );
  INVD1BWP30P140LVT U67 ( .I(i_data_bus[58]), .ZN(n38) );
  MOAI22D1BWP30P140LVT U68 ( .A1(n1), .A2(n38), .B1(n7), .B2(i_data_bus[26]), 
        .ZN(N313) );
  INVD1BWP30P140LVT U69 ( .I(i_data_bus[59]), .ZN(n39) );
  MOAI22D1BWP30P140LVT U70 ( .A1(n1), .A2(n39), .B1(n7), .B2(i_data_bus[27]), 
        .ZN(N314) );
  INVD1BWP30P140LVT U71 ( .I(i_data_bus[60]), .ZN(n40) );
  MOAI22D1BWP30P140LVT U72 ( .A1(n1), .A2(n40), .B1(n7), .B2(i_data_bus[28]), 
        .ZN(N315) );
  INVD1BWP30P140LVT U73 ( .I(i_data_bus[61]), .ZN(n41) );
  MOAI22D1BWP30P140LVT U74 ( .A1(n1), .A2(n41), .B1(n7), .B2(i_data_bus[29]), 
        .ZN(N316) );
  INVD1BWP30P140LVT U75 ( .I(i_data_bus[62]), .ZN(n42) );
  MOAI22D1BWP30P140LVT U76 ( .A1(n1), .A2(n42), .B1(n7), .B2(i_data_bus[30]), 
        .ZN(N317) );
  INVD1BWP30P140LVT U77 ( .I(i_data_bus[63]), .ZN(n45) );
  MOAI22D1BWP30P140LVT U78 ( .A1(n1), .A2(n45), .B1(n7), .B2(i_data_bus[31]), 
        .ZN(N318) );
  OAI21D1BWP30P140LVT U79 ( .A1(i_cmd[0]), .A2(i_valid[0]), .B(n8), .ZN(n9) );
  AO211D1BWP30P140LVT U80 ( .A1(i_cmd[0]), .A2(n10), .B(i_cmd[1]), .C(n9), .Z(
        n11) );
  INVD2BWP30P140LVT U81 ( .I(n11), .ZN(n43) );
  MOAI22D1BWP30P140LVT U82 ( .A1(n12), .A2(n44), .B1(i_data_bus[0]), .B2(n43), 
        .ZN(N319) );
  MOAI22D1BWP30P140LVT U83 ( .A1(n13), .A2(n44), .B1(i_data_bus[1]), .B2(n43), 
        .ZN(N320) );
  MOAI22D1BWP30P140LVT U84 ( .A1(n14), .A2(n44), .B1(i_data_bus[2]), .B2(n43), 
        .ZN(N321) );
  MOAI22D1BWP30P140LVT U85 ( .A1(n15), .A2(n44), .B1(i_data_bus[3]), .B2(n43), 
        .ZN(N322) );
  MOAI22D1BWP30P140LVT U86 ( .A1(n16), .A2(n44), .B1(i_data_bus[4]), .B2(n43), 
        .ZN(N323) );
  MOAI22D1BWP30P140LVT U87 ( .A1(n17), .A2(n44), .B1(i_data_bus[5]), .B2(n43), 
        .ZN(N324) );
  MOAI22D1BWP30P140LVT U88 ( .A1(n18), .A2(n44), .B1(i_data_bus[6]), .B2(n43), 
        .ZN(N325) );
  MOAI22D1BWP30P140LVT U89 ( .A1(n19), .A2(n44), .B1(i_data_bus[7]), .B2(n43), 
        .ZN(N326) );
  MOAI22D1BWP30P140LVT U90 ( .A1(n20), .A2(n44), .B1(i_data_bus[8]), .B2(n43), 
        .ZN(N327) );
  MOAI22D1BWP30P140LVT U91 ( .A1(n21), .A2(n44), .B1(i_data_bus[9]), .B2(n43), 
        .ZN(N328) );
  MOAI22D1BWP30P140LVT U92 ( .A1(n22), .A2(n44), .B1(i_data_bus[10]), .B2(n43), 
        .ZN(N329) );
  MOAI22D1BWP30P140LVT U93 ( .A1(n23), .A2(n44), .B1(i_data_bus[11]), .B2(n43), 
        .ZN(N330) );
  MOAI22D1BWP30P140LVT U94 ( .A1(n24), .A2(n44), .B1(i_data_bus[12]), .B2(n43), 
        .ZN(N331) );
  MOAI22D1BWP30P140LVT U95 ( .A1(n25), .A2(n44), .B1(i_data_bus[13]), .B2(n43), 
        .ZN(N332) );
  MOAI22D1BWP30P140LVT U96 ( .A1(n26), .A2(n44), .B1(i_data_bus[14]), .B2(n43), 
        .ZN(N333) );
  MOAI22D1BWP30P140LVT U97 ( .A1(n27), .A2(n44), .B1(i_data_bus[15]), .B2(n43), 
        .ZN(N334) );
  MOAI22D1BWP30P140LVT U98 ( .A1(n28), .A2(n44), .B1(i_data_bus[16]), .B2(n43), 
        .ZN(N335) );
  MOAI22D1BWP30P140LVT U99 ( .A1(n29), .A2(n44), .B1(i_data_bus[17]), .B2(n43), 
        .ZN(N336) );
  MOAI22D1BWP30P140LVT U100 ( .A1(n30), .A2(n44), .B1(i_data_bus[18]), .B2(n43), .ZN(N337) );
  MOAI22D1BWP30P140LVT U101 ( .A1(n31), .A2(n44), .B1(i_data_bus[19]), .B2(n43), .ZN(N338) );
  MOAI22D1BWP30P140LVT U102 ( .A1(n32), .A2(n44), .B1(i_data_bus[20]), .B2(n43), .ZN(N339) );
  MOAI22D1BWP30P140LVT U103 ( .A1(n33), .A2(n44), .B1(i_data_bus[21]), .B2(n43), .ZN(N340) );
  MOAI22D1BWP30P140LVT U104 ( .A1(n34), .A2(n44), .B1(i_data_bus[22]), .B2(n43), .ZN(N341) );
  MOAI22D1BWP30P140LVT U105 ( .A1(n35), .A2(n44), .B1(i_data_bus[23]), .B2(n43), .ZN(N342) );
  MOAI22D1BWP30P140LVT U106 ( .A1(n36), .A2(n44), .B1(i_data_bus[24]), .B2(n43), .ZN(N343) );
  MOAI22D1BWP30P140LVT U107 ( .A1(n37), .A2(n44), .B1(i_data_bus[25]), .B2(n43), .ZN(N344) );
  MOAI22D1BWP30P140LVT U108 ( .A1(n38), .A2(n44), .B1(i_data_bus[26]), .B2(n43), .ZN(N345) );
  MOAI22D1BWP30P140LVT U109 ( .A1(n39), .A2(n44), .B1(i_data_bus[27]), .B2(n43), .ZN(N346) );
  MOAI22D1BWP30P140LVT U110 ( .A1(n40), .A2(n44), .B1(i_data_bus[28]), .B2(n43), .ZN(N347) );
  MOAI22D1BWP30P140LVT U111 ( .A1(n41), .A2(n44), .B1(i_data_bus[29]), .B2(n43), .ZN(N348) );
  MOAI22D1BWP30P140LVT U112 ( .A1(n42), .A2(n44), .B1(i_data_bus[30]), .B2(n43), .ZN(N349) );
  MOAI22D1BWP30P140LVT U113 ( .A1(n45), .A2(n44), .B1(i_data_bus[31]), .B2(n43), .ZN(N350) );
endmodule


module distribute_2x2_simple_seq_DATA_WIDTH32_COMMAND_WIDTH2_14 ( clk, rst, 
        i_valid, i_data_bus, o_valid, o_data_bus, i_en, i_cmd );
  input [1:0] i_valid;
  input [63:0] i_data_bus;
  output [1:0] o_valid;
  output [63:0] o_data_bus;
  input [1:0] i_cmd;
  input clk, rst, i_en;
  wire   N287, N288, N289, N290, N291, N292, N293, N294, N295, N296, N297,
         N298, N299, N300, N301, N302, N303, N304, N305, N306, N307, N308,
         N309, N310, N311, N312, N313, N314, N315, N316, N317, N318, N319,
         N320, N321, N322, N323, N324, N325, N326, N327, N328, N329, N330,
         N331, N332, N333, N334, N335, N336, N337, N338, N339, N340, N341,
         N342, N343, N344, N345, N346, N347, N348, N349, N350, N353, N354, n1,
         n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30,
         n31, n32, n33, n34, n35, n36, n37, n38, n39, n40, n41, n42, n43, n44,
         n45;

  DFQD1BWP30P140LVT o_data_bus_inner_reg_63_ ( .D(N350), .CP(clk), .Q(
        o_data_bus[63]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_62_ ( .D(N349), .CP(clk), .Q(
        o_data_bus[62]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_61_ ( .D(N348), .CP(clk), .Q(
        o_data_bus[61]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_60_ ( .D(N347), .CP(clk), .Q(
        o_data_bus[60]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_59_ ( .D(N346), .CP(clk), .Q(
        o_data_bus[59]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_58_ ( .D(N345), .CP(clk), .Q(
        o_data_bus[58]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_57_ ( .D(N344), .CP(clk), .Q(
        o_data_bus[57]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_56_ ( .D(N343), .CP(clk), .Q(
        o_data_bus[56]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_55_ ( .D(N342), .CP(clk), .Q(
        o_data_bus[55]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_54_ ( .D(N341), .CP(clk), .Q(
        o_data_bus[54]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_53_ ( .D(N340), .CP(clk), .Q(
        o_data_bus[53]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_52_ ( .D(N339), .CP(clk), .Q(
        o_data_bus[52]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_51_ ( .D(N338), .CP(clk), .Q(
        o_data_bus[51]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_50_ ( .D(N337), .CP(clk), .Q(
        o_data_bus[50]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_49_ ( .D(N336), .CP(clk), .Q(
        o_data_bus[49]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_48_ ( .D(N335), .CP(clk), .Q(
        o_data_bus[48]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_47_ ( .D(N334), .CP(clk), .Q(
        o_data_bus[47]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_46_ ( .D(N333), .CP(clk), .Q(
        o_data_bus[46]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_45_ ( .D(N332), .CP(clk), .Q(
        o_data_bus[45]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_44_ ( .D(N331), .CP(clk), .Q(
        o_data_bus[44]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_43_ ( .D(N330), .CP(clk), .Q(
        o_data_bus[43]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_42_ ( .D(N329), .CP(clk), .Q(
        o_data_bus[42]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_41_ ( .D(N328), .CP(clk), .Q(
        o_data_bus[41]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_40_ ( .D(N327), .CP(clk), .Q(
        o_data_bus[40]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_39_ ( .D(N326), .CP(clk), .Q(
        o_data_bus[39]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_38_ ( .D(N325), .CP(clk), .Q(
        o_data_bus[38]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_37_ ( .D(N324), .CP(clk), .Q(
        o_data_bus[37]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_36_ ( .D(N323), .CP(clk), .Q(
        o_data_bus[36]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_35_ ( .D(N322), .CP(clk), .Q(
        o_data_bus[35]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_34_ ( .D(N321), .CP(clk), .Q(
        o_data_bus[34]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_33_ ( .D(N320), .CP(clk), .Q(
        o_data_bus[33]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_32_ ( .D(N319), .CP(clk), .Q(
        o_data_bus[32]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_31_ ( .D(N318), .CP(clk), .Q(
        o_data_bus[31]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_30_ ( .D(N317), .CP(clk), .Q(
        o_data_bus[30]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_29_ ( .D(N316), .CP(clk), .Q(
        o_data_bus[29]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_28_ ( .D(N315), .CP(clk), .Q(
        o_data_bus[28]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_27_ ( .D(N314), .CP(clk), .Q(
        o_data_bus[27]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_26_ ( .D(N313), .CP(clk), .Q(
        o_data_bus[26]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_25_ ( .D(N312), .CP(clk), .Q(
        o_data_bus[25]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_24_ ( .D(N311), .CP(clk), .Q(
        o_data_bus[24]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_23_ ( .D(N310), .CP(clk), .Q(
        o_data_bus[23]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_22_ ( .D(N309), .CP(clk), .Q(
        o_data_bus[22]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_21_ ( .D(N308), .CP(clk), .Q(
        o_data_bus[21]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_20_ ( .D(N307), .CP(clk), .Q(
        o_data_bus[20]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_19_ ( .D(N306), .CP(clk), .Q(
        o_data_bus[19]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_18_ ( .D(N305), .CP(clk), .Q(
        o_data_bus[18]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_17_ ( .D(N304), .CP(clk), .Q(
        o_data_bus[17]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_16_ ( .D(N303), .CP(clk), .Q(
        o_data_bus[16]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_15_ ( .D(N302), .CP(clk), .Q(
        o_data_bus[15]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_14_ ( .D(N301), .CP(clk), .Q(
        o_data_bus[14]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_13_ ( .D(N300), .CP(clk), .Q(
        o_data_bus[13]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_12_ ( .D(N299), .CP(clk), .Q(
        o_data_bus[12]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_11_ ( .D(N298), .CP(clk), .Q(
        o_data_bus[11]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_10_ ( .D(N297), .CP(clk), .Q(
        o_data_bus[10]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_9_ ( .D(N296), .CP(clk), .Q(
        o_data_bus[9]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_8_ ( .D(N295), .CP(clk), .Q(
        o_data_bus[8]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_7_ ( .D(N294), .CP(clk), .Q(
        o_data_bus[7]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_6_ ( .D(N293), .CP(clk), .Q(
        o_data_bus[6]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_5_ ( .D(N292), .CP(clk), .Q(
        o_data_bus[5]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_4_ ( .D(N291), .CP(clk), .Q(
        o_data_bus[4]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_3_ ( .D(N290), .CP(clk), .Q(
        o_data_bus[3]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_2_ ( .D(N289), .CP(clk), .Q(
        o_data_bus[2]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_1_ ( .D(N288), .CP(clk), .Q(
        o_data_bus[1]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_0_ ( .D(N287), .CP(clk), .Q(
        o_data_bus[0]) );
  DFQD1BWP30P140LVT o_valid_inner_reg_1_ ( .D(N354), .CP(clk), .Q(o_valid[1])
         );
  DFQD1BWP30P140LVT o_valid_inner_reg_0_ ( .D(N353), .CP(clk), .Q(o_valid[0])
         );
  ND2OPTIBD1BWP30P140LVT U3 ( .A1(n8), .A2(i_valid[0]), .ZN(n3) );
  INVD1BWP30P140LVT U4 ( .I(i_valid[1]), .ZN(n10) );
  BUFFD2BWP30P140LVT U5 ( .I(n6), .Z(n1) );
  OAI211D1BWP30P140LVT U6 ( .A1(i_cmd[1]), .A2(i_valid[0]), .B(i_cmd[0]), .C(
        n5), .ZN(n6) );
  INR2D1BWP30P140LVT U7 ( .A1(i_en), .B1(rst), .ZN(n8) );
  NR2OPTPAD1BWP30P140LVT U8 ( .A1(i_cmd[0]), .A2(n3), .ZN(n7) );
  AOI31D1BWP30P140LVT U9 ( .A1(i_cmd[0]), .A2(n8), .A3(i_valid[1]), .B(n7), 
        .ZN(n2) );
  INVD1BWP30P140LVT U10 ( .I(n2), .ZN(N353) );
  ND3D2BWP30P140LVT U11 ( .A1(n8), .A2(i_cmd[1]), .A3(i_valid[1]), .ZN(n44) );
  OAI21D1BWP30P140LVT U12 ( .A1(i_cmd[1]), .A2(n3), .B(n44), .ZN(N354) );
  INVD1BWP30P140LVT U13 ( .I(i_data_bus[32]), .ZN(n12) );
  INVD1BWP30P140LVT U14 ( .I(n8), .ZN(n4) );
  AOI21D1BWP30P140LVT U15 ( .A1(i_cmd[1]), .A2(n10), .B(n4), .ZN(n5) );
  MOAI22D1BWP30P140LVT U16 ( .A1(n12), .A2(n6), .B1(i_data_bus[0]), .B2(n7), 
        .ZN(N287) );
  INVD1BWP30P140LVT U17 ( .I(i_data_bus[33]), .ZN(n13) );
  MOAI22D1BWP30P140LVT U18 ( .A1(n1), .A2(n13), .B1(n7), .B2(i_data_bus[1]), 
        .ZN(N288) );
  INVD1BWP30P140LVT U19 ( .I(i_data_bus[34]), .ZN(n14) );
  MOAI22D1BWP30P140LVT U20 ( .A1(n1), .A2(n14), .B1(n7), .B2(i_data_bus[2]), 
        .ZN(N289) );
  INVD1BWP30P140LVT U21 ( .I(i_data_bus[35]), .ZN(n15) );
  MOAI22D1BWP30P140LVT U22 ( .A1(n1), .A2(n15), .B1(n7), .B2(i_data_bus[3]), 
        .ZN(N290) );
  INVD1BWP30P140LVT U23 ( .I(i_data_bus[36]), .ZN(n16) );
  MOAI22D1BWP30P140LVT U24 ( .A1(n1), .A2(n16), .B1(n7), .B2(i_data_bus[4]), 
        .ZN(N291) );
  INVD1BWP30P140LVT U25 ( .I(i_data_bus[37]), .ZN(n17) );
  MOAI22D1BWP30P140LVT U26 ( .A1(n1), .A2(n17), .B1(n7), .B2(i_data_bus[5]), 
        .ZN(N292) );
  INVD1BWP30P140LVT U27 ( .I(i_data_bus[38]), .ZN(n18) );
  MOAI22D1BWP30P140LVT U28 ( .A1(n1), .A2(n18), .B1(n7), .B2(i_data_bus[6]), 
        .ZN(N293) );
  INVD1BWP30P140LVT U29 ( .I(i_data_bus[39]), .ZN(n19) );
  MOAI22D1BWP30P140LVT U30 ( .A1(n1), .A2(n19), .B1(n7), .B2(i_data_bus[7]), 
        .ZN(N294) );
  INVD1BWP30P140LVT U31 ( .I(i_data_bus[40]), .ZN(n20) );
  MOAI22D1BWP30P140LVT U32 ( .A1(n1), .A2(n20), .B1(n7), .B2(i_data_bus[8]), 
        .ZN(N295) );
  INVD1BWP30P140LVT U33 ( .I(i_data_bus[41]), .ZN(n21) );
  MOAI22D1BWP30P140LVT U34 ( .A1(n1), .A2(n21), .B1(n7), .B2(i_data_bus[9]), 
        .ZN(N296) );
  INVD1BWP30P140LVT U35 ( .I(i_data_bus[42]), .ZN(n22) );
  MOAI22D1BWP30P140LVT U36 ( .A1(n1), .A2(n22), .B1(n7), .B2(i_data_bus[10]), 
        .ZN(N297) );
  INVD1BWP30P140LVT U37 ( .I(i_data_bus[43]), .ZN(n23) );
  MOAI22D1BWP30P140LVT U38 ( .A1(n1), .A2(n23), .B1(n7), .B2(i_data_bus[11]), 
        .ZN(N298) );
  INVD1BWP30P140LVT U39 ( .I(i_data_bus[44]), .ZN(n24) );
  MOAI22D1BWP30P140LVT U40 ( .A1(n1), .A2(n24), .B1(n7), .B2(i_data_bus[12]), 
        .ZN(N299) );
  INVD1BWP30P140LVT U41 ( .I(i_data_bus[45]), .ZN(n25) );
  MOAI22D1BWP30P140LVT U42 ( .A1(n1), .A2(n25), .B1(n7), .B2(i_data_bus[13]), 
        .ZN(N300) );
  INVD1BWP30P140LVT U43 ( .I(i_data_bus[46]), .ZN(n26) );
  MOAI22D1BWP30P140LVT U44 ( .A1(n1), .A2(n26), .B1(n7), .B2(i_data_bus[14]), 
        .ZN(N301) );
  INVD1BWP30P140LVT U45 ( .I(i_data_bus[47]), .ZN(n27) );
  MOAI22D1BWP30P140LVT U46 ( .A1(n1), .A2(n27), .B1(n7), .B2(i_data_bus[15]), 
        .ZN(N302) );
  INVD1BWP30P140LVT U47 ( .I(i_data_bus[48]), .ZN(n28) );
  MOAI22D1BWP30P140LVT U48 ( .A1(n1), .A2(n28), .B1(n7), .B2(i_data_bus[16]), 
        .ZN(N303) );
  INVD1BWP30P140LVT U49 ( .I(i_data_bus[49]), .ZN(n29) );
  MOAI22D1BWP30P140LVT U50 ( .A1(n1), .A2(n29), .B1(n7), .B2(i_data_bus[17]), 
        .ZN(N304) );
  INVD1BWP30P140LVT U51 ( .I(i_data_bus[50]), .ZN(n30) );
  MOAI22D1BWP30P140LVT U52 ( .A1(n1), .A2(n30), .B1(n7), .B2(i_data_bus[18]), 
        .ZN(N305) );
  INVD1BWP30P140LVT U53 ( .I(i_data_bus[51]), .ZN(n31) );
  MOAI22D1BWP30P140LVT U54 ( .A1(n1), .A2(n31), .B1(n7), .B2(i_data_bus[19]), 
        .ZN(N306) );
  INVD1BWP30P140LVT U55 ( .I(i_data_bus[52]), .ZN(n32) );
  MOAI22D1BWP30P140LVT U56 ( .A1(n1), .A2(n32), .B1(n7), .B2(i_data_bus[20]), 
        .ZN(N307) );
  INVD1BWP30P140LVT U57 ( .I(i_data_bus[53]), .ZN(n33) );
  MOAI22D1BWP30P140LVT U58 ( .A1(n1), .A2(n33), .B1(n7), .B2(i_data_bus[21]), 
        .ZN(N308) );
  INVD1BWP30P140LVT U59 ( .I(i_data_bus[54]), .ZN(n34) );
  MOAI22D1BWP30P140LVT U60 ( .A1(n1), .A2(n34), .B1(n7), .B2(i_data_bus[22]), 
        .ZN(N309) );
  INVD1BWP30P140LVT U61 ( .I(i_data_bus[55]), .ZN(n35) );
  MOAI22D1BWP30P140LVT U62 ( .A1(n1), .A2(n35), .B1(n7), .B2(i_data_bus[23]), 
        .ZN(N310) );
  INVD1BWP30P140LVT U63 ( .I(i_data_bus[56]), .ZN(n36) );
  MOAI22D1BWP30P140LVT U64 ( .A1(n1), .A2(n36), .B1(n7), .B2(i_data_bus[24]), 
        .ZN(N311) );
  INVD1BWP30P140LVT U65 ( .I(i_data_bus[57]), .ZN(n37) );
  MOAI22D1BWP30P140LVT U66 ( .A1(n1), .A2(n37), .B1(n7), .B2(i_data_bus[25]), 
        .ZN(N312) );
  INVD1BWP30P140LVT U67 ( .I(i_data_bus[58]), .ZN(n38) );
  MOAI22D1BWP30P140LVT U68 ( .A1(n1), .A2(n38), .B1(n7), .B2(i_data_bus[26]), 
        .ZN(N313) );
  INVD1BWP30P140LVT U69 ( .I(i_data_bus[59]), .ZN(n39) );
  MOAI22D1BWP30P140LVT U70 ( .A1(n1), .A2(n39), .B1(n7), .B2(i_data_bus[27]), 
        .ZN(N314) );
  INVD1BWP30P140LVT U71 ( .I(i_data_bus[60]), .ZN(n40) );
  MOAI22D1BWP30P140LVT U72 ( .A1(n1), .A2(n40), .B1(n7), .B2(i_data_bus[28]), 
        .ZN(N315) );
  INVD1BWP30P140LVT U73 ( .I(i_data_bus[61]), .ZN(n41) );
  MOAI22D1BWP30P140LVT U74 ( .A1(n1), .A2(n41), .B1(n7), .B2(i_data_bus[29]), 
        .ZN(N316) );
  INVD1BWP30P140LVT U75 ( .I(i_data_bus[62]), .ZN(n42) );
  MOAI22D1BWP30P140LVT U76 ( .A1(n1), .A2(n42), .B1(n7), .B2(i_data_bus[30]), 
        .ZN(N317) );
  INVD1BWP30P140LVT U77 ( .I(i_data_bus[63]), .ZN(n45) );
  MOAI22D1BWP30P140LVT U78 ( .A1(n1), .A2(n45), .B1(n7), .B2(i_data_bus[31]), 
        .ZN(N318) );
  OAI21D1BWP30P140LVT U79 ( .A1(i_cmd[0]), .A2(i_valid[0]), .B(n8), .ZN(n9) );
  AO211D1BWP30P140LVT U80 ( .A1(i_cmd[0]), .A2(n10), .B(i_cmd[1]), .C(n9), .Z(
        n11) );
  INVD2BWP30P140LVT U81 ( .I(n11), .ZN(n43) );
  MOAI22D1BWP30P140LVT U82 ( .A1(n12), .A2(n44), .B1(i_data_bus[0]), .B2(n43), 
        .ZN(N319) );
  MOAI22D1BWP30P140LVT U83 ( .A1(n13), .A2(n44), .B1(i_data_bus[1]), .B2(n43), 
        .ZN(N320) );
  MOAI22D1BWP30P140LVT U84 ( .A1(n14), .A2(n44), .B1(i_data_bus[2]), .B2(n43), 
        .ZN(N321) );
  MOAI22D1BWP30P140LVT U85 ( .A1(n15), .A2(n44), .B1(i_data_bus[3]), .B2(n43), 
        .ZN(N322) );
  MOAI22D1BWP30P140LVT U86 ( .A1(n16), .A2(n44), .B1(i_data_bus[4]), .B2(n43), 
        .ZN(N323) );
  MOAI22D1BWP30P140LVT U87 ( .A1(n17), .A2(n44), .B1(i_data_bus[5]), .B2(n43), 
        .ZN(N324) );
  MOAI22D1BWP30P140LVT U88 ( .A1(n18), .A2(n44), .B1(i_data_bus[6]), .B2(n43), 
        .ZN(N325) );
  MOAI22D1BWP30P140LVT U89 ( .A1(n19), .A2(n44), .B1(i_data_bus[7]), .B2(n43), 
        .ZN(N326) );
  MOAI22D1BWP30P140LVT U90 ( .A1(n20), .A2(n44), .B1(i_data_bus[8]), .B2(n43), 
        .ZN(N327) );
  MOAI22D1BWP30P140LVT U91 ( .A1(n21), .A2(n44), .B1(i_data_bus[9]), .B2(n43), 
        .ZN(N328) );
  MOAI22D1BWP30P140LVT U92 ( .A1(n22), .A2(n44), .B1(i_data_bus[10]), .B2(n43), 
        .ZN(N329) );
  MOAI22D1BWP30P140LVT U93 ( .A1(n23), .A2(n44), .B1(i_data_bus[11]), .B2(n43), 
        .ZN(N330) );
  MOAI22D1BWP30P140LVT U94 ( .A1(n24), .A2(n44), .B1(i_data_bus[12]), .B2(n43), 
        .ZN(N331) );
  MOAI22D1BWP30P140LVT U95 ( .A1(n25), .A2(n44), .B1(i_data_bus[13]), .B2(n43), 
        .ZN(N332) );
  MOAI22D1BWP30P140LVT U96 ( .A1(n26), .A2(n44), .B1(i_data_bus[14]), .B2(n43), 
        .ZN(N333) );
  MOAI22D1BWP30P140LVT U97 ( .A1(n27), .A2(n44), .B1(i_data_bus[15]), .B2(n43), 
        .ZN(N334) );
  MOAI22D1BWP30P140LVT U98 ( .A1(n28), .A2(n44), .B1(i_data_bus[16]), .B2(n43), 
        .ZN(N335) );
  MOAI22D1BWP30P140LVT U99 ( .A1(n29), .A2(n44), .B1(i_data_bus[17]), .B2(n43), 
        .ZN(N336) );
  MOAI22D1BWP30P140LVT U100 ( .A1(n30), .A2(n44), .B1(i_data_bus[18]), .B2(n43), .ZN(N337) );
  MOAI22D1BWP30P140LVT U101 ( .A1(n31), .A2(n44), .B1(i_data_bus[19]), .B2(n43), .ZN(N338) );
  MOAI22D1BWP30P140LVT U102 ( .A1(n32), .A2(n44), .B1(i_data_bus[20]), .B2(n43), .ZN(N339) );
  MOAI22D1BWP30P140LVT U103 ( .A1(n33), .A2(n44), .B1(i_data_bus[21]), .B2(n43), .ZN(N340) );
  MOAI22D1BWP30P140LVT U104 ( .A1(n34), .A2(n44), .B1(i_data_bus[22]), .B2(n43), .ZN(N341) );
  MOAI22D1BWP30P140LVT U105 ( .A1(n35), .A2(n44), .B1(i_data_bus[23]), .B2(n43), .ZN(N342) );
  MOAI22D1BWP30P140LVT U106 ( .A1(n36), .A2(n44), .B1(i_data_bus[24]), .B2(n43), .ZN(N343) );
  MOAI22D1BWP30P140LVT U107 ( .A1(n37), .A2(n44), .B1(i_data_bus[25]), .B2(n43), .ZN(N344) );
  MOAI22D1BWP30P140LVT U108 ( .A1(n38), .A2(n44), .B1(i_data_bus[26]), .B2(n43), .ZN(N345) );
  MOAI22D1BWP30P140LVT U109 ( .A1(n39), .A2(n44), .B1(i_data_bus[27]), .B2(n43), .ZN(N346) );
  MOAI22D1BWP30P140LVT U110 ( .A1(n40), .A2(n44), .B1(i_data_bus[28]), .B2(n43), .ZN(N347) );
  MOAI22D1BWP30P140LVT U111 ( .A1(n41), .A2(n44), .B1(i_data_bus[29]), .B2(n43), .ZN(N348) );
  MOAI22D1BWP30P140LVT U112 ( .A1(n42), .A2(n44), .B1(i_data_bus[30]), .B2(n43), .ZN(N349) );
  MOAI22D1BWP30P140LVT U113 ( .A1(n45), .A2(n44), .B1(i_data_bus[31]), .B2(n43), .ZN(N350) );
endmodule


module distribute_2x2_simple_seq_DATA_WIDTH32_COMMAND_WIDTH2_15 ( clk, rst, 
        i_valid, i_data_bus, o_valid, o_data_bus, i_en, i_cmd );
  input [1:0] i_valid;
  input [63:0] i_data_bus;
  output [1:0] o_valid;
  output [63:0] o_data_bus;
  input [1:0] i_cmd;
  input clk, rst, i_en;
  wire   N287, N288, N289, N290, N291, N292, N293, N294, N295, N296, N297,
         N298, N299, N300, N301, N302, N303, N304, N305, N306, N307, N308,
         N309, N310, N311, N312, N313, N314, N315, N316, N317, N318, N319,
         N320, N321, N322, N323, N324, N325, N326, N327, N328, N329, N330,
         N331, N332, N333, N334, N335, N336, N337, N338, N339, N340, N341,
         N342, N343, N344, N345, N346, N347, N348, N349, N350, N353, N354, n1,
         n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30,
         n31, n32, n33, n34, n35, n36, n37, n38, n39, n40, n41, n42, n43, n44,
         n45;

  DFQD1BWP30P140LVT o_data_bus_inner_reg_63_ ( .D(N350), .CP(clk), .Q(
        o_data_bus[63]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_62_ ( .D(N349), .CP(clk), .Q(
        o_data_bus[62]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_61_ ( .D(N348), .CP(clk), .Q(
        o_data_bus[61]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_60_ ( .D(N347), .CP(clk), .Q(
        o_data_bus[60]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_59_ ( .D(N346), .CP(clk), .Q(
        o_data_bus[59]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_58_ ( .D(N345), .CP(clk), .Q(
        o_data_bus[58]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_57_ ( .D(N344), .CP(clk), .Q(
        o_data_bus[57]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_56_ ( .D(N343), .CP(clk), .Q(
        o_data_bus[56]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_55_ ( .D(N342), .CP(clk), .Q(
        o_data_bus[55]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_54_ ( .D(N341), .CP(clk), .Q(
        o_data_bus[54]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_53_ ( .D(N340), .CP(clk), .Q(
        o_data_bus[53]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_52_ ( .D(N339), .CP(clk), .Q(
        o_data_bus[52]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_51_ ( .D(N338), .CP(clk), .Q(
        o_data_bus[51]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_50_ ( .D(N337), .CP(clk), .Q(
        o_data_bus[50]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_49_ ( .D(N336), .CP(clk), .Q(
        o_data_bus[49]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_48_ ( .D(N335), .CP(clk), .Q(
        o_data_bus[48]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_47_ ( .D(N334), .CP(clk), .Q(
        o_data_bus[47]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_46_ ( .D(N333), .CP(clk), .Q(
        o_data_bus[46]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_45_ ( .D(N332), .CP(clk), .Q(
        o_data_bus[45]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_44_ ( .D(N331), .CP(clk), .Q(
        o_data_bus[44]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_43_ ( .D(N330), .CP(clk), .Q(
        o_data_bus[43]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_42_ ( .D(N329), .CP(clk), .Q(
        o_data_bus[42]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_41_ ( .D(N328), .CP(clk), .Q(
        o_data_bus[41]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_40_ ( .D(N327), .CP(clk), .Q(
        o_data_bus[40]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_39_ ( .D(N326), .CP(clk), .Q(
        o_data_bus[39]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_38_ ( .D(N325), .CP(clk), .Q(
        o_data_bus[38]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_37_ ( .D(N324), .CP(clk), .Q(
        o_data_bus[37]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_36_ ( .D(N323), .CP(clk), .Q(
        o_data_bus[36]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_35_ ( .D(N322), .CP(clk), .Q(
        o_data_bus[35]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_34_ ( .D(N321), .CP(clk), .Q(
        o_data_bus[34]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_33_ ( .D(N320), .CP(clk), .Q(
        o_data_bus[33]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_32_ ( .D(N319), .CP(clk), .Q(
        o_data_bus[32]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_31_ ( .D(N318), .CP(clk), .Q(
        o_data_bus[31]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_30_ ( .D(N317), .CP(clk), .Q(
        o_data_bus[30]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_29_ ( .D(N316), .CP(clk), .Q(
        o_data_bus[29]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_28_ ( .D(N315), .CP(clk), .Q(
        o_data_bus[28]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_27_ ( .D(N314), .CP(clk), .Q(
        o_data_bus[27]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_26_ ( .D(N313), .CP(clk), .Q(
        o_data_bus[26]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_25_ ( .D(N312), .CP(clk), .Q(
        o_data_bus[25]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_24_ ( .D(N311), .CP(clk), .Q(
        o_data_bus[24]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_23_ ( .D(N310), .CP(clk), .Q(
        o_data_bus[23]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_22_ ( .D(N309), .CP(clk), .Q(
        o_data_bus[22]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_21_ ( .D(N308), .CP(clk), .Q(
        o_data_bus[21]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_20_ ( .D(N307), .CP(clk), .Q(
        o_data_bus[20]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_19_ ( .D(N306), .CP(clk), .Q(
        o_data_bus[19]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_18_ ( .D(N305), .CP(clk), .Q(
        o_data_bus[18]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_17_ ( .D(N304), .CP(clk), .Q(
        o_data_bus[17]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_16_ ( .D(N303), .CP(clk), .Q(
        o_data_bus[16]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_15_ ( .D(N302), .CP(clk), .Q(
        o_data_bus[15]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_14_ ( .D(N301), .CP(clk), .Q(
        o_data_bus[14]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_13_ ( .D(N300), .CP(clk), .Q(
        o_data_bus[13]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_12_ ( .D(N299), .CP(clk), .Q(
        o_data_bus[12]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_11_ ( .D(N298), .CP(clk), .Q(
        o_data_bus[11]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_10_ ( .D(N297), .CP(clk), .Q(
        o_data_bus[10]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_9_ ( .D(N296), .CP(clk), .Q(
        o_data_bus[9]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_8_ ( .D(N295), .CP(clk), .Q(
        o_data_bus[8]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_7_ ( .D(N294), .CP(clk), .Q(
        o_data_bus[7]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_6_ ( .D(N293), .CP(clk), .Q(
        o_data_bus[6]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_5_ ( .D(N292), .CP(clk), .Q(
        o_data_bus[5]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_4_ ( .D(N291), .CP(clk), .Q(
        o_data_bus[4]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_3_ ( .D(N290), .CP(clk), .Q(
        o_data_bus[3]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_2_ ( .D(N289), .CP(clk), .Q(
        o_data_bus[2]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_1_ ( .D(N288), .CP(clk), .Q(
        o_data_bus[1]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_0_ ( .D(N287), .CP(clk), .Q(
        o_data_bus[0]) );
  DFQD1BWP30P140LVT o_valid_inner_reg_1_ ( .D(N354), .CP(clk), .Q(o_valid[1])
         );
  DFQD1BWP30P140LVT o_valid_inner_reg_0_ ( .D(N353), .CP(clk), .Q(o_valid[0])
         );
  ND2OPTIBD1BWP30P140LVT U3 ( .A1(n8), .A2(i_valid[0]), .ZN(n3) );
  INVD1BWP30P140LVT U4 ( .I(i_valid[1]), .ZN(n10) );
  BUFFD2BWP30P140LVT U5 ( .I(n6), .Z(n1) );
  OAI211D1BWP30P140LVT U6 ( .A1(i_cmd[1]), .A2(i_valid[0]), .B(i_cmd[0]), .C(
        n5), .ZN(n6) );
  INR2D1BWP30P140LVT U7 ( .A1(i_en), .B1(rst), .ZN(n8) );
  NR2OPTPAD1BWP30P140LVT U8 ( .A1(i_cmd[0]), .A2(n3), .ZN(n7) );
  AOI31D1BWP30P140LVT U9 ( .A1(i_cmd[0]), .A2(n8), .A3(i_valid[1]), .B(n7), 
        .ZN(n2) );
  INVD1BWP30P140LVT U10 ( .I(n2), .ZN(N353) );
  ND3D2BWP30P140LVT U11 ( .A1(n8), .A2(i_cmd[1]), .A3(i_valid[1]), .ZN(n44) );
  OAI21D1BWP30P140LVT U12 ( .A1(i_cmd[1]), .A2(n3), .B(n44), .ZN(N354) );
  INVD1BWP30P140LVT U13 ( .I(i_data_bus[32]), .ZN(n12) );
  INVD1BWP30P140LVT U14 ( .I(n8), .ZN(n4) );
  AOI21D1BWP30P140LVT U15 ( .A1(i_cmd[1]), .A2(n10), .B(n4), .ZN(n5) );
  MOAI22D1BWP30P140LVT U16 ( .A1(n12), .A2(n6), .B1(i_data_bus[0]), .B2(n7), 
        .ZN(N287) );
  INVD1BWP30P140LVT U17 ( .I(i_data_bus[33]), .ZN(n13) );
  MOAI22D1BWP30P140LVT U18 ( .A1(n1), .A2(n13), .B1(n7), .B2(i_data_bus[1]), 
        .ZN(N288) );
  INVD1BWP30P140LVT U19 ( .I(i_data_bus[34]), .ZN(n14) );
  MOAI22D1BWP30P140LVT U20 ( .A1(n1), .A2(n14), .B1(n7), .B2(i_data_bus[2]), 
        .ZN(N289) );
  INVD1BWP30P140LVT U21 ( .I(i_data_bus[35]), .ZN(n15) );
  MOAI22D1BWP30P140LVT U22 ( .A1(n1), .A2(n15), .B1(n7), .B2(i_data_bus[3]), 
        .ZN(N290) );
  INVD1BWP30P140LVT U23 ( .I(i_data_bus[36]), .ZN(n16) );
  MOAI22D1BWP30P140LVT U24 ( .A1(n1), .A2(n16), .B1(n7), .B2(i_data_bus[4]), 
        .ZN(N291) );
  INVD1BWP30P140LVT U25 ( .I(i_data_bus[37]), .ZN(n17) );
  MOAI22D1BWP30P140LVT U26 ( .A1(n1), .A2(n17), .B1(n7), .B2(i_data_bus[5]), 
        .ZN(N292) );
  INVD1BWP30P140LVT U27 ( .I(i_data_bus[38]), .ZN(n18) );
  MOAI22D1BWP30P140LVT U28 ( .A1(n1), .A2(n18), .B1(n7), .B2(i_data_bus[6]), 
        .ZN(N293) );
  INVD1BWP30P140LVT U29 ( .I(i_data_bus[39]), .ZN(n19) );
  MOAI22D1BWP30P140LVT U30 ( .A1(n1), .A2(n19), .B1(n7), .B2(i_data_bus[7]), 
        .ZN(N294) );
  INVD1BWP30P140LVT U31 ( .I(i_data_bus[40]), .ZN(n20) );
  MOAI22D1BWP30P140LVT U32 ( .A1(n1), .A2(n20), .B1(n7), .B2(i_data_bus[8]), 
        .ZN(N295) );
  INVD1BWP30P140LVT U33 ( .I(i_data_bus[41]), .ZN(n21) );
  MOAI22D1BWP30P140LVT U34 ( .A1(n1), .A2(n21), .B1(n7), .B2(i_data_bus[9]), 
        .ZN(N296) );
  INVD1BWP30P140LVT U35 ( .I(i_data_bus[42]), .ZN(n22) );
  MOAI22D1BWP30P140LVT U36 ( .A1(n1), .A2(n22), .B1(n7), .B2(i_data_bus[10]), 
        .ZN(N297) );
  INVD1BWP30P140LVT U37 ( .I(i_data_bus[43]), .ZN(n23) );
  MOAI22D1BWP30P140LVT U38 ( .A1(n1), .A2(n23), .B1(n7), .B2(i_data_bus[11]), 
        .ZN(N298) );
  INVD1BWP30P140LVT U39 ( .I(i_data_bus[44]), .ZN(n24) );
  MOAI22D1BWP30P140LVT U40 ( .A1(n1), .A2(n24), .B1(n7), .B2(i_data_bus[12]), 
        .ZN(N299) );
  INVD1BWP30P140LVT U41 ( .I(i_data_bus[45]), .ZN(n25) );
  MOAI22D1BWP30P140LVT U42 ( .A1(n1), .A2(n25), .B1(n7), .B2(i_data_bus[13]), 
        .ZN(N300) );
  INVD1BWP30P140LVT U43 ( .I(i_data_bus[46]), .ZN(n26) );
  MOAI22D1BWP30P140LVT U44 ( .A1(n1), .A2(n26), .B1(n7), .B2(i_data_bus[14]), 
        .ZN(N301) );
  INVD1BWP30P140LVT U45 ( .I(i_data_bus[47]), .ZN(n27) );
  MOAI22D1BWP30P140LVT U46 ( .A1(n1), .A2(n27), .B1(n7), .B2(i_data_bus[15]), 
        .ZN(N302) );
  INVD1BWP30P140LVT U47 ( .I(i_data_bus[48]), .ZN(n28) );
  MOAI22D1BWP30P140LVT U48 ( .A1(n1), .A2(n28), .B1(n7), .B2(i_data_bus[16]), 
        .ZN(N303) );
  INVD1BWP30P140LVT U49 ( .I(i_data_bus[49]), .ZN(n29) );
  MOAI22D1BWP30P140LVT U50 ( .A1(n1), .A2(n29), .B1(n7), .B2(i_data_bus[17]), 
        .ZN(N304) );
  INVD1BWP30P140LVT U51 ( .I(i_data_bus[50]), .ZN(n30) );
  MOAI22D1BWP30P140LVT U52 ( .A1(n1), .A2(n30), .B1(n7), .B2(i_data_bus[18]), 
        .ZN(N305) );
  INVD1BWP30P140LVT U53 ( .I(i_data_bus[51]), .ZN(n31) );
  MOAI22D1BWP30P140LVT U54 ( .A1(n1), .A2(n31), .B1(n7), .B2(i_data_bus[19]), 
        .ZN(N306) );
  INVD1BWP30P140LVT U55 ( .I(i_data_bus[52]), .ZN(n32) );
  MOAI22D1BWP30P140LVT U56 ( .A1(n1), .A2(n32), .B1(n7), .B2(i_data_bus[20]), 
        .ZN(N307) );
  INVD1BWP30P140LVT U57 ( .I(i_data_bus[53]), .ZN(n33) );
  MOAI22D1BWP30P140LVT U58 ( .A1(n1), .A2(n33), .B1(n7), .B2(i_data_bus[21]), 
        .ZN(N308) );
  INVD1BWP30P140LVT U59 ( .I(i_data_bus[54]), .ZN(n34) );
  MOAI22D1BWP30P140LVT U60 ( .A1(n1), .A2(n34), .B1(n7), .B2(i_data_bus[22]), 
        .ZN(N309) );
  INVD1BWP30P140LVT U61 ( .I(i_data_bus[55]), .ZN(n35) );
  MOAI22D1BWP30P140LVT U62 ( .A1(n1), .A2(n35), .B1(n7), .B2(i_data_bus[23]), 
        .ZN(N310) );
  INVD1BWP30P140LVT U63 ( .I(i_data_bus[56]), .ZN(n36) );
  MOAI22D1BWP30P140LVT U64 ( .A1(n1), .A2(n36), .B1(n7), .B2(i_data_bus[24]), 
        .ZN(N311) );
  INVD1BWP30P140LVT U65 ( .I(i_data_bus[57]), .ZN(n37) );
  MOAI22D1BWP30P140LVT U66 ( .A1(n1), .A2(n37), .B1(n7), .B2(i_data_bus[25]), 
        .ZN(N312) );
  INVD1BWP30P140LVT U67 ( .I(i_data_bus[58]), .ZN(n38) );
  MOAI22D1BWP30P140LVT U68 ( .A1(n1), .A2(n38), .B1(n7), .B2(i_data_bus[26]), 
        .ZN(N313) );
  INVD1BWP30P140LVT U69 ( .I(i_data_bus[59]), .ZN(n39) );
  MOAI22D1BWP30P140LVT U70 ( .A1(n1), .A2(n39), .B1(n7), .B2(i_data_bus[27]), 
        .ZN(N314) );
  INVD1BWP30P140LVT U71 ( .I(i_data_bus[60]), .ZN(n40) );
  MOAI22D1BWP30P140LVT U72 ( .A1(n1), .A2(n40), .B1(n7), .B2(i_data_bus[28]), 
        .ZN(N315) );
  INVD1BWP30P140LVT U73 ( .I(i_data_bus[61]), .ZN(n41) );
  MOAI22D1BWP30P140LVT U74 ( .A1(n1), .A2(n41), .B1(n7), .B2(i_data_bus[29]), 
        .ZN(N316) );
  INVD1BWP30P140LVT U75 ( .I(i_data_bus[62]), .ZN(n42) );
  MOAI22D1BWP30P140LVT U76 ( .A1(n1), .A2(n42), .B1(n7), .B2(i_data_bus[30]), 
        .ZN(N317) );
  INVD1BWP30P140LVT U77 ( .I(i_data_bus[63]), .ZN(n45) );
  MOAI22D1BWP30P140LVT U78 ( .A1(n1), .A2(n45), .B1(n7), .B2(i_data_bus[31]), 
        .ZN(N318) );
  OAI21D1BWP30P140LVT U79 ( .A1(i_cmd[0]), .A2(i_valid[0]), .B(n8), .ZN(n9) );
  AO211D1BWP30P140LVT U80 ( .A1(i_cmd[0]), .A2(n10), .B(i_cmd[1]), .C(n9), .Z(
        n11) );
  INVD2BWP30P140LVT U81 ( .I(n11), .ZN(n43) );
  MOAI22D1BWP30P140LVT U82 ( .A1(n12), .A2(n44), .B1(i_data_bus[0]), .B2(n43), 
        .ZN(N319) );
  MOAI22D1BWP30P140LVT U83 ( .A1(n13), .A2(n44), .B1(i_data_bus[1]), .B2(n43), 
        .ZN(N320) );
  MOAI22D1BWP30P140LVT U84 ( .A1(n14), .A2(n44), .B1(i_data_bus[2]), .B2(n43), 
        .ZN(N321) );
  MOAI22D1BWP30P140LVT U85 ( .A1(n15), .A2(n44), .B1(i_data_bus[3]), .B2(n43), 
        .ZN(N322) );
  MOAI22D1BWP30P140LVT U86 ( .A1(n16), .A2(n44), .B1(i_data_bus[4]), .B2(n43), 
        .ZN(N323) );
  MOAI22D1BWP30P140LVT U87 ( .A1(n17), .A2(n44), .B1(i_data_bus[5]), .B2(n43), 
        .ZN(N324) );
  MOAI22D1BWP30P140LVT U88 ( .A1(n18), .A2(n44), .B1(i_data_bus[6]), .B2(n43), 
        .ZN(N325) );
  MOAI22D1BWP30P140LVT U89 ( .A1(n19), .A2(n44), .B1(i_data_bus[7]), .B2(n43), 
        .ZN(N326) );
  MOAI22D1BWP30P140LVT U90 ( .A1(n20), .A2(n44), .B1(i_data_bus[8]), .B2(n43), 
        .ZN(N327) );
  MOAI22D1BWP30P140LVT U91 ( .A1(n21), .A2(n44), .B1(i_data_bus[9]), .B2(n43), 
        .ZN(N328) );
  MOAI22D1BWP30P140LVT U92 ( .A1(n22), .A2(n44), .B1(i_data_bus[10]), .B2(n43), 
        .ZN(N329) );
  MOAI22D1BWP30P140LVT U93 ( .A1(n23), .A2(n44), .B1(i_data_bus[11]), .B2(n43), 
        .ZN(N330) );
  MOAI22D1BWP30P140LVT U94 ( .A1(n24), .A2(n44), .B1(i_data_bus[12]), .B2(n43), 
        .ZN(N331) );
  MOAI22D1BWP30P140LVT U95 ( .A1(n25), .A2(n44), .B1(i_data_bus[13]), .B2(n43), 
        .ZN(N332) );
  MOAI22D1BWP30P140LVT U96 ( .A1(n26), .A2(n44), .B1(i_data_bus[14]), .B2(n43), 
        .ZN(N333) );
  MOAI22D1BWP30P140LVT U97 ( .A1(n27), .A2(n44), .B1(i_data_bus[15]), .B2(n43), 
        .ZN(N334) );
  MOAI22D1BWP30P140LVT U98 ( .A1(n28), .A2(n44), .B1(i_data_bus[16]), .B2(n43), 
        .ZN(N335) );
  MOAI22D1BWP30P140LVT U99 ( .A1(n29), .A2(n44), .B1(i_data_bus[17]), .B2(n43), 
        .ZN(N336) );
  MOAI22D1BWP30P140LVT U100 ( .A1(n30), .A2(n44), .B1(i_data_bus[18]), .B2(n43), .ZN(N337) );
  MOAI22D1BWP30P140LVT U101 ( .A1(n31), .A2(n44), .B1(i_data_bus[19]), .B2(n43), .ZN(N338) );
  MOAI22D1BWP30P140LVT U102 ( .A1(n32), .A2(n44), .B1(i_data_bus[20]), .B2(n43), .ZN(N339) );
  MOAI22D1BWP30P140LVT U103 ( .A1(n33), .A2(n44), .B1(i_data_bus[21]), .B2(n43), .ZN(N340) );
  MOAI22D1BWP30P140LVT U104 ( .A1(n34), .A2(n44), .B1(i_data_bus[22]), .B2(n43), .ZN(N341) );
  MOAI22D1BWP30P140LVT U105 ( .A1(n35), .A2(n44), .B1(i_data_bus[23]), .B2(n43), .ZN(N342) );
  MOAI22D1BWP30P140LVT U106 ( .A1(n36), .A2(n44), .B1(i_data_bus[24]), .B2(n43), .ZN(N343) );
  MOAI22D1BWP30P140LVT U107 ( .A1(n37), .A2(n44), .B1(i_data_bus[25]), .B2(n43), .ZN(N344) );
  MOAI22D1BWP30P140LVT U108 ( .A1(n38), .A2(n44), .B1(i_data_bus[26]), .B2(n43), .ZN(N345) );
  MOAI22D1BWP30P140LVT U109 ( .A1(n39), .A2(n44), .B1(i_data_bus[27]), .B2(n43), .ZN(N346) );
  MOAI22D1BWP30P140LVT U110 ( .A1(n40), .A2(n44), .B1(i_data_bus[28]), .B2(n43), .ZN(N347) );
  MOAI22D1BWP30P140LVT U111 ( .A1(n41), .A2(n44), .B1(i_data_bus[29]), .B2(n43), .ZN(N348) );
  MOAI22D1BWP30P140LVT U112 ( .A1(n42), .A2(n44), .B1(i_data_bus[30]), .B2(n43), .ZN(N349) );
  MOAI22D1BWP30P140LVT U113 ( .A1(n45), .A2(n44), .B1(i_data_bus[31]), .B2(n43), .ZN(N350) );
endmodule


module distribute_2x2_simple_seq_DATA_WIDTH32_COMMAND_WIDTH2_16 ( clk, rst, 
        i_valid, i_data_bus, o_valid, o_data_bus, i_en, i_cmd );
  input [1:0] i_valid;
  input [63:0] i_data_bus;
  output [1:0] o_valid;
  output [63:0] o_data_bus;
  input [1:0] i_cmd;
  input clk, rst, i_en;
  wire   N287, N288, N289, N290, N291, N292, N293, N294, N295, N296, N297,
         N298, N299, N300, N301, N302, N303, N304, N305, N306, N307, N308,
         N309, N310, N311, N312, N313, N314, N315, N316, N317, N318, N319,
         N320, N321, N322, N323, N324, N325, N326, N327, N328, N329, N330,
         N331, N332, N333, N334, N335, N336, N337, N338, N339, N340, N341,
         N342, N343, N344, N345, N346, N347, N348, N349, N350, N353, N354, n1,
         n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30,
         n31, n32, n33, n34, n35, n36, n37, n38, n39, n40, n41, n42, n43, n44,
         n45;

  DFQD1BWP30P140LVT o_data_bus_inner_reg_63_ ( .D(N350), .CP(clk), .Q(
        o_data_bus[63]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_62_ ( .D(N349), .CP(clk), .Q(
        o_data_bus[62]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_61_ ( .D(N348), .CP(clk), .Q(
        o_data_bus[61]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_60_ ( .D(N347), .CP(clk), .Q(
        o_data_bus[60]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_59_ ( .D(N346), .CP(clk), .Q(
        o_data_bus[59]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_58_ ( .D(N345), .CP(clk), .Q(
        o_data_bus[58]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_57_ ( .D(N344), .CP(clk), .Q(
        o_data_bus[57]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_56_ ( .D(N343), .CP(clk), .Q(
        o_data_bus[56]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_55_ ( .D(N342), .CP(clk), .Q(
        o_data_bus[55]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_54_ ( .D(N341), .CP(clk), .Q(
        o_data_bus[54]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_53_ ( .D(N340), .CP(clk), .Q(
        o_data_bus[53]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_52_ ( .D(N339), .CP(clk), .Q(
        o_data_bus[52]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_51_ ( .D(N338), .CP(clk), .Q(
        o_data_bus[51]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_50_ ( .D(N337), .CP(clk), .Q(
        o_data_bus[50]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_49_ ( .D(N336), .CP(clk), .Q(
        o_data_bus[49]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_48_ ( .D(N335), .CP(clk), .Q(
        o_data_bus[48]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_47_ ( .D(N334), .CP(clk), .Q(
        o_data_bus[47]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_46_ ( .D(N333), .CP(clk), .Q(
        o_data_bus[46]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_45_ ( .D(N332), .CP(clk), .Q(
        o_data_bus[45]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_44_ ( .D(N331), .CP(clk), .Q(
        o_data_bus[44]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_43_ ( .D(N330), .CP(clk), .Q(
        o_data_bus[43]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_42_ ( .D(N329), .CP(clk), .Q(
        o_data_bus[42]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_41_ ( .D(N328), .CP(clk), .Q(
        o_data_bus[41]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_40_ ( .D(N327), .CP(clk), .Q(
        o_data_bus[40]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_39_ ( .D(N326), .CP(clk), .Q(
        o_data_bus[39]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_38_ ( .D(N325), .CP(clk), .Q(
        o_data_bus[38]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_37_ ( .D(N324), .CP(clk), .Q(
        o_data_bus[37]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_36_ ( .D(N323), .CP(clk), .Q(
        o_data_bus[36]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_35_ ( .D(N322), .CP(clk), .Q(
        o_data_bus[35]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_34_ ( .D(N321), .CP(clk), .Q(
        o_data_bus[34]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_33_ ( .D(N320), .CP(clk), .Q(
        o_data_bus[33]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_32_ ( .D(N319), .CP(clk), .Q(
        o_data_bus[32]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_31_ ( .D(N318), .CP(clk), .Q(
        o_data_bus[31]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_30_ ( .D(N317), .CP(clk), .Q(
        o_data_bus[30]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_29_ ( .D(N316), .CP(clk), .Q(
        o_data_bus[29]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_28_ ( .D(N315), .CP(clk), .Q(
        o_data_bus[28]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_27_ ( .D(N314), .CP(clk), .Q(
        o_data_bus[27]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_26_ ( .D(N313), .CP(clk), .Q(
        o_data_bus[26]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_25_ ( .D(N312), .CP(clk), .Q(
        o_data_bus[25]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_24_ ( .D(N311), .CP(clk), .Q(
        o_data_bus[24]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_23_ ( .D(N310), .CP(clk), .Q(
        o_data_bus[23]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_22_ ( .D(N309), .CP(clk), .Q(
        o_data_bus[22]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_21_ ( .D(N308), .CP(clk), .Q(
        o_data_bus[21]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_20_ ( .D(N307), .CP(clk), .Q(
        o_data_bus[20]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_19_ ( .D(N306), .CP(clk), .Q(
        o_data_bus[19]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_18_ ( .D(N305), .CP(clk), .Q(
        o_data_bus[18]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_17_ ( .D(N304), .CP(clk), .Q(
        o_data_bus[17]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_16_ ( .D(N303), .CP(clk), .Q(
        o_data_bus[16]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_15_ ( .D(N302), .CP(clk), .Q(
        o_data_bus[15]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_14_ ( .D(N301), .CP(clk), .Q(
        o_data_bus[14]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_13_ ( .D(N300), .CP(clk), .Q(
        o_data_bus[13]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_12_ ( .D(N299), .CP(clk), .Q(
        o_data_bus[12]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_11_ ( .D(N298), .CP(clk), .Q(
        o_data_bus[11]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_10_ ( .D(N297), .CP(clk), .Q(
        o_data_bus[10]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_9_ ( .D(N296), .CP(clk), .Q(
        o_data_bus[9]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_8_ ( .D(N295), .CP(clk), .Q(
        o_data_bus[8]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_7_ ( .D(N294), .CP(clk), .Q(
        o_data_bus[7]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_6_ ( .D(N293), .CP(clk), .Q(
        o_data_bus[6]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_5_ ( .D(N292), .CP(clk), .Q(
        o_data_bus[5]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_4_ ( .D(N291), .CP(clk), .Q(
        o_data_bus[4]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_3_ ( .D(N290), .CP(clk), .Q(
        o_data_bus[3]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_2_ ( .D(N289), .CP(clk), .Q(
        o_data_bus[2]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_1_ ( .D(N288), .CP(clk), .Q(
        o_data_bus[1]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_0_ ( .D(N287), .CP(clk), .Q(
        o_data_bus[0]) );
  DFQD1BWP30P140LVT o_valid_inner_reg_1_ ( .D(N354), .CP(clk), .Q(o_valid[1])
         );
  DFQD1BWP30P140LVT o_valid_inner_reg_0_ ( .D(N353), .CP(clk), .Q(o_valid[0])
         );
  ND2OPTIBD1BWP30P140LVT U3 ( .A1(n8), .A2(i_valid[0]), .ZN(n3) );
  INVD1BWP30P140LVT U4 ( .I(i_valid[1]), .ZN(n10) );
  BUFFD2BWP30P140LVT U5 ( .I(n6), .Z(n1) );
  OAI211D1BWP30P140LVT U6 ( .A1(i_cmd[1]), .A2(i_valid[0]), .B(i_cmd[0]), .C(
        n5), .ZN(n6) );
  INR2D1BWP30P140LVT U7 ( .A1(i_en), .B1(rst), .ZN(n8) );
  NR2OPTPAD1BWP30P140LVT U8 ( .A1(i_cmd[0]), .A2(n3), .ZN(n7) );
  AOI31D1BWP30P140LVT U9 ( .A1(i_cmd[0]), .A2(n8), .A3(i_valid[1]), .B(n7), 
        .ZN(n2) );
  INVD1BWP30P140LVT U10 ( .I(n2), .ZN(N353) );
  ND3D2BWP30P140LVT U11 ( .A1(n8), .A2(i_cmd[1]), .A3(i_valid[1]), .ZN(n44) );
  OAI21D1BWP30P140LVT U12 ( .A1(i_cmd[1]), .A2(n3), .B(n44), .ZN(N354) );
  INVD1BWP30P140LVT U13 ( .I(i_data_bus[32]), .ZN(n12) );
  INVD1BWP30P140LVT U14 ( .I(n8), .ZN(n4) );
  AOI21D1BWP30P140LVT U15 ( .A1(i_cmd[1]), .A2(n10), .B(n4), .ZN(n5) );
  MOAI22D1BWP30P140LVT U16 ( .A1(n12), .A2(n6), .B1(i_data_bus[0]), .B2(n7), 
        .ZN(N287) );
  INVD1BWP30P140LVT U17 ( .I(i_data_bus[33]), .ZN(n13) );
  MOAI22D1BWP30P140LVT U18 ( .A1(n1), .A2(n13), .B1(n7), .B2(i_data_bus[1]), 
        .ZN(N288) );
  INVD1BWP30P140LVT U19 ( .I(i_data_bus[34]), .ZN(n14) );
  MOAI22D1BWP30P140LVT U20 ( .A1(n1), .A2(n14), .B1(n7), .B2(i_data_bus[2]), 
        .ZN(N289) );
  INVD1BWP30P140LVT U21 ( .I(i_data_bus[35]), .ZN(n15) );
  MOAI22D1BWP30P140LVT U22 ( .A1(n1), .A2(n15), .B1(n7), .B2(i_data_bus[3]), 
        .ZN(N290) );
  INVD1BWP30P140LVT U23 ( .I(i_data_bus[36]), .ZN(n16) );
  MOAI22D1BWP30P140LVT U24 ( .A1(n1), .A2(n16), .B1(n7), .B2(i_data_bus[4]), 
        .ZN(N291) );
  INVD1BWP30P140LVT U25 ( .I(i_data_bus[37]), .ZN(n17) );
  MOAI22D1BWP30P140LVT U26 ( .A1(n1), .A2(n17), .B1(n7), .B2(i_data_bus[5]), 
        .ZN(N292) );
  INVD1BWP30P140LVT U27 ( .I(i_data_bus[38]), .ZN(n18) );
  MOAI22D1BWP30P140LVT U28 ( .A1(n1), .A2(n18), .B1(n7), .B2(i_data_bus[6]), 
        .ZN(N293) );
  INVD1BWP30P140LVT U29 ( .I(i_data_bus[39]), .ZN(n19) );
  MOAI22D1BWP30P140LVT U30 ( .A1(n1), .A2(n19), .B1(n7), .B2(i_data_bus[7]), 
        .ZN(N294) );
  INVD1BWP30P140LVT U31 ( .I(i_data_bus[40]), .ZN(n20) );
  MOAI22D1BWP30P140LVT U32 ( .A1(n1), .A2(n20), .B1(n7), .B2(i_data_bus[8]), 
        .ZN(N295) );
  INVD1BWP30P140LVT U33 ( .I(i_data_bus[41]), .ZN(n21) );
  MOAI22D1BWP30P140LVT U34 ( .A1(n1), .A2(n21), .B1(n7), .B2(i_data_bus[9]), 
        .ZN(N296) );
  INVD1BWP30P140LVT U35 ( .I(i_data_bus[42]), .ZN(n22) );
  MOAI22D1BWP30P140LVT U36 ( .A1(n1), .A2(n22), .B1(n7), .B2(i_data_bus[10]), 
        .ZN(N297) );
  INVD1BWP30P140LVT U37 ( .I(i_data_bus[43]), .ZN(n23) );
  MOAI22D1BWP30P140LVT U38 ( .A1(n1), .A2(n23), .B1(n7), .B2(i_data_bus[11]), 
        .ZN(N298) );
  INVD1BWP30P140LVT U39 ( .I(i_data_bus[44]), .ZN(n24) );
  MOAI22D1BWP30P140LVT U40 ( .A1(n1), .A2(n24), .B1(n7), .B2(i_data_bus[12]), 
        .ZN(N299) );
  INVD1BWP30P140LVT U41 ( .I(i_data_bus[45]), .ZN(n25) );
  MOAI22D1BWP30P140LVT U42 ( .A1(n1), .A2(n25), .B1(n7), .B2(i_data_bus[13]), 
        .ZN(N300) );
  INVD1BWP30P140LVT U43 ( .I(i_data_bus[46]), .ZN(n26) );
  MOAI22D1BWP30P140LVT U44 ( .A1(n1), .A2(n26), .B1(n7), .B2(i_data_bus[14]), 
        .ZN(N301) );
  INVD1BWP30P140LVT U45 ( .I(i_data_bus[47]), .ZN(n27) );
  MOAI22D1BWP30P140LVT U46 ( .A1(n1), .A2(n27), .B1(n7), .B2(i_data_bus[15]), 
        .ZN(N302) );
  INVD1BWP30P140LVT U47 ( .I(i_data_bus[48]), .ZN(n28) );
  MOAI22D1BWP30P140LVT U48 ( .A1(n1), .A2(n28), .B1(n7), .B2(i_data_bus[16]), 
        .ZN(N303) );
  INVD1BWP30P140LVT U49 ( .I(i_data_bus[49]), .ZN(n29) );
  MOAI22D1BWP30P140LVT U50 ( .A1(n1), .A2(n29), .B1(n7), .B2(i_data_bus[17]), 
        .ZN(N304) );
  INVD1BWP30P140LVT U51 ( .I(i_data_bus[50]), .ZN(n30) );
  MOAI22D1BWP30P140LVT U52 ( .A1(n1), .A2(n30), .B1(n7), .B2(i_data_bus[18]), 
        .ZN(N305) );
  INVD1BWP30P140LVT U53 ( .I(i_data_bus[51]), .ZN(n31) );
  MOAI22D1BWP30P140LVT U54 ( .A1(n1), .A2(n31), .B1(n7), .B2(i_data_bus[19]), 
        .ZN(N306) );
  INVD1BWP30P140LVT U55 ( .I(i_data_bus[52]), .ZN(n32) );
  MOAI22D1BWP30P140LVT U56 ( .A1(n1), .A2(n32), .B1(n7), .B2(i_data_bus[20]), 
        .ZN(N307) );
  INVD1BWP30P140LVT U57 ( .I(i_data_bus[53]), .ZN(n33) );
  MOAI22D1BWP30P140LVT U58 ( .A1(n1), .A2(n33), .B1(n7), .B2(i_data_bus[21]), 
        .ZN(N308) );
  INVD1BWP30P140LVT U59 ( .I(i_data_bus[54]), .ZN(n34) );
  MOAI22D1BWP30P140LVT U60 ( .A1(n1), .A2(n34), .B1(n7), .B2(i_data_bus[22]), 
        .ZN(N309) );
  INVD1BWP30P140LVT U61 ( .I(i_data_bus[55]), .ZN(n35) );
  MOAI22D1BWP30P140LVT U62 ( .A1(n1), .A2(n35), .B1(n7), .B2(i_data_bus[23]), 
        .ZN(N310) );
  INVD1BWP30P140LVT U63 ( .I(i_data_bus[56]), .ZN(n36) );
  MOAI22D1BWP30P140LVT U64 ( .A1(n1), .A2(n36), .B1(n7), .B2(i_data_bus[24]), 
        .ZN(N311) );
  INVD1BWP30P140LVT U65 ( .I(i_data_bus[57]), .ZN(n37) );
  MOAI22D1BWP30P140LVT U66 ( .A1(n1), .A2(n37), .B1(n7), .B2(i_data_bus[25]), 
        .ZN(N312) );
  INVD1BWP30P140LVT U67 ( .I(i_data_bus[58]), .ZN(n38) );
  MOAI22D1BWP30P140LVT U68 ( .A1(n1), .A2(n38), .B1(n7), .B2(i_data_bus[26]), 
        .ZN(N313) );
  INVD1BWP30P140LVT U69 ( .I(i_data_bus[59]), .ZN(n39) );
  MOAI22D1BWP30P140LVT U70 ( .A1(n1), .A2(n39), .B1(n7), .B2(i_data_bus[27]), 
        .ZN(N314) );
  INVD1BWP30P140LVT U71 ( .I(i_data_bus[60]), .ZN(n40) );
  MOAI22D1BWP30P140LVT U72 ( .A1(n1), .A2(n40), .B1(n7), .B2(i_data_bus[28]), 
        .ZN(N315) );
  INVD1BWP30P140LVT U73 ( .I(i_data_bus[61]), .ZN(n41) );
  MOAI22D1BWP30P140LVT U74 ( .A1(n1), .A2(n41), .B1(n7), .B2(i_data_bus[29]), 
        .ZN(N316) );
  INVD1BWP30P140LVT U75 ( .I(i_data_bus[62]), .ZN(n42) );
  MOAI22D1BWP30P140LVT U76 ( .A1(n1), .A2(n42), .B1(n7), .B2(i_data_bus[30]), 
        .ZN(N317) );
  INVD1BWP30P140LVT U77 ( .I(i_data_bus[63]), .ZN(n45) );
  MOAI22D1BWP30P140LVT U78 ( .A1(n1), .A2(n45), .B1(n7), .B2(i_data_bus[31]), 
        .ZN(N318) );
  OAI21D1BWP30P140LVT U79 ( .A1(i_cmd[0]), .A2(i_valid[0]), .B(n8), .ZN(n9) );
  AO211D1BWP30P140LVT U80 ( .A1(i_cmd[0]), .A2(n10), .B(i_cmd[1]), .C(n9), .Z(
        n11) );
  INVD2BWP30P140LVT U81 ( .I(n11), .ZN(n43) );
  MOAI22D1BWP30P140LVT U82 ( .A1(n12), .A2(n44), .B1(i_data_bus[0]), .B2(n43), 
        .ZN(N319) );
  MOAI22D1BWP30P140LVT U83 ( .A1(n13), .A2(n44), .B1(i_data_bus[1]), .B2(n43), 
        .ZN(N320) );
  MOAI22D1BWP30P140LVT U84 ( .A1(n14), .A2(n44), .B1(i_data_bus[2]), .B2(n43), 
        .ZN(N321) );
  MOAI22D1BWP30P140LVT U85 ( .A1(n15), .A2(n44), .B1(i_data_bus[3]), .B2(n43), 
        .ZN(N322) );
  MOAI22D1BWP30P140LVT U86 ( .A1(n16), .A2(n44), .B1(i_data_bus[4]), .B2(n43), 
        .ZN(N323) );
  MOAI22D1BWP30P140LVT U87 ( .A1(n17), .A2(n44), .B1(i_data_bus[5]), .B2(n43), 
        .ZN(N324) );
  MOAI22D1BWP30P140LVT U88 ( .A1(n18), .A2(n44), .B1(i_data_bus[6]), .B2(n43), 
        .ZN(N325) );
  MOAI22D1BWP30P140LVT U89 ( .A1(n19), .A2(n44), .B1(i_data_bus[7]), .B2(n43), 
        .ZN(N326) );
  MOAI22D1BWP30P140LVT U90 ( .A1(n20), .A2(n44), .B1(i_data_bus[8]), .B2(n43), 
        .ZN(N327) );
  MOAI22D1BWP30P140LVT U91 ( .A1(n21), .A2(n44), .B1(i_data_bus[9]), .B2(n43), 
        .ZN(N328) );
  MOAI22D1BWP30P140LVT U92 ( .A1(n22), .A2(n44), .B1(i_data_bus[10]), .B2(n43), 
        .ZN(N329) );
  MOAI22D1BWP30P140LVT U93 ( .A1(n23), .A2(n44), .B1(i_data_bus[11]), .B2(n43), 
        .ZN(N330) );
  MOAI22D1BWP30P140LVT U94 ( .A1(n24), .A2(n44), .B1(i_data_bus[12]), .B2(n43), 
        .ZN(N331) );
  MOAI22D1BWP30P140LVT U95 ( .A1(n25), .A2(n44), .B1(i_data_bus[13]), .B2(n43), 
        .ZN(N332) );
  MOAI22D1BWP30P140LVT U96 ( .A1(n26), .A2(n44), .B1(i_data_bus[14]), .B2(n43), 
        .ZN(N333) );
  MOAI22D1BWP30P140LVT U97 ( .A1(n27), .A2(n44), .B1(i_data_bus[15]), .B2(n43), 
        .ZN(N334) );
  MOAI22D1BWP30P140LVT U98 ( .A1(n28), .A2(n44), .B1(i_data_bus[16]), .B2(n43), 
        .ZN(N335) );
  MOAI22D1BWP30P140LVT U99 ( .A1(n29), .A2(n44), .B1(i_data_bus[17]), .B2(n43), 
        .ZN(N336) );
  MOAI22D1BWP30P140LVT U100 ( .A1(n30), .A2(n44), .B1(i_data_bus[18]), .B2(n43), .ZN(N337) );
  MOAI22D1BWP30P140LVT U101 ( .A1(n31), .A2(n44), .B1(i_data_bus[19]), .B2(n43), .ZN(N338) );
  MOAI22D1BWP30P140LVT U102 ( .A1(n32), .A2(n44), .B1(i_data_bus[20]), .B2(n43), .ZN(N339) );
  MOAI22D1BWP30P140LVT U103 ( .A1(n33), .A2(n44), .B1(i_data_bus[21]), .B2(n43), .ZN(N340) );
  MOAI22D1BWP30P140LVT U104 ( .A1(n34), .A2(n44), .B1(i_data_bus[22]), .B2(n43), .ZN(N341) );
  MOAI22D1BWP30P140LVT U105 ( .A1(n35), .A2(n44), .B1(i_data_bus[23]), .B2(n43), .ZN(N342) );
  MOAI22D1BWP30P140LVT U106 ( .A1(n36), .A2(n44), .B1(i_data_bus[24]), .B2(n43), .ZN(N343) );
  MOAI22D1BWP30P140LVT U107 ( .A1(n37), .A2(n44), .B1(i_data_bus[25]), .B2(n43), .ZN(N344) );
  MOAI22D1BWP30P140LVT U108 ( .A1(n38), .A2(n44), .B1(i_data_bus[26]), .B2(n43), .ZN(N345) );
  MOAI22D1BWP30P140LVT U109 ( .A1(n39), .A2(n44), .B1(i_data_bus[27]), .B2(n43), .ZN(N346) );
  MOAI22D1BWP30P140LVT U110 ( .A1(n40), .A2(n44), .B1(i_data_bus[28]), .B2(n43), .ZN(N347) );
  MOAI22D1BWP30P140LVT U111 ( .A1(n41), .A2(n44), .B1(i_data_bus[29]), .B2(n43), .ZN(N348) );
  MOAI22D1BWP30P140LVT U112 ( .A1(n42), .A2(n44), .B1(i_data_bus[30]), .B2(n43), .ZN(N349) );
  MOAI22D1BWP30P140LVT U113 ( .A1(n45), .A2(n44), .B1(i_data_bus[31]), .B2(n43), .ZN(N350) );
endmodule


module distribute_2x2_simple_seq_DATA_WIDTH32_COMMAND_WIDTH2_17 ( clk, rst, 
        i_valid, i_data_bus, o_valid, o_data_bus, i_en, i_cmd );
  input [1:0] i_valid;
  input [63:0] i_data_bus;
  output [1:0] o_valid;
  output [63:0] o_data_bus;
  input [1:0] i_cmd;
  input clk, rst, i_en;
  wire   N287, N288, N289, N290, N291, N292, N293, N294, N295, N296, N297,
         N298, N299, N300, N301, N302, N303, N304, N305, N306, N307, N308,
         N309, N310, N311, N312, N313, N314, N315, N316, N317, N318, N319,
         N320, N321, N322, N323, N324, N325, N326, N327, N328, N329, N330,
         N331, N332, N333, N334, N335, N336, N337, N338, N339, N340, N341,
         N342, N343, N344, N345, N346, N347, N348, N349, N350, N353, N354, n1,
         n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30,
         n31, n32, n33, n34, n35, n36, n37, n38, n39, n40, n41, n42, n43, n44,
         n45, n46;

  DFQD1BWP30P140LVT o_data_bus_inner_reg_63_ ( .D(N350), .CP(clk), .Q(
        o_data_bus[63]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_62_ ( .D(N349), .CP(clk), .Q(
        o_data_bus[62]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_61_ ( .D(N348), .CP(clk), .Q(
        o_data_bus[61]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_60_ ( .D(N347), .CP(clk), .Q(
        o_data_bus[60]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_59_ ( .D(N346), .CP(clk), .Q(
        o_data_bus[59]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_58_ ( .D(N345), .CP(clk), .Q(
        o_data_bus[58]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_57_ ( .D(N344), .CP(clk), .Q(
        o_data_bus[57]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_56_ ( .D(N343), .CP(clk), .Q(
        o_data_bus[56]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_55_ ( .D(N342), .CP(clk), .Q(
        o_data_bus[55]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_54_ ( .D(N341), .CP(clk), .Q(
        o_data_bus[54]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_53_ ( .D(N340), .CP(clk), .Q(
        o_data_bus[53]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_52_ ( .D(N339), .CP(clk), .Q(
        o_data_bus[52]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_51_ ( .D(N338), .CP(clk), .Q(
        o_data_bus[51]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_50_ ( .D(N337), .CP(clk), .Q(
        o_data_bus[50]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_49_ ( .D(N336), .CP(clk), .Q(
        o_data_bus[49]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_48_ ( .D(N335), .CP(clk), .Q(
        o_data_bus[48]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_47_ ( .D(N334), .CP(clk), .Q(
        o_data_bus[47]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_46_ ( .D(N333), .CP(clk), .Q(
        o_data_bus[46]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_45_ ( .D(N332), .CP(clk), .Q(
        o_data_bus[45]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_44_ ( .D(N331), .CP(clk), .Q(
        o_data_bus[44]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_43_ ( .D(N330), .CP(clk), .Q(
        o_data_bus[43]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_42_ ( .D(N329), .CP(clk), .Q(
        o_data_bus[42]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_41_ ( .D(N328), .CP(clk), .Q(
        o_data_bus[41]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_40_ ( .D(N327), .CP(clk), .Q(
        o_data_bus[40]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_39_ ( .D(N326), .CP(clk), .Q(
        o_data_bus[39]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_38_ ( .D(N325), .CP(clk), .Q(
        o_data_bus[38]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_37_ ( .D(N324), .CP(clk), .Q(
        o_data_bus[37]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_36_ ( .D(N323), .CP(clk), .Q(
        o_data_bus[36]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_35_ ( .D(N322), .CP(clk), .Q(
        o_data_bus[35]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_34_ ( .D(N321), .CP(clk), .Q(
        o_data_bus[34]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_33_ ( .D(N320), .CP(clk), .Q(
        o_data_bus[33]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_32_ ( .D(N319), .CP(clk), .Q(
        o_data_bus[32]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_31_ ( .D(N318), .CP(clk), .Q(
        o_data_bus[31]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_30_ ( .D(N317), .CP(clk), .Q(
        o_data_bus[30]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_29_ ( .D(N316), .CP(clk), .Q(
        o_data_bus[29]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_28_ ( .D(N315), .CP(clk), .Q(
        o_data_bus[28]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_27_ ( .D(N314), .CP(clk), .Q(
        o_data_bus[27]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_26_ ( .D(N313), .CP(clk), .Q(
        o_data_bus[26]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_25_ ( .D(N312), .CP(clk), .Q(
        o_data_bus[25]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_24_ ( .D(N311), .CP(clk), .Q(
        o_data_bus[24]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_23_ ( .D(N310), .CP(clk), .Q(
        o_data_bus[23]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_22_ ( .D(N309), .CP(clk), .Q(
        o_data_bus[22]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_21_ ( .D(N308), .CP(clk), .Q(
        o_data_bus[21]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_20_ ( .D(N307), .CP(clk), .Q(
        o_data_bus[20]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_19_ ( .D(N306), .CP(clk), .Q(
        o_data_bus[19]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_18_ ( .D(N305), .CP(clk), .Q(
        o_data_bus[18]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_17_ ( .D(N304), .CP(clk), .Q(
        o_data_bus[17]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_16_ ( .D(N303), .CP(clk), .Q(
        o_data_bus[16]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_15_ ( .D(N302), .CP(clk), .Q(
        o_data_bus[15]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_14_ ( .D(N301), .CP(clk), .Q(
        o_data_bus[14]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_13_ ( .D(N300), .CP(clk), .Q(
        o_data_bus[13]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_12_ ( .D(N299), .CP(clk), .Q(
        o_data_bus[12]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_11_ ( .D(N298), .CP(clk), .Q(
        o_data_bus[11]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_10_ ( .D(N297), .CP(clk), .Q(
        o_data_bus[10]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_9_ ( .D(N296), .CP(clk), .Q(
        o_data_bus[9]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_8_ ( .D(N295), .CP(clk), .Q(
        o_data_bus[8]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_7_ ( .D(N294), .CP(clk), .Q(
        o_data_bus[7]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_6_ ( .D(N293), .CP(clk), .Q(
        o_data_bus[6]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_5_ ( .D(N292), .CP(clk), .Q(
        o_data_bus[5]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_4_ ( .D(N291), .CP(clk), .Q(
        o_data_bus[4]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_3_ ( .D(N290), .CP(clk), .Q(
        o_data_bus[3]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_2_ ( .D(N289), .CP(clk), .Q(
        o_data_bus[2]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_1_ ( .D(N288), .CP(clk), .Q(
        o_data_bus[1]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_0_ ( .D(N287), .CP(clk), .Q(
        o_data_bus[0]) );
  DFQD1BWP30P140LVT o_valid_inner_reg_1_ ( .D(N354), .CP(clk), .Q(o_valid[1])
         );
  DFQD1BWP30P140LVT o_valid_inner_reg_0_ ( .D(N353), .CP(clk), .Q(o_valid[0])
         );
  BUFFD4BWP30P140LVT U3 ( .I(n8), .Z(n9) );
  BUFFD6BWP30P140LVT U4 ( .I(n13), .Z(n14) );
  OAI211OPTREPBD1BWP30P140LVT U5 ( .A1(i_cmd[1]), .A2(i_valid[0]), .B(i_cmd[0]), .C(n7), .ZN(n8) );
  NR2D3BWP30P140LVT U6 ( .A1(i_cmd[0]), .A2(n5), .ZN(n2) );
  INVD1BWP30P140LVT U7 ( .I(i_valid[1]), .ZN(n12) );
  ND2OPTIBD1BWP30P140LVT U8 ( .A1(n10), .A2(i_valid[0]), .ZN(n5) );
  ND3D2BWP30P140LVT U9 ( .A1(n10), .A2(i_cmd[1]), .A3(i_valid[1]), .ZN(n1) );
  ND3D2BWP30P140LVT U10 ( .A1(n10), .A2(i_cmd[1]), .A3(i_valid[1]), .ZN(n4) );
  INR2D1BWP30P140LVT U11 ( .A1(i_en), .B1(rst), .ZN(n10) );
  AOI31D1BWP30P140LVT U12 ( .A1(i_cmd[0]), .A2(n10), .A3(i_valid[1]), .B(n2), 
        .ZN(n3) );
  INVD1BWP30P140LVT U13 ( .I(n3), .ZN(N353) );
  OAI21D1BWP30P140LVT U14 ( .A1(i_cmd[1]), .A2(n5), .B(n4), .ZN(N354) );
  INVD1BWP30P140LVT U15 ( .I(i_data_bus[32]), .ZN(n15) );
  INVD1BWP30P140LVT U16 ( .I(n10), .ZN(n6) );
  AOI21D1BWP30P140LVT U17 ( .A1(i_cmd[1]), .A2(n12), .B(n6), .ZN(n7) );
  MOAI22D1BWP30P140LVT U18 ( .A1(n15), .A2(n9), .B1(i_data_bus[0]), .B2(n2), 
        .ZN(N287) );
  INVD1BWP30P140LVT U19 ( .I(i_data_bus[33]), .ZN(n16) );
  MOAI22D1BWP30P140LVT U20 ( .A1(n9), .A2(n16), .B1(n2), .B2(i_data_bus[1]), 
        .ZN(N288) );
  INVD1BWP30P140LVT U21 ( .I(i_data_bus[34]), .ZN(n17) );
  MOAI22D1BWP30P140LVT U22 ( .A1(n9), .A2(n17), .B1(n2), .B2(i_data_bus[2]), 
        .ZN(N289) );
  INVD1BWP30P140LVT U23 ( .I(i_data_bus[35]), .ZN(n18) );
  MOAI22D1BWP30P140LVT U24 ( .A1(n9), .A2(n18), .B1(n2), .B2(i_data_bus[3]), 
        .ZN(N290) );
  INVD1BWP30P140LVT U25 ( .I(i_data_bus[36]), .ZN(n19) );
  MOAI22D1BWP30P140LVT U26 ( .A1(n9), .A2(n19), .B1(n2), .B2(i_data_bus[4]), 
        .ZN(N291) );
  INVD1BWP30P140LVT U27 ( .I(i_data_bus[37]), .ZN(n20) );
  MOAI22D1BWP30P140LVT U28 ( .A1(n9), .A2(n20), .B1(n2), .B2(i_data_bus[5]), 
        .ZN(N292) );
  INVD1BWP30P140LVT U29 ( .I(i_data_bus[38]), .ZN(n21) );
  MOAI22D1BWP30P140LVT U30 ( .A1(n9), .A2(n21), .B1(n2), .B2(i_data_bus[6]), 
        .ZN(N293) );
  INVD1BWP30P140LVT U31 ( .I(i_data_bus[39]), .ZN(n22) );
  MOAI22D1BWP30P140LVT U32 ( .A1(n9), .A2(n22), .B1(n2), .B2(i_data_bus[7]), 
        .ZN(N294) );
  INVD1BWP30P140LVT U33 ( .I(i_data_bus[40]), .ZN(n23) );
  MOAI22D1BWP30P140LVT U34 ( .A1(n9), .A2(n23), .B1(n2), .B2(i_data_bus[8]), 
        .ZN(N295) );
  INVD1BWP30P140LVT U35 ( .I(i_data_bus[41]), .ZN(n24) );
  MOAI22D1BWP30P140LVT U36 ( .A1(n9), .A2(n24), .B1(n2), .B2(i_data_bus[9]), 
        .ZN(N296) );
  INVD1BWP30P140LVT U37 ( .I(i_data_bus[42]), .ZN(n25) );
  MOAI22D1BWP30P140LVT U38 ( .A1(n9), .A2(n25), .B1(n2), .B2(i_data_bus[10]), 
        .ZN(N297) );
  INVD1BWP30P140LVT U39 ( .I(i_data_bus[43]), .ZN(n26) );
  MOAI22D1BWP30P140LVT U40 ( .A1(n9), .A2(n26), .B1(n2), .B2(i_data_bus[11]), 
        .ZN(N298) );
  INVD1BWP30P140LVT U41 ( .I(i_data_bus[44]), .ZN(n27) );
  MOAI22D1BWP30P140LVT U42 ( .A1(n9), .A2(n27), .B1(n2), .B2(i_data_bus[12]), 
        .ZN(N299) );
  INVD1BWP30P140LVT U43 ( .I(i_data_bus[45]), .ZN(n28) );
  MOAI22D1BWP30P140LVT U44 ( .A1(n9), .A2(n28), .B1(n2), .B2(i_data_bus[13]), 
        .ZN(N300) );
  INVD1BWP30P140LVT U45 ( .I(i_data_bus[46]), .ZN(n29) );
  MOAI22D1BWP30P140LVT U46 ( .A1(n9), .A2(n29), .B1(n2), .B2(i_data_bus[14]), 
        .ZN(N301) );
  INVD1BWP30P140LVT U47 ( .I(i_data_bus[47]), .ZN(n30) );
  MOAI22D1BWP30P140LVT U48 ( .A1(n9), .A2(n30), .B1(n2), .B2(i_data_bus[15]), 
        .ZN(N302) );
  INVD1BWP30P140LVT U49 ( .I(i_data_bus[48]), .ZN(n31) );
  MOAI22D1BWP30P140LVT U50 ( .A1(n9), .A2(n31), .B1(n2), .B2(i_data_bus[16]), 
        .ZN(N303) );
  INVD1BWP30P140LVT U51 ( .I(i_data_bus[49]), .ZN(n32) );
  MOAI22D1BWP30P140LVT U52 ( .A1(n9), .A2(n32), .B1(n2), .B2(i_data_bus[17]), 
        .ZN(N304) );
  INVD1BWP30P140LVT U53 ( .I(i_data_bus[50]), .ZN(n33) );
  MOAI22D1BWP30P140LVT U54 ( .A1(n9), .A2(n33), .B1(n2), .B2(i_data_bus[18]), 
        .ZN(N305) );
  INVD1BWP30P140LVT U55 ( .I(i_data_bus[51]), .ZN(n34) );
  MOAI22D1BWP30P140LVT U56 ( .A1(n9), .A2(n34), .B1(n2), .B2(i_data_bus[19]), 
        .ZN(N306) );
  INVD1BWP30P140LVT U57 ( .I(i_data_bus[52]), .ZN(n35) );
  MOAI22D1BWP30P140LVT U58 ( .A1(n9), .A2(n35), .B1(n2), .B2(i_data_bus[20]), 
        .ZN(N307) );
  INVD1BWP30P140LVT U59 ( .I(i_data_bus[53]), .ZN(n36) );
  MOAI22D1BWP30P140LVT U60 ( .A1(n9), .A2(n36), .B1(n2), .B2(i_data_bus[21]), 
        .ZN(N308) );
  INVD1BWP30P140LVT U61 ( .I(i_data_bus[54]), .ZN(n37) );
  MOAI22D1BWP30P140LVT U62 ( .A1(n9), .A2(n37), .B1(n2), .B2(i_data_bus[22]), 
        .ZN(N309) );
  INVD1BWP30P140LVT U63 ( .I(i_data_bus[55]), .ZN(n38) );
  MOAI22D1BWP30P140LVT U64 ( .A1(n9), .A2(n38), .B1(n2), .B2(i_data_bus[23]), 
        .ZN(N310) );
  INVD1BWP30P140LVT U65 ( .I(i_data_bus[56]), .ZN(n39) );
  MOAI22D1BWP30P140LVT U66 ( .A1(n9), .A2(n39), .B1(n2), .B2(i_data_bus[24]), 
        .ZN(N311) );
  INVD1BWP30P140LVT U67 ( .I(i_data_bus[57]), .ZN(n40) );
  MOAI22D1BWP30P140LVT U68 ( .A1(n9), .A2(n40), .B1(n2), .B2(i_data_bus[25]), 
        .ZN(N312) );
  INVD1BWP30P140LVT U69 ( .I(i_data_bus[58]), .ZN(n41) );
  MOAI22D1BWP30P140LVT U70 ( .A1(n9), .A2(n41), .B1(n2), .B2(i_data_bus[26]), 
        .ZN(N313) );
  INVD1BWP30P140LVT U71 ( .I(i_data_bus[59]), .ZN(n42) );
  MOAI22D1BWP30P140LVT U72 ( .A1(n9), .A2(n42), .B1(n2), .B2(i_data_bus[27]), 
        .ZN(N314) );
  INVD1BWP30P140LVT U73 ( .I(i_data_bus[60]), .ZN(n43) );
  MOAI22D1BWP30P140LVT U74 ( .A1(n9), .A2(n43), .B1(n2), .B2(i_data_bus[28]), 
        .ZN(N315) );
  INVD1BWP30P140LVT U75 ( .I(i_data_bus[61]), .ZN(n44) );
  MOAI22D1BWP30P140LVT U76 ( .A1(n9), .A2(n44), .B1(n2), .B2(i_data_bus[29]), 
        .ZN(N316) );
  INVD1BWP30P140LVT U77 ( .I(i_data_bus[62]), .ZN(n45) );
  MOAI22D1BWP30P140LVT U78 ( .A1(n9), .A2(n45), .B1(n2), .B2(i_data_bus[30]), 
        .ZN(N317) );
  INVD1BWP30P140LVT U79 ( .I(i_data_bus[63]), .ZN(n46) );
  MOAI22D1BWP30P140LVT U80 ( .A1(n9), .A2(n46), .B1(n2), .B2(i_data_bus[31]), 
        .ZN(N318) );
  OAI21D2BWP30P140LVT U81 ( .A1(i_cmd[0]), .A2(i_valid[0]), .B(n10), .ZN(n11)
         );
  AOI211D2BWP30P140LVT U82 ( .A1(i_cmd[0]), .A2(n12), .B(i_cmd[1]), .C(n11), 
        .ZN(n13) );
  MOAI22D1BWP30P140LVT U83 ( .A1(n15), .A2(n1), .B1(i_data_bus[0]), .B2(n14), 
        .ZN(N319) );
  MOAI22D1BWP30P140LVT U84 ( .A1(n16), .A2(n4), .B1(i_data_bus[1]), .B2(n14), 
        .ZN(N320) );
  MOAI22D1BWP30P140LVT U85 ( .A1(n17), .A2(n1), .B1(i_data_bus[2]), .B2(n14), 
        .ZN(N321) );
  MOAI22D1BWP30P140LVT U86 ( .A1(n18), .A2(n4), .B1(i_data_bus[3]), .B2(n14), 
        .ZN(N322) );
  MOAI22D1BWP30P140LVT U87 ( .A1(n19), .A2(n1), .B1(i_data_bus[4]), .B2(n14), 
        .ZN(N323) );
  MOAI22D1BWP30P140LVT U88 ( .A1(n20), .A2(n4), .B1(i_data_bus[5]), .B2(n14), 
        .ZN(N324) );
  MOAI22D1BWP30P140LVT U89 ( .A1(n21), .A2(n1), .B1(i_data_bus[6]), .B2(n14), 
        .ZN(N325) );
  MOAI22D1BWP30P140LVT U90 ( .A1(n22), .A2(n4), .B1(i_data_bus[7]), .B2(n14), 
        .ZN(N326) );
  MOAI22D1BWP30P140LVT U91 ( .A1(n23), .A2(n1), .B1(i_data_bus[8]), .B2(n14), 
        .ZN(N327) );
  MOAI22D1BWP30P140LVT U92 ( .A1(n24), .A2(n4), .B1(i_data_bus[9]), .B2(n14), 
        .ZN(N328) );
  MOAI22D1BWP30P140LVT U93 ( .A1(n25), .A2(n1), .B1(i_data_bus[10]), .B2(n14), 
        .ZN(N329) );
  MOAI22D1BWP30P140LVT U94 ( .A1(n26), .A2(n4), .B1(i_data_bus[11]), .B2(n14), 
        .ZN(N330) );
  MOAI22D1BWP30P140LVT U95 ( .A1(n27), .A2(n1), .B1(i_data_bus[12]), .B2(n14), 
        .ZN(N331) );
  MOAI22D1BWP30P140LVT U96 ( .A1(n28), .A2(n4), .B1(i_data_bus[13]), .B2(n14), 
        .ZN(N332) );
  MOAI22D1BWP30P140LVT U97 ( .A1(n29), .A2(n1), .B1(i_data_bus[14]), .B2(n14), 
        .ZN(N333) );
  MOAI22D1BWP30P140LVT U98 ( .A1(n30), .A2(n4), .B1(i_data_bus[15]), .B2(n14), 
        .ZN(N334) );
  MOAI22D1BWP30P140LVT U99 ( .A1(n31), .A2(n1), .B1(i_data_bus[16]), .B2(n14), 
        .ZN(N335) );
  MOAI22D1BWP30P140LVT U100 ( .A1(n32), .A2(n4), .B1(i_data_bus[17]), .B2(n14), 
        .ZN(N336) );
  MOAI22D1BWP30P140LVT U101 ( .A1(n33), .A2(n1), .B1(i_data_bus[18]), .B2(n14), 
        .ZN(N337) );
  MOAI22D1BWP30P140LVT U102 ( .A1(n34), .A2(n4), .B1(i_data_bus[19]), .B2(n14), 
        .ZN(N338) );
  MOAI22D1BWP30P140LVT U103 ( .A1(n35), .A2(n1), .B1(i_data_bus[20]), .B2(n14), 
        .ZN(N339) );
  MOAI22D1BWP30P140LVT U104 ( .A1(n36), .A2(n4), .B1(i_data_bus[21]), .B2(n14), 
        .ZN(N340) );
  MOAI22D1BWP30P140LVT U105 ( .A1(n37), .A2(n1), .B1(i_data_bus[22]), .B2(n14), 
        .ZN(N341) );
  MOAI22D1BWP30P140LVT U106 ( .A1(n38), .A2(n4), .B1(i_data_bus[23]), .B2(n14), 
        .ZN(N342) );
  MOAI22D1BWP30P140LVT U107 ( .A1(n39), .A2(n1), .B1(i_data_bus[24]), .B2(n14), 
        .ZN(N343) );
  MOAI22D1BWP30P140LVT U108 ( .A1(n40), .A2(n4), .B1(i_data_bus[25]), .B2(n14), 
        .ZN(N344) );
  MOAI22D1BWP30P140LVT U109 ( .A1(n41), .A2(n1), .B1(i_data_bus[26]), .B2(n14), 
        .ZN(N345) );
  MOAI22D1BWP30P140LVT U110 ( .A1(n42), .A2(n4), .B1(i_data_bus[27]), .B2(n14), 
        .ZN(N346) );
  MOAI22D1BWP30P140LVT U111 ( .A1(n43), .A2(n1), .B1(i_data_bus[28]), .B2(n14), 
        .ZN(N347) );
  MOAI22D1BWP30P140LVT U112 ( .A1(n44), .A2(n4), .B1(i_data_bus[29]), .B2(n14), 
        .ZN(N348) );
  MOAI22D1BWP30P140LVT U113 ( .A1(n45), .A2(n1), .B1(i_data_bus[30]), .B2(n14), 
        .ZN(N349) );
  MOAI22D1BWP30P140LVT U114 ( .A1(n46), .A2(n4), .B1(i_data_bus[31]), .B2(n14), 
        .ZN(N350) );
endmodule


module distribute_2x2_simple_seq_DATA_WIDTH32_COMMAND_WIDTH2_18 ( clk, rst, 
        i_valid, i_data_bus, o_valid, o_data_bus, i_en, i_cmd );
  input [1:0] i_valid;
  input [63:0] i_data_bus;
  output [1:0] o_valid;
  output [63:0] o_data_bus;
  input [1:0] i_cmd;
  input clk, rst, i_en;
  wire   N287, N288, N289, N290, N291, N292, N293, N294, N295, N296, N297,
         N298, N299, N300, N301, N302, N303, N304, N305, N306, N307, N308,
         N309, N310, N311, N312, N313, N314, N315, N316, N317, N318, N319,
         N320, N321, N322, N323, N324, N325, N326, N327, N328, N329, N330,
         N331, N332, N333, N334, N335, N336, N337, N338, N339, N340, N341,
         N342, N343, N344, N345, N346, N347, N348, N349, N350, N353, N354, n1,
         n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30,
         n31, n32, n33, n34, n35, n36, n37, n38, n39, n40, n41, n42, n43, n44,
         n45, n46;

  DFQD1BWP30P140LVT o_data_bus_inner_reg_63_ ( .D(N350), .CP(clk), .Q(
        o_data_bus[63]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_62_ ( .D(N349), .CP(clk), .Q(
        o_data_bus[62]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_61_ ( .D(N348), .CP(clk), .Q(
        o_data_bus[61]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_60_ ( .D(N347), .CP(clk), .Q(
        o_data_bus[60]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_59_ ( .D(N346), .CP(clk), .Q(
        o_data_bus[59]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_58_ ( .D(N345), .CP(clk), .Q(
        o_data_bus[58]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_57_ ( .D(N344), .CP(clk), .Q(
        o_data_bus[57]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_56_ ( .D(N343), .CP(clk), .Q(
        o_data_bus[56]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_55_ ( .D(N342), .CP(clk), .Q(
        o_data_bus[55]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_54_ ( .D(N341), .CP(clk), .Q(
        o_data_bus[54]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_53_ ( .D(N340), .CP(clk), .Q(
        o_data_bus[53]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_52_ ( .D(N339), .CP(clk), .Q(
        o_data_bus[52]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_51_ ( .D(N338), .CP(clk), .Q(
        o_data_bus[51]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_50_ ( .D(N337), .CP(clk), .Q(
        o_data_bus[50]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_49_ ( .D(N336), .CP(clk), .Q(
        o_data_bus[49]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_48_ ( .D(N335), .CP(clk), .Q(
        o_data_bus[48]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_47_ ( .D(N334), .CP(clk), .Q(
        o_data_bus[47]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_46_ ( .D(N333), .CP(clk), .Q(
        o_data_bus[46]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_45_ ( .D(N332), .CP(clk), .Q(
        o_data_bus[45]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_44_ ( .D(N331), .CP(clk), .Q(
        o_data_bus[44]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_43_ ( .D(N330), .CP(clk), .Q(
        o_data_bus[43]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_42_ ( .D(N329), .CP(clk), .Q(
        o_data_bus[42]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_41_ ( .D(N328), .CP(clk), .Q(
        o_data_bus[41]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_40_ ( .D(N327), .CP(clk), .Q(
        o_data_bus[40]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_39_ ( .D(N326), .CP(clk), .Q(
        o_data_bus[39]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_38_ ( .D(N325), .CP(clk), .Q(
        o_data_bus[38]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_37_ ( .D(N324), .CP(clk), .Q(
        o_data_bus[37]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_36_ ( .D(N323), .CP(clk), .Q(
        o_data_bus[36]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_35_ ( .D(N322), .CP(clk), .Q(
        o_data_bus[35]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_34_ ( .D(N321), .CP(clk), .Q(
        o_data_bus[34]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_33_ ( .D(N320), .CP(clk), .Q(
        o_data_bus[33]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_32_ ( .D(N319), .CP(clk), .Q(
        o_data_bus[32]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_31_ ( .D(N318), .CP(clk), .Q(
        o_data_bus[31]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_30_ ( .D(N317), .CP(clk), .Q(
        o_data_bus[30]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_29_ ( .D(N316), .CP(clk), .Q(
        o_data_bus[29]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_28_ ( .D(N315), .CP(clk), .Q(
        o_data_bus[28]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_27_ ( .D(N314), .CP(clk), .Q(
        o_data_bus[27]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_26_ ( .D(N313), .CP(clk), .Q(
        o_data_bus[26]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_25_ ( .D(N312), .CP(clk), .Q(
        o_data_bus[25]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_24_ ( .D(N311), .CP(clk), .Q(
        o_data_bus[24]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_23_ ( .D(N310), .CP(clk), .Q(
        o_data_bus[23]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_22_ ( .D(N309), .CP(clk), .Q(
        o_data_bus[22]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_21_ ( .D(N308), .CP(clk), .Q(
        o_data_bus[21]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_20_ ( .D(N307), .CP(clk), .Q(
        o_data_bus[20]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_19_ ( .D(N306), .CP(clk), .Q(
        o_data_bus[19]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_18_ ( .D(N305), .CP(clk), .Q(
        o_data_bus[18]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_17_ ( .D(N304), .CP(clk), .Q(
        o_data_bus[17]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_16_ ( .D(N303), .CP(clk), .Q(
        o_data_bus[16]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_15_ ( .D(N302), .CP(clk), .Q(
        o_data_bus[15]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_14_ ( .D(N301), .CP(clk), .Q(
        o_data_bus[14]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_13_ ( .D(N300), .CP(clk), .Q(
        o_data_bus[13]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_12_ ( .D(N299), .CP(clk), .Q(
        o_data_bus[12]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_11_ ( .D(N298), .CP(clk), .Q(
        o_data_bus[11]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_10_ ( .D(N297), .CP(clk), .Q(
        o_data_bus[10]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_9_ ( .D(N296), .CP(clk), .Q(
        o_data_bus[9]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_8_ ( .D(N295), .CP(clk), .Q(
        o_data_bus[8]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_7_ ( .D(N294), .CP(clk), .Q(
        o_data_bus[7]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_6_ ( .D(N293), .CP(clk), .Q(
        o_data_bus[6]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_5_ ( .D(N292), .CP(clk), .Q(
        o_data_bus[5]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_4_ ( .D(N291), .CP(clk), .Q(
        o_data_bus[4]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_3_ ( .D(N290), .CP(clk), .Q(
        o_data_bus[3]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_2_ ( .D(N289), .CP(clk), .Q(
        o_data_bus[2]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_1_ ( .D(N288), .CP(clk), .Q(
        o_data_bus[1]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_0_ ( .D(N287), .CP(clk), .Q(
        o_data_bus[0]) );
  DFQD1BWP30P140LVT o_valid_inner_reg_1_ ( .D(N354), .CP(clk), .Q(o_valid[1])
         );
  DFQD1BWP30P140LVT o_valid_inner_reg_0_ ( .D(N353), .CP(clk), .Q(o_valid[0])
         );
  BUFFD4BWP30P140LVT U3 ( .I(n8), .Z(n9) );
  BUFFD6BWP30P140LVT U4 ( .I(n13), .Z(n14) );
  OAI211OPTREPBD1BWP30P140LVT U5 ( .A1(i_cmd[1]), .A2(i_valid[0]), .B(i_cmd[0]), .C(n7), .ZN(n8) );
  NR2D3BWP30P140LVT U6 ( .A1(i_cmd[0]), .A2(n5), .ZN(n2) );
  INVD1BWP30P140LVT U7 ( .I(i_valid[1]), .ZN(n12) );
  ND2OPTIBD1BWP30P140LVT U8 ( .A1(n10), .A2(i_valid[0]), .ZN(n5) );
  ND3D2BWP30P140LVT U9 ( .A1(n10), .A2(i_cmd[1]), .A3(i_valid[1]), .ZN(n1) );
  ND3D2BWP30P140LVT U10 ( .A1(n10), .A2(i_cmd[1]), .A3(i_valid[1]), .ZN(n4) );
  INR2D1BWP30P140LVT U11 ( .A1(i_en), .B1(rst), .ZN(n10) );
  AOI31D1BWP30P140LVT U12 ( .A1(i_cmd[0]), .A2(n10), .A3(i_valid[1]), .B(n2), 
        .ZN(n3) );
  INVD1BWP30P140LVT U13 ( .I(n3), .ZN(N353) );
  OAI21D1BWP30P140LVT U14 ( .A1(i_cmd[1]), .A2(n5), .B(n4), .ZN(N354) );
  INVD1BWP30P140LVT U15 ( .I(i_data_bus[32]), .ZN(n15) );
  INVD1BWP30P140LVT U16 ( .I(n10), .ZN(n6) );
  AOI21D1BWP30P140LVT U17 ( .A1(i_cmd[1]), .A2(n12), .B(n6), .ZN(n7) );
  MOAI22D1BWP30P140LVT U18 ( .A1(n15), .A2(n9), .B1(i_data_bus[0]), .B2(n2), 
        .ZN(N287) );
  INVD1BWP30P140LVT U19 ( .I(i_data_bus[33]), .ZN(n16) );
  MOAI22D1BWP30P140LVT U20 ( .A1(n9), .A2(n16), .B1(n2), .B2(i_data_bus[1]), 
        .ZN(N288) );
  INVD1BWP30P140LVT U21 ( .I(i_data_bus[34]), .ZN(n17) );
  MOAI22D1BWP30P140LVT U22 ( .A1(n9), .A2(n17), .B1(n2), .B2(i_data_bus[2]), 
        .ZN(N289) );
  INVD1BWP30P140LVT U23 ( .I(i_data_bus[35]), .ZN(n18) );
  MOAI22D1BWP30P140LVT U24 ( .A1(n9), .A2(n18), .B1(n2), .B2(i_data_bus[3]), 
        .ZN(N290) );
  INVD1BWP30P140LVT U25 ( .I(i_data_bus[36]), .ZN(n19) );
  MOAI22D1BWP30P140LVT U26 ( .A1(n9), .A2(n19), .B1(n2), .B2(i_data_bus[4]), 
        .ZN(N291) );
  INVD1BWP30P140LVT U27 ( .I(i_data_bus[37]), .ZN(n20) );
  MOAI22D1BWP30P140LVT U28 ( .A1(n9), .A2(n20), .B1(n2), .B2(i_data_bus[5]), 
        .ZN(N292) );
  INVD1BWP30P140LVT U29 ( .I(i_data_bus[38]), .ZN(n21) );
  MOAI22D1BWP30P140LVT U30 ( .A1(n9), .A2(n21), .B1(n2), .B2(i_data_bus[6]), 
        .ZN(N293) );
  INVD1BWP30P140LVT U31 ( .I(i_data_bus[39]), .ZN(n22) );
  MOAI22D1BWP30P140LVT U32 ( .A1(n9), .A2(n22), .B1(n2), .B2(i_data_bus[7]), 
        .ZN(N294) );
  INVD1BWP30P140LVT U33 ( .I(i_data_bus[40]), .ZN(n23) );
  MOAI22D1BWP30P140LVT U34 ( .A1(n9), .A2(n23), .B1(n2), .B2(i_data_bus[8]), 
        .ZN(N295) );
  INVD1BWP30P140LVT U35 ( .I(i_data_bus[41]), .ZN(n24) );
  MOAI22D1BWP30P140LVT U36 ( .A1(n9), .A2(n24), .B1(n2), .B2(i_data_bus[9]), 
        .ZN(N296) );
  INVD1BWP30P140LVT U37 ( .I(i_data_bus[42]), .ZN(n25) );
  MOAI22D1BWP30P140LVT U38 ( .A1(n9), .A2(n25), .B1(n2), .B2(i_data_bus[10]), 
        .ZN(N297) );
  INVD1BWP30P140LVT U39 ( .I(i_data_bus[43]), .ZN(n26) );
  MOAI22D1BWP30P140LVT U40 ( .A1(n9), .A2(n26), .B1(n2), .B2(i_data_bus[11]), 
        .ZN(N298) );
  INVD1BWP30P140LVT U41 ( .I(i_data_bus[44]), .ZN(n27) );
  MOAI22D1BWP30P140LVT U42 ( .A1(n9), .A2(n27), .B1(n2), .B2(i_data_bus[12]), 
        .ZN(N299) );
  INVD1BWP30P140LVT U43 ( .I(i_data_bus[45]), .ZN(n28) );
  MOAI22D1BWP30P140LVT U44 ( .A1(n9), .A2(n28), .B1(n2), .B2(i_data_bus[13]), 
        .ZN(N300) );
  INVD1BWP30P140LVT U45 ( .I(i_data_bus[46]), .ZN(n29) );
  MOAI22D1BWP30P140LVT U46 ( .A1(n9), .A2(n29), .B1(n2), .B2(i_data_bus[14]), 
        .ZN(N301) );
  INVD1BWP30P140LVT U47 ( .I(i_data_bus[47]), .ZN(n30) );
  MOAI22D1BWP30P140LVT U48 ( .A1(n9), .A2(n30), .B1(n2), .B2(i_data_bus[15]), 
        .ZN(N302) );
  INVD1BWP30P140LVT U49 ( .I(i_data_bus[48]), .ZN(n31) );
  MOAI22D1BWP30P140LVT U50 ( .A1(n9), .A2(n31), .B1(n2), .B2(i_data_bus[16]), 
        .ZN(N303) );
  INVD1BWP30P140LVT U51 ( .I(i_data_bus[49]), .ZN(n32) );
  MOAI22D1BWP30P140LVT U52 ( .A1(n9), .A2(n32), .B1(n2), .B2(i_data_bus[17]), 
        .ZN(N304) );
  INVD1BWP30P140LVT U53 ( .I(i_data_bus[50]), .ZN(n33) );
  MOAI22D1BWP30P140LVT U54 ( .A1(n9), .A2(n33), .B1(n2), .B2(i_data_bus[18]), 
        .ZN(N305) );
  INVD1BWP30P140LVT U55 ( .I(i_data_bus[51]), .ZN(n34) );
  MOAI22D1BWP30P140LVT U56 ( .A1(n9), .A2(n34), .B1(n2), .B2(i_data_bus[19]), 
        .ZN(N306) );
  INVD1BWP30P140LVT U57 ( .I(i_data_bus[52]), .ZN(n35) );
  MOAI22D1BWP30P140LVT U58 ( .A1(n9), .A2(n35), .B1(n2), .B2(i_data_bus[20]), 
        .ZN(N307) );
  INVD1BWP30P140LVT U59 ( .I(i_data_bus[53]), .ZN(n36) );
  MOAI22D1BWP30P140LVT U60 ( .A1(n9), .A2(n36), .B1(n2), .B2(i_data_bus[21]), 
        .ZN(N308) );
  INVD1BWP30P140LVT U61 ( .I(i_data_bus[54]), .ZN(n37) );
  MOAI22D1BWP30P140LVT U62 ( .A1(n9), .A2(n37), .B1(n2), .B2(i_data_bus[22]), 
        .ZN(N309) );
  INVD1BWP30P140LVT U63 ( .I(i_data_bus[55]), .ZN(n38) );
  MOAI22D1BWP30P140LVT U64 ( .A1(n9), .A2(n38), .B1(n2), .B2(i_data_bus[23]), 
        .ZN(N310) );
  INVD1BWP30P140LVT U65 ( .I(i_data_bus[56]), .ZN(n39) );
  MOAI22D1BWP30P140LVT U66 ( .A1(n9), .A2(n39), .B1(n2), .B2(i_data_bus[24]), 
        .ZN(N311) );
  INVD1BWP30P140LVT U67 ( .I(i_data_bus[57]), .ZN(n40) );
  MOAI22D1BWP30P140LVT U68 ( .A1(n9), .A2(n40), .B1(n2), .B2(i_data_bus[25]), 
        .ZN(N312) );
  INVD1BWP30P140LVT U69 ( .I(i_data_bus[58]), .ZN(n41) );
  MOAI22D1BWP30P140LVT U70 ( .A1(n9), .A2(n41), .B1(n2), .B2(i_data_bus[26]), 
        .ZN(N313) );
  INVD1BWP30P140LVT U71 ( .I(i_data_bus[59]), .ZN(n42) );
  MOAI22D1BWP30P140LVT U72 ( .A1(n9), .A2(n42), .B1(n2), .B2(i_data_bus[27]), 
        .ZN(N314) );
  INVD1BWP30P140LVT U73 ( .I(i_data_bus[60]), .ZN(n43) );
  MOAI22D1BWP30P140LVT U74 ( .A1(n9), .A2(n43), .B1(n2), .B2(i_data_bus[28]), 
        .ZN(N315) );
  INVD1BWP30P140LVT U75 ( .I(i_data_bus[61]), .ZN(n44) );
  MOAI22D1BWP30P140LVT U76 ( .A1(n9), .A2(n44), .B1(n2), .B2(i_data_bus[29]), 
        .ZN(N316) );
  INVD1BWP30P140LVT U77 ( .I(i_data_bus[62]), .ZN(n45) );
  MOAI22D1BWP30P140LVT U78 ( .A1(n9), .A2(n45), .B1(n2), .B2(i_data_bus[30]), 
        .ZN(N317) );
  INVD1BWP30P140LVT U79 ( .I(i_data_bus[63]), .ZN(n46) );
  MOAI22D1BWP30P140LVT U80 ( .A1(n9), .A2(n46), .B1(n2), .B2(i_data_bus[31]), 
        .ZN(N318) );
  OAI21D2BWP30P140LVT U81 ( .A1(i_cmd[0]), .A2(i_valid[0]), .B(n10), .ZN(n11)
         );
  AOI211D2BWP30P140LVT U82 ( .A1(i_cmd[0]), .A2(n12), .B(i_cmd[1]), .C(n11), 
        .ZN(n13) );
  MOAI22D1BWP30P140LVT U83 ( .A1(n15), .A2(n1), .B1(i_data_bus[0]), .B2(n14), 
        .ZN(N319) );
  MOAI22D1BWP30P140LVT U84 ( .A1(n16), .A2(n4), .B1(i_data_bus[1]), .B2(n14), 
        .ZN(N320) );
  MOAI22D1BWP30P140LVT U85 ( .A1(n17), .A2(n1), .B1(i_data_bus[2]), .B2(n14), 
        .ZN(N321) );
  MOAI22D1BWP30P140LVT U86 ( .A1(n18), .A2(n4), .B1(i_data_bus[3]), .B2(n14), 
        .ZN(N322) );
  MOAI22D1BWP30P140LVT U87 ( .A1(n19), .A2(n1), .B1(i_data_bus[4]), .B2(n14), 
        .ZN(N323) );
  MOAI22D1BWP30P140LVT U88 ( .A1(n20), .A2(n4), .B1(i_data_bus[5]), .B2(n14), 
        .ZN(N324) );
  MOAI22D1BWP30P140LVT U89 ( .A1(n21), .A2(n1), .B1(i_data_bus[6]), .B2(n14), 
        .ZN(N325) );
  MOAI22D1BWP30P140LVT U90 ( .A1(n22), .A2(n4), .B1(i_data_bus[7]), .B2(n14), 
        .ZN(N326) );
  MOAI22D1BWP30P140LVT U91 ( .A1(n23), .A2(n1), .B1(i_data_bus[8]), .B2(n14), 
        .ZN(N327) );
  MOAI22D1BWP30P140LVT U92 ( .A1(n24), .A2(n4), .B1(i_data_bus[9]), .B2(n14), 
        .ZN(N328) );
  MOAI22D1BWP30P140LVT U93 ( .A1(n25), .A2(n1), .B1(i_data_bus[10]), .B2(n14), 
        .ZN(N329) );
  MOAI22D1BWP30P140LVT U94 ( .A1(n26), .A2(n4), .B1(i_data_bus[11]), .B2(n14), 
        .ZN(N330) );
  MOAI22D1BWP30P140LVT U95 ( .A1(n27), .A2(n1), .B1(i_data_bus[12]), .B2(n14), 
        .ZN(N331) );
  MOAI22D1BWP30P140LVT U96 ( .A1(n28), .A2(n4), .B1(i_data_bus[13]), .B2(n14), 
        .ZN(N332) );
  MOAI22D1BWP30P140LVT U97 ( .A1(n29), .A2(n1), .B1(i_data_bus[14]), .B2(n14), 
        .ZN(N333) );
  MOAI22D1BWP30P140LVT U98 ( .A1(n30), .A2(n4), .B1(i_data_bus[15]), .B2(n14), 
        .ZN(N334) );
  MOAI22D1BWP30P140LVT U99 ( .A1(n31), .A2(n1), .B1(i_data_bus[16]), .B2(n14), 
        .ZN(N335) );
  MOAI22D1BWP30P140LVT U100 ( .A1(n32), .A2(n4), .B1(i_data_bus[17]), .B2(n14), 
        .ZN(N336) );
  MOAI22D1BWP30P140LVT U101 ( .A1(n33), .A2(n1), .B1(i_data_bus[18]), .B2(n14), 
        .ZN(N337) );
  MOAI22D1BWP30P140LVT U102 ( .A1(n34), .A2(n4), .B1(i_data_bus[19]), .B2(n14), 
        .ZN(N338) );
  MOAI22D1BWP30P140LVT U103 ( .A1(n35), .A2(n1), .B1(i_data_bus[20]), .B2(n14), 
        .ZN(N339) );
  MOAI22D1BWP30P140LVT U104 ( .A1(n36), .A2(n4), .B1(i_data_bus[21]), .B2(n14), 
        .ZN(N340) );
  MOAI22D1BWP30P140LVT U105 ( .A1(n37), .A2(n1), .B1(i_data_bus[22]), .B2(n14), 
        .ZN(N341) );
  MOAI22D1BWP30P140LVT U106 ( .A1(n38), .A2(n4), .B1(i_data_bus[23]), .B2(n14), 
        .ZN(N342) );
  MOAI22D1BWP30P140LVT U107 ( .A1(n39), .A2(n1), .B1(i_data_bus[24]), .B2(n14), 
        .ZN(N343) );
  MOAI22D1BWP30P140LVT U108 ( .A1(n40), .A2(n4), .B1(i_data_bus[25]), .B2(n14), 
        .ZN(N344) );
  MOAI22D1BWP30P140LVT U109 ( .A1(n41), .A2(n1), .B1(i_data_bus[26]), .B2(n14), 
        .ZN(N345) );
  MOAI22D1BWP30P140LVT U110 ( .A1(n42), .A2(n4), .B1(i_data_bus[27]), .B2(n14), 
        .ZN(N346) );
  MOAI22D1BWP30P140LVT U111 ( .A1(n43), .A2(n1), .B1(i_data_bus[28]), .B2(n14), 
        .ZN(N347) );
  MOAI22D1BWP30P140LVT U112 ( .A1(n44), .A2(n4), .B1(i_data_bus[29]), .B2(n14), 
        .ZN(N348) );
  MOAI22D1BWP30P140LVT U113 ( .A1(n45), .A2(n1), .B1(i_data_bus[30]), .B2(n14), 
        .ZN(N349) );
  MOAI22D1BWP30P140LVT U114 ( .A1(n46), .A2(n4), .B1(i_data_bus[31]), .B2(n14), 
        .ZN(N350) );
endmodule


module distribute_2x2_simple_seq_DATA_WIDTH32_COMMAND_WIDTH2_19 ( clk, rst, 
        i_valid, i_data_bus, o_valid, o_data_bus, i_en, i_cmd );
  input [1:0] i_valid;
  input [63:0] i_data_bus;
  output [1:0] o_valid;
  output [63:0] o_data_bus;
  input [1:0] i_cmd;
  input clk, rst, i_en;
  wire   N287, N288, N289, N290, N291, N292, N293, N294, N295, N296, N297,
         N298, N299, N300, N301, N302, N303, N304, N305, N306, N307, N308,
         N309, N310, N311, N312, N313, N314, N315, N316, N317, N318, N319,
         N320, N321, N322, N323, N324, N325, N326, N327, N328, N329, N330,
         N331, N332, N333, N334, N335, N336, N337, N338, N339, N340, N341,
         N342, N343, N344, N345, N346, N347, N348, N349, N350, N353, N354, n1,
         n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30,
         n31, n32, n33, n34, n35, n36, n37, n38, n39, n40, n41, n42, n43, n44,
         n45, n46;

  DFQD1BWP30P140LVT o_data_bus_inner_reg_63_ ( .D(N350), .CP(clk), .Q(
        o_data_bus[63]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_62_ ( .D(N349), .CP(clk), .Q(
        o_data_bus[62]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_61_ ( .D(N348), .CP(clk), .Q(
        o_data_bus[61]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_60_ ( .D(N347), .CP(clk), .Q(
        o_data_bus[60]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_59_ ( .D(N346), .CP(clk), .Q(
        o_data_bus[59]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_58_ ( .D(N345), .CP(clk), .Q(
        o_data_bus[58]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_57_ ( .D(N344), .CP(clk), .Q(
        o_data_bus[57]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_56_ ( .D(N343), .CP(clk), .Q(
        o_data_bus[56]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_55_ ( .D(N342), .CP(clk), .Q(
        o_data_bus[55]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_54_ ( .D(N341), .CP(clk), .Q(
        o_data_bus[54]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_53_ ( .D(N340), .CP(clk), .Q(
        o_data_bus[53]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_52_ ( .D(N339), .CP(clk), .Q(
        o_data_bus[52]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_51_ ( .D(N338), .CP(clk), .Q(
        o_data_bus[51]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_50_ ( .D(N337), .CP(clk), .Q(
        o_data_bus[50]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_49_ ( .D(N336), .CP(clk), .Q(
        o_data_bus[49]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_48_ ( .D(N335), .CP(clk), .Q(
        o_data_bus[48]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_47_ ( .D(N334), .CP(clk), .Q(
        o_data_bus[47]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_46_ ( .D(N333), .CP(clk), .Q(
        o_data_bus[46]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_45_ ( .D(N332), .CP(clk), .Q(
        o_data_bus[45]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_44_ ( .D(N331), .CP(clk), .Q(
        o_data_bus[44]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_43_ ( .D(N330), .CP(clk), .Q(
        o_data_bus[43]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_42_ ( .D(N329), .CP(clk), .Q(
        o_data_bus[42]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_41_ ( .D(N328), .CP(clk), .Q(
        o_data_bus[41]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_40_ ( .D(N327), .CP(clk), .Q(
        o_data_bus[40]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_39_ ( .D(N326), .CP(clk), .Q(
        o_data_bus[39]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_38_ ( .D(N325), .CP(clk), .Q(
        o_data_bus[38]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_37_ ( .D(N324), .CP(clk), .Q(
        o_data_bus[37]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_36_ ( .D(N323), .CP(clk), .Q(
        o_data_bus[36]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_35_ ( .D(N322), .CP(clk), .Q(
        o_data_bus[35]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_34_ ( .D(N321), .CP(clk), .Q(
        o_data_bus[34]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_33_ ( .D(N320), .CP(clk), .Q(
        o_data_bus[33]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_32_ ( .D(N319), .CP(clk), .Q(
        o_data_bus[32]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_31_ ( .D(N318), .CP(clk), .Q(
        o_data_bus[31]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_30_ ( .D(N317), .CP(clk), .Q(
        o_data_bus[30]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_29_ ( .D(N316), .CP(clk), .Q(
        o_data_bus[29]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_28_ ( .D(N315), .CP(clk), .Q(
        o_data_bus[28]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_27_ ( .D(N314), .CP(clk), .Q(
        o_data_bus[27]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_26_ ( .D(N313), .CP(clk), .Q(
        o_data_bus[26]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_25_ ( .D(N312), .CP(clk), .Q(
        o_data_bus[25]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_24_ ( .D(N311), .CP(clk), .Q(
        o_data_bus[24]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_23_ ( .D(N310), .CP(clk), .Q(
        o_data_bus[23]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_22_ ( .D(N309), .CP(clk), .Q(
        o_data_bus[22]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_21_ ( .D(N308), .CP(clk), .Q(
        o_data_bus[21]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_20_ ( .D(N307), .CP(clk), .Q(
        o_data_bus[20]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_19_ ( .D(N306), .CP(clk), .Q(
        o_data_bus[19]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_18_ ( .D(N305), .CP(clk), .Q(
        o_data_bus[18]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_17_ ( .D(N304), .CP(clk), .Q(
        o_data_bus[17]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_16_ ( .D(N303), .CP(clk), .Q(
        o_data_bus[16]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_15_ ( .D(N302), .CP(clk), .Q(
        o_data_bus[15]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_14_ ( .D(N301), .CP(clk), .Q(
        o_data_bus[14]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_13_ ( .D(N300), .CP(clk), .Q(
        o_data_bus[13]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_12_ ( .D(N299), .CP(clk), .Q(
        o_data_bus[12]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_11_ ( .D(N298), .CP(clk), .Q(
        o_data_bus[11]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_10_ ( .D(N297), .CP(clk), .Q(
        o_data_bus[10]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_9_ ( .D(N296), .CP(clk), .Q(
        o_data_bus[9]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_8_ ( .D(N295), .CP(clk), .Q(
        o_data_bus[8]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_7_ ( .D(N294), .CP(clk), .Q(
        o_data_bus[7]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_6_ ( .D(N293), .CP(clk), .Q(
        o_data_bus[6]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_5_ ( .D(N292), .CP(clk), .Q(
        o_data_bus[5]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_4_ ( .D(N291), .CP(clk), .Q(
        o_data_bus[4]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_3_ ( .D(N290), .CP(clk), .Q(
        o_data_bus[3]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_2_ ( .D(N289), .CP(clk), .Q(
        o_data_bus[2]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_1_ ( .D(N288), .CP(clk), .Q(
        o_data_bus[1]) );
  DFQD1BWP30P140LVT o_data_bus_inner_reg_0_ ( .D(N287), .CP(clk), .Q(
        o_data_bus[0]) );
  DFQD1BWP30P140LVT o_valid_inner_reg_1_ ( .D(N354), .CP(clk), .Q(o_valid[1])
         );
  DFQD1BWP30P140LVT o_valid_inner_reg_0_ ( .D(N353), .CP(clk), .Q(o_valid[0])
         );
  BUFFD4BWP30P140LVT U3 ( .I(n8), .Z(n9) );
  BUFFD6BWP30P140LVT U4 ( .I(n13), .Z(n14) );
  OAI211OPTREPBD1BWP30P140LVT U5 ( .A1(i_cmd[1]), .A2(i_valid[0]), .B(i_cmd[0]), .C(n7), .ZN(n8) );
  NR2D3BWP30P140LVT U6 ( .A1(i_cmd[0]), .A2(n5), .ZN(n2) );
  INVD1BWP30P140LVT U7 ( .I(i_valid[1]), .ZN(n12) );
  ND2OPTIBD1BWP30P140LVT U8 ( .A1(n10), .A2(i_valid[0]), .ZN(n5) );
  ND3D2BWP30P140LVT U9 ( .A1(n10), .A2(i_cmd[1]), .A3(i_valid[1]), .ZN(n1) );
  ND3D2BWP30P140LVT U10 ( .A1(n10), .A2(i_cmd[1]), .A3(i_valid[1]), .ZN(n4) );
  INR2D1BWP30P140LVT U11 ( .A1(i_en), .B1(rst), .ZN(n10) );
  AOI31D1BWP30P140LVT U12 ( .A1(i_cmd[0]), .A2(n10), .A3(i_valid[1]), .B(n2), 
        .ZN(n3) );
  INVD1BWP30P140LVT U13 ( .I(n3), .ZN(N353) );
  OAI21D1BWP30P140LVT U14 ( .A1(i_cmd[1]), .A2(n5), .B(n4), .ZN(N354) );
  INVD1BWP30P140LVT U15 ( .I(i_data_bus[32]), .ZN(n15) );
  INVD1BWP30P140LVT U16 ( .I(n10), .ZN(n6) );
  AOI21D1BWP30P140LVT U17 ( .A1(i_cmd[1]), .A2(n12), .B(n6), .ZN(n7) );
  MOAI22D1BWP30P140LVT U18 ( .A1(n15), .A2(n9), .B1(i_data_bus[0]), .B2(n2), 
        .ZN(N287) );
  INVD1BWP30P140LVT U19 ( .I(i_data_bus[33]), .ZN(n16) );
  MOAI22D1BWP30P140LVT U20 ( .A1(n9), .A2(n16), .B1(n2), .B2(i_data_bus[1]), 
        .ZN(N288) );
  INVD1BWP30P140LVT U21 ( .I(i_data_bus[34]), .ZN(n17) );
  MOAI22D1BWP30P140LVT U22 ( .A1(n9), .A2(n17), .B1(n2), .B2(i_data_bus[2]), 
        .ZN(N289) );
  INVD1BWP30P140LVT U23 ( .I(i_data_bus[35]), .ZN(n18) );
  MOAI22D1BWP30P140LVT U24 ( .A1(n9), .A2(n18), .B1(n2), .B2(i_data_bus[3]), 
        .ZN(N290) );
  INVD1BWP30P140LVT U25 ( .I(i_data_bus[36]), .ZN(n19) );
  MOAI22D1BWP30P140LVT U26 ( .A1(n9), .A2(n19), .B1(n2), .B2(i_data_bus[4]), 
        .ZN(N291) );
  INVD1BWP30P140LVT U27 ( .I(i_data_bus[37]), .ZN(n20) );
  MOAI22D1BWP30P140LVT U28 ( .A1(n9), .A2(n20), .B1(n2), .B2(i_data_bus[5]), 
        .ZN(N292) );
  INVD1BWP30P140LVT U29 ( .I(i_data_bus[38]), .ZN(n21) );
  MOAI22D1BWP30P140LVT U30 ( .A1(n9), .A2(n21), .B1(n2), .B2(i_data_bus[6]), 
        .ZN(N293) );
  INVD1BWP30P140LVT U31 ( .I(i_data_bus[39]), .ZN(n22) );
  MOAI22D1BWP30P140LVT U32 ( .A1(n9), .A2(n22), .B1(n2), .B2(i_data_bus[7]), 
        .ZN(N294) );
  INVD1BWP30P140LVT U33 ( .I(i_data_bus[40]), .ZN(n23) );
  MOAI22D1BWP30P140LVT U34 ( .A1(n9), .A2(n23), .B1(n2), .B2(i_data_bus[8]), 
        .ZN(N295) );
  INVD1BWP30P140LVT U35 ( .I(i_data_bus[41]), .ZN(n24) );
  MOAI22D1BWP30P140LVT U36 ( .A1(n9), .A2(n24), .B1(n2), .B2(i_data_bus[9]), 
        .ZN(N296) );
  INVD1BWP30P140LVT U37 ( .I(i_data_bus[42]), .ZN(n25) );
  MOAI22D1BWP30P140LVT U38 ( .A1(n9), .A2(n25), .B1(n2), .B2(i_data_bus[10]), 
        .ZN(N297) );
  INVD1BWP30P140LVT U39 ( .I(i_data_bus[43]), .ZN(n26) );
  MOAI22D1BWP30P140LVT U40 ( .A1(n9), .A2(n26), .B1(n2), .B2(i_data_bus[11]), 
        .ZN(N298) );
  INVD1BWP30P140LVT U41 ( .I(i_data_bus[44]), .ZN(n27) );
  MOAI22D1BWP30P140LVT U42 ( .A1(n9), .A2(n27), .B1(n2), .B2(i_data_bus[12]), 
        .ZN(N299) );
  INVD1BWP30P140LVT U43 ( .I(i_data_bus[45]), .ZN(n28) );
  MOAI22D1BWP30P140LVT U44 ( .A1(n9), .A2(n28), .B1(n2), .B2(i_data_bus[13]), 
        .ZN(N300) );
  INVD1BWP30P140LVT U45 ( .I(i_data_bus[46]), .ZN(n29) );
  MOAI22D1BWP30P140LVT U46 ( .A1(n9), .A2(n29), .B1(n2), .B2(i_data_bus[14]), 
        .ZN(N301) );
  INVD1BWP30P140LVT U47 ( .I(i_data_bus[47]), .ZN(n30) );
  MOAI22D1BWP30P140LVT U48 ( .A1(n9), .A2(n30), .B1(n2), .B2(i_data_bus[15]), 
        .ZN(N302) );
  INVD1BWP30P140LVT U49 ( .I(i_data_bus[48]), .ZN(n31) );
  MOAI22D1BWP30P140LVT U50 ( .A1(n9), .A2(n31), .B1(n2), .B2(i_data_bus[16]), 
        .ZN(N303) );
  INVD1BWP30P140LVT U51 ( .I(i_data_bus[49]), .ZN(n32) );
  MOAI22D1BWP30P140LVT U52 ( .A1(n9), .A2(n32), .B1(n2), .B2(i_data_bus[17]), 
        .ZN(N304) );
  INVD1BWP30P140LVT U53 ( .I(i_data_bus[50]), .ZN(n33) );
  MOAI22D1BWP30P140LVT U54 ( .A1(n9), .A2(n33), .B1(n2), .B2(i_data_bus[18]), 
        .ZN(N305) );
  INVD1BWP30P140LVT U55 ( .I(i_data_bus[51]), .ZN(n34) );
  MOAI22D1BWP30P140LVT U56 ( .A1(n9), .A2(n34), .B1(n2), .B2(i_data_bus[19]), 
        .ZN(N306) );
  INVD1BWP30P140LVT U57 ( .I(i_data_bus[52]), .ZN(n35) );
  MOAI22D1BWP30P140LVT U58 ( .A1(n9), .A2(n35), .B1(n2), .B2(i_data_bus[20]), 
        .ZN(N307) );
  INVD1BWP30P140LVT U59 ( .I(i_data_bus[53]), .ZN(n36) );
  MOAI22D1BWP30P140LVT U60 ( .A1(n9), .A2(n36), .B1(n2), .B2(i_data_bus[21]), 
        .ZN(N308) );
  INVD1BWP30P140LVT U61 ( .I(i_data_bus[54]), .ZN(n37) );
  MOAI22D1BWP30P140LVT U62 ( .A1(n9), .A2(n37), .B1(n2), .B2(i_data_bus[22]), 
        .ZN(N309) );
  INVD1BWP30P140LVT U63 ( .I(i_data_bus[55]), .ZN(n38) );
  MOAI22D1BWP30P140LVT U64 ( .A1(n9), .A2(n38), .B1(n2), .B2(i_data_bus[23]), 
        .ZN(N310) );
  INVD1BWP30P140LVT U65 ( .I(i_data_bus[56]), .ZN(n39) );
  MOAI22D1BWP30P140LVT U66 ( .A1(n9), .A2(n39), .B1(n2), .B2(i_data_bus[24]), 
        .ZN(N311) );
  INVD1BWP30P140LVT U67 ( .I(i_data_bus[57]), .ZN(n40) );
  MOAI22D1BWP30P140LVT U68 ( .A1(n9), .A2(n40), .B1(n2), .B2(i_data_bus[25]), 
        .ZN(N312) );
  INVD1BWP30P140LVT U69 ( .I(i_data_bus[58]), .ZN(n41) );
  MOAI22D1BWP30P140LVT U70 ( .A1(n9), .A2(n41), .B1(n2), .B2(i_data_bus[26]), 
        .ZN(N313) );
  INVD1BWP30P140LVT U71 ( .I(i_data_bus[59]), .ZN(n42) );
  MOAI22D1BWP30P140LVT U72 ( .A1(n9), .A2(n42), .B1(n2), .B2(i_data_bus[27]), 
        .ZN(N314) );
  INVD1BWP30P140LVT U73 ( .I(i_data_bus[60]), .ZN(n43) );
  MOAI22D1BWP30P140LVT U74 ( .A1(n9), .A2(n43), .B1(n2), .B2(i_data_bus[28]), 
        .ZN(N315) );
  INVD1BWP30P140LVT U75 ( .I(i_data_bus[61]), .ZN(n44) );
  MOAI22D1BWP30P140LVT U76 ( .A1(n9), .A2(n44), .B1(n2), .B2(i_data_bus[29]), 
        .ZN(N316) );
  INVD1BWP30P140LVT U77 ( .I(i_data_bus[62]), .ZN(n45) );
  MOAI22D1BWP30P140LVT U78 ( .A1(n9), .A2(n45), .B1(n2), .B2(i_data_bus[30]), 
        .ZN(N317) );
  INVD1BWP30P140LVT U79 ( .I(i_data_bus[63]), .ZN(n46) );
  MOAI22D1BWP30P140LVT U80 ( .A1(n9), .A2(n46), .B1(n2), .B2(i_data_bus[31]), 
        .ZN(N318) );
  OAI21D2BWP30P140LVT U81 ( .A1(i_cmd[0]), .A2(i_valid[0]), .B(n10), .ZN(n11)
         );
  AOI211D2BWP30P140LVT U82 ( .A1(i_cmd[0]), .A2(n12), .B(i_cmd[1]), .C(n11), 
        .ZN(n13) );
  MOAI22D1BWP30P140LVT U83 ( .A1(n15), .A2(n1), .B1(i_data_bus[0]), .B2(n14), 
        .ZN(N319) );
  MOAI22D1BWP30P140LVT U84 ( .A1(n16), .A2(n4), .B1(i_data_bus[1]), .B2(n14), 
        .ZN(N320) );
  MOAI22D1BWP30P140LVT U85 ( .A1(n17), .A2(n1), .B1(i_data_bus[2]), .B2(n14), 
        .ZN(N321) );
  MOAI22D1BWP30P140LVT U86 ( .A1(n18), .A2(n4), .B1(i_data_bus[3]), .B2(n14), 
        .ZN(N322) );
  MOAI22D1BWP30P140LVT U87 ( .A1(n19), .A2(n1), .B1(i_data_bus[4]), .B2(n14), 
        .ZN(N323) );
  MOAI22D1BWP30P140LVT U88 ( .A1(n20), .A2(n4), .B1(i_data_bus[5]), .B2(n14), 
        .ZN(N324) );
  MOAI22D1BWP30P140LVT U89 ( .A1(n21), .A2(n1), .B1(i_data_bus[6]), .B2(n14), 
        .ZN(N325) );
  MOAI22D1BWP30P140LVT U90 ( .A1(n22), .A2(n4), .B1(i_data_bus[7]), .B2(n14), 
        .ZN(N326) );
  MOAI22D1BWP30P140LVT U91 ( .A1(n23), .A2(n1), .B1(i_data_bus[8]), .B2(n14), 
        .ZN(N327) );
  MOAI22D1BWP30P140LVT U92 ( .A1(n24), .A2(n4), .B1(i_data_bus[9]), .B2(n14), 
        .ZN(N328) );
  MOAI22D1BWP30P140LVT U93 ( .A1(n25), .A2(n1), .B1(i_data_bus[10]), .B2(n14), 
        .ZN(N329) );
  MOAI22D1BWP30P140LVT U94 ( .A1(n26), .A2(n4), .B1(i_data_bus[11]), .B2(n14), 
        .ZN(N330) );
  MOAI22D1BWP30P140LVT U95 ( .A1(n27), .A2(n1), .B1(i_data_bus[12]), .B2(n14), 
        .ZN(N331) );
  MOAI22D1BWP30P140LVT U96 ( .A1(n28), .A2(n4), .B1(i_data_bus[13]), .B2(n14), 
        .ZN(N332) );
  MOAI22D1BWP30P140LVT U97 ( .A1(n29), .A2(n1), .B1(i_data_bus[14]), .B2(n14), 
        .ZN(N333) );
  MOAI22D1BWP30P140LVT U98 ( .A1(n30), .A2(n4), .B1(i_data_bus[15]), .B2(n14), 
        .ZN(N334) );
  MOAI22D1BWP30P140LVT U99 ( .A1(n31), .A2(n1), .B1(i_data_bus[16]), .B2(n14), 
        .ZN(N335) );
  MOAI22D1BWP30P140LVT U100 ( .A1(n32), .A2(n4), .B1(i_data_bus[17]), .B2(n14), 
        .ZN(N336) );
  MOAI22D1BWP30P140LVT U101 ( .A1(n33), .A2(n1), .B1(i_data_bus[18]), .B2(n14), 
        .ZN(N337) );
  MOAI22D1BWP30P140LVT U102 ( .A1(n34), .A2(n4), .B1(i_data_bus[19]), .B2(n14), 
        .ZN(N338) );
  MOAI22D1BWP30P140LVT U103 ( .A1(n35), .A2(n1), .B1(i_data_bus[20]), .B2(n14), 
        .ZN(N339) );
  MOAI22D1BWP30P140LVT U104 ( .A1(n36), .A2(n4), .B1(i_data_bus[21]), .B2(n14), 
        .ZN(N340) );
  MOAI22D1BWP30P140LVT U105 ( .A1(n37), .A2(n1), .B1(i_data_bus[22]), .B2(n14), 
        .ZN(N341) );
  MOAI22D1BWP30P140LVT U106 ( .A1(n38), .A2(n4), .B1(i_data_bus[23]), .B2(n14), 
        .ZN(N342) );
  MOAI22D1BWP30P140LVT U107 ( .A1(n39), .A2(n1), .B1(i_data_bus[24]), .B2(n14), 
        .ZN(N343) );
  MOAI22D1BWP30P140LVT U108 ( .A1(n40), .A2(n4), .B1(i_data_bus[25]), .B2(n14), 
        .ZN(N344) );
  MOAI22D1BWP30P140LVT U109 ( .A1(n41), .A2(n1), .B1(i_data_bus[26]), .B2(n14), 
        .ZN(N345) );
  MOAI22D1BWP30P140LVT U110 ( .A1(n42), .A2(n4), .B1(i_data_bus[27]), .B2(n14), 
        .ZN(N346) );
  MOAI22D1BWP30P140LVT U111 ( .A1(n43), .A2(n1), .B1(i_data_bus[28]), .B2(n14), 
        .ZN(N347) );
  MOAI22D1BWP30P140LVT U112 ( .A1(n44), .A2(n4), .B1(i_data_bus[29]), .B2(n14), 
        .ZN(N348) );
  MOAI22D1BWP30P140LVT U113 ( .A1(n45), .A2(n1), .B1(i_data_bus[30]), .B2(n14), 
        .ZN(N349) );
  MOAI22D1BWP30P140LVT U114 ( .A1(n46), .A2(n4), .B1(i_data_bus[31]), .B2(n14), 
        .ZN(N350) );
endmodule


module benes_simple_seq ( clk, rst, i_valid, i_data_bus, o_valid, o_data_bus, 
        i_en, i_cmd );
  input [7:0] i_valid;
  input [255:0] i_data_bus;
  output [7:0] o_valid;
  output [255:0] o_data_bus;
  input [39:0] i_cmd;
  input clk, rst, i_en;
  wire   n267, n268, n269, n270, n271, n272, n273, n274, n275, n276, n277,
         n278, n279, n280, n281, n282, n283, n284, n285, n286, n287, n288,
         n289, n290, n291, n292, n293, n294, n295, n296, n297, n298, n299,
         n300, n301, n302, n303, n304, n305, n306, n307, n308, n309, n310,
         n311, n312, n313, n314, n315, n316, n317, n318, n319, n320, n321,
         n322, n323, n324, n325, n326, n327, n328, n329, n330, n331, n332,
         n333, n334, n335, n336, n337, n338, n339, n340, n341, n342, n343,
         n344, n345, n346, n347, n348, n349, n350, n351, n352, n353, n354,
         n355, n356, n357, n358, n359, n360, n361, n362, n363, n364, n365,
         n366, n367, n368, n369, n370, n371, n372, n373, n374, n375, n376,
         n377, n378, n379, n380, n381, n382, n383, n384, n385, n386, n387,
         n388, n389, n390, n391, n392, n393, n394, n395, n396, n397, n398,
         n399, n400, n401, n402, n403, n404, n405, n406, n407, n408, n409,
         n410, n411, n412, n413, n414, n415, n416, n417, n418, n419, n420,
         n421, n422, n423, n424, n425, n426, n427, n428, n429, n430, n431,
         n432, n433, n434, n435, n436, n437, n438, n439, n440, n441, n442,
         n443, n444, n445, n446, n447, n448, n449, n450, n451, n452, n453,
         n454, n455, n456, n457, n458, n459, n460, n461, n462, n463, n464,
         n465, n466, n467, n468, n469, n470, n471, n472, n473, n474, n475,
         n476, n477, n478, n479, n480, n481, n482, n483, n484, n485, n486,
         n487, n488, n489, n490, n491, n492, n493, n494, n495, n496, n497,
         n498, n499, n500, n501, n502, n503, n504, n505, n506, n507, n508,
         n509, n510, n511, n512, n513, n514, n515, n516, n517, n518, n519,
         n520, n521, n522, n523, n524, n525, n526, n527, n528, n529, n530,
         connection_0__0__31_, connection_0__0__30_, connection_0__0__29_,
         connection_0__0__28_, connection_0__0__27_, connection_0__0__26_,
         connection_0__0__25_, connection_0__0__24_, connection_0__0__23_,
         connection_0__0__22_, connection_0__0__21_, connection_0__0__20_,
         connection_0__0__19_, connection_0__0__18_, connection_0__0__17_,
         connection_0__0__16_, connection_0__0__15_, connection_0__0__14_,
         connection_0__0__13_, connection_0__0__12_, connection_0__0__11_,
         connection_0__0__10_, connection_0__0__9_, connection_0__0__8_,
         connection_0__0__7_, connection_0__0__6_, connection_0__0__5_,
         connection_0__0__4_, connection_0__0__3_, connection_0__0__2_,
         connection_0__0__1_, connection_0__0__0_, connection_0__1__31_,
         connection_0__1__30_, connection_0__1__29_, connection_0__1__28_,
         connection_0__1__27_, connection_0__1__26_, connection_0__1__25_,
         connection_0__1__24_, connection_0__1__23_, connection_0__1__22_,
         connection_0__1__21_, connection_0__1__20_, connection_0__1__19_,
         connection_0__1__18_, connection_0__1__17_, connection_0__1__16_,
         connection_0__1__15_, connection_0__1__14_, connection_0__1__13_,
         connection_0__1__12_, connection_0__1__11_, connection_0__1__10_,
         connection_0__1__9_, connection_0__1__8_, connection_0__1__7_,
         connection_0__1__6_, connection_0__1__5_, connection_0__1__4_,
         connection_0__1__3_, connection_0__1__2_, connection_0__1__1_,
         connection_0__1__0_, connection_0__2__31_, connection_0__2__30_,
         connection_0__2__29_, connection_0__2__28_, connection_0__2__27_,
         connection_0__2__26_, connection_0__2__25_, connection_0__2__24_,
         connection_0__2__23_, connection_0__2__22_, connection_0__2__21_,
         connection_0__2__20_, connection_0__2__19_, connection_0__2__18_,
         connection_0__2__17_, connection_0__2__16_, connection_0__2__15_,
         connection_0__2__14_, connection_0__2__13_, connection_0__2__12_,
         connection_0__2__11_, connection_0__2__10_, connection_0__2__9_,
         connection_0__2__8_, connection_0__2__7_, connection_0__2__6_,
         connection_0__2__5_, connection_0__2__4_, connection_0__2__3_,
         connection_0__2__2_, connection_0__2__1_, connection_0__2__0_,
         connection_0__3__31_, connection_0__3__30_, connection_0__3__29_,
         connection_0__3__28_, connection_0__3__27_, connection_0__3__26_,
         connection_0__3__25_, connection_0__3__24_, connection_0__3__23_,
         connection_0__3__22_, connection_0__3__21_, connection_0__3__20_,
         connection_0__3__19_, connection_0__3__18_, connection_0__3__17_,
         connection_0__3__16_, connection_0__3__15_, connection_0__3__14_,
         connection_0__3__13_, connection_0__3__12_, connection_0__3__11_,
         connection_0__3__10_, connection_0__3__9_, connection_0__3__8_,
         connection_0__3__7_, connection_0__3__6_, connection_0__3__5_,
         connection_0__3__4_, connection_0__3__3_, connection_0__3__2_,
         connection_0__3__1_, connection_0__3__0_, connection_0__4__31_,
         connection_0__4__30_, connection_0__4__29_, connection_0__4__28_,
         connection_0__4__27_, connection_0__4__26_, connection_0__4__25_,
         connection_0__4__24_, connection_0__4__23_, connection_0__4__22_,
         connection_0__4__21_, connection_0__4__20_, connection_0__4__19_,
         connection_0__4__18_, connection_0__4__17_, connection_0__4__16_,
         connection_0__4__15_, connection_0__4__14_, connection_0__4__13_,
         connection_0__4__12_, connection_0__4__11_, connection_0__4__10_,
         connection_0__4__9_, connection_0__4__8_, connection_0__4__7_,
         connection_0__4__6_, connection_0__4__5_, connection_0__4__4_,
         connection_0__4__3_, connection_0__4__2_, connection_0__4__1_,
         connection_0__4__0_, connection_0__5__31_, connection_0__5__30_,
         connection_0__5__29_, connection_0__5__28_, connection_0__5__27_,
         connection_0__5__26_, connection_0__5__25_, connection_0__5__24_,
         connection_0__5__23_, connection_0__5__22_, connection_0__5__21_,
         connection_0__5__20_, connection_0__5__19_, connection_0__5__18_,
         connection_0__5__17_, connection_0__5__16_, connection_0__5__15_,
         connection_0__5__14_, connection_0__5__13_, connection_0__5__12_,
         connection_0__5__11_, connection_0__5__10_, connection_0__5__9_,
         connection_0__5__8_, connection_0__5__7_, connection_0__5__6_,
         connection_0__5__5_, connection_0__5__4_, connection_0__5__3_,
         connection_0__5__2_, connection_0__5__1_, connection_0__5__0_,
         connection_0__6__31_, connection_0__6__30_, connection_0__6__29_,
         connection_0__6__28_, connection_0__6__27_, connection_0__6__26_,
         connection_0__6__25_, connection_0__6__24_, connection_0__6__23_,
         connection_0__6__22_, connection_0__6__21_, connection_0__6__20_,
         connection_0__6__19_, connection_0__6__18_, connection_0__6__17_,
         connection_0__6__16_, connection_0__6__15_, connection_0__6__14_,
         connection_0__6__13_, connection_0__6__12_, connection_0__6__11_,
         connection_0__6__10_, connection_0__6__9_, connection_0__6__8_,
         connection_0__6__7_, connection_0__6__6_, connection_0__6__5_,
         connection_0__6__4_, connection_0__6__3_, connection_0__6__2_,
         connection_0__6__1_, connection_0__6__0_, connection_0__7__31_,
         connection_0__7__30_, connection_0__7__29_, connection_0__7__28_,
         connection_0__7__27_, connection_0__7__26_, connection_0__7__25_,
         connection_0__7__24_, connection_0__7__23_, connection_0__7__22_,
         connection_0__7__21_, connection_0__7__20_, connection_0__7__19_,
         connection_0__7__18_, connection_0__7__17_, connection_0__7__16_,
         connection_0__7__15_, connection_0__7__14_, connection_0__7__13_,
         connection_0__7__12_, connection_0__7__11_, connection_0__7__10_,
         connection_0__7__9_, connection_0__7__8_, connection_0__7__7_,
         connection_0__7__6_, connection_0__7__5_, connection_0__7__4_,
         connection_0__7__3_, connection_0__7__2_, connection_0__7__1_,
         connection_0__7__0_, connection_1__0__31_, connection_1__0__30_,
         connection_1__0__29_, connection_1__0__28_, connection_1__0__27_,
         connection_1__0__26_, connection_1__0__25_, connection_1__0__24_,
         connection_1__0__23_, connection_1__0__22_, connection_1__0__21_,
         connection_1__0__20_, connection_1__0__19_, connection_1__0__18_,
         connection_1__0__17_, connection_1__0__16_, connection_1__0__15_,
         connection_1__0__14_, connection_1__0__13_, connection_1__0__12_,
         connection_1__0__11_, connection_1__0__10_, connection_1__0__9_,
         connection_1__0__8_, connection_1__0__7_, connection_1__0__6_,
         connection_1__0__5_, connection_1__0__4_, connection_1__0__3_,
         connection_1__0__2_, connection_1__0__1_, connection_1__0__0_,
         connection_1__1__31_, connection_1__1__30_, connection_1__1__29_,
         connection_1__1__28_, connection_1__1__27_, connection_1__1__26_,
         connection_1__1__25_, connection_1__1__24_, connection_1__1__23_,
         connection_1__1__22_, connection_1__1__21_, connection_1__1__20_,
         connection_1__1__19_, connection_1__1__18_, connection_1__1__17_,
         connection_1__1__16_, connection_1__1__15_, connection_1__1__14_,
         connection_1__1__13_, connection_1__1__12_, connection_1__1__11_,
         connection_1__1__10_, connection_1__1__9_, connection_1__1__8_,
         connection_1__1__7_, connection_1__1__6_, connection_1__1__5_,
         connection_1__1__4_, connection_1__1__3_, connection_1__1__2_,
         connection_1__1__1_, connection_1__1__0_, connection_1__2__31_,
         connection_1__2__30_, connection_1__2__29_, connection_1__2__28_,
         connection_1__2__27_, connection_1__2__26_, connection_1__2__25_,
         connection_1__2__24_, connection_1__2__23_, connection_1__2__22_,
         connection_1__2__21_, connection_1__2__20_, connection_1__2__19_,
         connection_1__2__18_, connection_1__2__17_, connection_1__2__16_,
         connection_1__2__15_, connection_1__2__14_, connection_1__2__13_,
         connection_1__2__12_, connection_1__2__11_, connection_1__2__10_,
         connection_1__2__9_, connection_1__2__8_, connection_1__2__7_,
         connection_1__2__6_, connection_1__2__5_, connection_1__2__4_,
         connection_1__2__3_, connection_1__2__2_, connection_1__2__1_,
         connection_1__2__0_, connection_1__3__31_, connection_1__3__30_,
         connection_1__3__29_, connection_1__3__28_, connection_1__3__27_,
         connection_1__3__26_, connection_1__3__25_, connection_1__3__24_,
         connection_1__3__23_, connection_1__3__22_, connection_1__3__21_,
         connection_1__3__20_, connection_1__3__19_, connection_1__3__18_,
         connection_1__3__17_, connection_1__3__16_, connection_1__3__15_,
         connection_1__3__14_, connection_1__3__13_, connection_1__3__12_,
         connection_1__3__11_, connection_1__3__10_, connection_1__3__9_,
         connection_1__3__8_, connection_1__3__7_, connection_1__3__6_,
         connection_1__3__5_, connection_1__3__4_, connection_1__3__3_,
         connection_1__3__2_, connection_1__3__1_, connection_1__3__0_,
         connection_1__4__31_, connection_1__4__30_, connection_1__4__29_,
         connection_1__4__28_, connection_1__4__27_, connection_1__4__26_,
         connection_1__4__25_, connection_1__4__24_, connection_1__4__23_,
         connection_1__4__22_, connection_1__4__21_, connection_1__4__20_,
         connection_1__4__19_, connection_1__4__18_, connection_1__4__17_,
         connection_1__4__16_, connection_1__4__15_, connection_1__4__14_,
         connection_1__4__13_, connection_1__4__12_, connection_1__4__11_,
         connection_1__4__10_, connection_1__4__9_, connection_1__4__8_,
         connection_1__4__7_, connection_1__4__6_, connection_1__4__5_,
         connection_1__4__4_, connection_1__4__3_, connection_1__4__2_,
         connection_1__4__1_, connection_1__4__0_, connection_1__5__31_,
         connection_1__5__30_, connection_1__5__29_, connection_1__5__28_,
         connection_1__5__27_, connection_1__5__26_, connection_1__5__25_,
         connection_1__5__24_, connection_1__5__23_, connection_1__5__22_,
         connection_1__5__21_, connection_1__5__20_, connection_1__5__19_,
         connection_1__5__18_, connection_1__5__17_, connection_1__5__16_,
         connection_1__5__15_, connection_1__5__14_, connection_1__5__13_,
         connection_1__5__12_, connection_1__5__11_, connection_1__5__10_,
         connection_1__5__9_, connection_1__5__8_, connection_1__5__7_,
         connection_1__5__6_, connection_1__5__5_, connection_1__5__4_,
         connection_1__5__3_, connection_1__5__2_, connection_1__5__1_,
         connection_1__5__0_, connection_1__6__31_, connection_1__6__30_,
         connection_1__6__29_, connection_1__6__28_, connection_1__6__27_,
         connection_1__6__26_, connection_1__6__25_, connection_1__6__24_,
         connection_1__6__23_, connection_1__6__22_, connection_1__6__21_,
         connection_1__6__20_, connection_1__6__19_, connection_1__6__18_,
         connection_1__6__17_, connection_1__6__16_, connection_1__6__15_,
         connection_1__6__14_, connection_1__6__13_, connection_1__6__12_,
         connection_1__6__11_, connection_1__6__10_, connection_1__6__9_,
         connection_1__6__8_, connection_1__6__7_, connection_1__6__6_,
         connection_1__6__5_, connection_1__6__4_, connection_1__6__3_,
         connection_1__6__2_, connection_1__6__1_, connection_1__6__0_,
         connection_1__7__31_, connection_1__7__30_, connection_1__7__29_,
         connection_1__7__28_, connection_1__7__27_, connection_1__7__26_,
         connection_1__7__25_, connection_1__7__24_, connection_1__7__23_,
         connection_1__7__22_, connection_1__7__21_, connection_1__7__20_,
         connection_1__7__19_, connection_1__7__18_, connection_1__7__17_,
         connection_1__7__16_, connection_1__7__15_, connection_1__7__14_,
         connection_1__7__13_, connection_1__7__12_, connection_1__7__11_,
         connection_1__7__10_, connection_1__7__9_, connection_1__7__8_,
         connection_1__7__7_, connection_1__7__6_, connection_1__7__5_,
         connection_1__7__4_, connection_1__7__3_, connection_1__7__2_,
         connection_1__7__1_, connection_1__7__0_, connection_valid_0__0_,
         connection_valid_0__1_, connection_valid_0__2_,
         connection_valid_0__3_, connection_valid_0__4_,
         connection_valid_0__5_, connection_valid_0__6_,
         connection_valid_0__7_, connection_valid_1__0_,
         connection_valid_1__1_, connection_valid_1__2_,
         connection_valid_1__3_, connection_valid_1__4_,
         connection_valid_1__5_, connection_valid_1__6_,
         connection_valid_1__7_, connection_valid_2__0_,
         connection_valid_2__1_, connection_valid_2__2_,
         connection_valid_2__3_, connection_valid_2__4_,
         connection_valid_2__5_, connection_valid_2__6_,
         connection_valid_2__7_, connection_valid_3__0_,
         connection_valid_3__1_, connection_valid_3__2_,
         connection_valid_3__3_, connection_valid_3__4_,
         connection_valid_3__5_, connection_valid_3__6_,
         connection_valid_3__7_, connection_2__0__31_, connection_2__0__30_,
         connection_2__0__29_, connection_2__0__28_, connection_2__0__27_,
         connection_2__0__26_, connection_2__0__25_, connection_2__0__24_,
         connection_2__0__23_, connection_2__0__22_, connection_2__0__21_,
         connection_2__0__20_, connection_2__0__19_, connection_2__0__18_,
         connection_2__0__17_, connection_2__0__16_, connection_2__0__15_,
         connection_2__0__14_, connection_2__0__13_, connection_2__0__12_,
         connection_2__0__11_, connection_2__0__10_, connection_2__0__9_,
         connection_2__0__8_, connection_2__0__7_, connection_2__0__6_,
         connection_2__0__5_, connection_2__0__4_, connection_2__0__3_,
         connection_2__0__2_, connection_2__0__1_, connection_2__0__0_,
         connection_2__1__31_, connection_2__1__30_, connection_2__1__29_,
         connection_2__1__28_, connection_2__1__27_, connection_2__1__26_,
         connection_2__1__25_, connection_2__1__24_, connection_2__1__23_,
         connection_2__1__22_, connection_2__1__21_, connection_2__1__20_,
         connection_2__1__19_, connection_2__1__18_, connection_2__1__17_,
         connection_2__1__16_, connection_2__1__15_, connection_2__1__14_,
         connection_2__1__13_, connection_2__1__12_, connection_2__1__11_,
         connection_2__1__10_, connection_2__1__9_, connection_2__1__8_,
         connection_2__1__7_, connection_2__1__6_, connection_2__1__5_,
         connection_2__1__4_, connection_2__1__3_, connection_2__1__2_,
         connection_2__1__1_, connection_2__1__0_, connection_2__2__31_,
         connection_2__2__30_, connection_2__2__29_, connection_2__2__28_,
         connection_2__2__27_, connection_2__2__26_, connection_2__2__25_,
         connection_2__2__24_, connection_2__2__23_, connection_2__2__22_,
         connection_2__2__21_, connection_2__2__20_, connection_2__2__19_,
         connection_2__2__18_, connection_2__2__17_, connection_2__2__16_,
         connection_2__2__15_, connection_2__2__14_, connection_2__2__13_,
         connection_2__2__12_, connection_2__2__11_, connection_2__2__10_,
         connection_2__2__9_, connection_2__2__8_, connection_2__2__7_,
         connection_2__2__6_, connection_2__2__5_, connection_2__2__4_,
         connection_2__2__3_, connection_2__2__2_, connection_2__2__1_,
         connection_2__2__0_, connection_2__3__31_, connection_2__3__30_,
         connection_2__3__29_, connection_2__3__28_, connection_2__3__27_,
         connection_2__3__26_, connection_2__3__25_, connection_2__3__24_,
         connection_2__3__23_, connection_2__3__22_, connection_2__3__21_,
         connection_2__3__20_, connection_2__3__19_, connection_2__3__18_,
         connection_2__3__17_, connection_2__3__16_, connection_2__3__15_,
         connection_2__3__14_, connection_2__3__13_, connection_2__3__12_,
         connection_2__3__11_, connection_2__3__10_, connection_2__3__9_,
         connection_2__3__8_, connection_2__3__7_, connection_2__3__6_,
         connection_2__3__5_, connection_2__3__4_, connection_2__3__3_,
         connection_2__3__2_, connection_2__3__1_, connection_2__3__0_,
         connection_2__4__31_, connection_2__4__30_, connection_2__4__29_,
         connection_2__4__28_, connection_2__4__27_, connection_2__4__26_,
         connection_2__4__25_, connection_2__4__24_, connection_2__4__23_,
         connection_2__4__22_, connection_2__4__21_, connection_2__4__20_,
         connection_2__4__19_, connection_2__4__18_, connection_2__4__17_,
         connection_2__4__16_, connection_2__4__15_, connection_2__4__14_,
         connection_2__4__13_, connection_2__4__12_, connection_2__4__11_,
         connection_2__4__10_, connection_2__4__9_, connection_2__4__8_,
         connection_2__4__7_, connection_2__4__6_, connection_2__4__5_,
         connection_2__4__4_, connection_2__4__3_, connection_2__4__2_,
         connection_2__4__1_, connection_2__4__0_, connection_2__5__31_,
         connection_2__5__30_, connection_2__5__29_, connection_2__5__28_,
         connection_2__5__27_, connection_2__5__26_, connection_2__5__25_,
         connection_2__5__24_, connection_2__5__23_, connection_2__5__22_,
         connection_2__5__21_, connection_2__5__20_, connection_2__5__19_,
         connection_2__5__18_, connection_2__5__17_, connection_2__5__16_,
         connection_2__5__15_, connection_2__5__14_, connection_2__5__13_,
         connection_2__5__12_, connection_2__5__11_, connection_2__5__10_,
         connection_2__5__9_, connection_2__5__8_, connection_2__5__7_,
         connection_2__5__6_, connection_2__5__5_, connection_2__5__4_,
         connection_2__5__3_, connection_2__5__2_, connection_2__5__1_,
         connection_2__5__0_, connection_2__6__31_, connection_2__6__30_,
         connection_2__6__29_, connection_2__6__28_, connection_2__6__27_,
         connection_2__6__26_, connection_2__6__25_, connection_2__6__24_,
         connection_2__6__23_, connection_2__6__22_, connection_2__6__21_,
         connection_2__6__20_, connection_2__6__19_, connection_2__6__18_,
         connection_2__6__17_, connection_2__6__16_, connection_2__6__15_,
         connection_2__6__14_, connection_2__6__13_, connection_2__6__12_,
         connection_2__6__11_, connection_2__6__10_, connection_2__6__9_,
         connection_2__6__8_, connection_2__6__7_, connection_2__6__6_,
         connection_2__6__5_, connection_2__6__4_, connection_2__6__3_,
         connection_2__6__2_, connection_2__6__1_, connection_2__6__0_,
         connection_2__7__31_, connection_2__7__30_, connection_2__7__29_,
         connection_2__7__28_, connection_2__7__27_, connection_2__7__26_,
         connection_2__7__25_, connection_2__7__24_, connection_2__7__23_,
         connection_2__7__22_, connection_2__7__21_, connection_2__7__20_,
         connection_2__7__19_, connection_2__7__18_, connection_2__7__17_,
         connection_2__7__16_, connection_2__7__15_, connection_2__7__14_,
         connection_2__7__13_, connection_2__7__12_, connection_2__7__11_,
         connection_2__7__10_, connection_2__7__9_, connection_2__7__8_,
         connection_2__7__7_, connection_2__7__6_, connection_2__7__5_,
         connection_2__7__4_, connection_2__7__3_, connection_2__7__2_,
         connection_2__7__1_, connection_2__7__0_, connection_3__0__31_,
         connection_3__0__30_, connection_3__0__29_, connection_3__0__28_,
         connection_3__0__27_, connection_3__0__26_, connection_3__0__25_,
         connection_3__0__24_, connection_3__0__23_, connection_3__0__22_,
         connection_3__0__21_, connection_3__0__20_, connection_3__0__19_,
         connection_3__0__18_, connection_3__0__17_, connection_3__0__16_,
         connection_3__0__15_, connection_3__0__14_, connection_3__0__13_,
         connection_3__0__12_, connection_3__0__11_, connection_3__0__10_,
         connection_3__0__9_, connection_3__0__8_, connection_3__0__7_,
         connection_3__0__6_, connection_3__0__5_, connection_3__0__4_,
         connection_3__0__3_, connection_3__0__2_, connection_3__0__1_,
         connection_3__0__0_, connection_3__1__31_, connection_3__1__30_,
         connection_3__1__29_, connection_3__1__28_, connection_3__1__27_,
         connection_3__1__26_, connection_3__1__25_, connection_3__1__24_,
         connection_3__1__23_, connection_3__1__22_, connection_3__1__21_,
         connection_3__1__20_, connection_3__1__19_, connection_3__1__18_,
         connection_3__1__17_, connection_3__1__16_, connection_3__1__15_,
         connection_3__1__14_, connection_3__1__13_, connection_3__1__12_,
         connection_3__1__11_, connection_3__1__10_, connection_3__1__9_,
         connection_3__1__8_, connection_3__1__7_, connection_3__1__6_,
         connection_3__1__5_, connection_3__1__4_, connection_3__1__3_,
         connection_3__1__2_, connection_3__1__1_, connection_3__1__0_,
         connection_3__2__31_, connection_3__2__30_, connection_3__2__29_,
         connection_3__2__28_, connection_3__2__27_, connection_3__2__26_,
         connection_3__2__25_, connection_3__2__24_, connection_3__2__23_,
         connection_3__2__22_, connection_3__2__21_, connection_3__2__20_,
         connection_3__2__19_, connection_3__2__18_, connection_3__2__17_,
         connection_3__2__16_, connection_3__2__15_, connection_3__2__14_,
         connection_3__2__13_, connection_3__2__12_, connection_3__2__11_,
         connection_3__2__10_, connection_3__2__9_, connection_3__2__8_,
         connection_3__2__7_, connection_3__2__6_, connection_3__2__5_,
         connection_3__2__4_, connection_3__2__3_, connection_3__2__2_,
         connection_3__2__1_, connection_3__2__0_, connection_3__3__31_,
         connection_3__3__30_, connection_3__3__29_, connection_3__3__28_,
         connection_3__3__27_, connection_3__3__26_, connection_3__3__25_,
         connection_3__3__24_, connection_3__3__23_, connection_3__3__22_,
         connection_3__3__21_, connection_3__3__20_, connection_3__3__19_,
         connection_3__3__18_, connection_3__3__17_, connection_3__3__16_,
         connection_3__3__15_, connection_3__3__14_, connection_3__3__13_,
         connection_3__3__12_, connection_3__3__11_, connection_3__3__10_,
         connection_3__3__9_, connection_3__3__8_, connection_3__3__7_,
         connection_3__3__6_, connection_3__3__5_, connection_3__3__4_,
         connection_3__3__3_, connection_3__3__2_, connection_3__3__1_,
         connection_3__3__0_, connection_3__4__31_, connection_3__4__30_,
         connection_3__4__29_, connection_3__4__28_, connection_3__4__27_,
         connection_3__4__26_, connection_3__4__25_, connection_3__4__24_,
         connection_3__4__23_, connection_3__4__22_, connection_3__4__21_,
         connection_3__4__20_, connection_3__4__19_, connection_3__4__18_,
         connection_3__4__17_, connection_3__4__16_, connection_3__4__15_,
         connection_3__4__14_, connection_3__4__13_, connection_3__4__12_,
         connection_3__4__11_, connection_3__4__10_, connection_3__4__9_,
         connection_3__4__8_, connection_3__4__7_, connection_3__4__6_,
         connection_3__4__5_, connection_3__4__4_, connection_3__4__3_,
         connection_3__4__2_, connection_3__4__1_, connection_3__4__0_,
         connection_3__5__31_, connection_3__5__30_, connection_3__5__29_,
         connection_3__5__28_, connection_3__5__27_, connection_3__5__26_,
         connection_3__5__25_, connection_3__5__24_, connection_3__5__23_,
         connection_3__5__22_, connection_3__5__21_, connection_3__5__20_,
         connection_3__5__19_, connection_3__5__18_, connection_3__5__17_,
         connection_3__5__16_, connection_3__5__15_, connection_3__5__14_,
         connection_3__5__13_, connection_3__5__12_, connection_3__5__11_,
         connection_3__5__10_, connection_3__5__9_, connection_3__5__8_,
         connection_3__5__7_, connection_3__5__6_, connection_3__5__5_,
         connection_3__5__4_, connection_3__5__3_, connection_3__5__2_,
         connection_3__5__1_, connection_3__5__0_, connection_3__6__31_,
         connection_3__6__30_, connection_3__6__29_, connection_3__6__28_,
         connection_3__6__27_, connection_3__6__26_, connection_3__6__25_,
         connection_3__6__24_, connection_3__6__23_, connection_3__6__22_,
         connection_3__6__21_, connection_3__6__20_, connection_3__6__19_,
         connection_3__6__18_, connection_3__6__17_, connection_3__6__16_,
         connection_3__6__15_, connection_3__6__14_, connection_3__6__13_,
         connection_3__6__12_, connection_3__6__11_, connection_3__6__10_,
         connection_3__6__9_, connection_3__6__8_, connection_3__6__7_,
         connection_3__6__6_, connection_3__6__5_, connection_3__6__4_,
         connection_3__6__3_, connection_3__6__2_, connection_3__6__1_,
         connection_3__6__0_, connection_3__7__31_, connection_3__7__30_,
         connection_3__7__29_, connection_3__7__28_, connection_3__7__27_,
         connection_3__7__26_, connection_3__7__25_, connection_3__7__24_,
         connection_3__7__23_, connection_3__7__22_, connection_3__7__21_,
         connection_3__7__20_, connection_3__7__19_, connection_3__7__18_,
         connection_3__7__17_, connection_3__7__16_, connection_3__7__15_,
         connection_3__7__14_, connection_3__7__13_, connection_3__7__12_,
         connection_3__7__11_, connection_3__7__10_, connection_3__7__9_,
         connection_3__7__8_, connection_3__7__7_, connection_3__7__6_,
         connection_3__7__5_, connection_3__7__4_, connection_3__7__3_,
         connection_3__7__2_, connection_3__7__1_, connection_3__7__0_;
  wire   [31:0] cmd_pipeline_stage_0__pipeline_i_cmd_reg;
  wire   [23:0] cmd_pipeline_stage_1__pipeline_i_cmd_reg;
  wire   [15:0] cmd_pipeline_stage_2__pipeline_i_cmd_reg;
  wire   [7:0] cmd_pipeline_stage_3__pipeline_i_cmd_reg;

  distribute_2x2_simple_seq_DATA_WIDTH32_COMMAND_WIDTH2_0 first_stage_switch_0__first_stage ( 
        .clk(clk), .rst(rst), .i_valid(i_valid[1:0]), .i_data_bus(
        i_data_bus[63:0]), .o_valid({connection_valid_0__1_, 
        connection_valid_0__0_}), .o_data_bus({connection_0__1__31_, 
        connection_0__1__30_, connection_0__1__29_, connection_0__1__28_, 
        connection_0__1__27_, connection_0__1__26_, connection_0__1__25_, 
        connection_0__1__24_, connection_0__1__23_, connection_0__1__22_, 
        connection_0__1__21_, connection_0__1__20_, connection_0__1__19_, 
        connection_0__1__18_, connection_0__1__17_, connection_0__1__16_, 
        connection_0__1__15_, connection_0__1__14_, connection_0__1__13_, 
        connection_0__1__12_, connection_0__1__11_, connection_0__1__10_, 
        connection_0__1__9_, connection_0__1__8_, connection_0__1__7_, 
        connection_0__1__6_, connection_0__1__5_, connection_0__1__4_, 
        connection_0__1__3_, connection_0__1__2_, connection_0__1__1_, 
        connection_0__1__0_, connection_0__0__31_, connection_0__0__30_, 
        connection_0__0__29_, connection_0__0__28_, connection_0__0__27_, 
        connection_0__0__26_, connection_0__0__25_, connection_0__0__24_, 
        connection_0__0__23_, connection_0__0__22_, connection_0__0__21_, 
        connection_0__0__20_, connection_0__0__19_, connection_0__0__18_, 
        connection_0__0__17_, connection_0__0__16_, connection_0__0__15_, 
        connection_0__0__14_, connection_0__0__13_, connection_0__0__12_, 
        connection_0__0__11_, connection_0__0__10_, connection_0__0__9_, 
        connection_0__0__8_, connection_0__0__7_, connection_0__0__6_, 
        connection_0__0__5_, connection_0__0__4_, connection_0__0__3_, 
        connection_0__0__2_, connection_0__0__1_, connection_0__0__0_}), 
        .i_en(i_en), .i_cmd(i_cmd[1:0]) );
  distribute_2x2_simple_seq_DATA_WIDTH32_COMMAND_WIDTH2_19 first_stage_switch_1__first_stage ( 
        .clk(clk), .rst(rst), .i_valid(i_valid[3:2]), .i_data_bus(
        i_data_bus[127:64]), .o_valid({connection_valid_0__3_, 
        connection_valid_0__2_}), .o_data_bus({connection_0__3__31_, 
        connection_0__3__30_, connection_0__3__29_, connection_0__3__28_, 
        connection_0__3__27_, connection_0__3__26_, connection_0__3__25_, 
        connection_0__3__24_, connection_0__3__23_, connection_0__3__22_, 
        connection_0__3__21_, connection_0__3__20_, connection_0__3__19_, 
        connection_0__3__18_, connection_0__3__17_, connection_0__3__16_, 
        connection_0__3__15_, connection_0__3__14_, connection_0__3__13_, 
        connection_0__3__12_, connection_0__3__11_, connection_0__3__10_, 
        connection_0__3__9_, connection_0__3__8_, connection_0__3__7_, 
        connection_0__3__6_, connection_0__3__5_, connection_0__3__4_, 
        connection_0__3__3_, connection_0__3__2_, connection_0__3__1_, 
        connection_0__3__0_, connection_0__2__31_, connection_0__2__30_, 
        connection_0__2__29_, connection_0__2__28_, connection_0__2__27_, 
        connection_0__2__26_, connection_0__2__25_, connection_0__2__24_, 
        connection_0__2__23_, connection_0__2__22_, connection_0__2__21_, 
        connection_0__2__20_, connection_0__2__19_, connection_0__2__18_, 
        connection_0__2__17_, connection_0__2__16_, connection_0__2__15_, 
        connection_0__2__14_, connection_0__2__13_, connection_0__2__12_, 
        connection_0__2__11_, connection_0__2__10_, connection_0__2__9_, 
        connection_0__2__8_, connection_0__2__7_, connection_0__2__6_, 
        connection_0__2__5_, connection_0__2__4_, connection_0__2__3_, 
        connection_0__2__2_, connection_0__2__1_, connection_0__2__0_}), 
        .i_en(i_en), .i_cmd(i_cmd[3:2]) );
  distribute_2x2_simple_seq_DATA_WIDTH32_COMMAND_WIDTH2_18 first_stage_switch_2__first_stage ( 
        .clk(clk), .rst(rst), .i_valid(i_valid[5:4]), .i_data_bus(
        i_data_bus[191:128]), .o_valid({connection_valid_0__5_, 
        connection_valid_0__4_}), .o_data_bus({connection_0__5__31_, 
        connection_0__5__30_, connection_0__5__29_, connection_0__5__28_, 
        connection_0__5__27_, connection_0__5__26_, connection_0__5__25_, 
        connection_0__5__24_, connection_0__5__23_, connection_0__5__22_, 
        connection_0__5__21_, connection_0__5__20_, connection_0__5__19_, 
        connection_0__5__18_, connection_0__5__17_, connection_0__5__16_, 
        connection_0__5__15_, connection_0__5__14_, connection_0__5__13_, 
        connection_0__5__12_, connection_0__5__11_, connection_0__5__10_, 
        connection_0__5__9_, connection_0__5__8_, connection_0__5__7_, 
        connection_0__5__6_, connection_0__5__5_, connection_0__5__4_, 
        connection_0__5__3_, connection_0__5__2_, connection_0__5__1_, 
        connection_0__5__0_, connection_0__4__31_, connection_0__4__30_, 
        connection_0__4__29_, connection_0__4__28_, connection_0__4__27_, 
        connection_0__4__26_, connection_0__4__25_, connection_0__4__24_, 
        connection_0__4__23_, connection_0__4__22_, connection_0__4__21_, 
        connection_0__4__20_, connection_0__4__19_, connection_0__4__18_, 
        connection_0__4__17_, connection_0__4__16_, connection_0__4__15_, 
        connection_0__4__14_, connection_0__4__13_, connection_0__4__12_, 
        connection_0__4__11_, connection_0__4__10_, connection_0__4__9_, 
        connection_0__4__8_, connection_0__4__7_, connection_0__4__6_, 
        connection_0__4__5_, connection_0__4__4_, connection_0__4__3_, 
        connection_0__4__2_, connection_0__4__1_, connection_0__4__0_}), 
        .i_en(i_en), .i_cmd(i_cmd[5:4]) );
  distribute_2x2_simple_seq_DATA_WIDTH32_COMMAND_WIDTH2_17 first_stage_switch_3__first_stage ( 
        .clk(clk), .rst(rst), .i_valid(i_valid[7:6]), .i_data_bus(
        i_data_bus[255:192]), .o_valid({connection_valid_0__7_, 
        connection_valid_0__6_}), .o_data_bus({connection_0__7__31_, 
        connection_0__7__30_, connection_0__7__29_, connection_0__7__28_, 
        connection_0__7__27_, connection_0__7__26_, connection_0__7__25_, 
        connection_0__7__24_, connection_0__7__23_, connection_0__7__22_, 
        connection_0__7__21_, connection_0__7__20_, connection_0__7__19_, 
        connection_0__7__18_, connection_0__7__17_, connection_0__7__16_, 
        connection_0__7__15_, connection_0__7__14_, connection_0__7__13_, 
        connection_0__7__12_, connection_0__7__11_, connection_0__7__10_, 
        connection_0__7__9_, connection_0__7__8_, connection_0__7__7_, 
        connection_0__7__6_, connection_0__7__5_, connection_0__7__4_, 
        connection_0__7__3_, connection_0__7__2_, connection_0__7__1_, 
        connection_0__7__0_, connection_0__6__31_, connection_0__6__30_, 
        connection_0__6__29_, connection_0__6__28_, connection_0__6__27_, 
        connection_0__6__26_, connection_0__6__25_, connection_0__6__24_, 
        connection_0__6__23_, connection_0__6__22_, connection_0__6__21_, 
        connection_0__6__20_, connection_0__6__19_, connection_0__6__18_, 
        connection_0__6__17_, connection_0__6__16_, connection_0__6__15_, 
        connection_0__6__14_, connection_0__6__13_, connection_0__6__12_, 
        connection_0__6__11_, connection_0__6__10_, connection_0__6__9_, 
        connection_0__6__8_, connection_0__6__7_, connection_0__6__6_, 
        connection_0__6__5_, connection_0__6__4_, connection_0__6__3_, 
        connection_0__6__2_, connection_0__6__1_, connection_0__6__0_}), 
        .i_en(i_en), .i_cmd(i_cmd[7:6]) );
  distribute_2x2_simple_seq_DATA_WIDTH32_COMMAND_WIDTH2_16 first_half_stages_0__group_first_half_0__switch_first_half_0__second_stage ( 
        .clk(clk), .rst(rst), .i_valid({connection_valid_0__2_, 
        connection_valid_0__0_}), .i_data_bus({connection_0__2__31_, 
        connection_0__2__30_, connection_0__2__29_, connection_0__2__28_, 
        connection_0__2__27_, connection_0__2__26_, connection_0__2__25_, 
        connection_0__2__24_, connection_0__2__23_, connection_0__2__22_, 
        connection_0__2__21_, connection_0__2__20_, connection_0__2__19_, 
        connection_0__2__18_, connection_0__2__17_, connection_0__2__16_, 
        connection_0__2__15_, connection_0__2__14_, connection_0__2__13_, 
        connection_0__2__12_, connection_0__2__11_, connection_0__2__10_, 
        connection_0__2__9_, connection_0__2__8_, connection_0__2__7_, 
        connection_0__2__6_, connection_0__2__5_, connection_0__2__4_, 
        connection_0__2__3_, connection_0__2__2_, connection_0__2__1_, 
        connection_0__2__0_, connection_0__0__31_, connection_0__0__30_, 
        connection_0__0__29_, connection_0__0__28_, connection_0__0__27_, 
        connection_0__0__26_, connection_0__0__25_, connection_0__0__24_, 
        connection_0__0__23_, connection_0__0__22_, connection_0__0__21_, 
        connection_0__0__20_, connection_0__0__19_, connection_0__0__18_, 
        connection_0__0__17_, connection_0__0__16_, connection_0__0__15_, 
        connection_0__0__14_, connection_0__0__13_, connection_0__0__12_, 
        connection_0__0__11_, connection_0__0__10_, connection_0__0__9_, 
        connection_0__0__8_, connection_0__0__7_, connection_0__0__6_, 
        connection_0__0__5_, connection_0__0__4_, connection_0__0__3_, 
        connection_0__0__2_, connection_0__0__1_, connection_0__0__0_}), 
        .o_valid({connection_valid_1__1_, connection_valid_1__0_}), 
        .o_data_bus({connection_1__1__31_, connection_1__1__30_, 
        connection_1__1__29_, connection_1__1__28_, connection_1__1__27_, 
        connection_1__1__26_, connection_1__1__25_, connection_1__1__24_, 
        connection_1__1__23_, connection_1__1__22_, connection_1__1__21_, 
        connection_1__1__20_, connection_1__1__19_, connection_1__1__18_, 
        connection_1__1__17_, connection_1__1__16_, connection_1__1__15_, 
        connection_1__1__14_, connection_1__1__13_, connection_1__1__12_, 
        connection_1__1__11_, connection_1__1__10_, connection_1__1__9_, 
        connection_1__1__8_, connection_1__1__7_, connection_1__1__6_, 
        connection_1__1__5_, connection_1__1__4_, connection_1__1__3_, 
        connection_1__1__2_, connection_1__1__1_, connection_1__1__0_, 
        connection_1__0__31_, connection_1__0__30_, connection_1__0__29_, 
        connection_1__0__28_, connection_1__0__27_, connection_1__0__26_, 
        connection_1__0__25_, connection_1__0__24_, connection_1__0__23_, 
        connection_1__0__22_, connection_1__0__21_, connection_1__0__20_, 
        connection_1__0__19_, connection_1__0__18_, connection_1__0__17_, 
        connection_1__0__16_, connection_1__0__15_, connection_1__0__14_, 
        connection_1__0__13_, connection_1__0__12_, connection_1__0__11_, 
        connection_1__0__10_, connection_1__0__9_, connection_1__0__8_, 
        connection_1__0__7_, connection_1__0__6_, connection_1__0__5_, 
        connection_1__0__4_, connection_1__0__3_, connection_1__0__2_, 
        connection_1__0__1_, connection_1__0__0_}), .i_en(i_en), .i_cmd(
        cmd_pipeline_stage_0__pipeline_i_cmd_reg[31:30]) );
  distribute_2x2_simple_seq_DATA_WIDTH32_COMMAND_WIDTH2_15 first_half_stages_0__group_first_half_0__switch_first_half_1__second_stage ( 
        .clk(clk), .rst(rst), .i_valid({connection_valid_0__6_, 
        connection_valid_0__4_}), .i_data_bus({connection_0__6__31_, 
        connection_0__6__30_, connection_0__6__29_, connection_0__6__28_, 
        connection_0__6__27_, connection_0__6__26_, connection_0__6__25_, 
        connection_0__6__24_, connection_0__6__23_, connection_0__6__22_, 
        connection_0__6__21_, connection_0__6__20_, connection_0__6__19_, 
        connection_0__6__18_, connection_0__6__17_, connection_0__6__16_, 
        connection_0__6__15_, connection_0__6__14_, connection_0__6__13_, 
        connection_0__6__12_, connection_0__6__11_, connection_0__6__10_, 
        connection_0__6__9_, connection_0__6__8_, connection_0__6__7_, 
        connection_0__6__6_, connection_0__6__5_, connection_0__6__4_, 
        connection_0__6__3_, connection_0__6__2_, connection_0__6__1_, 
        connection_0__6__0_, connection_0__4__31_, connection_0__4__30_, 
        connection_0__4__29_, connection_0__4__28_, connection_0__4__27_, 
        connection_0__4__26_, connection_0__4__25_, connection_0__4__24_, 
        connection_0__4__23_, connection_0__4__22_, connection_0__4__21_, 
        connection_0__4__20_, connection_0__4__19_, connection_0__4__18_, 
        connection_0__4__17_, connection_0__4__16_, connection_0__4__15_, 
        connection_0__4__14_, connection_0__4__13_, connection_0__4__12_, 
        connection_0__4__11_, connection_0__4__10_, connection_0__4__9_, 
        connection_0__4__8_, connection_0__4__7_, connection_0__4__6_, 
        connection_0__4__5_, connection_0__4__4_, connection_0__4__3_, 
        connection_0__4__2_, connection_0__4__1_, connection_0__4__0_}), 
        .o_valid({connection_valid_1__3_, connection_valid_1__2_}), 
        .o_data_bus({connection_1__3__31_, connection_1__3__30_, 
        connection_1__3__29_, connection_1__3__28_, connection_1__3__27_, 
        connection_1__3__26_, connection_1__3__25_, connection_1__3__24_, 
        connection_1__3__23_, connection_1__3__22_, connection_1__3__21_, 
        connection_1__3__20_, connection_1__3__19_, connection_1__3__18_, 
        connection_1__3__17_, connection_1__3__16_, connection_1__3__15_, 
        connection_1__3__14_, connection_1__3__13_, connection_1__3__12_, 
        connection_1__3__11_, connection_1__3__10_, connection_1__3__9_, 
        connection_1__3__8_, connection_1__3__7_, connection_1__3__6_, 
        connection_1__3__5_, connection_1__3__4_, connection_1__3__3_, 
        connection_1__3__2_, connection_1__3__1_, connection_1__3__0_, 
        connection_1__2__31_, connection_1__2__30_, connection_1__2__29_, 
        connection_1__2__28_, connection_1__2__27_, connection_1__2__26_, 
        connection_1__2__25_, connection_1__2__24_, connection_1__2__23_, 
        connection_1__2__22_, connection_1__2__21_, connection_1__2__20_, 
        connection_1__2__19_, connection_1__2__18_, connection_1__2__17_, 
        connection_1__2__16_, connection_1__2__15_, connection_1__2__14_, 
        connection_1__2__13_, connection_1__2__12_, connection_1__2__11_, 
        connection_1__2__10_, connection_1__2__9_, connection_1__2__8_, 
        connection_1__2__7_, connection_1__2__6_, connection_1__2__5_, 
        connection_1__2__4_, connection_1__2__3_, connection_1__2__2_, 
        connection_1__2__1_, connection_1__2__0_}), .i_en(i_en), .i_cmd(
        cmd_pipeline_stage_0__pipeline_i_cmd_reg[29:28]) );
  distribute_2x2_simple_seq_DATA_WIDTH32_COMMAND_WIDTH2_14 first_half_stages_0__group_first_half_0__switch_first_half_2__second_stage ( 
        .clk(clk), .rst(rst), .i_valid({connection_valid_0__3_, 
        connection_valid_0__1_}), .i_data_bus({connection_0__3__31_, 
        connection_0__3__30_, connection_0__3__29_, connection_0__3__28_, 
        connection_0__3__27_, connection_0__3__26_, connection_0__3__25_, 
        connection_0__3__24_, connection_0__3__23_, connection_0__3__22_, 
        connection_0__3__21_, connection_0__3__20_, connection_0__3__19_, 
        connection_0__3__18_, connection_0__3__17_, connection_0__3__16_, 
        connection_0__3__15_, connection_0__3__14_, connection_0__3__13_, 
        connection_0__3__12_, connection_0__3__11_, connection_0__3__10_, 
        connection_0__3__9_, connection_0__3__8_, connection_0__3__7_, 
        connection_0__3__6_, connection_0__3__5_, connection_0__3__4_, 
        connection_0__3__3_, connection_0__3__2_, connection_0__3__1_, 
        connection_0__3__0_, connection_0__1__31_, connection_0__1__30_, 
        connection_0__1__29_, connection_0__1__28_, connection_0__1__27_, 
        connection_0__1__26_, connection_0__1__25_, connection_0__1__24_, 
        connection_0__1__23_, connection_0__1__22_, connection_0__1__21_, 
        connection_0__1__20_, connection_0__1__19_, connection_0__1__18_, 
        connection_0__1__17_, connection_0__1__16_, connection_0__1__15_, 
        connection_0__1__14_, connection_0__1__13_, connection_0__1__12_, 
        connection_0__1__11_, connection_0__1__10_, connection_0__1__9_, 
        connection_0__1__8_, connection_0__1__7_, connection_0__1__6_, 
        connection_0__1__5_, connection_0__1__4_, connection_0__1__3_, 
        connection_0__1__2_, connection_0__1__1_, connection_0__1__0_}), 
        .o_valid({connection_valid_1__5_, connection_valid_1__4_}), 
        .o_data_bus({connection_1__5__31_, connection_1__5__30_, 
        connection_1__5__29_, connection_1__5__28_, connection_1__5__27_, 
        connection_1__5__26_, connection_1__5__25_, connection_1__5__24_, 
        connection_1__5__23_, connection_1__5__22_, connection_1__5__21_, 
        connection_1__5__20_, connection_1__5__19_, connection_1__5__18_, 
        connection_1__5__17_, connection_1__5__16_, connection_1__5__15_, 
        connection_1__5__14_, connection_1__5__13_, connection_1__5__12_, 
        connection_1__5__11_, connection_1__5__10_, connection_1__5__9_, 
        connection_1__5__8_, connection_1__5__7_, connection_1__5__6_, 
        connection_1__5__5_, connection_1__5__4_, connection_1__5__3_, 
        connection_1__5__2_, connection_1__5__1_, connection_1__5__0_, 
        connection_1__4__31_, connection_1__4__30_, connection_1__4__29_, 
        connection_1__4__28_, connection_1__4__27_, connection_1__4__26_, 
        connection_1__4__25_, connection_1__4__24_, connection_1__4__23_, 
        connection_1__4__22_, connection_1__4__21_, connection_1__4__20_, 
        connection_1__4__19_, connection_1__4__18_, connection_1__4__17_, 
        connection_1__4__16_, connection_1__4__15_, connection_1__4__14_, 
        connection_1__4__13_, connection_1__4__12_, connection_1__4__11_, 
        connection_1__4__10_, connection_1__4__9_, connection_1__4__8_, 
        connection_1__4__7_, connection_1__4__6_, connection_1__4__5_, 
        connection_1__4__4_, connection_1__4__3_, connection_1__4__2_, 
        connection_1__4__1_, connection_1__4__0_}), .i_en(i_en), .i_cmd(
        cmd_pipeline_stage_0__pipeline_i_cmd_reg[27:26]) );
  distribute_2x2_simple_seq_DATA_WIDTH32_COMMAND_WIDTH2_13 first_half_stages_0__group_first_half_0__switch_first_half_3__second_stage ( 
        .clk(clk), .rst(rst), .i_valid({connection_valid_0__7_, 
        connection_valid_0__5_}), .i_data_bus({connection_0__7__31_, 
        connection_0__7__30_, connection_0__7__29_, connection_0__7__28_, 
        connection_0__7__27_, connection_0__7__26_, connection_0__7__25_, 
        connection_0__7__24_, connection_0__7__23_, connection_0__7__22_, 
        connection_0__7__21_, connection_0__7__20_, connection_0__7__19_, 
        connection_0__7__18_, connection_0__7__17_, connection_0__7__16_, 
        connection_0__7__15_, connection_0__7__14_, connection_0__7__13_, 
        connection_0__7__12_, connection_0__7__11_, connection_0__7__10_, 
        connection_0__7__9_, connection_0__7__8_, connection_0__7__7_, 
        connection_0__7__6_, connection_0__7__5_, connection_0__7__4_, 
        connection_0__7__3_, connection_0__7__2_, connection_0__7__1_, 
        connection_0__7__0_, connection_0__5__31_, connection_0__5__30_, 
        connection_0__5__29_, connection_0__5__28_, connection_0__5__27_, 
        connection_0__5__26_, connection_0__5__25_, connection_0__5__24_, 
        connection_0__5__23_, connection_0__5__22_, connection_0__5__21_, 
        connection_0__5__20_, connection_0__5__19_, connection_0__5__18_, 
        connection_0__5__17_, connection_0__5__16_, connection_0__5__15_, 
        connection_0__5__14_, connection_0__5__13_, connection_0__5__12_, 
        connection_0__5__11_, connection_0__5__10_, connection_0__5__9_, 
        connection_0__5__8_, connection_0__5__7_, connection_0__5__6_, 
        connection_0__5__5_, connection_0__5__4_, connection_0__5__3_, 
        connection_0__5__2_, connection_0__5__1_, connection_0__5__0_}), 
        .o_valid({connection_valid_1__7_, connection_valid_1__6_}), 
        .o_data_bus({connection_1__7__31_, connection_1__7__30_, 
        connection_1__7__29_, connection_1__7__28_, connection_1__7__27_, 
        connection_1__7__26_, connection_1__7__25_, connection_1__7__24_, 
        connection_1__7__23_, connection_1__7__22_, connection_1__7__21_, 
        connection_1__7__20_, connection_1__7__19_, connection_1__7__18_, 
        connection_1__7__17_, connection_1__7__16_, connection_1__7__15_, 
        connection_1__7__14_, connection_1__7__13_, connection_1__7__12_, 
        connection_1__7__11_, connection_1__7__10_, connection_1__7__9_, 
        connection_1__7__8_, connection_1__7__7_, connection_1__7__6_, 
        connection_1__7__5_, connection_1__7__4_, connection_1__7__3_, 
        connection_1__7__2_, connection_1__7__1_, connection_1__7__0_, 
        connection_1__6__31_, connection_1__6__30_, connection_1__6__29_, 
        connection_1__6__28_, connection_1__6__27_, connection_1__6__26_, 
        connection_1__6__25_, connection_1__6__24_, connection_1__6__23_, 
        connection_1__6__22_, connection_1__6__21_, connection_1__6__20_, 
        connection_1__6__19_, connection_1__6__18_, connection_1__6__17_, 
        connection_1__6__16_, connection_1__6__15_, connection_1__6__14_, 
        connection_1__6__13_, connection_1__6__12_, connection_1__6__11_, 
        connection_1__6__10_, connection_1__6__9_, connection_1__6__8_, 
        connection_1__6__7_, connection_1__6__6_, connection_1__6__5_, 
        connection_1__6__4_, connection_1__6__3_, connection_1__6__2_, 
        connection_1__6__1_, connection_1__6__0_}), .i_en(i_en), .i_cmd(
        cmd_pipeline_stage_0__pipeline_i_cmd_reg[25:24]) );
  distribute_2x2_simple_seq_DATA_WIDTH32_COMMAND_WIDTH2_12 first_half_stages_1__group_first_half_0__switch_first_half_0__second_stage ( 
        .clk(clk), .rst(rst), .i_valid({connection_valid_1__2_, 
        connection_valid_1__0_}), .i_data_bus({connection_1__2__31_, 
        connection_1__2__30_, connection_1__2__29_, connection_1__2__28_, 
        connection_1__2__27_, connection_1__2__26_, connection_1__2__25_, 
        connection_1__2__24_, connection_1__2__23_, connection_1__2__22_, 
        connection_1__2__21_, connection_1__2__20_, connection_1__2__19_, 
        connection_1__2__18_, connection_1__2__17_, connection_1__2__16_, 
        connection_1__2__15_, connection_1__2__14_, connection_1__2__13_, 
        connection_1__2__12_, connection_1__2__11_, connection_1__2__10_, 
        connection_1__2__9_, connection_1__2__8_, connection_1__2__7_, 
        connection_1__2__6_, connection_1__2__5_, connection_1__2__4_, 
        connection_1__2__3_, connection_1__2__2_, connection_1__2__1_, 
        connection_1__2__0_, connection_1__0__31_, connection_1__0__30_, 
        connection_1__0__29_, connection_1__0__28_, connection_1__0__27_, 
        connection_1__0__26_, connection_1__0__25_, connection_1__0__24_, 
        connection_1__0__23_, connection_1__0__22_, connection_1__0__21_, 
        connection_1__0__20_, connection_1__0__19_, connection_1__0__18_, 
        connection_1__0__17_, connection_1__0__16_, connection_1__0__15_, 
        connection_1__0__14_, connection_1__0__13_, connection_1__0__12_, 
        connection_1__0__11_, connection_1__0__10_, connection_1__0__9_, 
        connection_1__0__8_, connection_1__0__7_, connection_1__0__6_, 
        connection_1__0__5_, connection_1__0__4_, connection_1__0__3_, 
        connection_1__0__2_, connection_1__0__1_, connection_1__0__0_}), 
        .o_valid({connection_valid_2__1_, connection_valid_2__0_}), 
        .o_data_bus({connection_2__1__31_, connection_2__1__30_, 
        connection_2__1__29_, connection_2__1__28_, connection_2__1__27_, 
        connection_2__1__26_, connection_2__1__25_, connection_2__1__24_, 
        connection_2__1__23_, connection_2__1__22_, connection_2__1__21_, 
        connection_2__1__20_, connection_2__1__19_, connection_2__1__18_, 
        connection_2__1__17_, connection_2__1__16_, connection_2__1__15_, 
        connection_2__1__14_, connection_2__1__13_, connection_2__1__12_, 
        connection_2__1__11_, connection_2__1__10_, connection_2__1__9_, 
        connection_2__1__8_, connection_2__1__7_, connection_2__1__6_, 
        connection_2__1__5_, connection_2__1__4_, connection_2__1__3_, 
        connection_2__1__2_, connection_2__1__1_, connection_2__1__0_, 
        connection_2__0__31_, connection_2__0__30_, connection_2__0__29_, 
        connection_2__0__28_, connection_2__0__27_, connection_2__0__26_, 
        connection_2__0__25_, connection_2__0__24_, connection_2__0__23_, 
        connection_2__0__22_, connection_2__0__21_, connection_2__0__20_, 
        connection_2__0__19_, connection_2__0__18_, connection_2__0__17_, 
        connection_2__0__16_, connection_2__0__15_, connection_2__0__14_, 
        connection_2__0__13_, connection_2__0__12_, connection_2__0__11_, 
        connection_2__0__10_, connection_2__0__9_, connection_2__0__8_, 
        connection_2__0__7_, connection_2__0__6_, connection_2__0__5_, 
        connection_2__0__4_, connection_2__0__3_, connection_2__0__2_, 
        connection_2__0__1_, connection_2__0__0_}), .i_en(i_en), .i_cmd(
        cmd_pipeline_stage_1__pipeline_i_cmd_reg[23:22]) );
  distribute_2x2_simple_seq_DATA_WIDTH32_COMMAND_WIDTH2_11 first_half_stages_1__group_first_half_0__switch_first_half_1__second_stage ( 
        .clk(clk), .rst(rst), .i_valid({connection_valid_1__3_, 
        connection_valid_1__1_}), .i_data_bus({connection_1__3__31_, 
        connection_1__3__30_, connection_1__3__29_, connection_1__3__28_, 
        connection_1__3__27_, connection_1__3__26_, connection_1__3__25_, 
        connection_1__3__24_, connection_1__3__23_, connection_1__3__22_, 
        connection_1__3__21_, connection_1__3__20_, connection_1__3__19_, 
        connection_1__3__18_, connection_1__3__17_, connection_1__3__16_, 
        connection_1__3__15_, connection_1__3__14_, connection_1__3__13_, 
        connection_1__3__12_, connection_1__3__11_, connection_1__3__10_, 
        connection_1__3__9_, connection_1__3__8_, connection_1__3__7_, 
        connection_1__3__6_, connection_1__3__5_, connection_1__3__4_, 
        connection_1__3__3_, connection_1__3__2_, connection_1__3__1_, 
        connection_1__3__0_, connection_1__1__31_, connection_1__1__30_, 
        connection_1__1__29_, connection_1__1__28_, connection_1__1__27_, 
        connection_1__1__26_, connection_1__1__25_, connection_1__1__24_, 
        connection_1__1__23_, connection_1__1__22_, connection_1__1__21_, 
        connection_1__1__20_, connection_1__1__19_, connection_1__1__18_, 
        connection_1__1__17_, connection_1__1__16_, connection_1__1__15_, 
        connection_1__1__14_, connection_1__1__13_, connection_1__1__12_, 
        connection_1__1__11_, connection_1__1__10_, connection_1__1__9_, 
        connection_1__1__8_, connection_1__1__7_, connection_1__1__6_, 
        connection_1__1__5_, connection_1__1__4_, connection_1__1__3_, 
        connection_1__1__2_, connection_1__1__1_, connection_1__1__0_}), 
        .o_valid({connection_valid_2__3_, connection_valid_2__2_}), 
        .o_data_bus({connection_2__3__31_, connection_2__3__30_, 
        connection_2__3__29_, connection_2__3__28_, connection_2__3__27_, 
        connection_2__3__26_, connection_2__3__25_, connection_2__3__24_, 
        connection_2__3__23_, connection_2__3__22_, connection_2__3__21_, 
        connection_2__3__20_, connection_2__3__19_, connection_2__3__18_, 
        connection_2__3__17_, connection_2__3__16_, connection_2__3__15_, 
        connection_2__3__14_, connection_2__3__13_, connection_2__3__12_, 
        connection_2__3__11_, connection_2__3__10_, connection_2__3__9_, 
        connection_2__3__8_, connection_2__3__7_, connection_2__3__6_, 
        connection_2__3__5_, connection_2__3__4_, connection_2__3__3_, 
        connection_2__3__2_, connection_2__3__1_, connection_2__3__0_, 
        connection_2__2__31_, connection_2__2__30_, connection_2__2__29_, 
        connection_2__2__28_, connection_2__2__27_, connection_2__2__26_, 
        connection_2__2__25_, connection_2__2__24_, connection_2__2__23_, 
        connection_2__2__22_, connection_2__2__21_, connection_2__2__20_, 
        connection_2__2__19_, connection_2__2__18_, connection_2__2__17_, 
        connection_2__2__16_, connection_2__2__15_, connection_2__2__14_, 
        connection_2__2__13_, connection_2__2__12_, connection_2__2__11_, 
        connection_2__2__10_, connection_2__2__9_, connection_2__2__8_, 
        connection_2__2__7_, connection_2__2__6_, connection_2__2__5_, 
        connection_2__2__4_, connection_2__2__3_, connection_2__2__2_, 
        connection_2__2__1_, connection_2__2__0_}), .i_en(i_en), .i_cmd(
        cmd_pipeline_stage_1__pipeline_i_cmd_reg[21:20]) );
  distribute_2x2_simple_seq_DATA_WIDTH32_COMMAND_WIDTH2_10 first_half_stages_1__group_first_half_1__switch_first_half_0__second_stage ( 
        .clk(clk), .rst(rst), .i_valid({connection_valid_1__6_, 
        connection_valid_1__4_}), .i_data_bus({connection_1__6__31_, 
        connection_1__6__30_, connection_1__6__29_, connection_1__6__28_, 
        connection_1__6__27_, connection_1__6__26_, connection_1__6__25_, 
        connection_1__6__24_, connection_1__6__23_, connection_1__6__22_, 
        connection_1__6__21_, connection_1__6__20_, connection_1__6__19_, 
        connection_1__6__18_, connection_1__6__17_, connection_1__6__16_, 
        connection_1__6__15_, connection_1__6__14_, connection_1__6__13_, 
        connection_1__6__12_, connection_1__6__11_, connection_1__6__10_, 
        connection_1__6__9_, connection_1__6__8_, connection_1__6__7_, 
        connection_1__6__6_, connection_1__6__5_, connection_1__6__4_, 
        connection_1__6__3_, connection_1__6__2_, connection_1__6__1_, 
        connection_1__6__0_, connection_1__4__31_, connection_1__4__30_, 
        connection_1__4__29_, connection_1__4__28_, connection_1__4__27_, 
        connection_1__4__26_, connection_1__4__25_, connection_1__4__24_, 
        connection_1__4__23_, connection_1__4__22_, connection_1__4__21_, 
        connection_1__4__20_, connection_1__4__19_, connection_1__4__18_, 
        connection_1__4__17_, connection_1__4__16_, connection_1__4__15_, 
        connection_1__4__14_, connection_1__4__13_, connection_1__4__12_, 
        connection_1__4__11_, connection_1__4__10_, connection_1__4__9_, 
        connection_1__4__8_, connection_1__4__7_, connection_1__4__6_, 
        connection_1__4__5_, connection_1__4__4_, connection_1__4__3_, 
        connection_1__4__2_, connection_1__4__1_, connection_1__4__0_}), 
        .o_valid({connection_valid_2__5_, connection_valid_2__4_}), 
        .o_data_bus({connection_2__5__31_, connection_2__5__30_, 
        connection_2__5__29_, connection_2__5__28_, connection_2__5__27_, 
        connection_2__5__26_, connection_2__5__25_, connection_2__5__24_, 
        connection_2__5__23_, connection_2__5__22_, connection_2__5__21_, 
        connection_2__5__20_, connection_2__5__19_, connection_2__5__18_, 
        connection_2__5__17_, connection_2__5__16_, connection_2__5__15_, 
        connection_2__5__14_, connection_2__5__13_, connection_2__5__12_, 
        connection_2__5__11_, connection_2__5__10_, connection_2__5__9_, 
        connection_2__5__8_, connection_2__5__7_, connection_2__5__6_, 
        connection_2__5__5_, connection_2__5__4_, connection_2__5__3_, 
        connection_2__5__2_, connection_2__5__1_, connection_2__5__0_, 
        connection_2__4__31_, connection_2__4__30_, connection_2__4__29_, 
        connection_2__4__28_, connection_2__4__27_, connection_2__4__26_, 
        connection_2__4__25_, connection_2__4__24_, connection_2__4__23_, 
        connection_2__4__22_, connection_2__4__21_, connection_2__4__20_, 
        connection_2__4__19_, connection_2__4__18_, connection_2__4__17_, 
        connection_2__4__16_, connection_2__4__15_, connection_2__4__14_, 
        connection_2__4__13_, connection_2__4__12_, connection_2__4__11_, 
        connection_2__4__10_, connection_2__4__9_, connection_2__4__8_, 
        connection_2__4__7_, connection_2__4__6_, connection_2__4__5_, 
        connection_2__4__4_, connection_2__4__3_, connection_2__4__2_, 
        connection_2__4__1_, connection_2__4__0_}), .i_en(i_en), .i_cmd(
        cmd_pipeline_stage_1__pipeline_i_cmd_reg[19:18]) );
  distribute_2x2_simple_seq_DATA_WIDTH32_COMMAND_WIDTH2_9 first_half_stages_1__group_first_half_1__switch_first_half_1__second_stage ( 
        .clk(clk), .rst(rst), .i_valid({connection_valid_1__7_, 
        connection_valid_1__5_}), .i_data_bus({connection_1__7__31_, 
        connection_1__7__30_, connection_1__7__29_, connection_1__7__28_, 
        connection_1__7__27_, connection_1__7__26_, connection_1__7__25_, 
        connection_1__7__24_, connection_1__7__23_, connection_1__7__22_, 
        connection_1__7__21_, connection_1__7__20_, connection_1__7__19_, 
        connection_1__7__18_, connection_1__7__17_, connection_1__7__16_, 
        connection_1__7__15_, connection_1__7__14_, connection_1__7__13_, 
        connection_1__7__12_, connection_1__7__11_, connection_1__7__10_, 
        connection_1__7__9_, connection_1__7__8_, connection_1__7__7_, 
        connection_1__7__6_, connection_1__7__5_, connection_1__7__4_, 
        connection_1__7__3_, connection_1__7__2_, connection_1__7__1_, 
        connection_1__7__0_, connection_1__5__31_, connection_1__5__30_, 
        connection_1__5__29_, connection_1__5__28_, connection_1__5__27_, 
        connection_1__5__26_, connection_1__5__25_, connection_1__5__24_, 
        connection_1__5__23_, connection_1__5__22_, connection_1__5__21_, 
        connection_1__5__20_, connection_1__5__19_, connection_1__5__18_, 
        connection_1__5__17_, connection_1__5__16_, connection_1__5__15_, 
        connection_1__5__14_, connection_1__5__13_, connection_1__5__12_, 
        connection_1__5__11_, connection_1__5__10_, connection_1__5__9_, 
        connection_1__5__8_, connection_1__5__7_, connection_1__5__6_, 
        connection_1__5__5_, connection_1__5__4_, connection_1__5__3_, 
        connection_1__5__2_, connection_1__5__1_, connection_1__5__0_}), 
        .o_valid({connection_valid_2__7_, connection_valid_2__6_}), 
        .o_data_bus({connection_2__7__31_, connection_2__7__30_, 
        connection_2__7__29_, connection_2__7__28_, connection_2__7__27_, 
        connection_2__7__26_, connection_2__7__25_, connection_2__7__24_, 
        connection_2__7__23_, connection_2__7__22_, connection_2__7__21_, 
        connection_2__7__20_, connection_2__7__19_, connection_2__7__18_, 
        connection_2__7__17_, connection_2__7__16_, connection_2__7__15_, 
        connection_2__7__14_, connection_2__7__13_, connection_2__7__12_, 
        connection_2__7__11_, connection_2__7__10_, connection_2__7__9_, 
        connection_2__7__8_, connection_2__7__7_, connection_2__7__6_, 
        connection_2__7__5_, connection_2__7__4_, connection_2__7__3_, 
        connection_2__7__2_, connection_2__7__1_, connection_2__7__0_, 
        connection_2__6__31_, connection_2__6__30_, connection_2__6__29_, 
        connection_2__6__28_, connection_2__6__27_, connection_2__6__26_, 
        connection_2__6__25_, connection_2__6__24_, connection_2__6__23_, 
        connection_2__6__22_, connection_2__6__21_, connection_2__6__20_, 
        connection_2__6__19_, connection_2__6__18_, connection_2__6__17_, 
        connection_2__6__16_, connection_2__6__15_, connection_2__6__14_, 
        connection_2__6__13_, connection_2__6__12_, connection_2__6__11_, 
        connection_2__6__10_, connection_2__6__9_, connection_2__6__8_, 
        connection_2__6__7_, connection_2__6__6_, connection_2__6__5_, 
        connection_2__6__4_, connection_2__6__3_, connection_2__6__2_, 
        connection_2__6__1_, connection_2__6__0_}), .i_en(i_en), .i_cmd(
        cmd_pipeline_stage_1__pipeline_i_cmd_reg[17:16]) );
  distribute_2x2_simple_seq_DATA_WIDTH32_COMMAND_WIDTH2_8 second_half_stages_2__group_sec_half_0__switch_sec_half_0__third_stage ( 
        .clk(clk), .rst(rst), .i_valid({connection_valid_2__2_, 
        connection_valid_2__0_}), .i_data_bus({connection_2__2__31_, 
        connection_2__2__30_, connection_2__2__29_, connection_2__2__28_, 
        connection_2__2__27_, connection_2__2__26_, connection_2__2__25_, 
        connection_2__2__24_, connection_2__2__23_, connection_2__2__22_, 
        connection_2__2__21_, connection_2__2__20_, connection_2__2__19_, 
        connection_2__2__18_, connection_2__2__17_, connection_2__2__16_, 
        connection_2__2__15_, connection_2__2__14_, connection_2__2__13_, 
        connection_2__2__12_, connection_2__2__11_, connection_2__2__10_, 
        connection_2__2__9_, connection_2__2__8_, connection_2__2__7_, 
        connection_2__2__6_, connection_2__2__5_, connection_2__2__4_, 
        connection_2__2__3_, connection_2__2__2_, connection_2__2__1_, 
        connection_2__2__0_, connection_2__0__31_, connection_2__0__30_, 
        connection_2__0__29_, connection_2__0__28_, connection_2__0__27_, 
        connection_2__0__26_, connection_2__0__25_, connection_2__0__24_, 
        connection_2__0__23_, connection_2__0__22_, connection_2__0__21_, 
        connection_2__0__20_, connection_2__0__19_, connection_2__0__18_, 
        connection_2__0__17_, connection_2__0__16_, connection_2__0__15_, 
        connection_2__0__14_, connection_2__0__13_, connection_2__0__12_, 
        connection_2__0__11_, connection_2__0__10_, connection_2__0__9_, 
        connection_2__0__8_, connection_2__0__7_, connection_2__0__6_, 
        connection_2__0__5_, connection_2__0__4_, connection_2__0__3_, 
        connection_2__0__2_, connection_2__0__1_, connection_2__0__0_}), 
        .o_valid({connection_valid_3__1_, connection_valid_3__0_}), 
        .o_data_bus({connection_3__1__31_, connection_3__1__30_, 
        connection_3__1__29_, connection_3__1__28_, connection_3__1__27_, 
        connection_3__1__26_, connection_3__1__25_, connection_3__1__24_, 
        connection_3__1__23_, connection_3__1__22_, connection_3__1__21_, 
        connection_3__1__20_, connection_3__1__19_, connection_3__1__18_, 
        connection_3__1__17_, connection_3__1__16_, connection_3__1__15_, 
        connection_3__1__14_, connection_3__1__13_, connection_3__1__12_, 
        connection_3__1__11_, connection_3__1__10_, connection_3__1__9_, 
        connection_3__1__8_, connection_3__1__7_, connection_3__1__6_, 
        connection_3__1__5_, connection_3__1__4_, connection_3__1__3_, 
        connection_3__1__2_, connection_3__1__1_, connection_3__1__0_, 
        connection_3__0__31_, connection_3__0__30_, connection_3__0__29_, 
        connection_3__0__28_, connection_3__0__27_, connection_3__0__26_, 
        connection_3__0__25_, connection_3__0__24_, connection_3__0__23_, 
        connection_3__0__22_, connection_3__0__21_, connection_3__0__20_, 
        connection_3__0__19_, connection_3__0__18_, connection_3__0__17_, 
        connection_3__0__16_, connection_3__0__15_, connection_3__0__14_, 
        connection_3__0__13_, connection_3__0__12_, connection_3__0__11_, 
        connection_3__0__10_, connection_3__0__9_, connection_3__0__8_, 
        connection_3__0__7_, connection_3__0__6_, connection_3__0__5_, 
        connection_3__0__4_, connection_3__0__3_, connection_3__0__2_, 
        connection_3__0__1_, connection_3__0__0_}), .i_en(i_en), .i_cmd(
        cmd_pipeline_stage_2__pipeline_i_cmd_reg[15:14]) );
  distribute_2x2_simple_seq_DATA_WIDTH32_COMMAND_WIDTH2_7 second_half_stages_2__group_sec_half_0__switch_sec_half_1__third_stage ( 
        .clk(clk), .rst(rst), .i_valid({connection_valid_2__3_, 
        connection_valid_2__1_}), .i_data_bus({connection_2__3__31_, 
        connection_2__3__30_, connection_2__3__29_, connection_2__3__28_, 
        connection_2__3__27_, connection_2__3__26_, connection_2__3__25_, 
        connection_2__3__24_, connection_2__3__23_, connection_2__3__22_, 
        connection_2__3__21_, connection_2__3__20_, connection_2__3__19_, 
        connection_2__3__18_, connection_2__3__17_, connection_2__3__16_, 
        connection_2__3__15_, connection_2__3__14_, connection_2__3__13_, 
        connection_2__3__12_, connection_2__3__11_, connection_2__3__10_, 
        connection_2__3__9_, connection_2__3__8_, connection_2__3__7_, 
        connection_2__3__6_, connection_2__3__5_, connection_2__3__4_, 
        connection_2__3__3_, connection_2__3__2_, connection_2__3__1_, 
        connection_2__3__0_, connection_2__1__31_, connection_2__1__30_, 
        connection_2__1__29_, connection_2__1__28_, connection_2__1__27_, 
        connection_2__1__26_, connection_2__1__25_, connection_2__1__24_, 
        connection_2__1__23_, connection_2__1__22_, connection_2__1__21_, 
        connection_2__1__20_, connection_2__1__19_, connection_2__1__18_, 
        connection_2__1__17_, connection_2__1__16_, connection_2__1__15_, 
        connection_2__1__14_, connection_2__1__13_, connection_2__1__12_, 
        connection_2__1__11_, connection_2__1__10_, connection_2__1__9_, 
        connection_2__1__8_, connection_2__1__7_, connection_2__1__6_, 
        connection_2__1__5_, connection_2__1__4_, connection_2__1__3_, 
        connection_2__1__2_, connection_2__1__1_, connection_2__1__0_}), 
        .o_valid({connection_valid_3__3_, connection_valid_3__2_}), 
        .o_data_bus({connection_3__3__31_, connection_3__3__30_, 
        connection_3__3__29_, connection_3__3__28_, connection_3__3__27_, 
        connection_3__3__26_, connection_3__3__25_, connection_3__3__24_, 
        connection_3__3__23_, connection_3__3__22_, connection_3__3__21_, 
        connection_3__3__20_, connection_3__3__19_, connection_3__3__18_, 
        connection_3__3__17_, connection_3__3__16_, connection_3__3__15_, 
        connection_3__3__14_, connection_3__3__13_, connection_3__3__12_, 
        connection_3__3__11_, connection_3__3__10_, connection_3__3__9_, 
        connection_3__3__8_, connection_3__3__7_, connection_3__3__6_, 
        connection_3__3__5_, connection_3__3__4_, connection_3__3__3_, 
        connection_3__3__2_, connection_3__3__1_, connection_3__3__0_, 
        connection_3__2__31_, connection_3__2__30_, connection_3__2__29_, 
        connection_3__2__28_, connection_3__2__27_, connection_3__2__26_, 
        connection_3__2__25_, connection_3__2__24_, connection_3__2__23_, 
        connection_3__2__22_, connection_3__2__21_, connection_3__2__20_, 
        connection_3__2__19_, connection_3__2__18_, connection_3__2__17_, 
        connection_3__2__16_, connection_3__2__15_, connection_3__2__14_, 
        connection_3__2__13_, connection_3__2__12_, connection_3__2__11_, 
        connection_3__2__10_, connection_3__2__9_, connection_3__2__8_, 
        connection_3__2__7_, connection_3__2__6_, connection_3__2__5_, 
        connection_3__2__4_, connection_3__2__3_, connection_3__2__2_, 
        connection_3__2__1_, connection_3__2__0_}), .i_en(i_en), .i_cmd(
        cmd_pipeline_stage_2__pipeline_i_cmd_reg[13:12]) );
  distribute_2x2_simple_seq_DATA_WIDTH32_COMMAND_WIDTH2_6 second_half_stages_2__group_sec_half_1__switch_sec_half_0__third_stage ( 
        .clk(clk), .rst(rst), .i_valid({connection_valid_2__6_, 
        connection_valid_2__4_}), .i_data_bus({connection_2__6__31_, 
        connection_2__6__30_, connection_2__6__29_, connection_2__6__28_, 
        connection_2__6__27_, connection_2__6__26_, connection_2__6__25_, 
        connection_2__6__24_, connection_2__6__23_, connection_2__6__22_, 
        connection_2__6__21_, connection_2__6__20_, connection_2__6__19_, 
        connection_2__6__18_, connection_2__6__17_, connection_2__6__16_, 
        connection_2__6__15_, connection_2__6__14_, connection_2__6__13_, 
        connection_2__6__12_, connection_2__6__11_, connection_2__6__10_, 
        connection_2__6__9_, connection_2__6__8_, connection_2__6__7_, 
        connection_2__6__6_, connection_2__6__5_, connection_2__6__4_, 
        connection_2__6__3_, connection_2__6__2_, connection_2__6__1_, 
        connection_2__6__0_, connection_2__4__31_, connection_2__4__30_, 
        connection_2__4__29_, connection_2__4__28_, connection_2__4__27_, 
        connection_2__4__26_, connection_2__4__25_, connection_2__4__24_, 
        connection_2__4__23_, connection_2__4__22_, connection_2__4__21_, 
        connection_2__4__20_, connection_2__4__19_, connection_2__4__18_, 
        connection_2__4__17_, connection_2__4__16_, connection_2__4__15_, 
        connection_2__4__14_, connection_2__4__13_, connection_2__4__12_, 
        connection_2__4__11_, connection_2__4__10_, connection_2__4__9_, 
        connection_2__4__8_, connection_2__4__7_, connection_2__4__6_, 
        connection_2__4__5_, connection_2__4__4_, connection_2__4__3_, 
        connection_2__4__2_, connection_2__4__1_, connection_2__4__0_}), 
        .o_valid({connection_valid_3__5_, connection_valid_3__4_}), 
        .o_data_bus({connection_3__5__31_, connection_3__5__30_, 
        connection_3__5__29_, connection_3__5__28_, connection_3__5__27_, 
        connection_3__5__26_, connection_3__5__25_, connection_3__5__24_, 
        connection_3__5__23_, connection_3__5__22_, connection_3__5__21_, 
        connection_3__5__20_, connection_3__5__19_, connection_3__5__18_, 
        connection_3__5__17_, connection_3__5__16_, connection_3__5__15_, 
        connection_3__5__14_, connection_3__5__13_, connection_3__5__12_, 
        connection_3__5__11_, connection_3__5__10_, connection_3__5__9_, 
        connection_3__5__8_, connection_3__5__7_, connection_3__5__6_, 
        connection_3__5__5_, connection_3__5__4_, connection_3__5__3_, 
        connection_3__5__2_, connection_3__5__1_, connection_3__5__0_, 
        connection_3__4__31_, connection_3__4__30_, connection_3__4__29_, 
        connection_3__4__28_, connection_3__4__27_, connection_3__4__26_, 
        connection_3__4__25_, connection_3__4__24_, connection_3__4__23_, 
        connection_3__4__22_, connection_3__4__21_, connection_3__4__20_, 
        connection_3__4__19_, connection_3__4__18_, connection_3__4__17_, 
        connection_3__4__16_, connection_3__4__15_, connection_3__4__14_, 
        connection_3__4__13_, connection_3__4__12_, connection_3__4__11_, 
        connection_3__4__10_, connection_3__4__9_, connection_3__4__8_, 
        connection_3__4__7_, connection_3__4__6_, connection_3__4__5_, 
        connection_3__4__4_, connection_3__4__3_, connection_3__4__2_, 
        connection_3__4__1_, connection_3__4__0_}), .i_en(i_en), .i_cmd(
        cmd_pipeline_stage_2__pipeline_i_cmd_reg[11:10]) );
  distribute_2x2_simple_seq_DATA_WIDTH32_COMMAND_WIDTH2_5 second_half_stages_2__group_sec_half_1__switch_sec_half_1__third_stage ( 
        .clk(clk), .rst(rst), .i_valid({connection_valid_2__7_, 
        connection_valid_2__5_}), .i_data_bus({connection_2__7__31_, 
        connection_2__7__30_, connection_2__7__29_, connection_2__7__28_, 
        connection_2__7__27_, connection_2__7__26_, connection_2__7__25_, 
        connection_2__7__24_, connection_2__7__23_, connection_2__7__22_, 
        connection_2__7__21_, connection_2__7__20_, connection_2__7__19_, 
        connection_2__7__18_, connection_2__7__17_, connection_2__7__16_, 
        connection_2__7__15_, connection_2__7__14_, connection_2__7__13_, 
        connection_2__7__12_, connection_2__7__11_, connection_2__7__10_, 
        connection_2__7__9_, connection_2__7__8_, connection_2__7__7_, 
        connection_2__7__6_, connection_2__7__5_, connection_2__7__4_, 
        connection_2__7__3_, connection_2__7__2_, connection_2__7__1_, 
        connection_2__7__0_, connection_2__5__31_, connection_2__5__30_, 
        connection_2__5__29_, connection_2__5__28_, connection_2__5__27_, 
        connection_2__5__26_, connection_2__5__25_, connection_2__5__24_, 
        connection_2__5__23_, connection_2__5__22_, connection_2__5__21_, 
        connection_2__5__20_, connection_2__5__19_, connection_2__5__18_, 
        connection_2__5__17_, connection_2__5__16_, connection_2__5__15_, 
        connection_2__5__14_, connection_2__5__13_, connection_2__5__12_, 
        connection_2__5__11_, connection_2__5__10_, connection_2__5__9_, 
        connection_2__5__8_, connection_2__5__7_, connection_2__5__6_, 
        connection_2__5__5_, connection_2__5__4_, connection_2__5__3_, 
        connection_2__5__2_, connection_2__5__1_, connection_2__5__0_}), 
        .o_valid({connection_valid_3__7_, connection_valid_3__6_}), 
        .o_data_bus({connection_3__7__31_, connection_3__7__30_, 
        connection_3__7__29_, connection_3__7__28_, connection_3__7__27_, 
        connection_3__7__26_, connection_3__7__25_, connection_3__7__24_, 
        connection_3__7__23_, connection_3__7__22_, connection_3__7__21_, 
        connection_3__7__20_, connection_3__7__19_, connection_3__7__18_, 
        connection_3__7__17_, connection_3__7__16_, connection_3__7__15_, 
        connection_3__7__14_, connection_3__7__13_, connection_3__7__12_, 
        connection_3__7__11_, connection_3__7__10_, connection_3__7__9_, 
        connection_3__7__8_, connection_3__7__7_, connection_3__7__6_, 
        connection_3__7__5_, connection_3__7__4_, connection_3__7__3_, 
        connection_3__7__2_, connection_3__7__1_, connection_3__7__0_, 
        connection_3__6__31_, connection_3__6__30_, connection_3__6__29_, 
        connection_3__6__28_, connection_3__6__27_, connection_3__6__26_, 
        connection_3__6__25_, connection_3__6__24_, connection_3__6__23_, 
        connection_3__6__22_, connection_3__6__21_, connection_3__6__20_, 
        connection_3__6__19_, connection_3__6__18_, connection_3__6__17_, 
        connection_3__6__16_, connection_3__6__15_, connection_3__6__14_, 
        connection_3__6__13_, connection_3__6__12_, connection_3__6__11_, 
        connection_3__6__10_, connection_3__6__9_, connection_3__6__8_, 
        connection_3__6__7_, connection_3__6__6_, connection_3__6__5_, 
        connection_3__6__4_, connection_3__6__3_, connection_3__6__2_, 
        connection_3__6__1_, connection_3__6__0_}), .i_en(i_en), .i_cmd(
        cmd_pipeline_stage_2__pipeline_i_cmd_reg[9:8]) );
  distribute_2x2_simple_seq_DATA_WIDTH32_COMMAND_WIDTH2_4 second_half_stages_3__group_sec_half_0__switch_sec_half_0__third_stage ( 
        .clk(clk), .rst(rst), .i_valid({connection_valid_3__4_, 
        connection_valid_3__0_}), .i_data_bus({connection_3__4__31_, 
        connection_3__4__30_, connection_3__4__29_, connection_3__4__28_, 
        connection_3__4__27_, connection_3__4__26_, connection_3__4__25_, 
        connection_3__4__24_, connection_3__4__23_, connection_3__4__22_, 
        connection_3__4__21_, connection_3__4__20_, connection_3__4__19_, 
        connection_3__4__18_, connection_3__4__17_, connection_3__4__16_, 
        connection_3__4__15_, connection_3__4__14_, connection_3__4__13_, 
        connection_3__4__12_, connection_3__4__11_, connection_3__4__10_, 
        connection_3__4__9_, connection_3__4__8_, connection_3__4__7_, 
        connection_3__4__6_, connection_3__4__5_, connection_3__4__4_, 
        connection_3__4__3_, connection_3__4__2_, connection_3__4__1_, 
        connection_3__4__0_, connection_3__0__31_, connection_3__0__30_, 
        connection_3__0__29_, connection_3__0__28_, connection_3__0__27_, 
        connection_3__0__26_, connection_3__0__25_, connection_3__0__24_, 
        connection_3__0__23_, connection_3__0__22_, connection_3__0__21_, 
        connection_3__0__20_, connection_3__0__19_, connection_3__0__18_, 
        connection_3__0__17_, connection_3__0__16_, connection_3__0__15_, 
        connection_3__0__14_, connection_3__0__13_, connection_3__0__12_, 
        connection_3__0__11_, connection_3__0__10_, connection_3__0__9_, 
        connection_3__0__8_, connection_3__0__7_, connection_3__0__6_, 
        connection_3__0__5_, connection_3__0__4_, connection_3__0__3_, 
        connection_3__0__2_, connection_3__0__1_, connection_3__0__0_}), 
        .o_valid({n273, n274}), .o_data_bus({n467, n468, n469, n470, n471, 
        n472, n473, n474, n475, n476, n477, n478, n479, n480, n481, n482, n483, 
        n484, n485, n486, n487, n488, n489, n490, n491, n492, n493, n494, n495, 
        n496, n497, n498, n499, n500, n501, n502, n503, n504, n505, n506, n507, 
        n508, n509, n510, n511, n512, n513, n514, n515, n516, n517, n518, n519, 
        n520, n521, n522, n523, n524, n525, n526, n527, n528, n529, n530}), 
        .i_en(i_en), .i_cmd(cmd_pipeline_stage_3__pipeline_i_cmd_reg[7:6]) );
  distribute_2x2_simple_seq_DATA_WIDTH32_COMMAND_WIDTH2_3 second_half_stages_3__group_sec_half_0__switch_sec_half_1__third_stage ( 
        .clk(clk), .rst(rst), .i_valid({connection_valid_3__5_, 
        connection_valid_3__1_}), .i_data_bus({connection_3__5__31_, 
        connection_3__5__30_, connection_3__5__29_, connection_3__5__28_, 
        connection_3__5__27_, connection_3__5__26_, connection_3__5__25_, 
        connection_3__5__24_, connection_3__5__23_, connection_3__5__22_, 
        connection_3__5__21_, connection_3__5__20_, connection_3__5__19_, 
        connection_3__5__18_, connection_3__5__17_, connection_3__5__16_, 
        connection_3__5__15_, connection_3__5__14_, connection_3__5__13_, 
        connection_3__5__12_, connection_3__5__11_, connection_3__5__10_, 
        connection_3__5__9_, connection_3__5__8_, connection_3__5__7_, 
        connection_3__5__6_, connection_3__5__5_, connection_3__5__4_, 
        connection_3__5__3_, connection_3__5__2_, connection_3__5__1_, 
        connection_3__5__0_, connection_3__1__31_, connection_3__1__30_, 
        connection_3__1__29_, connection_3__1__28_, connection_3__1__27_, 
        connection_3__1__26_, connection_3__1__25_, connection_3__1__24_, 
        connection_3__1__23_, connection_3__1__22_, connection_3__1__21_, 
        connection_3__1__20_, connection_3__1__19_, connection_3__1__18_, 
        connection_3__1__17_, connection_3__1__16_, connection_3__1__15_, 
        connection_3__1__14_, connection_3__1__13_, connection_3__1__12_, 
        connection_3__1__11_, connection_3__1__10_, connection_3__1__9_, 
        connection_3__1__8_, connection_3__1__7_, connection_3__1__6_, 
        connection_3__1__5_, connection_3__1__4_, connection_3__1__3_, 
        connection_3__1__2_, connection_3__1__1_, connection_3__1__0_}), 
        .o_valid({n271, n272}), .o_data_bus({n403, n404, n405, n406, n407, 
        n408, n409, n410, n411, n412, n413, n414, n415, n416, n417, n418, n419, 
        n420, n421, n422, n423, n424, n425, n426, n427, n428, n429, n430, n431, 
        n432, n433, n434, n435, n436, n437, n438, n439, n440, n441, n442, n443, 
        n444, n445, n446, n447, n448, n449, n450, n451, n452, n453, n454, n455, 
        n456, n457, n458, n459, n460, n461, n462, n463, n464, n465, n466}), 
        .i_en(i_en), .i_cmd(cmd_pipeline_stage_3__pipeline_i_cmd_reg[5:4]) );
  distribute_2x2_simple_seq_DATA_WIDTH32_COMMAND_WIDTH2_2 second_half_stages_3__group_sec_half_0__switch_sec_half_2__third_stage ( 
        .clk(clk), .rst(rst), .i_valid({connection_valid_3__6_, 
        connection_valid_3__2_}), .i_data_bus({connection_3__6__31_, 
        connection_3__6__30_, connection_3__6__29_, connection_3__6__28_, 
        connection_3__6__27_, connection_3__6__26_, connection_3__6__25_, 
        connection_3__6__24_, connection_3__6__23_, connection_3__6__22_, 
        connection_3__6__21_, connection_3__6__20_, connection_3__6__19_, 
        connection_3__6__18_, connection_3__6__17_, connection_3__6__16_, 
        connection_3__6__15_, connection_3__6__14_, connection_3__6__13_, 
        connection_3__6__12_, connection_3__6__11_, connection_3__6__10_, 
        connection_3__6__9_, connection_3__6__8_, connection_3__6__7_, 
        connection_3__6__6_, connection_3__6__5_, connection_3__6__4_, 
        connection_3__6__3_, connection_3__6__2_, connection_3__6__1_, 
        connection_3__6__0_, connection_3__2__31_, connection_3__2__30_, 
        connection_3__2__29_, connection_3__2__28_, connection_3__2__27_, 
        connection_3__2__26_, connection_3__2__25_, connection_3__2__24_, 
        connection_3__2__23_, connection_3__2__22_, connection_3__2__21_, 
        connection_3__2__20_, connection_3__2__19_, connection_3__2__18_, 
        connection_3__2__17_, connection_3__2__16_, connection_3__2__15_, 
        connection_3__2__14_, connection_3__2__13_, connection_3__2__12_, 
        connection_3__2__11_, connection_3__2__10_, connection_3__2__9_, 
        connection_3__2__8_, connection_3__2__7_, connection_3__2__6_, 
        connection_3__2__5_, connection_3__2__4_, connection_3__2__3_, 
        connection_3__2__2_, connection_3__2__1_, connection_3__2__0_}), 
        .o_valid({n269, n270}), .o_data_bus({n339, n340, n341, n342, n343, 
        n344, n345, n346, n347, n348, n349, n350, n351, n352, n353, n354, n355, 
        n356, n357, n358, n359, n360, n361, n362, n363, n364, n365, n366, n367, 
        n368, n369, n370, n371, n372, n373, n374, n375, n376, n377, n378, n379, 
        n380, n381, n382, n383, n384, n385, n386, n387, n388, n389, n390, n391, 
        n392, n393, n394, n395, n396, n397, n398, n399, n400, n401, n402}), 
        .i_en(i_en), .i_cmd(cmd_pipeline_stage_3__pipeline_i_cmd_reg[3:2]) );
  distribute_2x2_simple_seq_DATA_WIDTH32_COMMAND_WIDTH2_1 second_half_stages_3__group_sec_half_0__switch_sec_half_3__third_stage ( 
        .clk(clk), .rst(rst), .i_valid({connection_valid_3__7_, 
        connection_valid_3__3_}), .i_data_bus({connection_3__7__31_, 
        connection_3__7__30_, connection_3__7__29_, connection_3__7__28_, 
        connection_3__7__27_, connection_3__7__26_, connection_3__7__25_, 
        connection_3__7__24_, connection_3__7__23_, connection_3__7__22_, 
        connection_3__7__21_, connection_3__7__20_, connection_3__7__19_, 
        connection_3__7__18_, connection_3__7__17_, connection_3__7__16_, 
        connection_3__7__15_, connection_3__7__14_, connection_3__7__13_, 
        connection_3__7__12_, connection_3__7__11_, connection_3__7__10_, 
        connection_3__7__9_, connection_3__7__8_, connection_3__7__7_, 
        connection_3__7__6_, connection_3__7__5_, connection_3__7__4_, 
        connection_3__7__3_, connection_3__7__2_, connection_3__7__1_, 
        connection_3__7__0_, connection_3__3__31_, connection_3__3__30_, 
        connection_3__3__29_, connection_3__3__28_, connection_3__3__27_, 
        connection_3__3__26_, connection_3__3__25_, connection_3__3__24_, 
        connection_3__3__23_, connection_3__3__22_, connection_3__3__21_, 
        connection_3__3__20_, connection_3__3__19_, connection_3__3__18_, 
        connection_3__3__17_, connection_3__3__16_, connection_3__3__15_, 
        connection_3__3__14_, connection_3__3__13_, connection_3__3__12_, 
        connection_3__3__11_, connection_3__3__10_, connection_3__3__9_, 
        connection_3__3__8_, connection_3__3__7_, connection_3__3__6_, 
        connection_3__3__5_, connection_3__3__4_, connection_3__3__3_, 
        connection_3__3__2_, connection_3__3__1_, connection_3__3__0_}), 
        .o_valid({n267, n268}), .o_data_bus({n275, n276, n277, n278, n279, 
        n280, n281, n282, n283, n284, n285, n286, n287, n288, n289, n290, n291, 
        n292, n293, n294, n295, n296, n297, n298, n299, n300, n301, n302, n303, 
        n304, n305, n306, n307, n308, n309, n310, n311, n312, n313, n314, n315, 
        n316, n317, n318, n319, n320, n321, n322, n323, n324, n325, n326, n327, 
        n328, n329, n330, n331, n332, n333, n334, n335, n336, n337, n338}), 
        .i_en(i_en), .i_cmd(cmd_pipeline_stage_3__pipeline_i_cmd_reg[1:0]) );
  DFQD1BWP30P140LVT cmd_pipeline_stage_0__pipeline_i_cmd_reg_reg_0__0__1_ ( 
        .D(i_cmd[9]), .CP(clk), .Q(
        cmd_pipeline_stage_0__pipeline_i_cmd_reg[31]) );
  DFQD1BWP30P140LVT cmd_pipeline_stage_0__pipeline_i_cmd_reg_reg_0__0__0_ ( 
        .D(i_cmd[8]), .CP(clk), .Q(
        cmd_pipeline_stage_0__pipeline_i_cmd_reg[30]) );
  DFQD1BWP30P140LVT cmd_pipeline_stage_0__pipeline_i_cmd_reg_reg_0__1__1_ ( 
        .D(i_cmd[11]), .CP(clk), .Q(
        cmd_pipeline_stage_0__pipeline_i_cmd_reg[29]) );
  DFQD1BWP30P140LVT cmd_pipeline_stage_0__pipeline_i_cmd_reg_reg_0__1__0_ ( 
        .D(i_cmd[10]), .CP(clk), .Q(
        cmd_pipeline_stage_0__pipeline_i_cmd_reg[28]) );
  DFQD1BWP30P140LVT cmd_pipeline_stage_0__pipeline_i_cmd_reg_reg_0__2__1_ ( 
        .D(i_cmd[13]), .CP(clk), .Q(
        cmd_pipeline_stage_0__pipeline_i_cmd_reg[27]) );
  DFQD1BWP30P140LVT cmd_pipeline_stage_0__pipeline_i_cmd_reg_reg_0__2__0_ ( 
        .D(i_cmd[12]), .CP(clk), .Q(
        cmd_pipeline_stage_0__pipeline_i_cmd_reg[26]) );
  DFQD1BWP30P140LVT cmd_pipeline_stage_0__pipeline_i_cmd_reg_reg_0__3__1_ ( 
        .D(i_cmd[15]), .CP(clk), .Q(
        cmd_pipeline_stage_0__pipeline_i_cmd_reg[25]) );
  DFQD1BWP30P140LVT cmd_pipeline_stage_0__pipeline_i_cmd_reg_reg_0__3__0_ ( 
        .D(i_cmd[14]), .CP(clk), .Q(
        cmd_pipeline_stage_0__pipeline_i_cmd_reg[24]) );
  DFQD1BWP30P140LVT cmd_pipeline_stage_0__pipeline_i_cmd_reg_reg_1__0__1_ ( 
        .D(i_cmd[17]), .CP(clk), .Q(
        cmd_pipeline_stage_0__pipeline_i_cmd_reg[23]) );
  DFQD1BWP30P140LVT cmd_pipeline_stage_0__pipeline_i_cmd_reg_reg_1__0__0_ ( 
        .D(i_cmd[16]), .CP(clk), .Q(
        cmd_pipeline_stage_0__pipeline_i_cmd_reg[22]) );
  DFQD1BWP30P140LVT cmd_pipeline_stage_0__pipeline_i_cmd_reg_reg_1__1__1_ ( 
        .D(i_cmd[19]), .CP(clk), .Q(
        cmd_pipeline_stage_0__pipeline_i_cmd_reg[21]) );
  DFQD1BWP30P140LVT cmd_pipeline_stage_0__pipeline_i_cmd_reg_reg_1__1__0_ ( 
        .D(i_cmd[18]), .CP(clk), .Q(
        cmd_pipeline_stage_0__pipeline_i_cmd_reg[20]) );
  DFQD1BWP30P140LVT cmd_pipeline_stage_0__pipeline_i_cmd_reg_reg_1__2__1_ ( 
        .D(i_cmd[21]), .CP(clk), .Q(
        cmd_pipeline_stage_0__pipeline_i_cmd_reg[19]) );
  DFQD1BWP30P140LVT cmd_pipeline_stage_0__pipeline_i_cmd_reg_reg_1__2__0_ ( 
        .D(i_cmd[20]), .CP(clk), .Q(
        cmd_pipeline_stage_0__pipeline_i_cmd_reg[18]) );
  DFQD1BWP30P140LVT cmd_pipeline_stage_0__pipeline_i_cmd_reg_reg_1__3__1_ ( 
        .D(i_cmd[23]), .CP(clk), .Q(
        cmd_pipeline_stage_0__pipeline_i_cmd_reg[17]) );
  DFQD1BWP30P140LVT cmd_pipeline_stage_0__pipeline_i_cmd_reg_reg_1__3__0_ ( 
        .D(i_cmd[22]), .CP(clk), .Q(
        cmd_pipeline_stage_0__pipeline_i_cmd_reg[16]) );
  DFQD1BWP30P140LVT cmd_pipeline_stage_0__pipeline_i_cmd_reg_reg_2__0__1_ ( 
        .D(i_cmd[25]), .CP(clk), .Q(
        cmd_pipeline_stage_0__pipeline_i_cmd_reg[15]) );
  DFQD1BWP30P140LVT cmd_pipeline_stage_0__pipeline_i_cmd_reg_reg_2__0__0_ ( 
        .D(i_cmd[24]), .CP(clk), .Q(
        cmd_pipeline_stage_0__pipeline_i_cmd_reg[14]) );
  DFQD1BWP30P140LVT cmd_pipeline_stage_0__pipeline_i_cmd_reg_reg_2__1__1_ ( 
        .D(i_cmd[27]), .CP(clk), .Q(
        cmd_pipeline_stage_0__pipeline_i_cmd_reg[13]) );
  DFQD1BWP30P140LVT cmd_pipeline_stage_0__pipeline_i_cmd_reg_reg_2__1__0_ ( 
        .D(i_cmd[26]), .CP(clk), .Q(
        cmd_pipeline_stage_0__pipeline_i_cmd_reg[12]) );
  DFQD1BWP30P140LVT cmd_pipeline_stage_0__pipeline_i_cmd_reg_reg_2__2__1_ ( 
        .D(i_cmd[29]), .CP(clk), .Q(
        cmd_pipeline_stage_0__pipeline_i_cmd_reg[11]) );
  DFQD1BWP30P140LVT cmd_pipeline_stage_0__pipeline_i_cmd_reg_reg_2__2__0_ ( 
        .D(i_cmd[28]), .CP(clk), .Q(
        cmd_pipeline_stage_0__pipeline_i_cmd_reg[10]) );
  DFQD1BWP30P140LVT cmd_pipeline_stage_0__pipeline_i_cmd_reg_reg_2__3__1_ ( 
        .D(i_cmd[31]), .CP(clk), .Q(
        cmd_pipeline_stage_0__pipeline_i_cmd_reg[9]) );
  DFQD1BWP30P140LVT cmd_pipeline_stage_0__pipeline_i_cmd_reg_reg_2__3__0_ ( 
        .D(i_cmd[30]), .CP(clk), .Q(
        cmd_pipeline_stage_0__pipeline_i_cmd_reg[8]) );
  DFQD1BWP30P140LVT cmd_pipeline_stage_0__pipeline_i_cmd_reg_reg_3__0__1_ ( 
        .D(i_cmd[33]), .CP(clk), .Q(
        cmd_pipeline_stage_0__pipeline_i_cmd_reg[7]) );
  DFQD1BWP30P140LVT cmd_pipeline_stage_0__pipeline_i_cmd_reg_reg_3__0__0_ ( 
        .D(i_cmd[32]), .CP(clk), .Q(
        cmd_pipeline_stage_0__pipeline_i_cmd_reg[6]) );
  DFQD1BWP30P140LVT cmd_pipeline_stage_0__pipeline_i_cmd_reg_reg_3__1__1_ ( 
        .D(i_cmd[35]), .CP(clk), .Q(
        cmd_pipeline_stage_0__pipeline_i_cmd_reg[5]) );
  DFQD1BWP30P140LVT cmd_pipeline_stage_0__pipeline_i_cmd_reg_reg_3__1__0_ ( 
        .D(i_cmd[34]), .CP(clk), .Q(
        cmd_pipeline_stage_0__pipeline_i_cmd_reg[4]) );
  DFQD1BWP30P140LVT cmd_pipeline_stage_0__pipeline_i_cmd_reg_reg_3__2__1_ ( 
        .D(i_cmd[37]), .CP(clk), .Q(
        cmd_pipeline_stage_0__pipeline_i_cmd_reg[3]) );
  DFQD1BWP30P140LVT cmd_pipeline_stage_0__pipeline_i_cmd_reg_reg_3__2__0_ ( 
        .D(i_cmd[36]), .CP(clk), .Q(
        cmd_pipeline_stage_0__pipeline_i_cmd_reg[2]) );
  DFQD1BWP30P140LVT cmd_pipeline_stage_0__pipeline_i_cmd_reg_reg_3__3__1_ ( 
        .D(i_cmd[39]), .CP(clk), .Q(
        cmd_pipeline_stage_0__pipeline_i_cmd_reg[1]) );
  DFQD1BWP30P140LVT cmd_pipeline_stage_0__pipeline_i_cmd_reg_reg_3__3__0_ ( 
        .D(i_cmd[38]), .CP(clk), .Q(
        cmd_pipeline_stage_0__pipeline_i_cmd_reg[0]) );
  DFQD1BWP30P140LVT cmd_pipeline_stage_1__pipeline_i_cmd_reg_reg_0__0__1_ ( 
        .D(cmd_pipeline_stage_0__pipeline_i_cmd_reg[23]), .CP(clk), .Q(
        cmd_pipeline_stage_1__pipeline_i_cmd_reg[23]) );
  DFQD1BWP30P140LVT cmd_pipeline_stage_1__pipeline_i_cmd_reg_reg_0__0__0_ ( 
        .D(cmd_pipeline_stage_0__pipeline_i_cmd_reg[22]), .CP(clk), .Q(
        cmd_pipeline_stage_1__pipeline_i_cmd_reg[22]) );
  DFQD1BWP30P140LVT cmd_pipeline_stage_1__pipeline_i_cmd_reg_reg_0__1__1_ ( 
        .D(cmd_pipeline_stage_0__pipeline_i_cmd_reg[21]), .CP(clk), .Q(
        cmd_pipeline_stage_1__pipeline_i_cmd_reg[21]) );
  DFQD1BWP30P140LVT cmd_pipeline_stage_1__pipeline_i_cmd_reg_reg_0__1__0_ ( 
        .D(cmd_pipeline_stage_0__pipeline_i_cmd_reg[20]), .CP(clk), .Q(
        cmd_pipeline_stage_1__pipeline_i_cmd_reg[20]) );
  DFQD1BWP30P140LVT cmd_pipeline_stage_1__pipeline_i_cmd_reg_reg_0__2__1_ ( 
        .D(cmd_pipeline_stage_0__pipeline_i_cmd_reg[19]), .CP(clk), .Q(
        cmd_pipeline_stage_1__pipeline_i_cmd_reg[19]) );
  DFQD1BWP30P140LVT cmd_pipeline_stage_1__pipeline_i_cmd_reg_reg_0__2__0_ ( 
        .D(cmd_pipeline_stage_0__pipeline_i_cmd_reg[18]), .CP(clk), .Q(
        cmd_pipeline_stage_1__pipeline_i_cmd_reg[18]) );
  DFQD1BWP30P140LVT cmd_pipeline_stage_1__pipeline_i_cmd_reg_reg_0__3__1_ ( 
        .D(cmd_pipeline_stage_0__pipeline_i_cmd_reg[17]), .CP(clk), .Q(
        cmd_pipeline_stage_1__pipeline_i_cmd_reg[17]) );
  DFQD1BWP30P140LVT cmd_pipeline_stage_1__pipeline_i_cmd_reg_reg_0__3__0_ ( 
        .D(cmd_pipeline_stage_0__pipeline_i_cmd_reg[16]), .CP(clk), .Q(
        cmd_pipeline_stage_1__pipeline_i_cmd_reg[16]) );
  DFQD1BWP30P140LVT cmd_pipeline_stage_1__pipeline_i_cmd_reg_reg_1__0__1_ ( 
        .D(cmd_pipeline_stage_0__pipeline_i_cmd_reg[15]), .CP(clk), .Q(
        cmd_pipeline_stage_1__pipeline_i_cmd_reg[15]) );
  DFQD1BWP30P140LVT cmd_pipeline_stage_1__pipeline_i_cmd_reg_reg_1__0__0_ ( 
        .D(cmd_pipeline_stage_0__pipeline_i_cmd_reg[14]), .CP(clk), .Q(
        cmd_pipeline_stage_1__pipeline_i_cmd_reg[14]) );
  DFQD1BWP30P140LVT cmd_pipeline_stage_1__pipeline_i_cmd_reg_reg_1__1__1_ ( 
        .D(cmd_pipeline_stage_0__pipeline_i_cmd_reg[13]), .CP(clk), .Q(
        cmd_pipeline_stage_1__pipeline_i_cmd_reg[13]) );
  DFQD1BWP30P140LVT cmd_pipeline_stage_1__pipeline_i_cmd_reg_reg_1__1__0_ ( 
        .D(cmd_pipeline_stage_0__pipeline_i_cmd_reg[12]), .CP(clk), .Q(
        cmd_pipeline_stage_1__pipeline_i_cmd_reg[12]) );
  DFQD1BWP30P140LVT cmd_pipeline_stage_1__pipeline_i_cmd_reg_reg_1__2__1_ ( 
        .D(cmd_pipeline_stage_0__pipeline_i_cmd_reg[11]), .CP(clk), .Q(
        cmd_pipeline_stage_1__pipeline_i_cmd_reg[11]) );
  DFQD1BWP30P140LVT cmd_pipeline_stage_1__pipeline_i_cmd_reg_reg_1__2__0_ ( 
        .D(cmd_pipeline_stage_0__pipeline_i_cmd_reg[10]), .CP(clk), .Q(
        cmd_pipeline_stage_1__pipeline_i_cmd_reg[10]) );
  DFQD1BWP30P140LVT cmd_pipeline_stage_1__pipeline_i_cmd_reg_reg_1__3__1_ ( 
        .D(cmd_pipeline_stage_0__pipeline_i_cmd_reg[9]), .CP(clk), .Q(
        cmd_pipeline_stage_1__pipeline_i_cmd_reg[9]) );
  DFQD1BWP30P140LVT cmd_pipeline_stage_1__pipeline_i_cmd_reg_reg_1__3__0_ ( 
        .D(cmd_pipeline_stage_0__pipeline_i_cmd_reg[8]), .CP(clk), .Q(
        cmd_pipeline_stage_1__pipeline_i_cmd_reg[8]) );
  DFQD1BWP30P140LVT cmd_pipeline_stage_1__pipeline_i_cmd_reg_reg_2__0__1_ ( 
        .D(cmd_pipeline_stage_0__pipeline_i_cmd_reg[7]), .CP(clk), .Q(
        cmd_pipeline_stage_1__pipeline_i_cmd_reg[7]) );
  DFQD1BWP30P140LVT cmd_pipeline_stage_1__pipeline_i_cmd_reg_reg_2__0__0_ ( 
        .D(cmd_pipeline_stage_0__pipeline_i_cmd_reg[6]), .CP(clk), .Q(
        cmd_pipeline_stage_1__pipeline_i_cmd_reg[6]) );
  DFQD1BWP30P140LVT cmd_pipeline_stage_1__pipeline_i_cmd_reg_reg_2__1__1_ ( 
        .D(cmd_pipeline_stage_0__pipeline_i_cmd_reg[5]), .CP(clk), .Q(
        cmd_pipeline_stage_1__pipeline_i_cmd_reg[5]) );
  DFQD1BWP30P140LVT cmd_pipeline_stage_1__pipeline_i_cmd_reg_reg_2__1__0_ ( 
        .D(cmd_pipeline_stage_0__pipeline_i_cmd_reg[4]), .CP(clk), .Q(
        cmd_pipeline_stage_1__pipeline_i_cmd_reg[4]) );
  DFQD1BWP30P140LVT cmd_pipeline_stage_1__pipeline_i_cmd_reg_reg_2__2__1_ ( 
        .D(cmd_pipeline_stage_0__pipeline_i_cmd_reg[3]), .CP(clk), .Q(
        cmd_pipeline_stage_1__pipeline_i_cmd_reg[3]) );
  DFQD1BWP30P140LVT cmd_pipeline_stage_1__pipeline_i_cmd_reg_reg_2__2__0_ ( 
        .D(cmd_pipeline_stage_0__pipeline_i_cmd_reg[2]), .CP(clk), .Q(
        cmd_pipeline_stage_1__pipeline_i_cmd_reg[2]) );
  DFQD1BWP30P140LVT cmd_pipeline_stage_1__pipeline_i_cmd_reg_reg_2__3__1_ ( 
        .D(cmd_pipeline_stage_0__pipeline_i_cmd_reg[1]), .CP(clk), .Q(
        cmd_pipeline_stage_1__pipeline_i_cmd_reg[1]) );
  DFQD1BWP30P140LVT cmd_pipeline_stage_1__pipeline_i_cmd_reg_reg_2__3__0_ ( 
        .D(cmd_pipeline_stage_0__pipeline_i_cmd_reg[0]), .CP(clk), .Q(
        cmd_pipeline_stage_1__pipeline_i_cmd_reg[0]) );
  DFQD1BWP30P140LVT cmd_pipeline_stage_2__pipeline_i_cmd_reg_reg_0__0__1_ ( 
        .D(cmd_pipeline_stage_1__pipeline_i_cmd_reg[15]), .CP(clk), .Q(
        cmd_pipeline_stage_2__pipeline_i_cmd_reg[15]) );
  DFQD1BWP30P140LVT cmd_pipeline_stage_2__pipeline_i_cmd_reg_reg_0__0__0_ ( 
        .D(cmd_pipeline_stage_1__pipeline_i_cmd_reg[14]), .CP(clk), .Q(
        cmd_pipeline_stage_2__pipeline_i_cmd_reg[14]) );
  DFQD1BWP30P140LVT cmd_pipeline_stage_2__pipeline_i_cmd_reg_reg_0__1__1_ ( 
        .D(cmd_pipeline_stage_1__pipeline_i_cmd_reg[13]), .CP(clk), .Q(
        cmd_pipeline_stage_2__pipeline_i_cmd_reg[13]) );
  DFQD1BWP30P140LVT cmd_pipeline_stage_2__pipeline_i_cmd_reg_reg_0__1__0_ ( 
        .D(cmd_pipeline_stage_1__pipeline_i_cmd_reg[12]), .CP(clk), .Q(
        cmd_pipeline_stage_2__pipeline_i_cmd_reg[12]) );
  DFQD1BWP30P140LVT cmd_pipeline_stage_2__pipeline_i_cmd_reg_reg_0__2__1_ ( 
        .D(cmd_pipeline_stage_1__pipeline_i_cmd_reg[11]), .CP(clk), .Q(
        cmd_pipeline_stage_2__pipeline_i_cmd_reg[11]) );
  DFQD1BWP30P140LVT cmd_pipeline_stage_2__pipeline_i_cmd_reg_reg_0__2__0_ ( 
        .D(cmd_pipeline_stage_1__pipeline_i_cmd_reg[10]), .CP(clk), .Q(
        cmd_pipeline_stage_2__pipeline_i_cmd_reg[10]) );
  DFQD1BWP30P140LVT cmd_pipeline_stage_2__pipeline_i_cmd_reg_reg_0__3__1_ ( 
        .D(cmd_pipeline_stage_1__pipeline_i_cmd_reg[9]), .CP(clk), .Q(
        cmd_pipeline_stage_2__pipeline_i_cmd_reg[9]) );
  DFQD1BWP30P140LVT cmd_pipeline_stage_2__pipeline_i_cmd_reg_reg_0__3__0_ ( 
        .D(cmd_pipeline_stage_1__pipeline_i_cmd_reg[8]), .CP(clk), .Q(
        cmd_pipeline_stage_2__pipeline_i_cmd_reg[8]) );
  DFQD1BWP30P140LVT cmd_pipeline_stage_2__pipeline_i_cmd_reg_reg_1__0__1_ ( 
        .D(cmd_pipeline_stage_1__pipeline_i_cmd_reg[7]), .CP(clk), .Q(
        cmd_pipeline_stage_2__pipeline_i_cmd_reg[7]) );
  DFQD1BWP30P140LVT cmd_pipeline_stage_2__pipeline_i_cmd_reg_reg_1__0__0_ ( 
        .D(cmd_pipeline_stage_1__pipeline_i_cmd_reg[6]), .CP(clk), .Q(
        cmd_pipeline_stage_2__pipeline_i_cmd_reg[6]) );
  DFQD1BWP30P140LVT cmd_pipeline_stage_2__pipeline_i_cmd_reg_reg_1__1__1_ ( 
        .D(cmd_pipeline_stage_1__pipeline_i_cmd_reg[5]), .CP(clk), .Q(
        cmd_pipeline_stage_2__pipeline_i_cmd_reg[5]) );
  DFQD1BWP30P140LVT cmd_pipeline_stage_2__pipeline_i_cmd_reg_reg_1__1__0_ ( 
        .D(cmd_pipeline_stage_1__pipeline_i_cmd_reg[4]), .CP(clk), .Q(
        cmd_pipeline_stage_2__pipeline_i_cmd_reg[4]) );
  DFQD1BWP30P140LVT cmd_pipeline_stage_2__pipeline_i_cmd_reg_reg_1__2__1_ ( 
        .D(cmd_pipeline_stage_1__pipeline_i_cmd_reg[3]), .CP(clk), .Q(
        cmd_pipeline_stage_2__pipeline_i_cmd_reg[3]) );
  DFQD1BWP30P140LVT cmd_pipeline_stage_2__pipeline_i_cmd_reg_reg_1__2__0_ ( 
        .D(cmd_pipeline_stage_1__pipeline_i_cmd_reg[2]), .CP(clk), .Q(
        cmd_pipeline_stage_2__pipeline_i_cmd_reg[2]) );
  DFQD1BWP30P140LVT cmd_pipeline_stage_2__pipeline_i_cmd_reg_reg_1__3__1_ ( 
        .D(cmd_pipeline_stage_1__pipeline_i_cmd_reg[1]), .CP(clk), .Q(
        cmd_pipeline_stage_2__pipeline_i_cmd_reg[1]) );
  DFQD1BWP30P140LVT cmd_pipeline_stage_2__pipeline_i_cmd_reg_reg_1__3__0_ ( 
        .D(cmd_pipeline_stage_1__pipeline_i_cmd_reg[0]), .CP(clk), .Q(
        cmd_pipeline_stage_2__pipeline_i_cmd_reg[0]) );
  DFQD1BWP30P140LVT cmd_pipeline_stage_3__pipeline_i_cmd_reg_reg_0__0__1_ ( 
        .D(cmd_pipeline_stage_2__pipeline_i_cmd_reg[7]), .CP(clk), .Q(
        cmd_pipeline_stage_3__pipeline_i_cmd_reg[7]) );
  DFQD1BWP30P140LVT cmd_pipeline_stage_3__pipeline_i_cmd_reg_reg_0__0__0_ ( 
        .D(cmd_pipeline_stage_2__pipeline_i_cmd_reg[6]), .CP(clk), .Q(
        cmd_pipeline_stage_3__pipeline_i_cmd_reg[6]) );
  DFQD1BWP30P140LVT cmd_pipeline_stage_3__pipeline_i_cmd_reg_reg_0__1__1_ ( 
        .D(cmd_pipeline_stage_2__pipeline_i_cmd_reg[5]), .CP(clk), .Q(
        cmd_pipeline_stage_3__pipeline_i_cmd_reg[5]) );
  DFQD1BWP30P140LVT cmd_pipeline_stage_3__pipeline_i_cmd_reg_reg_0__1__0_ ( 
        .D(cmd_pipeline_stage_2__pipeline_i_cmd_reg[4]), .CP(clk), .Q(
        cmd_pipeline_stage_3__pipeline_i_cmd_reg[4]) );
  DFQD1BWP30P140LVT cmd_pipeline_stage_3__pipeline_i_cmd_reg_reg_0__2__1_ ( 
        .D(cmd_pipeline_stage_2__pipeline_i_cmd_reg[3]), .CP(clk), .Q(
        cmd_pipeline_stage_3__pipeline_i_cmd_reg[3]) );
  DFQD1BWP30P140LVT cmd_pipeline_stage_3__pipeline_i_cmd_reg_reg_0__2__0_ ( 
        .D(cmd_pipeline_stage_2__pipeline_i_cmd_reg[2]), .CP(clk), .Q(
        cmd_pipeline_stage_3__pipeline_i_cmd_reg[2]) );
  DFQD1BWP30P140LVT cmd_pipeline_stage_3__pipeline_i_cmd_reg_reg_0__3__1_ ( 
        .D(cmd_pipeline_stage_2__pipeline_i_cmd_reg[1]), .CP(clk), .Q(
        cmd_pipeline_stage_3__pipeline_i_cmd_reg[1]) );
  DFQD1BWP30P140LVT cmd_pipeline_stage_3__pipeline_i_cmd_reg_reg_0__3__0_ ( 
        .D(cmd_pipeline_stage_2__pipeline_i_cmd_reg[0]), .CP(clk), .Q(
        cmd_pipeline_stage_3__pipeline_i_cmd_reg[0]) );
  BUFFD6BWP30P140LVT U5 ( .I(n530), .Z(o_data_bus[0]) );
  BUFFD6BWP30P140LVT U6 ( .I(n529), .Z(o_data_bus[1]) );
  BUFFD6BWP30P140LVT U7 ( .I(n528), .Z(o_data_bus[2]) );
  BUFFD6BWP30P140LVT U8 ( .I(n527), .Z(o_data_bus[3]) );
  BUFFD6BWP30P140LVT U9 ( .I(n526), .Z(o_data_bus[4]) );
  BUFFD6BWP30P140LVT U10 ( .I(n525), .Z(o_data_bus[5]) );
  BUFFD6BWP30P140LVT U11 ( .I(n524), .Z(o_data_bus[6]) );
  BUFFD6BWP30P140LVT U12 ( .I(n523), .Z(o_data_bus[7]) );
  BUFFD6BWP30P140LVT U13 ( .I(n522), .Z(o_data_bus[8]) );
  BUFFD6BWP30P140LVT U14 ( .I(n521), .Z(o_data_bus[9]) );
  BUFFD6BWP30P140LVT U15 ( .I(n520), .Z(o_data_bus[10]) );
  BUFFD6BWP30P140LVT U16 ( .I(n519), .Z(o_data_bus[11]) );
  BUFFD6BWP30P140LVT U17 ( .I(n518), .Z(o_data_bus[12]) );
  BUFFD6BWP30P140LVT U18 ( .I(n517), .Z(o_data_bus[13]) );
  BUFFD6BWP30P140LVT U19 ( .I(n516), .Z(o_data_bus[14]) );
  BUFFD6BWP30P140LVT U20 ( .I(n515), .Z(o_data_bus[15]) );
  BUFFD6BWP30P140LVT U21 ( .I(n514), .Z(o_data_bus[16]) );
  BUFFD6BWP30P140LVT U22 ( .I(n513), .Z(o_data_bus[17]) );
  BUFFD6BWP30P140LVT U23 ( .I(n512), .Z(o_data_bus[18]) );
  BUFFD6BWP30P140LVT U24 ( .I(n511), .Z(o_data_bus[19]) );
  BUFFD6BWP30P140LVT U25 ( .I(n510), .Z(o_data_bus[20]) );
  BUFFD6BWP30P140LVT U26 ( .I(n509), .Z(o_data_bus[21]) );
  BUFFD6BWP30P140LVT U27 ( .I(n508), .Z(o_data_bus[22]) );
  BUFFD6BWP30P140LVT U28 ( .I(n507), .Z(o_data_bus[23]) );
  BUFFD6BWP30P140LVT U29 ( .I(n506), .Z(o_data_bus[24]) );
  BUFFD6BWP30P140LVT U30 ( .I(n505), .Z(o_data_bus[25]) );
  BUFFD6BWP30P140LVT U31 ( .I(n504), .Z(o_data_bus[26]) );
  BUFFD6BWP30P140LVT U32 ( .I(n503), .Z(o_data_bus[27]) );
  BUFFD6BWP30P140LVT U33 ( .I(n502), .Z(o_data_bus[28]) );
  BUFFD6BWP30P140LVT U34 ( .I(n501), .Z(o_data_bus[29]) );
  BUFFD6BWP30P140LVT U35 ( .I(n500), .Z(o_data_bus[30]) );
  BUFFD6BWP30P140LVT U36 ( .I(n499), .Z(o_data_bus[31]) );
  BUFFD6BWP30P140LVT U37 ( .I(n498), .Z(o_data_bus[32]) );
  BUFFD6BWP30P140LVT U38 ( .I(n497), .Z(o_data_bus[33]) );
  BUFFD6BWP30P140LVT U39 ( .I(n496), .Z(o_data_bus[34]) );
  BUFFD6BWP30P140LVT U40 ( .I(n495), .Z(o_data_bus[35]) );
  BUFFD6BWP30P140LVT U41 ( .I(n494), .Z(o_data_bus[36]) );
  BUFFD6BWP30P140LVT U42 ( .I(n493), .Z(o_data_bus[37]) );
  BUFFD6BWP30P140LVT U43 ( .I(n492), .Z(o_data_bus[38]) );
  BUFFD6BWP30P140LVT U44 ( .I(n491), .Z(o_data_bus[39]) );
  BUFFD6BWP30P140LVT U45 ( .I(n490), .Z(o_data_bus[40]) );
  BUFFD6BWP30P140LVT U46 ( .I(n489), .Z(o_data_bus[41]) );
  BUFFD6BWP30P140LVT U47 ( .I(n488), .Z(o_data_bus[42]) );
  BUFFD6BWP30P140LVT U48 ( .I(n487), .Z(o_data_bus[43]) );
  BUFFD6BWP30P140LVT U49 ( .I(n486), .Z(o_data_bus[44]) );
  BUFFD6BWP30P140LVT U50 ( .I(n485), .Z(o_data_bus[45]) );
  BUFFD6BWP30P140LVT U51 ( .I(n484), .Z(o_data_bus[46]) );
  BUFFD6BWP30P140LVT U52 ( .I(n483), .Z(o_data_bus[47]) );
  BUFFD6BWP30P140LVT U53 ( .I(n482), .Z(o_data_bus[48]) );
  BUFFD6BWP30P140LVT U54 ( .I(n481), .Z(o_data_bus[49]) );
  BUFFD6BWP30P140LVT U55 ( .I(n480), .Z(o_data_bus[50]) );
  BUFFD6BWP30P140LVT U56 ( .I(n479), .Z(o_data_bus[51]) );
  BUFFD6BWP30P140LVT U57 ( .I(n478), .Z(o_data_bus[52]) );
  BUFFD6BWP30P140LVT U58 ( .I(n477), .Z(o_data_bus[53]) );
  BUFFD6BWP30P140LVT U59 ( .I(n476), .Z(o_data_bus[54]) );
  BUFFD6BWP30P140LVT U60 ( .I(n475), .Z(o_data_bus[55]) );
  BUFFD6BWP30P140LVT U61 ( .I(n474), .Z(o_data_bus[56]) );
  BUFFD6BWP30P140LVT U62 ( .I(n473), .Z(o_data_bus[57]) );
  BUFFD6BWP30P140LVT U63 ( .I(n472), .Z(o_data_bus[58]) );
  BUFFD6BWP30P140LVT U64 ( .I(n471), .Z(o_data_bus[59]) );
  BUFFD6BWP30P140LVT U65 ( .I(n470), .Z(o_data_bus[60]) );
  BUFFD6BWP30P140LVT U66 ( .I(n469), .Z(o_data_bus[61]) );
  BUFFD6BWP30P140LVT U67 ( .I(n468), .Z(o_data_bus[62]) );
  BUFFD6BWP30P140LVT U68 ( .I(n467), .Z(o_data_bus[63]) );
  BUFFD6BWP30P140LVT U69 ( .I(n466), .Z(o_data_bus[64]) );
  BUFFD6BWP30P140LVT U70 ( .I(n465), .Z(o_data_bus[65]) );
  BUFFD6BWP30P140LVT U71 ( .I(n464), .Z(o_data_bus[66]) );
  BUFFD6BWP30P140LVT U72 ( .I(n463), .Z(o_data_bus[67]) );
  BUFFD6BWP30P140LVT U73 ( .I(n462), .Z(o_data_bus[68]) );
  BUFFD6BWP30P140LVT U74 ( .I(n461), .Z(o_data_bus[69]) );
  BUFFD6BWP30P140LVT U75 ( .I(n460), .Z(o_data_bus[70]) );
  BUFFD6BWP30P140LVT U76 ( .I(n459), .Z(o_data_bus[71]) );
  BUFFD6BWP30P140LVT U77 ( .I(n458), .Z(o_data_bus[72]) );
  BUFFD6BWP30P140LVT U78 ( .I(n457), .Z(o_data_bus[73]) );
  BUFFD6BWP30P140LVT U79 ( .I(n456), .Z(o_data_bus[74]) );
  BUFFD6BWP30P140LVT U80 ( .I(n455), .Z(o_data_bus[75]) );
  BUFFD6BWP30P140LVT U81 ( .I(n454), .Z(o_data_bus[76]) );
  BUFFD6BWP30P140LVT U82 ( .I(n453), .Z(o_data_bus[77]) );
  BUFFD6BWP30P140LVT U83 ( .I(n452), .Z(o_data_bus[78]) );
  BUFFD6BWP30P140LVT U84 ( .I(n451), .Z(o_data_bus[79]) );
  BUFFD6BWP30P140LVT U85 ( .I(n450), .Z(o_data_bus[80]) );
  BUFFD6BWP30P140LVT U86 ( .I(n449), .Z(o_data_bus[81]) );
  BUFFD6BWP30P140LVT U87 ( .I(n448), .Z(o_data_bus[82]) );
  BUFFD6BWP30P140LVT U88 ( .I(n447), .Z(o_data_bus[83]) );
  BUFFD6BWP30P140LVT U89 ( .I(n446), .Z(o_data_bus[84]) );
  BUFFD6BWP30P140LVT U90 ( .I(n445), .Z(o_data_bus[85]) );
  BUFFD6BWP30P140LVT U91 ( .I(n444), .Z(o_data_bus[86]) );
  BUFFD6BWP30P140LVT U92 ( .I(n443), .Z(o_data_bus[87]) );
  BUFFD6BWP30P140LVT U93 ( .I(n442), .Z(o_data_bus[88]) );
  BUFFD6BWP30P140LVT U94 ( .I(n441), .Z(o_data_bus[89]) );
  BUFFD6BWP30P140LVT U95 ( .I(n440), .Z(o_data_bus[90]) );
  BUFFD6BWP30P140LVT U96 ( .I(n439), .Z(o_data_bus[91]) );
  BUFFD6BWP30P140LVT U97 ( .I(n438), .Z(o_data_bus[92]) );
  BUFFD6BWP30P140LVT U98 ( .I(n437), .Z(o_data_bus[93]) );
  BUFFD6BWP30P140LVT U99 ( .I(n436), .Z(o_data_bus[94]) );
  BUFFD6BWP30P140LVT U100 ( .I(n435), .Z(o_data_bus[95]) );
  BUFFD6BWP30P140LVT U101 ( .I(n434), .Z(o_data_bus[96]) );
  BUFFD6BWP30P140LVT U102 ( .I(n433), .Z(o_data_bus[97]) );
  BUFFD6BWP30P140LVT U103 ( .I(n432), .Z(o_data_bus[98]) );
  BUFFD6BWP30P140LVT U104 ( .I(n431), .Z(o_data_bus[99]) );
  BUFFD6BWP30P140LVT U105 ( .I(n430), .Z(o_data_bus[100]) );
  BUFFD6BWP30P140LVT U106 ( .I(n429), .Z(o_data_bus[101]) );
  BUFFD6BWP30P140LVT U107 ( .I(n428), .Z(o_data_bus[102]) );
  BUFFD6BWP30P140LVT U108 ( .I(n427), .Z(o_data_bus[103]) );
  BUFFD6BWP30P140LVT U109 ( .I(n426), .Z(o_data_bus[104]) );
  BUFFD6BWP30P140LVT U110 ( .I(n425), .Z(o_data_bus[105]) );
  BUFFD6BWP30P140LVT U111 ( .I(n424), .Z(o_data_bus[106]) );
  BUFFD6BWP30P140LVT U112 ( .I(n423), .Z(o_data_bus[107]) );
  BUFFD6BWP30P140LVT U113 ( .I(n422), .Z(o_data_bus[108]) );
  BUFFD6BWP30P140LVT U114 ( .I(n421), .Z(o_data_bus[109]) );
  BUFFD6BWP30P140LVT U115 ( .I(n420), .Z(o_data_bus[110]) );
  BUFFD6BWP30P140LVT U116 ( .I(n419), .Z(o_data_bus[111]) );
  BUFFD6BWP30P140LVT U117 ( .I(n418), .Z(o_data_bus[112]) );
  BUFFD6BWP30P140LVT U118 ( .I(n417), .Z(o_data_bus[113]) );
  BUFFD6BWP30P140LVT U119 ( .I(n416), .Z(o_data_bus[114]) );
  BUFFD6BWP30P140LVT U120 ( .I(n415), .Z(o_data_bus[115]) );
  BUFFD6BWP30P140LVT U121 ( .I(n414), .Z(o_data_bus[116]) );
  BUFFD6BWP30P140LVT U122 ( .I(n413), .Z(o_data_bus[117]) );
  BUFFD6BWP30P140LVT U123 ( .I(n412), .Z(o_data_bus[118]) );
  BUFFD6BWP30P140LVT U124 ( .I(n411), .Z(o_data_bus[119]) );
  BUFFD6BWP30P140LVT U125 ( .I(n410), .Z(o_data_bus[120]) );
  BUFFD6BWP30P140LVT U126 ( .I(n409), .Z(o_data_bus[121]) );
  BUFFD6BWP30P140LVT U127 ( .I(n408), .Z(o_data_bus[122]) );
  BUFFD6BWP30P140LVT U128 ( .I(n407), .Z(o_data_bus[123]) );
  BUFFD6BWP30P140LVT U129 ( .I(n406), .Z(o_data_bus[124]) );
  BUFFD6BWP30P140LVT U130 ( .I(n405), .Z(o_data_bus[125]) );
  BUFFD6BWP30P140LVT U131 ( .I(n404), .Z(o_data_bus[126]) );
  BUFFD6BWP30P140LVT U132 ( .I(n403), .Z(o_data_bus[127]) );
  BUFFD6BWP30P140LVT U133 ( .I(n402), .Z(o_data_bus[128]) );
  BUFFD6BWP30P140LVT U134 ( .I(n401), .Z(o_data_bus[129]) );
  BUFFD6BWP30P140LVT U135 ( .I(n400), .Z(o_data_bus[130]) );
  BUFFD6BWP30P140LVT U136 ( .I(n399), .Z(o_data_bus[131]) );
  BUFFD6BWP30P140LVT U137 ( .I(n398), .Z(o_data_bus[132]) );
  BUFFD6BWP30P140LVT U138 ( .I(n397), .Z(o_data_bus[133]) );
  BUFFD6BWP30P140LVT U139 ( .I(n396), .Z(o_data_bus[134]) );
  BUFFD6BWP30P140LVT U140 ( .I(n395), .Z(o_data_bus[135]) );
  BUFFD6BWP30P140LVT U141 ( .I(n394), .Z(o_data_bus[136]) );
  BUFFD6BWP30P140LVT U142 ( .I(n393), .Z(o_data_bus[137]) );
  BUFFD6BWP30P140LVT U143 ( .I(n392), .Z(o_data_bus[138]) );
  BUFFD6BWP30P140LVT U144 ( .I(n391), .Z(o_data_bus[139]) );
  BUFFD6BWP30P140LVT U145 ( .I(n390), .Z(o_data_bus[140]) );
  BUFFD6BWP30P140LVT U146 ( .I(n389), .Z(o_data_bus[141]) );
  BUFFD6BWP30P140LVT U147 ( .I(n388), .Z(o_data_bus[142]) );
  BUFFD6BWP30P140LVT U148 ( .I(n387), .Z(o_data_bus[143]) );
  BUFFD6BWP30P140LVT U149 ( .I(n386), .Z(o_data_bus[144]) );
  BUFFD6BWP30P140LVT U150 ( .I(n385), .Z(o_data_bus[145]) );
  BUFFD6BWP30P140LVT U151 ( .I(n384), .Z(o_data_bus[146]) );
  BUFFD6BWP30P140LVT U152 ( .I(n383), .Z(o_data_bus[147]) );
  BUFFD6BWP30P140LVT U153 ( .I(n382), .Z(o_data_bus[148]) );
  BUFFD6BWP30P140LVT U154 ( .I(n381), .Z(o_data_bus[149]) );
  BUFFD6BWP30P140LVT U155 ( .I(n380), .Z(o_data_bus[150]) );
  BUFFD6BWP30P140LVT U156 ( .I(n379), .Z(o_data_bus[151]) );
  BUFFD6BWP30P140LVT U157 ( .I(n378), .Z(o_data_bus[152]) );
  BUFFD6BWP30P140LVT U158 ( .I(n377), .Z(o_data_bus[153]) );
  BUFFD6BWP30P140LVT U159 ( .I(n376), .Z(o_data_bus[154]) );
  BUFFD6BWP30P140LVT U160 ( .I(n375), .Z(o_data_bus[155]) );
  BUFFD6BWP30P140LVT U161 ( .I(n374), .Z(o_data_bus[156]) );
  BUFFD6BWP30P140LVT U162 ( .I(n373), .Z(o_data_bus[157]) );
  BUFFD6BWP30P140LVT U163 ( .I(n372), .Z(o_data_bus[158]) );
  BUFFD6BWP30P140LVT U164 ( .I(n371), .Z(o_data_bus[159]) );
  BUFFD6BWP30P140LVT U165 ( .I(n370), .Z(o_data_bus[160]) );
  BUFFD6BWP30P140LVT U166 ( .I(n369), .Z(o_data_bus[161]) );
  BUFFD6BWP30P140LVT U167 ( .I(n368), .Z(o_data_bus[162]) );
  BUFFD6BWP30P140LVT U168 ( .I(n367), .Z(o_data_bus[163]) );
  BUFFD6BWP30P140LVT U169 ( .I(n366), .Z(o_data_bus[164]) );
  BUFFD6BWP30P140LVT U170 ( .I(n365), .Z(o_data_bus[165]) );
  BUFFD6BWP30P140LVT U171 ( .I(n364), .Z(o_data_bus[166]) );
  BUFFD6BWP30P140LVT U172 ( .I(n363), .Z(o_data_bus[167]) );
  BUFFD6BWP30P140LVT U173 ( .I(n362), .Z(o_data_bus[168]) );
  BUFFD6BWP30P140LVT U174 ( .I(n361), .Z(o_data_bus[169]) );
  BUFFD6BWP30P140LVT U175 ( .I(n360), .Z(o_data_bus[170]) );
  BUFFD6BWP30P140LVT U176 ( .I(n359), .Z(o_data_bus[171]) );
  BUFFD6BWP30P140LVT U177 ( .I(n358), .Z(o_data_bus[172]) );
  BUFFD6BWP30P140LVT U178 ( .I(n357), .Z(o_data_bus[173]) );
  BUFFD6BWP30P140LVT U179 ( .I(n356), .Z(o_data_bus[174]) );
  BUFFD6BWP30P140LVT U180 ( .I(n355), .Z(o_data_bus[175]) );
  BUFFD6BWP30P140LVT U181 ( .I(n354), .Z(o_data_bus[176]) );
  BUFFD6BWP30P140LVT U182 ( .I(n353), .Z(o_data_bus[177]) );
  BUFFD6BWP30P140LVT U183 ( .I(n352), .Z(o_data_bus[178]) );
  BUFFD6BWP30P140LVT U184 ( .I(n351), .Z(o_data_bus[179]) );
  BUFFD6BWP30P140LVT U185 ( .I(n350), .Z(o_data_bus[180]) );
  BUFFD6BWP30P140LVT U186 ( .I(n349), .Z(o_data_bus[181]) );
  BUFFD6BWP30P140LVT U187 ( .I(n348), .Z(o_data_bus[182]) );
  BUFFD6BWP30P140LVT U188 ( .I(n347), .Z(o_data_bus[183]) );
  BUFFD6BWP30P140LVT U189 ( .I(n346), .Z(o_data_bus[184]) );
  BUFFD6BWP30P140LVT U190 ( .I(n345), .Z(o_data_bus[185]) );
  BUFFD6BWP30P140LVT U191 ( .I(n344), .Z(o_data_bus[186]) );
  BUFFD6BWP30P140LVT U192 ( .I(n343), .Z(o_data_bus[187]) );
  BUFFD6BWP30P140LVT U193 ( .I(n342), .Z(o_data_bus[188]) );
  BUFFD6BWP30P140LVT U194 ( .I(n341), .Z(o_data_bus[189]) );
  BUFFD6BWP30P140LVT U195 ( .I(n340), .Z(o_data_bus[190]) );
  BUFFD6BWP30P140LVT U196 ( .I(n339), .Z(o_data_bus[191]) );
  BUFFD6BWP30P140LVT U197 ( .I(n338), .Z(o_data_bus[192]) );
  BUFFD6BWP30P140LVT U198 ( .I(n337), .Z(o_data_bus[193]) );
  BUFFD6BWP30P140LVT U199 ( .I(n336), .Z(o_data_bus[194]) );
  BUFFD6BWP30P140LVT U200 ( .I(n335), .Z(o_data_bus[195]) );
  BUFFD6BWP30P140LVT U201 ( .I(n334), .Z(o_data_bus[196]) );
  BUFFD6BWP30P140LVT U202 ( .I(n333), .Z(o_data_bus[197]) );
  BUFFD6BWP30P140LVT U203 ( .I(n332), .Z(o_data_bus[198]) );
  BUFFD6BWP30P140LVT U204 ( .I(n331), .Z(o_data_bus[199]) );
  BUFFD6BWP30P140LVT U205 ( .I(n330), .Z(o_data_bus[200]) );
  BUFFD6BWP30P140LVT U206 ( .I(n329), .Z(o_data_bus[201]) );
  BUFFD6BWP30P140LVT U207 ( .I(n328), .Z(o_data_bus[202]) );
  BUFFD6BWP30P140LVT U208 ( .I(n327), .Z(o_data_bus[203]) );
  BUFFD6BWP30P140LVT U209 ( .I(n326), .Z(o_data_bus[204]) );
  BUFFD6BWP30P140LVT U210 ( .I(n325), .Z(o_data_bus[205]) );
  BUFFD6BWP30P140LVT U211 ( .I(n324), .Z(o_data_bus[206]) );
  BUFFD6BWP30P140LVT U212 ( .I(n323), .Z(o_data_bus[207]) );
  BUFFD6BWP30P140LVT U213 ( .I(n322), .Z(o_data_bus[208]) );
  BUFFD6BWP30P140LVT U214 ( .I(n321), .Z(o_data_bus[209]) );
  BUFFD6BWP30P140LVT U215 ( .I(n320), .Z(o_data_bus[210]) );
  BUFFD6BWP30P140LVT U216 ( .I(n319), .Z(o_data_bus[211]) );
  BUFFD6BWP30P140LVT U217 ( .I(n318), .Z(o_data_bus[212]) );
  BUFFD6BWP30P140LVT U218 ( .I(n317), .Z(o_data_bus[213]) );
  BUFFD6BWP30P140LVT U219 ( .I(n316), .Z(o_data_bus[214]) );
  BUFFD6BWP30P140LVT U220 ( .I(n315), .Z(o_data_bus[215]) );
  BUFFD6BWP30P140LVT U221 ( .I(n314), .Z(o_data_bus[216]) );
  BUFFD6BWP30P140LVT U222 ( .I(n313), .Z(o_data_bus[217]) );
  BUFFD6BWP30P140LVT U223 ( .I(n312), .Z(o_data_bus[218]) );
  BUFFD6BWP30P140LVT U224 ( .I(n311), .Z(o_data_bus[219]) );
  BUFFD6BWP30P140LVT U225 ( .I(n310), .Z(o_data_bus[220]) );
  BUFFD6BWP30P140LVT U226 ( .I(n309), .Z(o_data_bus[221]) );
  BUFFD6BWP30P140LVT U227 ( .I(n308), .Z(o_data_bus[222]) );
  BUFFD6BWP30P140LVT U228 ( .I(n307), .Z(o_data_bus[223]) );
  BUFFD6BWP30P140LVT U229 ( .I(n306), .Z(o_data_bus[224]) );
  BUFFD6BWP30P140LVT U230 ( .I(n305), .Z(o_data_bus[225]) );
  BUFFD6BWP30P140LVT U231 ( .I(n304), .Z(o_data_bus[226]) );
  BUFFD6BWP30P140LVT U232 ( .I(n303), .Z(o_data_bus[227]) );
  BUFFD6BWP30P140LVT U233 ( .I(n302), .Z(o_data_bus[228]) );
  BUFFD6BWP30P140LVT U234 ( .I(n301), .Z(o_data_bus[229]) );
  BUFFD6BWP30P140LVT U235 ( .I(n300), .Z(o_data_bus[230]) );
  BUFFD6BWP30P140LVT U236 ( .I(n299), .Z(o_data_bus[231]) );
  BUFFD6BWP30P140LVT U237 ( .I(n298), .Z(o_data_bus[232]) );
  BUFFD6BWP30P140LVT U238 ( .I(n297), .Z(o_data_bus[233]) );
  BUFFD6BWP30P140LVT U239 ( .I(n296), .Z(o_data_bus[234]) );
  BUFFD6BWP30P140LVT U240 ( .I(n295), .Z(o_data_bus[235]) );
  BUFFD6BWP30P140LVT U241 ( .I(n294), .Z(o_data_bus[236]) );
  BUFFD6BWP30P140LVT U242 ( .I(n293), .Z(o_data_bus[237]) );
  BUFFD6BWP30P140LVT U243 ( .I(n292), .Z(o_data_bus[238]) );
  BUFFD6BWP30P140LVT U244 ( .I(n291), .Z(o_data_bus[239]) );
  BUFFD6BWP30P140LVT U245 ( .I(n290), .Z(o_data_bus[240]) );
  BUFFD6BWP30P140LVT U246 ( .I(n289), .Z(o_data_bus[241]) );
  BUFFD6BWP30P140LVT U247 ( .I(n288), .Z(o_data_bus[242]) );
  BUFFD6BWP30P140LVT U248 ( .I(n287), .Z(o_data_bus[243]) );
  BUFFD6BWP30P140LVT U249 ( .I(n286), .Z(o_data_bus[244]) );
  BUFFD6BWP30P140LVT U250 ( .I(n285), .Z(o_data_bus[245]) );
  BUFFD6BWP30P140LVT U251 ( .I(n284), .Z(o_data_bus[246]) );
  BUFFD6BWP30P140LVT U252 ( .I(n283), .Z(o_data_bus[247]) );
  BUFFD6BWP30P140LVT U253 ( .I(n282), .Z(o_data_bus[248]) );
  BUFFD6BWP30P140LVT U254 ( .I(n281), .Z(o_data_bus[249]) );
  BUFFD6BWP30P140LVT U255 ( .I(n280), .Z(o_data_bus[250]) );
  BUFFD6BWP30P140LVT U256 ( .I(n279), .Z(o_data_bus[251]) );
  BUFFD6BWP30P140LVT U257 ( .I(n278), .Z(o_data_bus[252]) );
  BUFFD6BWP30P140LVT U258 ( .I(n277), .Z(o_data_bus[253]) );
  BUFFD6BWP30P140LVT U259 ( .I(n276), .Z(o_data_bus[254]) );
  BUFFD6BWP30P140LVT U260 ( .I(n275), .Z(o_data_bus[255]) );
  BUFFD6BWP30P140LVT U261 ( .I(n274), .Z(o_valid[0]) );
  BUFFD6BWP30P140LVT U262 ( .I(n273), .Z(o_valid[1]) );
  BUFFD6BWP30P140LVT U263 ( .I(n272), .Z(o_valid[2]) );
  BUFFD6BWP30P140LVT U264 ( .I(n271), .Z(o_valid[3]) );
  BUFFD6BWP30P140LVT U265 ( .I(n270), .Z(o_valid[4]) );
  BUFFD6BWP30P140LVT U266 ( .I(n269), .Z(o_valid[5]) );
  BUFFD6BWP30P140LVT U267 ( .I(n268), .Z(o_valid[6]) );
  BUFFD6BWP30P140LVT U268 ( .I(n267), .Z(o_valid[7]) );
endmodule

