
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
         n45, n46, n47, n48, n49, n50, n51, n52, n53, n54, n55, n56, n57, n58,
         n59, n60, n61, n62, n63, n64, n65, n66, n67, n68, n69, n70, n71, n72,
         n73, n74, n75, n76, n77, n78, n79, n80, n81, n82, n83, n84, n85, n86,
         n87, n88, n89, n90, n91, n92, n93, n94, n95, n96, n97;

  DFQD1BWP30P140 o_data_bus_inner_reg_31_ ( .D(N318), .CP(clk), .Q(
        o_data_bus[31]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_30_ ( .D(N317), .CP(clk), .Q(
        o_data_bus[30]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_29_ ( .D(N316), .CP(clk), .Q(
        o_data_bus[29]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_26_ ( .D(N313), .CP(clk), .Q(
        o_data_bus[26]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_23_ ( .D(N310), .CP(clk), .Q(
        o_data_bus[23]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_20_ ( .D(N307), .CP(clk), .Q(
        o_data_bus[20]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_19_ ( .D(N306), .CP(clk), .Q(
        o_data_bus[19]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_18_ ( .D(N305), .CP(clk), .Q(
        o_data_bus[18]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_17_ ( .D(N304), .CP(clk), .Q(
        o_data_bus[17]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_16_ ( .D(N303), .CP(clk), .Q(
        o_data_bus[16]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_13_ ( .D(N300), .CP(clk), .Q(
        o_data_bus[13]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_12_ ( .D(N299), .CP(clk), .Q(
        o_data_bus[12]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_11_ ( .D(N298), .CP(clk), .Q(
        o_data_bus[11]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_10_ ( .D(N297), .CP(clk), .Q(
        o_data_bus[10]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_9_ ( .D(N296), .CP(clk), .Q(
        o_data_bus[9]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_8_ ( .D(N295), .CP(clk), .Q(
        o_data_bus[8]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_7_ ( .D(N294), .CP(clk), .Q(
        o_data_bus[7]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_6_ ( .D(N293), .CP(clk), .Q(
        o_data_bus[6]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_5_ ( .D(N292), .CP(clk), .Q(
        o_data_bus[5]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_4_ ( .D(N291), .CP(clk), .Q(
        o_data_bus[4]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_3_ ( .D(N290), .CP(clk), .Q(
        o_data_bus[3]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_2_ ( .D(N289), .CP(clk), .Q(
        o_data_bus[2]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_1_ ( .D(N288), .CP(clk), .Q(
        o_data_bus[1]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_0_ ( .D(N287), .CP(clk), .Q(
        o_data_bus[0]) );
  DFQD1BWP30P140 o_valid_inner_reg_1_ ( .D(N354), .CP(clk), .Q(o_valid[1]) );
  DFD1BWP30P140 o_data_bus_inner_reg_57_ ( .D(N344), .CP(clk), .Q(
        o_data_bus[57]) );
  DFD1BWP30P140 o_data_bus_inner_reg_48_ ( .D(N335), .CP(clk), .Q(
        o_data_bus[48]) );
  DFD1BWP30P140 o_data_bus_inner_reg_44_ ( .D(N331), .CP(clk), .Q(
        o_data_bus[44]) );
  DFD1BWP30P140 o_data_bus_inner_reg_42_ ( .D(N329), .CP(clk), .Q(
        o_data_bus[42]) );
  DFD1BWP30P140 o_data_bus_inner_reg_40_ ( .D(N327), .CP(clk), .Q(
        o_data_bus[40]) );
  DFD1BWP30P140 o_data_bus_inner_reg_34_ ( .D(N321), .CP(clk), .Q(
        o_data_bus[34]) );
  DFD1BWP30P140 o_data_bus_inner_reg_33_ ( .D(N320), .CP(clk), .Q(
        o_data_bus[33]) );
  DFD1BWP30P140 o_data_bus_inner_reg_32_ ( .D(N319), .CP(clk), .Q(
        o_data_bus[32]) );
  DFD1BWP30P140 o_data_bus_inner_reg_39_ ( .D(N326), .CP(clk), .Q(
        o_data_bus[39]) );
  DFD1BWP30P140 o_data_bus_inner_reg_28_ ( .D(N315), .CP(clk), .Q(
        o_data_bus[28]) );
  DFD1BWP30P140 o_data_bus_inner_reg_27_ ( .D(N314), .CP(clk), .Q(
        o_data_bus[27]) );
  DFD1BWP30P140 o_data_bus_inner_reg_25_ ( .D(N312), .CP(clk), .Q(
        o_data_bus[25]) );
  DFD1BWP30P140 o_data_bus_inner_reg_24_ ( .D(N311), .CP(clk), .Q(
        o_data_bus[24]) );
  DFD1BWP30P140 o_data_bus_inner_reg_22_ ( .D(N309), .CP(clk), .Q(
        o_data_bus[22]) );
  DFD1BWP30P140 o_data_bus_inner_reg_21_ ( .D(N308), .CP(clk), .Q(
        o_data_bus[21]) );
  DFD1BWP30P140 o_data_bus_inner_reg_15_ ( .D(N302), .CP(clk), .Q(
        o_data_bus[15]) );
  DFD1BWP30P140 o_data_bus_inner_reg_14_ ( .D(N301), .CP(clk), .Q(
        o_data_bus[14]) );
  DFD1BWP30P140 o_data_bus_inner_reg_51_ ( .D(N338), .CP(clk), .Q(
        o_data_bus[51]) );
  DFD1BWP30P140 o_data_bus_inner_reg_50_ ( .D(N337), .CP(clk), .Q(
        o_data_bus[50]) );
  DFD1BWP30P140 o_data_bus_inner_reg_49_ ( .D(N336), .CP(clk), .Q(
        o_data_bus[49]) );
  DFD1BWP30P140 o_data_bus_inner_reg_38_ ( .D(N325), .CP(clk), .Q(
        o_data_bus[38]) );
  DFD1BWP30P140 o_data_bus_inner_reg_37_ ( .D(N324), .CP(clk), .Q(
        o_data_bus[37]) );
  DFD1BWP30P140 o_data_bus_inner_reg_36_ ( .D(N323), .CP(clk), .Q(
        o_data_bus[36]) );
  DFD1BWP30P140 o_data_bus_inner_reg_35_ ( .D(N322), .CP(clk), .Q(
        o_data_bus[35]) );
  DFD1BWP30P140 o_data_bus_inner_reg_54_ ( .D(N341), .CP(clk), .Q(
        o_data_bus[54]) );
  DFD1BWP30P140 o_data_bus_inner_reg_52_ ( .D(N339), .CP(clk), .Q(
        o_data_bus[52]) );
  DFD1BWP30P140 o_data_bus_inner_reg_61_ ( .D(N348), .CP(clk), .Q(
        o_data_bus[61]) );
  DFD1BWP30P140 o_data_bus_inner_reg_62_ ( .D(N349), .CP(clk), .Q(
        o_data_bus[62]) );
  DFD1BWP30P140 o_data_bus_inner_reg_63_ ( .D(N350), .CP(clk), .Q(
        o_data_bus[63]) );
  DFD1BWP30P140 o_data_bus_inner_reg_41_ ( .D(N328), .CP(clk), .Q(
        o_data_bus[41]) );
  DFD1BWP30P140 o_data_bus_inner_reg_43_ ( .D(N330), .CP(clk), .Q(
        o_data_bus[43]) );
  DFD1BWP30P140 o_data_bus_inner_reg_45_ ( .D(N332), .CP(clk), .Q(
        o_data_bus[45]) );
  DFD1BWP30P140 o_data_bus_inner_reg_46_ ( .D(N333), .CP(clk), .Q(
        o_data_bus[46]) );
  DFD1BWP30P140 o_data_bus_inner_reg_47_ ( .D(N334), .CP(clk), .Q(
        o_data_bus[47]) );
  DFD1BWP30P140 o_data_bus_inner_reg_53_ ( .D(N340), .CP(clk), .Q(
        o_data_bus[53]) );
  DFD1BWP30P140 o_data_bus_inner_reg_55_ ( .D(N342), .CP(clk), .Q(
        o_data_bus[55]) );
  DFD1BWP30P140 o_data_bus_inner_reg_56_ ( .D(N343), .CP(clk), .Q(
        o_data_bus[56]) );
  DFD1BWP30P140 o_data_bus_inner_reg_58_ ( .D(N345), .CP(clk), .Q(
        o_data_bus[58]) );
  DFD1BWP30P140 o_data_bus_inner_reg_60_ ( .D(N347), .CP(clk), .Q(
        o_data_bus[60]) );
  DFD1BWP30P140 o_data_bus_inner_reg_59_ ( .D(N346), .CP(clk), .Q(
        o_data_bus[59]) );
  DFQD2BWP30P140 o_valid_inner_reg_0_ ( .D(N353), .CP(clk), .Q(o_valid[0]) );
  MOAI22D1BWP30P140 U3 ( .A1(n22), .A2(n70), .B1(i_data_bus[54]), .B2(n69), 
        .ZN(N341) );
  OAI22D1BWP30P140 U4 ( .A1(n91), .A2(n13), .B1(n72), .B2(n43), .ZN(N304) );
  INVD6BWP30P140 U5 ( .I(n72), .ZN(n95) );
  INVD8BWP30P140 U6 ( .I(n21), .ZN(n69) );
  INVD2BWP30P140 U7 ( .I(n23), .ZN(n97) );
  ND2OPTIBD8BWP30P140 U8 ( .A1(n7), .A2(n35), .ZN(n72) );
  CKND2D4BWP30P140 U9 ( .A1(n1), .A2(n5), .ZN(n21) );
  INVD2BWP30P140 U10 ( .I(n15), .ZN(n1) );
  CKND2D2BWP30P140 U11 ( .A1(i_cmd[0]), .A2(n14), .ZN(n9) );
  CKND2D3BWP30P140 U12 ( .A1(n19), .A2(n18), .ZN(n20) );
  NR2D1BWP30P140 U13 ( .A1(i_valid[0]), .A2(i_cmd[1]), .ZN(n8) );
  INVD2BWP30P140 U14 ( .I(i_cmd[1]), .ZN(n15) );
  MOAI22D1BWP30P140 U15 ( .A1(n29), .A2(n70), .B1(i_data_bus[52]), .B2(n69), 
        .ZN(N339) );
  INVD2BWP30P140 U16 ( .I(n4), .ZN(n5) );
  INVD2BWP30P140 U17 ( .I(i_cmd[0]), .ZN(n35) );
  CKND2D2BWP30P140 U18 ( .A1(n15), .A2(n14), .ZN(n16) );
  ND2D1BWP30P140 U19 ( .A1(n2), .A2(i_en), .ZN(n37) );
  INVD1BWP30P140 U20 ( .I(n34), .ZN(n36) );
  OAI21D1BWP30P140 U21 ( .A1(n6), .A2(n1), .B(n21), .ZN(N354) );
  OAI22D1BWP30P140 U22 ( .A1(n97), .A2(n32), .B1(n72), .B2(n64), .ZN(N316) );
  OAI22D1BWP30P140 U23 ( .A1(n97), .A2(n31), .B1(n72), .B2(n63), .ZN(N317) );
  OAI22D1BWP30P140 U24 ( .A1(n97), .A2(n30), .B1(n72), .B2(n62), .ZN(N318) );
  OAI22D1P5BWP30P140 U25 ( .A1(n91), .A2(n28), .B1(n72), .B2(n55), .ZN(N292)
         );
  OAI22D1P5BWP30P140 U26 ( .A1(n91), .A2(n27), .B1(n72), .B2(n57), .ZN(N290)
         );
  OAI22D1P5BWP30P140 U27 ( .A1(n91), .A2(n26), .B1(n72), .B2(n56), .ZN(N291)
         );
  OAI22D1P5BWP30P140 U28 ( .A1(n91), .A2(n25), .B1(n72), .B2(n54), .ZN(N293)
         );
  INVD3BWP30P140 U29 ( .I(n72), .ZN(n89) );
  OAI22D1BWP30P140 U30 ( .A1(n97), .A2(n12), .B1(n72), .B2(n42), .ZN(N305) );
  OAI22D1BWP30P140 U31 ( .A1(n97), .A2(n11), .B1(n72), .B2(n41), .ZN(N306) );
  INVD1BWP30P140 U32 ( .I(n33), .ZN(n34) );
  INVD1BWP30P140 U33 ( .I(n37), .ZN(n14) );
  INVD1BWP30P140 U34 ( .I(rst), .ZN(n2) );
  CKND2D4BWP30P140 U35 ( .A1(i_valid[0]), .A2(n14), .ZN(n3) );
  INVD4BWP30P140 U36 ( .I(n3), .ZN(n7) );
  INVD1BWP30P140 U37 ( .I(n7), .ZN(n6) );
  CKND2D2BWP30P140 U38 ( .A1(i_valid[1]), .A2(n14), .ZN(n4) );
  INVD1BWP30P140 U39 ( .I(i_data_bus[7]), .ZN(n53) );
  INVD2BWP30P140 U40 ( .I(i_valid[1]), .ZN(n33) );
  AN2D2BWP30P140 U41 ( .A1(n33), .A2(i_cmd[1]), .Z(n10) );
  NR3D4BWP30P140 U42 ( .A1(n10), .A2(n9), .A3(n8), .ZN(n23) );
  MOAI22D1BWP30P140 U43 ( .A1(n72), .A2(n53), .B1(n23), .B2(i_data_bus[39]), 
        .ZN(N294) );
  INVD1BWP30P140 U44 ( .I(i_data_bus[51]), .ZN(n11) );
  INVD1BWP30P140 U45 ( .I(i_data_bus[19]), .ZN(n41) );
  INVD1BWP30P140 U46 ( .I(i_data_bus[50]), .ZN(n12) );
  INVD1BWP30P140 U47 ( .I(i_data_bus[18]), .ZN(n42) );
  INVD3BWP30P140 U48 ( .I(n23), .ZN(n91) );
  INVD1BWP30P140 U49 ( .I(i_data_bus[49]), .ZN(n13) );
  INVD1BWP30P140 U50 ( .I(i_data_bus[17]), .ZN(n43) );
  INVD1BWP30P140 U51 ( .I(i_data_bus[22]), .ZN(n22) );
  INVD2BWP30P140 U52 ( .I(n16), .ZN(n19) );
  INVD2BWP30P140 U53 ( .I(i_valid[0]), .ZN(n17) );
  MUX2NOPTD2BWP30P140 U54 ( .I0(n17), .I1(n33), .S(i_cmd[0]), .ZN(n18) );
  INVD4BWP30P140 U55 ( .I(n20), .ZN(n38) );
  INVD6BWP30P140 U56 ( .I(n38), .ZN(n70) );
  INVD3BWP30P140 U57 ( .I(n23), .ZN(n93) );
  INVD1BWP30P140 U58 ( .I(i_data_bus[52]), .ZN(n24) );
  MOAI22D1BWP30P140 U59 ( .A1(n93), .A2(n24), .B1(n89), .B2(i_data_bus[20]), 
        .ZN(N307) );
  INVD1BWP30P140 U60 ( .I(i_data_bus[38]), .ZN(n25) );
  INVD1BWP30P140 U61 ( .I(i_data_bus[6]), .ZN(n54) );
  INVD1BWP30P140 U62 ( .I(i_data_bus[36]), .ZN(n26) );
  INVD1BWP30P140 U63 ( .I(i_data_bus[4]), .ZN(n56) );
  INVD1BWP30P140 U64 ( .I(i_data_bus[35]), .ZN(n27) );
  INVD1BWP30P140 U65 ( .I(i_data_bus[3]), .ZN(n57) );
  INVD1BWP30P140 U66 ( .I(i_data_bus[37]), .ZN(n28) );
  INVD1BWP30P140 U67 ( .I(i_data_bus[5]), .ZN(n55) );
  INVD1BWP30P140 U68 ( .I(i_data_bus[20]), .ZN(n29) );
  INVD1BWP30P140 U69 ( .I(i_data_bus[63]), .ZN(n30) );
  INVD1BWP30P140 U70 ( .I(i_data_bus[31]), .ZN(n62) );
  INVD1BWP30P140 U71 ( .I(i_data_bus[62]), .ZN(n31) );
  INVD1BWP30P140 U72 ( .I(i_data_bus[30]), .ZN(n63) );
  INVD1BWP30P140 U73 ( .I(i_data_bus[61]), .ZN(n32) );
  INVD1BWP30P140 U74 ( .I(i_data_bus[29]), .ZN(n64) );
  OAI31D1BWP30P140 U75 ( .A1(n37), .A2(n36), .A3(n35), .B(n72), .ZN(N353) );
  INVD1BWP30P140 U76 ( .I(i_data_bus[25]), .ZN(n39) );
  INVD6BWP30P140 U77 ( .I(n38), .ZN(n60) );
  MOAI22D1BWP30P140 U78 ( .A1(n39), .A2(n60), .B1(i_data_bus[57]), .B2(n69), 
        .ZN(N344) );
  INVD1BWP30P140 U79 ( .I(i_data_bus[21]), .ZN(n40) );
  MOAI22D1BWP30P140 U80 ( .A1(n40), .A2(n70), .B1(i_data_bus[53]), .B2(n69), 
        .ZN(N340) );
  MOAI22D1BWP30P140 U81 ( .A1(n41), .A2(n60), .B1(i_data_bus[51]), .B2(n69), 
        .ZN(N338) );
  MOAI22D1BWP30P140 U82 ( .A1(n42), .A2(n60), .B1(i_data_bus[50]), .B2(n69), 
        .ZN(N337) );
  MOAI22D1BWP30P140 U83 ( .A1(n43), .A2(n60), .B1(i_data_bus[49]), .B2(n69), 
        .ZN(N336) );
  INVD1BWP30P140 U84 ( .I(i_data_bus[16]), .ZN(n44) );
  MOAI22D1BWP30P140 U85 ( .A1(n44), .A2(n60), .B1(i_data_bus[48]), .B2(n69), 
        .ZN(N335) );
  INVD1BWP30P140 U86 ( .I(i_data_bus[15]), .ZN(n45) );
  MOAI22D1BWP30P140 U87 ( .A1(n45), .A2(n70), .B1(i_data_bus[47]), .B2(n69), 
        .ZN(N334) );
  INVD1BWP30P140 U88 ( .I(i_data_bus[14]), .ZN(n46) );
  MOAI22D1BWP30P140 U89 ( .A1(n46), .A2(n70), .B1(i_data_bus[46]), .B2(n69), 
        .ZN(N333) );
  INVD1BWP30P140 U90 ( .I(i_data_bus[13]), .ZN(n47) );
  MOAI22D1BWP30P140 U91 ( .A1(n47), .A2(n70), .B1(i_data_bus[45]), .B2(n69), 
        .ZN(N332) );
  INVD1BWP30P140 U92 ( .I(i_data_bus[12]), .ZN(n48) );
  MOAI22D1BWP30P140 U93 ( .A1(n48), .A2(n60), .B1(i_data_bus[44]), .B2(n69), 
        .ZN(N331) );
  INVD1BWP30P140 U94 ( .I(i_data_bus[11]), .ZN(n49) );
  MOAI22D1BWP30P140 U95 ( .A1(n49), .A2(n70), .B1(i_data_bus[43]), .B2(n69), 
        .ZN(N330) );
  INVD1BWP30P140 U96 ( .I(i_data_bus[10]), .ZN(n50) );
  MOAI22D1BWP30P140 U97 ( .A1(n50), .A2(n60), .B1(i_data_bus[42]), .B2(n69), 
        .ZN(N329) );
  INVD1BWP30P140 U98 ( .I(i_data_bus[9]), .ZN(n51) );
  MOAI22D1BWP30P140 U99 ( .A1(n51), .A2(n70), .B1(i_data_bus[41]), .B2(n69), 
        .ZN(N328) );
  INVD1BWP30P140 U100 ( .I(i_data_bus[8]), .ZN(n52) );
  MOAI22D1BWP30P140 U101 ( .A1(n52), .A2(n60), .B1(i_data_bus[40]), .B2(n69), 
        .ZN(N327) );
  MOAI22D1BWP30P140 U102 ( .A1(n53), .A2(n60), .B1(i_data_bus[39]), .B2(n69), 
        .ZN(N326) );
  MOAI22D1BWP30P140 U103 ( .A1(n54), .A2(n60), .B1(i_data_bus[38]), .B2(n69), 
        .ZN(N325) );
  MOAI22D1BWP30P140 U104 ( .A1(n55), .A2(n60), .B1(i_data_bus[37]), .B2(n69), 
        .ZN(N324) );
  MOAI22D1BWP30P140 U105 ( .A1(n56), .A2(n60), .B1(i_data_bus[36]), .B2(n69), 
        .ZN(N323) );
  MOAI22D1BWP30P140 U106 ( .A1(n57), .A2(n60), .B1(i_data_bus[35]), .B2(n69), 
        .ZN(N322) );
  INVD1BWP30P140 U107 ( .I(i_data_bus[2]), .ZN(n58) );
  MOAI22D1BWP30P140 U108 ( .A1(n58), .A2(n60), .B1(i_data_bus[34]), .B2(n69), 
        .ZN(N321) );
  INVD1BWP30P140 U109 ( .I(i_data_bus[1]), .ZN(n59) );
  MOAI22D1BWP30P140 U110 ( .A1(n59), .A2(n60), .B1(i_data_bus[33]), .B2(n69), 
        .ZN(N320) );
  INVD1BWP30P140 U111 ( .I(i_data_bus[0]), .ZN(n61) );
  MOAI22D1BWP30P140 U112 ( .A1(n61), .A2(n60), .B1(i_data_bus[32]), .B2(n69), 
        .ZN(N319) );
  MOAI22D1BWP30P140 U113 ( .A1(n62), .A2(n70), .B1(i_data_bus[63]), .B2(n69), 
        .ZN(N350) );
  MOAI22D1BWP30P140 U114 ( .A1(n63), .A2(n70), .B1(i_data_bus[62]), .B2(n69), 
        .ZN(N349) );
  MOAI22D1BWP30P140 U115 ( .A1(n64), .A2(n70), .B1(i_data_bus[61]), .B2(n69), 
        .ZN(N348) );
  INVD1BWP30P140 U116 ( .I(i_data_bus[28]), .ZN(n65) );
  MOAI22D1BWP30P140 U117 ( .A1(n65), .A2(n70), .B1(i_data_bus[60]), .B2(n69), 
        .ZN(N347) );
  INVD1BWP30P140 U118 ( .I(i_data_bus[27]), .ZN(n66) );
  MOAI22D1BWP30P140 U119 ( .A1(n66), .A2(n70), .B1(i_data_bus[59]), .B2(n69), 
        .ZN(N346) );
  INVD1BWP30P140 U120 ( .I(i_data_bus[26]), .ZN(n67) );
  MOAI22D1BWP30P140 U121 ( .A1(n67), .A2(n70), .B1(i_data_bus[58]), .B2(n69), 
        .ZN(N345) );
  INVD1BWP30P140 U122 ( .I(i_data_bus[24]), .ZN(n68) );
  MOAI22D1BWP30P140 U123 ( .A1(n68), .A2(n70), .B1(i_data_bus[56]), .B2(n69), 
        .ZN(N343) );
  INVD1BWP30P140 U124 ( .I(i_data_bus[23]), .ZN(n71) );
  MOAI22D1BWP30P140 U125 ( .A1(n71), .A2(n70), .B1(i_data_bus[55]), .B2(n69), 
        .ZN(N342) );
  INVD1BWP30P140 U126 ( .I(i_data_bus[60]), .ZN(n73) );
  MOAI22D1BWP30P140 U127 ( .A1(n93), .A2(n73), .B1(n95), .B2(i_data_bus[28]), 
        .ZN(N315) );
  INVD1BWP30P140 U128 ( .I(i_data_bus[48]), .ZN(n74) );
  MOAI22D1BWP30P140 U129 ( .A1(n91), .A2(n74), .B1(n95), .B2(i_data_bus[16]), 
        .ZN(N303) );
  INVD1BWP30P140 U130 ( .I(i_data_bus[34]), .ZN(n75) );
  MOAI22D1BWP30P140 U131 ( .A1(n91), .A2(n75), .B1(n95), .B2(i_data_bus[2]), 
        .ZN(N289) );
  INVD1BWP30P140 U132 ( .I(i_data_bus[59]), .ZN(n76) );
  MOAI22D1BWP30P140 U133 ( .A1(n93), .A2(n76), .B1(n95), .B2(i_data_bus[27]), 
        .ZN(N314) );
  INVD1BWP30P140 U134 ( .I(i_data_bus[47]), .ZN(n77) );
  MOAI22D1BWP30P140 U135 ( .A1(n93), .A2(n77), .B1(n95), .B2(i_data_bus[15]), 
        .ZN(N302) );
  INVD1BWP30P140 U136 ( .I(i_data_bus[33]), .ZN(n78) );
  MOAI22D1BWP30P140 U137 ( .A1(n91), .A2(n78), .B1(n89), .B2(i_data_bus[1]), 
        .ZN(N288) );
  INVD1BWP30P140 U138 ( .I(i_data_bus[58]), .ZN(n79) );
  MOAI22D1BWP30P140 U139 ( .A1(n93), .A2(n79), .B1(n89), .B2(i_data_bus[26]), 
        .ZN(N313) );
  INVD1BWP30P140 U140 ( .I(i_data_bus[46]), .ZN(n80) );
  MOAI22D1BWP30P140 U141 ( .A1(n93), .A2(n80), .B1(n95), .B2(i_data_bus[14]), 
        .ZN(N301) );
  INVD1BWP30P140 U142 ( .I(i_data_bus[32]), .ZN(n81) );
  MOAI22D1BWP30P140 U143 ( .A1(n91), .A2(n81), .B1(n95), .B2(i_data_bus[0]), 
        .ZN(N287) );
  INVD1BWP30P140 U144 ( .I(i_data_bus[57]), .ZN(n82) );
  MOAI22D1BWP30P140 U145 ( .A1(n93), .A2(n82), .B1(n95), .B2(i_data_bus[25]), 
        .ZN(N312) );
  INVD1BWP30P140 U146 ( .I(i_data_bus[45]), .ZN(n83) );
  MOAI22D1BWP30P140 U147 ( .A1(n93), .A2(n83), .B1(n89), .B2(i_data_bus[13]), 
        .ZN(N300) );
  INVD1BWP30P140 U148 ( .I(i_data_bus[56]), .ZN(n84) );
  MOAI22D1BWP30P140 U149 ( .A1(n93), .A2(n84), .B1(n95), .B2(i_data_bus[24]), 
        .ZN(N311) );
  INVD1BWP30P140 U150 ( .I(i_data_bus[44]), .ZN(n85) );
  MOAI22D1BWP30P140 U151 ( .A1(n97), .A2(n85), .B1(n95), .B2(i_data_bus[12]), 
        .ZN(N299) );
  INVD1BWP30P140 U152 ( .I(i_data_bus[55]), .ZN(n86) );
  MOAI22D1BWP30P140 U153 ( .A1(n93), .A2(n86), .B1(n89), .B2(i_data_bus[23]), 
        .ZN(N310) );
  INVD1BWP30P140 U154 ( .I(i_data_bus[43]), .ZN(n87) );
  MOAI22D1BWP30P140 U155 ( .A1(n97), .A2(n87), .B1(n95), .B2(i_data_bus[11]), 
        .ZN(N298) );
  INVD1BWP30P140 U156 ( .I(i_data_bus[54]), .ZN(n88) );
  MOAI22D1BWP30P140 U157 ( .A1(n93), .A2(n88), .B1(n95), .B2(i_data_bus[22]), 
        .ZN(N309) );
  INVD1BWP30P140 U158 ( .I(i_data_bus[42]), .ZN(n90) );
  MOAI22D1BWP30P140 U159 ( .A1(n91), .A2(n90), .B1(n89), .B2(i_data_bus[10]), 
        .ZN(N297) );
  INVD1BWP30P140 U160 ( .I(i_data_bus[53]), .ZN(n92) );
  MOAI22D1BWP30P140 U161 ( .A1(n93), .A2(n92), .B1(n95), .B2(i_data_bus[21]), 
        .ZN(N308) );
  INVD1BWP30P140 U162 ( .I(i_data_bus[41]), .ZN(n94) );
  MOAI22D1BWP30P140 U163 ( .A1(n97), .A2(n94), .B1(n95), .B2(i_data_bus[9]), 
        .ZN(N296) );
  INVD1BWP30P140 U164 ( .I(i_data_bus[40]), .ZN(n96) );
  MOAI22D1BWP30P140 U165 ( .A1(n97), .A2(n96), .B1(n95), .B2(i_data_bus[8]), 
        .ZN(N295) );
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
         n73, n74, n75, n76, n77, n78, n79, n80, n81, n82, n83, n84, n85, n86,
         n87, n88, n89, n90, n91;

  DFQD4BWP30P140 o_valid_inner_reg_0_ ( .D(N353), .CP(clk), .Q(o_valid[0]) );
  DFQD4BWP30P140 o_data_bus_inner_reg_63_ ( .D(N350), .CP(clk), .Q(
        o_data_bus[63]) );
  DFQD4BWP30P140 o_data_bus_inner_reg_62_ ( .D(N349), .CP(clk), .Q(
        o_data_bus[62]) );
  DFQD4BWP30P140 o_data_bus_inner_reg_61_ ( .D(N348), .CP(clk), .Q(
        o_data_bus[61]) );
  DFQD4BWP30P140 o_data_bus_inner_reg_60_ ( .D(N347), .CP(clk), .Q(
        o_data_bus[60]) );
  DFQD4BWP30P140 o_data_bus_inner_reg_59_ ( .D(N346), .CP(clk), .Q(
        o_data_bus[59]) );
  DFQD4BWP30P140 o_data_bus_inner_reg_58_ ( .D(N345), .CP(clk), .Q(
        o_data_bus[58]) );
  DFQD4BWP30P140 o_data_bus_inner_reg_57_ ( .D(N344), .CP(clk), .Q(
        o_data_bus[57]) );
  DFQD4BWP30P140 o_data_bus_inner_reg_56_ ( .D(N343), .CP(clk), .Q(
        o_data_bus[56]) );
  DFQD4BWP30P140 o_data_bus_inner_reg_55_ ( .D(N342), .CP(clk), .Q(
        o_data_bus[55]) );
  DFQD4BWP30P140 o_data_bus_inner_reg_54_ ( .D(N341), .CP(clk), .Q(
        o_data_bus[54]) );
  DFQD4BWP30P140 o_data_bus_inner_reg_53_ ( .D(N340), .CP(clk), .Q(
        o_data_bus[53]) );
  DFQD4BWP30P140 o_data_bus_inner_reg_52_ ( .D(N339), .CP(clk), .Q(
        o_data_bus[52]) );
  DFQD4BWP30P140 o_data_bus_inner_reg_51_ ( .D(N338), .CP(clk), .Q(
        o_data_bus[51]) );
  DFQD4BWP30P140 o_data_bus_inner_reg_50_ ( .D(N337), .CP(clk), .Q(
        o_data_bus[50]) );
  DFQD4BWP30P140 o_data_bus_inner_reg_49_ ( .D(N336), .CP(clk), .Q(
        o_data_bus[49]) );
  DFQD4BWP30P140 o_data_bus_inner_reg_48_ ( .D(N335), .CP(clk), .Q(
        o_data_bus[48]) );
  DFQD4BWP30P140 o_data_bus_inner_reg_47_ ( .D(N334), .CP(clk), .Q(
        o_data_bus[47]) );
  DFQD4BWP30P140 o_data_bus_inner_reg_46_ ( .D(N333), .CP(clk), .Q(
        o_data_bus[46]) );
  DFQD4BWP30P140 o_data_bus_inner_reg_45_ ( .D(N332), .CP(clk), .Q(
        o_data_bus[45]) );
  DFQD4BWP30P140 o_data_bus_inner_reg_44_ ( .D(N331), .CP(clk), .Q(
        o_data_bus[44]) );
  DFQD4BWP30P140 o_data_bus_inner_reg_43_ ( .D(N330), .CP(clk), .Q(
        o_data_bus[43]) );
  DFQD4BWP30P140 o_data_bus_inner_reg_42_ ( .D(N329), .CP(clk), .Q(
        o_data_bus[42]) );
  DFQD4BWP30P140 o_data_bus_inner_reg_41_ ( .D(N328), .CP(clk), .Q(
        o_data_bus[41]) );
  DFQD4BWP30P140 o_data_bus_inner_reg_40_ ( .D(N327), .CP(clk), .Q(
        o_data_bus[40]) );
  DFQD4BWP30P140 o_data_bus_inner_reg_39_ ( .D(N326), .CP(clk), .Q(
        o_data_bus[39]) );
  DFQD4BWP30P140 o_data_bus_inner_reg_38_ ( .D(N325), .CP(clk), .Q(
        o_data_bus[38]) );
  DFQD4BWP30P140 o_data_bus_inner_reg_37_ ( .D(N324), .CP(clk), .Q(
        o_data_bus[37]) );
  DFQD4BWP30P140 o_data_bus_inner_reg_36_ ( .D(N323), .CP(clk), .Q(
        o_data_bus[36]) );
  DFQD4BWP30P140 o_data_bus_inner_reg_35_ ( .D(N322), .CP(clk), .Q(
        o_data_bus[35]) );
  DFQD4BWP30P140 o_data_bus_inner_reg_34_ ( .D(N321), .CP(clk), .Q(
        o_data_bus[34]) );
  DFQD4BWP30P140 o_data_bus_inner_reg_33_ ( .D(N320), .CP(clk), .Q(
        o_data_bus[33]) );
  DFQD4BWP30P140 o_data_bus_inner_reg_32_ ( .D(N319), .CP(clk), .Q(
        o_data_bus[32]) );
  DFQD4BWP30P140 o_data_bus_inner_reg_31_ ( .D(N318), .CP(clk), .Q(
        o_data_bus[31]) );
  DFQD4BWP30P140 o_data_bus_inner_reg_30_ ( .D(N317), .CP(clk), .Q(
        o_data_bus[30]) );
  DFQD4BWP30P140 o_data_bus_inner_reg_28_ ( .D(N315), .CP(clk), .Q(
        o_data_bus[28]) );
  DFQD4BWP30P140 o_data_bus_inner_reg_26_ ( .D(N313), .CP(clk), .Q(
        o_data_bus[26]) );
  DFQD4BWP30P140 o_data_bus_inner_reg_25_ ( .D(N312), .CP(clk), .Q(
        o_data_bus[25]) );
  DFQD4BWP30P140 o_data_bus_inner_reg_24_ ( .D(N311), .CP(clk), .Q(
        o_data_bus[24]) );
  DFQD4BWP30P140 o_data_bus_inner_reg_23_ ( .D(N310), .CP(clk), .Q(
        o_data_bus[23]) );
  DFQD4BWP30P140 o_data_bus_inner_reg_22_ ( .D(N309), .CP(clk), .Q(
        o_data_bus[22]) );
  DFQD4BWP30P140 o_data_bus_inner_reg_21_ ( .D(N308), .CP(clk), .Q(
        o_data_bus[21]) );
  DFQD4BWP30P140 o_data_bus_inner_reg_20_ ( .D(N307), .CP(clk), .Q(
        o_data_bus[20]) );
  DFQD4BWP30P140 o_data_bus_inner_reg_19_ ( .D(N306), .CP(clk), .Q(
        o_data_bus[19]) );
  DFQD4BWP30P140 o_data_bus_inner_reg_18_ ( .D(N305), .CP(clk), .Q(
        o_data_bus[18]) );
  DFQD4BWP30P140 o_data_bus_inner_reg_17_ ( .D(N304), .CP(clk), .Q(
        o_data_bus[17]) );
  DFQD4BWP30P140 o_data_bus_inner_reg_16_ ( .D(N303), .CP(clk), .Q(
        o_data_bus[16]) );
  DFQD4BWP30P140 o_data_bus_inner_reg_15_ ( .D(N302), .CP(clk), .Q(
        o_data_bus[15]) );
  DFQD4BWP30P140 o_data_bus_inner_reg_14_ ( .D(N301), .CP(clk), .Q(
        o_data_bus[14]) );
  DFQD4BWP30P140 o_data_bus_inner_reg_13_ ( .D(N300), .CP(clk), .Q(
        o_data_bus[13]) );
  DFQD4BWP30P140 o_data_bus_inner_reg_12_ ( .D(N299), .CP(clk), .Q(
        o_data_bus[12]) );
  DFQD4BWP30P140 o_data_bus_inner_reg_11_ ( .D(N298), .CP(clk), .Q(
        o_data_bus[11]) );
  DFQD4BWP30P140 o_data_bus_inner_reg_10_ ( .D(N297), .CP(clk), .Q(
        o_data_bus[10]) );
  DFQD4BWP30P140 o_data_bus_inner_reg_9_ ( .D(N296), .CP(clk), .Q(
        o_data_bus[9]) );
  DFQD4BWP30P140 o_data_bus_inner_reg_8_ ( .D(N295), .CP(clk), .Q(
        o_data_bus[8]) );
  DFQD4BWP30P140 o_data_bus_inner_reg_7_ ( .D(N294), .CP(clk), .Q(
        o_data_bus[7]) );
  DFQD4BWP30P140 o_data_bus_inner_reg_6_ ( .D(N293), .CP(clk), .Q(
        o_data_bus[6]) );
  DFQD4BWP30P140 o_data_bus_inner_reg_5_ ( .D(N292), .CP(clk), .Q(
        o_data_bus[5]) );
  DFQD4BWP30P140 o_data_bus_inner_reg_4_ ( .D(N291), .CP(clk), .Q(
        o_data_bus[4]) );
  DFQD4BWP30P140 o_data_bus_inner_reg_3_ ( .D(N290), .CP(clk), .Q(
        o_data_bus[3]) );
  DFQD4BWP30P140 o_data_bus_inner_reg_2_ ( .D(N289), .CP(clk), .Q(
        o_data_bus[2]) );
  DFQD4BWP30P140 o_data_bus_inner_reg_1_ ( .D(N288), .CP(clk), .Q(
        o_data_bus[1]) );
  DFQD4BWP30P140 o_data_bus_inner_reg_0_ ( .D(N287), .CP(clk), .Q(
        o_data_bus[0]) );
  DFQD4BWP30P140 o_data_bus_inner_reg_29_ ( .D(N316), .CP(clk), .Q(
        o_data_bus[29]) );
  DFQD4BWP30P140 o_data_bus_inner_reg_27_ ( .D(N314), .CP(clk), .Q(
        o_data_bus[27]) );
  DFQD4BWP30P140 o_valid_inner_reg_1_ ( .D(N354), .CP(clk), .Q(o_valid[1]) );
  AN3D4BWP30P140 U3 ( .A1(i_valid[1]), .A2(i_cmd[1]), .A3(n43), .Z(n89) );
  NR2D1BWP30P140 U4 ( .A1(n49), .A2(i_cmd[1]), .ZN(n53) );
  INVD1BWP30P140 U5 ( .I(n73), .ZN(n1) );
  CKND2D2BWP30P140 U6 ( .A1(n42), .A2(n41), .ZN(n2) );
  INR2D2BWP30P140 U7 ( .A1(i_valid[0]), .B1(n49), .ZN(n42) );
  CKND2D2BWP30P140 U8 ( .A1(n42), .A2(n41), .ZN(n4) );
  CKND2D2BWP30P140 U9 ( .A1(n42), .A2(n41), .ZN(n3) );
  INVD2BWP30P140 U10 ( .I(i_valid[0]), .ZN(n51) );
  INVD1BWP30P140 U11 ( .I(n73), .ZN(n62) );
  INVD1BWP30P140 U12 ( .I(n73), .ZN(n84) );
  INVD1BWP30P140 U13 ( .I(n73), .ZN(n90) );
  ND2D1BWP30P140 U14 ( .A1(n5), .A2(i_en), .ZN(n49) );
  OAI22D1BWP30P140 U15 ( .A1(n40), .A2(n26), .B1(n2), .B2(n61), .ZN(N287) );
  OAI22D1BWP30P140 U16 ( .A1(n40), .A2(n25), .B1(n4), .B2(n60), .ZN(N289) );
  OAI22D1BWP30P140 U17 ( .A1(n40), .A2(n38), .B1(n3), .B2(n59), .ZN(N291) );
  OAI22D1BWP30P140 U18 ( .A1(n40), .A2(n39), .B1(n3), .B2(n63), .ZN(N293) );
  OAI22D1BWP30P140 U19 ( .A1(n40), .A2(n35), .B1(n2), .B2(n64), .ZN(N295) );
  OAI22D1BWP30P140 U20 ( .A1(n40), .A2(n36), .B1(n4), .B2(n82), .ZN(N296) );
  OAI22D1BWP30P140 U21 ( .A1(n40), .A2(n29), .B1(n2), .B2(n65), .ZN(N297) );
  OAI22D1BWP30P140 U22 ( .A1(n40), .A2(n32), .B1(n4), .B2(n83), .ZN(N298) );
  OAI22D1BWP30P140 U23 ( .A1(n40), .A2(n27), .B1(n2), .B2(n66), .ZN(N299) );
  OAI22D1BWP30P140 U24 ( .A1(n40), .A2(n30), .B1(n4), .B2(n85), .ZN(N300) );
  OAI22D1BWP30P140 U25 ( .A1(n40), .A2(n28), .B1(n2), .B2(n67), .ZN(N301) );
  OAI22D1BWP30P140 U26 ( .A1(n40), .A2(n37), .B1(n3), .B2(n68), .ZN(N302) );
  OAI22D1BWP30P140 U27 ( .A1(n40), .A2(n31), .B1(n4), .B2(n69), .ZN(N303) );
  OAI22D1BWP30P140 U28 ( .A1(n40), .A2(n33), .B1(n2), .B2(n70), .ZN(N304) );
  OAI22D1BWP30P140 U29 ( .A1(n40), .A2(n34), .B1(n4), .B2(n71), .ZN(N305) );
  OAI22D1BWP30P140 U30 ( .A1(n40), .A2(n24), .B1(n2), .B2(n72), .ZN(N306) );
  INVD1BWP30P140 U31 ( .I(rst), .ZN(n5) );
  INVD2BWP30P140 U32 ( .I(i_cmd[0]), .ZN(n41) );
  NR2OPTPAD1BWP30P140 U33 ( .A1(n49), .A2(n41), .ZN(n7) );
  INVD2BWP30P140 U34 ( .I(i_valid[1]), .ZN(n50) );
  MUX2NUD1BWP30P140 U35 ( .I0(n51), .I1(n50), .S(i_cmd[1]), .ZN(n6) );
  ND2OPTIBD1BWP30P140 U36 ( .A1(n7), .A2(n6), .ZN(n8) );
  INVD2BWP30P140 U37 ( .I(n8), .ZN(n23) );
  INVD2BWP30P140 U38 ( .I(n23), .ZN(n48) );
  INVD1BWP30P140 U39 ( .I(i_data_bus[39]), .ZN(n9) );
  INVD1BWP30P140 U40 ( .I(i_data_bus[7]), .ZN(n57) );
  OAI22D1BWP30P140 U41 ( .A1(n48), .A2(n9), .B1(n3), .B2(n57), .ZN(N294) );
  INVD1BWP30P140 U42 ( .I(i_data_bus[37]), .ZN(n10) );
  INVD1BWP30P140 U43 ( .I(i_data_bus[5]), .ZN(n58) );
  OAI22D1BWP30P140 U44 ( .A1(n48), .A2(n10), .B1(n4), .B2(n58), .ZN(N292) );
  INVD1BWP30P140 U45 ( .I(i_data_bus[62]), .ZN(n11) );
  INVD1BWP30P140 U46 ( .I(i_data_bus[30]), .ZN(n81) );
  OAI22D1BWP30P140 U47 ( .A1(n48), .A2(n11), .B1(n3), .B2(n81), .ZN(N317) );
  INVD1BWP30P140 U48 ( .I(i_data_bus[60]), .ZN(n12) );
  INVD1BWP30P140 U49 ( .I(i_data_bus[28]), .ZN(n80) );
  OAI22D1BWP30P140 U50 ( .A1(n48), .A2(n12), .B1(n2), .B2(n80), .ZN(N315) );
  INVD1BWP30P140 U51 ( .I(i_data_bus[56]), .ZN(n13) );
  INVD1BWP30P140 U52 ( .I(i_data_bus[24]), .ZN(n78) );
  OAI22D1BWP30P140 U53 ( .A1(n48), .A2(n13), .B1(n3), .B2(n78), .ZN(N311) );
  INVD1BWP30P140 U54 ( .I(i_data_bus[58]), .ZN(n14) );
  INVD1BWP30P140 U55 ( .I(i_data_bus[26]), .ZN(n79) );
  OAI22D1BWP30P140 U56 ( .A1(n48), .A2(n14), .B1(n4), .B2(n79), .ZN(N313) );
  INVD1BWP30P140 U57 ( .I(i_data_bus[54]), .ZN(n15) );
  INVD1BWP30P140 U58 ( .I(i_data_bus[22]), .ZN(n76) );
  OAI22D1BWP30P140 U59 ( .A1(n48), .A2(n15), .B1(n3), .B2(n76), .ZN(N309) );
  INVD1BWP30P140 U60 ( .I(i_data_bus[35]), .ZN(n16) );
  INVD1BWP30P140 U61 ( .I(i_data_bus[3]), .ZN(n55) );
  OAI22D1BWP30P140 U62 ( .A1(n48), .A2(n16), .B1(n2), .B2(n55), .ZN(N290) );
  INVD1BWP30P140 U63 ( .I(i_data_bus[33]), .ZN(n17) );
  INVD1BWP30P140 U64 ( .I(i_data_bus[1]), .ZN(n56) );
  OAI22D1BWP30P140 U65 ( .A1(n48), .A2(n17), .B1(n3), .B2(n56), .ZN(N288) );
  INVD1BWP30P140 U66 ( .I(i_data_bus[55]), .ZN(n18) );
  INVD1BWP30P140 U67 ( .I(i_data_bus[23]), .ZN(n77) );
  OAI22D1BWP30P140 U68 ( .A1(n48), .A2(n18), .B1(n4), .B2(n77), .ZN(N310) );
  INVD1BWP30P140 U69 ( .I(i_data_bus[52]), .ZN(n19) );
  INVD1BWP30P140 U70 ( .I(i_data_bus[20]), .ZN(n74) );
  OAI22D1BWP30P140 U71 ( .A1(n48), .A2(n19), .B1(n3), .B2(n74), .ZN(N307) );
  INVD1BWP30P140 U72 ( .I(i_data_bus[63]), .ZN(n20) );
  INVD1BWP30P140 U73 ( .I(i_data_bus[31]), .ZN(n91) );
  OAI22D1BWP30P140 U74 ( .A1(n48), .A2(n20), .B1(n2), .B2(n91), .ZN(N318) );
  INVD1BWP30P140 U75 ( .I(i_data_bus[53]), .ZN(n21) );
  INVD1BWP30P140 U76 ( .I(i_data_bus[21]), .ZN(n75) );
  OAI22D1BWP30P140 U77 ( .A1(n48), .A2(n21), .B1(n3), .B2(n75), .ZN(N308) );
  INVD1BWP30P140 U78 ( .I(i_data_bus[57]), .ZN(n22) );
  INVD1BWP30P140 U79 ( .I(i_data_bus[25]), .ZN(n86) );
  OAI22D1BWP30P140 U80 ( .A1(n48), .A2(n22), .B1(n3), .B2(n86), .ZN(N312) );
  INVD2BWP30P140 U81 ( .I(n23), .ZN(n40) );
  INVD1BWP30P140 U82 ( .I(i_data_bus[51]), .ZN(n24) );
  INVD1BWP30P140 U83 ( .I(i_data_bus[19]), .ZN(n72) );
  INVD1BWP30P140 U84 ( .I(i_data_bus[34]), .ZN(n25) );
  INVD1BWP30P140 U85 ( .I(i_data_bus[2]), .ZN(n60) );
  INVD1BWP30P140 U86 ( .I(i_data_bus[32]), .ZN(n26) );
  INVD1BWP30P140 U87 ( .I(i_data_bus[0]), .ZN(n61) );
  INVD1BWP30P140 U88 ( .I(i_data_bus[44]), .ZN(n27) );
  INVD1BWP30P140 U89 ( .I(i_data_bus[12]), .ZN(n66) );
  INVD1BWP30P140 U90 ( .I(i_data_bus[46]), .ZN(n28) );
  INVD1BWP30P140 U91 ( .I(i_data_bus[14]), .ZN(n67) );
  INVD1BWP30P140 U92 ( .I(i_data_bus[42]), .ZN(n29) );
  INVD1BWP30P140 U93 ( .I(i_data_bus[10]), .ZN(n65) );
  INVD1BWP30P140 U94 ( .I(i_data_bus[45]), .ZN(n30) );
  INVD1BWP30P140 U95 ( .I(i_data_bus[13]), .ZN(n85) );
  INVD1BWP30P140 U96 ( .I(i_data_bus[48]), .ZN(n31) );
  INVD1BWP30P140 U97 ( .I(i_data_bus[16]), .ZN(n69) );
  INVD1BWP30P140 U98 ( .I(i_data_bus[43]), .ZN(n32) );
  INVD1BWP30P140 U99 ( .I(i_data_bus[11]), .ZN(n83) );
  INVD1BWP30P140 U100 ( .I(i_data_bus[49]), .ZN(n33) );
  INVD1BWP30P140 U101 ( .I(i_data_bus[17]), .ZN(n70) );
  INVD1BWP30P140 U102 ( .I(i_data_bus[50]), .ZN(n34) );
  INVD1BWP30P140 U103 ( .I(i_data_bus[18]), .ZN(n71) );
  INVD1BWP30P140 U104 ( .I(i_data_bus[40]), .ZN(n35) );
  INVD1BWP30P140 U105 ( .I(i_data_bus[8]), .ZN(n64) );
  INVD1BWP30P140 U106 ( .I(i_data_bus[41]), .ZN(n36) );
  INVD1BWP30P140 U107 ( .I(i_data_bus[9]), .ZN(n82) );
  INVD1BWP30P140 U108 ( .I(i_data_bus[47]), .ZN(n37) );
  INVD1BWP30P140 U109 ( .I(i_data_bus[15]), .ZN(n68) );
  INVD1BWP30P140 U110 ( .I(i_data_bus[36]), .ZN(n38) );
  INVD1BWP30P140 U111 ( .I(i_data_bus[4]), .ZN(n59) );
  INVD1BWP30P140 U112 ( .I(i_data_bus[38]), .ZN(n39) );
  INVD1BWP30P140 U113 ( .I(i_data_bus[6]), .ZN(n63) );
  OAI31D1BWP30P140 U114 ( .A1(n49), .A2(n50), .A3(n41), .B(n4), .ZN(N353) );
  INVD1BWP30P140 U115 ( .I(n42), .ZN(n45) );
  INVD1BWP30P140 U116 ( .I(n49), .ZN(n43) );
  INVD1BWP30P140 U117 ( .I(n89), .ZN(n44) );
  OAI21D1BWP30P140 U118 ( .A1(n45), .A2(i_cmd[1]), .B(n44), .ZN(N354) );
  INVD1BWP30P140 U119 ( .I(i_data_bus[29]), .ZN(n88) );
  INVD1BWP30P140 U120 ( .I(i_data_bus[61]), .ZN(n46) );
  OAI22D1BWP30P140 U121 ( .A1(n4), .A2(n88), .B1(n48), .B2(n46), .ZN(N316) );
  INVD1BWP30P140 U122 ( .I(i_data_bus[27]), .ZN(n87) );
  INVD1BWP30P140 U123 ( .I(i_data_bus[59]), .ZN(n47) );
  OAI22D1BWP30P140 U124 ( .A1(n2), .A2(n87), .B1(n48), .B2(n47), .ZN(N314) );
  MUX2NUD1BWP30P140 U125 ( .I0(n51), .I1(n50), .S(i_cmd[0]), .ZN(n52) );
  ND2OPTIBD1BWP30P140 U126 ( .A1(n53), .A2(n52), .ZN(n54) );
  INVD2BWP30P140 U127 ( .I(n54), .ZN(n73) );
  MOAI22D1BWP30P140 U128 ( .A1(n55), .A2(n84), .B1(i_data_bus[35]), .B2(n89), 
        .ZN(N322) );
  MOAI22D1BWP30P140 U129 ( .A1(n56), .A2(n90), .B1(i_data_bus[33]), .B2(n89), 
        .ZN(N320) );
  MOAI22D1BWP30P140 U130 ( .A1(n57), .A2(n62), .B1(i_data_bus[39]), .B2(n89), 
        .ZN(N326) );
  MOAI22D1BWP30P140 U131 ( .A1(n58), .A2(n1), .B1(i_data_bus[37]), .B2(n89), 
        .ZN(N324) );
  MOAI22D1BWP30P140 U132 ( .A1(n59), .A2(n84), .B1(i_data_bus[36]), .B2(n89), 
        .ZN(N323) );
  MOAI22D1BWP30P140 U133 ( .A1(n60), .A2(n90), .B1(i_data_bus[34]), .B2(n89), 
        .ZN(N321) );
  MOAI22D1BWP30P140 U134 ( .A1(n61), .A2(n62), .B1(i_data_bus[32]), .B2(n89), 
        .ZN(N319) );
  MOAI22D1BWP30P140 U135 ( .A1(n63), .A2(n1), .B1(i_data_bus[38]), .B2(n89), 
        .ZN(N325) );
  MOAI22D1BWP30P140 U136 ( .A1(n64), .A2(n84), .B1(i_data_bus[40]), .B2(n89), 
        .ZN(N327) );
  MOAI22D1BWP30P140 U137 ( .A1(n65), .A2(n90), .B1(i_data_bus[42]), .B2(n89), 
        .ZN(N329) );
  MOAI22D1BWP30P140 U138 ( .A1(n66), .A2(n62), .B1(i_data_bus[44]), .B2(n89), 
        .ZN(N331) );
  MOAI22D1BWP30P140 U139 ( .A1(n67), .A2(n1), .B1(i_data_bus[46]), .B2(n89), 
        .ZN(N333) );
  MOAI22D1BWP30P140 U140 ( .A1(n68), .A2(n84), .B1(i_data_bus[47]), .B2(n89), 
        .ZN(N334) );
  MOAI22D1BWP30P140 U141 ( .A1(n69), .A2(n90), .B1(i_data_bus[48]), .B2(n89), 
        .ZN(N335) );
  MOAI22D1BWP30P140 U142 ( .A1(n70), .A2(n62), .B1(i_data_bus[49]), .B2(n89), 
        .ZN(N336) );
  MOAI22D1BWP30P140 U143 ( .A1(n71), .A2(n1), .B1(i_data_bus[50]), .B2(n89), 
        .ZN(N337) );
  MOAI22D1BWP30P140 U144 ( .A1(n72), .A2(n84), .B1(i_data_bus[51]), .B2(n89), 
        .ZN(N338) );
  MOAI22D1BWP30P140 U145 ( .A1(n74), .A2(n84), .B1(i_data_bus[52]), .B2(n89), 
        .ZN(N339) );
  MOAI22D1BWP30P140 U146 ( .A1(n75), .A2(n90), .B1(i_data_bus[53]), .B2(n89), 
        .ZN(N340) );
  MOAI22D1BWP30P140 U147 ( .A1(n76), .A2(n62), .B1(i_data_bus[54]), .B2(n89), 
        .ZN(N341) );
  MOAI22D1BWP30P140 U148 ( .A1(n77), .A2(n1), .B1(i_data_bus[55]), .B2(n89), 
        .ZN(N342) );
  MOAI22D1BWP30P140 U149 ( .A1(n78), .A2(n84), .B1(i_data_bus[56]), .B2(n89), 
        .ZN(N343) );
  MOAI22D1BWP30P140 U150 ( .A1(n79), .A2(n90), .B1(i_data_bus[58]), .B2(n89), 
        .ZN(N345) );
  MOAI22D1BWP30P140 U151 ( .A1(n80), .A2(n62), .B1(i_data_bus[60]), .B2(n89), 
        .ZN(N347) );
  MOAI22D1BWP30P140 U152 ( .A1(n81), .A2(n1), .B1(i_data_bus[62]), .B2(n89), 
        .ZN(N349) );
  MOAI22D1BWP30P140 U153 ( .A1(n82), .A2(n90), .B1(i_data_bus[41]), .B2(n89), 
        .ZN(N328) );
  MOAI22D1BWP30P140 U154 ( .A1(n83), .A2(n62), .B1(i_data_bus[43]), .B2(n89), 
        .ZN(N330) );
  MOAI22D1BWP30P140 U155 ( .A1(n85), .A2(n1), .B1(i_data_bus[45]), .B2(n89), 
        .ZN(N332) );
  MOAI22D1BWP30P140 U156 ( .A1(n86), .A2(n84), .B1(i_data_bus[57]), .B2(n89), 
        .ZN(N344) );
  MOAI22D1BWP30P140 U157 ( .A1(n87), .A2(n90), .B1(i_data_bus[59]), .B2(n89), 
        .ZN(N346) );
  MOAI22D1BWP30P140 U158 ( .A1(n88), .A2(n62), .B1(i_data_bus[61]), .B2(n89), 
        .ZN(N348) );
  MOAI22D1BWP30P140 U159 ( .A1(n91), .A2(n1), .B1(i_data_bus[63]), .B2(n89), 
        .ZN(N350) );
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
         n73, n74, n75, n76, n77, n78, n79, n80, n81, n82, n83, n84, n85, n86,
         n87, n88, n89, n90, n91;

  DFQD4BWP30P140 o_valid_inner_reg_0_ ( .D(N353), .CP(clk), .Q(o_valid[0]) );
  DFQD4BWP30P140 o_data_bus_inner_reg_63_ ( .D(N350), .CP(clk), .Q(
        o_data_bus[63]) );
  DFQD4BWP30P140 o_data_bus_inner_reg_62_ ( .D(N349), .CP(clk), .Q(
        o_data_bus[62]) );
  DFQD4BWP30P140 o_data_bus_inner_reg_61_ ( .D(N348), .CP(clk), .Q(
        o_data_bus[61]) );
  DFQD4BWP30P140 o_data_bus_inner_reg_60_ ( .D(N347), .CP(clk), .Q(
        o_data_bus[60]) );
  DFQD4BWP30P140 o_data_bus_inner_reg_59_ ( .D(N346), .CP(clk), .Q(
        o_data_bus[59]) );
  DFQD4BWP30P140 o_data_bus_inner_reg_58_ ( .D(N345), .CP(clk), .Q(
        o_data_bus[58]) );
  DFQD4BWP30P140 o_data_bus_inner_reg_57_ ( .D(N344), .CP(clk), .Q(
        o_data_bus[57]) );
  DFQD4BWP30P140 o_data_bus_inner_reg_56_ ( .D(N343), .CP(clk), .Q(
        o_data_bus[56]) );
  DFQD4BWP30P140 o_data_bus_inner_reg_55_ ( .D(N342), .CP(clk), .Q(
        o_data_bus[55]) );
  DFQD4BWP30P140 o_data_bus_inner_reg_54_ ( .D(N341), .CP(clk), .Q(
        o_data_bus[54]) );
  DFQD4BWP30P140 o_data_bus_inner_reg_53_ ( .D(N340), .CP(clk), .Q(
        o_data_bus[53]) );
  DFQD4BWP30P140 o_data_bus_inner_reg_52_ ( .D(N339), .CP(clk), .Q(
        o_data_bus[52]) );
  DFQD4BWP30P140 o_data_bus_inner_reg_51_ ( .D(N338), .CP(clk), .Q(
        o_data_bus[51]) );
  DFQD4BWP30P140 o_data_bus_inner_reg_50_ ( .D(N337), .CP(clk), .Q(
        o_data_bus[50]) );
  DFQD4BWP30P140 o_data_bus_inner_reg_49_ ( .D(N336), .CP(clk), .Q(
        o_data_bus[49]) );
  DFQD4BWP30P140 o_data_bus_inner_reg_48_ ( .D(N335), .CP(clk), .Q(
        o_data_bus[48]) );
  DFQD4BWP30P140 o_data_bus_inner_reg_47_ ( .D(N334), .CP(clk), .Q(
        o_data_bus[47]) );
  DFQD4BWP30P140 o_data_bus_inner_reg_46_ ( .D(N333), .CP(clk), .Q(
        o_data_bus[46]) );
  DFQD4BWP30P140 o_data_bus_inner_reg_45_ ( .D(N332), .CP(clk), .Q(
        o_data_bus[45]) );
  DFQD4BWP30P140 o_data_bus_inner_reg_44_ ( .D(N331), .CP(clk), .Q(
        o_data_bus[44]) );
  DFQD4BWP30P140 o_data_bus_inner_reg_43_ ( .D(N330), .CP(clk), .Q(
        o_data_bus[43]) );
  DFQD4BWP30P140 o_data_bus_inner_reg_42_ ( .D(N329), .CP(clk), .Q(
        o_data_bus[42]) );
  DFQD4BWP30P140 o_data_bus_inner_reg_41_ ( .D(N328), .CP(clk), .Q(
        o_data_bus[41]) );
  DFQD4BWP30P140 o_data_bus_inner_reg_40_ ( .D(N327), .CP(clk), .Q(
        o_data_bus[40]) );
  DFQD4BWP30P140 o_data_bus_inner_reg_39_ ( .D(N326), .CP(clk), .Q(
        o_data_bus[39]) );
  DFQD4BWP30P140 o_data_bus_inner_reg_38_ ( .D(N325), .CP(clk), .Q(
        o_data_bus[38]) );
  DFQD4BWP30P140 o_data_bus_inner_reg_37_ ( .D(N324), .CP(clk), .Q(
        o_data_bus[37]) );
  DFQD4BWP30P140 o_data_bus_inner_reg_36_ ( .D(N323), .CP(clk), .Q(
        o_data_bus[36]) );
  DFQD4BWP30P140 o_data_bus_inner_reg_35_ ( .D(N322), .CP(clk), .Q(
        o_data_bus[35]) );
  DFQD4BWP30P140 o_data_bus_inner_reg_34_ ( .D(N321), .CP(clk), .Q(
        o_data_bus[34]) );
  DFQD4BWP30P140 o_data_bus_inner_reg_33_ ( .D(N320), .CP(clk), .Q(
        o_data_bus[33]) );
  DFQD4BWP30P140 o_data_bus_inner_reg_32_ ( .D(N319), .CP(clk), .Q(
        o_data_bus[32]) );
  DFQD4BWP30P140 o_data_bus_inner_reg_31_ ( .D(N318), .CP(clk), .Q(
        o_data_bus[31]) );
  DFQD4BWP30P140 o_data_bus_inner_reg_30_ ( .D(N317), .CP(clk), .Q(
        o_data_bus[30]) );
  DFQD4BWP30P140 o_data_bus_inner_reg_29_ ( .D(N316), .CP(clk), .Q(
        o_data_bus[29]) );
  DFQD4BWP30P140 o_data_bus_inner_reg_27_ ( .D(N314), .CP(clk), .Q(
        o_data_bus[27]) );
  DFQD4BWP30P140 o_data_bus_inner_reg_26_ ( .D(N313), .CP(clk), .Q(
        o_data_bus[26]) );
  DFQD4BWP30P140 o_data_bus_inner_reg_25_ ( .D(N312), .CP(clk), .Q(
        o_data_bus[25]) );
  DFQD4BWP30P140 o_data_bus_inner_reg_23_ ( .D(N310), .CP(clk), .Q(
        o_data_bus[23]) );
  DFQD4BWP30P140 o_data_bus_inner_reg_22_ ( .D(N309), .CP(clk), .Q(
        o_data_bus[22]) );
  DFQD4BWP30P140 o_data_bus_inner_reg_21_ ( .D(N308), .CP(clk), .Q(
        o_data_bus[21]) );
  DFQD4BWP30P140 o_data_bus_inner_reg_20_ ( .D(N307), .CP(clk), .Q(
        o_data_bus[20]) );
  DFQD4BWP30P140 o_data_bus_inner_reg_19_ ( .D(N306), .CP(clk), .Q(
        o_data_bus[19]) );
  DFQD4BWP30P140 o_data_bus_inner_reg_18_ ( .D(N305), .CP(clk), .Q(
        o_data_bus[18]) );
  DFQD4BWP30P140 o_data_bus_inner_reg_17_ ( .D(N304), .CP(clk), .Q(
        o_data_bus[17]) );
  DFQD4BWP30P140 o_data_bus_inner_reg_16_ ( .D(N303), .CP(clk), .Q(
        o_data_bus[16]) );
  DFQD4BWP30P140 o_data_bus_inner_reg_15_ ( .D(N302), .CP(clk), .Q(
        o_data_bus[15]) );
  DFQD4BWP30P140 o_data_bus_inner_reg_14_ ( .D(N301), .CP(clk), .Q(
        o_data_bus[14]) );
  DFQD4BWP30P140 o_data_bus_inner_reg_13_ ( .D(N300), .CP(clk), .Q(
        o_data_bus[13]) );
  DFQD4BWP30P140 o_data_bus_inner_reg_12_ ( .D(N299), .CP(clk), .Q(
        o_data_bus[12]) );
  DFQD4BWP30P140 o_data_bus_inner_reg_11_ ( .D(N298), .CP(clk), .Q(
        o_data_bus[11]) );
  DFQD4BWP30P140 o_data_bus_inner_reg_7_ ( .D(N294), .CP(clk), .Q(
        o_data_bus[7]) );
  DFQD4BWP30P140 o_data_bus_inner_reg_6_ ( .D(N293), .CP(clk), .Q(
        o_data_bus[6]) );
  DFQD4BWP30P140 o_data_bus_inner_reg_5_ ( .D(N292), .CP(clk), .Q(
        o_data_bus[5]) );
  DFQD4BWP30P140 o_data_bus_inner_reg_4_ ( .D(N291), .CP(clk), .Q(
        o_data_bus[4]) );
  DFQD4BWP30P140 o_data_bus_inner_reg_3_ ( .D(N290), .CP(clk), .Q(
        o_data_bus[3]) );
  DFQD4BWP30P140 o_data_bus_inner_reg_2_ ( .D(N289), .CP(clk), .Q(
        o_data_bus[2]) );
  DFQD4BWP30P140 o_data_bus_inner_reg_1_ ( .D(N288), .CP(clk), .Q(
        o_data_bus[1]) );
  DFQD4BWP30P140 o_data_bus_inner_reg_0_ ( .D(N287), .CP(clk), .Q(
        o_data_bus[0]) );
  DFQD4BWP30P140 o_data_bus_inner_reg_28_ ( .D(N315), .CP(clk), .Q(
        o_data_bus[28]) );
  DFQD4BWP30P140 o_data_bus_inner_reg_24_ ( .D(N311), .CP(clk), .Q(
        o_data_bus[24]) );
  DFQD4BWP30P140 o_data_bus_inner_reg_10_ ( .D(N297), .CP(clk), .Q(
        o_data_bus[10]) );
  DFQD4BWP30P140 o_data_bus_inner_reg_9_ ( .D(N296), .CP(clk), .Q(
        o_data_bus[9]) );
  DFQD4BWP30P140 o_data_bus_inner_reg_8_ ( .D(N295), .CP(clk), .Q(
        o_data_bus[8]) );
  DFQD4BWP30P140 o_valid_inner_reg_1_ ( .D(N354), .CP(clk), .Q(o_valid[1]) );
  AN3D4BWP30P140 U3 ( .A1(i_valid[1]), .A2(i_cmd[1]), .A3(n39), .Z(n89) );
  NR2D1BWP30P140 U4 ( .A1(n49), .A2(n37), .ZN(n5) );
  NR2D1BWP30P140 U5 ( .A1(n49), .A2(i_cmd[1]), .ZN(n53) );
  INVD1BWP30P140 U6 ( .I(n54), .ZN(n67) );
  AN2D1BWP30P140 U7 ( .A1(n38), .A2(n37), .Z(n1) );
  INVD2BWP30P140 U8 ( .I(i_valid[0]), .ZN(n51) );
  NR2OPTPAD2BWP30P140 U9 ( .A1(n51), .A2(n49), .ZN(n38) );
  INVD1BWP30P140 U10 ( .I(n67), .ZN(n2) );
  INVD3BWP30P140 U11 ( .I(n1), .ZN(n48) );
  INVD1BWP30P140 U12 ( .I(n67), .ZN(n62) );
  INVD1BWP30P140 U13 ( .I(n67), .ZN(n87) );
  INVD1BWP30P140 U14 ( .I(n67), .ZN(n90) );
  ND2D1BWP30P140 U15 ( .A1(n3), .A2(i_en), .ZN(n49) );
  OAI22D1BWP30P140 U16 ( .A1(n47), .A2(n13), .B1(n36), .B2(n63), .ZN(N287) );
  OAI22D1BWP30P140 U17 ( .A1(n35), .A2(n14), .B1(n36), .B2(n58), .ZN(N288) );
  OAI22D1BWP30P140 U18 ( .A1(n47), .A2(n15), .B1(n36), .B2(n61), .ZN(N289) );
  OAI22D1BWP30P140 U19 ( .A1(n35), .A2(n16), .B1(n36), .B2(n57), .ZN(N290) );
  OAI22D1BWP30P140 U20 ( .A1(n35), .A2(n24), .B1(n48), .B2(n59), .ZN(N291) );
  OAI22D1BWP30P140 U21 ( .A1(n35), .A2(n20), .B1(n48), .B2(n56), .ZN(N292) );
  OAI22D1BWP30P140 U22 ( .A1(n35), .A2(n32), .B1(n48), .B2(n60), .ZN(N293) );
  OAI22D1BWP30P140 U23 ( .A1(n35), .A2(n21), .B1(n48), .B2(n55), .ZN(N294) );
  OAI22D1BWP30P140 U24 ( .A1(n35), .A2(n33), .B1(n48), .B2(n69), .ZN(N298) );
  OAI22D1BWP30P140 U25 ( .A1(n35), .A2(n31), .B1(n48), .B2(n85), .ZN(N299) );
  OAI22D1BWP30P140 U26 ( .A1(n35), .A2(n30), .B1(n48), .B2(n68), .ZN(N300) );
  OAI22D1BWP30P140 U27 ( .A1(n35), .A2(n28), .B1(n48), .B2(n84), .ZN(N301) );
  OAI22D1BWP30P140 U28 ( .A1(n35), .A2(n27), .B1(n48), .B2(n83), .ZN(N302) );
  OAI22D1BWP30P140 U29 ( .A1(n35), .A2(n26), .B1(n48), .B2(n82), .ZN(N303) );
  OAI22D1BWP30P140 U30 ( .A1(n35), .A2(n25), .B1(n48), .B2(n81), .ZN(N304) );
  OAI22D1BWP30P140 U31 ( .A1(n35), .A2(n29), .B1(n48), .B2(n80), .ZN(N305) );
  OAI22D1BWP30P140 U32 ( .A1(n47), .A2(n19), .B1(n36), .B2(n79), .ZN(N306) );
  OAI22D1BWP30P140 U33 ( .A1(n35), .A2(n18), .B1(n36), .B2(n78), .ZN(N307) );
  OAI22D1BWP30P140 U34 ( .A1(n47), .A2(n9), .B1(n36), .B2(n77), .ZN(N308) );
  OAI22D1BWP30P140 U35 ( .A1(n35), .A2(n34), .B1(n48), .B2(n76), .ZN(N309) );
  OAI22D1BWP30P140 U36 ( .A1(n47), .A2(n8), .B1(n36), .B2(n75), .ZN(N310) );
  OAI22D1BWP30P140 U37 ( .A1(n47), .A2(n7), .B1(n36), .B2(n66), .ZN(N312) );
  OAI22D1BWP30P140 U38 ( .A1(n35), .A2(n23), .B1(n48), .B2(n73), .ZN(N313) );
  OAI22D1BWP30P140 U39 ( .A1(n35), .A2(n12), .B1(n36), .B2(n65), .ZN(N314) );
  OAI22D1BWP30P140 U40 ( .A1(n35), .A2(n17), .B1(n36), .B2(n91), .ZN(N316) );
  OAI22D1BWP30P140 U41 ( .A1(n35), .A2(n22), .B1(n48), .B2(n71), .ZN(N317) );
  OAI22D1BWP30P140 U42 ( .A1(n47), .A2(n10), .B1(n36), .B2(n64), .ZN(N318) );
  INVD1BWP30P140 U43 ( .I(rst), .ZN(n3) );
  INVD2BWP30P140 U44 ( .I(i_cmd[0]), .ZN(n37) );
  INVD2BWP30P140 U45 ( .I(i_valid[1]), .ZN(n50) );
  MUX2NUD1BWP30P140 U46 ( .I0(n51), .I1(n50), .S(i_cmd[1]), .ZN(n4) );
  ND2OPTIBD1BWP30P140 U47 ( .A1(n5), .A2(n4), .ZN(n6) );
  INVD2BWP30P140 U48 ( .I(n6), .ZN(n11) );
  INVD2BWP30P140 U49 ( .I(n11), .ZN(n47) );
  INVD1BWP30P140 U50 ( .I(i_data_bus[57]), .ZN(n7) );
  INVD2BWP30P140 U51 ( .I(n1), .ZN(n36) );
  INVD1BWP30P140 U52 ( .I(i_data_bus[25]), .ZN(n66) );
  INVD1BWP30P140 U53 ( .I(i_data_bus[55]), .ZN(n8) );
  INVD1BWP30P140 U54 ( .I(i_data_bus[23]), .ZN(n75) );
  INVD1BWP30P140 U55 ( .I(i_data_bus[53]), .ZN(n9) );
  INVD1BWP30P140 U56 ( .I(i_data_bus[21]), .ZN(n77) );
  INVD1BWP30P140 U57 ( .I(i_data_bus[63]), .ZN(n10) );
  INVD1BWP30P140 U58 ( .I(i_data_bus[31]), .ZN(n64) );
  INVD2BWP30P140 U59 ( .I(n11), .ZN(n35) );
  INVD1BWP30P140 U60 ( .I(i_data_bus[59]), .ZN(n12) );
  INVD1BWP30P140 U61 ( .I(i_data_bus[27]), .ZN(n65) );
  INVD1BWP30P140 U62 ( .I(i_data_bus[32]), .ZN(n13) );
  INVD1BWP30P140 U63 ( .I(i_data_bus[0]), .ZN(n63) );
  INVD1BWP30P140 U64 ( .I(i_data_bus[33]), .ZN(n14) );
  INVD1BWP30P140 U65 ( .I(i_data_bus[1]), .ZN(n58) );
  INVD1BWP30P140 U66 ( .I(i_data_bus[34]), .ZN(n15) );
  INVD1BWP30P140 U67 ( .I(i_data_bus[2]), .ZN(n61) );
  INVD1BWP30P140 U68 ( .I(i_data_bus[35]), .ZN(n16) );
  INVD1BWP30P140 U69 ( .I(i_data_bus[3]), .ZN(n57) );
  INVD1BWP30P140 U70 ( .I(i_data_bus[61]), .ZN(n17) );
  INVD1BWP30P140 U71 ( .I(i_data_bus[29]), .ZN(n91) );
  INVD1BWP30P140 U72 ( .I(i_data_bus[52]), .ZN(n18) );
  INVD1BWP30P140 U73 ( .I(i_data_bus[20]), .ZN(n78) );
  INVD1BWP30P140 U74 ( .I(i_data_bus[51]), .ZN(n19) );
  INVD1BWP30P140 U75 ( .I(i_data_bus[19]), .ZN(n79) );
  INVD1BWP30P140 U76 ( .I(i_data_bus[37]), .ZN(n20) );
  INVD1BWP30P140 U77 ( .I(i_data_bus[5]), .ZN(n56) );
  INVD1BWP30P140 U78 ( .I(i_data_bus[39]), .ZN(n21) );
  INVD1BWP30P140 U79 ( .I(i_data_bus[7]), .ZN(n55) );
  INVD1BWP30P140 U80 ( .I(i_data_bus[62]), .ZN(n22) );
  INVD1BWP30P140 U81 ( .I(i_data_bus[30]), .ZN(n71) );
  INVD1BWP30P140 U82 ( .I(i_data_bus[58]), .ZN(n23) );
  INVD1BWP30P140 U83 ( .I(i_data_bus[26]), .ZN(n73) );
  INVD1BWP30P140 U84 ( .I(i_data_bus[36]), .ZN(n24) );
  INVD1BWP30P140 U85 ( .I(i_data_bus[4]), .ZN(n59) );
  INVD1BWP30P140 U86 ( .I(i_data_bus[49]), .ZN(n25) );
  INVD1BWP30P140 U87 ( .I(i_data_bus[17]), .ZN(n81) );
  INVD1BWP30P140 U88 ( .I(i_data_bus[48]), .ZN(n26) );
  INVD1BWP30P140 U89 ( .I(i_data_bus[16]), .ZN(n82) );
  INVD1BWP30P140 U90 ( .I(i_data_bus[47]), .ZN(n27) );
  INVD1BWP30P140 U91 ( .I(i_data_bus[15]), .ZN(n83) );
  INVD1BWP30P140 U92 ( .I(i_data_bus[46]), .ZN(n28) );
  INVD1BWP30P140 U93 ( .I(i_data_bus[14]), .ZN(n84) );
  INVD1BWP30P140 U94 ( .I(i_data_bus[50]), .ZN(n29) );
  INVD1BWP30P140 U95 ( .I(i_data_bus[18]), .ZN(n80) );
  INVD1BWP30P140 U96 ( .I(i_data_bus[45]), .ZN(n30) );
  INVD1BWP30P140 U97 ( .I(i_data_bus[13]), .ZN(n68) );
  INVD1BWP30P140 U98 ( .I(i_data_bus[44]), .ZN(n31) );
  INVD1BWP30P140 U99 ( .I(i_data_bus[12]), .ZN(n85) );
  INVD1BWP30P140 U100 ( .I(i_data_bus[38]), .ZN(n32) );
  INVD1BWP30P140 U101 ( .I(i_data_bus[6]), .ZN(n60) );
  INVD1BWP30P140 U102 ( .I(i_data_bus[43]), .ZN(n33) );
  INVD1BWP30P140 U103 ( .I(i_data_bus[11]), .ZN(n69) );
  INVD1BWP30P140 U104 ( .I(i_data_bus[54]), .ZN(n34) );
  INVD1BWP30P140 U105 ( .I(i_data_bus[22]), .ZN(n76) );
  OAI31D1BWP30P140 U106 ( .A1(n49), .A2(n50), .A3(n37), .B(n36), .ZN(N353) );
  INVD1BWP30P140 U107 ( .I(n38), .ZN(n41) );
  INVD1BWP30P140 U108 ( .I(n49), .ZN(n39) );
  INVD1BWP30P140 U109 ( .I(n89), .ZN(n40) );
  OAI21D1BWP30P140 U110 ( .A1(n41), .A2(i_cmd[1]), .B(n40), .ZN(N354) );
  INVD1BWP30P140 U111 ( .I(i_data_bus[10]), .ZN(n86) );
  INVD1BWP30P140 U112 ( .I(i_data_bus[42]), .ZN(n42) );
  OAI22D1BWP30P140 U113 ( .A1(n48), .A2(n86), .B1(n47), .B2(n42), .ZN(N297) );
  INVD1BWP30P140 U114 ( .I(i_data_bus[9]), .ZN(n70) );
  INVD1BWP30P140 U115 ( .I(i_data_bus[41]), .ZN(n43) );
  OAI22D1BWP30P140 U116 ( .A1(n48), .A2(n70), .B1(n47), .B2(n43), .ZN(N296) );
  INVD1BWP30P140 U117 ( .I(i_data_bus[8]), .ZN(n88) );
  INVD1BWP30P140 U118 ( .I(i_data_bus[40]), .ZN(n44) );
  OAI22D1BWP30P140 U119 ( .A1(n48), .A2(n88), .B1(n47), .B2(n44), .ZN(N295) );
  INVD1BWP30P140 U120 ( .I(i_data_bus[28]), .ZN(n72) );
  INVD1BWP30P140 U121 ( .I(i_data_bus[60]), .ZN(n45) );
  OAI22D1BWP30P140 U122 ( .A1(n48), .A2(n72), .B1(n47), .B2(n45), .ZN(N315) );
  INVD1BWP30P140 U123 ( .I(i_data_bus[24]), .ZN(n74) );
  INVD1BWP30P140 U124 ( .I(i_data_bus[56]), .ZN(n46) );
  OAI22D1BWP30P140 U125 ( .A1(n36), .A2(n74), .B1(n47), .B2(n46), .ZN(N311) );
  MUX2NUD1BWP30P140 U126 ( .I0(n51), .I1(n50), .S(i_cmd[0]), .ZN(n52) );
  ND2OPTIBD1BWP30P140 U127 ( .A1(n53), .A2(n52), .ZN(n54) );
  MOAI22D1BWP30P140 U128 ( .A1(n55), .A2(n87), .B1(i_data_bus[39]), .B2(n89), 
        .ZN(N326) );
  MOAI22D1BWP30P140 U129 ( .A1(n56), .A2(n90), .B1(i_data_bus[37]), .B2(n89), 
        .ZN(N324) );
  MOAI22D1BWP30P140 U130 ( .A1(n57), .A2(n62), .B1(i_data_bus[35]), .B2(n89), 
        .ZN(N322) );
  MOAI22D1BWP30P140 U131 ( .A1(n58), .A2(n2), .B1(i_data_bus[33]), .B2(n89), 
        .ZN(N320) );
  MOAI22D1BWP30P140 U132 ( .A1(n59), .A2(n87), .B1(i_data_bus[36]), .B2(n89), 
        .ZN(N323) );
  MOAI22D1BWP30P140 U133 ( .A1(n60), .A2(n90), .B1(i_data_bus[38]), .B2(n89), 
        .ZN(N325) );
  MOAI22D1BWP30P140 U134 ( .A1(n61), .A2(n62), .B1(i_data_bus[34]), .B2(n89), 
        .ZN(N321) );
  MOAI22D1BWP30P140 U135 ( .A1(n63), .A2(n2), .B1(i_data_bus[32]), .B2(n89), 
        .ZN(N319) );
  MOAI22D1BWP30P140 U136 ( .A1(n64), .A2(n87), .B1(i_data_bus[63]), .B2(n89), 
        .ZN(N350) );
  MOAI22D1BWP30P140 U137 ( .A1(n65), .A2(n90), .B1(i_data_bus[59]), .B2(n89), 
        .ZN(N346) );
  MOAI22D1BWP30P140 U138 ( .A1(n66), .A2(n62), .B1(i_data_bus[57]), .B2(n89), 
        .ZN(N344) );
  MOAI22D1BWP30P140 U139 ( .A1(n68), .A2(n87), .B1(i_data_bus[45]), .B2(n89), 
        .ZN(N332) );
  MOAI22D1BWP30P140 U140 ( .A1(n69), .A2(n90), .B1(i_data_bus[43]), .B2(n89), 
        .ZN(N330) );
  MOAI22D1BWP30P140 U141 ( .A1(n70), .A2(n62), .B1(i_data_bus[41]), .B2(n89), 
        .ZN(N328) );
  MOAI22D1BWP30P140 U142 ( .A1(n71), .A2(n2), .B1(i_data_bus[62]), .B2(n89), 
        .ZN(N349) );
  MOAI22D1BWP30P140 U143 ( .A1(n72), .A2(n87), .B1(i_data_bus[60]), .B2(n89), 
        .ZN(N347) );
  MOAI22D1BWP30P140 U144 ( .A1(n73), .A2(n90), .B1(i_data_bus[58]), .B2(n89), 
        .ZN(N345) );
  MOAI22D1BWP30P140 U145 ( .A1(n74), .A2(n62), .B1(i_data_bus[56]), .B2(n89), 
        .ZN(N343) );
  MOAI22D1BWP30P140 U146 ( .A1(n75), .A2(n2), .B1(i_data_bus[55]), .B2(n89), 
        .ZN(N342) );
  MOAI22D1BWP30P140 U147 ( .A1(n76), .A2(n87), .B1(i_data_bus[54]), .B2(n89), 
        .ZN(N341) );
  MOAI22D1BWP30P140 U148 ( .A1(n77), .A2(n90), .B1(i_data_bus[53]), .B2(n89), 
        .ZN(N340) );
  MOAI22D1BWP30P140 U149 ( .A1(n78), .A2(n62), .B1(i_data_bus[52]), .B2(n89), 
        .ZN(N339) );
  MOAI22D1BWP30P140 U150 ( .A1(n79), .A2(n2), .B1(i_data_bus[51]), .B2(n89), 
        .ZN(N338) );
  MOAI22D1BWP30P140 U151 ( .A1(n80), .A2(n87), .B1(i_data_bus[50]), .B2(n89), 
        .ZN(N337) );
  MOAI22D1BWP30P140 U152 ( .A1(n81), .A2(n90), .B1(i_data_bus[49]), .B2(n89), 
        .ZN(N336) );
  MOAI22D1BWP30P140 U153 ( .A1(n82), .A2(n62), .B1(i_data_bus[48]), .B2(n89), 
        .ZN(N335) );
  MOAI22D1BWP30P140 U154 ( .A1(n83), .A2(n2), .B1(i_data_bus[47]), .B2(n89), 
        .ZN(N334) );
  MOAI22D1BWP30P140 U155 ( .A1(n84), .A2(n87), .B1(i_data_bus[46]), .B2(n89), 
        .ZN(N333) );
  MOAI22D1BWP30P140 U156 ( .A1(n85), .A2(n90), .B1(i_data_bus[44]), .B2(n89), 
        .ZN(N331) );
  MOAI22D1BWP30P140 U157 ( .A1(n86), .A2(n62), .B1(i_data_bus[42]), .B2(n89), 
        .ZN(N329) );
  MOAI22D1BWP30P140 U158 ( .A1(n88), .A2(n2), .B1(i_data_bus[40]), .B2(n89), 
        .ZN(N327) );
  MOAI22D1BWP30P140 U159 ( .A1(n91), .A2(n2), .B1(i_data_bus[61]), .B2(n89), 
        .ZN(N348) );
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
         n73, n74, n75, n76, n77, n78, n79, n80, n81, n82, n83, n84, n85, n86,
         n87, n88, n89, n90, n91;

  DFQD4BWP30P140 o_valid_inner_reg_0_ ( .D(N353), .CP(clk), .Q(o_valid[0]) );
  DFQD4BWP30P140 o_data_bus_inner_reg_63_ ( .D(N350), .CP(clk), .Q(
        o_data_bus[63]) );
  DFQD4BWP30P140 o_data_bus_inner_reg_62_ ( .D(N349), .CP(clk), .Q(
        o_data_bus[62]) );
  DFQD4BWP30P140 o_data_bus_inner_reg_61_ ( .D(N348), .CP(clk), .Q(
        o_data_bus[61]) );
  DFQD4BWP30P140 o_data_bus_inner_reg_60_ ( .D(N347), .CP(clk), .Q(
        o_data_bus[60]) );
  DFQD4BWP30P140 o_data_bus_inner_reg_59_ ( .D(N346), .CP(clk), .Q(
        o_data_bus[59]) );
  DFQD4BWP30P140 o_data_bus_inner_reg_58_ ( .D(N345), .CP(clk), .Q(
        o_data_bus[58]) );
  DFQD4BWP30P140 o_data_bus_inner_reg_57_ ( .D(N344), .CP(clk), .Q(
        o_data_bus[57]) );
  DFQD4BWP30P140 o_data_bus_inner_reg_56_ ( .D(N343), .CP(clk), .Q(
        o_data_bus[56]) );
  DFQD4BWP30P140 o_data_bus_inner_reg_55_ ( .D(N342), .CP(clk), .Q(
        o_data_bus[55]) );
  DFQD4BWP30P140 o_data_bus_inner_reg_54_ ( .D(N341), .CP(clk), .Q(
        o_data_bus[54]) );
  DFQD4BWP30P140 o_data_bus_inner_reg_53_ ( .D(N340), .CP(clk), .Q(
        o_data_bus[53]) );
  DFQD4BWP30P140 o_data_bus_inner_reg_52_ ( .D(N339), .CP(clk), .Q(
        o_data_bus[52]) );
  DFQD4BWP30P140 o_data_bus_inner_reg_51_ ( .D(N338), .CP(clk), .Q(
        o_data_bus[51]) );
  DFQD4BWP30P140 o_data_bus_inner_reg_50_ ( .D(N337), .CP(clk), .Q(
        o_data_bus[50]) );
  DFQD4BWP30P140 o_data_bus_inner_reg_49_ ( .D(N336), .CP(clk), .Q(
        o_data_bus[49]) );
  DFQD4BWP30P140 o_data_bus_inner_reg_48_ ( .D(N335), .CP(clk), .Q(
        o_data_bus[48]) );
  DFQD4BWP30P140 o_data_bus_inner_reg_47_ ( .D(N334), .CP(clk), .Q(
        o_data_bus[47]) );
  DFQD4BWP30P140 o_data_bus_inner_reg_46_ ( .D(N333), .CP(clk), .Q(
        o_data_bus[46]) );
  DFQD4BWP30P140 o_data_bus_inner_reg_45_ ( .D(N332), .CP(clk), .Q(
        o_data_bus[45]) );
  DFQD4BWP30P140 o_data_bus_inner_reg_44_ ( .D(N331), .CP(clk), .Q(
        o_data_bus[44]) );
  DFQD4BWP30P140 o_data_bus_inner_reg_43_ ( .D(N330), .CP(clk), .Q(
        o_data_bus[43]) );
  DFQD4BWP30P140 o_data_bus_inner_reg_42_ ( .D(N329), .CP(clk), .Q(
        o_data_bus[42]) );
  DFQD4BWP30P140 o_data_bus_inner_reg_41_ ( .D(N328), .CP(clk), .Q(
        o_data_bus[41]) );
  DFQD4BWP30P140 o_data_bus_inner_reg_40_ ( .D(N327), .CP(clk), .Q(
        o_data_bus[40]) );
  DFQD4BWP30P140 o_data_bus_inner_reg_39_ ( .D(N326), .CP(clk), .Q(
        o_data_bus[39]) );
  DFQD4BWP30P140 o_data_bus_inner_reg_38_ ( .D(N325), .CP(clk), .Q(
        o_data_bus[38]) );
  DFQD4BWP30P140 o_data_bus_inner_reg_37_ ( .D(N324), .CP(clk), .Q(
        o_data_bus[37]) );
  DFQD4BWP30P140 o_data_bus_inner_reg_36_ ( .D(N323), .CP(clk), .Q(
        o_data_bus[36]) );
  DFQD4BWP30P140 o_data_bus_inner_reg_35_ ( .D(N322), .CP(clk), .Q(
        o_data_bus[35]) );
  DFQD4BWP30P140 o_data_bus_inner_reg_34_ ( .D(N321), .CP(clk), .Q(
        o_data_bus[34]) );
  DFQD4BWP30P140 o_data_bus_inner_reg_33_ ( .D(N320), .CP(clk), .Q(
        o_data_bus[33]) );
  DFQD4BWP30P140 o_data_bus_inner_reg_32_ ( .D(N319), .CP(clk), .Q(
        o_data_bus[32]) );
  DFQD4BWP30P140 o_data_bus_inner_reg_31_ ( .D(N318), .CP(clk), .Q(
        o_data_bus[31]) );
  DFQD4BWP30P140 o_data_bus_inner_reg_30_ ( .D(N317), .CP(clk), .Q(
        o_data_bus[30]) );
  DFQD4BWP30P140 o_data_bus_inner_reg_29_ ( .D(N316), .CP(clk), .Q(
        o_data_bus[29]) );
  DFQD4BWP30P140 o_data_bus_inner_reg_28_ ( .D(N315), .CP(clk), .Q(
        o_data_bus[28]) );
  DFQD4BWP30P140 o_data_bus_inner_reg_27_ ( .D(N314), .CP(clk), .Q(
        o_data_bus[27]) );
  DFQD4BWP30P140 o_data_bus_inner_reg_26_ ( .D(N313), .CP(clk), .Q(
        o_data_bus[26]) );
  DFQD4BWP30P140 o_data_bus_inner_reg_25_ ( .D(N312), .CP(clk), .Q(
        o_data_bus[25]) );
  DFQD4BWP30P140 o_data_bus_inner_reg_24_ ( .D(N311), .CP(clk), .Q(
        o_data_bus[24]) );
  DFQD4BWP30P140 o_data_bus_inner_reg_23_ ( .D(N310), .CP(clk), .Q(
        o_data_bus[23]) );
  DFQD4BWP30P140 o_data_bus_inner_reg_22_ ( .D(N309), .CP(clk), .Q(
        o_data_bus[22]) );
  DFQD4BWP30P140 o_data_bus_inner_reg_21_ ( .D(N308), .CP(clk), .Q(
        o_data_bus[21]) );
  DFQD4BWP30P140 o_data_bus_inner_reg_20_ ( .D(N307), .CP(clk), .Q(
        o_data_bus[20]) );
  DFQD4BWP30P140 o_data_bus_inner_reg_19_ ( .D(N306), .CP(clk), .Q(
        o_data_bus[19]) );
  DFQD4BWP30P140 o_data_bus_inner_reg_18_ ( .D(N305), .CP(clk), .Q(
        o_data_bus[18]) );
  DFQD4BWP30P140 o_data_bus_inner_reg_17_ ( .D(N304), .CP(clk), .Q(
        o_data_bus[17]) );
  DFQD4BWP30P140 o_data_bus_inner_reg_16_ ( .D(N303), .CP(clk), .Q(
        o_data_bus[16]) );
  DFQD4BWP30P140 o_data_bus_inner_reg_15_ ( .D(N302), .CP(clk), .Q(
        o_data_bus[15]) );
  DFQD4BWP30P140 o_data_bus_inner_reg_14_ ( .D(N301), .CP(clk), .Q(
        o_data_bus[14]) );
  DFQD4BWP30P140 o_data_bus_inner_reg_13_ ( .D(N300), .CP(clk), .Q(
        o_data_bus[13]) );
  DFQD4BWP30P140 o_data_bus_inner_reg_12_ ( .D(N299), .CP(clk), .Q(
        o_data_bus[12]) );
  DFQD4BWP30P140 o_data_bus_inner_reg_11_ ( .D(N298), .CP(clk), .Q(
        o_data_bus[11]) );
  DFQD4BWP30P140 o_data_bus_inner_reg_9_ ( .D(N296), .CP(clk), .Q(
        o_data_bus[9]) );
  DFQD4BWP30P140 o_data_bus_inner_reg_8_ ( .D(N295), .CP(clk), .Q(
        o_data_bus[8]) );
  DFQD4BWP30P140 o_data_bus_inner_reg_7_ ( .D(N294), .CP(clk), .Q(
        o_data_bus[7]) );
  DFQD4BWP30P140 o_data_bus_inner_reg_6_ ( .D(N293), .CP(clk), .Q(
        o_data_bus[6]) );
  DFQD4BWP30P140 o_data_bus_inner_reg_5_ ( .D(N292), .CP(clk), .Q(
        o_data_bus[5]) );
  DFQD4BWP30P140 o_data_bus_inner_reg_4_ ( .D(N291), .CP(clk), .Q(
        o_data_bus[4]) );
  DFQD4BWP30P140 o_data_bus_inner_reg_3_ ( .D(N290), .CP(clk), .Q(
        o_data_bus[3]) );
  DFQD4BWP30P140 o_data_bus_inner_reg_2_ ( .D(N289), .CP(clk), .Q(
        o_data_bus[2]) );
  DFQD4BWP30P140 o_data_bus_inner_reg_1_ ( .D(N288), .CP(clk), .Q(
        o_data_bus[1]) );
  DFQD4BWP30P140 o_data_bus_inner_reg_0_ ( .D(N287), .CP(clk), .Q(
        o_data_bus[0]) );
  DFQD4BWP30P140 o_data_bus_inner_reg_10_ ( .D(N297), .CP(clk), .Q(
        o_data_bus[10]) );
  DFQD4BWP30P140 o_valid_inner_reg_1_ ( .D(N354), .CP(clk), .Q(o_valid[1]) );
  AN3D4BWP30P140 U3 ( .A1(i_valid[1]), .A2(i_cmd[1]), .A3(n44), .Z(n89) );
  NR2D1BWP30P140 U4 ( .A1(n49), .A2(i_cmd[1]), .ZN(n53) );
  INVD1BWP30P140 U5 ( .I(n68), .ZN(n1) );
  CKND2D2BWP30P140 U6 ( .A1(n43), .A2(n42), .ZN(n2) );
  INR2D2BWP30P140 U7 ( .A1(i_valid[0]), .B1(n49), .ZN(n43) );
  CKND2D2BWP30P140 U8 ( .A1(n43), .A2(n42), .ZN(n4) );
  CKND2D2BWP30P140 U9 ( .A1(n43), .A2(n42), .ZN(n3) );
  INVD2BWP30P140 U10 ( .I(i_valid[0]), .ZN(n51) );
  INVD1BWP30P140 U11 ( .I(n68), .ZN(n62) );
  INVD1BWP30P140 U12 ( .I(n68), .ZN(n90) );
  INVD1BWP30P140 U13 ( .I(n68), .ZN(n79) );
  ND2D1BWP30P140 U14 ( .A1(n5), .A2(i_en), .ZN(n49) );
  OAI22D1BWP30P140 U15 ( .A1(n41), .A2(n33), .B1(n4), .B2(n63), .ZN(N288) );
  OAI22D1BWP30P140 U16 ( .A1(n41), .A2(n32), .B1(n2), .B2(n61), .ZN(N290) );
  OAI22D1BWP30P140 U17 ( .A1(n41), .A2(n35), .B1(n4), .B2(n60), .ZN(N292) );
  OAI22D1BWP30P140 U18 ( .A1(n41), .A2(n34), .B1(n2), .B2(n59), .ZN(N294) );
  OAI22D1BWP30P140 U19 ( .A1(n41), .A2(n29), .B1(n4), .B2(n80), .ZN(N307) );
  OAI22D1BWP30P140 U20 ( .A1(n41), .A2(n28), .B1(n2), .B2(n78), .ZN(N308) );
  OAI22D1BWP30P140 U21 ( .A1(n41), .A2(n38), .B1(n3), .B2(n77), .ZN(N309) );
  OAI22D1BWP30P140 U22 ( .A1(n41), .A2(n27), .B1(n4), .B2(n76), .ZN(N310) );
  OAI22D1BWP30P140 U23 ( .A1(n41), .A2(n40), .B1(n3), .B2(n75), .ZN(N311) );
  OAI22D1BWP30P140 U24 ( .A1(n41), .A2(n31), .B1(n2), .B2(n67), .ZN(N312) );
  OAI22D1BWP30P140 U25 ( .A1(n41), .A2(n36), .B1(n4), .B2(n74), .ZN(N313) );
  OAI22D1BWP30P140 U26 ( .A1(n41), .A2(n30), .B1(n2), .B2(n66), .ZN(N314) );
  OAI22D1BWP30P140 U27 ( .A1(n41), .A2(n39), .B1(n3), .B2(n73), .ZN(N315) );
  OAI22D1BWP30P140 U28 ( .A1(n41), .A2(n25), .B1(n4), .B2(n65), .ZN(N316) );
  OAI22D1BWP30P140 U29 ( .A1(n41), .A2(n37), .B1(n2), .B2(n72), .ZN(N317) );
  OAI22D1BWP30P140 U30 ( .A1(n41), .A2(n26), .B1(n4), .B2(n64), .ZN(N318) );
  INVD1BWP30P140 U31 ( .I(rst), .ZN(n5) );
  INVD2BWP30P140 U32 ( .I(i_cmd[0]), .ZN(n42) );
  NR2OPTPAD1BWP30P140 U33 ( .A1(n49), .A2(n42), .ZN(n7) );
  INVD2BWP30P140 U34 ( .I(i_valid[1]), .ZN(n50) );
  MUX2NUD1BWP30P140 U35 ( .I0(n51), .I1(n50), .S(i_cmd[1]), .ZN(n6) );
  ND2OPTIBD1BWP30P140 U36 ( .A1(n7), .A2(n6), .ZN(n8) );
  INVD2BWP30P140 U37 ( .I(n8), .ZN(n24) );
  INVD2BWP30P140 U38 ( .I(n24), .ZN(n48) );
  INVD1BWP30P140 U39 ( .I(i_data_bus[45]), .ZN(n9) );
  INVD1BWP30P140 U40 ( .I(i_data_bus[13]), .ZN(n69) );
  OAI22D1BWP30P140 U41 ( .A1(n48), .A2(n9), .B1(n3), .B2(n69), .ZN(N300) );
  INVD1BWP30P140 U42 ( .I(i_data_bus[40]), .ZN(n10) );
  INVD1BWP30P140 U43 ( .I(i_data_bus[8]), .ZN(n91) );
  OAI22D1BWP30P140 U44 ( .A1(n48), .A2(n10), .B1(n2), .B2(n91), .ZN(N295) );
  INVD1BWP30P140 U45 ( .I(i_data_bus[46]), .ZN(n11) );
  INVD1BWP30P140 U46 ( .I(i_data_bus[14]), .ZN(n86) );
  OAI22D1BWP30P140 U47 ( .A1(n48), .A2(n11), .B1(n3), .B2(n86), .ZN(N301) );
  INVD1BWP30P140 U48 ( .I(i_data_bus[41]), .ZN(n12) );
  INVD1BWP30P140 U49 ( .I(i_data_bus[9]), .ZN(n71) );
  OAI22D1BWP30P140 U50 ( .A1(n48), .A2(n12), .B1(n4), .B2(n71), .ZN(N296) );
  INVD1BWP30P140 U51 ( .I(i_data_bus[47]), .ZN(n13) );
  INVD1BWP30P140 U52 ( .I(i_data_bus[15]), .ZN(n85) );
  OAI22D1BWP30P140 U53 ( .A1(n48), .A2(n13), .B1(n3), .B2(n85), .ZN(N302) );
  INVD1BWP30P140 U54 ( .I(i_data_bus[43]), .ZN(n14) );
  INVD1BWP30P140 U55 ( .I(i_data_bus[11]), .ZN(n70) );
  OAI22D1BWP30P140 U56 ( .A1(n48), .A2(n14), .B1(n2), .B2(n70), .ZN(N298) );
  INVD1BWP30P140 U57 ( .I(i_data_bus[50]), .ZN(n15) );
  INVD1BWP30P140 U58 ( .I(i_data_bus[18]), .ZN(n82) );
  OAI22D1BWP30P140 U59 ( .A1(n48), .A2(n15), .B1(n3), .B2(n82), .ZN(N305) );
  INVD1BWP30P140 U60 ( .I(i_data_bus[48]), .ZN(n16) );
  INVD1BWP30P140 U61 ( .I(i_data_bus[16]), .ZN(n84) );
  OAI22D1BWP30P140 U62 ( .A1(n48), .A2(n16), .B1(n4), .B2(n84), .ZN(N303) );
  INVD1BWP30P140 U63 ( .I(i_data_bus[49]), .ZN(n17) );
  INVD1BWP30P140 U64 ( .I(i_data_bus[17]), .ZN(n83) );
  OAI22D1BWP30P140 U65 ( .A1(n48), .A2(n17), .B1(n3), .B2(n83), .ZN(N304) );
  INVD1BWP30P140 U66 ( .I(i_data_bus[36]), .ZN(n18) );
  INVD1BWP30P140 U67 ( .I(i_data_bus[4]), .ZN(n58) );
  OAI22D1BWP30P140 U68 ( .A1(n48), .A2(n18), .B1(n2), .B2(n58), .ZN(N291) );
  INVD1BWP30P140 U69 ( .I(i_data_bus[44]), .ZN(n19) );
  INVD1BWP30P140 U70 ( .I(i_data_bus[12]), .ZN(n87) );
  OAI22D1BWP30P140 U71 ( .A1(n48), .A2(n19), .B1(n3), .B2(n87), .ZN(N299) );
  INVD1BWP30P140 U72 ( .I(i_data_bus[38]), .ZN(n20) );
  INVD1BWP30P140 U73 ( .I(i_data_bus[6]), .ZN(n55) );
  OAI22D1BWP30P140 U74 ( .A1(n48), .A2(n20), .B1(n4), .B2(n55), .ZN(N293) );
  INVD1BWP30P140 U75 ( .I(i_data_bus[34]), .ZN(n21) );
  INVD1BWP30P140 U76 ( .I(i_data_bus[2]), .ZN(n56) );
  OAI22D1BWP30P140 U77 ( .A1(n48), .A2(n21), .B1(n3), .B2(n56), .ZN(N289) );
  INVD1BWP30P140 U78 ( .I(i_data_bus[51]), .ZN(n22) );
  INVD1BWP30P140 U79 ( .I(i_data_bus[19]), .ZN(n81) );
  OAI22D1BWP30P140 U80 ( .A1(n48), .A2(n22), .B1(n2), .B2(n81), .ZN(N306) );
  INVD1BWP30P140 U81 ( .I(i_data_bus[32]), .ZN(n23) );
  INVD1BWP30P140 U82 ( .I(i_data_bus[0]), .ZN(n57) );
  OAI22D1BWP30P140 U83 ( .A1(n48), .A2(n23), .B1(n3), .B2(n57), .ZN(N287) );
  INVD2BWP30P140 U84 ( .I(n24), .ZN(n41) );
  INVD1BWP30P140 U85 ( .I(i_data_bus[61]), .ZN(n25) );
  INVD1BWP30P140 U86 ( .I(i_data_bus[29]), .ZN(n65) );
  INVD1BWP30P140 U87 ( .I(i_data_bus[63]), .ZN(n26) );
  INVD1BWP30P140 U88 ( .I(i_data_bus[31]), .ZN(n64) );
  INVD1BWP30P140 U89 ( .I(i_data_bus[55]), .ZN(n27) );
  INVD1BWP30P140 U90 ( .I(i_data_bus[23]), .ZN(n76) );
  INVD1BWP30P140 U91 ( .I(i_data_bus[53]), .ZN(n28) );
  INVD1BWP30P140 U92 ( .I(i_data_bus[21]), .ZN(n78) );
  INVD1BWP30P140 U93 ( .I(i_data_bus[52]), .ZN(n29) );
  INVD1BWP30P140 U94 ( .I(i_data_bus[20]), .ZN(n80) );
  INVD1BWP30P140 U95 ( .I(i_data_bus[59]), .ZN(n30) );
  INVD1BWP30P140 U96 ( .I(i_data_bus[27]), .ZN(n66) );
  INVD1BWP30P140 U97 ( .I(i_data_bus[57]), .ZN(n31) );
  INVD1BWP30P140 U98 ( .I(i_data_bus[25]), .ZN(n67) );
  INVD1BWP30P140 U99 ( .I(i_data_bus[35]), .ZN(n32) );
  INVD1BWP30P140 U100 ( .I(i_data_bus[3]), .ZN(n61) );
  INVD1BWP30P140 U101 ( .I(i_data_bus[33]), .ZN(n33) );
  INVD1BWP30P140 U102 ( .I(i_data_bus[1]), .ZN(n63) );
  INVD1BWP30P140 U103 ( .I(i_data_bus[39]), .ZN(n34) );
  INVD1BWP30P140 U104 ( .I(i_data_bus[7]), .ZN(n59) );
  INVD1BWP30P140 U105 ( .I(i_data_bus[37]), .ZN(n35) );
  INVD1BWP30P140 U106 ( .I(i_data_bus[5]), .ZN(n60) );
  INVD1BWP30P140 U107 ( .I(i_data_bus[58]), .ZN(n36) );
  INVD1BWP30P140 U108 ( .I(i_data_bus[26]), .ZN(n74) );
  INVD1BWP30P140 U109 ( .I(i_data_bus[62]), .ZN(n37) );
  INVD1BWP30P140 U110 ( .I(i_data_bus[30]), .ZN(n72) );
  INVD1BWP30P140 U111 ( .I(i_data_bus[54]), .ZN(n38) );
  INVD1BWP30P140 U112 ( .I(i_data_bus[22]), .ZN(n77) );
  INVD1BWP30P140 U113 ( .I(i_data_bus[60]), .ZN(n39) );
  INVD1BWP30P140 U114 ( .I(i_data_bus[28]), .ZN(n73) );
  INVD1BWP30P140 U115 ( .I(i_data_bus[56]), .ZN(n40) );
  INVD1BWP30P140 U116 ( .I(i_data_bus[24]), .ZN(n75) );
  OAI31D1BWP30P140 U117 ( .A1(n49), .A2(n50), .A3(n42), .B(n2), .ZN(N353) );
  INVD1BWP30P140 U118 ( .I(n43), .ZN(n46) );
  INVD1BWP30P140 U119 ( .I(n49), .ZN(n44) );
  INVD1BWP30P140 U120 ( .I(n89), .ZN(n45) );
  OAI21D1BWP30P140 U121 ( .A1(n46), .A2(i_cmd[1]), .B(n45), .ZN(N354) );
  INVD1BWP30P140 U122 ( .I(i_data_bus[10]), .ZN(n88) );
  INVD1BWP30P140 U123 ( .I(i_data_bus[42]), .ZN(n47) );
  OAI22D1BWP30P140 U124 ( .A1(n4), .A2(n88), .B1(n48), .B2(n47), .ZN(N297) );
  MUX2NUD1BWP30P140 U125 ( .I0(n51), .I1(n50), .S(i_cmd[0]), .ZN(n52) );
  ND2OPTIBD1BWP30P140 U126 ( .A1(n53), .A2(n52), .ZN(n54) );
  INVD2BWP30P140 U127 ( .I(n54), .ZN(n68) );
  MOAI22D1BWP30P140 U128 ( .A1(n55), .A2(n90), .B1(i_data_bus[38]), .B2(n89), 
        .ZN(N325) );
  MOAI22D1BWP30P140 U129 ( .A1(n56), .A2(n79), .B1(i_data_bus[34]), .B2(n89), 
        .ZN(N321) );
  MOAI22D1BWP30P140 U130 ( .A1(n57), .A2(n62), .B1(i_data_bus[32]), .B2(n89), 
        .ZN(N319) );
  MOAI22D1BWP30P140 U131 ( .A1(n58), .A2(n1), .B1(i_data_bus[36]), .B2(n89), 
        .ZN(N323) );
  MOAI22D1BWP30P140 U132 ( .A1(n59), .A2(n90), .B1(i_data_bus[39]), .B2(n89), 
        .ZN(N326) );
  MOAI22D1BWP30P140 U133 ( .A1(n60), .A2(n79), .B1(i_data_bus[37]), .B2(n89), 
        .ZN(N324) );
  MOAI22D1BWP30P140 U134 ( .A1(n61), .A2(n62), .B1(i_data_bus[35]), .B2(n89), 
        .ZN(N322) );
  MOAI22D1BWP30P140 U135 ( .A1(n63), .A2(n1), .B1(i_data_bus[33]), .B2(n89), 
        .ZN(N320) );
  MOAI22D1BWP30P140 U136 ( .A1(n64), .A2(n90), .B1(i_data_bus[63]), .B2(n89), 
        .ZN(N350) );
  MOAI22D1BWP30P140 U137 ( .A1(n65), .A2(n79), .B1(i_data_bus[61]), .B2(n89), 
        .ZN(N348) );
  MOAI22D1BWP30P140 U138 ( .A1(n66), .A2(n62), .B1(i_data_bus[59]), .B2(n89), 
        .ZN(N346) );
  MOAI22D1BWP30P140 U139 ( .A1(n67), .A2(n1), .B1(i_data_bus[57]), .B2(n89), 
        .ZN(N344) );
  MOAI22D1BWP30P140 U140 ( .A1(n69), .A2(n90), .B1(i_data_bus[45]), .B2(n89), 
        .ZN(N332) );
  MOAI22D1BWP30P140 U141 ( .A1(n70), .A2(n79), .B1(i_data_bus[43]), .B2(n89), 
        .ZN(N330) );
  MOAI22D1BWP30P140 U142 ( .A1(n71), .A2(n62), .B1(i_data_bus[41]), .B2(n89), 
        .ZN(N328) );
  MOAI22D1BWP30P140 U143 ( .A1(n72), .A2(n90), .B1(i_data_bus[62]), .B2(n89), 
        .ZN(N349) );
  MOAI22D1BWP30P140 U144 ( .A1(n73), .A2(n79), .B1(i_data_bus[60]), .B2(n89), 
        .ZN(N347) );
  MOAI22D1BWP30P140 U145 ( .A1(n74), .A2(n62), .B1(i_data_bus[58]), .B2(n89), 
        .ZN(N345) );
  MOAI22D1BWP30P140 U146 ( .A1(n75), .A2(n1), .B1(i_data_bus[56]), .B2(n89), 
        .ZN(N343) );
  MOAI22D1BWP30P140 U147 ( .A1(n76), .A2(n90), .B1(i_data_bus[55]), .B2(n89), 
        .ZN(N342) );
  MOAI22D1BWP30P140 U148 ( .A1(n77), .A2(n79), .B1(i_data_bus[54]), .B2(n89), 
        .ZN(N341) );
  MOAI22D1BWP30P140 U149 ( .A1(n78), .A2(n62), .B1(i_data_bus[53]), .B2(n89), 
        .ZN(N340) );
  MOAI22D1BWP30P140 U150 ( .A1(n80), .A2(n1), .B1(i_data_bus[52]), .B2(n89), 
        .ZN(N339) );
  MOAI22D1BWP30P140 U151 ( .A1(n81), .A2(n1), .B1(i_data_bus[51]), .B2(n89), 
        .ZN(N338) );
  MOAI22D1BWP30P140 U152 ( .A1(n82), .A2(n90), .B1(i_data_bus[50]), .B2(n89), 
        .ZN(N337) );
  MOAI22D1BWP30P140 U153 ( .A1(n83), .A2(n79), .B1(i_data_bus[49]), .B2(n89), 
        .ZN(N336) );
  MOAI22D1BWP30P140 U154 ( .A1(n84), .A2(n62), .B1(i_data_bus[48]), .B2(n89), 
        .ZN(N335) );
  MOAI22D1BWP30P140 U155 ( .A1(n85), .A2(n1), .B1(i_data_bus[47]), .B2(n89), 
        .ZN(N334) );
  MOAI22D1BWP30P140 U156 ( .A1(n86), .A2(n90), .B1(i_data_bus[46]), .B2(n89), 
        .ZN(N333) );
  MOAI22D1BWP30P140 U157 ( .A1(n87), .A2(n79), .B1(i_data_bus[44]), .B2(n89), 
        .ZN(N331) );
  MOAI22D1BWP30P140 U158 ( .A1(n88), .A2(n62), .B1(i_data_bus[42]), .B2(n89), 
        .ZN(N329) );
  MOAI22D1BWP30P140 U159 ( .A1(n91), .A2(n1), .B1(i_data_bus[40]), .B2(n89), 
        .ZN(N327) );
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
         n73, n74, n75, n76, n77, n78, n79, n80, n81, n82, n83, n84, n85, n86,
         n87, n88, n89, n90;

  DFQD4BWP30P140 o_valid_inner_reg_0_ ( .D(N353), .CP(clk), .Q(o_valid[0]) );
  DFQD4BWP30P140 o_data_bus_inner_reg_63_ ( .D(N350), .CP(clk), .Q(
        o_data_bus[63]) );
  DFQD4BWP30P140 o_data_bus_inner_reg_61_ ( .D(N348), .CP(clk), .Q(
        o_data_bus[61]) );
  DFQD4BWP30P140 o_data_bus_inner_reg_59_ ( .D(N346), .CP(clk), .Q(
        o_data_bus[59]) );
  DFQD4BWP30P140 o_data_bus_inner_reg_57_ ( .D(N344), .CP(clk), .Q(
        o_data_bus[57]) );
  DFQD4BWP30P140 o_data_bus_inner_reg_45_ ( .D(N332), .CP(clk), .Q(
        o_data_bus[45]) );
  DFQD4BWP30P140 o_data_bus_inner_reg_43_ ( .D(N330), .CP(clk), .Q(
        o_data_bus[43]) );
  DFQD4BWP30P140 o_data_bus_inner_reg_41_ ( .D(N328), .CP(clk), .Q(
        o_data_bus[41]) );
  DFQD4BWP30P140 o_data_bus_inner_reg_39_ ( .D(N326), .CP(clk), .Q(
        o_data_bus[39]) );
  DFQD4BWP30P140 o_data_bus_inner_reg_37_ ( .D(N324), .CP(clk), .Q(
        o_data_bus[37]) );
  DFQD4BWP30P140 o_data_bus_inner_reg_35_ ( .D(N322), .CP(clk), .Q(
        o_data_bus[35]) );
  DFQD4BWP30P140 o_data_bus_inner_reg_33_ ( .D(N320), .CP(clk), .Q(
        o_data_bus[33]) );
  DFQD4BWP30P140 o_data_bus_inner_reg_62_ ( .D(N349), .CP(clk), .Q(
        o_data_bus[62]) );
  DFQD4BWP30P140 o_data_bus_inner_reg_60_ ( .D(N347), .CP(clk), .Q(
        o_data_bus[60]) );
  DFQD4BWP30P140 o_data_bus_inner_reg_58_ ( .D(N345), .CP(clk), .Q(
        o_data_bus[58]) );
  DFQD4BWP30P140 o_data_bus_inner_reg_56_ ( .D(N343), .CP(clk), .Q(
        o_data_bus[56]) );
  DFQD4BWP30P140 o_data_bus_inner_reg_55_ ( .D(N342), .CP(clk), .Q(
        o_data_bus[55]) );
  DFQD4BWP30P140 o_data_bus_inner_reg_54_ ( .D(N341), .CP(clk), .Q(
        o_data_bus[54]) );
  DFQD4BWP30P140 o_data_bus_inner_reg_53_ ( .D(N340), .CP(clk), .Q(
        o_data_bus[53]) );
  DFQD4BWP30P140 o_data_bus_inner_reg_52_ ( .D(N339), .CP(clk), .Q(
        o_data_bus[52]) );
  DFQD4BWP30P140 o_data_bus_inner_reg_51_ ( .D(N338), .CP(clk), .Q(
        o_data_bus[51]) );
  DFQD4BWP30P140 o_data_bus_inner_reg_50_ ( .D(N337), .CP(clk), .Q(
        o_data_bus[50]) );
  DFQD4BWP30P140 o_data_bus_inner_reg_49_ ( .D(N336), .CP(clk), .Q(
        o_data_bus[49]) );
  DFQD4BWP30P140 o_data_bus_inner_reg_48_ ( .D(N335), .CP(clk), .Q(
        o_data_bus[48]) );
  DFQD4BWP30P140 o_data_bus_inner_reg_47_ ( .D(N334), .CP(clk), .Q(
        o_data_bus[47]) );
  DFQD4BWP30P140 o_data_bus_inner_reg_46_ ( .D(N333), .CP(clk), .Q(
        o_data_bus[46]) );
  DFQD4BWP30P140 o_data_bus_inner_reg_44_ ( .D(N331), .CP(clk), .Q(
        o_data_bus[44]) );
  DFQD4BWP30P140 o_data_bus_inner_reg_42_ ( .D(N329), .CP(clk), .Q(
        o_data_bus[42]) );
  DFQD4BWP30P140 o_data_bus_inner_reg_40_ ( .D(N327), .CP(clk), .Q(
        o_data_bus[40]) );
  DFQD4BWP30P140 o_data_bus_inner_reg_38_ ( .D(N325), .CP(clk), .Q(
        o_data_bus[38]) );
  DFQD4BWP30P140 o_data_bus_inner_reg_36_ ( .D(N323), .CP(clk), .Q(
        o_data_bus[36]) );
  DFQD4BWP30P140 o_data_bus_inner_reg_34_ ( .D(N321), .CP(clk), .Q(
        o_data_bus[34]) );
  DFQD4BWP30P140 o_data_bus_inner_reg_32_ ( .D(N319), .CP(clk), .Q(
        o_data_bus[32]) );
  DFQD4BWP30P140 o_data_bus_inner_reg_7_ ( .D(N294), .CP(clk), .Q(
        o_data_bus[7]) );
  DFQD4BWP30P140 o_data_bus_inner_reg_6_ ( .D(N293), .CP(clk), .Q(
        o_data_bus[6]) );
  DFQD4BWP30P140 o_data_bus_inner_reg_5_ ( .D(N292), .CP(clk), .Q(
        o_data_bus[5]) );
  DFQD4BWP30P140 o_data_bus_inner_reg_4_ ( .D(N291), .CP(clk), .Q(
        o_data_bus[4]) );
  DFQD4BWP30P140 o_data_bus_inner_reg_3_ ( .D(N290), .CP(clk), .Q(
        o_data_bus[3]) );
  DFQD4BWP30P140 o_data_bus_inner_reg_2_ ( .D(N289), .CP(clk), .Q(
        o_data_bus[2]) );
  DFQD4BWP30P140 o_data_bus_inner_reg_1_ ( .D(N288), .CP(clk), .Q(
        o_data_bus[1]) );
  DFQD4BWP30P140 o_data_bus_inner_reg_0_ ( .D(N287), .CP(clk), .Q(
        o_data_bus[0]) );
  DFQD4BWP30P140 o_data_bus_inner_reg_31_ ( .D(N318), .CP(clk), .Q(
        o_data_bus[31]) );
  DFQD4BWP30P140 o_data_bus_inner_reg_30_ ( .D(N317), .CP(clk), .Q(
        o_data_bus[30]) );
  DFQD4BWP30P140 o_data_bus_inner_reg_29_ ( .D(N316), .CP(clk), .Q(
        o_data_bus[29]) );
  DFQD4BWP30P140 o_data_bus_inner_reg_28_ ( .D(N315), .CP(clk), .Q(
        o_data_bus[28]) );
  DFQD4BWP30P140 o_data_bus_inner_reg_26_ ( .D(N313), .CP(clk), .Q(
        o_data_bus[26]) );
  DFQD4BWP30P140 o_data_bus_inner_reg_25_ ( .D(N312), .CP(clk), .Q(
        o_data_bus[25]) );
  DFQD4BWP30P140 o_data_bus_inner_reg_24_ ( .D(N311), .CP(clk), .Q(
        o_data_bus[24]) );
  DFQD4BWP30P140 o_data_bus_inner_reg_23_ ( .D(N310), .CP(clk), .Q(
        o_data_bus[23]) );
  DFQD4BWP30P140 o_data_bus_inner_reg_22_ ( .D(N309), .CP(clk), .Q(
        o_data_bus[22]) );
  DFQD4BWP30P140 o_data_bus_inner_reg_21_ ( .D(N308), .CP(clk), .Q(
        o_data_bus[21]) );
  DFQD4BWP30P140 o_data_bus_inner_reg_20_ ( .D(N307), .CP(clk), .Q(
        o_data_bus[20]) );
  DFQD4BWP30P140 o_data_bus_inner_reg_19_ ( .D(N306), .CP(clk), .Q(
        o_data_bus[19]) );
  DFQD4BWP30P140 o_data_bus_inner_reg_18_ ( .D(N305), .CP(clk), .Q(
        o_data_bus[18]) );
  DFQD4BWP30P140 o_data_bus_inner_reg_17_ ( .D(N304), .CP(clk), .Q(
        o_data_bus[17]) );
  DFQD4BWP30P140 o_data_bus_inner_reg_16_ ( .D(N303), .CP(clk), .Q(
        o_data_bus[16]) );
  DFQD4BWP30P140 o_data_bus_inner_reg_14_ ( .D(N301), .CP(clk), .Q(
        o_data_bus[14]) );
  DFQD4BWP30P140 o_data_bus_inner_reg_13_ ( .D(N300), .CP(clk), .Q(
        o_data_bus[13]) );
  DFQD4BWP30P140 o_data_bus_inner_reg_12_ ( .D(N299), .CP(clk), .Q(
        o_data_bus[12]) );
  DFQD4BWP30P140 o_data_bus_inner_reg_11_ ( .D(N298), .CP(clk), .Q(
        o_data_bus[11]) );
  DFQD4BWP30P140 o_data_bus_inner_reg_10_ ( .D(N297), .CP(clk), .Q(
        o_data_bus[10]) );
  DFQD4BWP30P140 o_data_bus_inner_reg_9_ ( .D(N296), .CP(clk), .Q(
        o_data_bus[9]) );
  DFQD4BWP30P140 o_data_bus_inner_reg_27_ ( .D(N314), .CP(clk), .Q(
        o_data_bus[27]) );
  DFQD4BWP30P140 o_data_bus_inner_reg_15_ ( .D(N302), .CP(clk), .Q(
        o_data_bus[15]) );
  DFQD4BWP30P140 o_data_bus_inner_reg_8_ ( .D(N295), .CP(clk), .Q(
        o_data_bus[8]) );
  DFQD4BWP30P140 o_valid_inner_reg_1_ ( .D(N354), .CP(clk), .Q(o_valid[1]) );
  AN3D4BWP30P140 U3 ( .A1(i_valid[1]), .A2(i_cmd[1]), .A3(n41), .Z(n88) );
  ND2OPTIBD1BWP30P140 U4 ( .A1(n40), .A2(n39), .ZN(n7) );
  INR2D1BWP30P140 U5 ( .A1(i_valid[0]), .B1(n48), .ZN(n40) );
  NR2D1BWP30P140 U6 ( .A1(n48), .A2(n39), .ZN(n5) );
  NR2D1BWP30P140 U7 ( .A1(n48), .A2(i_cmd[1]), .ZN(n52) );
  INVD1BWP30P140 U8 ( .I(i_cmd[0]), .ZN(n39) );
  INVD1BWP30P140 U9 ( .I(n67), .ZN(n1) );
  BUFFD6BWP30P140 U10 ( .I(n7), .Z(n2) );
  INVD2BWP30P140 U11 ( .I(i_valid[0]), .ZN(n50) );
  INVD1BWP30P140 U12 ( .I(n67), .ZN(n61) );
  INVD1BWP30P140 U13 ( .I(n67), .ZN(n89) );
  INVD1BWP30P140 U14 ( .I(n67), .ZN(n78) );
  ND2D1BWP30P140 U15 ( .A1(n3), .A2(i_en), .ZN(n48) );
  OAI22D1BWP30P140 U16 ( .A1(n47), .A2(n20), .B1(n2), .B2(n70), .ZN(N296) );
  OAI22D1BWP30P140 U17 ( .A1(n47), .A2(n21), .B1(n2), .B2(n87), .ZN(N297) );
  OAI22D1BWP30P140 U18 ( .A1(n47), .A2(n22), .B1(n2), .B2(n69), .ZN(N298) );
  OAI22D1BWP30P140 U19 ( .A1(n47), .A2(n23), .B1(n2), .B2(n86), .ZN(N299) );
  OAI22D1BWP30P140 U20 ( .A1(n47), .A2(n24), .B1(n2), .B2(n68), .ZN(N300) );
  OAI22D1BWP30P140 U21 ( .A1(n47), .A2(n25), .B1(n2), .B2(n85), .ZN(N301) );
  OAI22D1BWP30P140 U22 ( .A1(n38), .A2(n30), .B1(n2), .B2(n83), .ZN(N303) );
  OAI22D1BWP30P140 U23 ( .A1(n38), .A2(n31), .B1(n2), .B2(n82), .ZN(N304) );
  OAI22D1BWP30P140 U24 ( .A1(n38), .A2(n32), .B1(n2), .B2(n81), .ZN(N305) );
  OAI22D1BWP30P140 U25 ( .A1(n47), .A2(n10), .B1(n2), .B2(n80), .ZN(N306) );
  OAI22D1BWP30P140 U26 ( .A1(n38), .A2(n8), .B1(n2), .B2(n79), .ZN(N307) );
  OAI22D1BWP30P140 U27 ( .A1(n38), .A2(n12), .B1(n2), .B2(n77), .ZN(N308) );
  OAI22D1BWP30P140 U28 ( .A1(n38), .A2(n33), .B1(n2), .B2(n76), .ZN(N309) );
  OAI22D1BWP30P140 U29 ( .A1(n38), .A2(n18), .B1(n2), .B2(n75), .ZN(N310) );
  OAI22D1BWP30P140 U30 ( .A1(n38), .A2(n28), .B1(n2), .B2(n74), .ZN(N311) );
  OAI22D1BWP30P140 U31 ( .A1(n38), .A2(n19), .B1(n2), .B2(n66), .ZN(N312) );
  OAI22D1BWP30P140 U32 ( .A1(n38), .A2(n34), .B1(n2), .B2(n73), .ZN(N313) );
  OAI22D1BWP30P140 U33 ( .A1(n38), .A2(n29), .B1(n2), .B2(n72), .ZN(N315) );
  OAI22D1BWP30P140 U34 ( .A1(n38), .A2(n15), .B1(n2), .B2(n64), .ZN(N316) );
  OAI22D1BWP30P140 U35 ( .A1(n38), .A2(n36), .B1(n2), .B2(n71), .ZN(N317) );
  OAI22D1BWP30P140 U36 ( .A1(n38), .A2(n16), .B1(n2), .B2(n63), .ZN(N318) );
  OAI22D1BWP30P140 U37 ( .A1(n47), .A2(n14), .B1(n2), .B2(n62), .ZN(N287) );
  OAI22D1BWP30P140 U38 ( .A1(n38), .A2(n13), .B1(n2), .B2(n54), .ZN(N288) );
  OAI22D1BWP30P140 U39 ( .A1(n47), .A2(n17), .B1(n2), .B2(n58), .ZN(N289) );
  OAI22D1BWP30P140 U40 ( .A1(n38), .A2(n11), .B1(n2), .B2(n55), .ZN(N290) );
  OAI22D1BWP30P140 U41 ( .A1(n38), .A2(n35), .B1(n2), .B2(n59), .ZN(N291) );
  OAI22D1BWP30P140 U42 ( .A1(n38), .A2(n37), .B1(n2), .B2(n56), .ZN(N292) );
  OAI22D1BWP30P140 U43 ( .A1(n38), .A2(n26), .B1(n2), .B2(n60), .ZN(N293) );
  OAI22D1BWP30P140 U44 ( .A1(n38), .A2(n27), .B1(n2), .B2(n57), .ZN(N294) );
  INVD1BWP30P140 U45 ( .I(rst), .ZN(n3) );
  INVD2BWP30P140 U46 ( .I(i_valid[1]), .ZN(n49) );
  MUX2NUD1BWP30P140 U47 ( .I0(n50), .I1(n49), .S(i_cmd[1]), .ZN(n4) );
  ND2OPTIBD1BWP30P140 U48 ( .A1(n5), .A2(n4), .ZN(n6) );
  INVD2BWP30P140 U49 ( .I(n6), .ZN(n9) );
  INVD2BWP30P140 U50 ( .I(n9), .ZN(n38) );
  INVD1BWP30P140 U51 ( .I(i_data_bus[52]), .ZN(n8) );
  INVD1BWP30P140 U52 ( .I(i_data_bus[20]), .ZN(n79) );
  INVD2BWP30P140 U53 ( .I(n9), .ZN(n47) );
  INVD1BWP30P140 U54 ( .I(i_data_bus[51]), .ZN(n10) );
  INVD1BWP30P140 U55 ( .I(i_data_bus[19]), .ZN(n80) );
  INVD1BWP30P140 U56 ( .I(i_data_bus[35]), .ZN(n11) );
  INVD1BWP30P140 U57 ( .I(i_data_bus[3]), .ZN(n55) );
  INVD1BWP30P140 U58 ( .I(i_data_bus[53]), .ZN(n12) );
  INVD1BWP30P140 U59 ( .I(i_data_bus[21]), .ZN(n77) );
  INVD1BWP30P140 U60 ( .I(i_data_bus[33]), .ZN(n13) );
  INVD1BWP30P140 U61 ( .I(i_data_bus[1]), .ZN(n54) );
  INVD1BWP30P140 U62 ( .I(i_data_bus[32]), .ZN(n14) );
  INVD1BWP30P140 U63 ( .I(i_data_bus[0]), .ZN(n62) );
  INVD1BWP30P140 U64 ( .I(i_data_bus[61]), .ZN(n15) );
  INVD1BWP30P140 U65 ( .I(i_data_bus[29]), .ZN(n64) );
  INVD1BWP30P140 U66 ( .I(i_data_bus[63]), .ZN(n16) );
  INVD1BWP30P140 U67 ( .I(i_data_bus[31]), .ZN(n63) );
  INVD1BWP30P140 U68 ( .I(i_data_bus[34]), .ZN(n17) );
  INVD1BWP30P140 U69 ( .I(i_data_bus[2]), .ZN(n58) );
  INVD1BWP30P140 U70 ( .I(i_data_bus[55]), .ZN(n18) );
  INVD1BWP30P140 U71 ( .I(i_data_bus[23]), .ZN(n75) );
  INVD1BWP30P140 U72 ( .I(i_data_bus[57]), .ZN(n19) );
  INVD1BWP30P140 U73 ( .I(i_data_bus[25]), .ZN(n66) );
  INVD1BWP30P140 U74 ( .I(i_data_bus[41]), .ZN(n20) );
  INVD1BWP30P140 U75 ( .I(i_data_bus[9]), .ZN(n70) );
  INVD1BWP30P140 U76 ( .I(i_data_bus[42]), .ZN(n21) );
  INVD1BWP30P140 U77 ( .I(i_data_bus[10]), .ZN(n87) );
  INVD1BWP30P140 U78 ( .I(i_data_bus[43]), .ZN(n22) );
  INVD1BWP30P140 U79 ( .I(i_data_bus[11]), .ZN(n69) );
  INVD1BWP30P140 U80 ( .I(i_data_bus[44]), .ZN(n23) );
  INVD1BWP30P140 U81 ( .I(i_data_bus[12]), .ZN(n86) );
  INVD1BWP30P140 U82 ( .I(i_data_bus[45]), .ZN(n24) );
  INVD1BWP30P140 U83 ( .I(i_data_bus[13]), .ZN(n68) );
  INVD1BWP30P140 U84 ( .I(i_data_bus[46]), .ZN(n25) );
  INVD1BWP30P140 U85 ( .I(i_data_bus[14]), .ZN(n85) );
  INVD1BWP30P140 U86 ( .I(i_data_bus[38]), .ZN(n26) );
  INVD1BWP30P140 U87 ( .I(i_data_bus[6]), .ZN(n60) );
  INVD1BWP30P140 U88 ( .I(i_data_bus[39]), .ZN(n27) );
  INVD1BWP30P140 U89 ( .I(i_data_bus[7]), .ZN(n57) );
  INVD1BWP30P140 U90 ( .I(i_data_bus[56]), .ZN(n28) );
  INVD1BWP30P140 U91 ( .I(i_data_bus[24]), .ZN(n74) );
  INVD1BWP30P140 U92 ( .I(i_data_bus[60]), .ZN(n29) );
  INVD1BWP30P140 U93 ( .I(i_data_bus[28]), .ZN(n72) );
  INVD1BWP30P140 U94 ( .I(i_data_bus[48]), .ZN(n30) );
  INVD1BWP30P140 U95 ( .I(i_data_bus[16]), .ZN(n83) );
  INVD1BWP30P140 U96 ( .I(i_data_bus[49]), .ZN(n31) );
  INVD1BWP30P140 U97 ( .I(i_data_bus[17]), .ZN(n82) );
  INVD1BWP30P140 U98 ( .I(i_data_bus[50]), .ZN(n32) );
  INVD1BWP30P140 U99 ( .I(i_data_bus[18]), .ZN(n81) );
  INVD1BWP30P140 U100 ( .I(i_data_bus[54]), .ZN(n33) );
  INVD1BWP30P140 U101 ( .I(i_data_bus[22]), .ZN(n76) );
  INVD1BWP30P140 U102 ( .I(i_data_bus[58]), .ZN(n34) );
  INVD1BWP30P140 U103 ( .I(i_data_bus[26]), .ZN(n73) );
  INVD1BWP30P140 U104 ( .I(i_data_bus[36]), .ZN(n35) );
  INVD1BWP30P140 U105 ( .I(i_data_bus[4]), .ZN(n59) );
  INVD1BWP30P140 U106 ( .I(i_data_bus[62]), .ZN(n36) );
  INVD1BWP30P140 U107 ( .I(i_data_bus[30]), .ZN(n71) );
  INVD1BWP30P140 U108 ( .I(i_data_bus[37]), .ZN(n37) );
  INVD1BWP30P140 U109 ( .I(i_data_bus[5]), .ZN(n56) );
  OAI31D1BWP30P140 U110 ( .A1(n48), .A2(n49), .A3(n39), .B(n2), .ZN(N353) );
  INVD1BWP30P140 U111 ( .I(n40), .ZN(n43) );
  INVD1BWP30P140 U112 ( .I(n48), .ZN(n41) );
  INVD1BWP30P140 U113 ( .I(n88), .ZN(n42) );
  OAI21D1BWP30P140 U114 ( .A1(n43), .A2(i_cmd[1]), .B(n42), .ZN(N354) );
  INVD1BWP30P140 U115 ( .I(i_data_bus[27]), .ZN(n65) );
  INVD1BWP30P140 U116 ( .I(i_data_bus[59]), .ZN(n44) );
  OAI22D1BWP30P140 U117 ( .A1(n2), .A2(n65), .B1(n47), .B2(n44), .ZN(N314) );
  INVD1BWP30P140 U118 ( .I(i_data_bus[15]), .ZN(n84) );
  INVD1BWP30P140 U119 ( .I(i_data_bus[47]), .ZN(n45) );
  OAI22D1BWP30P140 U120 ( .A1(n2), .A2(n84), .B1(n47), .B2(n45), .ZN(N302) );
  INVD1BWP30P140 U121 ( .I(i_data_bus[8]), .ZN(n90) );
  INVD1BWP30P140 U122 ( .I(i_data_bus[40]), .ZN(n46) );
  OAI22D1BWP30P140 U123 ( .A1(n2), .A2(n90), .B1(n47), .B2(n46), .ZN(N295) );
  MUX2NUD1BWP30P140 U124 ( .I0(n50), .I1(n49), .S(i_cmd[0]), .ZN(n51) );
  ND2OPTIBD1BWP30P140 U125 ( .A1(n52), .A2(n51), .ZN(n53) );
  INVD2BWP30P140 U126 ( .I(n53), .ZN(n67) );
  MOAI22D1BWP30P140 U127 ( .A1(n54), .A2(n89), .B1(i_data_bus[33]), .B2(n88), 
        .ZN(N320) );
  MOAI22D1BWP30P140 U128 ( .A1(n55), .A2(n78), .B1(i_data_bus[35]), .B2(n88), 
        .ZN(N322) );
  MOAI22D1BWP30P140 U129 ( .A1(n56), .A2(n61), .B1(i_data_bus[37]), .B2(n88), 
        .ZN(N324) );
  MOAI22D1BWP30P140 U130 ( .A1(n57), .A2(n1), .B1(i_data_bus[39]), .B2(n88), 
        .ZN(N326) );
  MOAI22D1BWP30P140 U131 ( .A1(n58), .A2(n89), .B1(i_data_bus[34]), .B2(n88), 
        .ZN(N321) );
  MOAI22D1BWP30P140 U132 ( .A1(n59), .A2(n78), .B1(i_data_bus[36]), .B2(n88), 
        .ZN(N323) );
  MOAI22D1BWP30P140 U133 ( .A1(n60), .A2(n61), .B1(i_data_bus[38]), .B2(n88), 
        .ZN(N325) );
  MOAI22D1BWP30P140 U134 ( .A1(n62), .A2(n1), .B1(i_data_bus[32]), .B2(n88), 
        .ZN(N319) );
  MOAI22D1BWP30P140 U135 ( .A1(n63), .A2(n89), .B1(i_data_bus[63]), .B2(n88), 
        .ZN(N350) );
  MOAI22D1BWP30P140 U136 ( .A1(n64), .A2(n78), .B1(i_data_bus[61]), .B2(n88), 
        .ZN(N348) );
  MOAI22D1BWP30P140 U137 ( .A1(n65), .A2(n61), .B1(i_data_bus[59]), .B2(n88), 
        .ZN(N346) );
  MOAI22D1BWP30P140 U138 ( .A1(n66), .A2(n1), .B1(i_data_bus[57]), .B2(n88), 
        .ZN(N344) );
  MOAI22D1BWP30P140 U139 ( .A1(n68), .A2(n89), .B1(i_data_bus[45]), .B2(n88), 
        .ZN(N332) );
  MOAI22D1BWP30P140 U140 ( .A1(n69), .A2(n78), .B1(i_data_bus[43]), .B2(n88), 
        .ZN(N330) );
  MOAI22D1BWP30P140 U141 ( .A1(n70), .A2(n61), .B1(i_data_bus[41]), .B2(n88), 
        .ZN(N328) );
  MOAI22D1BWP30P140 U142 ( .A1(n71), .A2(n89), .B1(i_data_bus[62]), .B2(n88), 
        .ZN(N349) );
  MOAI22D1BWP30P140 U143 ( .A1(n72), .A2(n78), .B1(i_data_bus[60]), .B2(n88), 
        .ZN(N347) );
  MOAI22D1BWP30P140 U144 ( .A1(n73), .A2(n61), .B1(i_data_bus[58]), .B2(n88), 
        .ZN(N345) );
  MOAI22D1BWP30P140 U145 ( .A1(n74), .A2(n1), .B1(i_data_bus[56]), .B2(n88), 
        .ZN(N343) );
  MOAI22D1BWP30P140 U146 ( .A1(n75), .A2(n89), .B1(i_data_bus[55]), .B2(n88), 
        .ZN(N342) );
  MOAI22D1BWP30P140 U147 ( .A1(n76), .A2(n78), .B1(i_data_bus[54]), .B2(n88), 
        .ZN(N341) );
  MOAI22D1BWP30P140 U148 ( .A1(n77), .A2(n61), .B1(i_data_bus[53]), .B2(n88), 
        .ZN(N340) );
  MOAI22D1BWP30P140 U149 ( .A1(n79), .A2(n1), .B1(i_data_bus[52]), .B2(n88), 
        .ZN(N339) );
  MOAI22D1BWP30P140 U150 ( .A1(n80), .A2(n1), .B1(i_data_bus[51]), .B2(n88), 
        .ZN(N338) );
  MOAI22D1BWP30P140 U151 ( .A1(n81), .A2(n89), .B1(i_data_bus[50]), .B2(n88), 
        .ZN(N337) );
  MOAI22D1BWP30P140 U152 ( .A1(n82), .A2(n78), .B1(i_data_bus[49]), .B2(n88), 
        .ZN(N336) );
  MOAI22D1BWP30P140 U153 ( .A1(n83), .A2(n61), .B1(i_data_bus[48]), .B2(n88), 
        .ZN(N335) );
  MOAI22D1BWP30P140 U154 ( .A1(n84), .A2(n1), .B1(i_data_bus[47]), .B2(n88), 
        .ZN(N334) );
  MOAI22D1BWP30P140 U155 ( .A1(n85), .A2(n89), .B1(i_data_bus[46]), .B2(n88), 
        .ZN(N333) );
  MOAI22D1BWP30P140 U156 ( .A1(n86), .A2(n78), .B1(i_data_bus[44]), .B2(n88), 
        .ZN(N331) );
  MOAI22D1BWP30P140 U157 ( .A1(n87), .A2(n61), .B1(i_data_bus[42]), .B2(n88), 
        .ZN(N329) );
  MOAI22D1BWP30P140 U158 ( .A1(n90), .A2(n1), .B1(i_data_bus[40]), .B2(n88), 
        .ZN(N327) );
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
         n45, n46, n47, n48, n49, n50, n51, n52, n53, n54, n55, n56, n57, n58,
         n59, n60, n61, n62, n63, n64, n65, n66, n67, n68, n69, n70, n71, n72,
         n73, n74, n75, n76, n77, n78, n79, n80, n81, n82, n83, n84, n85, n86,
         n87, n88, n89, n90, n91;

  DFQD1BWP30P140 o_data_bus_inner_reg_63_ ( .D(N350), .CP(clk), .Q(
        o_data_bus[63]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_62_ ( .D(N349), .CP(clk), .Q(
        o_data_bus[62]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_61_ ( .D(N348), .CP(clk), .Q(
        o_data_bus[61]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_60_ ( .D(N347), .CP(clk), .Q(
        o_data_bus[60]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_59_ ( .D(N346), .CP(clk), .Q(
        o_data_bus[59]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_58_ ( .D(N345), .CP(clk), .Q(
        o_data_bus[58]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_57_ ( .D(N344), .CP(clk), .Q(
        o_data_bus[57]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_56_ ( .D(N343), .CP(clk), .Q(
        o_data_bus[56]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_55_ ( .D(N342), .CP(clk), .Q(
        o_data_bus[55]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_54_ ( .D(N341), .CP(clk), .Q(
        o_data_bus[54]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_53_ ( .D(N340), .CP(clk), .Q(
        o_data_bus[53]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_52_ ( .D(N339), .CP(clk), .Q(
        o_data_bus[52]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_51_ ( .D(N338), .CP(clk), .Q(
        o_data_bus[51]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_50_ ( .D(N337), .CP(clk), .Q(
        o_data_bus[50]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_49_ ( .D(N336), .CP(clk), .Q(
        o_data_bus[49]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_48_ ( .D(N335), .CP(clk), .Q(
        o_data_bus[48]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_47_ ( .D(N334), .CP(clk), .Q(
        o_data_bus[47]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_46_ ( .D(N333), .CP(clk), .Q(
        o_data_bus[46]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_45_ ( .D(N332), .CP(clk), .Q(
        o_data_bus[45]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_44_ ( .D(N331), .CP(clk), .Q(
        o_data_bus[44]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_43_ ( .D(N330), .CP(clk), .Q(
        o_data_bus[43]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_42_ ( .D(N329), .CP(clk), .Q(
        o_data_bus[42]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_41_ ( .D(N328), .CP(clk), .Q(
        o_data_bus[41]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_40_ ( .D(N327), .CP(clk), .Q(
        o_data_bus[40]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_39_ ( .D(N326), .CP(clk), .Q(
        o_data_bus[39]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_38_ ( .D(N325), .CP(clk), .Q(
        o_data_bus[38]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_37_ ( .D(N324), .CP(clk), .Q(
        o_data_bus[37]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_36_ ( .D(N323), .CP(clk), .Q(
        o_data_bus[36]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_35_ ( .D(N322), .CP(clk), .Q(
        o_data_bus[35]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_34_ ( .D(N321), .CP(clk), .Q(
        o_data_bus[34]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_33_ ( .D(N320), .CP(clk), .Q(
        o_data_bus[33]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_32_ ( .D(N319), .CP(clk), .Q(
        o_data_bus[32]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_31_ ( .D(N318), .CP(clk), .Q(
        o_data_bus[31]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_30_ ( .D(N317), .CP(clk), .Q(
        o_data_bus[30]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_29_ ( .D(N316), .CP(clk), .Q(
        o_data_bus[29]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_28_ ( .D(N315), .CP(clk), .Q(
        o_data_bus[28]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_27_ ( .D(N314), .CP(clk), .Q(
        o_data_bus[27]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_26_ ( .D(N313), .CP(clk), .Q(
        o_data_bus[26]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_25_ ( .D(N312), .CP(clk), .Q(
        o_data_bus[25]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_24_ ( .D(N311), .CP(clk), .Q(
        o_data_bus[24]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_23_ ( .D(N310), .CP(clk), .Q(
        o_data_bus[23]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_22_ ( .D(N309), .CP(clk), .Q(
        o_data_bus[22]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_21_ ( .D(N308), .CP(clk), .Q(
        o_data_bus[21]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_20_ ( .D(N307), .CP(clk), .Q(
        o_data_bus[20]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_19_ ( .D(N306), .CP(clk), .Q(
        o_data_bus[19]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_18_ ( .D(N305), .CP(clk), .Q(
        o_data_bus[18]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_17_ ( .D(N304), .CP(clk), .Q(
        o_data_bus[17]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_16_ ( .D(N303), .CP(clk), .Q(
        o_data_bus[16]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_15_ ( .D(N302), .CP(clk), .Q(
        o_data_bus[15]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_14_ ( .D(N301), .CP(clk), .Q(
        o_data_bus[14]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_13_ ( .D(N300), .CP(clk), .Q(
        o_data_bus[13]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_12_ ( .D(N299), .CP(clk), .Q(
        o_data_bus[12]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_11_ ( .D(N298), .CP(clk), .Q(
        o_data_bus[11]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_10_ ( .D(N297), .CP(clk), .Q(
        o_data_bus[10]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_9_ ( .D(N296), .CP(clk), .Q(
        o_data_bus[9]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_8_ ( .D(N295), .CP(clk), .Q(
        o_data_bus[8]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_7_ ( .D(N294), .CP(clk), .Q(
        o_data_bus[7]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_6_ ( .D(N293), .CP(clk), .Q(
        o_data_bus[6]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_5_ ( .D(N292), .CP(clk), .Q(
        o_data_bus[5]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_4_ ( .D(N291), .CP(clk), .Q(
        o_data_bus[4]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_3_ ( .D(N290), .CP(clk), .Q(
        o_data_bus[3]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_2_ ( .D(N289), .CP(clk), .Q(
        o_data_bus[2]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_1_ ( .D(N288), .CP(clk), .Q(
        o_data_bus[1]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_0_ ( .D(N287), .CP(clk), .Q(
        o_data_bus[0]) );
  DFQD4BWP30P140 o_valid_inner_reg_1_ ( .D(N354), .CP(clk), .Q(o_valid[1]) );
  DFQD4BWP30P140 o_valid_inner_reg_0_ ( .D(N353), .CP(clk), .Q(o_valid[0]) );
  AN3D4BWP30P140 U3 ( .A1(i_valid[1]), .A2(i_cmd[1]), .A3(n46), .Z(n89) );
  NR2D1BWP30P140 U4 ( .A1(n49), .A2(i_cmd[1]), .ZN(n53) );
  INVD1BWP30P140 U5 ( .I(i_valid[0]), .ZN(n51) );
  INVD2BWP30P140 U6 ( .I(n17), .ZN(n44) );
  OAI22D1BWP30P140 U7 ( .A1(n43), .A2(n6), .B1(n44), .B2(n73), .ZN(N309) );
  OAI22D1BWP30P140 U8 ( .A1(n43), .A2(n7), .B1(n44), .B2(n72), .ZN(N310) );
  OAI22D1BWP30P140 U9 ( .A1(n43), .A2(n9), .B1(n44), .B2(n70), .ZN(N312) );
  OAI22D1BWP30P140 U10 ( .A1(n43), .A2(n10), .B1(n44), .B2(n69), .ZN(N313) );
  OAI22D1BWP30P140 U11 ( .A1(n43), .A2(n11), .B1(n44), .B2(n68), .ZN(N314) );
  OAI22D1BWP30P140 U12 ( .A1(n43), .A2(n13), .B1(n44), .B2(n66), .ZN(N316) );
  OAI22D1BWP30P140 U13 ( .A1(n43), .A2(n14), .B1(n44), .B2(n65), .ZN(N317) );
  OAI22D1BWP30P140 U14 ( .A1(n43), .A2(n15), .B1(n44), .B2(n64), .ZN(N318) );
  ND2D1BWP30P140 U15 ( .A1(n1), .A2(i_en), .ZN(n49) );
  INVD1BWP30P140 U16 ( .I(n17), .ZN(n38) );
  INVD1P5BWP30P140 U17 ( .I(n77), .ZN(n62) );
  OAI22D1BWP30P140 U18 ( .A1(n43), .A2(n8), .B1(n44), .B2(n71), .ZN(N311) );
  OAI22D1BWP30P140 U19 ( .A1(n43), .A2(n12), .B1(n44), .B2(n67), .ZN(N315) );
  INVD1BWP30P140 U20 ( .I(rst), .ZN(n1) );
  INVD2BWP30P140 U21 ( .I(i_cmd[0]), .ZN(n16) );
  NR2OPTPAD1BWP30P140 U22 ( .A1(n49), .A2(n16), .ZN(n3) );
  INVD2BWP30P140 U23 ( .I(i_valid[1]), .ZN(n50) );
  MUX2NUD1BWP30P140 U24 ( .I0(n51), .I1(n50), .S(i_cmd[1]), .ZN(n2) );
  ND2OPTIBD1BWP30P140 U25 ( .A1(n3), .A2(n2), .ZN(n4) );
  INVD2BWP30P140 U26 ( .I(n4), .ZN(n26) );
  INVD2BWP30P140 U27 ( .I(n26), .ZN(n43) );
  INVD1BWP30P140 U28 ( .I(i_data_bus[54]), .ZN(n6) );
  INR2D2BWP30P140 U29 ( .A1(i_valid[0]), .B1(n49), .ZN(n45) );
  CKND2D2BWP30P140 U30 ( .A1(n45), .A2(n16), .ZN(n5) );
  INVD2BWP30P140 U31 ( .I(n5), .ZN(n17) );
  INVD1BWP30P140 U32 ( .I(i_data_bus[22]), .ZN(n73) );
  INVD1BWP30P140 U33 ( .I(i_data_bus[55]), .ZN(n7) );
  INVD1BWP30P140 U34 ( .I(i_data_bus[23]), .ZN(n72) );
  INVD1BWP30P140 U35 ( .I(i_data_bus[56]), .ZN(n8) );
  INVD1BWP30P140 U36 ( .I(i_data_bus[24]), .ZN(n71) );
  INVD1BWP30P140 U37 ( .I(i_data_bus[57]), .ZN(n9) );
  INVD1BWP30P140 U38 ( .I(i_data_bus[25]), .ZN(n70) );
  INVD1BWP30P140 U39 ( .I(i_data_bus[58]), .ZN(n10) );
  INVD1BWP30P140 U40 ( .I(i_data_bus[26]), .ZN(n69) );
  INVD1BWP30P140 U41 ( .I(i_data_bus[59]), .ZN(n11) );
  INVD1BWP30P140 U42 ( .I(i_data_bus[27]), .ZN(n68) );
  INVD1BWP30P140 U43 ( .I(i_data_bus[60]), .ZN(n12) );
  INVD1BWP30P140 U44 ( .I(i_data_bus[28]), .ZN(n67) );
  INVD1BWP30P140 U45 ( .I(i_data_bus[61]), .ZN(n13) );
  INVD1BWP30P140 U46 ( .I(i_data_bus[29]), .ZN(n66) );
  INVD1BWP30P140 U47 ( .I(i_data_bus[62]), .ZN(n14) );
  INVD1BWP30P140 U48 ( .I(i_data_bus[30]), .ZN(n65) );
  INVD1BWP30P140 U49 ( .I(i_data_bus[63]), .ZN(n15) );
  INVD1BWP30P140 U50 ( .I(i_data_bus[31]), .ZN(n64) );
  OAI31D1BWP30P140 U51 ( .A1(n49), .A2(n50), .A3(n16), .B(n38), .ZN(N353) );
  INVD1BWP30P140 U52 ( .I(i_data_bus[7]), .ZN(n63) );
  INVD1BWP30P140 U53 ( .I(i_data_bus[39]), .ZN(n18) );
  OAI22D1BWP30P140 U54 ( .A1(n44), .A2(n63), .B1(n43), .B2(n18), .ZN(N294) );
  INVD1BWP30P140 U55 ( .I(i_data_bus[6]), .ZN(n61) );
  INVD1BWP30P140 U56 ( .I(i_data_bus[38]), .ZN(n19) );
  OAI22D1BWP30P140 U57 ( .A1(n44), .A2(n61), .B1(n43), .B2(n19), .ZN(N293) );
  INVD1BWP30P140 U58 ( .I(i_data_bus[5]), .ZN(n60) );
  INVD1BWP30P140 U59 ( .I(i_data_bus[37]), .ZN(n20) );
  OAI22D1BWP30P140 U60 ( .A1(n44), .A2(n60), .B1(n40), .B2(n20), .ZN(N292) );
  INVD1BWP30P140 U61 ( .I(i_data_bus[4]), .ZN(n59) );
  INVD1BWP30P140 U62 ( .I(i_data_bus[36]), .ZN(n21) );
  OAI22D1BWP30P140 U63 ( .A1(n44), .A2(n59), .B1(n43), .B2(n21), .ZN(N291) );
  INVD1BWP30P140 U64 ( .I(i_data_bus[3]), .ZN(n58) );
  INVD1BWP30P140 U65 ( .I(i_data_bus[35]), .ZN(n22) );
  OAI22D1BWP30P140 U66 ( .A1(n38), .A2(n58), .B1(n40), .B2(n22), .ZN(N290) );
  INVD1BWP30P140 U67 ( .I(i_data_bus[2]), .ZN(n57) );
  INVD1BWP30P140 U68 ( .I(i_data_bus[34]), .ZN(n23) );
  OAI22D1BWP30P140 U69 ( .A1(n38), .A2(n57), .B1(n40), .B2(n23), .ZN(N289) );
  INVD1BWP30P140 U70 ( .I(i_data_bus[1]), .ZN(n56) );
  INVD1BWP30P140 U71 ( .I(i_data_bus[33]), .ZN(n24) );
  OAI22D1BWP30P140 U72 ( .A1(n38), .A2(n56), .B1(n43), .B2(n24), .ZN(N288) );
  INVD1BWP30P140 U73 ( .I(i_data_bus[0]), .ZN(n55) );
  INVD1BWP30P140 U74 ( .I(i_data_bus[32]), .ZN(n25) );
  OAI22D1BWP30P140 U75 ( .A1(n38), .A2(n55), .B1(n43), .B2(n25), .ZN(N287) );
  INVD1BWP30P140 U76 ( .I(i_data_bus[8]), .ZN(n91) );
  INVD2BWP30P140 U77 ( .I(n26), .ZN(n40) );
  INVD1BWP30P140 U78 ( .I(i_data_bus[40]), .ZN(n27) );
  OAI22D1BWP30P140 U79 ( .A1(n44), .A2(n91), .B1(n40), .B2(n27), .ZN(N295) );
  INVD1BWP30P140 U80 ( .I(i_data_bus[9]), .ZN(n88) );
  INVD1BWP30P140 U81 ( .I(i_data_bus[41]), .ZN(n28) );
  OAI22D1BWP30P140 U82 ( .A1(n44), .A2(n88), .B1(n40), .B2(n28), .ZN(N296) );
  INVD1BWP30P140 U83 ( .I(i_data_bus[10]), .ZN(n87) );
  INVD1BWP30P140 U84 ( .I(i_data_bus[42]), .ZN(n29) );
  OAI22D1BWP30P140 U85 ( .A1(n44), .A2(n87), .B1(n40), .B2(n29), .ZN(N297) );
  INVD1BWP30P140 U86 ( .I(i_data_bus[11]), .ZN(n86) );
  INVD1BWP30P140 U87 ( .I(i_data_bus[43]), .ZN(n30) );
  OAI22D1BWP30P140 U88 ( .A1(n44), .A2(n86), .B1(n40), .B2(n30), .ZN(N298) );
  INVD1BWP30P140 U89 ( .I(i_data_bus[12]), .ZN(n85) );
  INVD1BWP30P140 U90 ( .I(i_data_bus[44]), .ZN(n31) );
  OAI22D1BWP30P140 U91 ( .A1(n44), .A2(n85), .B1(n40), .B2(n31), .ZN(N299) );
  INVD1BWP30P140 U92 ( .I(i_data_bus[13]), .ZN(n84) );
  INVD1BWP30P140 U93 ( .I(i_data_bus[45]), .ZN(n32) );
  OAI22D1BWP30P140 U94 ( .A1(n44), .A2(n84), .B1(n40), .B2(n32), .ZN(N300) );
  INVD1BWP30P140 U95 ( .I(i_data_bus[14]), .ZN(n83) );
  INVD1BWP30P140 U96 ( .I(i_data_bus[46]), .ZN(n33) );
  OAI22D1BWP30P140 U97 ( .A1(n44), .A2(n83), .B1(n40), .B2(n33), .ZN(N301) );
  INVD1BWP30P140 U98 ( .I(i_data_bus[15]), .ZN(n82) );
  INVD1BWP30P140 U99 ( .I(i_data_bus[47]), .ZN(n34) );
  OAI22D1BWP30P140 U100 ( .A1(n38), .A2(n82), .B1(n40), .B2(n34), .ZN(N302) );
  INVD1BWP30P140 U101 ( .I(i_data_bus[16]), .ZN(n81) );
  INVD1BWP30P140 U102 ( .I(i_data_bus[48]), .ZN(n35) );
  OAI22D1BWP30P140 U103 ( .A1(n38), .A2(n81), .B1(n40), .B2(n35), .ZN(N303) );
  INVD1BWP30P140 U104 ( .I(i_data_bus[17]), .ZN(n80) );
  INVD1BWP30P140 U105 ( .I(i_data_bus[49]), .ZN(n36) );
  OAI22D1BWP30P140 U106 ( .A1(n38), .A2(n80), .B1(n40), .B2(n36), .ZN(N304) );
  INVD1BWP30P140 U107 ( .I(i_data_bus[18]), .ZN(n79) );
  INVD1BWP30P140 U108 ( .I(i_data_bus[50]), .ZN(n37) );
  OAI22D1BWP30P140 U109 ( .A1(n38), .A2(n79), .B1(n40), .B2(n37), .ZN(N305) );
  INVD1BWP30P140 U110 ( .I(i_data_bus[19]), .ZN(n78) );
  INVD1BWP30P140 U111 ( .I(i_data_bus[51]), .ZN(n39) );
  OAI22D1BWP30P140 U112 ( .A1(n38), .A2(n78), .B1(n40), .B2(n39), .ZN(N306) );
  INVD1BWP30P140 U113 ( .I(i_data_bus[20]), .ZN(n76) );
  INVD1BWP30P140 U114 ( .I(i_data_bus[52]), .ZN(n41) );
  OAI22D1BWP30P140 U115 ( .A1(n38), .A2(n76), .B1(n43), .B2(n41), .ZN(N307) );
  INVD1BWP30P140 U116 ( .I(i_data_bus[21]), .ZN(n74) );
  INVD1BWP30P140 U117 ( .I(i_data_bus[53]), .ZN(n42) );
  OAI22D1BWP30P140 U118 ( .A1(n38), .A2(n74), .B1(n43), .B2(n42), .ZN(N308) );
  INVD1BWP30P140 U119 ( .I(n45), .ZN(n48) );
  INVD1BWP30P140 U120 ( .I(n49), .ZN(n46) );
  INVD1BWP30P140 U121 ( .I(n89), .ZN(n47) );
  OAI21D1BWP30P140 U122 ( .A1(n48), .A2(i_cmd[1]), .B(n47), .ZN(N354) );
  MUX2NUD1BWP30P140 U123 ( .I0(n51), .I1(n50), .S(i_cmd[0]), .ZN(n52) );
  ND2OPTIBD1BWP30P140 U124 ( .A1(n53), .A2(n52), .ZN(n54) );
  INVD2BWP30P140 U125 ( .I(n54), .ZN(n77) );
  MOAI22D1BWP30P140 U126 ( .A1(n55), .A2(n62), .B1(i_data_bus[32]), .B2(n89), 
        .ZN(N319) );
  MOAI22D1BWP30P140 U127 ( .A1(n56), .A2(n62), .B1(i_data_bus[33]), .B2(n89), 
        .ZN(N320) );
  MOAI22D1BWP30P140 U128 ( .A1(n57), .A2(n62), .B1(i_data_bus[34]), .B2(n89), 
        .ZN(N321) );
  MOAI22D1BWP30P140 U129 ( .A1(n58), .A2(n62), .B1(i_data_bus[35]), .B2(n89), 
        .ZN(N322) );
  MOAI22D1BWP30P140 U130 ( .A1(n59), .A2(n62), .B1(i_data_bus[36]), .B2(n89), 
        .ZN(N323) );
  MOAI22D1BWP30P140 U131 ( .A1(n60), .A2(n62), .B1(i_data_bus[37]), .B2(n89), 
        .ZN(N324) );
  MOAI22D1BWP30P140 U132 ( .A1(n61), .A2(n62), .B1(i_data_bus[38]), .B2(n89), 
        .ZN(N325) );
  MOAI22D1BWP30P140 U133 ( .A1(n63), .A2(n62), .B1(i_data_bus[39]), .B2(n89), 
        .ZN(N326) );
  INVD2BWP30P140 U134 ( .I(n77), .ZN(n75) );
  MOAI22D1BWP30P140 U135 ( .A1(n64), .A2(n75), .B1(i_data_bus[63]), .B2(n89), 
        .ZN(N350) );
  MOAI22D1BWP30P140 U136 ( .A1(n65), .A2(n75), .B1(i_data_bus[62]), .B2(n89), 
        .ZN(N349) );
  MOAI22D1BWP30P140 U137 ( .A1(n66), .A2(n75), .B1(i_data_bus[61]), .B2(n89), 
        .ZN(N348) );
  MOAI22D1BWP30P140 U138 ( .A1(n67), .A2(n75), .B1(i_data_bus[60]), .B2(n89), 
        .ZN(N347) );
  MOAI22D1BWP30P140 U139 ( .A1(n68), .A2(n75), .B1(i_data_bus[59]), .B2(n89), 
        .ZN(N346) );
  MOAI22D1BWP30P140 U140 ( .A1(n69), .A2(n75), .B1(i_data_bus[58]), .B2(n89), 
        .ZN(N345) );
  MOAI22D1BWP30P140 U141 ( .A1(n70), .A2(n75), .B1(i_data_bus[57]), .B2(n89), 
        .ZN(N344) );
  MOAI22D1BWP30P140 U142 ( .A1(n71), .A2(n75), .B1(i_data_bus[56]), .B2(n89), 
        .ZN(N343) );
  MOAI22D1BWP30P140 U143 ( .A1(n72), .A2(n75), .B1(i_data_bus[55]), .B2(n89), 
        .ZN(N342) );
  MOAI22D1BWP30P140 U144 ( .A1(n73), .A2(n75), .B1(i_data_bus[54]), .B2(n89), 
        .ZN(N341) );
  MOAI22D1BWP30P140 U145 ( .A1(n74), .A2(n75), .B1(i_data_bus[53]), .B2(n89), 
        .ZN(N340) );
  MOAI22D1BWP30P140 U146 ( .A1(n76), .A2(n75), .B1(i_data_bus[52]), .B2(n89), 
        .ZN(N339) );
  INVD2BWP30P140 U147 ( .I(n77), .ZN(n90) );
  MOAI22D1BWP30P140 U148 ( .A1(n78), .A2(n90), .B1(i_data_bus[51]), .B2(n89), 
        .ZN(N338) );
  MOAI22D1BWP30P140 U149 ( .A1(n79), .A2(n90), .B1(i_data_bus[50]), .B2(n89), 
        .ZN(N337) );
  MOAI22D1BWP30P140 U150 ( .A1(n80), .A2(n90), .B1(i_data_bus[49]), .B2(n89), 
        .ZN(N336) );
  MOAI22D1BWP30P140 U151 ( .A1(n81), .A2(n90), .B1(i_data_bus[48]), .B2(n89), 
        .ZN(N335) );
  MOAI22D1BWP30P140 U152 ( .A1(n82), .A2(n90), .B1(i_data_bus[47]), .B2(n89), 
        .ZN(N334) );
  MOAI22D1BWP30P140 U153 ( .A1(n83), .A2(n90), .B1(i_data_bus[46]), .B2(n89), 
        .ZN(N333) );
  MOAI22D1BWP30P140 U154 ( .A1(n84), .A2(n90), .B1(i_data_bus[45]), .B2(n89), 
        .ZN(N332) );
  MOAI22D1BWP30P140 U155 ( .A1(n85), .A2(n90), .B1(i_data_bus[44]), .B2(n89), 
        .ZN(N331) );
  MOAI22D1BWP30P140 U156 ( .A1(n86), .A2(n90), .B1(i_data_bus[43]), .B2(n89), 
        .ZN(N330) );
  MOAI22D1BWP30P140 U157 ( .A1(n87), .A2(n90), .B1(i_data_bus[42]), .B2(n89), 
        .ZN(N329) );
  MOAI22D1BWP30P140 U158 ( .A1(n88), .A2(n90), .B1(i_data_bus[41]), .B2(n89), 
        .ZN(N328) );
  MOAI22D1BWP30P140 U159 ( .A1(n91), .A2(n90), .B1(i_data_bus[40]), .B2(n89), 
        .ZN(N327) );
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
         n45, n46, n47, n48, n49, n50, n51, n52, n53, n54, n55, n56, n57, n58,
         n59, n60, n61, n62, n63, n64, n65, n66, n67, n68, n69, n70, n71, n72,
         n73, n74, n75, n76, n77, n78, n79, n80, n81, n82, n83, n84, n85, n86,
         n87, n88, n89;

  DFQD1BWP30P140 o_data_bus_inner_reg_63_ ( .D(N350), .CP(clk), .Q(
        o_data_bus[63]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_62_ ( .D(N349), .CP(clk), .Q(
        o_data_bus[62]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_61_ ( .D(N348), .CP(clk), .Q(
        o_data_bus[61]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_60_ ( .D(N347), .CP(clk), .Q(
        o_data_bus[60]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_59_ ( .D(N346), .CP(clk), .Q(
        o_data_bus[59]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_58_ ( .D(N345), .CP(clk), .Q(
        o_data_bus[58]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_57_ ( .D(N344), .CP(clk), .Q(
        o_data_bus[57]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_56_ ( .D(N343), .CP(clk), .Q(
        o_data_bus[56]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_55_ ( .D(N342), .CP(clk), .Q(
        o_data_bus[55]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_54_ ( .D(N341), .CP(clk), .Q(
        o_data_bus[54]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_53_ ( .D(N340), .CP(clk), .Q(
        o_data_bus[53]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_52_ ( .D(N339), .CP(clk), .Q(
        o_data_bus[52]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_51_ ( .D(N338), .CP(clk), .Q(
        o_data_bus[51]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_50_ ( .D(N337), .CP(clk), .Q(
        o_data_bus[50]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_49_ ( .D(N336), .CP(clk), .Q(
        o_data_bus[49]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_48_ ( .D(N335), .CP(clk), .Q(
        o_data_bus[48]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_47_ ( .D(N334), .CP(clk), .Q(
        o_data_bus[47]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_46_ ( .D(N333), .CP(clk), .Q(
        o_data_bus[46]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_45_ ( .D(N332), .CP(clk), .Q(
        o_data_bus[45]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_44_ ( .D(N331), .CP(clk), .Q(
        o_data_bus[44]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_43_ ( .D(N330), .CP(clk), .Q(
        o_data_bus[43]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_42_ ( .D(N329), .CP(clk), .Q(
        o_data_bus[42]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_41_ ( .D(N328), .CP(clk), .Q(
        o_data_bus[41]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_40_ ( .D(N327), .CP(clk), .Q(
        o_data_bus[40]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_39_ ( .D(N326), .CP(clk), .Q(
        o_data_bus[39]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_38_ ( .D(N325), .CP(clk), .Q(
        o_data_bus[38]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_37_ ( .D(N324), .CP(clk), .Q(
        o_data_bus[37]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_36_ ( .D(N323), .CP(clk), .Q(
        o_data_bus[36]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_35_ ( .D(N322), .CP(clk), .Q(
        o_data_bus[35]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_34_ ( .D(N321), .CP(clk), .Q(
        o_data_bus[34]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_33_ ( .D(N320), .CP(clk), .Q(
        o_data_bus[33]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_32_ ( .D(N319), .CP(clk), .Q(
        o_data_bus[32]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_31_ ( .D(N318), .CP(clk), .Q(
        o_data_bus[31]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_30_ ( .D(N317), .CP(clk), .Q(
        o_data_bus[30]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_29_ ( .D(N316), .CP(clk), .Q(
        o_data_bus[29]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_28_ ( .D(N315), .CP(clk), .Q(
        o_data_bus[28]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_27_ ( .D(N314), .CP(clk), .Q(
        o_data_bus[27]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_26_ ( .D(N313), .CP(clk), .Q(
        o_data_bus[26]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_25_ ( .D(N312), .CP(clk), .Q(
        o_data_bus[25]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_24_ ( .D(N311), .CP(clk), .Q(
        o_data_bus[24]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_23_ ( .D(N310), .CP(clk), .Q(
        o_data_bus[23]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_22_ ( .D(N309), .CP(clk), .Q(
        o_data_bus[22]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_21_ ( .D(N308), .CP(clk), .Q(
        o_data_bus[21]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_20_ ( .D(N307), .CP(clk), .Q(
        o_data_bus[20]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_19_ ( .D(N306), .CP(clk), .Q(
        o_data_bus[19]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_18_ ( .D(N305), .CP(clk), .Q(
        o_data_bus[18]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_17_ ( .D(N304), .CP(clk), .Q(
        o_data_bus[17]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_16_ ( .D(N303), .CP(clk), .Q(
        o_data_bus[16]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_15_ ( .D(N302), .CP(clk), .Q(
        o_data_bus[15]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_14_ ( .D(N301), .CP(clk), .Q(
        o_data_bus[14]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_13_ ( .D(N300), .CP(clk), .Q(
        o_data_bus[13]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_12_ ( .D(N299), .CP(clk), .Q(
        o_data_bus[12]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_11_ ( .D(N298), .CP(clk), .Q(
        o_data_bus[11]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_10_ ( .D(N297), .CP(clk), .Q(
        o_data_bus[10]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_9_ ( .D(N296), .CP(clk), .Q(
        o_data_bus[9]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_8_ ( .D(N295), .CP(clk), .Q(
        o_data_bus[8]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_7_ ( .D(N294), .CP(clk), .Q(
        o_data_bus[7]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_6_ ( .D(N293), .CP(clk), .Q(
        o_data_bus[6]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_5_ ( .D(N292), .CP(clk), .Q(
        o_data_bus[5]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_4_ ( .D(N291), .CP(clk), .Q(
        o_data_bus[4]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_3_ ( .D(N290), .CP(clk), .Q(
        o_data_bus[3]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_2_ ( .D(N289), .CP(clk), .Q(
        o_data_bus[2]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_1_ ( .D(N288), .CP(clk), .Q(
        o_data_bus[1]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_0_ ( .D(N287), .CP(clk), .Q(
        o_data_bus[0]) );
  DFQD4BWP30P140 o_valid_inner_reg_1_ ( .D(N354), .CP(clk), .Q(o_valid[1]) );
  DFQD2BWP30P140 o_valid_inner_reg_0_ ( .D(N353), .CP(clk), .Q(o_valid[0]) );
  INVD3BWP30P140 U3 ( .I(n1), .ZN(n2) );
  INVD1BWP30P140 U4 ( .I(n54), .ZN(n76) );
  NR2D1BWP30P140 U5 ( .A1(n49), .A2(n4), .ZN(n6) );
  AN2D2BWP30P140 U6 ( .A1(n45), .A2(n4), .Z(n1) );
  INVD6BWP30P140 U7 ( .I(n76), .ZN(n74) );
  INVD2BWP30P140 U8 ( .I(i_cmd[0]), .ZN(n4) );
  NR2D1BWP30P140 U9 ( .A1(n49), .A2(i_cmd[1]), .ZN(n53) );
  OAI22D1BWP30P140 U10 ( .A1(n20), .A2(n21), .B1(n2), .B2(n64), .ZN(N296) );
  OAI22D1BWP30P140 U11 ( .A1(n33), .A2(n28), .B1(n44), .B2(n65), .ZN(N297) );
  OAI22D1BWP30P140 U12 ( .A1(n20), .A2(n22), .B1(n44), .B2(n66), .ZN(N298) );
  OAI22D1BWP30P140 U13 ( .A1(n33), .A2(n27), .B1(n2), .B2(n67), .ZN(N299) );
  OAI22D1BWP30P140 U14 ( .A1(n33), .A2(n29), .B1(n44), .B2(n68), .ZN(N300) );
  OAI22D1BWP30P140 U15 ( .A1(n20), .A2(n31), .B1(n44), .B2(n69), .ZN(N301) );
  OAI22D1BWP30P140 U16 ( .A1(n20), .A2(n25), .B1(n2), .B2(n71), .ZN(N303) );
  OAI22D1BWP30P140 U17 ( .A1(n33), .A2(n30), .B1(n44), .B2(n72), .ZN(N304) );
  OAI22D1BWP30P140 U18 ( .A1(n33), .A2(n23), .B1(n2), .B2(n73), .ZN(N305) );
  OAI22D1BWP30P140 U19 ( .A1(n33), .A2(n32), .B1(n2), .B2(n75), .ZN(N306) );
  OAI22D1BWP30P140 U20 ( .A1(n20), .A2(n19), .B1(n2), .B2(n77), .ZN(N307) );
  OAI22D1BWP30P140 U21 ( .A1(n33), .A2(n18), .B1(n2), .B2(n78), .ZN(N308) );
  OAI22D1BWP30P140 U22 ( .A1(n20), .A2(n8), .B1(n2), .B2(n79), .ZN(N309) );
  OAI22D1BWP30P140 U23 ( .A1(n33), .A2(n9), .B1(n2), .B2(n80), .ZN(N310) );
  OAI22D1BWP30P140 U24 ( .A1(n20), .A2(n10), .B1(n2), .B2(n81), .ZN(N311) );
  OAI22D1BWP30P140 U25 ( .A1(n33), .A2(n11), .B1(n2), .B2(n82), .ZN(N312) );
  OAI22D1BWP30P140 U26 ( .A1(n20), .A2(n12), .B1(n2), .B2(n83), .ZN(N313) );
  OAI22D1BWP30P140 U27 ( .A1(n33), .A2(n14), .B1(n2), .B2(n85), .ZN(N315) );
  OAI22D1BWP30P140 U28 ( .A1(n20), .A2(n15), .B1(n44), .B2(n89), .ZN(N316) );
  OAI22D1BWP30P140 U29 ( .A1(n33), .A2(n16), .B1(n44), .B2(n87), .ZN(N317) );
  OAI22D1BWP30P140 U30 ( .A1(n20), .A2(n17), .B1(n2), .B2(n86), .ZN(N318) );
  INVD1BWP30P140 U31 ( .I(i_valid[0]), .ZN(n51) );
  ND2D1BWP30P140 U32 ( .A1(n3), .A2(i_en), .ZN(n49) );
  INVD1BWP30P140 U33 ( .I(n34), .ZN(n43) );
  AN3D4BWP30P140 U34 ( .A1(i_valid[1]), .A2(i_cmd[1]), .A3(n46), .Z(n88) );
  OAI31D1BWP30P140 U35 ( .A1(n49), .A2(n50), .A3(n4), .B(n2), .ZN(N353) );
  OAI22D1BWP30P140 U36 ( .A1(n20), .A2(n26), .B1(n44), .B2(n63), .ZN(N295) );
  OAI22D1BWP30P140 U37 ( .A1(n33), .A2(n24), .B1(n44), .B2(n70), .ZN(N302) );
  OAI22D1BWP30P140 U38 ( .A1(n20), .A2(n13), .B1(n44), .B2(n84), .ZN(N314) );
  INVD1BWP30P140 U39 ( .I(rst), .ZN(n3) );
  INVD2BWP30P140 U40 ( .I(i_valid[1]), .ZN(n50) );
  INR2D2BWP30P140 U41 ( .A1(i_valid[0]), .B1(n49), .ZN(n45) );
  MUX2NUD1BWP30P140 U42 ( .I0(n51), .I1(n50), .S(i_cmd[1]), .ZN(n5) );
  ND2OPTIBD1BWP30P140 U43 ( .A1(n6), .A2(n5), .ZN(n7) );
  INVD2BWP30P140 U44 ( .I(n7), .ZN(n34) );
  INVD2BWP30P140 U45 ( .I(n34), .ZN(n20) );
  INVD1BWP30P140 U46 ( .I(i_data_bus[54]), .ZN(n8) );
  INVD1BWP30P140 U47 ( .I(i_data_bus[22]), .ZN(n79) );
  INVD1BWP30P140 U48 ( .I(i_data_bus[55]), .ZN(n9) );
  INVD1BWP30P140 U49 ( .I(i_data_bus[23]), .ZN(n80) );
  INVD1BWP30P140 U50 ( .I(i_data_bus[56]), .ZN(n10) );
  INVD1BWP30P140 U51 ( .I(i_data_bus[24]), .ZN(n81) );
  INVD1BWP30P140 U52 ( .I(i_data_bus[57]), .ZN(n11) );
  INVD1BWP30P140 U53 ( .I(i_data_bus[25]), .ZN(n82) );
  INVD1BWP30P140 U54 ( .I(i_data_bus[58]), .ZN(n12) );
  INVD1BWP30P140 U55 ( .I(i_data_bus[26]), .ZN(n83) );
  INVD1BWP30P140 U56 ( .I(i_data_bus[59]), .ZN(n13) );
  INVD1BWP30P140 U57 ( .I(i_data_bus[27]), .ZN(n84) );
  INVD1BWP30P140 U58 ( .I(i_data_bus[60]), .ZN(n14) );
  INVD1BWP30P140 U59 ( .I(i_data_bus[28]), .ZN(n85) );
  INVD1BWP30P140 U60 ( .I(i_data_bus[61]), .ZN(n15) );
  INVD1BWP30P140 U61 ( .I(i_data_bus[29]), .ZN(n89) );
  INVD1BWP30P140 U62 ( .I(i_data_bus[62]), .ZN(n16) );
  INVD1BWP30P140 U63 ( .I(i_data_bus[30]), .ZN(n87) );
  INVD1BWP30P140 U64 ( .I(i_data_bus[63]), .ZN(n17) );
  INVD1BWP30P140 U65 ( .I(i_data_bus[31]), .ZN(n86) );
  INVD1BWP30P140 U66 ( .I(i_data_bus[53]), .ZN(n18) );
  INVD1BWP30P140 U67 ( .I(i_data_bus[21]), .ZN(n78) );
  INVD1BWP30P140 U68 ( .I(i_data_bus[52]), .ZN(n19) );
  INVD1BWP30P140 U69 ( .I(i_data_bus[20]), .ZN(n77) );
  INVD2BWP30P140 U70 ( .I(n34), .ZN(n33) );
  INVD1BWP30P140 U71 ( .I(i_data_bus[41]), .ZN(n21) );
  INVD3BWP30P140 U72 ( .I(n1), .ZN(n44) );
  INVD1BWP30P140 U73 ( .I(i_data_bus[9]), .ZN(n64) );
  INVD1BWP30P140 U74 ( .I(i_data_bus[43]), .ZN(n22) );
  INVD1BWP30P140 U75 ( .I(i_data_bus[11]), .ZN(n66) );
  INVD1BWP30P140 U76 ( .I(i_data_bus[50]), .ZN(n23) );
  INVD1BWP30P140 U77 ( .I(i_data_bus[18]), .ZN(n73) );
  INVD1BWP30P140 U78 ( .I(i_data_bus[47]), .ZN(n24) );
  INVD1BWP30P140 U79 ( .I(i_data_bus[15]), .ZN(n70) );
  INVD1BWP30P140 U80 ( .I(i_data_bus[48]), .ZN(n25) );
  INVD1BWP30P140 U81 ( .I(i_data_bus[16]), .ZN(n71) );
  INVD1BWP30P140 U82 ( .I(i_data_bus[40]), .ZN(n26) );
  INVD1BWP30P140 U83 ( .I(i_data_bus[8]), .ZN(n63) );
  INVD1BWP30P140 U84 ( .I(i_data_bus[44]), .ZN(n27) );
  INVD1BWP30P140 U85 ( .I(i_data_bus[12]), .ZN(n67) );
  INVD1BWP30P140 U86 ( .I(i_data_bus[42]), .ZN(n28) );
  INVD1BWP30P140 U87 ( .I(i_data_bus[10]), .ZN(n65) );
  INVD1BWP30P140 U88 ( .I(i_data_bus[45]), .ZN(n29) );
  INVD1BWP30P140 U89 ( .I(i_data_bus[13]), .ZN(n68) );
  INVD1BWP30P140 U90 ( .I(i_data_bus[49]), .ZN(n30) );
  INVD1BWP30P140 U91 ( .I(i_data_bus[17]), .ZN(n72) );
  INVD1BWP30P140 U92 ( .I(i_data_bus[46]), .ZN(n31) );
  INVD1BWP30P140 U93 ( .I(i_data_bus[14]), .ZN(n69) );
  INVD1BWP30P140 U94 ( .I(i_data_bus[51]), .ZN(n32) );
  INVD1BWP30P140 U95 ( .I(i_data_bus[19]), .ZN(n75) );
  INVD1BWP30P140 U96 ( .I(i_data_bus[7]), .ZN(n55) );
  INVD1BWP30P140 U97 ( .I(i_data_bus[39]), .ZN(n35) );
  OAI22D1BWP30P140 U98 ( .A1(n44), .A2(n55), .B1(n43), .B2(n35), .ZN(N294) );
  INVD1BWP30P140 U99 ( .I(i_data_bus[6]), .ZN(n58) );
  INVD1BWP30P140 U100 ( .I(i_data_bus[38]), .ZN(n36) );
  OAI22D1BWP30P140 U101 ( .A1(n2), .A2(n58), .B1(n43), .B2(n36), .ZN(N293) );
  INVD1BWP30P140 U102 ( .I(i_data_bus[5]), .ZN(n59) );
  INVD1BWP30P140 U103 ( .I(i_data_bus[37]), .ZN(n37) );
  OAI22D1BWP30P140 U104 ( .A1(n44), .A2(n59), .B1(n43), .B2(n37), .ZN(N292) );
  INVD1BWP30P140 U105 ( .I(i_data_bus[4]), .ZN(n60) );
  INVD1BWP30P140 U106 ( .I(i_data_bus[36]), .ZN(n38) );
  OAI22D1BWP30P140 U107 ( .A1(n44), .A2(n60), .B1(n43), .B2(n38), .ZN(N291) );
  INVD1BWP30P140 U108 ( .I(i_data_bus[3]), .ZN(n57) );
  INVD1BWP30P140 U109 ( .I(i_data_bus[35]), .ZN(n39) );
  OAI22D1BWP30P140 U110 ( .A1(n2), .A2(n57), .B1(n43), .B2(n39), .ZN(N290) );
  INVD1BWP30P140 U111 ( .I(i_data_bus[2]), .ZN(n61) );
  INVD1BWP30P140 U112 ( .I(i_data_bus[34]), .ZN(n40) );
  OAI22D1BWP30P140 U113 ( .A1(n44), .A2(n61), .B1(n20), .B2(n40), .ZN(N289) );
  INVD1BWP30P140 U114 ( .I(i_data_bus[1]), .ZN(n62) );
  INVD1BWP30P140 U115 ( .I(i_data_bus[33]), .ZN(n41) );
  OAI22D1BWP30P140 U116 ( .A1(n2), .A2(n62), .B1(n33), .B2(n41), .ZN(N288) );
  INVD1BWP30P140 U117 ( .I(i_data_bus[0]), .ZN(n56) );
  INVD1BWP30P140 U118 ( .I(i_data_bus[32]), .ZN(n42) );
  OAI22D1BWP30P140 U119 ( .A1(n44), .A2(n56), .B1(n20), .B2(n42), .ZN(N287) );
  INVD1BWP30P140 U120 ( .I(n45), .ZN(n48) );
  INVD1BWP30P140 U121 ( .I(n49), .ZN(n46) );
  INVD1BWP30P140 U122 ( .I(n88), .ZN(n47) );
  OAI21D1BWP30P140 U123 ( .A1(n48), .A2(i_cmd[1]), .B(n47), .ZN(N354) );
  MUX2NUD1BWP30P140 U124 ( .I0(n51), .I1(n50), .S(i_cmd[0]), .ZN(n52) );
  ND2OPTIBD1BWP30P140 U125 ( .A1(n53), .A2(n52), .ZN(n54) );
  MOAI22D1BWP30P140 U126 ( .A1(n55), .A2(n74), .B1(i_data_bus[39]), .B2(n88), 
        .ZN(N326) );
  MOAI22D1BWP30P140 U127 ( .A1(n56), .A2(n74), .B1(i_data_bus[32]), .B2(n88), 
        .ZN(N319) );
  MOAI22D1BWP30P140 U128 ( .A1(n57), .A2(n74), .B1(i_data_bus[35]), .B2(n88), 
        .ZN(N322) );
  MOAI22D1BWP30P140 U129 ( .A1(n58), .A2(n74), .B1(i_data_bus[38]), .B2(n88), 
        .ZN(N325) );
  MOAI22D1BWP30P140 U130 ( .A1(n59), .A2(n74), .B1(i_data_bus[37]), .B2(n88), 
        .ZN(N324) );
  MOAI22D1BWP30P140 U131 ( .A1(n60), .A2(n74), .B1(i_data_bus[36]), .B2(n88), 
        .ZN(N323) );
  MOAI22D1BWP30P140 U132 ( .A1(n61), .A2(n74), .B1(i_data_bus[34]), .B2(n88), 
        .ZN(N321) );
  MOAI22D1BWP30P140 U133 ( .A1(n62), .A2(n74), .B1(i_data_bus[33]), .B2(n88), 
        .ZN(N320) );
  MOAI22D1BWP30P140 U134 ( .A1(n63), .A2(n74), .B1(i_data_bus[40]), .B2(n88), 
        .ZN(N327) );
  MOAI22D1BWP30P140 U135 ( .A1(n64), .A2(n74), .B1(i_data_bus[41]), .B2(n88), 
        .ZN(N328) );
  MOAI22D1BWP30P140 U136 ( .A1(n65), .A2(n74), .B1(i_data_bus[42]), .B2(n88), 
        .ZN(N329) );
  MOAI22D1BWP30P140 U137 ( .A1(n66), .A2(n74), .B1(i_data_bus[43]), .B2(n88), 
        .ZN(N330) );
  MOAI22D1BWP30P140 U138 ( .A1(n67), .A2(n74), .B1(i_data_bus[44]), .B2(n88), 
        .ZN(N331) );
  MOAI22D1BWP30P140 U139 ( .A1(n68), .A2(n74), .B1(i_data_bus[45]), .B2(n88), 
        .ZN(N332) );
  MOAI22D1BWP30P140 U140 ( .A1(n69), .A2(n74), .B1(i_data_bus[46]), .B2(n88), 
        .ZN(N333) );
  MOAI22D1BWP30P140 U141 ( .A1(n70), .A2(n74), .B1(i_data_bus[47]), .B2(n88), 
        .ZN(N334) );
  MOAI22D1BWP30P140 U142 ( .A1(n71), .A2(n74), .B1(i_data_bus[48]), .B2(n88), 
        .ZN(N335) );
  MOAI22D1BWP30P140 U143 ( .A1(n72), .A2(n74), .B1(i_data_bus[49]), .B2(n88), 
        .ZN(N336) );
  MOAI22D1BWP30P140 U144 ( .A1(n73), .A2(n74), .B1(i_data_bus[50]), .B2(n88), 
        .ZN(N337) );
  MOAI22D1BWP30P140 U145 ( .A1(n75), .A2(n74), .B1(i_data_bus[51]), .B2(n88), 
        .ZN(N338) );
  MOAI22D1BWP30P140 U146 ( .A1(n77), .A2(n74), .B1(i_data_bus[52]), .B2(n88), 
        .ZN(N339) );
  MOAI22D1BWP30P140 U147 ( .A1(n78), .A2(n74), .B1(i_data_bus[53]), .B2(n88), 
        .ZN(N340) );
  MOAI22D1BWP30P140 U148 ( .A1(n79), .A2(n74), .B1(i_data_bus[54]), .B2(n88), 
        .ZN(N341) );
  MOAI22D1BWP30P140 U149 ( .A1(n80), .A2(n74), .B1(i_data_bus[55]), .B2(n88), 
        .ZN(N342) );
  MOAI22D1BWP30P140 U150 ( .A1(n81), .A2(n74), .B1(i_data_bus[56]), .B2(n88), 
        .ZN(N343) );
  MOAI22D1BWP30P140 U151 ( .A1(n82), .A2(n74), .B1(i_data_bus[57]), .B2(n88), 
        .ZN(N344) );
  MOAI22D1BWP30P140 U152 ( .A1(n83), .A2(n74), .B1(i_data_bus[58]), .B2(n88), 
        .ZN(N345) );
  MOAI22D1BWP30P140 U153 ( .A1(n84), .A2(n74), .B1(i_data_bus[59]), .B2(n88), 
        .ZN(N346) );
  MOAI22D1BWP30P140 U154 ( .A1(n85), .A2(n74), .B1(i_data_bus[60]), .B2(n88), 
        .ZN(N347) );
  MOAI22D1BWP30P140 U155 ( .A1(n86), .A2(n74), .B1(i_data_bus[63]), .B2(n88), 
        .ZN(N350) );
  MOAI22D1BWP30P140 U156 ( .A1(n87), .A2(n74), .B1(i_data_bus[62]), .B2(n88), 
        .ZN(N349) );
  MOAI22D1BWP30P140 U157 ( .A1(n89), .A2(n74), .B1(i_data_bus[61]), .B2(n88), 
        .ZN(N348) );
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
         n45, n46, n47, n48, n49, n50, n51, n52, n53, n54, n55, n56, n57, n58,
         n59, n60, n61, n62, n63, n64, n65, n66, n67, n68, n69, n70, n71, n72,
         n73, n74, n75, n76, n77, n78, n79, n80, n81, n82, n83, n84, n85, n86,
         n87, n88, n89, n90;

  DFQD1BWP30P140 o_data_bus_inner_reg_63_ ( .D(N350), .CP(clk), .Q(
        o_data_bus[63]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_62_ ( .D(N349), .CP(clk), .Q(
        o_data_bus[62]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_61_ ( .D(N348), .CP(clk), .Q(
        o_data_bus[61]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_60_ ( .D(N347), .CP(clk), .Q(
        o_data_bus[60]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_59_ ( .D(N346), .CP(clk), .Q(
        o_data_bus[59]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_58_ ( .D(N345), .CP(clk), .Q(
        o_data_bus[58]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_57_ ( .D(N344), .CP(clk), .Q(
        o_data_bus[57]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_56_ ( .D(N343), .CP(clk), .Q(
        o_data_bus[56]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_55_ ( .D(N342), .CP(clk), .Q(
        o_data_bus[55]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_54_ ( .D(N341), .CP(clk), .Q(
        o_data_bus[54]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_53_ ( .D(N340), .CP(clk), .Q(
        o_data_bus[53]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_52_ ( .D(N339), .CP(clk), .Q(
        o_data_bus[52]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_51_ ( .D(N338), .CP(clk), .Q(
        o_data_bus[51]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_50_ ( .D(N337), .CP(clk), .Q(
        o_data_bus[50]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_49_ ( .D(N336), .CP(clk), .Q(
        o_data_bus[49]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_48_ ( .D(N335), .CP(clk), .Q(
        o_data_bus[48]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_47_ ( .D(N334), .CP(clk), .Q(
        o_data_bus[47]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_46_ ( .D(N333), .CP(clk), .Q(
        o_data_bus[46]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_45_ ( .D(N332), .CP(clk), .Q(
        o_data_bus[45]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_44_ ( .D(N331), .CP(clk), .Q(
        o_data_bus[44]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_43_ ( .D(N330), .CP(clk), .Q(
        o_data_bus[43]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_42_ ( .D(N329), .CP(clk), .Q(
        o_data_bus[42]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_41_ ( .D(N328), .CP(clk), .Q(
        o_data_bus[41]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_40_ ( .D(N327), .CP(clk), .Q(
        o_data_bus[40]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_39_ ( .D(N326), .CP(clk), .Q(
        o_data_bus[39]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_38_ ( .D(N325), .CP(clk), .Q(
        o_data_bus[38]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_37_ ( .D(N324), .CP(clk), .Q(
        o_data_bus[37]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_36_ ( .D(N323), .CP(clk), .Q(
        o_data_bus[36]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_35_ ( .D(N322), .CP(clk), .Q(
        o_data_bus[35]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_34_ ( .D(N321), .CP(clk), .Q(
        o_data_bus[34]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_33_ ( .D(N320), .CP(clk), .Q(
        o_data_bus[33]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_32_ ( .D(N319), .CP(clk), .Q(
        o_data_bus[32]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_31_ ( .D(N318), .CP(clk), .Q(
        o_data_bus[31]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_30_ ( .D(N317), .CP(clk), .Q(
        o_data_bus[30]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_29_ ( .D(N316), .CP(clk), .Q(
        o_data_bus[29]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_28_ ( .D(N315), .CP(clk), .Q(
        o_data_bus[28]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_27_ ( .D(N314), .CP(clk), .Q(
        o_data_bus[27]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_26_ ( .D(N313), .CP(clk), .Q(
        o_data_bus[26]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_25_ ( .D(N312), .CP(clk), .Q(
        o_data_bus[25]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_24_ ( .D(N311), .CP(clk), .Q(
        o_data_bus[24]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_23_ ( .D(N310), .CP(clk), .Q(
        o_data_bus[23]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_22_ ( .D(N309), .CP(clk), .Q(
        o_data_bus[22]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_21_ ( .D(N308), .CP(clk), .Q(
        o_data_bus[21]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_20_ ( .D(N307), .CP(clk), .Q(
        o_data_bus[20]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_19_ ( .D(N306), .CP(clk), .Q(
        o_data_bus[19]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_18_ ( .D(N305), .CP(clk), .Q(
        o_data_bus[18]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_17_ ( .D(N304), .CP(clk), .Q(
        o_data_bus[17]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_16_ ( .D(N303), .CP(clk), .Q(
        o_data_bus[16]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_15_ ( .D(N302), .CP(clk), .Q(
        o_data_bus[15]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_14_ ( .D(N301), .CP(clk), .Q(
        o_data_bus[14]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_13_ ( .D(N300), .CP(clk), .Q(
        o_data_bus[13]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_12_ ( .D(N299), .CP(clk), .Q(
        o_data_bus[12]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_11_ ( .D(N298), .CP(clk), .Q(
        o_data_bus[11]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_10_ ( .D(N297), .CP(clk), .Q(
        o_data_bus[10]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_9_ ( .D(N296), .CP(clk), .Q(
        o_data_bus[9]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_8_ ( .D(N295), .CP(clk), .Q(
        o_data_bus[8]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_7_ ( .D(N294), .CP(clk), .Q(
        o_data_bus[7]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_6_ ( .D(N293), .CP(clk), .Q(
        o_data_bus[6]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_5_ ( .D(N292), .CP(clk), .Q(
        o_data_bus[5]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_4_ ( .D(N291), .CP(clk), .Q(
        o_data_bus[4]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_3_ ( .D(N290), .CP(clk), .Q(
        o_data_bus[3]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_2_ ( .D(N289), .CP(clk), .Q(
        o_data_bus[2]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_1_ ( .D(N288), .CP(clk), .Q(
        o_data_bus[1]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_0_ ( .D(N287), .CP(clk), .Q(
        o_data_bus[0]) );
  DFQD4BWP30P140 o_valid_inner_reg_0_ ( .D(N353), .CP(clk), .Q(o_valid[0]) );
  DFQD2BWP30P140 o_valid_inner_reg_1_ ( .D(N354), .CP(clk), .Q(o_valid[1]) );
  AN3D4BWP30P140 U3 ( .A1(i_valid[1]), .A2(i_cmd[1]), .A3(n48), .Z(n88) );
  NR2D1BWP30P140 U4 ( .A1(n51), .A2(n4), .ZN(n6) );
  INVD1BWP30P140 U5 ( .I(i_cmd[0]), .ZN(n4) );
  INVD4BWP30P140 U6 ( .I(n8), .ZN(n46) );
  INVD1BWP30P140 U7 ( .I(n3), .ZN(n8) );
  ND2OPTIBD1BWP30P140 U8 ( .A1(n47), .A2(n4), .ZN(n3) );
  NR2D1BWP30P140 U9 ( .A1(n51), .A2(i_cmd[1]), .ZN(n55) );
  INVD1BWP30P140 U10 ( .I(n36), .ZN(n21) );
  INVD1BWP30P140 U11 ( .I(n8), .ZN(n33) );
  INVD1BWP30P140 U12 ( .I(n36), .ZN(n35) );
  INVD2BWP30P140 U13 ( .I(i_valid[0]), .ZN(n53) );
  ND2D1BWP30P140 U14 ( .A1(n2), .A2(i_en), .ZN(n51) );
  INVD1BWP30P140 U15 ( .I(n36), .ZN(n45) );
  OAI31D1BWP30P140 U16 ( .A1(n51), .A2(n52), .A3(n4), .B(n33), .ZN(N353) );
  OAI22D1BWP30P140 U17 ( .A1(n21), .A2(n9), .B1(n46), .B2(n87), .ZN(N295) );
  OAI22D1BWP30P140 U18 ( .A1(n21), .A2(n10), .B1(n46), .B2(n86), .ZN(N296) );
  OAI22D1BWP30P140 U19 ( .A1(n21), .A2(n11), .B1(n46), .B2(n85), .ZN(N297) );
  OAI22D1BWP30P140 U20 ( .A1(n21), .A2(n12), .B1(n46), .B2(n90), .ZN(N298) );
  OAI22D1BWP30P140 U21 ( .A1(n21), .A2(n13), .B1(n46), .B2(n84), .ZN(N299) );
  OAI22D1BWP30P140 U22 ( .A1(n21), .A2(n14), .B1(n46), .B2(n83), .ZN(N300) );
  OAI22D1BWP30P140 U23 ( .A1(n21), .A2(n15), .B1(n46), .B2(n82), .ZN(N301) );
  OAI22D1BWP30P140 U24 ( .A1(n21), .A2(n16), .B1(n46), .B2(n81), .ZN(N302) );
  OAI22D1BWP30P140 U25 ( .A1(n21), .A2(n17), .B1(n46), .B2(n80), .ZN(N303) );
  OAI22D1BWP30P140 U26 ( .A1(n21), .A2(n18), .B1(n46), .B2(n79), .ZN(N304) );
  OAI22D1BWP30P140 U27 ( .A1(n21), .A2(n19), .B1(n46), .B2(n78), .ZN(N305) );
  OAI22D1BWP30P140 U28 ( .A1(n21), .A2(n20), .B1(n46), .B2(n64), .ZN(N306) );
  OAI22D1BWP30P140 U29 ( .A1(n35), .A2(n22), .B1(n46), .B2(n65), .ZN(N307) );
  OAI22D1BWP30P140 U30 ( .A1(n35), .A2(n23), .B1(n46), .B2(n66), .ZN(N308) );
  OAI22D1BWP30P140 U31 ( .A1(n35), .A2(n24), .B1(n46), .B2(n67), .ZN(N309) );
  OAI22D1BWP30P140 U32 ( .A1(n35), .A2(n25), .B1(n46), .B2(n68), .ZN(N310) );
  OAI22D1BWP30P140 U33 ( .A1(n35), .A2(n26), .B1(n46), .B2(n69), .ZN(N311) );
  OAI22D1BWP30P140 U34 ( .A1(n35), .A2(n27), .B1(n46), .B2(n70), .ZN(N312) );
  OAI22D1BWP30P140 U35 ( .A1(n35), .A2(n28), .B1(n46), .B2(n71), .ZN(N313) );
  OAI22D1BWP30P140 U36 ( .A1(n35), .A2(n29), .B1(n33), .B2(n72), .ZN(N314) );
  OAI22D1BWP30P140 U37 ( .A1(n35), .A2(n30), .B1(n33), .B2(n73), .ZN(N315) );
  OAI22D1BWP30P140 U38 ( .A1(n35), .A2(n31), .B1(n33), .B2(n74), .ZN(N316) );
  OAI22D1BWP30P140 U39 ( .A1(n35), .A2(n32), .B1(n33), .B2(n75), .ZN(N317) );
  OAI22D1BWP30P140 U40 ( .A1(n35), .A2(n34), .B1(n33), .B2(n77), .ZN(N318) );
  AN2D1BWP30P140 U41 ( .A1(n54), .A2(n55), .Z(n1) );
  INVD1BWP30P140 U42 ( .I(rst), .ZN(n2) );
  INVD2BWP30P140 U43 ( .I(i_valid[1]), .ZN(n52) );
  INR2D2BWP30P140 U44 ( .A1(i_valid[0]), .B1(n51), .ZN(n47) );
  MUX2NUD1BWP30P140 U45 ( .I0(n53), .I1(n52), .S(i_cmd[1]), .ZN(n5) );
  ND2OPTIBD1BWP30P140 U46 ( .A1(n6), .A2(n5), .ZN(n7) );
  INVD2BWP30P140 U47 ( .I(n7), .ZN(n36) );
  INVD1BWP30P140 U48 ( .I(i_data_bus[40]), .ZN(n9) );
  INVD1BWP30P140 U49 ( .I(i_data_bus[8]), .ZN(n87) );
  INVD1BWP30P140 U50 ( .I(i_data_bus[41]), .ZN(n10) );
  INVD1BWP30P140 U51 ( .I(i_data_bus[9]), .ZN(n86) );
  INVD1BWP30P140 U52 ( .I(i_data_bus[42]), .ZN(n11) );
  INVD1BWP30P140 U53 ( .I(i_data_bus[10]), .ZN(n85) );
  INVD1BWP30P140 U54 ( .I(i_data_bus[43]), .ZN(n12) );
  INVD1BWP30P140 U55 ( .I(i_data_bus[11]), .ZN(n90) );
  INVD1BWP30P140 U56 ( .I(i_data_bus[44]), .ZN(n13) );
  INVD1BWP30P140 U57 ( .I(i_data_bus[12]), .ZN(n84) );
  INVD1BWP30P140 U58 ( .I(i_data_bus[45]), .ZN(n14) );
  INVD1BWP30P140 U59 ( .I(i_data_bus[13]), .ZN(n83) );
  INVD1BWP30P140 U60 ( .I(i_data_bus[46]), .ZN(n15) );
  INVD1BWP30P140 U61 ( .I(i_data_bus[14]), .ZN(n82) );
  INVD1BWP30P140 U62 ( .I(i_data_bus[47]), .ZN(n16) );
  INVD1BWP30P140 U63 ( .I(i_data_bus[15]), .ZN(n81) );
  INVD1BWP30P140 U64 ( .I(i_data_bus[48]), .ZN(n17) );
  INVD1BWP30P140 U65 ( .I(i_data_bus[16]), .ZN(n80) );
  INVD1BWP30P140 U66 ( .I(i_data_bus[49]), .ZN(n18) );
  INVD1BWP30P140 U67 ( .I(i_data_bus[17]), .ZN(n79) );
  INVD1BWP30P140 U68 ( .I(i_data_bus[50]), .ZN(n19) );
  INVD1BWP30P140 U69 ( .I(i_data_bus[18]), .ZN(n78) );
  INVD1BWP30P140 U70 ( .I(i_data_bus[51]), .ZN(n20) );
  INVD1BWP30P140 U71 ( .I(i_data_bus[19]), .ZN(n64) );
  INVD1BWP30P140 U72 ( .I(i_data_bus[52]), .ZN(n22) );
  INVD1BWP30P140 U73 ( .I(i_data_bus[20]), .ZN(n65) );
  INVD1BWP30P140 U74 ( .I(i_data_bus[53]), .ZN(n23) );
  INVD1BWP30P140 U75 ( .I(i_data_bus[21]), .ZN(n66) );
  INVD1BWP30P140 U76 ( .I(i_data_bus[54]), .ZN(n24) );
  INVD1BWP30P140 U77 ( .I(i_data_bus[22]), .ZN(n67) );
  INVD1BWP30P140 U78 ( .I(i_data_bus[55]), .ZN(n25) );
  INVD1BWP30P140 U79 ( .I(i_data_bus[23]), .ZN(n68) );
  INVD1BWP30P140 U80 ( .I(i_data_bus[56]), .ZN(n26) );
  INVD1BWP30P140 U81 ( .I(i_data_bus[24]), .ZN(n69) );
  INVD1BWP30P140 U82 ( .I(i_data_bus[57]), .ZN(n27) );
  INVD1BWP30P140 U83 ( .I(i_data_bus[25]), .ZN(n70) );
  INVD1BWP30P140 U84 ( .I(i_data_bus[58]), .ZN(n28) );
  INVD1BWP30P140 U85 ( .I(i_data_bus[26]), .ZN(n71) );
  INVD1BWP30P140 U86 ( .I(i_data_bus[59]), .ZN(n29) );
  INVD1BWP30P140 U87 ( .I(i_data_bus[27]), .ZN(n72) );
  INVD1BWP30P140 U88 ( .I(i_data_bus[60]), .ZN(n30) );
  INVD1BWP30P140 U89 ( .I(i_data_bus[28]), .ZN(n73) );
  INVD1BWP30P140 U90 ( .I(i_data_bus[61]), .ZN(n31) );
  INVD1BWP30P140 U91 ( .I(i_data_bus[29]), .ZN(n74) );
  INVD1BWP30P140 U92 ( .I(i_data_bus[62]), .ZN(n32) );
  INVD1BWP30P140 U93 ( .I(i_data_bus[30]), .ZN(n75) );
  INVD1BWP30P140 U94 ( .I(i_data_bus[63]), .ZN(n34) );
  INVD1BWP30P140 U95 ( .I(i_data_bus[31]), .ZN(n77) );
  INVD1BWP30P140 U96 ( .I(i_data_bus[7]), .ZN(n56) );
  INVD1BWP30P140 U97 ( .I(i_data_bus[39]), .ZN(n37) );
  OAI22D1BWP30P140 U98 ( .A1(n46), .A2(n56), .B1(n45), .B2(n37), .ZN(N294) );
  INVD1BWP30P140 U99 ( .I(i_data_bus[6]), .ZN(n57) );
  INVD1BWP30P140 U100 ( .I(i_data_bus[38]), .ZN(n38) );
  OAI22D1BWP30P140 U101 ( .A1(n46), .A2(n57), .B1(n45), .B2(n38), .ZN(N293) );
  INVD1BWP30P140 U102 ( .I(i_data_bus[5]), .ZN(n58) );
  INVD1BWP30P140 U103 ( .I(i_data_bus[37]), .ZN(n39) );
  OAI22D1BWP30P140 U104 ( .A1(n46), .A2(n58), .B1(n45), .B2(n39), .ZN(N292) );
  INVD1BWP30P140 U105 ( .I(i_data_bus[4]), .ZN(n63) );
  INVD1BWP30P140 U106 ( .I(i_data_bus[36]), .ZN(n40) );
  OAI22D1BWP30P140 U107 ( .A1(n46), .A2(n63), .B1(n45), .B2(n40), .ZN(N291) );
  INVD1BWP30P140 U108 ( .I(i_data_bus[3]), .ZN(n59) );
  INVD1BWP30P140 U109 ( .I(i_data_bus[35]), .ZN(n41) );
  OAI22D1BWP30P140 U110 ( .A1(n46), .A2(n59), .B1(n45), .B2(n41), .ZN(N290) );
  INVD1BWP30P140 U111 ( .I(i_data_bus[2]), .ZN(n60) );
  INVD1BWP30P140 U112 ( .I(i_data_bus[34]), .ZN(n42) );
  OAI22D1BWP30P140 U113 ( .A1(n46), .A2(n60), .B1(n45), .B2(n42), .ZN(N289) );
  INVD1BWP30P140 U114 ( .I(i_data_bus[1]), .ZN(n61) );
  INVD1BWP30P140 U115 ( .I(i_data_bus[33]), .ZN(n43) );
  OAI22D1BWP30P140 U116 ( .A1(n46), .A2(n61), .B1(n45), .B2(n43), .ZN(N288) );
  INVD1BWP30P140 U117 ( .I(i_data_bus[0]), .ZN(n62) );
  INVD1BWP30P140 U118 ( .I(i_data_bus[32]), .ZN(n44) );
  OAI22D1BWP30P140 U119 ( .A1(n46), .A2(n62), .B1(n45), .B2(n44), .ZN(N287) );
  INVD1BWP30P140 U120 ( .I(n47), .ZN(n50) );
  INVD1BWP30P140 U121 ( .I(n51), .ZN(n48) );
  INVD1BWP30P140 U122 ( .I(n88), .ZN(n49) );
  OAI21D1BWP30P140 U123 ( .A1(n50), .A2(i_cmd[1]), .B(n49), .ZN(N354) );
  MUX2NUD1BWP30P140 U124 ( .I0(n53), .I1(n52), .S(i_cmd[0]), .ZN(n54) );
  MOAI22D1BWP30P140 U125 ( .A1(n56), .A2(n89), .B1(i_data_bus[39]), .B2(n88), 
        .ZN(N326) );
  MOAI22D1BWP30P140 U126 ( .A1(n57), .A2(n76), .B1(i_data_bus[38]), .B2(n88), 
        .ZN(N325) );
  MOAI22D1BWP30P140 U127 ( .A1(n58), .A2(n89), .B1(i_data_bus[37]), .B2(n88), 
        .ZN(N324) );
  MOAI22D1BWP30P140 U128 ( .A1(n59), .A2(n76), .B1(i_data_bus[35]), .B2(n88), 
        .ZN(N322) );
  MOAI22D1BWP30P140 U129 ( .A1(n60), .A2(n89), .B1(i_data_bus[34]), .B2(n88), 
        .ZN(N321) );
  MOAI22D1BWP30P140 U130 ( .A1(n61), .A2(n76), .B1(i_data_bus[33]), .B2(n88), 
        .ZN(N320) );
  MOAI22D1BWP30P140 U131 ( .A1(n62), .A2(n89), .B1(i_data_bus[32]), .B2(n88), 
        .ZN(N319) );
  MOAI22D1BWP30P140 U132 ( .A1(n63), .A2(n76), .B1(i_data_bus[36]), .B2(n88), 
        .ZN(N323) );
  INVD2BWP30P140 U133 ( .I(n1), .ZN(n89) );
  MOAI22D1BWP30P140 U134 ( .A1(n64), .A2(n89), .B1(i_data_bus[51]), .B2(n88), 
        .ZN(N338) );
  INVD2BWP30P140 U135 ( .I(n1), .ZN(n76) );
  MOAI22D1BWP30P140 U136 ( .A1(n65), .A2(n76), .B1(i_data_bus[52]), .B2(n88), 
        .ZN(N339) );
  MOAI22D1BWP30P140 U137 ( .A1(n66), .A2(n76), .B1(i_data_bus[53]), .B2(n88), 
        .ZN(N340) );
  MOAI22D1BWP30P140 U138 ( .A1(n67), .A2(n76), .B1(i_data_bus[54]), .B2(n88), 
        .ZN(N341) );
  MOAI22D1BWP30P140 U139 ( .A1(n68), .A2(n76), .B1(i_data_bus[55]), .B2(n88), 
        .ZN(N342) );
  MOAI22D1BWP30P140 U140 ( .A1(n69), .A2(n76), .B1(i_data_bus[56]), .B2(n88), 
        .ZN(N343) );
  MOAI22D1BWP30P140 U141 ( .A1(n70), .A2(n76), .B1(i_data_bus[57]), .B2(n88), 
        .ZN(N344) );
  MOAI22D1BWP30P140 U142 ( .A1(n71), .A2(n76), .B1(i_data_bus[58]), .B2(n88), 
        .ZN(N345) );
  MOAI22D1BWP30P140 U143 ( .A1(n72), .A2(n76), .B1(i_data_bus[59]), .B2(n88), 
        .ZN(N346) );
  MOAI22D1BWP30P140 U144 ( .A1(n73), .A2(n76), .B1(i_data_bus[60]), .B2(n88), 
        .ZN(N347) );
  MOAI22D1BWP30P140 U145 ( .A1(n74), .A2(n76), .B1(i_data_bus[61]), .B2(n88), 
        .ZN(N348) );
  MOAI22D1BWP30P140 U146 ( .A1(n75), .A2(n76), .B1(i_data_bus[62]), .B2(n88), 
        .ZN(N349) );
  MOAI22D1BWP30P140 U147 ( .A1(n77), .A2(n76), .B1(i_data_bus[63]), .B2(n88), 
        .ZN(N350) );
  MOAI22D1BWP30P140 U148 ( .A1(n78), .A2(n89), .B1(i_data_bus[50]), .B2(n88), 
        .ZN(N337) );
  MOAI22D1BWP30P140 U149 ( .A1(n79), .A2(n89), .B1(i_data_bus[49]), .B2(n88), 
        .ZN(N336) );
  MOAI22D1BWP30P140 U150 ( .A1(n80), .A2(n89), .B1(i_data_bus[48]), .B2(n88), 
        .ZN(N335) );
  MOAI22D1BWP30P140 U151 ( .A1(n81), .A2(n89), .B1(i_data_bus[47]), .B2(n88), 
        .ZN(N334) );
  MOAI22D1BWP30P140 U152 ( .A1(n82), .A2(n89), .B1(i_data_bus[46]), .B2(n88), 
        .ZN(N333) );
  MOAI22D1BWP30P140 U153 ( .A1(n83), .A2(n89), .B1(i_data_bus[45]), .B2(n88), 
        .ZN(N332) );
  MOAI22D1BWP30P140 U154 ( .A1(n84), .A2(n89), .B1(i_data_bus[44]), .B2(n88), 
        .ZN(N331) );
  MOAI22D1BWP30P140 U155 ( .A1(n85), .A2(n89), .B1(i_data_bus[42]), .B2(n88), 
        .ZN(N329) );
  MOAI22D1BWP30P140 U156 ( .A1(n86), .A2(n89), .B1(i_data_bus[41]), .B2(n88), 
        .ZN(N328) );
  MOAI22D1BWP30P140 U157 ( .A1(n87), .A2(n89), .B1(i_data_bus[40]), .B2(n88), 
        .ZN(N327) );
  MOAI22D1BWP30P140 U158 ( .A1(n90), .A2(n89), .B1(i_data_bus[43]), .B2(n88), 
        .ZN(N330) );
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
         n45, n46, n47, n48, n49, n50, n51, n52, n53, n54, n55, n56, n57, n58,
         n59, n60, n61, n62, n63, n64, n65, n66, n67, n68, n69, n70, n71, n72,
         n73, n74, n75, n76, n77, n78, n79, n80, n81, n82, n83, n84, n85, n86,
         n87, n88, n89;

  DFQD1BWP30P140 o_data_bus_inner_reg_63_ ( .D(N350), .CP(clk), .Q(
        o_data_bus[63]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_62_ ( .D(N349), .CP(clk), .Q(
        o_data_bus[62]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_61_ ( .D(N348), .CP(clk), .Q(
        o_data_bus[61]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_60_ ( .D(N347), .CP(clk), .Q(
        o_data_bus[60]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_59_ ( .D(N346), .CP(clk), .Q(
        o_data_bus[59]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_58_ ( .D(N345), .CP(clk), .Q(
        o_data_bus[58]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_57_ ( .D(N344), .CP(clk), .Q(
        o_data_bus[57]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_56_ ( .D(N343), .CP(clk), .Q(
        o_data_bus[56]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_55_ ( .D(N342), .CP(clk), .Q(
        o_data_bus[55]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_54_ ( .D(N341), .CP(clk), .Q(
        o_data_bus[54]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_53_ ( .D(N340), .CP(clk), .Q(
        o_data_bus[53]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_52_ ( .D(N339), .CP(clk), .Q(
        o_data_bus[52]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_51_ ( .D(N338), .CP(clk), .Q(
        o_data_bus[51]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_50_ ( .D(N337), .CP(clk), .Q(
        o_data_bus[50]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_49_ ( .D(N336), .CP(clk), .Q(
        o_data_bus[49]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_48_ ( .D(N335), .CP(clk), .Q(
        o_data_bus[48]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_47_ ( .D(N334), .CP(clk), .Q(
        o_data_bus[47]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_46_ ( .D(N333), .CP(clk), .Q(
        o_data_bus[46]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_45_ ( .D(N332), .CP(clk), .Q(
        o_data_bus[45]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_44_ ( .D(N331), .CP(clk), .Q(
        o_data_bus[44]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_43_ ( .D(N330), .CP(clk), .Q(
        o_data_bus[43]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_42_ ( .D(N329), .CP(clk), .Q(
        o_data_bus[42]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_41_ ( .D(N328), .CP(clk), .Q(
        o_data_bus[41]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_40_ ( .D(N327), .CP(clk), .Q(
        o_data_bus[40]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_39_ ( .D(N326), .CP(clk), .Q(
        o_data_bus[39]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_38_ ( .D(N325), .CP(clk), .Q(
        o_data_bus[38]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_37_ ( .D(N324), .CP(clk), .Q(
        o_data_bus[37]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_36_ ( .D(N323), .CP(clk), .Q(
        o_data_bus[36]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_35_ ( .D(N322), .CP(clk), .Q(
        o_data_bus[35]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_34_ ( .D(N321), .CP(clk), .Q(
        o_data_bus[34]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_33_ ( .D(N320), .CP(clk), .Q(
        o_data_bus[33]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_32_ ( .D(N319), .CP(clk), .Q(
        o_data_bus[32]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_31_ ( .D(N318), .CP(clk), .Q(
        o_data_bus[31]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_30_ ( .D(N317), .CP(clk), .Q(
        o_data_bus[30]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_29_ ( .D(N316), .CP(clk), .Q(
        o_data_bus[29]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_28_ ( .D(N315), .CP(clk), .Q(
        o_data_bus[28]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_27_ ( .D(N314), .CP(clk), .Q(
        o_data_bus[27]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_26_ ( .D(N313), .CP(clk), .Q(
        o_data_bus[26]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_25_ ( .D(N312), .CP(clk), .Q(
        o_data_bus[25]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_24_ ( .D(N311), .CP(clk), .Q(
        o_data_bus[24]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_23_ ( .D(N310), .CP(clk), .Q(
        o_data_bus[23]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_22_ ( .D(N309), .CP(clk), .Q(
        o_data_bus[22]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_21_ ( .D(N308), .CP(clk), .Q(
        o_data_bus[21]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_20_ ( .D(N307), .CP(clk), .Q(
        o_data_bus[20]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_19_ ( .D(N306), .CP(clk), .Q(
        o_data_bus[19]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_18_ ( .D(N305), .CP(clk), .Q(
        o_data_bus[18]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_17_ ( .D(N304), .CP(clk), .Q(
        o_data_bus[17]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_16_ ( .D(N303), .CP(clk), .Q(
        o_data_bus[16]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_15_ ( .D(N302), .CP(clk), .Q(
        o_data_bus[15]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_14_ ( .D(N301), .CP(clk), .Q(
        o_data_bus[14]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_13_ ( .D(N300), .CP(clk), .Q(
        o_data_bus[13]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_12_ ( .D(N299), .CP(clk), .Q(
        o_data_bus[12]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_11_ ( .D(N298), .CP(clk), .Q(
        o_data_bus[11]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_10_ ( .D(N297), .CP(clk), .Q(
        o_data_bus[10]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_9_ ( .D(N296), .CP(clk), .Q(
        o_data_bus[9]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_8_ ( .D(N295), .CP(clk), .Q(
        o_data_bus[8]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_7_ ( .D(N294), .CP(clk), .Q(
        o_data_bus[7]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_6_ ( .D(N293), .CP(clk), .Q(
        o_data_bus[6]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_5_ ( .D(N292), .CP(clk), .Q(
        o_data_bus[5]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_4_ ( .D(N291), .CP(clk), .Q(
        o_data_bus[4]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_3_ ( .D(N290), .CP(clk), .Q(
        o_data_bus[3]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_2_ ( .D(N289), .CP(clk), .Q(
        o_data_bus[2]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_1_ ( .D(N288), .CP(clk), .Q(
        o_data_bus[1]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_0_ ( .D(N287), .CP(clk), .Q(
        o_data_bus[0]) );
  DFQD2BWP30P140 o_valid_inner_reg_1_ ( .D(N354), .CP(clk), .Q(o_valid[1]) );
  DFQD2BWP30P140 o_valid_inner_reg_0_ ( .D(N353), .CP(clk), .Q(o_valid[0]) );
  INVD1BWP30P140 U3 ( .I(n54), .ZN(n75) );
  NR2D1BWP30P140 U4 ( .A1(n49), .A2(n4), .ZN(n6) );
  INVD3BWP30P140 U5 ( .I(n1), .ZN(n2) );
  AN2D2BWP30P140 U6 ( .A1(n45), .A2(n4), .Z(n1) );
  INVD6BWP30P140 U7 ( .I(n75), .ZN(n88) );
  INVD2BWP30P140 U8 ( .I(i_cmd[0]), .ZN(n4) );
  NR2D1BWP30P140 U9 ( .A1(n49), .A2(i_cmd[1]), .ZN(n53) );
  INVD1BWP30P140 U10 ( .I(i_valid[0]), .ZN(n51) );
  ND2D1BWP30P140 U11 ( .A1(n3), .A2(i_en), .ZN(n49) );
  INVD1BWP30P140 U12 ( .I(n34), .ZN(n43) );
  AN3D4BWP30P140 U13 ( .A1(i_valid[1]), .A2(i_cmd[1]), .A3(n46), .Z(n87) );
  OAI31D1BWP30P140 U14 ( .A1(n49), .A2(n50), .A3(n4), .B(n2), .ZN(N353) );
  OAI22D1BWP30P140 U15 ( .A1(n33), .A2(n18), .B1(n2), .B2(n89), .ZN(N295) );
  OAI22D1BWP30P140 U16 ( .A1(n23), .A2(n17), .B1(n44), .B2(n86), .ZN(N296) );
  OAI22D1BWP30P140 U17 ( .A1(n33), .A2(n8), .B1(n44), .B2(n85), .ZN(N297) );
  OAI22D1BWP30P140 U18 ( .A1(n23), .A2(n32), .B1(n2), .B2(n84), .ZN(N298) );
  OAI22D1BWP30P140 U19 ( .A1(n23), .A2(n31), .B1(n44), .B2(n83), .ZN(N299) );
  OAI22D1BWP30P140 U20 ( .A1(n33), .A2(n30), .B1(n44), .B2(n82), .ZN(N300) );
  OAI22D1BWP30P140 U21 ( .A1(n33), .A2(n29), .B1(n2), .B2(n81), .ZN(N301) );
  OAI22D1BWP30P140 U22 ( .A1(n23), .A2(n28), .B1(n44), .B2(n80), .ZN(N302) );
  OAI22D1BWP30P140 U23 ( .A1(n23), .A2(n27), .B1(n2), .B2(n79), .ZN(N303) );
  OAI22D1BWP30P140 U24 ( .A1(n33), .A2(n26), .B1(n44), .B2(n78), .ZN(N304) );
  OAI22D1BWP30P140 U25 ( .A1(n23), .A2(n25), .B1(n44), .B2(n77), .ZN(N305) );
  OAI22D1BWP30P140 U26 ( .A1(n33), .A2(n24), .B1(n2), .B2(n76), .ZN(N306) );
  OAI22D1BWP30P140 U27 ( .A1(n33), .A2(n22), .B1(n2), .B2(n74), .ZN(N307) );
  OAI22D1BWP30P140 U28 ( .A1(n23), .A2(n21), .B1(n2), .B2(n73), .ZN(N308) );
  OAI22D1BWP30P140 U29 ( .A1(n33), .A2(n20), .B1(n2), .B2(n72), .ZN(N309) );
  OAI22D1BWP30P140 U30 ( .A1(n23), .A2(n19), .B1(n2), .B2(n71), .ZN(N310) );
  OAI22D1BWP30P140 U31 ( .A1(n33), .A2(n16), .B1(n2), .B2(n70), .ZN(N311) );
  OAI22D1BWP30P140 U32 ( .A1(n23), .A2(n15), .B1(n2), .B2(n69), .ZN(N312) );
  OAI22D1BWP30P140 U33 ( .A1(n33), .A2(n14), .B1(n2), .B2(n68), .ZN(N313) );
  OAI22D1BWP30P140 U34 ( .A1(n23), .A2(n13), .B1(n2), .B2(n67), .ZN(N314) );
  OAI22D1BWP30P140 U35 ( .A1(n33), .A2(n12), .B1(n44), .B2(n66), .ZN(N315) );
  OAI22D1BWP30P140 U36 ( .A1(n23), .A2(n11), .B1(n44), .B2(n65), .ZN(N316) );
  OAI22D1BWP30P140 U37 ( .A1(n23), .A2(n10), .B1(n2), .B2(n64), .ZN(N317) );
  OAI22D1BWP30P140 U38 ( .A1(n33), .A2(n9), .B1(n44), .B2(n63), .ZN(N318) );
  INVD1BWP30P140 U39 ( .I(rst), .ZN(n3) );
  INVD2BWP30P140 U40 ( .I(i_valid[1]), .ZN(n50) );
  INR2D2BWP30P140 U41 ( .A1(i_valid[0]), .B1(n49), .ZN(n45) );
  MUX2NUD1BWP30P140 U42 ( .I0(n51), .I1(n50), .S(i_cmd[1]), .ZN(n5) );
  ND2OPTIBD1BWP30P140 U43 ( .A1(n6), .A2(n5), .ZN(n7) );
  INVD2BWP30P140 U44 ( .I(n7), .ZN(n34) );
  INVD2BWP30P140 U45 ( .I(n34), .ZN(n33) );
  INVD1BWP30P140 U46 ( .I(i_data_bus[42]), .ZN(n8) );
  INVD3BWP30P140 U47 ( .I(n1), .ZN(n44) );
  INVD1BWP30P140 U48 ( .I(i_data_bus[10]), .ZN(n85) );
  INVD2BWP30P140 U49 ( .I(n34), .ZN(n23) );
  INVD1BWP30P140 U50 ( .I(i_data_bus[63]), .ZN(n9) );
  INVD1BWP30P140 U51 ( .I(i_data_bus[31]), .ZN(n63) );
  INVD1BWP30P140 U52 ( .I(i_data_bus[62]), .ZN(n10) );
  INVD1BWP30P140 U53 ( .I(i_data_bus[30]), .ZN(n64) );
  INVD1BWP30P140 U54 ( .I(i_data_bus[61]), .ZN(n11) );
  INVD1BWP30P140 U55 ( .I(i_data_bus[29]), .ZN(n65) );
  INVD1BWP30P140 U56 ( .I(i_data_bus[60]), .ZN(n12) );
  INVD1BWP30P140 U57 ( .I(i_data_bus[28]), .ZN(n66) );
  INVD1BWP30P140 U58 ( .I(i_data_bus[59]), .ZN(n13) );
  INVD1BWP30P140 U59 ( .I(i_data_bus[27]), .ZN(n67) );
  INVD1BWP30P140 U60 ( .I(i_data_bus[58]), .ZN(n14) );
  INVD1BWP30P140 U61 ( .I(i_data_bus[26]), .ZN(n68) );
  INVD1BWP30P140 U62 ( .I(i_data_bus[57]), .ZN(n15) );
  INVD1BWP30P140 U63 ( .I(i_data_bus[25]), .ZN(n69) );
  INVD1BWP30P140 U64 ( .I(i_data_bus[56]), .ZN(n16) );
  INVD1BWP30P140 U65 ( .I(i_data_bus[24]), .ZN(n70) );
  INVD1BWP30P140 U66 ( .I(i_data_bus[41]), .ZN(n17) );
  INVD1BWP30P140 U67 ( .I(i_data_bus[9]), .ZN(n86) );
  INVD1BWP30P140 U68 ( .I(i_data_bus[40]), .ZN(n18) );
  INVD1BWP30P140 U69 ( .I(i_data_bus[8]), .ZN(n89) );
  INVD1BWP30P140 U70 ( .I(i_data_bus[55]), .ZN(n19) );
  INVD1BWP30P140 U71 ( .I(i_data_bus[23]), .ZN(n71) );
  INVD1BWP30P140 U72 ( .I(i_data_bus[54]), .ZN(n20) );
  INVD1BWP30P140 U73 ( .I(i_data_bus[22]), .ZN(n72) );
  INVD1BWP30P140 U74 ( .I(i_data_bus[53]), .ZN(n21) );
  INVD1BWP30P140 U75 ( .I(i_data_bus[21]), .ZN(n73) );
  INVD1BWP30P140 U76 ( .I(i_data_bus[52]), .ZN(n22) );
  INVD1BWP30P140 U77 ( .I(i_data_bus[20]), .ZN(n74) );
  INVD1BWP30P140 U78 ( .I(i_data_bus[51]), .ZN(n24) );
  INVD1BWP30P140 U79 ( .I(i_data_bus[19]), .ZN(n76) );
  INVD1BWP30P140 U80 ( .I(i_data_bus[50]), .ZN(n25) );
  INVD1BWP30P140 U81 ( .I(i_data_bus[18]), .ZN(n77) );
  INVD1BWP30P140 U82 ( .I(i_data_bus[49]), .ZN(n26) );
  INVD1BWP30P140 U83 ( .I(i_data_bus[17]), .ZN(n78) );
  INVD1BWP30P140 U84 ( .I(i_data_bus[48]), .ZN(n27) );
  INVD1BWP30P140 U85 ( .I(i_data_bus[16]), .ZN(n79) );
  INVD1BWP30P140 U86 ( .I(i_data_bus[47]), .ZN(n28) );
  INVD1BWP30P140 U87 ( .I(i_data_bus[15]), .ZN(n80) );
  INVD1BWP30P140 U88 ( .I(i_data_bus[46]), .ZN(n29) );
  INVD1BWP30P140 U89 ( .I(i_data_bus[14]), .ZN(n81) );
  INVD1BWP30P140 U90 ( .I(i_data_bus[45]), .ZN(n30) );
  INVD1BWP30P140 U91 ( .I(i_data_bus[13]), .ZN(n82) );
  INVD1BWP30P140 U92 ( .I(i_data_bus[44]), .ZN(n31) );
  INVD1BWP30P140 U93 ( .I(i_data_bus[12]), .ZN(n83) );
  INVD1BWP30P140 U94 ( .I(i_data_bus[43]), .ZN(n32) );
  INVD1BWP30P140 U95 ( .I(i_data_bus[11]), .ZN(n84) );
  INVD1BWP30P140 U96 ( .I(i_data_bus[7]), .ZN(n62) );
  INVD1BWP30P140 U97 ( .I(i_data_bus[39]), .ZN(n35) );
  OAI22D1BWP30P140 U98 ( .A1(n44), .A2(n62), .B1(n43), .B2(n35), .ZN(N294) );
  INVD1BWP30P140 U99 ( .I(i_data_bus[6]), .ZN(n61) );
  INVD1BWP30P140 U100 ( .I(i_data_bus[38]), .ZN(n36) );
  OAI22D1BWP30P140 U101 ( .A1(n2), .A2(n61), .B1(n43), .B2(n36), .ZN(N293) );
  INVD1BWP30P140 U102 ( .I(i_data_bus[5]), .ZN(n60) );
  INVD1BWP30P140 U103 ( .I(i_data_bus[37]), .ZN(n37) );
  OAI22D1BWP30P140 U104 ( .A1(n44), .A2(n60), .B1(n43), .B2(n37), .ZN(N292) );
  INVD1BWP30P140 U105 ( .I(i_data_bus[4]), .ZN(n59) );
  INVD1BWP30P140 U106 ( .I(i_data_bus[36]), .ZN(n38) );
  OAI22D1BWP30P140 U107 ( .A1(n44), .A2(n59), .B1(n43), .B2(n38), .ZN(N291) );
  INVD1BWP30P140 U108 ( .I(i_data_bus[3]), .ZN(n58) );
  INVD1BWP30P140 U109 ( .I(i_data_bus[35]), .ZN(n39) );
  OAI22D1BWP30P140 U110 ( .A1(n2), .A2(n58), .B1(n43), .B2(n39), .ZN(N290) );
  INVD1BWP30P140 U111 ( .I(i_data_bus[2]), .ZN(n57) );
  INVD1BWP30P140 U112 ( .I(i_data_bus[34]), .ZN(n40) );
  OAI22D1BWP30P140 U113 ( .A1(n44), .A2(n57), .B1(n23), .B2(n40), .ZN(N289) );
  INVD1BWP30P140 U114 ( .I(i_data_bus[1]), .ZN(n55) );
  INVD1BWP30P140 U115 ( .I(i_data_bus[33]), .ZN(n41) );
  OAI22D1BWP30P140 U116 ( .A1(n2), .A2(n55), .B1(n33), .B2(n41), .ZN(N288) );
  INVD1BWP30P140 U117 ( .I(i_data_bus[0]), .ZN(n56) );
  INVD1BWP30P140 U118 ( .I(i_data_bus[32]), .ZN(n42) );
  OAI22D1BWP30P140 U119 ( .A1(n44), .A2(n56), .B1(n23), .B2(n42), .ZN(N287) );
  INVD1BWP30P140 U120 ( .I(n45), .ZN(n48) );
  INVD1BWP30P140 U121 ( .I(n49), .ZN(n46) );
  INVD1BWP30P140 U122 ( .I(n87), .ZN(n47) );
  OAI21D1BWP30P140 U123 ( .A1(n48), .A2(i_cmd[1]), .B(n47), .ZN(N354) );
  MUX2NUD1BWP30P140 U124 ( .I0(n51), .I1(n50), .S(i_cmd[0]), .ZN(n52) );
  ND2OPTIBD1BWP30P140 U125 ( .A1(n53), .A2(n52), .ZN(n54) );
  MOAI22D1BWP30P140 U126 ( .A1(n55), .A2(n88), .B1(i_data_bus[33]), .B2(n87), 
        .ZN(N320) );
  MOAI22D1BWP30P140 U127 ( .A1(n56), .A2(n88), .B1(i_data_bus[32]), .B2(n87), 
        .ZN(N319) );
  MOAI22D1BWP30P140 U128 ( .A1(n57), .A2(n88), .B1(i_data_bus[34]), .B2(n87), 
        .ZN(N321) );
  MOAI22D1BWP30P140 U129 ( .A1(n58), .A2(n88), .B1(i_data_bus[35]), .B2(n87), 
        .ZN(N322) );
  MOAI22D1BWP30P140 U130 ( .A1(n59), .A2(n88), .B1(i_data_bus[36]), .B2(n87), 
        .ZN(N323) );
  MOAI22D1BWP30P140 U131 ( .A1(n60), .A2(n88), .B1(i_data_bus[37]), .B2(n87), 
        .ZN(N324) );
  MOAI22D1BWP30P140 U132 ( .A1(n61), .A2(n88), .B1(i_data_bus[38]), .B2(n87), 
        .ZN(N325) );
  MOAI22D1BWP30P140 U133 ( .A1(n62), .A2(n88), .B1(i_data_bus[39]), .B2(n87), 
        .ZN(N326) );
  MOAI22D1BWP30P140 U134 ( .A1(n63), .A2(n88), .B1(i_data_bus[63]), .B2(n87), 
        .ZN(N350) );
  MOAI22D1BWP30P140 U135 ( .A1(n64), .A2(n88), .B1(i_data_bus[62]), .B2(n87), 
        .ZN(N349) );
  MOAI22D1BWP30P140 U136 ( .A1(n65), .A2(n88), .B1(i_data_bus[61]), .B2(n87), 
        .ZN(N348) );
  MOAI22D1BWP30P140 U137 ( .A1(n66), .A2(n88), .B1(i_data_bus[60]), .B2(n87), 
        .ZN(N347) );
  MOAI22D1BWP30P140 U138 ( .A1(n67), .A2(n88), .B1(i_data_bus[59]), .B2(n87), 
        .ZN(N346) );
  MOAI22D1BWP30P140 U139 ( .A1(n68), .A2(n88), .B1(i_data_bus[58]), .B2(n87), 
        .ZN(N345) );
  MOAI22D1BWP30P140 U140 ( .A1(n69), .A2(n88), .B1(i_data_bus[57]), .B2(n87), 
        .ZN(N344) );
  MOAI22D1BWP30P140 U141 ( .A1(n70), .A2(n88), .B1(i_data_bus[56]), .B2(n87), 
        .ZN(N343) );
  MOAI22D1BWP30P140 U142 ( .A1(n71), .A2(n88), .B1(i_data_bus[55]), .B2(n87), 
        .ZN(N342) );
  MOAI22D1BWP30P140 U143 ( .A1(n72), .A2(n88), .B1(i_data_bus[54]), .B2(n87), 
        .ZN(N341) );
  MOAI22D1BWP30P140 U144 ( .A1(n73), .A2(n88), .B1(i_data_bus[53]), .B2(n87), 
        .ZN(N340) );
  MOAI22D1BWP30P140 U145 ( .A1(n74), .A2(n88), .B1(i_data_bus[52]), .B2(n87), 
        .ZN(N339) );
  MOAI22D1BWP30P140 U146 ( .A1(n76), .A2(n88), .B1(i_data_bus[51]), .B2(n87), 
        .ZN(N338) );
  MOAI22D1BWP30P140 U147 ( .A1(n77), .A2(n88), .B1(i_data_bus[50]), .B2(n87), 
        .ZN(N337) );
  MOAI22D1BWP30P140 U148 ( .A1(n78), .A2(n88), .B1(i_data_bus[49]), .B2(n87), 
        .ZN(N336) );
  MOAI22D1BWP30P140 U149 ( .A1(n79), .A2(n88), .B1(i_data_bus[48]), .B2(n87), 
        .ZN(N335) );
  MOAI22D1BWP30P140 U150 ( .A1(n80), .A2(n88), .B1(i_data_bus[47]), .B2(n87), 
        .ZN(N334) );
  MOAI22D1BWP30P140 U151 ( .A1(n81), .A2(n88), .B1(i_data_bus[46]), .B2(n87), 
        .ZN(N333) );
  MOAI22D1BWP30P140 U152 ( .A1(n82), .A2(n88), .B1(i_data_bus[45]), .B2(n87), 
        .ZN(N332) );
  MOAI22D1BWP30P140 U153 ( .A1(n83), .A2(n88), .B1(i_data_bus[44]), .B2(n87), 
        .ZN(N331) );
  MOAI22D1BWP30P140 U154 ( .A1(n84), .A2(n88), .B1(i_data_bus[43]), .B2(n87), 
        .ZN(N330) );
  MOAI22D1BWP30P140 U155 ( .A1(n85), .A2(n88), .B1(i_data_bus[42]), .B2(n87), 
        .ZN(N329) );
  MOAI22D1BWP30P140 U156 ( .A1(n86), .A2(n88), .B1(i_data_bus[41]), .B2(n87), 
        .ZN(N328) );
  MOAI22D1BWP30P140 U157 ( .A1(n89), .A2(n88), .B1(i_data_bus[40]), .B2(n87), 
        .ZN(N327) );
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
         n45, n46, n47, n48, n49, n50, n51, n52, n53, n54, n55, n56, n57, n58,
         n59, n60, n61, n62, n63, n64, n65, n66, n67, n68, n69, n70, n71, n72,
         n73, n74, n75, n76, n77, n78, n79, n80, n81, n82, n83, n84, n85, n86,
         n87, n88, n89, n90, n91, n92;

  DFQD1BWP30P140 o_data_bus_inner_reg_63_ ( .D(N350), .CP(clk), .Q(
        o_data_bus[63]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_62_ ( .D(N349), .CP(clk), .Q(
        o_data_bus[62]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_61_ ( .D(N348), .CP(clk), .Q(
        o_data_bus[61]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_60_ ( .D(N347), .CP(clk), .Q(
        o_data_bus[60]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_59_ ( .D(N346), .CP(clk), .Q(
        o_data_bus[59]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_58_ ( .D(N345), .CP(clk), .Q(
        o_data_bus[58]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_57_ ( .D(N344), .CP(clk), .Q(
        o_data_bus[57]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_56_ ( .D(N343), .CP(clk), .Q(
        o_data_bus[56]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_55_ ( .D(N342), .CP(clk), .Q(
        o_data_bus[55]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_54_ ( .D(N341), .CP(clk), .Q(
        o_data_bus[54]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_53_ ( .D(N340), .CP(clk), .Q(
        o_data_bus[53]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_52_ ( .D(N339), .CP(clk), .Q(
        o_data_bus[52]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_51_ ( .D(N338), .CP(clk), .Q(
        o_data_bus[51]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_50_ ( .D(N337), .CP(clk), .Q(
        o_data_bus[50]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_49_ ( .D(N336), .CP(clk), .Q(
        o_data_bus[49]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_48_ ( .D(N335), .CP(clk), .Q(
        o_data_bus[48]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_47_ ( .D(N334), .CP(clk), .Q(
        o_data_bus[47]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_46_ ( .D(N333), .CP(clk), .Q(
        o_data_bus[46]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_45_ ( .D(N332), .CP(clk), .Q(
        o_data_bus[45]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_44_ ( .D(N331), .CP(clk), .Q(
        o_data_bus[44]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_43_ ( .D(N330), .CP(clk), .Q(
        o_data_bus[43]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_42_ ( .D(N329), .CP(clk), .Q(
        o_data_bus[42]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_41_ ( .D(N328), .CP(clk), .Q(
        o_data_bus[41]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_40_ ( .D(N327), .CP(clk), .Q(
        o_data_bus[40]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_39_ ( .D(N326), .CP(clk), .Q(
        o_data_bus[39]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_38_ ( .D(N325), .CP(clk), .Q(
        o_data_bus[38]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_37_ ( .D(N324), .CP(clk), .Q(
        o_data_bus[37]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_36_ ( .D(N323), .CP(clk), .Q(
        o_data_bus[36]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_35_ ( .D(N322), .CP(clk), .Q(
        o_data_bus[35]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_34_ ( .D(N321), .CP(clk), .Q(
        o_data_bus[34]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_33_ ( .D(N320), .CP(clk), .Q(
        o_data_bus[33]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_32_ ( .D(N319), .CP(clk), .Q(
        o_data_bus[32]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_31_ ( .D(N318), .CP(clk), .Q(
        o_data_bus[31]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_30_ ( .D(N317), .CP(clk), .Q(
        o_data_bus[30]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_29_ ( .D(N316), .CP(clk), .Q(
        o_data_bus[29]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_28_ ( .D(N315), .CP(clk), .Q(
        o_data_bus[28]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_27_ ( .D(N314), .CP(clk), .Q(
        o_data_bus[27]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_26_ ( .D(N313), .CP(clk), .Q(
        o_data_bus[26]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_25_ ( .D(N312), .CP(clk), .Q(
        o_data_bus[25]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_24_ ( .D(N311), .CP(clk), .Q(
        o_data_bus[24]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_23_ ( .D(N310), .CP(clk), .Q(
        o_data_bus[23]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_22_ ( .D(N309), .CP(clk), .Q(
        o_data_bus[22]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_21_ ( .D(N308), .CP(clk), .Q(
        o_data_bus[21]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_20_ ( .D(N307), .CP(clk), .Q(
        o_data_bus[20]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_19_ ( .D(N306), .CP(clk), .Q(
        o_data_bus[19]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_18_ ( .D(N305), .CP(clk), .Q(
        o_data_bus[18]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_17_ ( .D(N304), .CP(clk), .Q(
        o_data_bus[17]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_16_ ( .D(N303), .CP(clk), .Q(
        o_data_bus[16]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_15_ ( .D(N302), .CP(clk), .Q(
        o_data_bus[15]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_14_ ( .D(N301), .CP(clk), .Q(
        o_data_bus[14]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_13_ ( .D(N300), .CP(clk), .Q(
        o_data_bus[13]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_12_ ( .D(N299), .CP(clk), .Q(
        o_data_bus[12]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_11_ ( .D(N298), .CP(clk), .Q(
        o_data_bus[11]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_10_ ( .D(N297), .CP(clk), .Q(
        o_data_bus[10]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_9_ ( .D(N296), .CP(clk), .Q(
        o_data_bus[9]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_8_ ( .D(N295), .CP(clk), .Q(
        o_data_bus[8]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_7_ ( .D(N294), .CP(clk), .Q(
        o_data_bus[7]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_6_ ( .D(N293), .CP(clk), .Q(
        o_data_bus[6]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_5_ ( .D(N292), .CP(clk), .Q(
        o_data_bus[5]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_4_ ( .D(N291), .CP(clk), .Q(
        o_data_bus[4]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_3_ ( .D(N290), .CP(clk), .Q(
        o_data_bus[3]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_2_ ( .D(N289), .CP(clk), .Q(
        o_data_bus[2]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_1_ ( .D(N288), .CP(clk), .Q(
        o_data_bus[1]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_0_ ( .D(N287), .CP(clk), .Q(
        o_data_bus[0]) );
  DFQD4BWP30P140 o_valid_inner_reg_1_ ( .D(N354), .CP(clk), .Q(o_valid[1]) );
  DFQD2BWP30P140 o_valid_inner_reg_0_ ( .D(N353), .CP(clk), .Q(o_valid[0]) );
  NR2D1BWP30P140 U3 ( .A1(n50), .A2(n3), .ZN(n5) );
  INR2D1BWP30P140 U4 ( .A1(i_valid[0]), .B1(n50), .ZN(n46) );
  INVD2BWP30P140 U5 ( .I(n7), .ZN(n22) );
  OAI22D1BWP30P140 U6 ( .A1(n34), .A2(n8), .B1(n45), .B2(n92), .ZN(N295) );
  OAI22D1BWP30P140 U7 ( .A1(n34), .A2(n27), .B1(n45), .B2(n83), .ZN(N302) );
  OAI22D1BWP30P140 U8 ( .A1(n21), .A2(n13), .B1(n22), .B2(n69), .ZN(N314) );
  INVD1BWP30P140 U9 ( .I(i_valid[0]), .ZN(n52) );
  ND2D1BWP30P140 U10 ( .A1(n1), .A2(i_en), .ZN(n50) );
  INVD1BWP30P140 U11 ( .I(i_cmd[0]), .ZN(n3) );
  INVD1BWP30P140 U12 ( .I(n78), .ZN(n63) );
  AN3D4BWP30P140 U13 ( .A1(i_valid[1]), .A2(i_cmd[1]), .A3(n47), .Z(n90) );
  OAI31D1BWP30P140 U14 ( .A1(n50), .A2(n51), .A3(n3), .B(n22), .ZN(N353) );
  OAI22D1BWP30P140 U15 ( .A1(n34), .A2(n32), .B1(n45), .B2(n89), .ZN(N296) );
  OAI22D1BWP30P140 U16 ( .A1(n34), .A2(n30), .B1(n45), .B2(n88), .ZN(N297) );
  OAI22D1BWP30P140 U17 ( .A1(n34), .A2(n31), .B1(n45), .B2(n87), .ZN(N298) );
  OAI22D1BWP30P140 U18 ( .A1(n34), .A2(n33), .B1(n45), .B2(n86), .ZN(N299) );
  OAI22D1BWP30P140 U19 ( .A1(n34), .A2(n29), .B1(n45), .B2(n85), .ZN(N300) );
  OAI22D1BWP30P140 U20 ( .A1(n34), .A2(n28), .B1(n45), .B2(n84), .ZN(N301) );
  OAI22D1BWP30P140 U21 ( .A1(n34), .A2(n26), .B1(n45), .B2(n82), .ZN(N303) );
  OAI22D1BWP30P140 U22 ( .A1(n34), .A2(n25), .B1(n45), .B2(n81), .ZN(N304) );
  OAI22D1BWP30P140 U23 ( .A1(n34), .A2(n24), .B1(n45), .B2(n80), .ZN(N305) );
  OAI22D1BWP30P140 U24 ( .A1(n34), .A2(n23), .B1(n22), .B2(n79), .ZN(N306) );
  OAI22D1BWP30P140 U25 ( .A1(n21), .A2(n20), .B1(n22), .B2(n77), .ZN(N307) );
  OAI22D1BWP30P140 U26 ( .A1(n21), .A2(n19), .B1(n22), .B2(n75), .ZN(N308) );
  OAI22D1BWP30P140 U27 ( .A1(n21), .A2(n18), .B1(n22), .B2(n74), .ZN(N309) );
  OAI22D1BWP30P140 U28 ( .A1(n21), .A2(n17), .B1(n22), .B2(n73), .ZN(N310) );
  OAI22D1BWP30P140 U29 ( .A1(n21), .A2(n16), .B1(n22), .B2(n72), .ZN(N311) );
  OAI22D1BWP30P140 U30 ( .A1(n21), .A2(n15), .B1(n22), .B2(n71), .ZN(N312) );
  OAI22D1BWP30P140 U31 ( .A1(n21), .A2(n14), .B1(n22), .B2(n70), .ZN(N313) );
  OAI22D1BWP30P140 U32 ( .A1(n21), .A2(n12), .B1(n22), .B2(n68), .ZN(N315) );
  OAI22D1BWP30P140 U33 ( .A1(n21), .A2(n11), .B1(n22), .B2(n67), .ZN(N316) );
  OAI22D1BWP30P140 U34 ( .A1(n21), .A2(n10), .B1(n22), .B2(n66), .ZN(N317) );
  OAI22D1BWP30P140 U35 ( .A1(n21), .A2(n9), .B1(n22), .B2(n65), .ZN(N318) );
  INVD1BWP30P140 U36 ( .I(rst), .ZN(n1) );
  INVD2BWP30P140 U37 ( .I(i_valid[1]), .ZN(n51) );
  CKND2D2BWP30P140 U38 ( .A1(n46), .A2(n3), .ZN(n2) );
  INVD2BWP30P140 U39 ( .I(n2), .ZN(n7) );
  MUX2NUD1BWP30P140 U40 ( .I0(n52), .I1(n51), .S(i_cmd[1]), .ZN(n4) );
  ND2OPTIBD1BWP30P140 U41 ( .A1(n5), .A2(n4), .ZN(n6) );
  INVD2BWP30P140 U42 ( .I(n6), .ZN(n35) );
  INVD2BWP30P140 U43 ( .I(n35), .ZN(n34) );
  INVD1BWP30P140 U44 ( .I(i_data_bus[40]), .ZN(n8) );
  INVD3BWP30P140 U45 ( .I(n7), .ZN(n45) );
  INVD1BWP30P140 U46 ( .I(i_data_bus[8]), .ZN(n92) );
  INVD2BWP30P140 U47 ( .I(n35), .ZN(n21) );
  INVD1BWP30P140 U48 ( .I(i_data_bus[63]), .ZN(n9) );
  INVD1BWP30P140 U49 ( .I(i_data_bus[31]), .ZN(n65) );
  INVD1BWP30P140 U50 ( .I(i_data_bus[62]), .ZN(n10) );
  INVD1BWP30P140 U51 ( .I(i_data_bus[30]), .ZN(n66) );
  INVD1BWP30P140 U52 ( .I(i_data_bus[61]), .ZN(n11) );
  INVD1BWP30P140 U53 ( .I(i_data_bus[29]), .ZN(n67) );
  INVD1BWP30P140 U54 ( .I(i_data_bus[60]), .ZN(n12) );
  INVD1BWP30P140 U55 ( .I(i_data_bus[28]), .ZN(n68) );
  INVD1BWP30P140 U56 ( .I(i_data_bus[59]), .ZN(n13) );
  INVD1BWP30P140 U57 ( .I(i_data_bus[27]), .ZN(n69) );
  INVD1BWP30P140 U58 ( .I(i_data_bus[58]), .ZN(n14) );
  INVD1BWP30P140 U59 ( .I(i_data_bus[26]), .ZN(n70) );
  INVD1BWP30P140 U60 ( .I(i_data_bus[57]), .ZN(n15) );
  INVD1BWP30P140 U61 ( .I(i_data_bus[25]), .ZN(n71) );
  INVD1BWP30P140 U62 ( .I(i_data_bus[56]), .ZN(n16) );
  INVD1BWP30P140 U63 ( .I(i_data_bus[24]), .ZN(n72) );
  INVD1BWP30P140 U64 ( .I(i_data_bus[55]), .ZN(n17) );
  INVD1BWP30P140 U65 ( .I(i_data_bus[23]), .ZN(n73) );
  INVD1BWP30P140 U66 ( .I(i_data_bus[54]), .ZN(n18) );
  INVD1BWP30P140 U67 ( .I(i_data_bus[22]), .ZN(n74) );
  INVD1BWP30P140 U68 ( .I(i_data_bus[53]), .ZN(n19) );
  INVD1BWP30P140 U69 ( .I(i_data_bus[21]), .ZN(n75) );
  INVD1BWP30P140 U70 ( .I(i_data_bus[52]), .ZN(n20) );
  INVD1BWP30P140 U71 ( .I(i_data_bus[20]), .ZN(n77) );
  INVD1BWP30P140 U72 ( .I(i_data_bus[51]), .ZN(n23) );
  INVD1BWP30P140 U73 ( .I(i_data_bus[19]), .ZN(n79) );
  INVD1BWP30P140 U74 ( .I(i_data_bus[50]), .ZN(n24) );
  INVD1BWP30P140 U75 ( .I(i_data_bus[18]), .ZN(n80) );
  INVD1BWP30P140 U76 ( .I(i_data_bus[49]), .ZN(n25) );
  INVD1BWP30P140 U77 ( .I(i_data_bus[17]), .ZN(n81) );
  INVD1BWP30P140 U78 ( .I(i_data_bus[48]), .ZN(n26) );
  INVD1BWP30P140 U79 ( .I(i_data_bus[16]), .ZN(n82) );
  INVD1BWP30P140 U80 ( .I(i_data_bus[47]), .ZN(n27) );
  INVD1BWP30P140 U81 ( .I(i_data_bus[15]), .ZN(n83) );
  INVD1BWP30P140 U82 ( .I(i_data_bus[46]), .ZN(n28) );
  INVD1BWP30P140 U83 ( .I(i_data_bus[14]), .ZN(n84) );
  INVD1BWP30P140 U84 ( .I(i_data_bus[45]), .ZN(n29) );
  INVD1BWP30P140 U85 ( .I(i_data_bus[13]), .ZN(n85) );
  INVD1BWP30P140 U86 ( .I(i_data_bus[42]), .ZN(n30) );
  INVD1BWP30P140 U87 ( .I(i_data_bus[10]), .ZN(n88) );
  INVD1BWP30P140 U88 ( .I(i_data_bus[43]), .ZN(n31) );
  INVD1BWP30P140 U89 ( .I(i_data_bus[11]), .ZN(n87) );
  INVD1BWP30P140 U90 ( .I(i_data_bus[41]), .ZN(n32) );
  INVD1BWP30P140 U91 ( .I(i_data_bus[9]), .ZN(n89) );
  INVD1BWP30P140 U92 ( .I(i_data_bus[44]), .ZN(n33) );
  INVD1BWP30P140 U93 ( .I(i_data_bus[12]), .ZN(n86) );
  INVD1BWP30P140 U94 ( .I(i_data_bus[5]), .ZN(n60) );
  INVD2BWP30P140 U95 ( .I(n35), .ZN(n44) );
  INVD1BWP30P140 U96 ( .I(i_data_bus[37]), .ZN(n36) );
  OAI22D1BWP30P140 U97 ( .A1(n45), .A2(n60), .B1(n44), .B2(n36), .ZN(N292) );
  INVD1BWP30P140 U98 ( .I(i_data_bus[4]), .ZN(n59) );
  INVD1BWP30P140 U99 ( .I(i_data_bus[36]), .ZN(n37) );
  OAI22D1BWP30P140 U100 ( .A1(n45), .A2(n59), .B1(n44), .B2(n37), .ZN(N291) );
  INVD1BWP30P140 U101 ( .I(i_data_bus[3]), .ZN(n58) );
  INVD1BWP30P140 U102 ( .I(i_data_bus[35]), .ZN(n38) );
  OAI22D1BWP30P140 U103 ( .A1(n45), .A2(n58), .B1(n44), .B2(n38), .ZN(N290) );
  INVD1BWP30P140 U104 ( .I(i_data_bus[2]), .ZN(n57) );
  INVD1BWP30P140 U105 ( .I(i_data_bus[34]), .ZN(n39) );
  OAI22D1BWP30P140 U106 ( .A1(n45), .A2(n57), .B1(n44), .B2(n39), .ZN(N289) );
  INVD1BWP30P140 U107 ( .I(i_data_bus[1]), .ZN(n64) );
  INVD1BWP30P140 U108 ( .I(i_data_bus[33]), .ZN(n40) );
  OAI22D1BWP30P140 U109 ( .A1(n45), .A2(n64), .B1(n44), .B2(n40), .ZN(N288) );
  INVD1BWP30P140 U110 ( .I(i_data_bus[0]), .ZN(n56) );
  INVD1BWP30P140 U111 ( .I(i_data_bus[32]), .ZN(n41) );
  OAI22D1BWP30P140 U112 ( .A1(n45), .A2(n56), .B1(n44), .B2(n41), .ZN(N287) );
  INVD1BWP30P140 U113 ( .I(i_data_bus[7]), .ZN(n62) );
  INVD1BWP30P140 U114 ( .I(i_data_bus[39]), .ZN(n42) );
  OAI22D1BWP30P140 U115 ( .A1(n45), .A2(n62), .B1(n44), .B2(n42), .ZN(N294) );
  INVD1BWP30P140 U116 ( .I(i_data_bus[6]), .ZN(n61) );
  INVD1BWP30P140 U117 ( .I(i_data_bus[38]), .ZN(n43) );
  OAI22D1BWP30P140 U118 ( .A1(n45), .A2(n61), .B1(n44), .B2(n43), .ZN(N293) );
  INVD1BWP30P140 U119 ( .I(n46), .ZN(n49) );
  INVD1BWP30P140 U120 ( .I(n50), .ZN(n47) );
  INVD1BWP30P140 U121 ( .I(n90), .ZN(n48) );
  OAI21D1BWP30P140 U122 ( .A1(n49), .A2(i_cmd[1]), .B(n48), .ZN(N354) );
  NR2OPTPAD1BWP30P140 U123 ( .A1(n50), .A2(i_cmd[1]), .ZN(n54) );
  MUX2NUD1BWP30P140 U124 ( .I0(n52), .I1(n51), .S(i_cmd[0]), .ZN(n53) );
  ND2OPTIBD1BWP30P140 U125 ( .A1(n54), .A2(n53), .ZN(n55) );
  INVD2BWP30P140 U126 ( .I(n55), .ZN(n78) );
  MOAI22D1BWP30P140 U127 ( .A1(n56), .A2(n63), .B1(i_data_bus[32]), .B2(n90), 
        .ZN(N319) );
  MOAI22D1BWP30P140 U128 ( .A1(n57), .A2(n63), .B1(i_data_bus[34]), .B2(n90), 
        .ZN(N321) );
  MOAI22D1BWP30P140 U129 ( .A1(n58), .A2(n63), .B1(i_data_bus[35]), .B2(n90), 
        .ZN(N322) );
  MOAI22D1BWP30P140 U130 ( .A1(n59), .A2(n63), .B1(i_data_bus[36]), .B2(n90), 
        .ZN(N323) );
  MOAI22D1BWP30P140 U131 ( .A1(n60), .A2(n63), .B1(i_data_bus[37]), .B2(n90), 
        .ZN(N324) );
  MOAI22D1BWP30P140 U132 ( .A1(n61), .A2(n63), .B1(i_data_bus[38]), .B2(n90), 
        .ZN(N325) );
  MOAI22D1BWP30P140 U133 ( .A1(n62), .A2(n63), .B1(i_data_bus[39]), .B2(n90), 
        .ZN(N326) );
  MOAI22D1BWP30P140 U134 ( .A1(n64), .A2(n63), .B1(i_data_bus[33]), .B2(n90), 
        .ZN(N320) );
  INVD2BWP30P140 U135 ( .I(n78), .ZN(n76) );
  MOAI22D1BWP30P140 U136 ( .A1(n65), .A2(n76), .B1(i_data_bus[63]), .B2(n90), 
        .ZN(N350) );
  MOAI22D1BWP30P140 U137 ( .A1(n66), .A2(n76), .B1(i_data_bus[62]), .B2(n90), 
        .ZN(N349) );
  MOAI22D1BWP30P140 U138 ( .A1(n67), .A2(n76), .B1(i_data_bus[61]), .B2(n90), 
        .ZN(N348) );
  MOAI22D1BWP30P140 U139 ( .A1(n68), .A2(n76), .B1(i_data_bus[60]), .B2(n90), 
        .ZN(N347) );
  MOAI22D1BWP30P140 U140 ( .A1(n69), .A2(n76), .B1(i_data_bus[59]), .B2(n90), 
        .ZN(N346) );
  MOAI22D1BWP30P140 U141 ( .A1(n70), .A2(n76), .B1(i_data_bus[58]), .B2(n90), 
        .ZN(N345) );
  MOAI22D1BWP30P140 U142 ( .A1(n71), .A2(n76), .B1(i_data_bus[57]), .B2(n90), 
        .ZN(N344) );
  MOAI22D1BWP30P140 U143 ( .A1(n72), .A2(n76), .B1(i_data_bus[56]), .B2(n90), 
        .ZN(N343) );
  MOAI22D1BWP30P140 U144 ( .A1(n73), .A2(n76), .B1(i_data_bus[55]), .B2(n90), 
        .ZN(N342) );
  MOAI22D1BWP30P140 U145 ( .A1(n74), .A2(n76), .B1(i_data_bus[54]), .B2(n90), 
        .ZN(N341) );
  MOAI22D1BWP30P140 U146 ( .A1(n75), .A2(n76), .B1(i_data_bus[53]), .B2(n90), 
        .ZN(N340) );
  MOAI22D1BWP30P140 U147 ( .A1(n77), .A2(n76), .B1(i_data_bus[52]), .B2(n90), 
        .ZN(N339) );
  INVD2BWP30P140 U148 ( .I(n78), .ZN(n91) );
  MOAI22D1BWP30P140 U149 ( .A1(n79), .A2(n91), .B1(i_data_bus[51]), .B2(n90), 
        .ZN(N338) );
  MOAI22D1BWP30P140 U150 ( .A1(n80), .A2(n91), .B1(i_data_bus[50]), .B2(n90), 
        .ZN(N337) );
  MOAI22D1BWP30P140 U151 ( .A1(n81), .A2(n91), .B1(i_data_bus[49]), .B2(n90), 
        .ZN(N336) );
  MOAI22D1BWP30P140 U152 ( .A1(n82), .A2(n91), .B1(i_data_bus[48]), .B2(n90), 
        .ZN(N335) );
  MOAI22D1BWP30P140 U153 ( .A1(n83), .A2(n91), .B1(i_data_bus[47]), .B2(n90), 
        .ZN(N334) );
  MOAI22D1BWP30P140 U154 ( .A1(n84), .A2(n91), .B1(i_data_bus[46]), .B2(n90), 
        .ZN(N333) );
  MOAI22D1BWP30P140 U155 ( .A1(n85), .A2(n91), .B1(i_data_bus[45]), .B2(n90), 
        .ZN(N332) );
  MOAI22D1BWP30P140 U156 ( .A1(n86), .A2(n91), .B1(i_data_bus[44]), .B2(n90), 
        .ZN(N331) );
  MOAI22D1BWP30P140 U157 ( .A1(n87), .A2(n91), .B1(i_data_bus[43]), .B2(n90), 
        .ZN(N330) );
  MOAI22D1BWP30P140 U158 ( .A1(n88), .A2(n91), .B1(i_data_bus[42]), .B2(n90), 
        .ZN(N329) );
  MOAI22D1BWP30P140 U159 ( .A1(n89), .A2(n91), .B1(i_data_bus[41]), .B2(n90), 
        .ZN(N328) );
  MOAI22D1BWP30P140 U160 ( .A1(n92), .A2(n91), .B1(i_data_bus[40]), .B2(n90), 
        .ZN(N327) );
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
         n45, n46, n47, n48, n49, n50, n51, n52, n53, n54, n55, n56, n57, n58,
         n59, n60, n61, n62, n63, n64, n65, n66, n67, n68, n69, n70, n71, n72,
         n73, n74, n75, n76, n77, n78, n79, n80, n81, n82, n83, n84, n85, n86,
         n87, n88, n89, n90, n91, n92;

  DFQD1BWP30P140 o_data_bus_inner_reg_63_ ( .D(N350), .CP(clk), .Q(
        o_data_bus[63]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_62_ ( .D(N349), .CP(clk), .Q(
        o_data_bus[62]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_61_ ( .D(N348), .CP(clk), .Q(
        o_data_bus[61]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_60_ ( .D(N347), .CP(clk), .Q(
        o_data_bus[60]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_59_ ( .D(N346), .CP(clk), .Q(
        o_data_bus[59]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_58_ ( .D(N345), .CP(clk), .Q(
        o_data_bus[58]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_57_ ( .D(N344), .CP(clk), .Q(
        o_data_bus[57]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_56_ ( .D(N343), .CP(clk), .Q(
        o_data_bus[56]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_55_ ( .D(N342), .CP(clk), .Q(
        o_data_bus[55]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_54_ ( .D(N341), .CP(clk), .Q(
        o_data_bus[54]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_53_ ( .D(N340), .CP(clk), .Q(
        o_data_bus[53]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_52_ ( .D(N339), .CP(clk), .Q(
        o_data_bus[52]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_51_ ( .D(N338), .CP(clk), .Q(
        o_data_bus[51]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_50_ ( .D(N337), .CP(clk), .Q(
        o_data_bus[50]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_49_ ( .D(N336), .CP(clk), .Q(
        o_data_bus[49]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_48_ ( .D(N335), .CP(clk), .Q(
        o_data_bus[48]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_47_ ( .D(N334), .CP(clk), .Q(
        o_data_bus[47]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_46_ ( .D(N333), .CP(clk), .Q(
        o_data_bus[46]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_45_ ( .D(N332), .CP(clk), .Q(
        o_data_bus[45]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_44_ ( .D(N331), .CP(clk), .Q(
        o_data_bus[44]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_43_ ( .D(N330), .CP(clk), .Q(
        o_data_bus[43]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_42_ ( .D(N329), .CP(clk), .Q(
        o_data_bus[42]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_41_ ( .D(N328), .CP(clk), .Q(
        o_data_bus[41]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_40_ ( .D(N327), .CP(clk), .Q(
        o_data_bus[40]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_39_ ( .D(N326), .CP(clk), .Q(
        o_data_bus[39]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_38_ ( .D(N325), .CP(clk), .Q(
        o_data_bus[38]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_37_ ( .D(N324), .CP(clk), .Q(
        o_data_bus[37]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_36_ ( .D(N323), .CP(clk), .Q(
        o_data_bus[36]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_35_ ( .D(N322), .CP(clk), .Q(
        o_data_bus[35]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_34_ ( .D(N321), .CP(clk), .Q(
        o_data_bus[34]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_33_ ( .D(N320), .CP(clk), .Q(
        o_data_bus[33]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_32_ ( .D(N319), .CP(clk), .Q(
        o_data_bus[32]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_31_ ( .D(N318), .CP(clk), .Q(
        o_data_bus[31]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_30_ ( .D(N317), .CP(clk), .Q(
        o_data_bus[30]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_29_ ( .D(N316), .CP(clk), .Q(
        o_data_bus[29]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_28_ ( .D(N315), .CP(clk), .Q(
        o_data_bus[28]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_27_ ( .D(N314), .CP(clk), .Q(
        o_data_bus[27]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_26_ ( .D(N313), .CP(clk), .Q(
        o_data_bus[26]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_25_ ( .D(N312), .CP(clk), .Q(
        o_data_bus[25]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_24_ ( .D(N311), .CP(clk), .Q(
        o_data_bus[24]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_23_ ( .D(N310), .CP(clk), .Q(
        o_data_bus[23]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_22_ ( .D(N309), .CP(clk), .Q(
        o_data_bus[22]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_21_ ( .D(N308), .CP(clk), .Q(
        o_data_bus[21]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_20_ ( .D(N307), .CP(clk), .Q(
        o_data_bus[20]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_19_ ( .D(N306), .CP(clk), .Q(
        o_data_bus[19]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_18_ ( .D(N305), .CP(clk), .Q(
        o_data_bus[18]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_17_ ( .D(N304), .CP(clk), .Q(
        o_data_bus[17]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_16_ ( .D(N303), .CP(clk), .Q(
        o_data_bus[16]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_15_ ( .D(N302), .CP(clk), .Q(
        o_data_bus[15]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_14_ ( .D(N301), .CP(clk), .Q(
        o_data_bus[14]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_13_ ( .D(N300), .CP(clk), .Q(
        o_data_bus[13]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_12_ ( .D(N299), .CP(clk), .Q(
        o_data_bus[12]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_11_ ( .D(N298), .CP(clk), .Q(
        o_data_bus[11]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_10_ ( .D(N297), .CP(clk), .Q(
        o_data_bus[10]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_9_ ( .D(N296), .CP(clk), .Q(
        o_data_bus[9]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_8_ ( .D(N295), .CP(clk), .Q(
        o_data_bus[8]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_7_ ( .D(N294), .CP(clk), .Q(
        o_data_bus[7]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_6_ ( .D(N293), .CP(clk), .Q(
        o_data_bus[6]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_5_ ( .D(N292), .CP(clk), .Q(
        o_data_bus[5]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_4_ ( .D(N291), .CP(clk), .Q(
        o_data_bus[4]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_3_ ( .D(N290), .CP(clk), .Q(
        o_data_bus[3]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_2_ ( .D(N289), .CP(clk), .Q(
        o_data_bus[2]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_1_ ( .D(N288), .CP(clk), .Q(
        o_data_bus[1]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_0_ ( .D(N287), .CP(clk), .Q(
        o_data_bus[0]) );
  DFQD2BWP30P140 o_valid_inner_reg_0_ ( .D(N353), .CP(clk), .Q(o_valid[0]) );
  DFQD4BWP30P140 o_valid_inner_reg_1_ ( .D(N354), .CP(clk), .Q(o_valid[1]) );
  NR2D1BWP30P140 U3 ( .A1(n50), .A2(n33), .ZN(n3) );
  INVD2BWP30P140 U4 ( .I(i_cmd[0]), .ZN(n33) );
  INR2D1BWP30P140 U5 ( .A1(i_valid[0]), .B1(n50), .ZN(n46) );
  INVD2BWP30P140 U6 ( .I(n17), .ZN(n39) );
  INVD1BWP30P140 U7 ( .I(i_valid[0]), .ZN(n52) );
  ND2D1BWP30P140 U8 ( .A1(n1), .A2(i_en), .ZN(n50) );
  INVD1BWP30P140 U9 ( .I(n78), .ZN(n63) );
  AN3D4BWP30P140 U10 ( .A1(i_valid[1]), .A2(i_cmd[1]), .A3(n47), .Z(n90) );
  OAI22D1BWP30P140 U11 ( .A1(n19), .A2(n6), .B1(n39), .B2(n92), .ZN(N295) );
  OAI22D1BWP30P140 U12 ( .A1(n19), .A2(n7), .B1(n39), .B2(n89), .ZN(N296) );
  OAI22D1BWP30P140 U13 ( .A1(n19), .A2(n8), .B1(n39), .B2(n88), .ZN(N297) );
  OAI22D1BWP30P140 U14 ( .A1(n19), .A2(n9), .B1(n39), .B2(n87), .ZN(N298) );
  OAI22D1BWP30P140 U15 ( .A1(n19), .A2(n10), .B1(n39), .B2(n86), .ZN(N299) );
  OAI22D1BWP30P140 U16 ( .A1(n19), .A2(n11), .B1(n39), .B2(n85), .ZN(N300) );
  OAI22D1BWP30P140 U17 ( .A1(n19), .A2(n12), .B1(n39), .B2(n84), .ZN(N301) );
  OAI22D1BWP30P140 U18 ( .A1(n19), .A2(n13), .B1(n39), .B2(n83), .ZN(N302) );
  OAI22D1BWP30P140 U19 ( .A1(n19), .A2(n14), .B1(n39), .B2(n82), .ZN(N303) );
  OAI22D1BWP30P140 U20 ( .A1(n19), .A2(n15), .B1(n39), .B2(n81), .ZN(N304) );
  OAI22D1BWP30P140 U21 ( .A1(n19), .A2(n16), .B1(n39), .B2(n80), .ZN(N305) );
  OAI22D1BWP30P140 U22 ( .A1(n19), .A2(n18), .B1(n45), .B2(n79), .ZN(N306) );
  OAI22D1BWP30P140 U23 ( .A1(n32), .A2(n20), .B1(n45), .B2(n77), .ZN(N307) );
  OAI22D1BWP30P140 U24 ( .A1(n32), .A2(n21), .B1(n45), .B2(n75), .ZN(N308) );
  OAI22D1BWP30P140 U25 ( .A1(n32), .A2(n22), .B1(n45), .B2(n74), .ZN(N309) );
  OAI22D1BWP30P140 U26 ( .A1(n32), .A2(n23), .B1(n45), .B2(n73), .ZN(N310) );
  OAI22D1BWP30P140 U27 ( .A1(n32), .A2(n24), .B1(n45), .B2(n72), .ZN(N311) );
  OAI22D1BWP30P140 U28 ( .A1(n32), .A2(n25), .B1(n45), .B2(n71), .ZN(N312) );
  OAI22D1BWP30P140 U29 ( .A1(n32), .A2(n26), .B1(n45), .B2(n70), .ZN(N313) );
  OAI22D1BWP30P140 U30 ( .A1(n32), .A2(n27), .B1(n45), .B2(n69), .ZN(N314) );
  OAI22D1BWP30P140 U31 ( .A1(n32), .A2(n28), .B1(n45), .B2(n68), .ZN(N315) );
  OAI22D1BWP30P140 U32 ( .A1(n32), .A2(n29), .B1(n45), .B2(n67), .ZN(N316) );
  OAI22D1BWP30P140 U33 ( .A1(n32), .A2(n30), .B1(n45), .B2(n66), .ZN(N317) );
  OAI22D1BWP30P140 U34 ( .A1(n32), .A2(n31), .B1(n45), .B2(n65), .ZN(N318) );
  INVD1BWP30P140 U35 ( .I(rst), .ZN(n1) );
  INVD2BWP30P140 U36 ( .I(i_valid[1]), .ZN(n51) );
  MUX2NUD1BWP30P140 U37 ( .I0(n52), .I1(n51), .S(i_cmd[1]), .ZN(n2) );
  ND2OPTIBD1BWP30P140 U38 ( .A1(n3), .A2(n2), .ZN(n4) );
  INVD2BWP30P140 U39 ( .I(n4), .ZN(n34) );
  INVD2BWP30P140 U40 ( .I(n34), .ZN(n19) );
  INVD1BWP30P140 U41 ( .I(i_data_bus[40]), .ZN(n6) );
  CKND2D2BWP30P140 U42 ( .A1(n46), .A2(n33), .ZN(n5) );
  INVD2BWP30P140 U43 ( .I(n5), .ZN(n17) );
  INVD1BWP30P140 U44 ( .I(i_data_bus[8]), .ZN(n92) );
  INVD1BWP30P140 U45 ( .I(i_data_bus[41]), .ZN(n7) );
  INVD1BWP30P140 U46 ( .I(i_data_bus[9]), .ZN(n89) );
  INVD1BWP30P140 U47 ( .I(i_data_bus[42]), .ZN(n8) );
  INVD1BWP30P140 U48 ( .I(i_data_bus[10]), .ZN(n88) );
  INVD1BWP30P140 U49 ( .I(i_data_bus[43]), .ZN(n9) );
  INVD1BWP30P140 U50 ( .I(i_data_bus[11]), .ZN(n87) );
  INVD1BWP30P140 U51 ( .I(i_data_bus[44]), .ZN(n10) );
  INVD1BWP30P140 U52 ( .I(i_data_bus[12]), .ZN(n86) );
  INVD1BWP30P140 U53 ( .I(i_data_bus[45]), .ZN(n11) );
  INVD1BWP30P140 U54 ( .I(i_data_bus[13]), .ZN(n85) );
  INVD1BWP30P140 U55 ( .I(i_data_bus[46]), .ZN(n12) );
  INVD1BWP30P140 U56 ( .I(i_data_bus[14]), .ZN(n84) );
  INVD1BWP30P140 U57 ( .I(i_data_bus[47]), .ZN(n13) );
  INVD1BWP30P140 U58 ( .I(i_data_bus[15]), .ZN(n83) );
  INVD1BWP30P140 U59 ( .I(i_data_bus[48]), .ZN(n14) );
  INVD1BWP30P140 U60 ( .I(i_data_bus[16]), .ZN(n82) );
  INVD1BWP30P140 U61 ( .I(i_data_bus[49]), .ZN(n15) );
  INVD1BWP30P140 U62 ( .I(i_data_bus[17]), .ZN(n81) );
  INVD1BWP30P140 U63 ( .I(i_data_bus[50]), .ZN(n16) );
  INVD1BWP30P140 U64 ( .I(i_data_bus[18]), .ZN(n80) );
  INVD1BWP30P140 U65 ( .I(i_data_bus[51]), .ZN(n18) );
  INVD3BWP30P140 U66 ( .I(n17), .ZN(n45) );
  INVD1BWP30P140 U67 ( .I(i_data_bus[19]), .ZN(n79) );
  INVD2BWP30P140 U68 ( .I(n34), .ZN(n32) );
  INVD1BWP30P140 U69 ( .I(i_data_bus[52]), .ZN(n20) );
  INVD1BWP30P140 U70 ( .I(i_data_bus[20]), .ZN(n77) );
  INVD1BWP30P140 U71 ( .I(i_data_bus[53]), .ZN(n21) );
  INVD1BWP30P140 U72 ( .I(i_data_bus[21]), .ZN(n75) );
  INVD1BWP30P140 U73 ( .I(i_data_bus[54]), .ZN(n22) );
  INVD1BWP30P140 U74 ( .I(i_data_bus[22]), .ZN(n74) );
  INVD1BWP30P140 U75 ( .I(i_data_bus[55]), .ZN(n23) );
  INVD1BWP30P140 U76 ( .I(i_data_bus[23]), .ZN(n73) );
  INVD1BWP30P140 U77 ( .I(i_data_bus[56]), .ZN(n24) );
  INVD1BWP30P140 U78 ( .I(i_data_bus[24]), .ZN(n72) );
  INVD1BWP30P140 U79 ( .I(i_data_bus[57]), .ZN(n25) );
  INVD1BWP30P140 U80 ( .I(i_data_bus[25]), .ZN(n71) );
  INVD1BWP30P140 U81 ( .I(i_data_bus[58]), .ZN(n26) );
  INVD1BWP30P140 U82 ( .I(i_data_bus[26]), .ZN(n70) );
  INVD1BWP30P140 U83 ( .I(i_data_bus[59]), .ZN(n27) );
  INVD1BWP30P140 U84 ( .I(i_data_bus[27]), .ZN(n69) );
  INVD1BWP30P140 U85 ( .I(i_data_bus[60]), .ZN(n28) );
  INVD1BWP30P140 U86 ( .I(i_data_bus[28]), .ZN(n68) );
  INVD1BWP30P140 U87 ( .I(i_data_bus[61]), .ZN(n29) );
  INVD1BWP30P140 U88 ( .I(i_data_bus[29]), .ZN(n67) );
  INVD1BWP30P140 U89 ( .I(i_data_bus[62]), .ZN(n30) );
  INVD1BWP30P140 U90 ( .I(i_data_bus[30]), .ZN(n66) );
  INVD1BWP30P140 U91 ( .I(i_data_bus[63]), .ZN(n31) );
  INVD1BWP30P140 U92 ( .I(i_data_bus[31]), .ZN(n65) );
  OAI31D1BWP30P140 U93 ( .A1(n50), .A2(n51), .A3(n33), .B(n45), .ZN(N353) );
  INVD1BWP30P140 U94 ( .I(i_data_bus[7]), .ZN(n57) );
  INVD2BWP30P140 U95 ( .I(n34), .ZN(n44) );
  INVD1BWP30P140 U96 ( .I(i_data_bus[39]), .ZN(n35) );
  OAI22D1BWP30P140 U97 ( .A1(n39), .A2(n57), .B1(n44), .B2(n35), .ZN(N294) );
  INVD1BWP30P140 U98 ( .I(i_data_bus[6]), .ZN(n56) );
  INVD1BWP30P140 U99 ( .I(i_data_bus[38]), .ZN(n36) );
  OAI22D1BWP30P140 U100 ( .A1(n39), .A2(n56), .B1(n44), .B2(n36), .ZN(N293) );
  INVD1BWP30P140 U101 ( .I(i_data_bus[5]), .ZN(n61) );
  INVD1BWP30P140 U102 ( .I(i_data_bus[37]), .ZN(n37) );
  OAI22D1BWP30P140 U103 ( .A1(n39), .A2(n61), .B1(n44), .B2(n37), .ZN(N292) );
  INVD1BWP30P140 U104 ( .I(i_data_bus[4]), .ZN(n60) );
  INVD1BWP30P140 U105 ( .I(i_data_bus[36]), .ZN(n38) );
  OAI22D1BWP30P140 U106 ( .A1(n39), .A2(n60), .B1(n44), .B2(n38), .ZN(N291) );
  INVD1BWP30P140 U107 ( .I(i_data_bus[3]), .ZN(n64) );
  INVD1BWP30P140 U108 ( .I(i_data_bus[35]), .ZN(n40) );
  OAI22D1BWP30P140 U109 ( .A1(n45), .A2(n64), .B1(n44), .B2(n40), .ZN(N290) );
  INVD1BWP30P140 U110 ( .I(i_data_bus[2]), .ZN(n58) );
  INVD1BWP30P140 U111 ( .I(i_data_bus[34]), .ZN(n41) );
  OAI22D1BWP30P140 U112 ( .A1(n45), .A2(n58), .B1(n44), .B2(n41), .ZN(N289) );
  INVD1BWP30P140 U113 ( .I(i_data_bus[1]), .ZN(n62) );
  INVD1BWP30P140 U114 ( .I(i_data_bus[33]), .ZN(n42) );
  OAI22D1BWP30P140 U115 ( .A1(n45), .A2(n62), .B1(n44), .B2(n42), .ZN(N288) );
  INVD1BWP30P140 U116 ( .I(i_data_bus[0]), .ZN(n59) );
  INVD1BWP30P140 U117 ( .I(i_data_bus[32]), .ZN(n43) );
  OAI22D1BWP30P140 U118 ( .A1(n45), .A2(n59), .B1(n44), .B2(n43), .ZN(N287) );
  INVD1BWP30P140 U119 ( .I(n46), .ZN(n49) );
  INVD1BWP30P140 U120 ( .I(n50), .ZN(n47) );
  INVD1BWP30P140 U121 ( .I(n90), .ZN(n48) );
  OAI21D1BWP30P140 U122 ( .A1(n49), .A2(i_cmd[1]), .B(n48), .ZN(N354) );
  NR2OPTPAD1BWP30P140 U123 ( .A1(n50), .A2(i_cmd[1]), .ZN(n54) );
  MUX2NUD1BWP30P140 U124 ( .I0(n52), .I1(n51), .S(i_cmd[0]), .ZN(n53) );
  ND2OPTIBD1BWP30P140 U125 ( .A1(n54), .A2(n53), .ZN(n55) );
  INVD2BWP30P140 U126 ( .I(n55), .ZN(n78) );
  MOAI22D1BWP30P140 U127 ( .A1(n56), .A2(n63), .B1(i_data_bus[38]), .B2(n90), 
        .ZN(N325) );
  MOAI22D1BWP30P140 U128 ( .A1(n57), .A2(n63), .B1(i_data_bus[39]), .B2(n90), 
        .ZN(N326) );
  MOAI22D1BWP30P140 U129 ( .A1(n58), .A2(n63), .B1(i_data_bus[34]), .B2(n90), 
        .ZN(N321) );
  MOAI22D1BWP30P140 U130 ( .A1(n59), .A2(n63), .B1(i_data_bus[32]), .B2(n90), 
        .ZN(N319) );
  MOAI22D1BWP30P140 U131 ( .A1(n60), .A2(n63), .B1(i_data_bus[36]), .B2(n90), 
        .ZN(N323) );
  MOAI22D1BWP30P140 U132 ( .A1(n61), .A2(n63), .B1(i_data_bus[37]), .B2(n90), 
        .ZN(N324) );
  MOAI22D1BWP30P140 U133 ( .A1(n62), .A2(n63), .B1(i_data_bus[33]), .B2(n90), 
        .ZN(N320) );
  MOAI22D1BWP30P140 U134 ( .A1(n64), .A2(n63), .B1(i_data_bus[35]), .B2(n90), 
        .ZN(N322) );
  INVD2BWP30P140 U135 ( .I(n78), .ZN(n76) );
  MOAI22D1BWP30P140 U136 ( .A1(n65), .A2(n76), .B1(i_data_bus[63]), .B2(n90), 
        .ZN(N350) );
  MOAI22D1BWP30P140 U137 ( .A1(n66), .A2(n76), .B1(i_data_bus[62]), .B2(n90), 
        .ZN(N349) );
  MOAI22D1BWP30P140 U138 ( .A1(n67), .A2(n76), .B1(i_data_bus[61]), .B2(n90), 
        .ZN(N348) );
  MOAI22D1BWP30P140 U139 ( .A1(n68), .A2(n76), .B1(i_data_bus[60]), .B2(n90), 
        .ZN(N347) );
  MOAI22D1BWP30P140 U140 ( .A1(n69), .A2(n76), .B1(i_data_bus[59]), .B2(n90), 
        .ZN(N346) );
  MOAI22D1BWP30P140 U141 ( .A1(n70), .A2(n76), .B1(i_data_bus[58]), .B2(n90), 
        .ZN(N345) );
  MOAI22D1BWP30P140 U142 ( .A1(n71), .A2(n76), .B1(i_data_bus[57]), .B2(n90), 
        .ZN(N344) );
  MOAI22D1BWP30P140 U143 ( .A1(n72), .A2(n76), .B1(i_data_bus[56]), .B2(n90), 
        .ZN(N343) );
  MOAI22D1BWP30P140 U144 ( .A1(n73), .A2(n76), .B1(i_data_bus[55]), .B2(n90), 
        .ZN(N342) );
  MOAI22D1BWP30P140 U145 ( .A1(n74), .A2(n76), .B1(i_data_bus[54]), .B2(n90), 
        .ZN(N341) );
  MOAI22D1BWP30P140 U146 ( .A1(n75), .A2(n76), .B1(i_data_bus[53]), .B2(n90), 
        .ZN(N340) );
  MOAI22D1BWP30P140 U147 ( .A1(n77), .A2(n76), .B1(i_data_bus[52]), .B2(n90), 
        .ZN(N339) );
  INVD2BWP30P140 U148 ( .I(n78), .ZN(n91) );
  MOAI22D1BWP30P140 U149 ( .A1(n79), .A2(n91), .B1(i_data_bus[51]), .B2(n90), 
        .ZN(N338) );
  MOAI22D1BWP30P140 U150 ( .A1(n80), .A2(n91), .B1(i_data_bus[50]), .B2(n90), 
        .ZN(N337) );
  MOAI22D1BWP30P140 U151 ( .A1(n81), .A2(n91), .B1(i_data_bus[49]), .B2(n90), 
        .ZN(N336) );
  MOAI22D1BWP30P140 U152 ( .A1(n82), .A2(n91), .B1(i_data_bus[48]), .B2(n90), 
        .ZN(N335) );
  MOAI22D1BWP30P140 U153 ( .A1(n83), .A2(n91), .B1(i_data_bus[47]), .B2(n90), 
        .ZN(N334) );
  MOAI22D1BWP30P140 U154 ( .A1(n84), .A2(n91), .B1(i_data_bus[46]), .B2(n90), 
        .ZN(N333) );
  MOAI22D1BWP30P140 U155 ( .A1(n85), .A2(n91), .B1(i_data_bus[45]), .B2(n90), 
        .ZN(N332) );
  MOAI22D1BWP30P140 U156 ( .A1(n86), .A2(n91), .B1(i_data_bus[44]), .B2(n90), 
        .ZN(N331) );
  MOAI22D1BWP30P140 U157 ( .A1(n87), .A2(n91), .B1(i_data_bus[43]), .B2(n90), 
        .ZN(N330) );
  MOAI22D1BWP30P140 U158 ( .A1(n88), .A2(n91), .B1(i_data_bus[42]), .B2(n90), 
        .ZN(N329) );
  MOAI22D1BWP30P140 U159 ( .A1(n89), .A2(n91), .B1(i_data_bus[41]), .B2(n90), 
        .ZN(N328) );
  MOAI22D1BWP30P140 U160 ( .A1(n92), .A2(n91), .B1(i_data_bus[40]), .B2(n90), 
        .ZN(N327) );
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
         n45, n46, n47, n48, n49, n50, n51, n52, n53, n54, n55, n56, n57, n58,
         n59, n60, n61, n62, n63, n64, n65, n66, n67, n68, n69, n70, n71, n72,
         n73, n74, n75, n76, n77, n78, n79, n80, n81, n82, n83, n84, n85, n86,
         n87, n88;

  DFQD1BWP30P140 o_data_bus_inner_reg_63_ ( .D(N350), .CP(clk), .Q(
        o_data_bus[63]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_62_ ( .D(N349), .CP(clk), .Q(
        o_data_bus[62]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_61_ ( .D(N348), .CP(clk), .Q(
        o_data_bus[61]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_60_ ( .D(N347), .CP(clk), .Q(
        o_data_bus[60]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_59_ ( .D(N346), .CP(clk), .Q(
        o_data_bus[59]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_58_ ( .D(N345), .CP(clk), .Q(
        o_data_bus[58]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_57_ ( .D(N344), .CP(clk), .Q(
        o_data_bus[57]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_56_ ( .D(N343), .CP(clk), .Q(
        o_data_bus[56]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_55_ ( .D(N342), .CP(clk), .Q(
        o_data_bus[55]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_54_ ( .D(N341), .CP(clk), .Q(
        o_data_bus[54]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_53_ ( .D(N340), .CP(clk), .Q(
        o_data_bus[53]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_52_ ( .D(N339), .CP(clk), .Q(
        o_data_bus[52]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_51_ ( .D(N338), .CP(clk), .Q(
        o_data_bus[51]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_50_ ( .D(N337), .CP(clk), .Q(
        o_data_bus[50]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_49_ ( .D(N336), .CP(clk), .Q(
        o_data_bus[49]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_48_ ( .D(N335), .CP(clk), .Q(
        o_data_bus[48]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_47_ ( .D(N334), .CP(clk), .Q(
        o_data_bus[47]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_46_ ( .D(N333), .CP(clk), .Q(
        o_data_bus[46]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_45_ ( .D(N332), .CP(clk), .Q(
        o_data_bus[45]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_44_ ( .D(N331), .CP(clk), .Q(
        o_data_bus[44]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_43_ ( .D(N330), .CP(clk), .Q(
        o_data_bus[43]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_42_ ( .D(N329), .CP(clk), .Q(
        o_data_bus[42]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_41_ ( .D(N328), .CP(clk), .Q(
        o_data_bus[41]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_40_ ( .D(N327), .CP(clk), .Q(
        o_data_bus[40]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_39_ ( .D(N326), .CP(clk), .Q(
        o_data_bus[39]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_38_ ( .D(N325), .CP(clk), .Q(
        o_data_bus[38]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_37_ ( .D(N324), .CP(clk), .Q(
        o_data_bus[37]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_36_ ( .D(N323), .CP(clk), .Q(
        o_data_bus[36]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_35_ ( .D(N322), .CP(clk), .Q(
        o_data_bus[35]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_34_ ( .D(N321), .CP(clk), .Q(
        o_data_bus[34]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_33_ ( .D(N320), .CP(clk), .Q(
        o_data_bus[33]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_32_ ( .D(N319), .CP(clk), .Q(
        o_data_bus[32]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_31_ ( .D(N318), .CP(clk), .Q(
        o_data_bus[31]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_30_ ( .D(N317), .CP(clk), .Q(
        o_data_bus[30]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_29_ ( .D(N316), .CP(clk), .Q(
        o_data_bus[29]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_28_ ( .D(N315), .CP(clk), .Q(
        o_data_bus[28]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_27_ ( .D(N314), .CP(clk), .Q(
        o_data_bus[27]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_26_ ( .D(N313), .CP(clk), .Q(
        o_data_bus[26]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_25_ ( .D(N312), .CP(clk), .Q(
        o_data_bus[25]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_24_ ( .D(N311), .CP(clk), .Q(
        o_data_bus[24]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_23_ ( .D(N310), .CP(clk), .Q(
        o_data_bus[23]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_22_ ( .D(N309), .CP(clk), .Q(
        o_data_bus[22]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_21_ ( .D(N308), .CP(clk), .Q(
        o_data_bus[21]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_20_ ( .D(N307), .CP(clk), .Q(
        o_data_bus[20]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_19_ ( .D(N306), .CP(clk), .Q(
        o_data_bus[19]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_18_ ( .D(N305), .CP(clk), .Q(
        o_data_bus[18]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_17_ ( .D(N304), .CP(clk), .Q(
        o_data_bus[17]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_16_ ( .D(N303), .CP(clk), .Q(
        o_data_bus[16]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_15_ ( .D(N302), .CP(clk), .Q(
        o_data_bus[15]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_14_ ( .D(N301), .CP(clk), .Q(
        o_data_bus[14]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_13_ ( .D(N300), .CP(clk), .Q(
        o_data_bus[13]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_12_ ( .D(N299), .CP(clk), .Q(
        o_data_bus[12]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_11_ ( .D(N298), .CP(clk), .Q(
        o_data_bus[11]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_10_ ( .D(N297), .CP(clk), .Q(
        o_data_bus[10]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_9_ ( .D(N296), .CP(clk), .Q(
        o_data_bus[9]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_8_ ( .D(N295), .CP(clk), .Q(
        o_data_bus[8]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_7_ ( .D(N294), .CP(clk), .Q(
        o_data_bus[7]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_6_ ( .D(N293), .CP(clk), .Q(
        o_data_bus[6]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_5_ ( .D(N292), .CP(clk), .Q(
        o_data_bus[5]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_4_ ( .D(N291), .CP(clk), .Q(
        o_data_bus[4]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_3_ ( .D(N290), .CP(clk), .Q(
        o_data_bus[3]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_2_ ( .D(N289), .CP(clk), .Q(
        o_data_bus[2]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_1_ ( .D(N288), .CP(clk), .Q(
        o_data_bus[1]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_0_ ( .D(N287), .CP(clk), .Q(
        o_data_bus[0]) );
  DFQD4BWP30P140 o_valid_inner_reg_1_ ( .D(N354), .CP(clk), .Q(o_valid[1]) );
  DFQD2BWP30P140 o_valid_inner_reg_0_ ( .D(N353), .CP(clk), .Q(o_valid[0]) );
  AN3D4BWP30P140 U3 ( .A1(i_valid[1]), .A2(i_cmd[1]), .A3(n47), .Z(n86) );
  NR2D1BWP30P140 U4 ( .A1(n50), .A2(n3), .ZN(n5) );
  INVD1BWP30P140 U5 ( .I(i_cmd[0]), .ZN(n3) );
  ND2OPTIBD4BWP30P140 U6 ( .A1(n53), .A2(n54), .ZN(n87) );
  NR2D1BWP30P140 U7 ( .A1(n50), .A2(i_cmd[1]), .ZN(n54) );
  OAI22D1BWP30P140 U8 ( .A1(n20), .A2(n8), .B1(n45), .B2(n88), .ZN(N295) );
  OAI22D1BWP30P140 U9 ( .A1(n20), .A2(n9), .B1(n32), .B2(n85), .ZN(N296) );
  OAI22D1BWP30P140 U10 ( .A1(n20), .A2(n10), .B1(n45), .B2(n84), .ZN(N297) );
  OAI22D1BWP30P140 U11 ( .A1(n20), .A2(n11), .B1(n32), .B2(n83), .ZN(N298) );
  OAI22D1BWP30P140 U12 ( .A1(n20), .A2(n12), .B1(n45), .B2(n82), .ZN(N299) );
  OAI22D1BWP30P140 U13 ( .A1(n20), .A2(n13), .B1(n32), .B2(n81), .ZN(N300) );
  OAI22D1BWP30P140 U14 ( .A1(n20), .A2(n14), .B1(n45), .B2(n80), .ZN(N301) );
  OAI22D1BWP30P140 U15 ( .A1(n20), .A2(n15), .B1(n32), .B2(n79), .ZN(N302) );
  OAI22D1BWP30P140 U16 ( .A1(n20), .A2(n16), .B1(n45), .B2(n78), .ZN(N303) );
  OAI22D1BWP30P140 U17 ( .A1(n20), .A2(n17), .B1(n32), .B2(n77), .ZN(N304) );
  OAI22D1BWP30P140 U18 ( .A1(n20), .A2(n18), .B1(n45), .B2(n76), .ZN(N305) );
  OAI22D1BWP30P140 U19 ( .A1(n20), .A2(n19), .B1(n32), .B2(n75), .ZN(N306) );
  OAI22D1BWP30P140 U20 ( .A1(n34), .A2(n21), .B1(n45), .B2(n74), .ZN(N307) );
  OAI22D1BWP30P140 U21 ( .A1(n34), .A2(n22), .B1(n32), .B2(n73), .ZN(N308) );
  OAI22D1BWP30P140 U22 ( .A1(n34), .A2(n23), .B1(n45), .B2(n72), .ZN(N309) );
  OAI22D1BWP30P140 U23 ( .A1(n34), .A2(n24), .B1(n32), .B2(n71), .ZN(N310) );
  OAI22D1BWP30P140 U24 ( .A1(n34), .A2(n25), .B1(n45), .B2(n70), .ZN(N311) );
  OAI22D1BWP30P140 U25 ( .A1(n34), .A2(n26), .B1(n32), .B2(n69), .ZN(N312) );
  OAI22D1BWP30P140 U26 ( .A1(n34), .A2(n27), .B1(n45), .B2(n68), .ZN(N313) );
  OAI22D1BWP30P140 U27 ( .A1(n34), .A2(n28), .B1(n32), .B2(n67), .ZN(N314) );
  OAI22D1BWP30P140 U28 ( .A1(n34), .A2(n29), .B1(n45), .B2(n66), .ZN(N315) );
  OAI22D1BWP30P140 U29 ( .A1(n34), .A2(n30), .B1(n32), .B2(n65), .ZN(N316) );
  OAI22D1BWP30P140 U30 ( .A1(n34), .A2(n31), .B1(n45), .B2(n64), .ZN(N317) );
  OAI22D1BWP30P140 U31 ( .A1(n34), .A2(n33), .B1(n32), .B2(n63), .ZN(N318) );
  INVD2BWP30P140 U32 ( .I(i_valid[0]), .ZN(n52) );
  INVD1BWP30P140 U33 ( .I(n2), .ZN(n7) );
  ND2OPTIBD1BWP30P140 U34 ( .A1(n46), .A2(n3), .ZN(n2) );
  ND2D1BWP30P140 U35 ( .A1(n1), .A2(i_en), .ZN(n50) );
  INVD1BWP30P140 U36 ( .I(n35), .ZN(n44) );
  INVD2BWP30P140 U37 ( .I(n7), .ZN(n45) );
  INVD1BWP30P140 U38 ( .I(n35), .ZN(n20) );
  INVD2BWP30P140 U39 ( .I(n7), .ZN(n32) );
  INVD1BWP30P140 U40 ( .I(n35), .ZN(n34) );
  OAI31D1BWP30P140 U41 ( .A1(n50), .A2(n51), .A3(n3), .B(n45), .ZN(N353) );
  INVD1BWP30P140 U42 ( .I(rst), .ZN(n1) );
  INVD2BWP30P140 U43 ( .I(i_valid[1]), .ZN(n51) );
  INR2D2BWP30P140 U44 ( .A1(i_valid[0]), .B1(n50), .ZN(n46) );
  MUX2NUD1BWP30P140 U45 ( .I0(n52), .I1(n51), .S(i_cmd[1]), .ZN(n4) );
  ND2OPTIBD1BWP30P140 U46 ( .A1(n5), .A2(n4), .ZN(n6) );
  INVD2BWP30P140 U47 ( .I(n6), .ZN(n35) );
  INVD1BWP30P140 U48 ( .I(i_data_bus[40]), .ZN(n8) );
  INVD1BWP30P140 U49 ( .I(i_data_bus[8]), .ZN(n88) );
  INVD1BWP30P140 U50 ( .I(i_data_bus[41]), .ZN(n9) );
  INVD1BWP30P140 U51 ( .I(i_data_bus[9]), .ZN(n85) );
  INVD1BWP30P140 U52 ( .I(i_data_bus[42]), .ZN(n10) );
  INVD1BWP30P140 U53 ( .I(i_data_bus[10]), .ZN(n84) );
  INVD1BWP30P140 U54 ( .I(i_data_bus[43]), .ZN(n11) );
  INVD1BWP30P140 U55 ( .I(i_data_bus[11]), .ZN(n83) );
  INVD1BWP30P140 U56 ( .I(i_data_bus[44]), .ZN(n12) );
  INVD1BWP30P140 U57 ( .I(i_data_bus[12]), .ZN(n82) );
  INVD1BWP30P140 U58 ( .I(i_data_bus[45]), .ZN(n13) );
  INVD1BWP30P140 U59 ( .I(i_data_bus[13]), .ZN(n81) );
  INVD1BWP30P140 U60 ( .I(i_data_bus[46]), .ZN(n14) );
  INVD1BWP30P140 U61 ( .I(i_data_bus[14]), .ZN(n80) );
  INVD1BWP30P140 U62 ( .I(i_data_bus[47]), .ZN(n15) );
  INVD1BWP30P140 U63 ( .I(i_data_bus[15]), .ZN(n79) );
  INVD1BWP30P140 U64 ( .I(i_data_bus[48]), .ZN(n16) );
  INVD1BWP30P140 U65 ( .I(i_data_bus[16]), .ZN(n78) );
  INVD1BWP30P140 U66 ( .I(i_data_bus[49]), .ZN(n17) );
  INVD1BWP30P140 U67 ( .I(i_data_bus[17]), .ZN(n77) );
  INVD1BWP30P140 U68 ( .I(i_data_bus[50]), .ZN(n18) );
  INVD1BWP30P140 U69 ( .I(i_data_bus[18]), .ZN(n76) );
  INVD1BWP30P140 U70 ( .I(i_data_bus[51]), .ZN(n19) );
  INVD1BWP30P140 U71 ( .I(i_data_bus[19]), .ZN(n75) );
  INVD1BWP30P140 U72 ( .I(i_data_bus[52]), .ZN(n21) );
  INVD1BWP30P140 U73 ( .I(i_data_bus[20]), .ZN(n74) );
  INVD1BWP30P140 U74 ( .I(i_data_bus[53]), .ZN(n22) );
  INVD1BWP30P140 U75 ( .I(i_data_bus[21]), .ZN(n73) );
  INVD1BWP30P140 U76 ( .I(i_data_bus[54]), .ZN(n23) );
  INVD1BWP30P140 U77 ( .I(i_data_bus[22]), .ZN(n72) );
  INVD1BWP30P140 U78 ( .I(i_data_bus[55]), .ZN(n24) );
  INVD1BWP30P140 U79 ( .I(i_data_bus[23]), .ZN(n71) );
  INVD1BWP30P140 U80 ( .I(i_data_bus[56]), .ZN(n25) );
  INVD1BWP30P140 U81 ( .I(i_data_bus[24]), .ZN(n70) );
  INVD1BWP30P140 U82 ( .I(i_data_bus[57]), .ZN(n26) );
  INVD1BWP30P140 U83 ( .I(i_data_bus[25]), .ZN(n69) );
  INVD1BWP30P140 U84 ( .I(i_data_bus[58]), .ZN(n27) );
  INVD1BWP30P140 U85 ( .I(i_data_bus[26]), .ZN(n68) );
  INVD1BWP30P140 U86 ( .I(i_data_bus[59]), .ZN(n28) );
  INVD1BWP30P140 U87 ( .I(i_data_bus[27]), .ZN(n67) );
  INVD1BWP30P140 U88 ( .I(i_data_bus[60]), .ZN(n29) );
  INVD1BWP30P140 U89 ( .I(i_data_bus[28]), .ZN(n66) );
  INVD1BWP30P140 U90 ( .I(i_data_bus[61]), .ZN(n30) );
  INVD1BWP30P140 U91 ( .I(i_data_bus[29]), .ZN(n65) );
  INVD1BWP30P140 U92 ( .I(i_data_bus[62]), .ZN(n31) );
  INVD1BWP30P140 U93 ( .I(i_data_bus[30]), .ZN(n64) );
  INVD1BWP30P140 U94 ( .I(i_data_bus[63]), .ZN(n33) );
  INVD1BWP30P140 U95 ( .I(i_data_bus[31]), .ZN(n63) );
  INVD1BWP30P140 U96 ( .I(i_data_bus[7]), .ZN(n58) );
  INVD1BWP30P140 U97 ( .I(i_data_bus[39]), .ZN(n36) );
  OAI22D1BWP30P140 U98 ( .A1(n45), .A2(n58), .B1(n44), .B2(n36), .ZN(N294) );
  INVD1BWP30P140 U99 ( .I(i_data_bus[6]), .ZN(n56) );
  INVD1BWP30P140 U100 ( .I(i_data_bus[38]), .ZN(n37) );
  OAI22D1BWP30P140 U101 ( .A1(n32), .A2(n56), .B1(n44), .B2(n37), .ZN(N293) );
  INVD1BWP30P140 U102 ( .I(i_data_bus[5]), .ZN(n57) );
  INVD1BWP30P140 U103 ( .I(i_data_bus[37]), .ZN(n38) );
  OAI22D1BWP30P140 U104 ( .A1(n45), .A2(n57), .B1(n44), .B2(n38), .ZN(N292) );
  INVD1BWP30P140 U105 ( .I(i_data_bus[4]), .ZN(n60) );
  INVD1BWP30P140 U106 ( .I(i_data_bus[36]), .ZN(n39) );
  OAI22D1BWP30P140 U107 ( .A1(n32), .A2(n60), .B1(n44), .B2(n39), .ZN(N291) );
  INVD1BWP30P140 U108 ( .I(i_data_bus[3]), .ZN(n59) );
  INVD1BWP30P140 U109 ( .I(i_data_bus[35]), .ZN(n40) );
  OAI22D1BWP30P140 U110 ( .A1(n45), .A2(n59), .B1(n44), .B2(n40), .ZN(N290) );
  INVD1BWP30P140 U111 ( .I(i_data_bus[2]), .ZN(n61) );
  INVD1BWP30P140 U112 ( .I(i_data_bus[34]), .ZN(n41) );
  OAI22D1BWP30P140 U113 ( .A1(n32), .A2(n61), .B1(n44), .B2(n41), .ZN(N289) );
  INVD1BWP30P140 U114 ( .I(i_data_bus[1]), .ZN(n62) );
  INVD1BWP30P140 U115 ( .I(i_data_bus[33]), .ZN(n42) );
  OAI22D1BWP30P140 U116 ( .A1(n45), .A2(n62), .B1(n44), .B2(n42), .ZN(N288) );
  INVD1BWP30P140 U117 ( .I(i_data_bus[0]), .ZN(n55) );
  INVD1BWP30P140 U118 ( .I(i_data_bus[32]), .ZN(n43) );
  OAI22D1BWP30P140 U119 ( .A1(n32), .A2(n55), .B1(n44), .B2(n43), .ZN(N287) );
  INVD1BWP30P140 U120 ( .I(n46), .ZN(n49) );
  INVD1BWP30P140 U121 ( .I(n50), .ZN(n47) );
  INVD1BWP30P140 U122 ( .I(n86), .ZN(n48) );
  OAI21D1BWP30P140 U123 ( .A1(n49), .A2(i_cmd[1]), .B(n48), .ZN(N354) );
  MUX2NUD1BWP30P140 U124 ( .I0(n52), .I1(n51), .S(i_cmd[0]), .ZN(n53) );
  MOAI22D1BWP30P140 U125 ( .A1(n55), .A2(n87), .B1(i_data_bus[32]), .B2(n86), 
        .ZN(N319) );
  MOAI22D1BWP30P140 U126 ( .A1(n56), .A2(n87), .B1(i_data_bus[38]), .B2(n86), 
        .ZN(N325) );
  MOAI22D1BWP30P140 U127 ( .A1(n57), .A2(n87), .B1(i_data_bus[37]), .B2(n86), 
        .ZN(N324) );
  MOAI22D1BWP30P140 U128 ( .A1(n58), .A2(n87), .B1(i_data_bus[39]), .B2(n86), 
        .ZN(N326) );
  MOAI22D1BWP30P140 U129 ( .A1(n59), .A2(n87), .B1(i_data_bus[35]), .B2(n86), 
        .ZN(N322) );
  MOAI22D1BWP30P140 U130 ( .A1(n60), .A2(n87), .B1(i_data_bus[36]), .B2(n86), 
        .ZN(N323) );
  MOAI22D1BWP30P140 U131 ( .A1(n61), .A2(n87), .B1(i_data_bus[34]), .B2(n86), 
        .ZN(N321) );
  MOAI22D1BWP30P140 U132 ( .A1(n62), .A2(n87), .B1(i_data_bus[33]), .B2(n86), 
        .ZN(N320) );
  MOAI22D1BWP30P140 U133 ( .A1(n63), .A2(n87), .B1(i_data_bus[63]), .B2(n86), 
        .ZN(N350) );
  MOAI22D1BWP30P140 U134 ( .A1(n64), .A2(n87), .B1(i_data_bus[62]), .B2(n86), 
        .ZN(N349) );
  MOAI22D1BWP30P140 U135 ( .A1(n65), .A2(n87), .B1(i_data_bus[61]), .B2(n86), 
        .ZN(N348) );
  MOAI22D1BWP30P140 U136 ( .A1(n66), .A2(n87), .B1(i_data_bus[60]), .B2(n86), 
        .ZN(N347) );
  MOAI22D1BWP30P140 U137 ( .A1(n67), .A2(n87), .B1(i_data_bus[59]), .B2(n86), 
        .ZN(N346) );
  MOAI22D1BWP30P140 U138 ( .A1(n68), .A2(n87), .B1(i_data_bus[58]), .B2(n86), 
        .ZN(N345) );
  MOAI22D1BWP30P140 U139 ( .A1(n69), .A2(n87), .B1(i_data_bus[57]), .B2(n86), 
        .ZN(N344) );
  MOAI22D1BWP30P140 U140 ( .A1(n70), .A2(n87), .B1(i_data_bus[56]), .B2(n86), 
        .ZN(N343) );
  MOAI22D1BWP30P140 U141 ( .A1(n71), .A2(n87), .B1(i_data_bus[55]), .B2(n86), 
        .ZN(N342) );
  MOAI22D1BWP30P140 U142 ( .A1(n72), .A2(n87), .B1(i_data_bus[54]), .B2(n86), 
        .ZN(N341) );
  MOAI22D1BWP30P140 U143 ( .A1(n73), .A2(n87), .B1(i_data_bus[53]), .B2(n86), 
        .ZN(N340) );
  MOAI22D1BWP30P140 U144 ( .A1(n74), .A2(n87), .B1(i_data_bus[52]), .B2(n86), 
        .ZN(N339) );
  MOAI22D1BWP30P140 U145 ( .A1(n75), .A2(n87), .B1(i_data_bus[51]), .B2(n86), 
        .ZN(N338) );
  MOAI22D1BWP30P140 U146 ( .A1(n76), .A2(n87), .B1(i_data_bus[50]), .B2(n86), 
        .ZN(N337) );
  MOAI22D1BWP30P140 U147 ( .A1(n77), .A2(n87), .B1(i_data_bus[49]), .B2(n86), 
        .ZN(N336) );
  MOAI22D1BWP30P140 U148 ( .A1(n78), .A2(n87), .B1(i_data_bus[48]), .B2(n86), 
        .ZN(N335) );
  MOAI22D1BWP30P140 U149 ( .A1(n79), .A2(n87), .B1(i_data_bus[47]), .B2(n86), 
        .ZN(N334) );
  MOAI22D1BWP30P140 U150 ( .A1(n80), .A2(n87), .B1(i_data_bus[46]), .B2(n86), 
        .ZN(N333) );
  MOAI22D1BWP30P140 U151 ( .A1(n81), .A2(n87), .B1(i_data_bus[45]), .B2(n86), 
        .ZN(N332) );
  MOAI22D1BWP30P140 U152 ( .A1(n82), .A2(n87), .B1(i_data_bus[44]), .B2(n86), 
        .ZN(N331) );
  MOAI22D1BWP30P140 U153 ( .A1(n83), .A2(n87), .B1(i_data_bus[43]), .B2(n86), 
        .ZN(N330) );
  MOAI22D1BWP30P140 U154 ( .A1(n84), .A2(n87), .B1(i_data_bus[42]), .B2(n86), 
        .ZN(N329) );
  MOAI22D1BWP30P140 U155 ( .A1(n85), .A2(n87), .B1(i_data_bus[41]), .B2(n86), 
        .ZN(N328) );
  MOAI22D1BWP30P140 U156 ( .A1(n88), .A2(n87), .B1(i_data_bus[40]), .B2(n86), 
        .ZN(N327) );
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
         n45, n46, n47, n48, n49, n50, n51, n52, n53, n54, n55, n56, n57, n58,
         n59, n60, n61, n62, n63, n64, n65, n66, n67, n68, n69, n70, n71, n72,
         n73, n74, n75, n76, n77, n78, n79, n80, n81, n82, n83, n84, n85, n86,
         n87, n88, n89;

  DFQD1BWP30P140 o_data_bus_inner_reg_63_ ( .D(N350), .CP(clk), .Q(
        o_data_bus[63]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_62_ ( .D(N349), .CP(clk), .Q(
        o_data_bus[62]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_61_ ( .D(N348), .CP(clk), .Q(
        o_data_bus[61]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_60_ ( .D(N347), .CP(clk), .Q(
        o_data_bus[60]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_59_ ( .D(N346), .CP(clk), .Q(
        o_data_bus[59]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_58_ ( .D(N345), .CP(clk), .Q(
        o_data_bus[58]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_57_ ( .D(N344), .CP(clk), .Q(
        o_data_bus[57]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_56_ ( .D(N343), .CP(clk), .Q(
        o_data_bus[56]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_55_ ( .D(N342), .CP(clk), .Q(
        o_data_bus[55]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_54_ ( .D(N341), .CP(clk), .Q(
        o_data_bus[54]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_53_ ( .D(N340), .CP(clk), .Q(
        o_data_bus[53]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_52_ ( .D(N339), .CP(clk), .Q(
        o_data_bus[52]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_51_ ( .D(N338), .CP(clk), .Q(
        o_data_bus[51]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_50_ ( .D(N337), .CP(clk), .Q(
        o_data_bus[50]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_49_ ( .D(N336), .CP(clk), .Q(
        o_data_bus[49]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_48_ ( .D(N335), .CP(clk), .Q(
        o_data_bus[48]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_47_ ( .D(N334), .CP(clk), .Q(
        o_data_bus[47]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_46_ ( .D(N333), .CP(clk), .Q(
        o_data_bus[46]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_45_ ( .D(N332), .CP(clk), .Q(
        o_data_bus[45]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_44_ ( .D(N331), .CP(clk), .Q(
        o_data_bus[44]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_43_ ( .D(N330), .CP(clk), .Q(
        o_data_bus[43]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_42_ ( .D(N329), .CP(clk), .Q(
        o_data_bus[42]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_41_ ( .D(N328), .CP(clk), .Q(
        o_data_bus[41]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_40_ ( .D(N327), .CP(clk), .Q(
        o_data_bus[40]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_39_ ( .D(N326), .CP(clk), .Q(
        o_data_bus[39]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_38_ ( .D(N325), .CP(clk), .Q(
        o_data_bus[38]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_37_ ( .D(N324), .CP(clk), .Q(
        o_data_bus[37]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_36_ ( .D(N323), .CP(clk), .Q(
        o_data_bus[36]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_35_ ( .D(N322), .CP(clk), .Q(
        o_data_bus[35]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_34_ ( .D(N321), .CP(clk), .Q(
        o_data_bus[34]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_33_ ( .D(N320), .CP(clk), .Q(
        o_data_bus[33]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_32_ ( .D(N319), .CP(clk), .Q(
        o_data_bus[32]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_31_ ( .D(N318), .CP(clk), .Q(
        o_data_bus[31]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_30_ ( .D(N317), .CP(clk), .Q(
        o_data_bus[30]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_29_ ( .D(N316), .CP(clk), .Q(
        o_data_bus[29]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_28_ ( .D(N315), .CP(clk), .Q(
        o_data_bus[28]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_27_ ( .D(N314), .CP(clk), .Q(
        o_data_bus[27]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_26_ ( .D(N313), .CP(clk), .Q(
        o_data_bus[26]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_25_ ( .D(N312), .CP(clk), .Q(
        o_data_bus[25]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_24_ ( .D(N311), .CP(clk), .Q(
        o_data_bus[24]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_23_ ( .D(N310), .CP(clk), .Q(
        o_data_bus[23]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_22_ ( .D(N309), .CP(clk), .Q(
        o_data_bus[22]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_21_ ( .D(N308), .CP(clk), .Q(
        o_data_bus[21]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_20_ ( .D(N307), .CP(clk), .Q(
        o_data_bus[20]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_19_ ( .D(N306), .CP(clk), .Q(
        o_data_bus[19]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_18_ ( .D(N305), .CP(clk), .Q(
        o_data_bus[18]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_17_ ( .D(N304), .CP(clk), .Q(
        o_data_bus[17]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_16_ ( .D(N303), .CP(clk), .Q(
        o_data_bus[16]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_15_ ( .D(N302), .CP(clk), .Q(
        o_data_bus[15]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_14_ ( .D(N301), .CP(clk), .Q(
        o_data_bus[14]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_13_ ( .D(N300), .CP(clk), .Q(
        o_data_bus[13]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_12_ ( .D(N299), .CP(clk), .Q(
        o_data_bus[12]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_11_ ( .D(N298), .CP(clk), .Q(
        o_data_bus[11]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_10_ ( .D(N297), .CP(clk), .Q(
        o_data_bus[10]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_9_ ( .D(N296), .CP(clk), .Q(
        o_data_bus[9]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_8_ ( .D(N295), .CP(clk), .Q(
        o_data_bus[8]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_7_ ( .D(N294), .CP(clk), .Q(
        o_data_bus[7]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_6_ ( .D(N293), .CP(clk), .Q(
        o_data_bus[6]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_5_ ( .D(N292), .CP(clk), .Q(
        o_data_bus[5]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_4_ ( .D(N291), .CP(clk), .Q(
        o_data_bus[4]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_3_ ( .D(N290), .CP(clk), .Q(
        o_data_bus[3]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_2_ ( .D(N289), .CP(clk), .Q(
        o_data_bus[2]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_1_ ( .D(N288), .CP(clk), .Q(
        o_data_bus[1]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_0_ ( .D(N287), .CP(clk), .Q(
        o_data_bus[0]) );
  DFQD4BWP30P140 o_valid_inner_reg_1_ ( .D(N354), .CP(clk), .Q(o_valid[1]) );
  DFQD2BWP30P140 o_valid_inner_reg_0_ ( .D(N353), .CP(clk), .Q(o_valid[0]) );
  INVD1BWP30P140 U3 ( .I(n54), .ZN(n76) );
  INR2D1BWP30P140 U4 ( .A1(i_valid[0]), .B1(n49), .ZN(n45) );
  NR2D1BWP30P140 U5 ( .A1(n49), .A2(n33), .ZN(n5) );
  AN2D2BWP30P140 U6 ( .A1(n45), .A2(n33), .Z(n1) );
  INVD6BWP30P140 U7 ( .I(n76), .ZN(n74) );
  INVD4BWP30P140 U8 ( .I(n1), .ZN(n2) );
  INVD2BWP30P140 U9 ( .I(i_cmd[0]), .ZN(n33) );
  NR2D1BWP30P140 U10 ( .A1(n49), .A2(i_cmd[1]), .ZN(n53) );
  INVD1BWP30P140 U11 ( .I(i_valid[0]), .ZN(n51) );
  ND2D1BWP30P140 U12 ( .A1(n3), .A2(i_en), .ZN(n49) );
  INVD1BWP30P140 U13 ( .I(n34), .ZN(n43) );
  AN3D4BWP30P140 U14 ( .A1(i_valid[1]), .A2(i_cmd[1]), .A3(n46), .Z(n88) );
  OAI22D1BWP30P140 U15 ( .A1(n26), .A2(n27), .B1(n44), .B2(n63), .ZN(N295) );
  OAI22D1BWP30P140 U16 ( .A1(n32), .A2(n28), .B1(n44), .B2(n64), .ZN(N296) );
  OAI22D1BWP30P140 U17 ( .A1(n26), .A2(n31), .B1(n44), .B2(n65), .ZN(N297) );
  OAI22D1BWP30P140 U18 ( .A1(n32), .A2(n29), .B1(n44), .B2(n66), .ZN(N298) );
  OAI22D1BWP30P140 U19 ( .A1(n26), .A2(n30), .B1(n44), .B2(n67), .ZN(N299) );
  OAI22D1BWP30P140 U20 ( .A1(n32), .A2(n21), .B1(n44), .B2(n68), .ZN(N300) );
  OAI22D1BWP30P140 U21 ( .A1(n26), .A2(n22), .B1(n44), .B2(n69), .ZN(N301) );
  OAI22D1BWP30P140 U22 ( .A1(n32), .A2(n23), .B1(n44), .B2(n70), .ZN(N302) );
  OAI22D1BWP30P140 U23 ( .A1(n26), .A2(n7), .B1(n44), .B2(n71), .ZN(N303) );
  OAI22D1BWP30P140 U24 ( .A1(n32), .A2(n8), .B1(n44), .B2(n72), .ZN(N304) );
  OAI22D1BWP30P140 U25 ( .A1(n26), .A2(n13), .B1(n44), .B2(n73), .ZN(N305) );
  OAI22D1BWP30P140 U26 ( .A1(n32), .A2(n14), .B1(n44), .B2(n75), .ZN(N306) );
  OAI22D1BWP30P140 U27 ( .A1(n32), .A2(n9), .B1(n44), .B2(n89), .ZN(N307) );
  OAI22D1BWP30P140 U28 ( .A1(n26), .A2(n10), .B1(n2), .B2(n87), .ZN(N308) );
  OAI22D1BWP30P140 U29 ( .A1(n26), .A2(n11), .B1(n2), .B2(n86), .ZN(N309) );
  OAI22D1BWP30P140 U30 ( .A1(n32), .A2(n12), .B1(n2), .B2(n85), .ZN(N310) );
  OAI22D1BWP30P140 U31 ( .A1(n32), .A2(n24), .B1(n2), .B2(n84), .ZN(N311) );
  OAI22D1BWP30P140 U32 ( .A1(n26), .A2(n25), .B1(n2), .B2(n83), .ZN(N312) );
  OAI22D1BWP30P140 U33 ( .A1(n26), .A2(n15), .B1(n2), .B2(n82), .ZN(N313) );
  OAI22D1BWP30P140 U34 ( .A1(n32), .A2(n16), .B1(n2), .B2(n81), .ZN(N314) );
  OAI22D1BWP30P140 U35 ( .A1(n32), .A2(n17), .B1(n2), .B2(n80), .ZN(N315) );
  OAI22D1BWP30P140 U36 ( .A1(n26), .A2(n18), .B1(n2), .B2(n79), .ZN(N316) );
  OAI22D1BWP30P140 U37 ( .A1(n26), .A2(n19), .B1(n2), .B2(n78), .ZN(N317) );
  OAI22D1BWP30P140 U38 ( .A1(n32), .A2(n20), .B1(n2), .B2(n77), .ZN(N318) );
  INVD1BWP30P140 U39 ( .I(rst), .ZN(n3) );
  INVD2BWP30P140 U40 ( .I(i_valid[1]), .ZN(n50) );
  MUX2NUD1BWP30P140 U41 ( .I0(n51), .I1(n50), .S(i_cmd[1]), .ZN(n4) );
  ND2OPTIBD1BWP30P140 U42 ( .A1(n5), .A2(n4), .ZN(n6) );
  INVD2BWP30P140 U43 ( .I(n6), .ZN(n34) );
  INVD2BWP30P140 U44 ( .I(n34), .ZN(n32) );
  INVD1BWP30P140 U45 ( .I(i_data_bus[48]), .ZN(n7) );
  INVD1BWP30P140 U46 ( .I(i_data_bus[16]), .ZN(n71) );
  INVD1BWP30P140 U47 ( .I(i_data_bus[49]), .ZN(n8) );
  INVD1BWP30P140 U48 ( .I(i_data_bus[17]), .ZN(n72) );
  INVD2BWP30P140 U49 ( .I(n34), .ZN(n26) );
  INVD1BWP30P140 U50 ( .I(i_data_bus[52]), .ZN(n9) );
  INVD3BWP30P140 U51 ( .I(n1), .ZN(n44) );
  INVD1BWP30P140 U52 ( .I(i_data_bus[20]), .ZN(n89) );
  INVD1BWP30P140 U53 ( .I(i_data_bus[53]), .ZN(n10) );
  INVD1BWP30P140 U54 ( .I(i_data_bus[21]), .ZN(n87) );
  INVD1BWP30P140 U55 ( .I(i_data_bus[54]), .ZN(n11) );
  INVD1BWP30P140 U56 ( .I(i_data_bus[22]), .ZN(n86) );
  INVD1BWP30P140 U57 ( .I(i_data_bus[55]), .ZN(n12) );
  INVD1BWP30P140 U58 ( .I(i_data_bus[23]), .ZN(n85) );
  INVD1BWP30P140 U59 ( .I(i_data_bus[50]), .ZN(n13) );
  INVD1BWP30P140 U60 ( .I(i_data_bus[18]), .ZN(n73) );
  INVD1BWP30P140 U61 ( .I(i_data_bus[51]), .ZN(n14) );
  INVD1BWP30P140 U62 ( .I(i_data_bus[19]), .ZN(n75) );
  INVD1BWP30P140 U63 ( .I(i_data_bus[58]), .ZN(n15) );
  INVD1BWP30P140 U64 ( .I(i_data_bus[26]), .ZN(n82) );
  INVD1BWP30P140 U65 ( .I(i_data_bus[59]), .ZN(n16) );
  INVD1BWP30P140 U66 ( .I(i_data_bus[27]), .ZN(n81) );
  INVD1BWP30P140 U67 ( .I(i_data_bus[60]), .ZN(n17) );
  INVD1BWP30P140 U68 ( .I(i_data_bus[28]), .ZN(n80) );
  INVD1BWP30P140 U69 ( .I(i_data_bus[61]), .ZN(n18) );
  INVD1BWP30P140 U70 ( .I(i_data_bus[29]), .ZN(n79) );
  INVD1BWP30P140 U71 ( .I(i_data_bus[62]), .ZN(n19) );
  INVD1BWP30P140 U72 ( .I(i_data_bus[30]), .ZN(n78) );
  INVD1BWP30P140 U73 ( .I(i_data_bus[63]), .ZN(n20) );
  INVD1BWP30P140 U74 ( .I(i_data_bus[31]), .ZN(n77) );
  INVD1BWP30P140 U75 ( .I(i_data_bus[45]), .ZN(n21) );
  INVD1BWP30P140 U76 ( .I(i_data_bus[13]), .ZN(n68) );
  INVD1BWP30P140 U77 ( .I(i_data_bus[46]), .ZN(n22) );
  INVD1BWP30P140 U78 ( .I(i_data_bus[14]), .ZN(n69) );
  INVD1BWP30P140 U79 ( .I(i_data_bus[47]), .ZN(n23) );
  INVD1BWP30P140 U80 ( .I(i_data_bus[15]), .ZN(n70) );
  INVD1BWP30P140 U81 ( .I(i_data_bus[56]), .ZN(n24) );
  INVD1BWP30P140 U82 ( .I(i_data_bus[24]), .ZN(n84) );
  INVD1BWP30P140 U83 ( .I(i_data_bus[57]), .ZN(n25) );
  INVD1BWP30P140 U84 ( .I(i_data_bus[25]), .ZN(n83) );
  INVD1BWP30P140 U85 ( .I(i_data_bus[40]), .ZN(n27) );
  INVD1BWP30P140 U86 ( .I(i_data_bus[8]), .ZN(n63) );
  INVD1BWP30P140 U87 ( .I(i_data_bus[41]), .ZN(n28) );
  INVD1BWP30P140 U88 ( .I(i_data_bus[9]), .ZN(n64) );
  INVD1BWP30P140 U89 ( .I(i_data_bus[43]), .ZN(n29) );
  INVD1BWP30P140 U90 ( .I(i_data_bus[11]), .ZN(n66) );
  INVD1BWP30P140 U91 ( .I(i_data_bus[44]), .ZN(n30) );
  INVD1BWP30P140 U92 ( .I(i_data_bus[12]), .ZN(n67) );
  INVD1BWP30P140 U93 ( .I(i_data_bus[42]), .ZN(n31) );
  INVD1BWP30P140 U94 ( .I(i_data_bus[10]), .ZN(n65) );
  OAI31D1BWP30P140 U95 ( .A1(n49), .A2(n50), .A3(n33), .B(n2), .ZN(N353) );
  INVD1BWP30P140 U96 ( .I(i_data_bus[7]), .ZN(n61) );
  INVD1BWP30P140 U97 ( .I(i_data_bus[39]), .ZN(n35) );
  OAI22D1BWP30P140 U98 ( .A1(n2), .A2(n61), .B1(n43), .B2(n35), .ZN(N294) );
  INVD1BWP30P140 U99 ( .I(i_data_bus[6]), .ZN(n55) );
  INVD1BWP30P140 U100 ( .I(i_data_bus[38]), .ZN(n36) );
  OAI22D1BWP30P140 U101 ( .A1(n2), .A2(n55), .B1(n43), .B2(n36), .ZN(N293) );
  INVD1BWP30P140 U102 ( .I(i_data_bus[5]), .ZN(n56) );
  INVD1BWP30P140 U103 ( .I(i_data_bus[37]), .ZN(n37) );
  OAI22D1BWP30P140 U104 ( .A1(n2), .A2(n56), .B1(n43), .B2(n37), .ZN(N292) );
  INVD1BWP30P140 U105 ( .I(i_data_bus[4]), .ZN(n57) );
  INVD1BWP30P140 U106 ( .I(i_data_bus[36]), .ZN(n38) );
  OAI22D1BWP30P140 U107 ( .A1(n2), .A2(n57), .B1(n43), .B2(n38), .ZN(N291) );
  INVD1BWP30P140 U108 ( .I(i_data_bus[3]), .ZN(n58) );
  INVD1BWP30P140 U109 ( .I(i_data_bus[35]), .ZN(n39) );
  OAI22D1BWP30P140 U110 ( .A1(n2), .A2(n58), .B1(n43), .B2(n39), .ZN(N290) );
  INVD1BWP30P140 U111 ( .I(i_data_bus[2]), .ZN(n59) );
  INVD1BWP30P140 U112 ( .I(i_data_bus[34]), .ZN(n40) );
  OAI22D1BWP30P140 U113 ( .A1(n2), .A2(n59), .B1(n32), .B2(n40), .ZN(N289) );
  INVD1BWP30P140 U114 ( .I(i_data_bus[1]), .ZN(n62) );
  INVD1BWP30P140 U115 ( .I(i_data_bus[33]), .ZN(n41) );
  OAI22D1BWP30P140 U116 ( .A1(n2), .A2(n62), .B1(n26), .B2(n41), .ZN(N288) );
  INVD1BWP30P140 U117 ( .I(i_data_bus[0]), .ZN(n60) );
  INVD1BWP30P140 U118 ( .I(i_data_bus[32]), .ZN(n42) );
  OAI22D1BWP30P140 U119 ( .A1(n2), .A2(n60), .B1(n32), .B2(n42), .ZN(N287) );
  INVD1BWP30P140 U120 ( .I(n45), .ZN(n48) );
  INVD1BWP30P140 U121 ( .I(n49), .ZN(n46) );
  INVD1BWP30P140 U122 ( .I(n88), .ZN(n47) );
  OAI21D1BWP30P140 U123 ( .A1(n48), .A2(i_cmd[1]), .B(n47), .ZN(N354) );
  MUX2NUD1BWP30P140 U124 ( .I0(n51), .I1(n50), .S(i_cmd[0]), .ZN(n52) );
  ND2OPTIBD1BWP30P140 U125 ( .A1(n53), .A2(n52), .ZN(n54) );
  MOAI22D1BWP30P140 U126 ( .A1(n55), .A2(n74), .B1(i_data_bus[38]), .B2(n88), 
        .ZN(N325) );
  MOAI22D1BWP30P140 U127 ( .A1(n56), .A2(n74), .B1(i_data_bus[37]), .B2(n88), 
        .ZN(N324) );
  MOAI22D1BWP30P140 U128 ( .A1(n57), .A2(n74), .B1(i_data_bus[36]), .B2(n88), 
        .ZN(N323) );
  MOAI22D1BWP30P140 U129 ( .A1(n58), .A2(n74), .B1(i_data_bus[35]), .B2(n88), 
        .ZN(N322) );
  MOAI22D1BWP30P140 U130 ( .A1(n59), .A2(n74), .B1(i_data_bus[34]), .B2(n88), 
        .ZN(N321) );
  MOAI22D1BWP30P140 U131 ( .A1(n60), .A2(n74), .B1(i_data_bus[32]), .B2(n88), 
        .ZN(N319) );
  MOAI22D1BWP30P140 U132 ( .A1(n61), .A2(n74), .B1(i_data_bus[39]), .B2(n88), 
        .ZN(N326) );
  MOAI22D1BWP30P140 U133 ( .A1(n62), .A2(n74), .B1(i_data_bus[33]), .B2(n88), 
        .ZN(N320) );
  MOAI22D1BWP30P140 U134 ( .A1(n63), .A2(n74), .B1(i_data_bus[40]), .B2(n88), 
        .ZN(N327) );
  MOAI22D1BWP30P140 U135 ( .A1(n64), .A2(n74), .B1(i_data_bus[41]), .B2(n88), 
        .ZN(N328) );
  MOAI22D1BWP30P140 U136 ( .A1(n65), .A2(n74), .B1(i_data_bus[42]), .B2(n88), 
        .ZN(N329) );
  MOAI22D1BWP30P140 U137 ( .A1(n66), .A2(n74), .B1(i_data_bus[43]), .B2(n88), 
        .ZN(N330) );
  MOAI22D1BWP30P140 U138 ( .A1(n67), .A2(n74), .B1(i_data_bus[44]), .B2(n88), 
        .ZN(N331) );
  MOAI22D1BWP30P140 U139 ( .A1(n68), .A2(n74), .B1(i_data_bus[45]), .B2(n88), 
        .ZN(N332) );
  MOAI22D1BWP30P140 U140 ( .A1(n69), .A2(n74), .B1(i_data_bus[46]), .B2(n88), 
        .ZN(N333) );
  MOAI22D1BWP30P140 U141 ( .A1(n70), .A2(n74), .B1(i_data_bus[47]), .B2(n88), 
        .ZN(N334) );
  MOAI22D1BWP30P140 U142 ( .A1(n71), .A2(n74), .B1(i_data_bus[48]), .B2(n88), 
        .ZN(N335) );
  MOAI22D1BWP30P140 U143 ( .A1(n72), .A2(n74), .B1(i_data_bus[49]), .B2(n88), 
        .ZN(N336) );
  MOAI22D1BWP30P140 U144 ( .A1(n73), .A2(n74), .B1(i_data_bus[50]), .B2(n88), 
        .ZN(N337) );
  MOAI22D1BWP30P140 U145 ( .A1(n75), .A2(n74), .B1(i_data_bus[51]), .B2(n88), 
        .ZN(N338) );
  MOAI22D1BWP30P140 U146 ( .A1(n77), .A2(n74), .B1(i_data_bus[63]), .B2(n88), 
        .ZN(N350) );
  MOAI22D1BWP30P140 U147 ( .A1(n78), .A2(n74), .B1(i_data_bus[62]), .B2(n88), 
        .ZN(N349) );
  MOAI22D1BWP30P140 U148 ( .A1(n79), .A2(n74), .B1(i_data_bus[61]), .B2(n88), 
        .ZN(N348) );
  MOAI22D1BWP30P140 U149 ( .A1(n80), .A2(n74), .B1(i_data_bus[60]), .B2(n88), 
        .ZN(N347) );
  MOAI22D1BWP30P140 U150 ( .A1(n81), .A2(n74), .B1(i_data_bus[59]), .B2(n88), 
        .ZN(N346) );
  MOAI22D1BWP30P140 U151 ( .A1(n82), .A2(n74), .B1(i_data_bus[58]), .B2(n88), 
        .ZN(N345) );
  MOAI22D1BWP30P140 U152 ( .A1(n83), .A2(n74), .B1(i_data_bus[57]), .B2(n88), 
        .ZN(N344) );
  MOAI22D1BWP30P140 U153 ( .A1(n84), .A2(n74), .B1(i_data_bus[56]), .B2(n88), 
        .ZN(N343) );
  MOAI22D1BWP30P140 U154 ( .A1(n85), .A2(n74), .B1(i_data_bus[55]), .B2(n88), 
        .ZN(N342) );
  MOAI22D1BWP30P140 U155 ( .A1(n86), .A2(n74), .B1(i_data_bus[54]), .B2(n88), 
        .ZN(N341) );
  MOAI22D1BWP30P140 U156 ( .A1(n87), .A2(n74), .B1(i_data_bus[53]), .B2(n88), 
        .ZN(N340) );
  MOAI22D1BWP30P140 U157 ( .A1(n89), .A2(n74), .B1(i_data_bus[52]), .B2(n88), 
        .ZN(N339) );
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
         n45, n46, n47, n48, n49, n50, n51, n52, n53, n54, n55, n56, n57, n58,
         n59, n60, n61, n62, n63, n64, n65, n66, n67, n68, n69, n70, n71, n72,
         n73, n74, n75, n76, n77, n78, n79, n80, n81, n82, n83, n84, n85, n86,
         n87, n88, n89, n90, n91, n92, n93, n94, n95;

  DFQD1BWP30P140 o_data_bus_inner_reg_63_ ( .D(N350), .CP(clk), .Q(
        o_data_bus[63]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_62_ ( .D(N349), .CP(clk), .Q(
        o_data_bus[62]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_61_ ( .D(N348), .CP(clk), .Q(
        o_data_bus[61]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_60_ ( .D(N347), .CP(clk), .Q(
        o_data_bus[60]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_59_ ( .D(N346), .CP(clk), .Q(
        o_data_bus[59]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_58_ ( .D(N345), .CP(clk), .Q(
        o_data_bus[58]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_57_ ( .D(N344), .CP(clk), .Q(
        o_data_bus[57]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_56_ ( .D(N343), .CP(clk), .Q(
        o_data_bus[56]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_55_ ( .D(N342), .CP(clk), .Q(
        o_data_bus[55]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_54_ ( .D(N341), .CP(clk), .Q(
        o_data_bus[54]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_53_ ( .D(N340), .CP(clk), .Q(
        o_data_bus[53]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_52_ ( .D(N339), .CP(clk), .Q(
        o_data_bus[52]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_51_ ( .D(N338), .CP(clk), .Q(
        o_data_bus[51]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_50_ ( .D(N337), .CP(clk), .Q(
        o_data_bus[50]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_49_ ( .D(N336), .CP(clk), .Q(
        o_data_bus[49]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_48_ ( .D(N335), .CP(clk), .Q(
        o_data_bus[48]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_47_ ( .D(N334), .CP(clk), .Q(
        o_data_bus[47]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_46_ ( .D(N333), .CP(clk), .Q(
        o_data_bus[46]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_45_ ( .D(N332), .CP(clk), .Q(
        o_data_bus[45]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_44_ ( .D(N331), .CP(clk), .Q(
        o_data_bus[44]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_43_ ( .D(N330), .CP(clk), .Q(
        o_data_bus[43]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_42_ ( .D(N329), .CP(clk), .Q(
        o_data_bus[42]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_41_ ( .D(N328), .CP(clk), .Q(
        o_data_bus[41]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_40_ ( .D(N327), .CP(clk), .Q(
        o_data_bus[40]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_39_ ( .D(N326), .CP(clk), .Q(
        o_data_bus[39]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_38_ ( .D(N325), .CP(clk), .Q(
        o_data_bus[38]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_37_ ( .D(N324), .CP(clk), .Q(
        o_data_bus[37]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_36_ ( .D(N323), .CP(clk), .Q(
        o_data_bus[36]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_35_ ( .D(N322), .CP(clk), .Q(
        o_data_bus[35]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_34_ ( .D(N321), .CP(clk), .Q(
        o_data_bus[34]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_33_ ( .D(N320), .CP(clk), .Q(
        o_data_bus[33]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_32_ ( .D(N319), .CP(clk), .Q(
        o_data_bus[32]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_19_ ( .D(N306), .CP(clk), .Q(
        o_data_bus[19]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_7_ ( .D(N294), .CP(clk), .Q(
        o_data_bus[7]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_6_ ( .D(N293), .CP(clk), .Q(
        o_data_bus[6]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_5_ ( .D(N292), .CP(clk), .Q(
        o_data_bus[5]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_4_ ( .D(N291), .CP(clk), .Q(
        o_data_bus[4]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_3_ ( .D(N290), .CP(clk), .Q(
        o_data_bus[3]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_2_ ( .D(N289), .CP(clk), .Q(
        o_data_bus[2]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_1_ ( .D(N288), .CP(clk), .Q(
        o_data_bus[1]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_0_ ( .D(N287), .CP(clk), .Q(
        o_data_bus[0]) );
  DFQD2BWP30P140 o_valid_inner_reg_0_ ( .D(N353), .CP(clk), .Q(o_valid[0]) );
  DFD1BWP30P140 o_data_bus_inner_reg_20_ ( .D(N307), .CP(clk), .Q(
        o_data_bus[20]) );
  DFD1BWP30P140 o_data_bus_inner_reg_21_ ( .D(N308), .CP(clk), .Q(
        o_data_bus[21]) );
  DFD1BWP30P140 o_data_bus_inner_reg_22_ ( .D(N309), .CP(clk), .Q(
        o_data_bus[22]) );
  DFD1BWP30P140 o_data_bus_inner_reg_23_ ( .D(N310), .CP(clk), .Q(
        o_data_bus[23]) );
  DFD1BWP30P140 o_data_bus_inner_reg_24_ ( .D(N311), .CP(clk), .Q(
        o_data_bus[24]) );
  DFD1BWP30P140 o_data_bus_inner_reg_25_ ( .D(N312), .CP(clk), .Q(
        o_data_bus[25]) );
  DFD1BWP30P140 o_data_bus_inner_reg_26_ ( .D(N313), .CP(clk), .Q(
        o_data_bus[26]) );
  DFD1BWP30P140 o_data_bus_inner_reg_27_ ( .D(N314), .CP(clk), .Q(
        o_data_bus[27]) );
  DFD1BWP30P140 o_data_bus_inner_reg_28_ ( .D(N315), .CP(clk), .Q(
        o_data_bus[28]) );
  DFD1BWP30P140 o_data_bus_inner_reg_29_ ( .D(N316), .CP(clk), .Q(
        o_data_bus[29]) );
  DFD1BWP30P140 o_data_bus_inner_reg_30_ ( .D(N317), .CP(clk), .Q(
        o_data_bus[30]) );
  DFD1BWP30P140 o_data_bus_inner_reg_31_ ( .D(N318), .CP(clk), .Q(
        o_data_bus[31]) );
  DFD1BWP30P140 o_data_bus_inner_reg_13_ ( .D(N300), .CP(clk), .Q(
        o_data_bus[13]) );
  DFQD2BWP30P140 o_valid_inner_reg_1_ ( .D(N354), .CP(clk), .Q(o_valid[1]) );
  DFD1BWP30P140 o_data_bus_inner_reg_18_ ( .D(N305), .CP(clk), .Q(
        o_data_bus[18]) );
  DFD1BWP30P140 o_data_bus_inner_reg_17_ ( .D(N304), .CP(clk), .Q(
        o_data_bus[17]) );
  DFD1BWP30P140 o_data_bus_inner_reg_15_ ( .D(N302), .CP(clk), .Q(
        o_data_bus[15]) );
  DFD1BWP30P140 o_data_bus_inner_reg_16_ ( .D(N303), .CP(clk), .Q(
        o_data_bus[16]) );
  DFD1BWP30P140 o_data_bus_inner_reg_14_ ( .D(N301), .CP(clk), .Q(
        o_data_bus[14]) );
  DFD1BWP30P140 o_data_bus_inner_reg_8_ ( .D(N295), .CP(clk), .Q(o_data_bus[8]) );
  DFD1BWP30P140 o_data_bus_inner_reg_9_ ( .D(N296), .CP(clk), .Q(o_data_bus[9]) );
  DFD1BWP30P140 o_data_bus_inner_reg_10_ ( .D(N297), .CP(clk), .Q(
        o_data_bus[10]) );
  DFD1BWP30P140 o_data_bus_inner_reg_11_ ( .D(N298), .CP(clk), .Q(
        o_data_bus[11]) );
  DFD1BWP30P140 o_data_bus_inner_reg_12_ ( .D(N299), .CP(clk), .Q(
        o_data_bus[12]) );
  INVD3BWP30P140 U3 ( .I(n94), .ZN(n65) );
  NR2D1BWP30P140 U4 ( .A1(n42), .A2(n37), .ZN(n6) );
  INVD1BWP30P140 U5 ( .I(i_valid[1]), .ZN(n45) );
  INVD2BWP30P140 U6 ( .I(n50), .ZN(n59) );
  INVD4BWP30P140 U7 ( .I(n65), .ZN(n1) );
  INVD2BWP30P140 U8 ( .I(n93), .ZN(n2) );
  ND2OPTIBD1BWP30P140 U9 ( .A1(n45), .A2(i_cmd[0]), .ZN(n46) );
  INVD1BWP30P140 U10 ( .I(i_valid[0]), .ZN(n4) );
  INVD2BWP30P140 U11 ( .I(i_cmd[0]), .ZN(n37) );
  ND2D1BWP30P140 U12 ( .A1(n3), .A2(i_en), .ZN(n42) );
  INVD2BWP30P140 U13 ( .I(n22), .ZN(n36) );
  INR2D4BWP30P140 U14 ( .A1(i_valid[1]), .B1(n40), .ZN(n93) );
  ND2D1BWP30P140 U15 ( .A1(n49), .A2(n48), .ZN(N325) );
  ND2D1BWP30P140 U16 ( .A1(n65), .A2(i_data_bus[6]), .ZN(n49) );
  ND2D1BWP30P140 U17 ( .A1(n93), .A2(i_data_bus[38]), .ZN(n48) );
  INVD1BWP30P140 U18 ( .I(rst), .ZN(n3) );
  MUX2NUD1BWP30P140 U19 ( .I0(n4), .I1(n45), .S(i_cmd[1]), .ZN(n5) );
  ND2OPTIBD1BWP30P140 U20 ( .A1(n6), .A2(n5), .ZN(n7) );
  INVD2BWP30P140 U21 ( .I(n7), .ZN(n50) );
  INVD2BWP30P140 U22 ( .I(n50), .ZN(n21) );
  INVD1BWP30P140 U23 ( .I(i_data_bus[45]), .ZN(n9) );
  INR2D2BWP30P140 U24 ( .A1(i_valid[0]), .B1(n42), .ZN(n38) );
  CKND2D2BWP30P140 U25 ( .A1(n38), .A2(n37), .ZN(n8) );
  INVD2BWP30P140 U26 ( .I(n8), .ZN(n22) );
  MOAI22D1BWP30P140 U27 ( .A1(n21), .A2(n9), .B1(n22), .B2(i_data_bus[13]), 
        .ZN(N300) );
  INVD1BWP30P140 U28 ( .I(i_data_bus[51]), .ZN(n10) );
  MOAI22D1BWP30P140 U29 ( .A1(n21), .A2(n10), .B1(n22), .B2(i_data_bus[19]), 
        .ZN(N306) );
  INVD1BWP30P140 U30 ( .I(i_data_bus[50]), .ZN(n11) );
  INVD3BWP30P140 U31 ( .I(n22), .ZN(n60) );
  INVD1BWP30P140 U32 ( .I(i_data_bus[18]), .ZN(n70) );
  OAI22D1BWP30P140 U33 ( .A1(n21), .A2(n11), .B1(n60), .B2(n70), .ZN(N305) );
  INVD1BWP30P140 U34 ( .I(i_data_bus[49]), .ZN(n12) );
  INVD1BWP30P140 U35 ( .I(i_data_bus[17]), .ZN(n72) );
  OAI22D1BWP30P140 U36 ( .A1(n21), .A2(n12), .B1(n60), .B2(n72), .ZN(N304) );
  INVD1BWP30P140 U37 ( .I(i_data_bus[48]), .ZN(n13) );
  INVD1BWP30P140 U38 ( .I(i_data_bus[16]), .ZN(n80) );
  OAI22D1BWP30P140 U39 ( .A1(n21), .A2(n13), .B1(n60), .B2(n80), .ZN(N303) );
  INVD1BWP30P140 U40 ( .I(i_data_bus[47]), .ZN(n14) );
  INVD1BWP30P140 U41 ( .I(i_data_bus[15]), .ZN(n83) );
  OAI22D1BWP30P140 U42 ( .A1(n21), .A2(n14), .B1(n60), .B2(n83), .ZN(N302) );
  INVD1BWP30P140 U43 ( .I(i_data_bus[46]), .ZN(n15) );
  INVD1BWP30P140 U44 ( .I(i_data_bus[14]), .ZN(n82) );
  OAI22D1BWP30P140 U45 ( .A1(n21), .A2(n15), .B1(n60), .B2(n82), .ZN(N301) );
  INVD1BWP30P140 U46 ( .I(i_data_bus[44]), .ZN(n16) );
  INVD1BWP30P140 U47 ( .I(i_data_bus[12]), .ZN(n66) );
  OAI22D1BWP30P140 U48 ( .A1(n21), .A2(n16), .B1(n60), .B2(n66), .ZN(N299) );
  INVD1BWP30P140 U49 ( .I(i_data_bus[43]), .ZN(n17) );
  INVD1BWP30P140 U50 ( .I(i_data_bus[11]), .ZN(n84) );
  OAI22D1BWP30P140 U51 ( .A1(n21), .A2(n17), .B1(n60), .B2(n84), .ZN(N298) );
  INVD1BWP30P140 U52 ( .I(i_data_bus[42]), .ZN(n18) );
  INVD1BWP30P140 U53 ( .I(i_data_bus[10]), .ZN(n68) );
  OAI22D1BWP30P140 U54 ( .A1(n21), .A2(n18), .B1(n60), .B2(n68), .ZN(N297) );
  INVD1BWP30P140 U55 ( .I(i_data_bus[41]), .ZN(n19) );
  INVD1BWP30P140 U56 ( .I(i_data_bus[9]), .ZN(n85) );
  OAI22D1BWP30P140 U57 ( .A1(n21), .A2(n19), .B1(n60), .B2(n85), .ZN(N296) );
  INVD1BWP30P140 U58 ( .I(i_data_bus[40]), .ZN(n20) );
  INVD1BWP30P140 U59 ( .I(i_data_bus[8]), .ZN(n86) );
  OAI22D1BWP30P140 U60 ( .A1(n21), .A2(n20), .B1(n60), .B2(n86), .ZN(N295) );
  INVD2BWP30P140 U61 ( .I(n50), .ZN(n35) );
  INVD1BWP30P140 U62 ( .I(i_data_bus[55]), .ZN(n23) );
  INVD1BWP30P140 U63 ( .I(i_data_bus[23]), .ZN(n69) );
  OAI22D1BWP30P140 U64 ( .A1(n35), .A2(n23), .B1(n36), .B2(n69), .ZN(N310) );
  INVD1BWP30P140 U65 ( .I(i_data_bus[54]), .ZN(n24) );
  INVD1BWP30P140 U66 ( .I(i_data_bus[22]), .ZN(n77) );
  OAI22D1BWP30P140 U67 ( .A1(n35), .A2(n24), .B1(n36), .B2(n77), .ZN(N309) );
  INVD1BWP30P140 U68 ( .I(i_data_bus[53]), .ZN(n25) );
  INVD1BWP30P140 U69 ( .I(i_data_bus[21]), .ZN(n67) );
  OAI22D1BWP30P140 U70 ( .A1(n35), .A2(n25), .B1(n36), .B2(n67), .ZN(N308) );
  INVD1BWP30P140 U71 ( .I(i_data_bus[52]), .ZN(n26) );
  INVD1BWP30P140 U72 ( .I(i_data_bus[20]), .ZN(n87) );
  OAI22D1BWP30P140 U73 ( .A1(n35), .A2(n26), .B1(n36), .B2(n87), .ZN(N307) );
  INVD1BWP30P140 U74 ( .I(i_data_bus[56]), .ZN(n27) );
  INVD1BWP30P140 U75 ( .I(i_data_bus[24]), .ZN(n73) );
  OAI22D1BWP30P140 U76 ( .A1(n35), .A2(n27), .B1(n36), .B2(n73), .ZN(N311) );
  INVD1BWP30P140 U77 ( .I(i_data_bus[57]), .ZN(n28) );
  INVD1BWP30P140 U78 ( .I(i_data_bus[25]), .ZN(n61) );
  OAI22D1BWP30P140 U79 ( .A1(n35), .A2(n28), .B1(n36), .B2(n61), .ZN(N312) );
  INVD1BWP30P140 U80 ( .I(i_data_bus[58]), .ZN(n29) );
  INVD1BWP30P140 U81 ( .I(i_data_bus[26]), .ZN(n74) );
  OAI22D1BWP30P140 U82 ( .A1(n35), .A2(n29), .B1(n36), .B2(n74), .ZN(N313) );
  INVD1BWP30P140 U83 ( .I(i_data_bus[59]), .ZN(n30) );
  INVD1BWP30P140 U84 ( .I(i_data_bus[27]), .ZN(n75) );
  OAI22D1BWP30P140 U85 ( .A1(n35), .A2(n30), .B1(n36), .B2(n75), .ZN(N314) );
  INVD1BWP30P140 U86 ( .I(i_data_bus[60]), .ZN(n31) );
  INVD1BWP30P140 U87 ( .I(i_data_bus[28]), .ZN(n76) );
  OAI22D1BWP30P140 U88 ( .A1(n35), .A2(n31), .B1(n36), .B2(n76), .ZN(N315) );
  INVD1BWP30P140 U89 ( .I(i_data_bus[61]), .ZN(n32) );
  INVD1BWP30P140 U90 ( .I(i_data_bus[29]), .ZN(n62) );
  OAI22D1BWP30P140 U91 ( .A1(n35), .A2(n32), .B1(n36), .B2(n62), .ZN(N316) );
  INVD1BWP30P140 U92 ( .I(i_data_bus[62]), .ZN(n33) );
  INVD1BWP30P140 U93 ( .I(i_data_bus[30]), .ZN(n78) );
  OAI22D1BWP30P140 U94 ( .A1(n35), .A2(n33), .B1(n36), .B2(n78), .ZN(N317) );
  INVD1BWP30P140 U95 ( .I(i_data_bus[63]), .ZN(n34) );
  INVD1BWP30P140 U96 ( .I(i_data_bus[31]), .ZN(n79) );
  OAI22D1BWP30P140 U97 ( .A1(n35), .A2(n34), .B1(n36), .B2(n79), .ZN(N318) );
  OAI31D1BWP30P140 U98 ( .A1(n42), .A2(n45), .A3(n37), .B(n36), .ZN(N353) );
  INVD1BWP30P140 U99 ( .I(n38), .ZN(n41) );
  INVD1BWP30P140 U100 ( .I(n42), .ZN(n39) );
  ND2OPTIBD1BWP30P140 U101 ( .A1(i_cmd[1]), .A2(n39), .ZN(n40) );
  OAI21D1BWP30P140 U102 ( .A1(n41), .A2(i_cmd[1]), .B(n2), .ZN(N354) );
  NR2OPTPAD1BWP30P140 U103 ( .A1(n42), .A2(i_cmd[1]), .ZN(n43) );
  INVD1P5BWP30P140 U104 ( .I(n43), .ZN(n44) );
  IAO21D2BWP30P140 U105 ( .A1(i_cmd[0]), .A2(i_valid[0]), .B(n44), .ZN(n47) );
  CKND2D4BWP30P140 U106 ( .A1(n47), .A2(n46), .ZN(n94) );
  INVD1BWP30P140 U107 ( .I(i_data_bus[0]), .ZN(n88) );
  INVD1BWP30P140 U108 ( .I(i_data_bus[32]), .ZN(n51) );
  OAI22D1BWP30P140 U109 ( .A1(n60), .A2(n88), .B1(n59), .B2(n51), .ZN(N287) );
  INVD1BWP30P140 U110 ( .I(i_data_bus[4]), .ZN(n92) );
  INVD1BWP30P140 U111 ( .I(i_data_bus[36]), .ZN(n52) );
  OAI22D1BWP30P140 U112 ( .A1(n60), .A2(n92), .B1(n59), .B2(n52), .ZN(N291) );
  INVD1BWP30P140 U113 ( .I(i_data_bus[1]), .ZN(n89) );
  INVD1BWP30P140 U114 ( .I(i_data_bus[33]), .ZN(n53) );
  OAI22D1BWP30P140 U115 ( .A1(n60), .A2(n89), .B1(n59), .B2(n53), .ZN(N288) );
  INVD1BWP30P140 U116 ( .I(i_data_bus[2]), .ZN(n90) );
  INVD1BWP30P140 U117 ( .I(i_data_bus[34]), .ZN(n54) );
  OAI22D1BWP30P140 U118 ( .A1(n60), .A2(n90), .B1(n59), .B2(n54), .ZN(N289) );
  INVD1BWP30P140 U119 ( .I(i_data_bus[3]), .ZN(n91) );
  INVD1BWP30P140 U120 ( .I(i_data_bus[35]), .ZN(n55) );
  OAI22D1BWP30P140 U121 ( .A1(n60), .A2(n91), .B1(n59), .B2(n55), .ZN(N290) );
  INVD1BWP30P140 U122 ( .I(i_data_bus[5]), .ZN(n95) );
  INVD1BWP30P140 U123 ( .I(i_data_bus[37]), .ZN(n56) );
  OAI22D1BWP30P140 U124 ( .A1(n60), .A2(n95), .B1(n59), .B2(n56), .ZN(N292) );
  INVD1BWP30P140 U125 ( .I(i_data_bus[6]), .ZN(n58) );
  INVD1BWP30P140 U126 ( .I(i_data_bus[38]), .ZN(n57) );
  OAI22D1BWP30P140 U127 ( .A1(n60), .A2(n58), .B1(n59), .B2(n57), .ZN(N293) );
  INVD1BWP30P140 U128 ( .I(i_data_bus[7]), .ZN(n64) );
  INVD1BWP30P140 U129 ( .I(i_data_bus[39]), .ZN(n63) );
  OAI22D1BWP30P140 U130 ( .A1(n60), .A2(n64), .B1(n59), .B2(n63), .ZN(N294) );
  MOAI22D1BWP30P140 U131 ( .A1(n61), .A2(n1), .B1(i_data_bus[57]), .B2(n93), 
        .ZN(N344) );
  MOAI22D1BWP30P140 U132 ( .A1(n62), .A2(n1), .B1(i_data_bus[61]), .B2(n93), 
        .ZN(N348) );
  OAI22D1BWP30P140 U133 ( .A1(n94), .A2(n64), .B1(n2), .B2(n63), .ZN(N326) );
  MOAI22D1BWP30P140 U134 ( .A1(n66), .A2(n1), .B1(i_data_bus[44]), .B2(n93), 
        .ZN(N331) );
  MOAI22D1BWP30P140 U135 ( .A1(n67), .A2(n1), .B1(i_data_bus[53]), .B2(n93), 
        .ZN(N340) );
  MOAI22D1BWP30P140 U136 ( .A1(n68), .A2(n1), .B1(i_data_bus[42]), .B2(n93), 
        .ZN(N329) );
  MOAI22D1BWP30P140 U137 ( .A1(n69), .A2(n1), .B1(i_data_bus[55]), .B2(n93), 
        .ZN(N342) );
  MOAI22D1BWP30P140 U138 ( .A1(n70), .A2(n1), .B1(i_data_bus[50]), .B2(n93), 
        .ZN(N337) );
  INVD1BWP30P140 U139 ( .I(i_data_bus[19]), .ZN(n71) );
  MOAI22D1BWP30P140 U140 ( .A1(n71), .A2(n1), .B1(i_data_bus[51]), .B2(n93), 
        .ZN(N338) );
  MOAI22D1BWP30P140 U141 ( .A1(n72), .A2(n1), .B1(i_data_bus[49]), .B2(n93), 
        .ZN(N336) );
  MOAI22D1BWP30P140 U142 ( .A1(n73), .A2(n1), .B1(i_data_bus[56]), .B2(n93), 
        .ZN(N343) );
  MOAI22D1BWP30P140 U143 ( .A1(n74), .A2(n1), .B1(i_data_bus[58]), .B2(n93), 
        .ZN(N345) );
  MOAI22D1BWP30P140 U144 ( .A1(n75), .A2(n1), .B1(i_data_bus[59]), .B2(n93), 
        .ZN(N346) );
  MOAI22D1BWP30P140 U145 ( .A1(n76), .A2(n1), .B1(i_data_bus[60]), .B2(n93), 
        .ZN(N347) );
  MOAI22D1BWP30P140 U146 ( .A1(n77), .A2(n1), .B1(i_data_bus[54]), .B2(n93), 
        .ZN(N341) );
  MOAI22D1BWP30P140 U147 ( .A1(n78), .A2(n1), .B1(i_data_bus[62]), .B2(n93), 
        .ZN(N349) );
  MOAI22D1BWP30P140 U148 ( .A1(n79), .A2(n1), .B1(i_data_bus[63]), .B2(n93), 
        .ZN(N350) );
  MOAI22D1BWP30P140 U149 ( .A1(n80), .A2(n1), .B1(i_data_bus[48]), .B2(n93), 
        .ZN(N335) );
  INVD1BWP30P140 U150 ( .I(i_data_bus[13]), .ZN(n81) );
  MOAI22D1BWP30P140 U151 ( .A1(n81), .A2(n1), .B1(i_data_bus[45]), .B2(n93), 
        .ZN(N332) );
  MOAI22D1BWP30P140 U152 ( .A1(n82), .A2(n1), .B1(i_data_bus[46]), .B2(n93), 
        .ZN(N333) );
  MOAI22D1BWP30P140 U153 ( .A1(n83), .A2(n1), .B1(i_data_bus[47]), .B2(n93), 
        .ZN(N334) );
  MOAI22D1BWP30P140 U154 ( .A1(n84), .A2(n1), .B1(i_data_bus[43]), .B2(n93), 
        .ZN(N330) );
  MOAI22D1BWP30P140 U155 ( .A1(n85), .A2(n1), .B1(i_data_bus[41]), .B2(n93), 
        .ZN(N328) );
  MOAI22D1BWP30P140 U156 ( .A1(n86), .A2(n1), .B1(i_data_bus[40]), .B2(n93), 
        .ZN(N327) );
  MOAI22D1BWP30P140 U157 ( .A1(n87), .A2(n1), .B1(i_data_bus[52]), .B2(n93), 
        .ZN(N339) );
  MOAI22D1BWP30P140 U158 ( .A1(n88), .A2(n94), .B1(i_data_bus[32]), .B2(n93), 
        .ZN(N319) );
  MOAI22D1BWP30P140 U159 ( .A1(n89), .A2(n94), .B1(i_data_bus[33]), .B2(n93), 
        .ZN(N320) );
  MOAI22D1BWP30P140 U160 ( .A1(n90), .A2(n94), .B1(i_data_bus[34]), .B2(n93), 
        .ZN(N321) );
  MOAI22D1BWP30P140 U161 ( .A1(n91), .A2(n94), .B1(i_data_bus[35]), .B2(n93), 
        .ZN(N322) );
  MOAI22D1BWP30P140 U162 ( .A1(n92), .A2(n94), .B1(i_data_bus[36]), .B2(n93), 
        .ZN(N323) );
  MOAI22D1BWP30P140 U163 ( .A1(n95), .A2(n94), .B1(i_data_bus[37]), .B2(n93), 
        .ZN(N324) );
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
         n45, n46, n47, n48, n49, n50, n51, n52, n53, n54, n55, n56, n57, n58,
         n59, n60, n61, n62, n63, n64, n65, n66, n67, n68, n69, n70, n71, n72,
         n73, n74, n75, n76, n77, n78, n79, n80, n81, n82, n83, n84, n85, n86,
         n87, n88, n89, n90, n91, n92, n93, n94, n95;

  DFQD1BWP30P140 o_data_bus_inner_reg_63_ ( .D(N350), .CP(clk), .Q(
        o_data_bus[63]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_62_ ( .D(N349), .CP(clk), .Q(
        o_data_bus[62]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_61_ ( .D(N348), .CP(clk), .Q(
        o_data_bus[61]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_60_ ( .D(N347), .CP(clk), .Q(
        o_data_bus[60]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_59_ ( .D(N346), .CP(clk), .Q(
        o_data_bus[59]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_58_ ( .D(N345), .CP(clk), .Q(
        o_data_bus[58]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_57_ ( .D(N344), .CP(clk), .Q(
        o_data_bus[57]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_56_ ( .D(N343), .CP(clk), .Q(
        o_data_bus[56]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_55_ ( .D(N342), .CP(clk), .Q(
        o_data_bus[55]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_54_ ( .D(N341), .CP(clk), .Q(
        o_data_bus[54]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_53_ ( .D(N340), .CP(clk), .Q(
        o_data_bus[53]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_52_ ( .D(N339), .CP(clk), .Q(
        o_data_bus[52]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_51_ ( .D(N338), .CP(clk), .Q(
        o_data_bus[51]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_50_ ( .D(N337), .CP(clk), .Q(
        o_data_bus[50]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_49_ ( .D(N336), .CP(clk), .Q(
        o_data_bus[49]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_48_ ( .D(N335), .CP(clk), .Q(
        o_data_bus[48]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_47_ ( .D(N334), .CP(clk), .Q(
        o_data_bus[47]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_46_ ( .D(N333), .CP(clk), .Q(
        o_data_bus[46]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_45_ ( .D(N332), .CP(clk), .Q(
        o_data_bus[45]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_44_ ( .D(N331), .CP(clk), .Q(
        o_data_bus[44]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_43_ ( .D(N330), .CP(clk), .Q(
        o_data_bus[43]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_42_ ( .D(N329), .CP(clk), .Q(
        o_data_bus[42]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_41_ ( .D(N328), .CP(clk), .Q(
        o_data_bus[41]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_40_ ( .D(N327), .CP(clk), .Q(
        o_data_bus[40]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_39_ ( .D(N326), .CP(clk), .Q(
        o_data_bus[39]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_38_ ( .D(N325), .CP(clk), .Q(
        o_data_bus[38]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_37_ ( .D(N324), .CP(clk), .Q(
        o_data_bus[37]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_36_ ( .D(N323), .CP(clk), .Q(
        o_data_bus[36]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_35_ ( .D(N322), .CP(clk), .Q(
        o_data_bus[35]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_34_ ( .D(N321), .CP(clk), .Q(
        o_data_bus[34]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_33_ ( .D(N320), .CP(clk), .Q(
        o_data_bus[33]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_32_ ( .D(N319), .CP(clk), .Q(
        o_data_bus[32]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_19_ ( .D(N306), .CP(clk), .Q(
        o_data_bus[19]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_7_ ( .D(N294), .CP(clk), .Q(
        o_data_bus[7]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_6_ ( .D(N293), .CP(clk), .Q(
        o_data_bus[6]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_5_ ( .D(N292), .CP(clk), .Q(
        o_data_bus[5]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_4_ ( .D(N291), .CP(clk), .Q(
        o_data_bus[4]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_3_ ( .D(N290), .CP(clk), .Q(
        o_data_bus[3]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_2_ ( .D(N289), .CP(clk), .Q(
        o_data_bus[2]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_1_ ( .D(N288), .CP(clk), .Q(
        o_data_bus[1]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_0_ ( .D(N287), .CP(clk), .Q(
        o_data_bus[0]) );
  DFQD1BWP30P140 o_valid_inner_reg_1_ ( .D(N354), .CP(clk), .Q(o_valid[1]) );
  DFQD1BWP30P140 o_valid_inner_reg_0_ ( .D(N353), .CP(clk), .Q(o_valid[0]) );
  DFD1BWP30P140 o_data_bus_inner_reg_20_ ( .D(N307), .CP(clk), .Q(
        o_data_bus[20]) );
  DFD1BWP30P140 o_data_bus_inner_reg_26_ ( .D(N313), .CP(clk), .Q(
        o_data_bus[26]) );
  DFD1BWP30P140 o_data_bus_inner_reg_27_ ( .D(N314), .CP(clk), .Q(
        o_data_bus[27]) );
  DFD1BWP30P140 o_data_bus_inner_reg_28_ ( .D(N315), .CP(clk), .Q(
        o_data_bus[28]) );
  DFD1BWP30P140 o_data_bus_inner_reg_18_ ( .D(N305), .CP(clk), .Q(
        o_data_bus[18]) );
  DFD1BWP30P140 o_data_bus_inner_reg_17_ ( .D(N304), .CP(clk), .Q(
        o_data_bus[17]) );
  DFD1BWP30P140 o_data_bus_inner_reg_16_ ( .D(N303), .CP(clk), .Q(
        o_data_bus[16]) );
  DFD1BWP30P140 o_data_bus_inner_reg_14_ ( .D(N301), .CP(clk), .Q(
        o_data_bus[14]) );
  DFD1BWP30P140 o_data_bus_inner_reg_15_ ( .D(N302), .CP(clk), .Q(
        o_data_bus[15]) );
  DFD1BWP30P140 o_data_bus_inner_reg_8_ ( .D(N295), .CP(clk), .Q(o_data_bus[8]) );
  DFD1BWP30P140 o_data_bus_inner_reg_13_ ( .D(N300), .CP(clk), .Q(
        o_data_bus[13]) );
  DFD1BWP30P140 o_data_bus_inner_reg_11_ ( .D(N298), .CP(clk), .Q(
        o_data_bus[11]) );
  DFD1BWP30P140 o_data_bus_inner_reg_12_ ( .D(N299), .CP(clk), .Q(
        o_data_bus[12]) );
  DFD1BWP30P140 o_data_bus_inner_reg_9_ ( .D(N296), .CP(clk), .Q(o_data_bus[9]) );
  DFD1BWP30P140 o_data_bus_inner_reg_10_ ( .D(N297), .CP(clk), .Q(
        o_data_bus[10]) );
  DFD1BWP30P140 o_data_bus_inner_reg_30_ ( .D(N317), .CP(clk), .Q(
        o_data_bus[30]) );
  DFD1BWP30P140 o_data_bus_inner_reg_31_ ( .D(N318), .CP(clk), .Q(
        o_data_bus[31]) );
  DFD1BWP30P140 o_data_bus_inner_reg_29_ ( .D(N316), .CP(clk), .Q(
        o_data_bus[29]) );
  DFD1BWP30P140 o_data_bus_inner_reg_21_ ( .D(N308), .CP(clk), .Q(
        o_data_bus[21]) );
  DFD1BWP30P140 o_data_bus_inner_reg_22_ ( .D(N309), .CP(clk), .Q(
        o_data_bus[22]) );
  DFD1BWP30P140 o_data_bus_inner_reg_24_ ( .D(N311), .CP(clk), .Q(
        o_data_bus[24]) );
  DFD1BWP30P140 o_data_bus_inner_reg_23_ ( .D(N310), .CP(clk), .Q(
        o_data_bus[23]) );
  DFD1BWP30P140 o_data_bus_inner_reg_25_ ( .D(N312), .CP(clk), .Q(
        o_data_bus[25]) );
  INVD3BWP30P140 U3 ( .I(n94), .ZN(n75) );
  NR2D1BWP30P140 U4 ( .A1(n42), .A2(n37), .ZN(n6) );
  INVD1BWP30P140 U5 ( .I(i_valid[1]), .ZN(n45) );
  INVD2BWP30P140 U6 ( .I(n50), .ZN(n59) );
  INVD4BWP30P140 U7 ( .I(n75), .ZN(n1) );
  INVD2BWP30P140 U8 ( .I(n93), .ZN(n2) );
  ND2OPTIBD1BWP30P140 U9 ( .A1(n45), .A2(i_cmd[0]), .ZN(n46) );
  INVD1BWP30P140 U10 ( .I(i_valid[0]), .ZN(n4) );
  INVD2BWP30P140 U11 ( .I(i_cmd[0]), .ZN(n37) );
  ND2D1BWP30P140 U12 ( .A1(n3), .A2(i_en), .ZN(n42) );
  INVD2BWP30P140 U13 ( .I(n22), .ZN(n36) );
  INR2D4BWP30P140 U14 ( .A1(i_valid[1]), .B1(n40), .ZN(n93) );
  ND2D1BWP30P140 U15 ( .A1(n49), .A2(n48), .ZN(N325) );
  ND2D1BWP30P140 U16 ( .A1(n75), .A2(i_data_bus[6]), .ZN(n49) );
  ND2D1BWP30P140 U17 ( .A1(n93), .A2(i_data_bus[38]), .ZN(n48) );
  INVD1BWP30P140 U18 ( .I(rst), .ZN(n3) );
  MUX2NUD1BWP30P140 U19 ( .I0(n4), .I1(n45), .S(i_cmd[1]), .ZN(n5) );
  ND2OPTIBD1BWP30P140 U20 ( .A1(n6), .A2(n5), .ZN(n7) );
  INVD2BWP30P140 U21 ( .I(n7), .ZN(n50) );
  INVD2BWP30P140 U22 ( .I(n50), .ZN(n21) );
  INVD1BWP30P140 U23 ( .I(i_data_bus[50]), .ZN(n9) );
  INR2D2BWP30P140 U24 ( .A1(i_valid[0]), .B1(n42), .ZN(n38) );
  CKND2D2BWP30P140 U25 ( .A1(n38), .A2(n37), .ZN(n8) );
  INVD2BWP30P140 U26 ( .I(n8), .ZN(n22) );
  MOAI22D1BWP30P140 U27 ( .A1(n21), .A2(n9), .B1(n22), .B2(i_data_bus[18]), 
        .ZN(N305) );
  INVD1BWP30P140 U28 ( .I(i_data_bus[51]), .ZN(n10) );
  MOAI22D1BWP30P140 U29 ( .A1(n21), .A2(n10), .B1(n22), .B2(i_data_bus[19]), 
        .ZN(N306) );
  INVD1BWP30P140 U30 ( .I(i_data_bus[45]), .ZN(n11) );
  INVD3BWP30P140 U31 ( .I(n22), .ZN(n60) );
  INVD1BWP30P140 U32 ( .I(i_data_bus[13]), .ZN(n82) );
  OAI22D1BWP30P140 U33 ( .A1(n21), .A2(n11), .B1(n60), .B2(n82), .ZN(N300) );
  INVD1BWP30P140 U34 ( .I(i_data_bus[44]), .ZN(n12) );
  INVD1BWP30P140 U35 ( .I(i_data_bus[12]), .ZN(n83) );
  OAI22D1BWP30P140 U36 ( .A1(n21), .A2(n12), .B1(n60), .B2(n83), .ZN(N299) );
  INVD1BWP30P140 U37 ( .I(i_data_bus[43]), .ZN(n13) );
  INVD1BWP30P140 U38 ( .I(i_data_bus[11]), .ZN(n84) );
  OAI22D1BWP30P140 U39 ( .A1(n21), .A2(n13), .B1(n60), .B2(n84), .ZN(N298) );
  INVD1BWP30P140 U40 ( .I(i_data_bus[49]), .ZN(n14) );
  INVD1BWP30P140 U41 ( .I(i_data_bus[17]), .ZN(n78) );
  OAI22D1BWP30P140 U42 ( .A1(n21), .A2(n14), .B1(n60), .B2(n78), .ZN(N304) );
  INVD1BWP30P140 U43 ( .I(i_data_bus[48]), .ZN(n15) );
  INVD1BWP30P140 U44 ( .I(i_data_bus[16]), .ZN(n79) );
  OAI22D1BWP30P140 U45 ( .A1(n21), .A2(n15), .B1(n60), .B2(n79), .ZN(N303) );
  INVD1BWP30P140 U46 ( .I(i_data_bus[46]), .ZN(n16) );
  INVD1BWP30P140 U47 ( .I(i_data_bus[14]), .ZN(n81) );
  OAI22D1BWP30P140 U48 ( .A1(n21), .A2(n16), .B1(n60), .B2(n81), .ZN(N301) );
  INVD1BWP30P140 U49 ( .I(i_data_bus[42]), .ZN(n17) );
  INVD1BWP30P140 U50 ( .I(i_data_bus[10]), .ZN(n86) );
  OAI22D1BWP30P140 U51 ( .A1(n21), .A2(n17), .B1(n60), .B2(n86), .ZN(N297) );
  INVD1BWP30P140 U52 ( .I(i_data_bus[41]), .ZN(n18) );
  INVD1BWP30P140 U53 ( .I(i_data_bus[9]), .ZN(n87) );
  OAI22D1BWP30P140 U54 ( .A1(n21), .A2(n18), .B1(n60), .B2(n87), .ZN(N296) );
  INVD1BWP30P140 U55 ( .I(i_data_bus[40]), .ZN(n19) );
  INVD1BWP30P140 U56 ( .I(i_data_bus[8]), .ZN(n85) );
  OAI22D1BWP30P140 U57 ( .A1(n21), .A2(n19), .B1(n60), .B2(n85), .ZN(N295) );
  INVD1BWP30P140 U58 ( .I(i_data_bus[47]), .ZN(n20) );
  INVD1BWP30P140 U59 ( .I(i_data_bus[15]), .ZN(n80) );
  OAI22D1BWP30P140 U60 ( .A1(n21), .A2(n20), .B1(n60), .B2(n80), .ZN(N302) );
  INVD2BWP30P140 U61 ( .I(n50), .ZN(n35) );
  INVD1BWP30P140 U62 ( .I(i_data_bus[53]), .ZN(n23) );
  INVD1BWP30P140 U63 ( .I(i_data_bus[21]), .ZN(n73) );
  OAI22D1BWP30P140 U64 ( .A1(n35), .A2(n23), .B1(n36), .B2(n73), .ZN(N308) );
  INVD1BWP30P140 U65 ( .I(i_data_bus[52]), .ZN(n24) );
  INVD1BWP30P140 U66 ( .I(i_data_bus[20]), .ZN(n74) );
  OAI22D1BWP30P140 U67 ( .A1(n35), .A2(n24), .B1(n36), .B2(n74), .ZN(N307) );
  INVD1BWP30P140 U68 ( .I(i_data_bus[55]), .ZN(n25) );
  INVD1BWP30P140 U69 ( .I(i_data_bus[23]), .ZN(n71) );
  OAI22D1BWP30P140 U70 ( .A1(n35), .A2(n25), .B1(n36), .B2(n71), .ZN(N310) );
  INVD1BWP30P140 U71 ( .I(i_data_bus[54]), .ZN(n26) );
  INVD1BWP30P140 U72 ( .I(i_data_bus[22]), .ZN(n72) );
  OAI22D1BWP30P140 U73 ( .A1(n35), .A2(n26), .B1(n36), .B2(n72), .ZN(N309) );
  INVD1BWP30P140 U74 ( .I(i_data_bus[59]), .ZN(n27) );
  INVD1BWP30P140 U75 ( .I(i_data_bus[27]), .ZN(n68) );
  OAI22D1BWP30P140 U76 ( .A1(n35), .A2(n27), .B1(n36), .B2(n68), .ZN(N314) );
  INVD1BWP30P140 U77 ( .I(i_data_bus[63]), .ZN(n28) );
  INVD1BWP30P140 U78 ( .I(i_data_bus[31]), .ZN(n65) );
  OAI22D1BWP30P140 U79 ( .A1(n35), .A2(n28), .B1(n36), .B2(n65), .ZN(N318) );
  INVD1BWP30P140 U80 ( .I(i_data_bus[62]), .ZN(n29) );
  INVD1BWP30P140 U81 ( .I(i_data_bus[30]), .ZN(n66) );
  OAI22D1BWP30P140 U82 ( .A1(n35), .A2(n29), .B1(n36), .B2(n66), .ZN(N317) );
  INVD1BWP30P140 U83 ( .I(i_data_bus[61]), .ZN(n30) );
  INVD1BWP30P140 U84 ( .I(i_data_bus[29]), .ZN(n61) );
  OAI22D1BWP30P140 U85 ( .A1(n35), .A2(n30), .B1(n36), .B2(n61), .ZN(N316) );
  INVD1BWP30P140 U86 ( .I(i_data_bus[60]), .ZN(n31) );
  INVD1BWP30P140 U87 ( .I(i_data_bus[28]), .ZN(n67) );
  OAI22D1BWP30P140 U88 ( .A1(n35), .A2(n31), .B1(n36), .B2(n67), .ZN(N315) );
  INVD1BWP30P140 U89 ( .I(i_data_bus[57]), .ZN(n32) );
  INVD1BWP30P140 U90 ( .I(i_data_bus[25]), .ZN(n62) );
  OAI22D1BWP30P140 U91 ( .A1(n35), .A2(n32), .B1(n36), .B2(n62), .ZN(N312) );
  INVD1BWP30P140 U92 ( .I(i_data_bus[58]), .ZN(n33) );
  INVD1BWP30P140 U93 ( .I(i_data_bus[26]), .ZN(n69) );
  OAI22D1BWP30P140 U94 ( .A1(n35), .A2(n33), .B1(n36), .B2(n69), .ZN(N313) );
  INVD1BWP30P140 U95 ( .I(i_data_bus[56]), .ZN(n34) );
  INVD1BWP30P140 U96 ( .I(i_data_bus[24]), .ZN(n70) );
  OAI22D1BWP30P140 U97 ( .A1(n35), .A2(n34), .B1(n36), .B2(n70), .ZN(N311) );
  OAI31D1BWP30P140 U98 ( .A1(n42), .A2(n45), .A3(n37), .B(n36), .ZN(N353) );
  INVD1BWP30P140 U99 ( .I(n38), .ZN(n41) );
  INVD1BWP30P140 U100 ( .I(n42), .ZN(n39) );
  ND2OPTIBD1BWP30P140 U101 ( .A1(i_cmd[1]), .A2(n39), .ZN(n40) );
  OAI21D1BWP30P140 U102 ( .A1(n41), .A2(i_cmd[1]), .B(n2), .ZN(N354) );
  NR2OPTPAD1BWP30P140 U103 ( .A1(n42), .A2(i_cmd[1]), .ZN(n43) );
  INVD1P5BWP30P140 U104 ( .I(n43), .ZN(n44) );
  IAO21D2BWP30P140 U105 ( .A1(i_cmd[0]), .A2(i_valid[0]), .B(n44), .ZN(n47) );
  CKND2D4BWP30P140 U106 ( .A1(n47), .A2(n46), .ZN(n94) );
  INVD1BWP30P140 U107 ( .I(i_data_bus[6]), .ZN(n52) );
  INVD1BWP30P140 U108 ( .I(i_data_bus[38]), .ZN(n51) );
  OAI22D1BWP30P140 U109 ( .A1(n60), .A2(n52), .B1(n59), .B2(n51), .ZN(N293) );
  INVD1BWP30P140 U110 ( .I(i_data_bus[7]), .ZN(n64) );
  INVD1BWP30P140 U111 ( .I(i_data_bus[39]), .ZN(n63) );
  OAI22D1BWP30P140 U112 ( .A1(n60), .A2(n64), .B1(n59), .B2(n63), .ZN(N294) );
  INVD1BWP30P140 U113 ( .I(i_data_bus[4]), .ZN(n92) );
  INVD1BWP30P140 U114 ( .I(i_data_bus[36]), .ZN(n53) );
  OAI22D1BWP30P140 U115 ( .A1(n60), .A2(n92), .B1(n59), .B2(n53), .ZN(N291) );
  INVD1BWP30P140 U116 ( .I(i_data_bus[5]), .ZN(n95) );
  INVD1BWP30P140 U117 ( .I(i_data_bus[37]), .ZN(n54) );
  OAI22D1BWP30P140 U118 ( .A1(n60), .A2(n95), .B1(n59), .B2(n54), .ZN(N292) );
  INVD1BWP30P140 U119 ( .I(i_data_bus[1]), .ZN(n89) );
  INVD1BWP30P140 U120 ( .I(i_data_bus[33]), .ZN(n55) );
  OAI22D1BWP30P140 U121 ( .A1(n60), .A2(n89), .B1(n59), .B2(n55), .ZN(N288) );
  INVD1BWP30P140 U122 ( .I(i_data_bus[2]), .ZN(n90) );
  INVD1BWP30P140 U123 ( .I(i_data_bus[34]), .ZN(n56) );
  OAI22D1BWP30P140 U124 ( .A1(n60), .A2(n90), .B1(n59), .B2(n56), .ZN(N289) );
  INVD1BWP30P140 U125 ( .I(i_data_bus[3]), .ZN(n91) );
  INVD1BWP30P140 U126 ( .I(i_data_bus[35]), .ZN(n57) );
  OAI22D1BWP30P140 U127 ( .A1(n60), .A2(n91), .B1(n59), .B2(n57), .ZN(N290) );
  INVD1BWP30P140 U128 ( .I(i_data_bus[0]), .ZN(n88) );
  INVD1BWP30P140 U129 ( .I(i_data_bus[32]), .ZN(n58) );
  OAI22D1BWP30P140 U130 ( .A1(n60), .A2(n88), .B1(n59), .B2(n58), .ZN(N287) );
  MOAI22D1BWP30P140 U131 ( .A1(n61), .A2(n1), .B1(i_data_bus[61]), .B2(n93), 
        .ZN(N348) );
  MOAI22D1BWP30P140 U132 ( .A1(n62), .A2(n1), .B1(i_data_bus[57]), .B2(n93), 
        .ZN(N344) );
  OAI22D1BWP30P140 U133 ( .A1(n94), .A2(n64), .B1(n2), .B2(n63), .ZN(N326) );
  MOAI22D1BWP30P140 U134 ( .A1(n65), .A2(n1), .B1(i_data_bus[63]), .B2(n93), 
        .ZN(N350) );
  MOAI22D1BWP30P140 U135 ( .A1(n66), .A2(n1), .B1(i_data_bus[62]), .B2(n93), 
        .ZN(N349) );
  MOAI22D1BWP30P140 U136 ( .A1(n67), .A2(n1), .B1(i_data_bus[60]), .B2(n93), 
        .ZN(N347) );
  MOAI22D1BWP30P140 U137 ( .A1(n68), .A2(n1), .B1(i_data_bus[59]), .B2(n93), 
        .ZN(N346) );
  MOAI22D1BWP30P140 U138 ( .A1(n69), .A2(n1), .B1(i_data_bus[58]), .B2(n93), 
        .ZN(N345) );
  MOAI22D1BWP30P140 U139 ( .A1(n70), .A2(n1), .B1(i_data_bus[56]), .B2(n93), 
        .ZN(N343) );
  MOAI22D1BWP30P140 U140 ( .A1(n71), .A2(n1), .B1(i_data_bus[55]), .B2(n93), 
        .ZN(N342) );
  MOAI22D1BWP30P140 U141 ( .A1(n72), .A2(n1), .B1(i_data_bus[54]), .B2(n93), 
        .ZN(N341) );
  MOAI22D1BWP30P140 U142 ( .A1(n73), .A2(n1), .B1(i_data_bus[53]), .B2(n93), 
        .ZN(N340) );
  MOAI22D1BWP30P140 U143 ( .A1(n74), .A2(n1), .B1(i_data_bus[52]), .B2(n93), 
        .ZN(N339) );
  INVD1BWP30P140 U144 ( .I(i_data_bus[19]), .ZN(n76) );
  MOAI22D1BWP30P140 U145 ( .A1(n76), .A2(n1), .B1(i_data_bus[51]), .B2(n93), 
        .ZN(N338) );
  INVD1BWP30P140 U146 ( .I(i_data_bus[18]), .ZN(n77) );
  MOAI22D1BWP30P140 U147 ( .A1(n77), .A2(n1), .B1(i_data_bus[50]), .B2(n93), 
        .ZN(N337) );
  MOAI22D1BWP30P140 U148 ( .A1(n78), .A2(n1), .B1(i_data_bus[49]), .B2(n93), 
        .ZN(N336) );
  MOAI22D1BWP30P140 U149 ( .A1(n79), .A2(n1), .B1(i_data_bus[48]), .B2(n93), 
        .ZN(N335) );
  MOAI22D1BWP30P140 U150 ( .A1(n80), .A2(n1), .B1(i_data_bus[47]), .B2(n93), 
        .ZN(N334) );
  MOAI22D1BWP30P140 U151 ( .A1(n81), .A2(n1), .B1(i_data_bus[46]), .B2(n93), 
        .ZN(N333) );
  MOAI22D1BWP30P140 U152 ( .A1(n82), .A2(n1), .B1(i_data_bus[45]), .B2(n93), 
        .ZN(N332) );
  MOAI22D1BWP30P140 U153 ( .A1(n83), .A2(n1), .B1(i_data_bus[44]), .B2(n93), 
        .ZN(N331) );
  MOAI22D1BWP30P140 U154 ( .A1(n84), .A2(n1), .B1(i_data_bus[43]), .B2(n93), 
        .ZN(N330) );
  MOAI22D1BWP30P140 U155 ( .A1(n85), .A2(n1), .B1(i_data_bus[40]), .B2(n93), 
        .ZN(N327) );
  MOAI22D1BWP30P140 U156 ( .A1(n86), .A2(n1), .B1(i_data_bus[42]), .B2(n93), 
        .ZN(N329) );
  MOAI22D1BWP30P140 U157 ( .A1(n87), .A2(n1), .B1(i_data_bus[41]), .B2(n93), 
        .ZN(N328) );
  MOAI22D1BWP30P140 U158 ( .A1(n88), .A2(n94), .B1(i_data_bus[32]), .B2(n93), 
        .ZN(N319) );
  MOAI22D1BWP30P140 U159 ( .A1(n89), .A2(n94), .B1(i_data_bus[33]), .B2(n93), 
        .ZN(N320) );
  MOAI22D1BWP30P140 U160 ( .A1(n90), .A2(n94), .B1(i_data_bus[34]), .B2(n93), 
        .ZN(N321) );
  MOAI22D1BWP30P140 U161 ( .A1(n91), .A2(n94), .B1(i_data_bus[35]), .B2(n93), 
        .ZN(N322) );
  MOAI22D1BWP30P140 U162 ( .A1(n92), .A2(n94), .B1(i_data_bus[36]), .B2(n93), 
        .ZN(N323) );
  MOAI22D1BWP30P140 U163 ( .A1(n95), .A2(n94), .B1(i_data_bus[37]), .B2(n93), 
        .ZN(N324) );
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
         n45, n46, n47, n48, n49, n50, n51, n52, n53, n54, n55, n56, n57, n58,
         n59, n60, n61, n62, n63, n64, n65, n66, n67, n68, n69, n70, n71, n72,
         n73, n74, n75, n76, n77, n78, n79, n80, n81, n82, n83, n84, n85, n86,
         n87, n88;

  DFQD1BWP30P140 o_data_bus_inner_reg_63_ ( .D(N350), .CP(clk), .Q(
        o_data_bus[63]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_62_ ( .D(N349), .CP(clk), .Q(
        o_data_bus[62]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_61_ ( .D(N348), .CP(clk), .Q(
        o_data_bus[61]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_60_ ( .D(N347), .CP(clk), .Q(
        o_data_bus[60]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_59_ ( .D(N346), .CP(clk), .Q(
        o_data_bus[59]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_58_ ( .D(N345), .CP(clk), .Q(
        o_data_bus[58]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_57_ ( .D(N344), .CP(clk), .Q(
        o_data_bus[57]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_56_ ( .D(N343), .CP(clk), .Q(
        o_data_bus[56]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_55_ ( .D(N342), .CP(clk), .Q(
        o_data_bus[55]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_54_ ( .D(N341), .CP(clk), .Q(
        o_data_bus[54]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_53_ ( .D(N340), .CP(clk), .Q(
        o_data_bus[53]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_52_ ( .D(N339), .CP(clk), .Q(
        o_data_bus[52]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_51_ ( .D(N338), .CP(clk), .Q(
        o_data_bus[51]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_50_ ( .D(N337), .CP(clk), .Q(
        o_data_bus[50]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_49_ ( .D(N336), .CP(clk), .Q(
        o_data_bus[49]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_48_ ( .D(N335), .CP(clk), .Q(
        o_data_bus[48]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_47_ ( .D(N334), .CP(clk), .Q(
        o_data_bus[47]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_46_ ( .D(N333), .CP(clk), .Q(
        o_data_bus[46]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_45_ ( .D(N332), .CP(clk), .Q(
        o_data_bus[45]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_44_ ( .D(N331), .CP(clk), .Q(
        o_data_bus[44]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_43_ ( .D(N330), .CP(clk), .Q(
        o_data_bus[43]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_42_ ( .D(N329), .CP(clk), .Q(
        o_data_bus[42]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_41_ ( .D(N328), .CP(clk), .Q(
        o_data_bus[41]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_40_ ( .D(N327), .CP(clk), .Q(
        o_data_bus[40]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_39_ ( .D(N326), .CP(clk), .Q(
        o_data_bus[39]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_38_ ( .D(N325), .CP(clk), .Q(
        o_data_bus[38]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_37_ ( .D(N324), .CP(clk), .Q(
        o_data_bus[37]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_36_ ( .D(N323), .CP(clk), .Q(
        o_data_bus[36]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_35_ ( .D(N322), .CP(clk), .Q(
        o_data_bus[35]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_34_ ( .D(N321), .CP(clk), .Q(
        o_data_bus[34]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_33_ ( .D(N320), .CP(clk), .Q(
        o_data_bus[33]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_32_ ( .D(N319), .CP(clk), .Q(
        o_data_bus[32]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_31_ ( .D(N318), .CP(clk), .Q(
        o_data_bus[31]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_30_ ( .D(N317), .CP(clk), .Q(
        o_data_bus[30]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_29_ ( .D(N316), .CP(clk), .Q(
        o_data_bus[29]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_28_ ( .D(N315), .CP(clk), .Q(
        o_data_bus[28]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_27_ ( .D(N314), .CP(clk), .Q(
        o_data_bus[27]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_26_ ( .D(N313), .CP(clk), .Q(
        o_data_bus[26]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_25_ ( .D(N312), .CP(clk), .Q(
        o_data_bus[25]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_24_ ( .D(N311), .CP(clk), .Q(
        o_data_bus[24]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_23_ ( .D(N310), .CP(clk), .Q(
        o_data_bus[23]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_22_ ( .D(N309), .CP(clk), .Q(
        o_data_bus[22]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_21_ ( .D(N308), .CP(clk), .Q(
        o_data_bus[21]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_20_ ( .D(N307), .CP(clk), .Q(
        o_data_bus[20]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_19_ ( .D(N306), .CP(clk), .Q(
        o_data_bus[19]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_18_ ( .D(N305), .CP(clk), .Q(
        o_data_bus[18]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_17_ ( .D(N304), .CP(clk), .Q(
        o_data_bus[17]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_16_ ( .D(N303), .CP(clk), .Q(
        o_data_bus[16]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_15_ ( .D(N302), .CP(clk), .Q(
        o_data_bus[15]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_14_ ( .D(N301), .CP(clk), .Q(
        o_data_bus[14]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_13_ ( .D(N300), .CP(clk), .Q(
        o_data_bus[13]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_12_ ( .D(N299), .CP(clk), .Q(
        o_data_bus[12]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_11_ ( .D(N298), .CP(clk), .Q(
        o_data_bus[11]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_10_ ( .D(N297), .CP(clk), .Q(
        o_data_bus[10]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_9_ ( .D(N296), .CP(clk), .Q(
        o_data_bus[9]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_8_ ( .D(N295), .CP(clk), .Q(
        o_data_bus[8]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_7_ ( .D(N294), .CP(clk), .Q(
        o_data_bus[7]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_6_ ( .D(N293), .CP(clk), .Q(
        o_data_bus[6]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_5_ ( .D(N292), .CP(clk), .Q(
        o_data_bus[5]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_4_ ( .D(N291), .CP(clk), .Q(
        o_data_bus[4]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_3_ ( .D(N290), .CP(clk), .Q(
        o_data_bus[3]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_2_ ( .D(N289), .CP(clk), .Q(
        o_data_bus[2]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_1_ ( .D(N288), .CP(clk), .Q(
        o_data_bus[1]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_0_ ( .D(N287), .CP(clk), .Q(
        o_data_bus[0]) );
  DFQD4BWP30P140 o_valid_inner_reg_1_ ( .D(N354), .CP(clk), .Q(o_valid[1]) );
  DFQD2BWP30P140 o_valid_inner_reg_0_ ( .D(N353), .CP(clk), .Q(o_valid[0]) );
  AN3D4BWP30P140 U3 ( .A1(i_valid[1]), .A2(i_cmd[1]), .A3(n47), .Z(n87) );
  NR2D1BWP30P140 U4 ( .A1(n50), .A2(n3), .ZN(n5) );
  INVD1BWP30P140 U5 ( .I(i_cmd[0]), .ZN(n3) );
  ND2OPTIBD4BWP30P140 U6 ( .A1(n53), .A2(n54), .ZN(n82) );
  NR2D1BWP30P140 U7 ( .A1(n50), .A2(i_cmd[1]), .ZN(n54) );
  OAI22D1BWP30P140 U8 ( .A1(n22), .A2(n8), .B1(n45), .B2(n88), .ZN(N295) );
  OAI22D1BWP30P140 U9 ( .A1(n22), .A2(n9), .B1(n32), .B2(n86), .ZN(N296) );
  OAI22D1BWP30P140 U10 ( .A1(n22), .A2(n10), .B1(n45), .B2(n85), .ZN(N297) );
  OAI22D1BWP30P140 U11 ( .A1(n22), .A2(n11), .B1(n32), .B2(n84), .ZN(N298) );
  OAI22D1BWP30P140 U12 ( .A1(n22), .A2(n21), .B1(n45), .B2(n71), .ZN(N299) );
  OAI22D1BWP30P140 U13 ( .A1(n22), .A2(n12), .B1(n32), .B2(n63), .ZN(N300) );
  OAI22D1BWP30P140 U14 ( .A1(n22), .A2(n13), .B1(n45), .B2(n70), .ZN(N301) );
  OAI22D1BWP30P140 U15 ( .A1(n22), .A2(n14), .B1(n32), .B2(n74), .ZN(N302) );
  OAI22D1BWP30P140 U16 ( .A1(n22), .A2(n15), .B1(n45), .B2(n72), .ZN(N303) );
  OAI22D1BWP30P140 U17 ( .A1(n22), .A2(n16), .B1(n32), .B2(n77), .ZN(N304) );
  OAI22D1BWP30P140 U18 ( .A1(n22), .A2(n17), .B1(n45), .B2(n64), .ZN(N305) );
  OAI22D1BWP30P140 U19 ( .A1(n22), .A2(n18), .B1(n32), .B2(n65), .ZN(N306) );
  OAI22D1BWP30P140 U20 ( .A1(n34), .A2(n19), .B1(n45), .B2(n66), .ZN(N307) );
  OAI22D1BWP30P140 U21 ( .A1(n34), .A2(n20), .B1(n32), .B2(n75), .ZN(N308) );
  OAI22D1BWP30P140 U22 ( .A1(n34), .A2(n23), .B1(n45), .B2(n76), .ZN(N309) );
  OAI22D1BWP30P140 U23 ( .A1(n34), .A2(n24), .B1(n32), .B2(n69), .ZN(N310) );
  OAI22D1BWP30P140 U24 ( .A1(n34), .A2(n25), .B1(n45), .B2(n67), .ZN(N311) );
  OAI22D1BWP30P140 U25 ( .A1(n34), .A2(n26), .B1(n32), .B2(n68), .ZN(N312) );
  OAI22D1BWP30P140 U26 ( .A1(n34), .A2(n27), .B1(n45), .B2(n73), .ZN(N313) );
  OAI22D1BWP30P140 U27 ( .A1(n34), .A2(n28), .B1(n32), .B2(n78), .ZN(N314) );
  OAI22D1BWP30P140 U28 ( .A1(n34), .A2(n29), .B1(n45), .B2(n79), .ZN(N315) );
  OAI22D1BWP30P140 U29 ( .A1(n34), .A2(n30), .B1(n32), .B2(n80), .ZN(N316) );
  OAI22D1BWP30P140 U30 ( .A1(n34), .A2(n31), .B1(n45), .B2(n81), .ZN(N317) );
  OAI22D1BWP30P140 U31 ( .A1(n34), .A2(n33), .B1(n32), .B2(n83), .ZN(N318) );
  INVD2BWP30P140 U32 ( .I(i_valid[0]), .ZN(n52) );
  INVD1BWP30P140 U33 ( .I(n2), .ZN(n7) );
  ND2OPTIBD1BWP30P140 U34 ( .A1(n46), .A2(n3), .ZN(n2) );
  ND2D1BWP30P140 U35 ( .A1(n1), .A2(i_en), .ZN(n50) );
  INVD1BWP30P140 U36 ( .I(n35), .ZN(n44) );
  INVD2BWP30P140 U37 ( .I(n7), .ZN(n45) );
  INVD1BWP30P140 U38 ( .I(n35), .ZN(n22) );
  INVD2BWP30P140 U39 ( .I(n7), .ZN(n32) );
  INVD1BWP30P140 U40 ( .I(n35), .ZN(n34) );
  OAI31D1BWP30P140 U41 ( .A1(n50), .A2(n51), .A3(n3), .B(n45), .ZN(N353) );
  INVD1BWP30P140 U42 ( .I(rst), .ZN(n1) );
  INVD2BWP30P140 U43 ( .I(i_valid[1]), .ZN(n51) );
  INR2D2BWP30P140 U44 ( .A1(i_valid[0]), .B1(n50), .ZN(n46) );
  MUX2NUD1BWP30P140 U45 ( .I0(n52), .I1(n51), .S(i_cmd[1]), .ZN(n4) );
  ND2OPTIBD1BWP30P140 U46 ( .A1(n5), .A2(n4), .ZN(n6) );
  INVD2BWP30P140 U47 ( .I(n6), .ZN(n35) );
  INVD1BWP30P140 U48 ( .I(i_data_bus[40]), .ZN(n8) );
  INVD1BWP30P140 U49 ( .I(i_data_bus[8]), .ZN(n88) );
  INVD1BWP30P140 U50 ( .I(i_data_bus[41]), .ZN(n9) );
  INVD1BWP30P140 U51 ( .I(i_data_bus[9]), .ZN(n86) );
  INVD1BWP30P140 U52 ( .I(i_data_bus[42]), .ZN(n10) );
  INVD1BWP30P140 U53 ( .I(i_data_bus[10]), .ZN(n85) );
  INVD1BWP30P140 U54 ( .I(i_data_bus[43]), .ZN(n11) );
  INVD1BWP30P140 U55 ( .I(i_data_bus[11]), .ZN(n84) );
  INVD1BWP30P140 U56 ( .I(i_data_bus[45]), .ZN(n12) );
  INVD1BWP30P140 U57 ( .I(i_data_bus[13]), .ZN(n63) );
  INVD1BWP30P140 U58 ( .I(i_data_bus[46]), .ZN(n13) );
  INVD1BWP30P140 U59 ( .I(i_data_bus[14]), .ZN(n70) );
  INVD1BWP30P140 U60 ( .I(i_data_bus[47]), .ZN(n14) );
  INVD1BWP30P140 U61 ( .I(i_data_bus[15]), .ZN(n74) );
  INVD1BWP30P140 U62 ( .I(i_data_bus[48]), .ZN(n15) );
  INVD1BWP30P140 U63 ( .I(i_data_bus[16]), .ZN(n72) );
  INVD1BWP30P140 U64 ( .I(i_data_bus[49]), .ZN(n16) );
  INVD1BWP30P140 U65 ( .I(i_data_bus[17]), .ZN(n77) );
  INVD1BWP30P140 U66 ( .I(i_data_bus[50]), .ZN(n17) );
  INVD1BWP30P140 U67 ( .I(i_data_bus[18]), .ZN(n64) );
  INVD1BWP30P140 U68 ( .I(i_data_bus[51]), .ZN(n18) );
  INVD1BWP30P140 U69 ( .I(i_data_bus[19]), .ZN(n65) );
  INVD1BWP30P140 U70 ( .I(i_data_bus[52]), .ZN(n19) );
  INVD1BWP30P140 U71 ( .I(i_data_bus[20]), .ZN(n66) );
  INVD1BWP30P140 U72 ( .I(i_data_bus[53]), .ZN(n20) );
  INVD1BWP30P140 U73 ( .I(i_data_bus[21]), .ZN(n75) );
  INVD1BWP30P140 U74 ( .I(i_data_bus[44]), .ZN(n21) );
  INVD1BWP30P140 U75 ( .I(i_data_bus[12]), .ZN(n71) );
  INVD1BWP30P140 U76 ( .I(i_data_bus[54]), .ZN(n23) );
  INVD1BWP30P140 U77 ( .I(i_data_bus[22]), .ZN(n76) );
  INVD1BWP30P140 U78 ( .I(i_data_bus[55]), .ZN(n24) );
  INVD1BWP30P140 U79 ( .I(i_data_bus[23]), .ZN(n69) );
  INVD1BWP30P140 U80 ( .I(i_data_bus[56]), .ZN(n25) );
  INVD1BWP30P140 U81 ( .I(i_data_bus[24]), .ZN(n67) );
  INVD1BWP30P140 U82 ( .I(i_data_bus[57]), .ZN(n26) );
  INVD1BWP30P140 U83 ( .I(i_data_bus[25]), .ZN(n68) );
  INVD1BWP30P140 U84 ( .I(i_data_bus[58]), .ZN(n27) );
  INVD1BWP30P140 U85 ( .I(i_data_bus[26]), .ZN(n73) );
  INVD1BWP30P140 U86 ( .I(i_data_bus[59]), .ZN(n28) );
  INVD1BWP30P140 U87 ( .I(i_data_bus[27]), .ZN(n78) );
  INVD1BWP30P140 U88 ( .I(i_data_bus[60]), .ZN(n29) );
  INVD1BWP30P140 U89 ( .I(i_data_bus[28]), .ZN(n79) );
  INVD1BWP30P140 U90 ( .I(i_data_bus[61]), .ZN(n30) );
  INVD1BWP30P140 U91 ( .I(i_data_bus[29]), .ZN(n80) );
  INVD1BWP30P140 U92 ( .I(i_data_bus[62]), .ZN(n31) );
  INVD1BWP30P140 U93 ( .I(i_data_bus[30]), .ZN(n81) );
  INVD1BWP30P140 U94 ( .I(i_data_bus[63]), .ZN(n33) );
  INVD1BWP30P140 U95 ( .I(i_data_bus[31]), .ZN(n83) );
  INVD1BWP30P140 U96 ( .I(i_data_bus[7]), .ZN(n60) );
  INVD1BWP30P140 U97 ( .I(i_data_bus[39]), .ZN(n36) );
  OAI22D1BWP30P140 U98 ( .A1(n45), .A2(n60), .B1(n44), .B2(n36), .ZN(N294) );
  INVD1BWP30P140 U99 ( .I(i_data_bus[6]), .ZN(n59) );
  INVD1BWP30P140 U100 ( .I(i_data_bus[38]), .ZN(n37) );
  OAI22D1BWP30P140 U101 ( .A1(n32), .A2(n59), .B1(n44), .B2(n37), .ZN(N293) );
  INVD1BWP30P140 U102 ( .I(i_data_bus[5]), .ZN(n58) );
  INVD1BWP30P140 U103 ( .I(i_data_bus[37]), .ZN(n38) );
  OAI22D1BWP30P140 U104 ( .A1(n45), .A2(n58), .B1(n44), .B2(n38), .ZN(N292) );
  INVD1BWP30P140 U105 ( .I(i_data_bus[4]), .ZN(n57) );
  INVD1BWP30P140 U106 ( .I(i_data_bus[36]), .ZN(n39) );
  OAI22D1BWP30P140 U107 ( .A1(n32), .A2(n57), .B1(n44), .B2(n39), .ZN(N291) );
  INVD1BWP30P140 U108 ( .I(i_data_bus[3]), .ZN(n56) );
  INVD1BWP30P140 U109 ( .I(i_data_bus[35]), .ZN(n40) );
  OAI22D1BWP30P140 U110 ( .A1(n45), .A2(n56), .B1(n44), .B2(n40), .ZN(N290) );
  INVD1BWP30P140 U111 ( .I(i_data_bus[2]), .ZN(n61) );
  INVD1BWP30P140 U112 ( .I(i_data_bus[34]), .ZN(n41) );
  OAI22D1BWP30P140 U113 ( .A1(n32), .A2(n61), .B1(n44), .B2(n41), .ZN(N289) );
  INVD1BWP30P140 U114 ( .I(i_data_bus[1]), .ZN(n55) );
  INVD1BWP30P140 U115 ( .I(i_data_bus[33]), .ZN(n42) );
  OAI22D1BWP30P140 U116 ( .A1(n45), .A2(n55), .B1(n44), .B2(n42), .ZN(N288) );
  INVD1BWP30P140 U117 ( .I(i_data_bus[0]), .ZN(n62) );
  INVD1BWP30P140 U118 ( .I(i_data_bus[32]), .ZN(n43) );
  OAI22D1BWP30P140 U119 ( .A1(n32), .A2(n62), .B1(n44), .B2(n43), .ZN(N287) );
  INVD1BWP30P140 U120 ( .I(n46), .ZN(n49) );
  INVD1BWP30P140 U121 ( .I(n50), .ZN(n47) );
  INVD1BWP30P140 U122 ( .I(n87), .ZN(n48) );
  OAI21D1BWP30P140 U123 ( .A1(n49), .A2(i_cmd[1]), .B(n48), .ZN(N354) );
  MUX2NUD1BWP30P140 U124 ( .I0(n52), .I1(n51), .S(i_cmd[0]), .ZN(n53) );
  MOAI22D1BWP30P140 U125 ( .A1(n55), .A2(n82), .B1(i_data_bus[33]), .B2(n87), 
        .ZN(N320) );
  MOAI22D1BWP30P140 U126 ( .A1(n56), .A2(n82), .B1(i_data_bus[35]), .B2(n87), 
        .ZN(N322) );
  MOAI22D1BWP30P140 U127 ( .A1(n57), .A2(n82), .B1(i_data_bus[36]), .B2(n87), 
        .ZN(N323) );
  MOAI22D1BWP30P140 U128 ( .A1(n58), .A2(n82), .B1(i_data_bus[37]), .B2(n87), 
        .ZN(N324) );
  MOAI22D1BWP30P140 U129 ( .A1(n59), .A2(n82), .B1(i_data_bus[38]), .B2(n87), 
        .ZN(N325) );
  MOAI22D1BWP30P140 U130 ( .A1(n60), .A2(n82), .B1(i_data_bus[39]), .B2(n87), 
        .ZN(N326) );
  MOAI22D1BWP30P140 U131 ( .A1(n61), .A2(n82), .B1(i_data_bus[34]), .B2(n87), 
        .ZN(N321) );
  MOAI22D1BWP30P140 U132 ( .A1(n62), .A2(n82), .B1(i_data_bus[32]), .B2(n87), 
        .ZN(N319) );
  MOAI22D1BWP30P140 U133 ( .A1(n63), .A2(n82), .B1(i_data_bus[45]), .B2(n87), 
        .ZN(N332) );
  MOAI22D1BWP30P140 U134 ( .A1(n64), .A2(n82), .B1(i_data_bus[50]), .B2(n87), 
        .ZN(N337) );
  MOAI22D1BWP30P140 U135 ( .A1(n65), .A2(n82), .B1(i_data_bus[51]), .B2(n87), 
        .ZN(N338) );
  MOAI22D1BWP30P140 U136 ( .A1(n66), .A2(n82), .B1(i_data_bus[52]), .B2(n87), 
        .ZN(N339) );
  MOAI22D1BWP30P140 U137 ( .A1(n67), .A2(n82), .B1(i_data_bus[56]), .B2(n87), 
        .ZN(N343) );
  MOAI22D1BWP30P140 U138 ( .A1(n68), .A2(n82), .B1(i_data_bus[57]), .B2(n87), 
        .ZN(N344) );
  MOAI22D1BWP30P140 U139 ( .A1(n69), .A2(n82), .B1(i_data_bus[55]), .B2(n87), 
        .ZN(N342) );
  MOAI22D1BWP30P140 U140 ( .A1(n70), .A2(n82), .B1(i_data_bus[46]), .B2(n87), 
        .ZN(N333) );
  MOAI22D1BWP30P140 U141 ( .A1(n71), .A2(n82), .B1(i_data_bus[44]), .B2(n87), 
        .ZN(N331) );
  MOAI22D1BWP30P140 U142 ( .A1(n72), .A2(n82), .B1(i_data_bus[48]), .B2(n87), 
        .ZN(N335) );
  MOAI22D1BWP30P140 U143 ( .A1(n73), .A2(n82), .B1(i_data_bus[58]), .B2(n87), 
        .ZN(N345) );
  MOAI22D1BWP30P140 U144 ( .A1(n74), .A2(n82), .B1(i_data_bus[47]), .B2(n87), 
        .ZN(N334) );
  MOAI22D1BWP30P140 U145 ( .A1(n75), .A2(n82), .B1(i_data_bus[53]), .B2(n87), 
        .ZN(N340) );
  MOAI22D1BWP30P140 U146 ( .A1(n76), .A2(n82), .B1(i_data_bus[54]), .B2(n87), 
        .ZN(N341) );
  MOAI22D1BWP30P140 U147 ( .A1(n77), .A2(n82), .B1(i_data_bus[49]), .B2(n87), 
        .ZN(N336) );
  MOAI22D1BWP30P140 U148 ( .A1(n78), .A2(n82), .B1(i_data_bus[59]), .B2(n87), 
        .ZN(N346) );
  MOAI22D1BWP30P140 U149 ( .A1(n79), .A2(n82), .B1(i_data_bus[60]), .B2(n87), 
        .ZN(N347) );
  MOAI22D1BWP30P140 U150 ( .A1(n80), .A2(n82), .B1(i_data_bus[61]), .B2(n87), 
        .ZN(N348) );
  MOAI22D1BWP30P140 U151 ( .A1(n81), .A2(n82), .B1(i_data_bus[62]), .B2(n87), 
        .ZN(N349) );
  MOAI22D1BWP30P140 U152 ( .A1(n83), .A2(n82), .B1(i_data_bus[63]), .B2(n87), 
        .ZN(N350) );
  MOAI22D1BWP30P140 U153 ( .A1(n84), .A2(n82), .B1(i_data_bus[43]), .B2(n87), 
        .ZN(N330) );
  MOAI22D1BWP30P140 U154 ( .A1(n85), .A2(n82), .B1(i_data_bus[42]), .B2(n87), 
        .ZN(N329) );
  MOAI22D1BWP30P140 U155 ( .A1(n86), .A2(n82), .B1(i_data_bus[41]), .B2(n87), 
        .ZN(N328) );
  MOAI22D1BWP30P140 U156 ( .A1(n88), .A2(n82), .B1(i_data_bus[40]), .B2(n87), 
        .ZN(N327) );
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
         n45, n46, n47, n48, n49, n50, n51, n52, n53, n54, n55, n56, n57, n58,
         n59, n60, n61, n62, n63, n64, n65, n66, n67, n68, n69, n70, n71, n72,
         n73, n74, n75, n76, n77, n78, n79, n80, n81, n82, n83, n84, n85, n86,
         n87, n88, n89;

  DFQD1BWP30P140 o_data_bus_inner_reg_63_ ( .D(N350), .CP(clk), .Q(
        o_data_bus[63]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_62_ ( .D(N349), .CP(clk), .Q(
        o_data_bus[62]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_61_ ( .D(N348), .CP(clk), .Q(
        o_data_bus[61]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_60_ ( .D(N347), .CP(clk), .Q(
        o_data_bus[60]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_59_ ( .D(N346), .CP(clk), .Q(
        o_data_bus[59]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_58_ ( .D(N345), .CP(clk), .Q(
        o_data_bus[58]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_57_ ( .D(N344), .CP(clk), .Q(
        o_data_bus[57]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_56_ ( .D(N343), .CP(clk), .Q(
        o_data_bus[56]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_55_ ( .D(N342), .CP(clk), .Q(
        o_data_bus[55]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_54_ ( .D(N341), .CP(clk), .Q(
        o_data_bus[54]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_53_ ( .D(N340), .CP(clk), .Q(
        o_data_bus[53]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_52_ ( .D(N339), .CP(clk), .Q(
        o_data_bus[52]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_51_ ( .D(N338), .CP(clk), .Q(
        o_data_bus[51]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_50_ ( .D(N337), .CP(clk), .Q(
        o_data_bus[50]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_49_ ( .D(N336), .CP(clk), .Q(
        o_data_bus[49]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_48_ ( .D(N335), .CP(clk), .Q(
        o_data_bus[48]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_47_ ( .D(N334), .CP(clk), .Q(
        o_data_bus[47]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_46_ ( .D(N333), .CP(clk), .Q(
        o_data_bus[46]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_45_ ( .D(N332), .CP(clk), .Q(
        o_data_bus[45]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_44_ ( .D(N331), .CP(clk), .Q(
        o_data_bus[44]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_43_ ( .D(N330), .CP(clk), .Q(
        o_data_bus[43]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_42_ ( .D(N329), .CP(clk), .Q(
        o_data_bus[42]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_41_ ( .D(N328), .CP(clk), .Q(
        o_data_bus[41]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_40_ ( .D(N327), .CP(clk), .Q(
        o_data_bus[40]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_39_ ( .D(N326), .CP(clk), .Q(
        o_data_bus[39]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_38_ ( .D(N325), .CP(clk), .Q(
        o_data_bus[38]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_37_ ( .D(N324), .CP(clk), .Q(
        o_data_bus[37]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_36_ ( .D(N323), .CP(clk), .Q(
        o_data_bus[36]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_35_ ( .D(N322), .CP(clk), .Q(
        o_data_bus[35]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_34_ ( .D(N321), .CP(clk), .Q(
        o_data_bus[34]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_33_ ( .D(N320), .CP(clk), .Q(
        o_data_bus[33]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_32_ ( .D(N319), .CP(clk), .Q(
        o_data_bus[32]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_31_ ( .D(N318), .CP(clk), .Q(
        o_data_bus[31]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_30_ ( .D(N317), .CP(clk), .Q(
        o_data_bus[30]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_29_ ( .D(N316), .CP(clk), .Q(
        o_data_bus[29]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_28_ ( .D(N315), .CP(clk), .Q(
        o_data_bus[28]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_27_ ( .D(N314), .CP(clk), .Q(
        o_data_bus[27]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_26_ ( .D(N313), .CP(clk), .Q(
        o_data_bus[26]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_25_ ( .D(N312), .CP(clk), .Q(
        o_data_bus[25]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_24_ ( .D(N311), .CP(clk), .Q(
        o_data_bus[24]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_23_ ( .D(N310), .CP(clk), .Q(
        o_data_bus[23]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_22_ ( .D(N309), .CP(clk), .Q(
        o_data_bus[22]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_21_ ( .D(N308), .CP(clk), .Q(
        o_data_bus[21]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_20_ ( .D(N307), .CP(clk), .Q(
        o_data_bus[20]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_19_ ( .D(N306), .CP(clk), .Q(
        o_data_bus[19]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_18_ ( .D(N305), .CP(clk), .Q(
        o_data_bus[18]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_17_ ( .D(N304), .CP(clk), .Q(
        o_data_bus[17]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_16_ ( .D(N303), .CP(clk), .Q(
        o_data_bus[16]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_15_ ( .D(N302), .CP(clk), .Q(
        o_data_bus[15]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_14_ ( .D(N301), .CP(clk), .Q(
        o_data_bus[14]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_13_ ( .D(N300), .CP(clk), .Q(
        o_data_bus[13]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_12_ ( .D(N299), .CP(clk), .Q(
        o_data_bus[12]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_11_ ( .D(N298), .CP(clk), .Q(
        o_data_bus[11]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_10_ ( .D(N297), .CP(clk), .Q(
        o_data_bus[10]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_9_ ( .D(N296), .CP(clk), .Q(
        o_data_bus[9]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_8_ ( .D(N295), .CP(clk), .Q(
        o_data_bus[8]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_7_ ( .D(N294), .CP(clk), .Q(
        o_data_bus[7]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_6_ ( .D(N293), .CP(clk), .Q(
        o_data_bus[6]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_5_ ( .D(N292), .CP(clk), .Q(
        o_data_bus[5]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_4_ ( .D(N291), .CP(clk), .Q(
        o_data_bus[4]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_3_ ( .D(N290), .CP(clk), .Q(
        o_data_bus[3]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_2_ ( .D(N289), .CP(clk), .Q(
        o_data_bus[2]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_1_ ( .D(N288), .CP(clk), .Q(
        o_data_bus[1]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_0_ ( .D(N287), .CP(clk), .Q(
        o_data_bus[0]) );
  DFQD4BWP30P140 o_valid_inner_reg_1_ ( .D(N354), .CP(clk), .Q(o_valid[1]) );
  DFQD2BWP30P140 o_valid_inner_reg_0_ ( .D(N353), .CP(clk), .Q(o_valid[0]) );
  INVD1BWP30P140 U3 ( .I(n54), .ZN(n75) );
  INR2D1BWP30P140 U4 ( .A1(i_valid[0]), .B1(n49), .ZN(n45) );
  NR2D1BWP30P140 U5 ( .A1(n49), .A2(n33), .ZN(n5) );
  AN2D2BWP30P140 U6 ( .A1(n45), .A2(n33), .Z(n1) );
  INVD6BWP30P140 U7 ( .I(n75), .ZN(n88) );
  INVD4BWP30P140 U8 ( .I(n1), .ZN(n2) );
  INVD2BWP30P140 U9 ( .I(i_cmd[0]), .ZN(n33) );
  NR2D1BWP30P140 U10 ( .A1(n49), .A2(i_cmd[1]), .ZN(n53) );
  INVD1BWP30P140 U11 ( .I(i_valid[0]), .ZN(n51) );
  ND2D1BWP30P140 U12 ( .A1(n3), .A2(i_en), .ZN(n49) );
  INVD1BWP30P140 U13 ( .I(n34), .ZN(n43) );
  AN3D4BWP30P140 U14 ( .A1(i_valid[1]), .A2(i_cmd[1]), .A3(n46), .Z(n87) );
  OAI22D1BWP30P140 U15 ( .A1(n29), .A2(n9), .B1(n44), .B2(n89), .ZN(N295) );
  OAI22D1BWP30P140 U16 ( .A1(n32), .A2(n8), .B1(n44), .B2(n86), .ZN(N296) );
  OAI22D1BWP30P140 U17 ( .A1(n29), .A2(n7), .B1(n44), .B2(n85), .ZN(N297) );
  OAI22D1BWP30P140 U18 ( .A1(n32), .A2(n26), .B1(n44), .B2(n84), .ZN(N298) );
  OAI22D1BWP30P140 U19 ( .A1(n29), .A2(n25), .B1(n44), .B2(n83), .ZN(N299) );
  OAI22D1BWP30P140 U20 ( .A1(n32), .A2(n24), .B1(n44), .B2(n82), .ZN(N300) );
  OAI22D1BWP30P140 U21 ( .A1(n29), .A2(n15), .B1(n44), .B2(n81), .ZN(N301) );
  OAI22D1BWP30P140 U22 ( .A1(n32), .A2(n22), .B1(n44), .B2(n80), .ZN(N302) );
  OAI22D1BWP30P140 U23 ( .A1(n29), .A2(n31), .B1(n44), .B2(n79), .ZN(N303) );
  OAI22D1BWP30P140 U24 ( .A1(n32), .A2(n27), .B1(n44), .B2(n78), .ZN(N304) );
  OAI22D1BWP30P140 U25 ( .A1(n29), .A2(n16), .B1(n44), .B2(n77), .ZN(N305) );
  OAI22D1BWP30P140 U26 ( .A1(n32), .A2(n30), .B1(n44), .B2(n76), .ZN(N306) );
  OAI22D1BWP30P140 U27 ( .A1(n32), .A2(n23), .B1(n44), .B2(n74), .ZN(N307) );
  OAI22D1BWP30P140 U28 ( .A1(n29), .A2(n21), .B1(n2), .B2(n73), .ZN(N308) );
  OAI22D1BWP30P140 U29 ( .A1(n29), .A2(n28), .B1(n2), .B2(n72), .ZN(N309) );
  OAI22D1BWP30P140 U30 ( .A1(n32), .A2(n20), .B1(n2), .B2(n71), .ZN(N310) );
  OAI22D1BWP30P140 U31 ( .A1(n32), .A2(n19), .B1(n2), .B2(n70), .ZN(N311) );
  OAI22D1BWP30P140 U32 ( .A1(n29), .A2(n18), .B1(n2), .B2(n69), .ZN(N312) );
  OAI22D1BWP30P140 U33 ( .A1(n29), .A2(n17), .B1(n2), .B2(n68), .ZN(N313) );
  OAI22D1BWP30P140 U34 ( .A1(n32), .A2(n14), .B1(n2), .B2(n67), .ZN(N314) );
  OAI22D1BWP30P140 U35 ( .A1(n32), .A2(n13), .B1(n2), .B2(n66), .ZN(N315) );
  OAI22D1BWP30P140 U36 ( .A1(n29), .A2(n12), .B1(n2), .B2(n65), .ZN(N316) );
  OAI22D1BWP30P140 U37 ( .A1(n29), .A2(n11), .B1(n2), .B2(n64), .ZN(N317) );
  OAI22D1BWP30P140 U38 ( .A1(n32), .A2(n10), .B1(n2), .B2(n63), .ZN(N318) );
  INVD1BWP30P140 U39 ( .I(rst), .ZN(n3) );
  INVD2BWP30P140 U40 ( .I(i_valid[1]), .ZN(n50) );
  MUX2NUD1BWP30P140 U41 ( .I0(n51), .I1(n50), .S(i_cmd[1]), .ZN(n4) );
  ND2OPTIBD1BWP30P140 U42 ( .A1(n5), .A2(n4), .ZN(n6) );
  INVD2BWP30P140 U43 ( .I(n6), .ZN(n34) );
  INVD2BWP30P140 U44 ( .I(n34), .ZN(n32) );
  INVD1BWP30P140 U45 ( .I(i_data_bus[42]), .ZN(n7) );
  INVD1BWP30P140 U46 ( .I(i_data_bus[10]), .ZN(n85) );
  INVD1BWP30P140 U47 ( .I(i_data_bus[41]), .ZN(n8) );
  INVD1BWP30P140 U48 ( .I(i_data_bus[9]), .ZN(n86) );
  INVD1BWP30P140 U49 ( .I(i_data_bus[40]), .ZN(n9) );
  INVD1BWP30P140 U50 ( .I(i_data_bus[8]), .ZN(n89) );
  INVD2BWP30P140 U51 ( .I(n34), .ZN(n29) );
  INVD1BWP30P140 U52 ( .I(i_data_bus[63]), .ZN(n10) );
  INVD3BWP30P140 U53 ( .I(n1), .ZN(n44) );
  INVD1BWP30P140 U54 ( .I(i_data_bus[31]), .ZN(n63) );
  INVD1BWP30P140 U55 ( .I(i_data_bus[62]), .ZN(n11) );
  INVD1BWP30P140 U56 ( .I(i_data_bus[30]), .ZN(n64) );
  INVD1BWP30P140 U57 ( .I(i_data_bus[61]), .ZN(n12) );
  INVD1BWP30P140 U58 ( .I(i_data_bus[29]), .ZN(n65) );
  INVD1BWP30P140 U59 ( .I(i_data_bus[60]), .ZN(n13) );
  INVD1BWP30P140 U60 ( .I(i_data_bus[28]), .ZN(n66) );
  INVD1BWP30P140 U61 ( .I(i_data_bus[59]), .ZN(n14) );
  INVD1BWP30P140 U62 ( .I(i_data_bus[27]), .ZN(n67) );
  INVD1BWP30P140 U63 ( .I(i_data_bus[46]), .ZN(n15) );
  INVD1BWP30P140 U64 ( .I(i_data_bus[14]), .ZN(n81) );
  INVD1BWP30P140 U65 ( .I(i_data_bus[50]), .ZN(n16) );
  INVD1BWP30P140 U66 ( .I(i_data_bus[18]), .ZN(n77) );
  INVD1BWP30P140 U67 ( .I(i_data_bus[58]), .ZN(n17) );
  INVD1BWP30P140 U68 ( .I(i_data_bus[26]), .ZN(n68) );
  INVD1BWP30P140 U69 ( .I(i_data_bus[57]), .ZN(n18) );
  INVD1BWP30P140 U70 ( .I(i_data_bus[25]), .ZN(n69) );
  INVD1BWP30P140 U71 ( .I(i_data_bus[56]), .ZN(n19) );
  INVD1BWP30P140 U72 ( .I(i_data_bus[24]), .ZN(n70) );
  INVD1BWP30P140 U73 ( .I(i_data_bus[55]), .ZN(n20) );
  INVD1BWP30P140 U74 ( .I(i_data_bus[23]), .ZN(n71) );
  INVD1BWP30P140 U75 ( .I(i_data_bus[53]), .ZN(n21) );
  INVD1BWP30P140 U76 ( .I(i_data_bus[21]), .ZN(n73) );
  INVD1BWP30P140 U77 ( .I(i_data_bus[47]), .ZN(n22) );
  INVD1BWP30P140 U78 ( .I(i_data_bus[15]), .ZN(n80) );
  INVD1BWP30P140 U79 ( .I(i_data_bus[52]), .ZN(n23) );
  INVD1BWP30P140 U80 ( .I(i_data_bus[20]), .ZN(n74) );
  INVD1BWP30P140 U81 ( .I(i_data_bus[45]), .ZN(n24) );
  INVD1BWP30P140 U82 ( .I(i_data_bus[13]), .ZN(n82) );
  INVD1BWP30P140 U83 ( .I(i_data_bus[44]), .ZN(n25) );
  INVD1BWP30P140 U84 ( .I(i_data_bus[12]), .ZN(n83) );
  INVD1BWP30P140 U85 ( .I(i_data_bus[43]), .ZN(n26) );
  INVD1BWP30P140 U86 ( .I(i_data_bus[11]), .ZN(n84) );
  INVD1BWP30P140 U87 ( .I(i_data_bus[49]), .ZN(n27) );
  INVD1BWP30P140 U88 ( .I(i_data_bus[17]), .ZN(n78) );
  INVD1BWP30P140 U89 ( .I(i_data_bus[54]), .ZN(n28) );
  INVD1BWP30P140 U90 ( .I(i_data_bus[22]), .ZN(n72) );
  INVD1BWP30P140 U91 ( .I(i_data_bus[51]), .ZN(n30) );
  INVD1BWP30P140 U92 ( .I(i_data_bus[19]), .ZN(n76) );
  INVD1BWP30P140 U93 ( .I(i_data_bus[48]), .ZN(n31) );
  INVD1BWP30P140 U94 ( .I(i_data_bus[16]), .ZN(n79) );
  OAI31D1BWP30P140 U95 ( .A1(n49), .A2(n50), .A3(n33), .B(n2), .ZN(N353) );
  INVD1BWP30P140 U96 ( .I(i_data_bus[7]), .ZN(n57) );
  INVD1BWP30P140 U97 ( .I(i_data_bus[39]), .ZN(n35) );
  OAI22D1BWP30P140 U98 ( .A1(n2), .A2(n57), .B1(n43), .B2(n35), .ZN(N294) );
  INVD1BWP30P140 U99 ( .I(i_data_bus[6]), .ZN(n59) );
  INVD1BWP30P140 U100 ( .I(i_data_bus[38]), .ZN(n36) );
  OAI22D1BWP30P140 U101 ( .A1(n2), .A2(n59), .B1(n43), .B2(n36), .ZN(N293) );
  INVD1BWP30P140 U102 ( .I(i_data_bus[5]), .ZN(n56) );
  INVD1BWP30P140 U103 ( .I(i_data_bus[37]), .ZN(n37) );
  OAI22D1BWP30P140 U104 ( .A1(n2), .A2(n56), .B1(n43), .B2(n37), .ZN(N292) );
  INVD1BWP30P140 U105 ( .I(i_data_bus[4]), .ZN(n55) );
  INVD1BWP30P140 U106 ( .I(i_data_bus[36]), .ZN(n38) );
  OAI22D1BWP30P140 U107 ( .A1(n2), .A2(n55), .B1(n43), .B2(n38), .ZN(N291) );
  INVD1BWP30P140 U108 ( .I(i_data_bus[3]), .ZN(n58) );
  INVD1BWP30P140 U109 ( .I(i_data_bus[35]), .ZN(n39) );
  OAI22D1BWP30P140 U110 ( .A1(n2), .A2(n58), .B1(n43), .B2(n39), .ZN(N290) );
  INVD1BWP30P140 U111 ( .I(i_data_bus[2]), .ZN(n60) );
  INVD1BWP30P140 U112 ( .I(i_data_bus[34]), .ZN(n40) );
  OAI22D1BWP30P140 U113 ( .A1(n2), .A2(n60), .B1(n32), .B2(n40), .ZN(N289) );
  INVD1BWP30P140 U114 ( .I(i_data_bus[1]), .ZN(n62) );
  INVD1BWP30P140 U115 ( .I(i_data_bus[33]), .ZN(n41) );
  OAI22D1BWP30P140 U116 ( .A1(n2), .A2(n62), .B1(n29), .B2(n41), .ZN(N288) );
  INVD1BWP30P140 U117 ( .I(i_data_bus[0]), .ZN(n61) );
  INVD1BWP30P140 U118 ( .I(i_data_bus[32]), .ZN(n42) );
  OAI22D1BWP30P140 U119 ( .A1(n2), .A2(n61), .B1(n32), .B2(n42), .ZN(N287) );
  INVD1BWP30P140 U120 ( .I(n45), .ZN(n48) );
  INVD1BWP30P140 U121 ( .I(n49), .ZN(n46) );
  INVD1BWP30P140 U122 ( .I(n87), .ZN(n47) );
  OAI21D1BWP30P140 U123 ( .A1(n48), .A2(i_cmd[1]), .B(n47), .ZN(N354) );
  MUX2NUD1BWP30P140 U124 ( .I0(n51), .I1(n50), .S(i_cmd[0]), .ZN(n52) );
  ND2OPTIBD1BWP30P140 U125 ( .A1(n53), .A2(n52), .ZN(n54) );
  MOAI22D1BWP30P140 U126 ( .A1(n55), .A2(n88), .B1(i_data_bus[36]), .B2(n87), 
        .ZN(N323) );
  MOAI22D1BWP30P140 U127 ( .A1(n56), .A2(n88), .B1(i_data_bus[37]), .B2(n87), 
        .ZN(N324) );
  MOAI22D1BWP30P140 U128 ( .A1(n57), .A2(n88), .B1(i_data_bus[39]), .B2(n87), 
        .ZN(N326) );
  MOAI22D1BWP30P140 U129 ( .A1(n58), .A2(n88), .B1(i_data_bus[35]), .B2(n87), 
        .ZN(N322) );
  MOAI22D1BWP30P140 U130 ( .A1(n59), .A2(n88), .B1(i_data_bus[38]), .B2(n87), 
        .ZN(N325) );
  MOAI22D1BWP30P140 U131 ( .A1(n60), .A2(n88), .B1(i_data_bus[34]), .B2(n87), 
        .ZN(N321) );
  MOAI22D1BWP30P140 U132 ( .A1(n61), .A2(n88), .B1(i_data_bus[32]), .B2(n87), 
        .ZN(N319) );
  MOAI22D1BWP30P140 U133 ( .A1(n62), .A2(n88), .B1(i_data_bus[33]), .B2(n87), 
        .ZN(N320) );
  MOAI22D1BWP30P140 U134 ( .A1(n63), .A2(n88), .B1(i_data_bus[63]), .B2(n87), 
        .ZN(N350) );
  MOAI22D1BWP30P140 U135 ( .A1(n64), .A2(n88), .B1(i_data_bus[62]), .B2(n87), 
        .ZN(N349) );
  MOAI22D1BWP30P140 U136 ( .A1(n65), .A2(n88), .B1(i_data_bus[61]), .B2(n87), 
        .ZN(N348) );
  MOAI22D1BWP30P140 U137 ( .A1(n66), .A2(n88), .B1(i_data_bus[60]), .B2(n87), 
        .ZN(N347) );
  MOAI22D1BWP30P140 U138 ( .A1(n67), .A2(n88), .B1(i_data_bus[59]), .B2(n87), 
        .ZN(N346) );
  MOAI22D1BWP30P140 U139 ( .A1(n68), .A2(n88), .B1(i_data_bus[58]), .B2(n87), 
        .ZN(N345) );
  MOAI22D1BWP30P140 U140 ( .A1(n69), .A2(n88), .B1(i_data_bus[57]), .B2(n87), 
        .ZN(N344) );
  MOAI22D1BWP30P140 U141 ( .A1(n70), .A2(n88), .B1(i_data_bus[56]), .B2(n87), 
        .ZN(N343) );
  MOAI22D1BWP30P140 U142 ( .A1(n71), .A2(n88), .B1(i_data_bus[55]), .B2(n87), 
        .ZN(N342) );
  MOAI22D1BWP30P140 U143 ( .A1(n72), .A2(n88), .B1(i_data_bus[54]), .B2(n87), 
        .ZN(N341) );
  MOAI22D1BWP30P140 U144 ( .A1(n73), .A2(n88), .B1(i_data_bus[53]), .B2(n87), 
        .ZN(N340) );
  MOAI22D1BWP30P140 U145 ( .A1(n74), .A2(n88), .B1(i_data_bus[52]), .B2(n87), 
        .ZN(N339) );
  MOAI22D1BWP30P140 U146 ( .A1(n76), .A2(n88), .B1(i_data_bus[51]), .B2(n87), 
        .ZN(N338) );
  MOAI22D1BWP30P140 U147 ( .A1(n77), .A2(n88), .B1(i_data_bus[50]), .B2(n87), 
        .ZN(N337) );
  MOAI22D1BWP30P140 U148 ( .A1(n78), .A2(n88), .B1(i_data_bus[49]), .B2(n87), 
        .ZN(N336) );
  MOAI22D1BWP30P140 U149 ( .A1(n79), .A2(n88), .B1(i_data_bus[48]), .B2(n87), 
        .ZN(N335) );
  MOAI22D1BWP30P140 U150 ( .A1(n80), .A2(n88), .B1(i_data_bus[47]), .B2(n87), 
        .ZN(N334) );
  MOAI22D1BWP30P140 U151 ( .A1(n81), .A2(n88), .B1(i_data_bus[46]), .B2(n87), 
        .ZN(N333) );
  MOAI22D1BWP30P140 U152 ( .A1(n82), .A2(n88), .B1(i_data_bus[45]), .B2(n87), 
        .ZN(N332) );
  MOAI22D1BWP30P140 U153 ( .A1(n83), .A2(n88), .B1(i_data_bus[44]), .B2(n87), 
        .ZN(N331) );
  MOAI22D1BWP30P140 U154 ( .A1(n84), .A2(n88), .B1(i_data_bus[43]), .B2(n87), 
        .ZN(N330) );
  MOAI22D1BWP30P140 U155 ( .A1(n85), .A2(n88), .B1(i_data_bus[42]), .B2(n87), 
        .ZN(N329) );
  MOAI22D1BWP30P140 U156 ( .A1(n86), .A2(n88), .B1(i_data_bus[41]), .B2(n87), 
        .ZN(N328) );
  MOAI22D1BWP30P140 U157 ( .A1(n89), .A2(n88), .B1(i_data_bus[40]), .B2(n87), 
        .ZN(N327) );
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
         N342, N343, N344, N345, N346, N347, N348, N349, N350, N353, N354,
         net17970, net17971, net17973, net17986, net17992, net17996, net18030,
         net18032, net18034, net18035, net18037, net18039, net18048, net18058,
         net18071, net18074, net18079, net18307, net18310, net18313, net18062,
         net18061, net18038, net18064, net18063, net18059, net18055, net18054,
         net18053, net18052, n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12,
         n13, n14, n15, n30, n31, n32, n33, n34, n35, n36, n37, n38, n39, n40,
         n41, n42, n43, n44, n45, n46, n47, n48, n49, n50, n51, n52, n53, n54,
         n55, n56, n57, n58, n59, n60, n61, n62, n63, n64, n65, n66, n67, n68,
         n69, n70, n71, n72, n73, n74, n75, n76, n77, n78, n79, n80, n81, n82,
         n83, n84, n85, n86, n87, n88;

  DFQD1BWP30P140 o_data_bus_inner_reg_30_ ( .D(N317), .CP(clk), .Q(
        o_data_bus[30]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_28_ ( .D(N315), .CP(clk), .Q(
        o_data_bus[28]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_26_ ( .D(N313), .CP(clk), .Q(
        o_data_bus[26]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_23_ ( .D(N310), .CP(clk), .Q(
        o_data_bus[23]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_20_ ( .D(N307), .CP(clk), .Q(
        o_data_bus[20]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_19_ ( .D(N306), .CP(clk), .Q(
        o_data_bus[19]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_18_ ( .D(N305), .CP(clk), .Q(
        o_data_bus[18]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_17_ ( .D(N304), .CP(clk), .Q(
        o_data_bus[17]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_14_ ( .D(N301), .CP(clk), .Q(
        o_data_bus[14]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_12_ ( .D(N299), .CP(clk), .Q(
        o_data_bus[12]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_9_ ( .D(N296), .CP(clk), .Q(
        o_data_bus[9]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_8_ ( .D(N295), .CP(clk), .Q(
        o_data_bus[8]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_7_ ( .D(N294), .CP(clk), .Q(
        o_data_bus[7]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_6_ ( .D(N293), .CP(clk), .Q(
        o_data_bus[6]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_5_ ( .D(N292), .CP(clk), .Q(
        o_data_bus[5]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_4_ ( .D(N291), .CP(clk), .Q(
        o_data_bus[4]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_3_ ( .D(N290), .CP(clk), .Q(
        o_data_bus[3]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_1_ ( .D(N288), .CP(clk), .Q(
        o_data_bus[1]) );
  DFQD4BWP30P140 o_valid_inner_reg_0_ ( .D(N353), .CP(clk), .Q(o_valid[0]) );
  DFD1BWP30P140 o_data_bus_inner_reg_63_ ( .D(N350), .CP(clk), .Q(
        o_data_bus[63]) );
  DFD1BWP30P140 o_data_bus_inner_reg_61_ ( .D(N348), .CP(clk), .Q(
        o_data_bus[61]) );
  DFD1BWP30P140 o_data_bus_inner_reg_59_ ( .D(N346), .CP(clk), .Q(
        o_data_bus[59]) );
  DFD1BWP30P140 o_data_bus_inner_reg_57_ ( .D(N344), .CP(clk), .Q(
        o_data_bus[57]) );
  DFD1BWP30P140 o_data_bus_inner_reg_55_ ( .D(N342), .CP(clk), .Q(
        o_data_bus[55]) );
  DFD1BWP30P140 o_data_bus_inner_reg_53_ ( .D(N340), .CP(clk), .Q(
        o_data_bus[53]) );
  DFD1BWP30P140 o_data_bus_inner_reg_48_ ( .D(N335), .CP(clk), .Q(
        o_data_bus[48]) );
  DFD1BWP30P140 o_data_bus_inner_reg_46_ ( .D(N333), .CP(clk), .Q(
        o_data_bus[46]) );
  DFD1BWP30P140 o_data_bus_inner_reg_44_ ( .D(N331), .CP(clk), .Q(
        o_data_bus[44]) );
  DFD1BWP30P140 o_data_bus_inner_reg_42_ ( .D(N329), .CP(clk), .Q(
        o_data_bus[42]) );
  DFD1BWP30P140 o_data_bus_inner_reg_34_ ( .D(N321), .CP(clk), .Q(
        o_data_bus[34]) );
  DFD1BWP30P140 o_data_bus_inner_reg_40_ ( .D(N327), .CP(clk), .Q(
        o_data_bus[40]) );
  DFD1BWP30P140 o_data_bus_inner_reg_38_ ( .D(N325), .CP(clk), .Q(
        o_data_bus[38]) );
  DFD1BWP30P140 o_data_bus_inner_reg_36_ ( .D(N323), .CP(clk), .Q(
        o_data_bus[36]) );
  DFD1BWP30P140 o_data_bus_inner_reg_49_ ( .D(N336), .CP(clk), .Q(
        o_data_bus[49]) );
  DFD1BWP30P140 o_data_bus_inner_reg_51_ ( .D(N338), .CP(clk), .Q(
        o_data_bus[51]) );
  DFD1BWP30P140 o_data_bus_inner_reg_0_ ( .D(N287), .CP(clk), .Q(o_data_bus[0]) );
  DFD1BWP30P140 o_data_bus_inner_reg_2_ ( .D(N289), .CP(clk), .Q(o_data_bus[2]) );
  DFD1BWP30P140 o_data_bus_inner_reg_11_ ( .D(N298), .CP(clk), .Q(
        o_data_bus[11]) );
  DFD1BWP30P140 o_data_bus_inner_reg_16_ ( .D(N303), .CP(clk), .Q(
        o_data_bus[16]) );
  DFD1BWP30P140 o_data_bus_inner_reg_22_ ( .D(N309), .CP(clk), .Q(
        o_data_bus[22]) );
  DFD1BWP30P140 o_data_bus_inner_reg_25_ ( .D(N312), .CP(clk), .Q(
        o_data_bus[25]) );
  DFD1BWP30P140 o_data_bus_inner_reg_29_ ( .D(N316), .CP(clk), .Q(
        o_data_bus[29]) );
  DFD1BWP30P140 o_data_bus_inner_reg_52_ ( .D(N339), .CP(clk), .Q(
        o_data_bus[52]) );
  DFD1BWP30P140 o_data_bus_inner_reg_45_ ( .D(N332), .CP(clk), .Q(
        o_data_bus[45]) );
  DFQD2BWP30P140 o_valid_inner_reg_1_ ( .D(N354), .CP(clk), .Q(o_valid[1]) );
  DFD1BWP30P140 o_data_bus_inner_reg_10_ ( .D(N297), .CP(clk), .Q(
        o_data_bus[10]) );
  DFD1BWP30P140 o_data_bus_inner_reg_13_ ( .D(N300), .CP(clk), .Q(
        o_data_bus[13]) );
  DFD1BWP30P140 o_data_bus_inner_reg_15_ ( .D(N302), .CP(clk), .Q(
        o_data_bus[15]) );
  DFD1BWP30P140 o_data_bus_inner_reg_21_ ( .D(N308), .CP(clk), .Q(
        o_data_bus[21]) );
  DFD1BWP30P140 o_data_bus_inner_reg_24_ ( .D(N311), .CP(clk), .Q(
        o_data_bus[24]) );
  DFD1BWP30P140 o_data_bus_inner_reg_27_ ( .D(N314), .CP(clk), .Q(
        o_data_bus[27]) );
  DFD1BWP30P140 o_data_bus_inner_reg_31_ ( .D(N318), .CP(clk), .Q(
        o_data_bus[31]) );
  DFD1BWP30P140 o_data_bus_inner_reg_39_ ( .D(N326), .CP(clk), .Q(
        o_data_bus[39]) );
  DFD1BWP30P140 o_data_bus_inner_reg_32_ ( .D(N319), .CP(clk), .Q(
        o_data_bus[32]) );
  DFD1BWP30P140 o_data_bus_inner_reg_33_ ( .D(N320), .CP(clk), .Q(
        o_data_bus[33]) );
  DFD1BWP30P140 o_data_bus_inner_reg_37_ ( .D(N324), .CP(clk), .Q(
        o_data_bus[37]) );
  DFD1BWP30P140 o_data_bus_inner_reg_35_ ( .D(N322), .CP(clk), .Q(
        o_data_bus[35]) );
  DFD1BWP30P140 o_data_bus_inner_reg_47_ ( .D(N334), .CP(clk), .Q(
        o_data_bus[47]) );
  DFD1BWP30P140 o_data_bus_inner_reg_62_ ( .D(N349), .CP(clk), .Q(
        o_data_bus[62]) );
  DFD1BWP30P140 o_data_bus_inner_reg_56_ ( .D(N343), .CP(clk), .Q(
        o_data_bus[56]) );
  DFD1BWP30P140 o_data_bus_inner_reg_58_ ( .D(N345), .CP(clk), .Q(
        o_data_bus[58]) );
  DFD1BWP30P140 o_data_bus_inner_reg_60_ ( .D(N347), .CP(clk), .Q(
        o_data_bus[60]) );
  DFD1BWP30P140 o_data_bus_inner_reg_54_ ( .D(N341), .CP(clk), .Q(
        o_data_bus[54]) );
  DFD1BWP30P140 o_data_bus_inner_reg_41_ ( .D(N328), .CP(clk), .Q(
        o_data_bus[41]) );
  DFD1BWP30P140 o_data_bus_inner_reg_43_ ( .D(N330), .CP(clk), .Q(
        o_data_bus[43]) );
  DFD1BWP30P140 o_data_bus_inner_reg_50_ ( .D(N337), .CP(clk), .Q(
        o_data_bus[50]) );
  INVD3BWP30P140 U3 ( .I(net18048), .ZN(net18313) );
  INVD4BWP30P140 U4 ( .I(net17992), .ZN(net17973) );
  INVD4BWP30P140 U5 ( .I(net18048), .ZN(net17986) );
  INVD8BWP30P140 U6 ( .I(n8), .ZN(net17996) );
  CKND2D4BWP30P140 U7 ( .A1(net18052), .A2(net18053), .ZN(n8) );
  INVD2BWP30P140 U8 ( .I(net18079), .ZN(net18071) );
  INVD2BWP30P140 U9 ( .I(net18054), .ZN(net18053) );
  CKND2D2BWP30P140 U10 ( .A1(net18038), .A2(net18064), .ZN(net18063) );
  ND2D2BWP30P140 U11 ( .A1(net18062), .A2(i_cmd[1]), .ZN(net18074) );
  NR2D2BWP30P140 U12 ( .A1(i_valid[0]), .A2(i_cmd[1]), .ZN(net18079) );
  INVD2BWP30P140 U13 ( .I(i_valid[1]), .ZN(net18062) );
  CKND2D2BWP30P140 U14 ( .A1(i_valid[0]), .A2(net18064), .ZN(n3) );
  INVD2BWP30P140 U15 ( .I(n3), .ZN(net18039) );
  INVD4BWP30P140 U16 ( .I(net17992), .ZN(n1) );
  INVD2BWP30P140 U17 ( .I(net18055), .ZN(net18052) );
  INVD2BWP30P140 U18 ( .I(i_cmd[0]), .ZN(net18032) );
  INVD2BWP30P140 U19 ( .I(n2), .ZN(net18307) );
  ND2OPTIBD2BWP30P140 U20 ( .A1(i_cmd[0]), .A2(net18064), .ZN(n2) );
  ND2OPTIBD6BWP30P140 U21 ( .A1(net18039), .A2(net18032), .ZN(net17992) );
  BUFFD4BWP30P140 U22 ( .I(net17992), .Z(n4) );
  CKND2D4BWP30P140 U23 ( .A1(net18059), .A2(n5), .ZN(net18058) );
  CKND2D3BWP30P140 U24 ( .A1(n6), .A2(n5), .ZN(net18310) );
  MUX2NOPTD4BWP30P140 U25 ( .I0(net18061), .I1(net18062), .S(i_cmd[0]), .ZN(n5) );
  INVD2BWP30P140 U26 ( .I(net18063), .ZN(n6) );
  MOAI22D1BWP30P140 U27 ( .A1(n7), .A2(net18058), .B1(i_data_bus[50]), .B2(
        net17996), .ZN(N337) );
  INVD1BWP30P140 U28 ( .I(i_data_bus[18]), .ZN(n7) );
  INVD1BWP30P140 U29 ( .I(net18063), .ZN(net18059) );
  INVD1BWP30P140 U30 ( .I(i_data_bus[50]), .ZN(n9) );
  OAI21D1BWP30P140 U31 ( .A1(net18034), .A2(net18035), .B(n8), .ZN(N354) );
  INVD2BWP30P140 U32 ( .I(i_cmd[1]), .ZN(net18054) );
  CKND2D2BWP30P140 U33 ( .A1(i_valid[1]), .A2(net18064), .ZN(net18055) );
  INVD1BWP30P140 U34 ( .I(net18030), .ZN(net18064) );
  MOAI22D1BWP30P140 U35 ( .A1(net17986), .A2(n9), .B1(net17973), .B2(
        i_data_bus[18]), .ZN(N305) );
  INVD2BWP30P140 U36 ( .I(i_cmd[1]), .ZN(net18038) );
  OAI31D1BWP30P140 U37 ( .A1(net18030), .A2(net18062), .A3(net18032), .B(n4), 
        .ZN(N353) );
  MOAI22D1BWP30P140 U38 ( .A1(n11), .A2(net18058), .B1(i_data_bus[56]), .B2(
        net17996), .ZN(N343) );
  INVD1BWP30P140 U39 ( .I(i_data_bus[24]), .ZN(n11) );
  INVD1BWP30P140 U40 ( .I(i_data_bus[56]), .ZN(n10) );
  MOAI22D1BWP30P140 U41 ( .A1(net17971), .A2(n10), .B1(net17973), .B2(
        i_data_bus[24]), .ZN(N311) );
  MOAI22D1BWP30P140 U42 ( .A1(n13), .A2(net18058), .B1(i_data_bus[58]), .B2(
        net17996), .ZN(N345) );
  INVD1BWP30P140 U43 ( .I(i_data_bus[26]), .ZN(n13) );
  INVD1BWP30P140 U44 ( .I(i_data_bus[58]), .ZN(n12) );
  MOAI22D1BWP30P140 U45 ( .A1(net17986), .A2(n12), .B1(n1), .B2(i_data_bus[26]), .ZN(N313) );
  MOAI22D1BWP30P140 U46 ( .A1(n15), .A2(net18058), .B1(i_data_bus[60]), .B2(
        net17996), .ZN(N347) );
  INVD1BWP30P140 U47 ( .I(i_data_bus[28]), .ZN(n15) );
  INVD1BWP30P140 U48 ( .I(i_data_bus[60]), .ZN(n14) );
  MOAI22D1BWP30P140 U49 ( .A1(net17986), .A2(n14), .B1(net17973), .B2(
        i_data_bus[28]), .ZN(N315) );
  INVD2BWP30P140 U50 ( .I(i_valid[0]), .ZN(net18061) );
  BUFFD1BWP30P140 U51 ( .I(net18038), .Z(net18037) );
  ND2D1BWP30P140 U52 ( .A1(n30), .A2(i_en), .ZN(net18030) );
  INVD1BWP30P140 U53 ( .I(net18037), .ZN(net18035) );
  MOAI22D1BWP30P140 U54 ( .A1(n41), .A2(net18310), .B1(i_data_bus[63]), .B2(
        net17996), .ZN(N350) );
  OAI22D1BWP30P140 U55 ( .A1(net18313), .A2(n78), .B1(n4), .B2(n61), .ZN(N301)
         );
  ND2OPTIBD1BWP30P140 U56 ( .A1(n38), .A2(n37), .ZN(N306) );
  ND2OPTIBD1BWP30P140 U57 ( .A1(n1), .A2(i_data_bus[19]), .ZN(n37) );
  ND2D1BWP30P140 U58 ( .A1(net18048), .A2(i_data_bus[51]), .ZN(n38) );
  MOAI22D1BWP30P140 U59 ( .A1(net18313), .A2(n40), .B1(n1), .B2(i_data_bus[20]), .ZN(N307) );
  INR2D8BWP30P140 U60 ( .A1(net18071), .B1(n31), .ZN(net18048) );
  OAI22D1BWP30P140 U61 ( .A1(net17971), .A2(n39), .B1(n4), .B2(n55), .ZN(N295)
         );
  MOAI22D1BWP30P140 U62 ( .A1(net17986), .A2(n34), .B1(net17973), .B2(
        i_data_bus[30]), .ZN(N317) );
  ND2OPTPAD4BWP30P140 U63 ( .A1(net18307), .A2(net18074), .ZN(n31) );
  OAI22D1BWP30P140 U64 ( .A1(net17971), .A2(n82), .B1(n4), .B2(n59), .ZN(N299)
         );
  INVD4BWP30P140 U65 ( .I(net18048), .ZN(net17971) );
  MOAI22D1BWP30P140 U66 ( .A1(net17986), .A2(n43), .B1(net17970), .B2(
        i_data_bus[7]), .ZN(N294) );
  MOAI22D1BWP30P140 U67 ( .A1(net17986), .A2(n33), .B1(net17973), .B2(
        i_data_bus[6]), .ZN(N293) );
  MOAI22D1BWP30P140 U68 ( .A1(net17986), .A2(n46), .B1(n1), .B2(i_data_bus[5]), 
        .ZN(N292) );
  MOAI22D1BWP30P140 U69 ( .A1(net17986), .A2(n45), .B1(net17970), .B2(
        i_data_bus[4]), .ZN(N291) );
  MOAI22D1BWP30P140 U70 ( .A1(net17986), .A2(n44), .B1(net17973), .B2(
        i_data_bus[3]), .ZN(N290) );
  MOAI22D1BWP30P140 U71 ( .A1(net17986), .A2(n35), .B1(n1), .B2(i_data_bus[17]), .ZN(N304) );
  MOAI22D1BWP30P140 U72 ( .A1(net17971), .A2(n42), .B1(net17973), .B2(
        i_data_bus[31]), .ZN(N318) );
  INVD1BWP30P140 U73 ( .I(rst), .ZN(n30) );
  INVD1BWP30P140 U74 ( .I(i_data_bus[61]), .ZN(n32) );
  MOAI22D1BWP30P140 U75 ( .A1(net17971), .A2(n32), .B1(net17973), .B2(
        i_data_bus[29]), .ZN(N316) );
  INVD1BWP30P140 U76 ( .I(i_data_bus[6]), .ZN(n53) );
  INVD1BWP30P140 U77 ( .I(i_data_bus[38]), .ZN(n33) );
  INVD1BWP30P140 U78 ( .I(i_data_bus[62]), .ZN(n34) );
  INVD1BWP30P140 U79 ( .I(i_data_bus[30]), .ZN(n72) );
  INVD1BWP30P140 U80 ( .I(i_data_bus[49]), .ZN(n35) );
  INVD1BWP30P140 U81 ( .I(i_data_bus[17]), .ZN(n47) );
  INVD1BWP30P140 U82 ( .I(i_data_bus[0]), .ZN(n36) );
  MOAI22D1BWP30P140 U83 ( .A1(n36), .A2(net18058), .B1(i_data_bus[32]), .B2(
        net17996), .ZN(N319) );
  INVD1BWP30P140 U84 ( .I(i_data_bus[19]), .ZN(n64) );
  INVD1BWP30P140 U85 ( .I(i_data_bus[40]), .ZN(n39) );
  INVD1BWP30P140 U86 ( .I(i_data_bus[52]), .ZN(n40) );
  INVD1BWP30P140 U87 ( .I(i_data_bus[31]), .ZN(n41) );
  INVD1BWP30P140 U88 ( .I(i_data_bus[63]), .ZN(n42) );
  INVD1BWP30P140 U89 ( .I(net18039), .ZN(net18034) );
  INVD1BWP30P140 U90 ( .I(i_data_bus[7]), .ZN(n54) );
  INVD1BWP30P140 U91 ( .I(i_data_bus[39]), .ZN(n43) );
  INVD1BWP30P140 U92 ( .I(i_data_bus[3]), .ZN(n50) );
  INVD1BWP30P140 U93 ( .I(i_data_bus[35]), .ZN(n44) );
  INVD1BWP30P140 U94 ( .I(i_data_bus[4]), .ZN(n51) );
  INVD1BWP30P140 U95 ( .I(i_data_bus[36]), .ZN(n45) );
  INVD1BWP30P140 U96 ( .I(i_data_bus[5]), .ZN(n52) );
  INVD1BWP30P140 U97 ( .I(i_data_bus[37]), .ZN(n46) );
  MOAI22D1BWP30P140 U98 ( .A1(n47), .A2(net18310), .B1(i_data_bus[49]), .B2(
        net17996), .ZN(N336) );
  INVD1BWP30P140 U99 ( .I(i_data_bus[1]), .ZN(n48) );
  MOAI22D1BWP30P140 U100 ( .A1(n48), .A2(net18058), .B1(i_data_bus[33]), .B2(
        net17996), .ZN(N320) );
  INVD1BWP30P140 U101 ( .I(i_data_bus[2]), .ZN(n49) );
  MOAI22D1BWP30P140 U102 ( .A1(n49), .A2(net18310), .B1(i_data_bus[34]), .B2(
        net17996), .ZN(N321) );
  MOAI22D1BWP30P140 U103 ( .A1(n50), .A2(net18058), .B1(i_data_bus[35]), .B2(
        net17996), .ZN(N322) );
  MOAI22D1BWP30P140 U104 ( .A1(n51), .A2(net18310), .B1(i_data_bus[36]), .B2(
        net17996), .ZN(N323) );
  MOAI22D1BWP30P140 U105 ( .A1(n52), .A2(net18058), .B1(i_data_bus[37]), .B2(
        net17996), .ZN(N324) );
  MOAI22D1BWP30P140 U106 ( .A1(n53), .A2(net18310), .B1(i_data_bus[38]), .B2(
        net17996), .ZN(N325) );
  MOAI22D1BWP30P140 U107 ( .A1(n54), .A2(net18058), .B1(i_data_bus[39]), .B2(
        net17996), .ZN(N326) );
  INVD1BWP30P140 U108 ( .I(i_data_bus[8]), .ZN(n55) );
  MOAI22D1BWP30P140 U109 ( .A1(n55), .A2(net18310), .B1(i_data_bus[40]), .B2(
        net17996), .ZN(N327) );
  INVD1BWP30P140 U110 ( .I(i_data_bus[9]), .ZN(n56) );
  MOAI22D1BWP30P140 U111 ( .A1(n56), .A2(net18058), .B1(i_data_bus[41]), .B2(
        net17996), .ZN(N328) );
  INVD1BWP30P140 U112 ( .I(i_data_bus[10]), .ZN(n57) );
  MOAI22D1BWP30P140 U113 ( .A1(n57), .A2(net18310), .B1(i_data_bus[42]), .B2(
        net17996), .ZN(N329) );
  INVD1BWP30P140 U114 ( .I(i_data_bus[11]), .ZN(n58) );
  MOAI22D1BWP30P140 U115 ( .A1(n58), .A2(net18058), .B1(i_data_bus[43]), .B2(
        net17996), .ZN(N330) );
  INVD1BWP30P140 U116 ( .I(i_data_bus[12]), .ZN(n59) );
  MOAI22D1BWP30P140 U117 ( .A1(n59), .A2(net18310), .B1(i_data_bus[44]), .B2(
        net17996), .ZN(N331) );
  INVD1BWP30P140 U118 ( .I(i_data_bus[13]), .ZN(n60) );
  MOAI22D1BWP30P140 U119 ( .A1(n60), .A2(net18058), .B1(i_data_bus[45]), .B2(
        net17996), .ZN(N332) );
  INVD1BWP30P140 U120 ( .I(i_data_bus[14]), .ZN(n61) );
  MOAI22D1BWP30P140 U121 ( .A1(n61), .A2(net18310), .B1(i_data_bus[46]), .B2(
        net17996), .ZN(N333) );
  INVD1BWP30P140 U122 ( .I(i_data_bus[15]), .ZN(n62) );
  MOAI22D1BWP30P140 U123 ( .A1(n62), .A2(net18058), .B1(i_data_bus[47]), .B2(
        net17996), .ZN(N334) );
  INVD1BWP30P140 U124 ( .I(i_data_bus[16]), .ZN(n63) );
  MOAI22D1BWP30P140 U125 ( .A1(n63), .A2(net18310), .B1(i_data_bus[48]), .B2(
        net17996), .ZN(N335) );
  MOAI22D1BWP30P140 U126 ( .A1(n64), .A2(net18310), .B1(i_data_bus[51]), .B2(
        net17996), .ZN(N338) );
  INVD1BWP30P140 U127 ( .I(i_data_bus[20]), .ZN(n65) );
  MOAI22D1BWP30P140 U128 ( .A1(n65), .A2(net18058), .B1(i_data_bus[52]), .B2(
        net17996), .ZN(N339) );
  INVD1BWP30P140 U129 ( .I(i_data_bus[21]), .ZN(n66) );
  MOAI22D1BWP30P140 U130 ( .A1(n66), .A2(net18310), .B1(i_data_bus[53]), .B2(
        net17996), .ZN(N340) );
  INVD1BWP30P140 U131 ( .I(i_data_bus[22]), .ZN(n67) );
  MOAI22D1BWP30P140 U132 ( .A1(n67), .A2(net18058), .B1(i_data_bus[54]), .B2(
        net17996), .ZN(N341) );
  INVD1BWP30P140 U133 ( .I(i_data_bus[23]), .ZN(n68) );
  MOAI22D1BWP30P140 U134 ( .A1(n68), .A2(net18310), .B1(i_data_bus[55]), .B2(
        net17996), .ZN(N342) );
  INVD1BWP30P140 U135 ( .I(i_data_bus[25]), .ZN(n69) );
  MOAI22D1BWP30P140 U136 ( .A1(n69), .A2(net18310), .B1(i_data_bus[57]), .B2(
        net17996), .ZN(N344) );
  INVD1BWP30P140 U137 ( .I(i_data_bus[27]), .ZN(n70) );
  MOAI22D1BWP30P140 U138 ( .A1(n70), .A2(net18310), .B1(i_data_bus[59]), .B2(
        net17996), .ZN(N346) );
  INVD1BWP30P140 U139 ( .I(i_data_bus[29]), .ZN(n71) );
  MOAI22D1BWP30P140 U140 ( .A1(n71), .A2(net18310), .B1(i_data_bus[61]), .B2(
        net17996), .ZN(N348) );
  MOAI22D1BWP30P140 U141 ( .A1(n72), .A2(net18058), .B1(i_data_bus[62]), .B2(
        net17996), .ZN(N349) );
  INVD1BWP30P140 U142 ( .I(i_data_bus[48]), .ZN(n73) );
  INVD4BWP30P140 U143 ( .I(net17992), .ZN(net17970) );
  MOAI22D1BWP30P140 U144 ( .A1(net18313), .A2(n73), .B1(net17970), .B2(
        i_data_bus[16]), .ZN(N303) );
  INVD1BWP30P140 U145 ( .I(i_data_bus[34]), .ZN(n74) );
  MOAI22D1BWP30P140 U146 ( .A1(net18313), .A2(n74), .B1(net17970), .B2(
        i_data_bus[2]), .ZN(N289) );
  INVD1BWP30P140 U147 ( .I(i_data_bus[59]), .ZN(n75) );
  MOAI22D1BWP30P140 U148 ( .A1(net17971), .A2(n75), .B1(net17973), .B2(
        i_data_bus[27]), .ZN(N314) );
  INVD1BWP30P140 U149 ( .I(i_data_bus[47]), .ZN(n76) );
  MOAI22D1BWP30P140 U150 ( .A1(net17971), .A2(n76), .B1(net17970), .B2(
        i_data_bus[15]), .ZN(N302) );
  INVD1BWP30P140 U151 ( .I(i_data_bus[33]), .ZN(n77) );
  MOAI22D1BWP30P140 U152 ( .A1(net17986), .A2(n77), .B1(n1), .B2(i_data_bus[1]), .ZN(N288) );
  INVD1BWP30P140 U153 ( .I(i_data_bus[46]), .ZN(n78) );
  INVD1BWP30P140 U154 ( .I(i_data_bus[32]), .ZN(n79) );
  MOAI22D1BWP30P140 U155 ( .A1(net18313), .A2(n79), .B1(net17973), .B2(
        i_data_bus[0]), .ZN(N287) );
  INVD1BWP30P140 U156 ( .I(i_data_bus[57]), .ZN(n80) );
  MOAI22D1BWP30P140 U157 ( .A1(net18313), .A2(n80), .B1(net17970), .B2(
        i_data_bus[25]), .ZN(N312) );
  INVD1BWP30P140 U158 ( .I(i_data_bus[45]), .ZN(n81) );
  MOAI22D1BWP30P140 U159 ( .A1(net17971), .A2(n81), .B1(n1), .B2(
        i_data_bus[13]), .ZN(N300) );
  INVD1BWP30P140 U160 ( .I(i_data_bus[44]), .ZN(n82) );
  INVD1BWP30P140 U161 ( .I(i_data_bus[55]), .ZN(n83) );
  MOAI22D1BWP30P140 U162 ( .A1(net17986), .A2(n83), .B1(n1), .B2(
        i_data_bus[23]), .ZN(N310) );
  INVD1BWP30P140 U163 ( .I(i_data_bus[43]), .ZN(n84) );
  MOAI22D1BWP30P140 U164 ( .A1(net18313), .A2(n84), .B1(net17973), .B2(
        i_data_bus[11]), .ZN(N298) );
  INVD1BWP30P140 U165 ( .I(i_data_bus[54]), .ZN(n85) );
  MOAI22D1BWP30P140 U166 ( .A1(net18313), .A2(n85), .B1(net17970), .B2(
        i_data_bus[22]), .ZN(N309) );
  INVD1BWP30P140 U167 ( .I(i_data_bus[42]), .ZN(n86) );
  MOAI22D1BWP30P140 U168 ( .A1(net17971), .A2(n86), .B1(n1), .B2(
        i_data_bus[10]), .ZN(N297) );
  INVD1BWP30P140 U169 ( .I(i_data_bus[53]), .ZN(n87) );
  MOAI22D1BWP30P140 U170 ( .A1(net17971), .A2(n87), .B1(net17973), .B2(
        i_data_bus[21]), .ZN(N308) );
  INVD1BWP30P140 U171 ( .I(i_data_bus[41]), .ZN(n88) );
  MOAI22D1BWP30P140 U172 ( .A1(net17986), .A2(n88), .B1(net17970), .B2(
        i_data_bus[9]), .ZN(N296) );
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
         N342, N343, N344, N345, N346, N347, N348, N349, N350, N354, n1, n2,
         n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16, n17,
         n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30, n31,
         n32, n33, n34, n35, n36, n37, n38, n39, n40, n41, n42, n43, n44, n45,
         n46, n47, n48, n49, n50, n51, n52, n53, n54, n55, n56, n57, n58, n59,
         n60, n61, n62, n63, n64, n65, n66, n67, n68, n69, n70, n71, n72, n73,
         n74, n75, n76, n77, n78, n79, n80, n81, n82, n83, n84, n85, n86, n87,
         n88, n89, n90, n91, n92, n93, n94, n95, n96, n97, n98;

  DFQD1BWP30P140 o_data_bus_inner_reg_31_ ( .D(N318), .CP(clk), .Q(
        o_data_bus[31]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_30_ ( .D(N317), .CP(clk), .Q(
        o_data_bus[30]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_29_ ( .D(N316), .CP(clk), .Q(
        o_data_bus[29]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_28_ ( .D(N315), .CP(clk), .Q(
        o_data_bus[28]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_27_ ( .D(N314), .CP(clk), .Q(
        o_data_bus[27]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_26_ ( .D(N313), .CP(clk), .Q(
        o_data_bus[26]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_25_ ( .D(N312), .CP(clk), .Q(
        o_data_bus[25]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_24_ ( .D(N311), .CP(clk), .Q(
        o_data_bus[24]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_23_ ( .D(N310), .CP(clk), .Q(
        o_data_bus[23]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_22_ ( .D(N309), .CP(clk), .Q(
        o_data_bus[22]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_21_ ( .D(N308), .CP(clk), .Q(
        o_data_bus[21]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_20_ ( .D(N307), .CP(clk), .Q(
        o_data_bus[20]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_19_ ( .D(N306), .CP(clk), .Q(
        o_data_bus[19]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_18_ ( .D(N305), .CP(clk), .Q(
        o_data_bus[18]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_17_ ( .D(N304), .CP(clk), .Q(
        o_data_bus[17]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_16_ ( .D(N303), .CP(clk), .Q(
        o_data_bus[16]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_15_ ( .D(N302), .CP(clk), .Q(
        o_data_bus[15]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_14_ ( .D(N301), .CP(clk), .Q(
        o_data_bus[14]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_13_ ( .D(N300), .CP(clk), .Q(
        o_data_bus[13]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_12_ ( .D(N299), .CP(clk), .Q(
        o_data_bus[12]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_11_ ( .D(N298), .CP(clk), .Q(
        o_data_bus[11]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_10_ ( .D(N297), .CP(clk), .Q(
        o_data_bus[10]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_9_ ( .D(N296), .CP(clk), .Q(
        o_data_bus[9]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_8_ ( .D(N295), .CP(clk), .Q(
        o_data_bus[8]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_7_ ( .D(N294), .CP(clk), .Q(
        o_data_bus[7]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_6_ ( .D(N293), .CP(clk), .Q(
        o_data_bus[6]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_5_ ( .D(N292), .CP(clk), .Q(
        o_data_bus[5]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_4_ ( .D(N291), .CP(clk), .Q(
        o_data_bus[4]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_3_ ( .D(N290), .CP(clk), .Q(
        o_data_bus[3]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_2_ ( .D(N289), .CP(clk), .Q(
        o_data_bus[2]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_1_ ( .D(N288), .CP(clk), .Q(
        o_data_bus[1]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_0_ ( .D(N287), .CP(clk), .Q(
        o_data_bus[0]) );
  DFQD1BWP30P140 o_valid_inner_reg_1_ ( .D(N354), .CP(clk), .Q(o_valid[1]) );
  DFQD4BWP30P140 o_valid_inner_reg_0_ ( .D(n1), .CP(clk), .Q(o_valid[0]) );
  DFD1BWP30P140 o_data_bus_inner_reg_63_ ( .D(N350), .CP(clk), .Q(
        o_data_bus[63]) );
  DFD1BWP30P140 o_data_bus_inner_reg_62_ ( .D(N349), .CP(clk), .Q(
        o_data_bus[62]) );
  DFD1BWP30P140 o_data_bus_inner_reg_61_ ( .D(N348), .CP(clk), .Q(
        o_data_bus[61]) );
  DFD1BWP30P140 o_data_bus_inner_reg_60_ ( .D(N347), .CP(clk), .Q(
        o_data_bus[60]) );
  DFD1BWP30P140 o_data_bus_inner_reg_59_ ( .D(N346), .CP(clk), .Q(
        o_data_bus[59]) );
  DFD1BWP30P140 o_data_bus_inner_reg_58_ ( .D(N345), .CP(clk), .Q(
        o_data_bus[58]) );
  DFD1BWP30P140 o_data_bus_inner_reg_57_ ( .D(N344), .CP(clk), .Q(
        o_data_bus[57]) );
  DFD1BWP30P140 o_data_bus_inner_reg_56_ ( .D(N343), .CP(clk), .Q(
        o_data_bus[56]) );
  DFD1BWP30P140 o_data_bus_inner_reg_55_ ( .D(N342), .CP(clk), .Q(
        o_data_bus[55]) );
  DFD1BWP30P140 o_data_bus_inner_reg_54_ ( .D(N341), .CP(clk), .Q(
        o_data_bus[54]) );
  DFD1BWP30P140 o_data_bus_inner_reg_53_ ( .D(N340), .CP(clk), .Q(
        o_data_bus[53]) );
  DFD1BWP30P140 o_data_bus_inner_reg_52_ ( .D(N339), .CP(clk), .Q(
        o_data_bus[52]) );
  DFD1BWP30P140 o_data_bus_inner_reg_50_ ( .D(N337), .CP(clk), .Q(
        o_data_bus[50]) );
  DFD1BWP30P140 o_data_bus_inner_reg_49_ ( .D(N336), .CP(clk), .Q(
        o_data_bus[49]) );
  DFD1BWP30P140 o_data_bus_inner_reg_48_ ( .D(N335), .CP(clk), .Q(
        o_data_bus[48]) );
  DFD1BWP30P140 o_data_bus_inner_reg_47_ ( .D(N334), .CP(clk), .Q(
        o_data_bus[47]) );
  DFD1BWP30P140 o_data_bus_inner_reg_46_ ( .D(N333), .CP(clk), .Q(
        o_data_bus[46]) );
  DFD1BWP30P140 o_data_bus_inner_reg_45_ ( .D(N332), .CP(clk), .Q(
        o_data_bus[45]) );
  DFD1BWP30P140 o_data_bus_inner_reg_44_ ( .D(N331), .CP(clk), .Q(
        o_data_bus[44]) );
  DFD1BWP30P140 o_data_bus_inner_reg_43_ ( .D(N330), .CP(clk), .Q(
        o_data_bus[43]) );
  DFD1BWP30P140 o_data_bus_inner_reg_42_ ( .D(N329), .CP(clk), .Q(
        o_data_bus[42]) );
  DFD1BWP30P140 o_data_bus_inner_reg_41_ ( .D(N328), .CP(clk), .Q(
        o_data_bus[41]) );
  DFD1BWP30P140 o_data_bus_inner_reg_40_ ( .D(N327), .CP(clk), .Q(
        o_data_bus[40]) );
  DFD1BWP30P140 o_data_bus_inner_reg_34_ ( .D(N321), .CP(clk), .Q(
        o_data_bus[34]) );
  DFD1BWP30P140 o_data_bus_inner_reg_33_ ( .D(N320), .CP(clk), .Q(
        o_data_bus[33]) );
  DFD1BWP30P140 o_data_bus_inner_reg_32_ ( .D(N319), .CP(clk), .Q(
        o_data_bus[32]) );
  DFD1BWP30P140 o_data_bus_inner_reg_39_ ( .D(N326), .CP(clk), .Q(
        o_data_bus[39]) );
  DFD1BWP30P140 o_data_bus_inner_reg_38_ ( .D(N325), .CP(clk), .Q(
        o_data_bus[38]) );
  DFD1BWP30P140 o_data_bus_inner_reg_36_ ( .D(N323), .CP(clk), .Q(
        o_data_bus[36]) );
  DFD1BWP30P140 o_data_bus_inner_reg_37_ ( .D(N324), .CP(clk), .Q(
        o_data_bus[37]) );
  DFD1BWP30P140 o_data_bus_inner_reg_35_ ( .D(N322), .CP(clk), .Q(
        o_data_bus[35]) );
  DFD1BWP30P140 o_data_bus_inner_reg_51_ ( .D(N338), .CP(clk), .Q(
        o_data_bus[51]) );
  MOAI22D1BWP30P140 U3 ( .A1(n46), .A2(n86), .B1(n97), .B2(i_data_bus[7]), 
        .ZN(N294) );
  INVD3BWP30P140 U4 ( .I(n36), .ZN(n86) );
  INVD2BWP30P140 U5 ( .I(n36), .ZN(n96) );
  BUFFD4BWP30P140 U6 ( .I(n14), .Z(n10) );
  MUX2NOPTD2BWP30P140 U7 ( .I0(n24), .I1(n12), .S(i_cmd[0]), .ZN(n25) );
  INVD1BWP30P140 U8 ( .I(i_valid[0]), .ZN(n24) );
  CKND2D3BWP30P140 U9 ( .A1(n5), .A2(n7), .ZN(n11) );
  ND2OPTIBD1BWP30P140 U10 ( .A1(n34), .A2(n22), .ZN(n23) );
  INVD2BWP30P140 U11 ( .I(i_cmd[1]), .ZN(n34) );
  ND2D2BWP30P140 U12 ( .A1(n12), .A2(i_cmd[1]), .ZN(n8) );
  INVD2BWP30P140 U13 ( .I(n6), .ZN(n5) );
  ND2OPTIBD2BWP30P140 U14 ( .A1(i_valid[1]), .A2(n22), .ZN(n17) );
  NR2D1BWP30P140 U15 ( .A1(i_valid[0]), .A2(i_cmd[1]), .ZN(n4) );
  INVD6BWP30P140 U16 ( .I(n11), .ZN(n97) );
  MOAI22D1BWP30P140 U17 ( .A1(n39), .A2(n86), .B1(n97), .B2(i_data_bus[3]), 
        .ZN(N290) );
  MOAI22D1BWP30P140 U18 ( .A1(n87), .A2(n10), .B1(n97), .B2(i_data_bus[25]), 
        .ZN(N312) );
  OR2D1BWP30P140 U19 ( .A1(n97), .A2(n13), .Z(n1) );
  ND2D1BWP30P140 U20 ( .A1(n16), .A2(n15), .ZN(N308) );
  INVD6BWP30P140 U21 ( .I(n14), .ZN(n36) );
  INVD3BWP30P140 U22 ( .I(n34), .ZN(n2) );
  NR2OPTPAD4BWP30P140 U23 ( .A1(n4), .A2(n3), .ZN(n9) );
  ND2OPTPAD4BWP30P140 U24 ( .A1(i_cmd[0]), .A2(n22), .ZN(n3) );
  CKND2D4BWP30P140 U25 ( .A1(i_valid[0]), .A2(n22), .ZN(n6) );
  INVD2BWP30P140 U26 ( .I(i_cmd[0]), .ZN(n7) );
  ND2OPTPAD6BWP30P140 U27 ( .A1(n9), .A2(n8), .ZN(n14) );
  INVD2BWP30P140 U28 ( .I(i_valid[1]), .ZN(n12) );
  NR3D0BWP30P140 U29 ( .A1(n12), .A2(n42), .A3(n43), .ZN(n13) );
  IOA22D4BWP30P140 U30 ( .B1(n41), .B2(n86), .A1(n97), .A2(i_data_bus[5]), 
        .ZN(N292) );
  INVD1BWP30P140 U31 ( .I(i_cmd[0]), .ZN(n42) );
  ND2OPTIBD1BWP30P140 U32 ( .A1(n97), .A2(i_data_bus[21]), .ZN(n15) );
  ND2OPTIBD1BWP30P140 U33 ( .A1(n36), .A2(i_data_bus[53]), .ZN(n16) );
  INVD4BWP30P140 U34 ( .I(n17), .ZN(n28) );
  ND2D1BWP30P140 U35 ( .A1(n19), .A2(i_en), .ZN(n43) );
  MOAI22D1BWP30P140 U36 ( .A1(n40), .A2(n18), .B1(i_data_bus[51]), .B2(n76), 
        .ZN(N338) );
  OAI21D1BWP30P140 U37 ( .A1(n6), .A2(n2), .B(n35), .ZN(N354) );
  MOAI22D1BWP30P140 U38 ( .A1(n86), .A2(n44), .B1(n97), .B2(i_data_bus[6]), 
        .ZN(N293) );
  MOAI22D1BWP30P140 U39 ( .A1(n86), .A2(n45), .B1(n97), .B2(i_data_bus[4]), 
        .ZN(N291) );
  CKND2D4BWP30P140 U40 ( .A1(n26), .A2(n25), .ZN(n18) );
  INVD1BWP30P140 U41 ( .I(n43), .ZN(n22) );
  INVD1BWP30P140 U42 ( .I(rst), .ZN(n19) );
  INVD1BWP30P140 U43 ( .I(i_data_bus[63]), .ZN(n20) );
  MOAI22D1BWP30P140 U44 ( .A1(n10), .A2(n20), .B1(n97), .B2(i_data_bus[31]), 
        .ZN(N318) );
  INVD1BWP30P140 U45 ( .I(i_data_bus[51]), .ZN(n21) );
  MOAI22D1BWP30P140 U46 ( .A1(n96), .A2(n21), .B1(n97), .B2(i_data_bus[19]), 
        .ZN(N306) );
  INVD1BWP30P140 U47 ( .I(i_data_bus[27]), .ZN(n29) );
  INVD2BWP30P140 U48 ( .I(n23), .ZN(n26) );
  CKND2D4BWP30P140 U49 ( .A1(n26), .A2(n25), .ZN(n27) );
  ND2OPTIBD8BWP30P140 U50 ( .A1(n2), .A2(n28), .ZN(n35) );
  INVD12BWP30P140 U51 ( .I(n35), .ZN(n76) );
  MOAI22D1BWP30P140 U52 ( .A1(n29), .A2(n27), .B1(i_data_bus[59]), .B2(n76), 
        .ZN(N346) );
  INVD1BWP30P140 U53 ( .I(i_data_bus[62]), .ZN(n30) );
  MOAI22D1BWP30P140 U54 ( .A1(n10), .A2(n30), .B1(n97), .B2(i_data_bus[30]), 
        .ZN(N317) );
  INVD1BWP30P140 U55 ( .I(i_data_bus[50]), .ZN(n31) );
  MOAI22D1BWP30P140 U56 ( .A1(n86), .A2(n31), .B1(n97), .B2(i_data_bus[18]), 
        .ZN(N305) );
  INVD1BWP30P140 U57 ( .I(i_data_bus[61]), .ZN(n32) );
  MOAI22D1BWP30P140 U58 ( .A1(n10), .A2(n32), .B1(n97), .B2(i_data_bus[29]), 
        .ZN(N316) );
  INVD1BWP30P140 U59 ( .I(i_data_bus[49]), .ZN(n33) );
  MOAI22D1BWP30P140 U60 ( .A1(n96), .A2(n33), .B1(n97), .B2(i_data_bus[17]), 
        .ZN(N304) );
  INVD1BWP30P140 U61 ( .I(i_data_bus[33]), .ZN(n37) );
  MOAI22D1BWP30P140 U62 ( .A1(n86), .A2(n37), .B1(n97), .B2(i_data_bus[1]), 
        .ZN(N288) );
  INVD1BWP30P140 U63 ( .I(i_data_bus[40]), .ZN(n38) );
  MOAI22D1BWP30P140 U64 ( .A1(n96), .A2(n38), .B1(n97), .B2(i_data_bus[8]), 
        .ZN(N295) );
  INVD1BWP30P140 U65 ( .I(i_data_bus[3]), .ZN(n52) );
  INVD1BWP30P140 U66 ( .I(i_data_bus[35]), .ZN(n39) );
  INVD1BWP30P140 U67 ( .I(i_data_bus[19]), .ZN(n40) );
  INVD1BWP30P140 U68 ( .I(i_data_bus[5]), .ZN(n54) );
  INVD1BWP30P140 U69 ( .I(i_data_bus[37]), .ZN(n41) );
  INVD1BWP30P140 U70 ( .I(i_data_bus[6]), .ZN(n55) );
  INVD1BWP30P140 U71 ( .I(i_data_bus[38]), .ZN(n44) );
  INVD1BWP30P140 U72 ( .I(i_data_bus[4]), .ZN(n53) );
  INVD1BWP30P140 U73 ( .I(i_data_bus[36]), .ZN(n45) );
  INVD1BWP30P140 U74 ( .I(i_data_bus[7]), .ZN(n56) );
  INVD1BWP30P140 U75 ( .I(i_data_bus[39]), .ZN(n46) );
  INVD1BWP30P140 U76 ( .I(i_data_bus[1]), .ZN(n47) );
  MOAI22D1BWP30P140 U77 ( .A1(n47), .A2(n27), .B1(i_data_bus[33]), .B2(n76), 
        .ZN(N320) );
  INVD1BWP30P140 U78 ( .I(i_data_bus[31]), .ZN(n48) );
  MOAI22D1BWP30P140 U79 ( .A1(n48), .A2(n27), .B1(i_data_bus[63]), .B2(n76), 
        .ZN(N350) );
  INVD1BWP30P140 U80 ( .I(i_data_bus[0]), .ZN(n49) );
  MOAI22D1BWP30P140 U81 ( .A1(n49), .A2(n27), .B1(i_data_bus[32]), .B2(n76), 
        .ZN(N319) );
  INVD1BWP30P140 U82 ( .I(i_data_bus[2]), .ZN(n50) );
  MOAI22D1BWP30P140 U83 ( .A1(n50), .A2(n27), .B1(i_data_bus[34]), .B2(n76), 
        .ZN(N321) );
  INVD1BWP30P140 U84 ( .I(i_data_bus[11]), .ZN(n51) );
  MOAI22D1BWP30P140 U85 ( .A1(n51), .A2(n27), .B1(i_data_bus[43]), .B2(n76), 
        .ZN(N330) );
  MOAI22D1BWP30P140 U86 ( .A1(n52), .A2(n27), .B1(i_data_bus[35]), .B2(n76), 
        .ZN(N322) );
  MOAI22D1BWP30P140 U87 ( .A1(n53), .A2(n27), .B1(i_data_bus[36]), .B2(n76), 
        .ZN(N323) );
  MOAI22D1BWP30P140 U88 ( .A1(n54), .A2(n27), .B1(i_data_bus[37]), .B2(n76), 
        .ZN(N324) );
  MOAI22D1BWP30P140 U89 ( .A1(n55), .A2(n27), .B1(i_data_bus[38]), .B2(n76), 
        .ZN(N325) );
  MOAI22D1BWP30P140 U90 ( .A1(n56), .A2(n27), .B1(i_data_bus[39]), .B2(n76), 
        .ZN(N326) );
  INVD1BWP30P140 U91 ( .I(i_data_bus[8]), .ZN(n57) );
  MOAI22D1BWP30P140 U92 ( .A1(n57), .A2(n27), .B1(i_data_bus[40]), .B2(n76), 
        .ZN(N327) );
  INVD1BWP30P140 U93 ( .I(i_data_bus[9]), .ZN(n58) );
  MOAI22D1BWP30P140 U94 ( .A1(n58), .A2(n27), .B1(i_data_bus[41]), .B2(n76), 
        .ZN(N328) );
  INVD1BWP30P140 U95 ( .I(i_data_bus[10]), .ZN(n59) );
  MOAI22D1BWP30P140 U96 ( .A1(n59), .A2(n27), .B1(i_data_bus[42]), .B2(n76), 
        .ZN(N329) );
  INVD1BWP30P140 U97 ( .I(i_data_bus[12]), .ZN(n60) );
  MOAI22D1BWP30P140 U98 ( .A1(n60), .A2(n27), .B1(i_data_bus[44]), .B2(n76), 
        .ZN(N331) );
  INVD1BWP30P140 U99 ( .I(i_data_bus[13]), .ZN(n61) );
  MOAI22D1BWP30P140 U100 ( .A1(n61), .A2(n27), .B1(i_data_bus[45]), .B2(n76), 
        .ZN(N332) );
  INVD1BWP30P140 U101 ( .I(i_data_bus[14]), .ZN(n62) );
  MOAI22D1BWP30P140 U102 ( .A1(n62), .A2(n27), .B1(i_data_bus[46]), .B2(n76), 
        .ZN(N333) );
  INVD1BWP30P140 U103 ( .I(i_data_bus[15]), .ZN(n63) );
  MOAI22D1BWP30P140 U104 ( .A1(n63), .A2(n18), .B1(i_data_bus[47]), .B2(n76), 
        .ZN(N334) );
  INVD1BWP30P140 U105 ( .I(i_data_bus[16]), .ZN(n64) );
  MOAI22D1BWP30P140 U106 ( .A1(n64), .A2(n18), .B1(i_data_bus[48]), .B2(n76), 
        .ZN(N335) );
  INVD1BWP30P140 U107 ( .I(i_data_bus[17]), .ZN(n65) );
  MOAI22D1BWP30P140 U108 ( .A1(n65), .A2(n18), .B1(i_data_bus[49]), .B2(n76), 
        .ZN(N336) );
  INVD1BWP30P140 U109 ( .I(i_data_bus[18]), .ZN(n66) );
  MOAI22D1BWP30P140 U110 ( .A1(n66), .A2(n18), .B1(i_data_bus[50]), .B2(n76), 
        .ZN(N337) );
  INVD1BWP30P140 U111 ( .I(i_data_bus[20]), .ZN(n67) );
  MOAI22D1BWP30P140 U112 ( .A1(n67), .A2(n18), .B1(i_data_bus[52]), .B2(n76), 
        .ZN(N339) );
  INVD1BWP30P140 U113 ( .I(i_data_bus[21]), .ZN(n68) );
  MOAI22D1BWP30P140 U114 ( .A1(n68), .A2(n18), .B1(i_data_bus[53]), .B2(n76), 
        .ZN(N340) );
  INVD1BWP30P140 U115 ( .I(i_data_bus[22]), .ZN(n69) );
  MOAI22D1BWP30P140 U116 ( .A1(n69), .A2(n18), .B1(i_data_bus[54]), .B2(n76), 
        .ZN(N341) );
  INVD1BWP30P140 U117 ( .I(i_data_bus[23]), .ZN(n70) );
  MOAI22D1BWP30P140 U118 ( .A1(n70), .A2(n18), .B1(i_data_bus[55]), .B2(n76), 
        .ZN(N342) );
  INVD1BWP30P140 U119 ( .I(i_data_bus[24]), .ZN(n71) );
  MOAI22D1BWP30P140 U120 ( .A1(n71), .A2(n18), .B1(i_data_bus[56]), .B2(n76), 
        .ZN(N343) );
  INVD1BWP30P140 U121 ( .I(i_data_bus[25]), .ZN(n72) );
  MOAI22D1BWP30P140 U122 ( .A1(n72), .A2(n18), .B1(i_data_bus[57]), .B2(n76), 
        .ZN(N344) );
  INVD1BWP30P140 U123 ( .I(i_data_bus[29]), .ZN(n73) );
  MOAI22D1BWP30P140 U124 ( .A1(n73), .A2(n18), .B1(i_data_bus[61]), .B2(n76), 
        .ZN(N348) );
  INVD1BWP30P140 U125 ( .I(i_data_bus[30]), .ZN(n74) );
  MOAI22D1BWP30P140 U126 ( .A1(n74), .A2(n18), .B1(i_data_bus[62]), .B2(n76), 
        .ZN(N349) );
  INVD1BWP30P140 U127 ( .I(i_data_bus[28]), .ZN(n75) );
  MOAI22D1BWP30P140 U128 ( .A1(n75), .A2(n18), .B1(i_data_bus[60]), .B2(n76), 
        .ZN(N347) );
  INVD1BWP30P140 U129 ( .I(i_data_bus[26]), .ZN(n77) );
  MOAI22D1BWP30P140 U130 ( .A1(n77), .A2(n18), .B1(i_data_bus[58]), .B2(n76), 
        .ZN(N345) );
  INVD1BWP30P140 U131 ( .I(i_data_bus[60]), .ZN(n78) );
  MOAI22D1BWP30P140 U132 ( .A1(n10), .A2(n78), .B1(n97), .B2(i_data_bus[28]), 
        .ZN(N315) );
  INVD1BWP30P140 U133 ( .I(i_data_bus[48]), .ZN(n79) );
  MOAI22D1BWP30P140 U134 ( .A1(n96), .A2(n79), .B1(n97), .B2(i_data_bus[16]), 
        .ZN(N303) );
  INVD1BWP30P140 U135 ( .I(i_data_bus[34]), .ZN(n80) );
  MOAI22D1BWP30P140 U136 ( .A1(n86), .A2(n80), .B1(n97), .B2(i_data_bus[2]), 
        .ZN(N289) );
  INVD1BWP30P140 U137 ( .I(i_data_bus[59]), .ZN(n81) );
  MOAI22D1BWP30P140 U138 ( .A1(n10), .A2(n81), .B1(n97), .B2(i_data_bus[27]), 
        .ZN(N314) );
  INVD1BWP30P140 U139 ( .I(i_data_bus[47]), .ZN(n82) );
  MOAI22D1BWP30P140 U140 ( .A1(n96), .A2(n82), .B1(n97), .B2(i_data_bus[15]), 
        .ZN(N302) );
  INVD1BWP30P140 U141 ( .I(i_data_bus[58]), .ZN(n83) );
  MOAI22D1BWP30P140 U142 ( .A1(n10), .A2(n83), .B1(n97), .B2(i_data_bus[26]), 
        .ZN(N313) );
  INVD1BWP30P140 U143 ( .I(i_data_bus[46]), .ZN(n84) );
  MOAI22D1BWP30P140 U144 ( .A1(n86), .A2(n84), .B1(n97), .B2(i_data_bus[14]), 
        .ZN(N301) );
  INVD1BWP30P140 U145 ( .I(i_data_bus[32]), .ZN(n85) );
  MOAI22D1BWP30P140 U146 ( .A1(n86), .A2(n85), .B1(n97), .B2(i_data_bus[0]), 
        .ZN(N287) );
  INVD1BWP30P140 U147 ( .I(i_data_bus[57]), .ZN(n87) );
  INVD1BWP30P140 U148 ( .I(i_data_bus[45]), .ZN(n88) );
  MOAI22D1BWP30P140 U149 ( .A1(n96), .A2(n88), .B1(n97), .B2(i_data_bus[13]), 
        .ZN(N300) );
  INVD1BWP30P140 U150 ( .I(i_data_bus[56]), .ZN(n89) );
  MOAI22D1BWP30P140 U151 ( .A1(n10), .A2(n89), .B1(n97), .B2(i_data_bus[24]), 
        .ZN(N311) );
  INVD1BWP30P140 U152 ( .I(i_data_bus[44]), .ZN(n90) );
  MOAI22D1BWP30P140 U153 ( .A1(n96), .A2(n90), .B1(n97), .B2(i_data_bus[12]), 
        .ZN(N299) );
  INVD1BWP30P140 U154 ( .I(i_data_bus[55]), .ZN(n91) );
  MOAI22D1BWP30P140 U155 ( .A1(n10), .A2(n91), .B1(n97), .B2(i_data_bus[23]), 
        .ZN(N310) );
  INVD1BWP30P140 U156 ( .I(i_data_bus[43]), .ZN(n92) );
  MOAI22D1BWP30P140 U157 ( .A1(n96), .A2(n92), .B1(n97), .B2(i_data_bus[11]), 
        .ZN(N298) );
  INVD1BWP30P140 U158 ( .I(i_data_bus[54]), .ZN(n93) );
  MOAI22D1BWP30P140 U159 ( .A1(n10), .A2(n93), .B1(n97), .B2(i_data_bus[22]), 
        .ZN(N309) );
  INVD1BWP30P140 U160 ( .I(i_data_bus[42]), .ZN(n94) );
  MOAI22D1BWP30P140 U161 ( .A1(n96), .A2(n94), .B1(n97), .B2(i_data_bus[10]), 
        .ZN(N297) );
  INVD1BWP30P140 U162 ( .I(i_data_bus[41]), .ZN(n95) );
  MOAI22D1BWP30P140 U163 ( .A1(n96), .A2(n95), .B1(n97), .B2(i_data_bus[9]), 
        .ZN(N296) );
  INVD1BWP30P140 U164 ( .I(i_data_bus[52]), .ZN(n98) );
  MOAI22D1BWP30P140 U165 ( .A1(n10), .A2(n98), .B1(n97), .B2(i_data_bus[20]), 
        .ZN(N307) );
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
         N342, N343, N344, N345, N346, N347, N348, N349, N350, N354, n1, n2,
         n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16, n17,
         n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30, n31,
         n32, n33, n34, n35, n36, n37, n38, n39, n40, n41, n42, n43, n44, n45,
         n46, n47, n48, n49, n50, n51, n52, n53, n54, n55, n56, n57, n58, n59,
         n60, n61, n62, n63, n64, n65, n66, n67, n68, n69, n70, n71, n72, n73,
         n74, n75, n76, n77, n78, n79, n80, n81, n82, n83, n84, n85, n86, n87,
         n88, n89, n90, n91, n92, n93, n94, n95, n96, n97, n98, n99;

  DFQD1BWP30P140 o_data_bus_inner_reg_31_ ( .D(N318), .CP(clk), .Q(
        o_data_bus[31]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_30_ ( .D(N317), .CP(clk), .Q(
        o_data_bus[30]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_29_ ( .D(N316), .CP(clk), .Q(
        o_data_bus[29]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_28_ ( .D(N315), .CP(clk), .Q(
        o_data_bus[28]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_27_ ( .D(N314), .CP(clk), .Q(
        o_data_bus[27]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_26_ ( .D(N313), .CP(clk), .Q(
        o_data_bus[26]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_25_ ( .D(N312), .CP(clk), .Q(
        o_data_bus[25]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_24_ ( .D(N311), .CP(clk), .Q(
        o_data_bus[24]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_23_ ( .D(N310), .CP(clk), .Q(
        o_data_bus[23]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_22_ ( .D(N309), .CP(clk), .Q(
        o_data_bus[22]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_21_ ( .D(N308), .CP(clk), .Q(
        o_data_bus[21]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_20_ ( .D(N307), .CP(clk), .Q(
        o_data_bus[20]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_19_ ( .D(N306), .CP(clk), .Q(
        o_data_bus[19]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_18_ ( .D(N305), .CP(clk), .Q(
        o_data_bus[18]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_17_ ( .D(N304), .CP(clk), .Q(
        o_data_bus[17]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_16_ ( .D(N303), .CP(clk), .Q(
        o_data_bus[16]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_15_ ( .D(N302), .CP(clk), .Q(
        o_data_bus[15]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_14_ ( .D(N301), .CP(clk), .Q(
        o_data_bus[14]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_13_ ( .D(N300), .CP(clk), .Q(
        o_data_bus[13]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_12_ ( .D(N299), .CP(clk), .Q(
        o_data_bus[12]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_11_ ( .D(N298), .CP(clk), .Q(
        o_data_bus[11]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_10_ ( .D(N297), .CP(clk), .Q(
        o_data_bus[10]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_9_ ( .D(N296), .CP(clk), .Q(
        o_data_bus[9]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_8_ ( .D(N295), .CP(clk), .Q(
        o_data_bus[8]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_7_ ( .D(N294), .CP(clk), .Q(
        o_data_bus[7]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_6_ ( .D(N293), .CP(clk), .Q(
        o_data_bus[6]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_5_ ( .D(N292), .CP(clk), .Q(
        o_data_bus[5]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_4_ ( .D(N291), .CP(clk), .Q(
        o_data_bus[4]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_3_ ( .D(N290), .CP(clk), .Q(
        o_data_bus[3]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_2_ ( .D(N289), .CP(clk), .Q(
        o_data_bus[2]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_1_ ( .D(N288), .CP(clk), .Q(
        o_data_bus[1]) );
  DFQD1BWP30P140 o_data_bus_inner_reg_0_ ( .D(N287), .CP(clk), .Q(
        o_data_bus[0]) );
  DFD1BWP30P140 o_data_bus_inner_reg_63_ ( .D(N350), .CP(clk), .Q(
        o_data_bus[63]) );
  DFD1BWP30P140 o_data_bus_inner_reg_62_ ( .D(N349), .CP(clk), .Q(
        o_data_bus[62]) );
  DFD1BWP30P140 o_data_bus_inner_reg_61_ ( .D(N348), .CP(clk), .Q(
        o_data_bus[61]) );
  DFD1BWP30P140 o_data_bus_inner_reg_60_ ( .D(N347), .CP(clk), .Q(
        o_data_bus[60]) );
  DFD1BWP30P140 o_data_bus_inner_reg_59_ ( .D(N346), .CP(clk), .Q(
        o_data_bus[59]) );
  DFD1BWP30P140 o_data_bus_inner_reg_58_ ( .D(N345), .CP(clk), .Q(
        o_data_bus[58]) );
  DFD1BWP30P140 o_data_bus_inner_reg_57_ ( .D(N344), .CP(clk), .Q(
        o_data_bus[57]) );
  DFD1BWP30P140 o_data_bus_inner_reg_56_ ( .D(N343), .CP(clk), .Q(
        o_data_bus[56]) );
  DFD1BWP30P140 o_data_bus_inner_reg_55_ ( .D(N342), .CP(clk), .Q(
        o_data_bus[55]) );
  DFD1BWP30P140 o_data_bus_inner_reg_54_ ( .D(N341), .CP(clk), .Q(
        o_data_bus[54]) );
  DFD1BWP30P140 o_data_bus_inner_reg_53_ ( .D(N340), .CP(clk), .Q(
        o_data_bus[53]) );
  DFD1BWP30P140 o_data_bus_inner_reg_52_ ( .D(N339), .CP(clk), .Q(
        o_data_bus[52]) );
  DFD1BWP30P140 o_data_bus_inner_reg_51_ ( .D(N338), .CP(clk), .Q(
        o_data_bus[51]) );
  DFD1BWP30P140 o_data_bus_inner_reg_50_ ( .D(N337), .CP(clk), .Q(
        o_data_bus[50]) );
  DFD1BWP30P140 o_data_bus_inner_reg_49_ ( .D(N336), .CP(clk), .Q(
        o_data_bus[49]) );
  DFD1BWP30P140 o_data_bus_inner_reg_48_ ( .D(N335), .CP(clk), .Q(
        o_data_bus[48]) );
  DFD1BWP30P140 o_data_bus_inner_reg_46_ ( .D(N333), .CP(clk), .Q(
        o_data_bus[46]) );
  DFD1BWP30P140 o_data_bus_inner_reg_45_ ( .D(N332), .CP(clk), .Q(
        o_data_bus[45]) );
  DFD1BWP30P140 o_data_bus_inner_reg_44_ ( .D(N331), .CP(clk), .Q(
        o_data_bus[44]) );
  DFD1BWP30P140 o_data_bus_inner_reg_43_ ( .D(N330), .CP(clk), .Q(
        o_data_bus[43]) );
  DFD1BWP30P140 o_data_bus_inner_reg_42_ ( .D(N329), .CP(clk), .Q(
        o_data_bus[42]) );
  DFD1BWP30P140 o_data_bus_inner_reg_41_ ( .D(N328), .CP(clk), .Q(
        o_data_bus[41]) );
  DFD1BWP30P140 o_data_bus_inner_reg_40_ ( .D(N327), .CP(clk), .Q(
        o_data_bus[40]) );
  DFD1BWP30P140 o_data_bus_inner_reg_34_ ( .D(N321), .CP(clk), .Q(
        o_data_bus[34]) );
  DFD1BWP30P140 o_data_bus_inner_reg_33_ ( .D(N320), .CP(clk), .Q(
        o_data_bus[33]) );
  DFD1BWP30P140 o_data_bus_inner_reg_32_ ( .D(N319), .CP(clk), .Q(
        o_data_bus[32]) );
  DFD1BWP30P140 o_data_bus_inner_reg_37_ ( .D(N324), .CP(clk), .Q(
        o_data_bus[37]) );
  DFD1BWP30P140 o_data_bus_inner_reg_36_ ( .D(N323), .CP(clk), .Q(
        o_data_bus[36]) );
  DFD1BWP30P140 o_data_bus_inner_reg_35_ ( .D(N322), .CP(clk), .Q(
        o_data_bus[35]) );
  DFD1BWP30P140 o_data_bus_inner_reg_39_ ( .D(N326), .CP(clk), .Q(
        o_data_bus[39]) );
  DFD1BWP30P140 o_data_bus_inner_reg_38_ ( .D(N325), .CP(clk), .Q(
        o_data_bus[38]) );
  DFD1BWP30P140 o_data_bus_inner_reg_47_ ( .D(N334), .CP(clk), .Q(
        o_data_bus[47]) );
  DFQD2BWP30P140 o_valid_inner_reg_0_ ( .D(n1), .CP(clk), .Q(o_valid[0]) );
  DFQD2BWP30P140 o_valid_inner_reg_1_ ( .D(N354), .CP(clk), .Q(o_valid[1]) );
  MOAI22D1BWP30P140 U3 ( .A1(n42), .A2(n87), .B1(n98), .B2(i_data_bus[7]), 
        .ZN(N294) );
  INVD8BWP30P140 U4 ( .I(n36), .ZN(n77) );
  BUFFD4BWP30P140 U5 ( .I(n14), .Z(n10) );
  ND2OPTIBD6BWP30P140 U6 ( .A1(n2), .A2(n29), .ZN(n36) );
  INVD3BWP30P140 U7 ( .I(n17), .ZN(n29) );
  INVD1BWP30P140 U8 ( .I(i_valid[1]), .ZN(n12) );
  INVD1BWP30P140 U9 ( .I(i_valid[0]), .ZN(n25) );
  CKND2D2BWP30P140 U10 ( .A1(n35), .A2(n23), .ZN(n24) );
  INVD2BWP30P140 U11 ( .I(i_cmd[1]), .ZN(n35) );
  INVD2BWP30P140 U12 ( .I(n6), .ZN(n5) );
  ND2OPTIBD2BWP30P140 U13 ( .A1(n18), .A2(i_cmd[1]), .ZN(n8) );
  CKND2D2BWP30P140 U14 ( .A1(i_valid[1]), .A2(n23), .ZN(n17) );
  CKND2D4BWP30P140 U15 ( .A1(i_cmd[0]), .A2(n23), .ZN(n3) );
  INVD6BWP30P140 U16 ( .I(n11), .ZN(n98) );
  MOAI22D1BWP30P140 U17 ( .A1(n45), .A2(n87), .B1(n98), .B2(i_data_bus[5]), 
        .ZN(N292) );
  MOAI22D1BWP30P140 U18 ( .A1(n88), .A2(n10), .B1(n98), .B2(i_data_bus[25]), 
        .ZN(N312) );
  OR2D1BWP30P140 U19 ( .A1(n98), .A2(n13), .Z(n1) );
  INVD1BWP30P140 U20 ( .I(i_valid[1]), .ZN(n18) );
  ND2D1BWP30P140 U21 ( .A1(n16), .A2(n15), .ZN(N308) );
  INVD6BWP30P140 U22 ( .I(n14), .ZN(n37) );
  INVD3BWP30P140 U23 ( .I(n35), .ZN(n2) );
  NR2OPTPAD4BWP30P140 U24 ( .A1(n4), .A2(n3), .ZN(n9) );
  NR2D3BWP30P140 U25 ( .A1(i_valid[0]), .A2(i_cmd[1]), .ZN(n4) );
  ND2OPTIBD6BWP30P140 U26 ( .A1(n5), .A2(n7), .ZN(n11) );
  CKND2D4BWP30P140 U27 ( .A1(i_valid[0]), .A2(n23), .ZN(n6) );
  INVD2BWP30P140 U28 ( .I(i_cmd[0]), .ZN(n7) );
  ND2OPTPAD6BWP30P140 U29 ( .A1(n9), .A2(n8), .ZN(n14) );
  MUX2NOPTD4BWP30P140 U30 ( .I0(n25), .I1(n12), .S(i_cmd[0]), .ZN(n26) );
  NR3D0BWP30P140 U31 ( .A1(n18), .A2(n43), .A3(n44), .ZN(n13) );
  IOA22D4BWP30P140 U32 ( .B1(n41), .B2(n87), .A1(n98), .A2(i_data_bus[6]), 
        .ZN(N293) );
  INVD1BWP30P140 U33 ( .I(i_cmd[0]), .ZN(n43) );
  ND2OPTIBD1BWP30P140 U34 ( .A1(n98), .A2(i_data_bus[21]), .ZN(n15) );
  ND2OPTIBD1BWP30P140 U35 ( .A1(n37), .A2(i_data_bus[53]), .ZN(n16) );
  ND2D1BWP30P140 U36 ( .A1(n20), .A2(i_en), .ZN(n44) );
  OAI21D1BWP30P140 U37 ( .A1(n6), .A2(n2), .B(n36), .ZN(N354) );
  MOAI22D1BWP30P140 U38 ( .A1(n40), .A2(n19), .B1(i_data_bus[47]), .B2(n77), 
        .ZN(N334) );
  MOAI22D1BWP30P140 U39 ( .A1(n87), .A2(n46), .B1(n98), .B2(i_data_bus[4]), 
        .ZN(N291) );
  MOAI22D1BWP30P140 U40 ( .A1(n87), .A2(n47), .B1(n98), .B2(i_data_bus[3]), 
        .ZN(N290) );
  CKND2D4BWP30P140 U41 ( .A1(n27), .A2(n26), .ZN(n19) );
  INVD1BWP30P140 U42 ( .I(n44), .ZN(n23) );
  INVD1BWP30P140 U43 ( .I(rst), .ZN(n20) );
  INVD1BWP30P140 U44 ( .I(i_data_bus[63]), .ZN(n21) );
  MOAI22D1BWP30P140 U45 ( .A1(n10), .A2(n21), .B1(n98), .B2(i_data_bus[31]), 
        .ZN(N318) );
  INVD3BWP30P140 U46 ( .I(n37), .ZN(n97) );
  INVD1BWP30P140 U47 ( .I(i_data_bus[51]), .ZN(n22) );
  MOAI22D1BWP30P140 U48 ( .A1(n97), .A2(n22), .B1(n98), .B2(i_data_bus[19]), 
        .ZN(N306) );
  INVD1BWP30P140 U49 ( .I(i_data_bus[0]), .ZN(n30) );
  INVD2BWP30P140 U50 ( .I(n24), .ZN(n27) );
  CKND2D4BWP30P140 U51 ( .A1(n27), .A2(n26), .ZN(n28) );
  MOAI22D1BWP30P140 U52 ( .A1(n30), .A2(n28), .B1(i_data_bus[32]), .B2(n77), 
        .ZN(N319) );
  INVD1BWP30P140 U53 ( .I(i_data_bus[62]), .ZN(n31) );
  MOAI22D1BWP30P140 U54 ( .A1(n10), .A2(n31), .B1(n98), .B2(i_data_bus[30]), 
        .ZN(N317) );
  INVD1BWP30P140 U55 ( .I(i_data_bus[50]), .ZN(n32) );
  MOAI22D1BWP30P140 U56 ( .A1(n87), .A2(n32), .B1(n98), .B2(i_data_bus[18]), 
        .ZN(N305) );
  INVD1BWP30P140 U57 ( .I(i_data_bus[61]), .ZN(n33) );
  MOAI22D1BWP30P140 U58 ( .A1(n10), .A2(n33), .B1(n98), .B2(i_data_bus[29]), 
        .ZN(N316) );
  INVD1BWP30P140 U59 ( .I(i_data_bus[49]), .ZN(n34) );
  MOAI22D1BWP30P140 U60 ( .A1(n97), .A2(n34), .B1(n98), .B2(i_data_bus[17]), 
        .ZN(N304) );
  INVD6BWP30P140 U61 ( .I(n37), .ZN(n87) );
  INVD1BWP30P140 U62 ( .I(i_data_bus[33]), .ZN(n38) );
  MOAI22D1BWP30P140 U63 ( .A1(n87), .A2(n38), .B1(n98), .B2(i_data_bus[1]), 
        .ZN(N288) );
  INVD1BWP30P140 U64 ( .I(i_data_bus[40]), .ZN(n39) );
  MOAI22D1BWP30P140 U65 ( .A1(n97), .A2(n39), .B1(n98), .B2(i_data_bus[8]), 
        .ZN(N295) );
  INVD1BWP30P140 U66 ( .I(i_data_bus[15]), .ZN(n40) );
  INVD1BWP30P140 U67 ( .I(i_data_bus[6]), .ZN(n59) );
  INVD1BWP30P140 U68 ( .I(i_data_bus[38]), .ZN(n41) );
  INVD1BWP30P140 U69 ( .I(i_data_bus[7]), .ZN(n70) );
  INVD1BWP30P140 U70 ( .I(i_data_bus[39]), .ZN(n42) );
  INVD1BWP30P140 U71 ( .I(i_data_bus[5]), .ZN(n60) );
  INVD1BWP30P140 U72 ( .I(i_data_bus[37]), .ZN(n45) );
  INVD1BWP30P140 U73 ( .I(i_data_bus[4]), .ZN(n61) );
  INVD1BWP30P140 U74 ( .I(i_data_bus[36]), .ZN(n46) );
  INVD1BWP30P140 U75 ( .I(i_data_bus[3]), .ZN(n62) );
  INVD1BWP30P140 U76 ( .I(i_data_bus[35]), .ZN(n47) );
  INVD1BWP30P140 U77 ( .I(i_data_bus[14]), .ZN(n48) );
  MOAI22D1BWP30P140 U78 ( .A1(n48), .A2(n28), .B1(i_data_bus[46]), .B2(n77), 
        .ZN(N333) );
  INVD1BWP30P140 U79 ( .I(i_data_bus[19]), .ZN(n49) );
  MOAI22D1BWP30P140 U80 ( .A1(n49), .A2(n28), .B1(i_data_bus[51]), .B2(n77), 
        .ZN(N338) );
  INVD1BWP30P140 U81 ( .I(i_data_bus[16]), .ZN(n50) );
  MOAI22D1BWP30P140 U82 ( .A1(n50), .A2(n28), .B1(i_data_bus[48]), .B2(n77), 
        .ZN(N335) );
  INVD1BWP30P140 U83 ( .I(i_data_bus[17]), .ZN(n51) );
  MOAI22D1BWP30P140 U84 ( .A1(n51), .A2(n28), .B1(i_data_bus[49]), .B2(n77), 
        .ZN(N336) );
  INVD1BWP30P140 U85 ( .I(i_data_bus[18]), .ZN(n52) );
  MOAI22D1BWP30P140 U86 ( .A1(n52), .A2(n28), .B1(i_data_bus[50]), .B2(n77), 
        .ZN(N337) );
  INVD1BWP30P140 U87 ( .I(i_data_bus[10]), .ZN(n53) );
  MOAI22D1BWP30P140 U88 ( .A1(n53), .A2(n28), .B1(i_data_bus[42]), .B2(n77), 
        .ZN(N329) );
  INVD1BWP30P140 U89 ( .I(i_data_bus[27]), .ZN(n54) );
  MOAI22D1BWP30P140 U90 ( .A1(n54), .A2(n28), .B1(i_data_bus[59]), .B2(n77), 
        .ZN(N346) );
  INVD1BWP30P140 U91 ( .I(i_data_bus[28]), .ZN(n55) );
  MOAI22D1BWP30P140 U92 ( .A1(n55), .A2(n28), .B1(i_data_bus[60]), .B2(n77), 
        .ZN(N347) );
  INVD1BWP30P140 U93 ( .I(i_data_bus[29]), .ZN(n56) );
  MOAI22D1BWP30P140 U94 ( .A1(n56), .A2(n28), .B1(i_data_bus[61]), .B2(n77), 
        .ZN(N348) );
  INVD1BWP30P140 U95 ( .I(i_data_bus[30]), .ZN(n57) );
  MOAI22D1BWP30P140 U96 ( .A1(n57), .A2(n28), .B1(i_data_bus[62]), .B2(n77), 
        .ZN(N349) );
  INVD1BWP30P140 U97 ( .I(i_data_bus[31]), .ZN(n58) );
  MOAI22D1BWP30P140 U98 ( .A1(n58), .A2(n28), .B1(i_data_bus[63]), .B2(n77), 
        .ZN(N350) );
  MOAI22D1BWP30P140 U99 ( .A1(n59), .A2(n28), .B1(i_data_bus[38]), .B2(n77), 
        .ZN(N325) );
  MOAI22D1BWP30P140 U100 ( .A1(n60), .A2(n28), .B1(i_data_bus[37]), .B2(n77), 
        .ZN(N324) );
  MOAI22D1BWP30P140 U101 ( .A1(n61), .A2(n28), .B1(i_data_bus[36]), .B2(n77), 
        .ZN(N323) );
  MOAI22D1BWP30P140 U102 ( .A1(n62), .A2(n28), .B1(i_data_bus[35]), .B2(n77), 
        .ZN(N322) );
  INVD1BWP30P140 U103 ( .I(i_data_bus[20]), .ZN(n63) );
  MOAI22D1BWP30P140 U104 ( .A1(n63), .A2(n28), .B1(i_data_bus[52]), .B2(n77), 
        .ZN(N339) );
  INVD1BWP30P140 U105 ( .I(i_data_bus[21]), .ZN(n64) );
  MOAI22D1BWP30P140 U106 ( .A1(n64), .A2(n19), .B1(i_data_bus[53]), .B2(n77), 
        .ZN(N340) );
  INVD1BWP30P140 U107 ( .I(i_data_bus[22]), .ZN(n65) );
  MOAI22D1BWP30P140 U108 ( .A1(n65), .A2(n19), .B1(i_data_bus[54]), .B2(n77), 
        .ZN(N341) );
  INVD1BWP30P140 U109 ( .I(i_data_bus[23]), .ZN(n66) );
  MOAI22D1BWP30P140 U110 ( .A1(n66), .A2(n19), .B1(i_data_bus[55]), .B2(n77), 
        .ZN(N342) );
  INVD1BWP30P140 U111 ( .I(i_data_bus[24]), .ZN(n67) );
  MOAI22D1BWP30P140 U112 ( .A1(n67), .A2(n19), .B1(i_data_bus[56]), .B2(n77), 
        .ZN(N343) );
  INVD1BWP30P140 U113 ( .I(i_data_bus[25]), .ZN(n68) );
  MOAI22D1BWP30P140 U114 ( .A1(n68), .A2(n19), .B1(i_data_bus[57]), .B2(n77), 
        .ZN(N344) );
  INVD1BWP30P140 U115 ( .I(i_data_bus[26]), .ZN(n69) );
  MOAI22D1BWP30P140 U116 ( .A1(n69), .A2(n19), .B1(i_data_bus[58]), .B2(n77), 
        .ZN(N345) );
  MOAI22D1BWP30P140 U117 ( .A1(n70), .A2(n19), .B1(i_data_bus[39]), .B2(n77), 
        .ZN(N326) );
  INVD1BWP30P140 U118 ( .I(i_data_bus[8]), .ZN(n71) );
  MOAI22D1BWP30P140 U119 ( .A1(n71), .A2(n19), .B1(i_data_bus[40]), .B2(n77), 
        .ZN(N327) );
  INVD1BWP30P140 U120 ( .I(i_data_bus[9]), .ZN(n72) );
  MOAI22D1BWP30P140 U121 ( .A1(n72), .A2(n19), .B1(i_data_bus[41]), .B2(n77), 
        .ZN(N328) );
  INVD1BWP30P140 U122 ( .I(i_data_bus[11]), .ZN(n73) );
  MOAI22D1BWP30P140 U123 ( .A1(n73), .A2(n19), .B1(i_data_bus[43]), .B2(n77), 
        .ZN(N330) );
  INVD1BWP30P140 U124 ( .I(i_data_bus[12]), .ZN(n74) );
  MOAI22D1BWP30P140 U125 ( .A1(n74), .A2(n19), .B1(i_data_bus[44]), .B2(n77), 
        .ZN(N331) );
  INVD1BWP30P140 U126 ( .I(i_data_bus[13]), .ZN(n75) );
  MOAI22D1BWP30P140 U127 ( .A1(n75), .A2(n19), .B1(i_data_bus[45]), .B2(n77), 
        .ZN(N332) );
  INVD1BWP30P140 U128 ( .I(i_data_bus[2]), .ZN(n76) );
  MOAI22D1BWP30P140 U129 ( .A1(n76), .A2(n19), .B1(i_data_bus[34]), .B2(n77), 
        .ZN(N321) );
  INVD1BWP30P140 U130 ( .I(i_data_bus[1]), .ZN(n78) );
  MOAI22D1BWP30P140 U131 ( .A1(n78), .A2(n19), .B1(i_data_bus[33]), .B2(n77), 
        .ZN(N320) );
  INVD1BWP30P140 U132 ( .I(i_data_bus[60]), .ZN(n79) );
  MOAI22D1BWP30P140 U133 ( .A1(n10), .A2(n79), .B1(n98), .B2(i_data_bus[28]), 
        .ZN(N315) );
  INVD1BWP30P140 U134 ( .I(i_data_bus[48]), .ZN(n80) );
  MOAI22D1BWP30P140 U135 ( .A1(n97), .A2(n80), .B1(n98), .B2(i_data_bus[16]), 
        .ZN(N303) );
  INVD1BWP30P140 U136 ( .I(i_data_bus[34]), .ZN(n81) );
  MOAI22D1BWP30P140 U137 ( .A1(n87), .A2(n81), .B1(n98), .B2(i_data_bus[2]), 
        .ZN(N289) );
  INVD1BWP30P140 U138 ( .I(i_data_bus[59]), .ZN(n82) );
  MOAI22D1BWP30P140 U139 ( .A1(n10), .A2(n82), .B1(n98), .B2(i_data_bus[27]), 
        .ZN(N314) );
  INVD1BWP30P140 U140 ( .I(i_data_bus[47]), .ZN(n83) );
  MOAI22D1BWP30P140 U141 ( .A1(n87), .A2(n83), .B1(n98), .B2(i_data_bus[15]), 
        .ZN(N302) );
  INVD1BWP30P140 U142 ( .I(i_data_bus[58]), .ZN(n84) );
  MOAI22D1BWP30P140 U143 ( .A1(n10), .A2(n84), .B1(n98), .B2(i_data_bus[26]), 
        .ZN(N313) );
  INVD1BWP30P140 U144 ( .I(i_data_bus[46]), .ZN(n85) );
  MOAI22D1BWP30P140 U145 ( .A1(n97), .A2(n85), .B1(n98), .B2(i_data_bus[14]), 
        .ZN(N301) );
  INVD1BWP30P140 U146 ( .I(i_data_bus[32]), .ZN(n86) );
  MOAI22D1BWP30P140 U147 ( .A1(n87), .A2(n86), .B1(n98), .B2(i_data_bus[0]), 
        .ZN(N287) );
  INVD1BWP30P140 U148 ( .I(i_data_bus[57]), .ZN(n88) );
  INVD1BWP30P140 U149 ( .I(i_data_bus[45]), .ZN(n89) );
  MOAI22D1BWP30P140 U150 ( .A1(n97), .A2(n89), .B1(n98), .B2(i_data_bus[13]), 
        .ZN(N300) );
  INVD1BWP30P140 U151 ( .I(i_data_bus[56]), .ZN(n90) );
  MOAI22D1BWP30P140 U152 ( .A1(n10), .A2(n90), .B1(n98), .B2(i_data_bus[24]), 
        .ZN(N311) );
  INVD1BWP30P140 U153 ( .I(i_data_bus[44]), .ZN(n91) );
  MOAI22D1BWP30P140 U154 ( .A1(n97), .A2(n91), .B1(n98), .B2(i_data_bus[12]), 
        .ZN(N299) );
  INVD1BWP30P140 U155 ( .I(i_data_bus[55]), .ZN(n92) );
  MOAI22D1BWP30P140 U156 ( .A1(n10), .A2(n92), .B1(n98), .B2(i_data_bus[23]), 
        .ZN(N310) );
  INVD1BWP30P140 U157 ( .I(i_data_bus[43]), .ZN(n93) );
  MOAI22D1BWP30P140 U158 ( .A1(n97), .A2(n93), .B1(n98), .B2(i_data_bus[11]), 
        .ZN(N298) );
  INVD1BWP30P140 U159 ( .I(i_data_bus[54]), .ZN(n94) );
  MOAI22D1BWP30P140 U160 ( .A1(n10), .A2(n94), .B1(n98), .B2(i_data_bus[22]), 
        .ZN(N309) );
  INVD1BWP30P140 U161 ( .I(i_data_bus[42]), .ZN(n95) );
  MOAI22D1BWP30P140 U162 ( .A1(n97), .A2(n95), .B1(n98), .B2(i_data_bus[10]), 
        .ZN(N297) );
  INVD1BWP30P140 U163 ( .I(i_data_bus[41]), .ZN(n96) );
  MOAI22D1BWP30P140 U164 ( .A1(n97), .A2(n96), .B1(n98), .B2(i_data_bus[9]), 
        .ZN(N296) );
  INVD1BWP30P140 U165 ( .I(i_data_bus[52]), .ZN(n99) );
  MOAI22D1BWP30P140 U166 ( .A1(n10), .A2(n99), .B1(n98), .B2(i_data_bus[20]), 
        .ZN(N307) );
endmodule


module benes_simple_seq ( clk, rst, i_valid, i_data_bus, o_valid, o_data_bus, 
        i_en, i_cmd );
  input [7:0] i_valid;
  input [255:0] i_data_bus;
  output [7:0] o_valid;
  output [255:0] o_data_bus;
  input [39:0] i_cmd;
  input clk, rst, i_en;
  wire   n271, n272, n273, n274, n275, n276, n277, n278, n279, n280, n281,
         n282, n283, n284, n285, n286, n287, n288, n289, n290, n291, n292,
         n293, n294, n295, n296, n297, n298, n299, n300, n301, n302, n303,
         n304, n305, n306, n307, n308, n309, n310, n311, n312, n313, n314,
         n315, n316, n317, n318, n319, n320, n321, n322, n323, n324, n325,
         n326, n327, n328, n329, n330, n331, n332, n333, n334, n335, n336,
         n337, n338, n339, n340, n341, n342, n343, n344, n345, n346, n347,
         n348, n349, n350, n351, n352, n353, n354, n355, n356, n357, n358,
         n359, n360, n361, n362, n363, n364, n365, n366, n367, n368, n369,
         n370, n371, n372, n373, n374, n375, n376, n377, n378, n379, n380,
         n381, n382, n383, n384, n385, n386, n387, n388, n389, n390, n391,
         n392, n393, n394, n395, n396, n397, n398, n399, n400, n401, n402,
         n403, n404, n405, n406, n407, n408, n409, n410, n411, n412, n413,
         n414, n415, n416, n417, n418, n419, n420, n421, n422, n423, n424,
         n425, n426, n427, n428, n429, n430, n431, n432, n433, n434, n435,
         n436, n437, n438, n439, n440, n441, n442, n443, n444, n445, n446,
         n447, n448, n449, n450, n451, n452, n453, n454, n455, n456, n457,
         n458, n459, n460, n461, n462, n463, n464, n465, n466, n467, n468,
         n469, n470, n471, n472, n473, n474, n475, n476, n477, n478, n479,
         n480, n481, n482, n483, n484, n485, n486, n487, n488, n489, n490,
         n491, n492, n493, n494, n495, n496, n497, n498, n499, n500, n501,
         n502, n503, n504, n505, n506, n507, n508, n509, n510, n511, n512,
         n513, n514, n515, n516, n517, n518, n519, n520, n521, n522, n523,
         n524, n525, n526, n527, n528, n529, n530, n531, n532, n533, n534,
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
         connection_3__7__2_, connection_3__7__1_, connection_3__7__0_, n260,
         n263, n266, n269;
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
        .o_valid({n277, n278}), .o_data_bus({n471, n472, n473, n474, n475, 
        n476, n477, n478, n479, n480, n481, n482, n483, n484, n485, n486, n487, 
        n488, n489, n490, n491, n492, n493, n494, n495, n496, n497, n498, n499, 
        n500, n501, n502, n503, n504, n505, n506, n507, n508, n509, n510, n511, 
        n512, n513, n514, n515, n516, n517, n518, n519, n520, n521, n522, n523, 
        n524, n525, n526, n527, n528, n529, n530, n531, n532, n533, n534}), 
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
        .o_valid({n275, n276}), .o_data_bus({n407, n408, n409, n410, n411, 
        n412, n413, n414, n415, n416, n417, n418, n419, n420, n421, n422, n423, 
        n424, n425, n426, n427, n428, n429, n430, n431, n432, n433, n434, n435, 
        n436, n437, n438, n439, n440, n441, n442, n443, n444, n445, n446, n447, 
        n448, n449, n450, n451, n452, n453, n454, n455, n456, n457, n458, n459, 
        n460, n461, n462, n463, n464, n465, n466, n467, n468, n469, n470}), 
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
        .o_valid({n273, n274}), .o_data_bus({n343, n344, n345, n346, n347, 
        n348, n349, n350, n351, n352, n353, n354, n355, n356, n357, n358, n359, 
        n360, n361, n362, n363, n364, n365, n366, n367, n368, n369, n370, n371, 
        n372, n373, n374, n375, n376, n377, n378, n379, n380, n381, n382, n383, 
        n384, n385, n386, n387, n388, n389, n390, n391, n392, n393, n394, n395, 
        n396, n397, n398, n399, n400, n401, n402, n403, n404, n405, n406}), 
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
        .o_valid({n271, n272}), .o_data_bus({n279, n280, n281, n282, n283, 
        n284, n285, n286, n287, n288, n289, n290, n291, n292, n293, n294, n295, 
        n296, n297, n298, n299, n300, n301, n302, n303, n304, n305, n306, n307, 
        n308, n309, n310, n311, n312, n313, n314, n315, n316, n317, n318, n319, 
        n320, n321, n322, n323, n324, n325, n326, n327, n328, n329, n330, n331, 
        n332, n333, n334, n335, n336, n337, n338, n339, n340, n341, n342}), 
        .i_en(i_en), .i_cmd(cmd_pipeline_stage_3__pipeline_i_cmd_reg[1:0]) );
  DFQD1BWP30P140 cmd_pipeline_stage_0__pipeline_i_cmd_reg_reg_1__0__1_ ( .D(
        i_cmd[17]), .CP(clk), .Q(cmd_pipeline_stage_0__pipeline_i_cmd_reg[23])
         );
  DFQD1BWP30P140 cmd_pipeline_stage_0__pipeline_i_cmd_reg_reg_1__0__0_ ( .D(
        i_cmd[16]), .CP(clk), .Q(cmd_pipeline_stage_0__pipeline_i_cmd_reg[22])
         );
  DFQD1BWP30P140 cmd_pipeline_stage_0__pipeline_i_cmd_reg_reg_1__1__1_ ( .D(
        i_cmd[19]), .CP(clk), .Q(cmd_pipeline_stage_0__pipeline_i_cmd_reg[21])
         );
  DFQD1BWP30P140 cmd_pipeline_stage_0__pipeline_i_cmd_reg_reg_1__1__0_ ( .D(
        i_cmd[18]), .CP(clk), .Q(cmd_pipeline_stage_0__pipeline_i_cmd_reg[20])
         );
  DFQD1BWP30P140 cmd_pipeline_stage_0__pipeline_i_cmd_reg_reg_1__2__1_ ( .D(
        i_cmd[21]), .CP(clk), .Q(cmd_pipeline_stage_0__pipeline_i_cmd_reg[19])
         );
  DFQD1BWP30P140 cmd_pipeline_stage_0__pipeline_i_cmd_reg_reg_1__2__0_ ( .D(
        i_cmd[20]), .CP(clk), .Q(cmd_pipeline_stage_0__pipeline_i_cmd_reg[18])
         );
  DFQD1BWP30P140 cmd_pipeline_stage_0__pipeline_i_cmd_reg_reg_1__3__1_ ( .D(
        i_cmd[23]), .CP(clk), .Q(cmd_pipeline_stage_0__pipeline_i_cmd_reg[17])
         );
  DFQD1BWP30P140 cmd_pipeline_stage_0__pipeline_i_cmd_reg_reg_1__3__0_ ( .D(
        i_cmd[22]), .CP(clk), .Q(cmd_pipeline_stage_0__pipeline_i_cmd_reg[16])
         );
  DFQD1BWP30P140 cmd_pipeline_stage_0__pipeline_i_cmd_reg_reg_2__0__1_ ( .D(
        i_cmd[25]), .CP(clk), .Q(cmd_pipeline_stage_0__pipeline_i_cmd_reg[15])
         );
  DFQD1BWP30P140 cmd_pipeline_stage_0__pipeline_i_cmd_reg_reg_2__0__0_ ( .D(
        i_cmd[24]), .CP(clk), .Q(cmd_pipeline_stage_0__pipeline_i_cmd_reg[14])
         );
  DFQD1BWP30P140 cmd_pipeline_stage_0__pipeline_i_cmd_reg_reg_2__1__1_ ( .D(
        i_cmd[27]), .CP(clk), .Q(cmd_pipeline_stage_0__pipeline_i_cmd_reg[13])
         );
  DFQD1BWP30P140 cmd_pipeline_stage_0__pipeline_i_cmd_reg_reg_2__1__0_ ( .D(
        i_cmd[26]), .CP(clk), .Q(cmd_pipeline_stage_0__pipeline_i_cmd_reg[12])
         );
  DFQD1BWP30P140 cmd_pipeline_stage_0__pipeline_i_cmd_reg_reg_2__2__1_ ( .D(
        i_cmd[29]), .CP(clk), .Q(cmd_pipeline_stage_0__pipeline_i_cmd_reg[11])
         );
  DFQD1BWP30P140 cmd_pipeline_stage_0__pipeline_i_cmd_reg_reg_2__2__0_ ( .D(
        i_cmd[28]), .CP(clk), .Q(cmd_pipeline_stage_0__pipeline_i_cmd_reg[10])
         );
  DFQD1BWP30P140 cmd_pipeline_stage_0__pipeline_i_cmd_reg_reg_2__3__1_ ( .D(
        i_cmd[31]), .CP(clk), .Q(cmd_pipeline_stage_0__pipeline_i_cmd_reg[9])
         );
  DFQD1BWP30P140 cmd_pipeline_stage_0__pipeline_i_cmd_reg_reg_2__3__0_ ( .D(
        i_cmd[30]), .CP(clk), .Q(cmd_pipeline_stage_0__pipeline_i_cmd_reg[8])
         );
  DFQD1BWP30P140 cmd_pipeline_stage_0__pipeline_i_cmd_reg_reg_3__0__1_ ( .D(
        i_cmd[33]), .CP(clk), .Q(cmd_pipeline_stage_0__pipeline_i_cmd_reg[7])
         );
  DFQD1BWP30P140 cmd_pipeline_stage_0__pipeline_i_cmd_reg_reg_3__0__0_ ( .D(
        i_cmd[32]), .CP(clk), .Q(cmd_pipeline_stage_0__pipeline_i_cmd_reg[6])
         );
  DFQD1BWP30P140 cmd_pipeline_stage_0__pipeline_i_cmd_reg_reg_3__1__1_ ( .D(
        i_cmd[35]), .CP(clk), .Q(cmd_pipeline_stage_0__pipeline_i_cmd_reg[5])
         );
  DFQD1BWP30P140 cmd_pipeline_stage_0__pipeline_i_cmd_reg_reg_3__1__0_ ( .D(
        i_cmd[34]), .CP(clk), .Q(cmd_pipeline_stage_0__pipeline_i_cmd_reg[4])
         );
  DFQD1BWP30P140 cmd_pipeline_stage_0__pipeline_i_cmd_reg_reg_3__2__1_ ( .D(
        i_cmd[37]), .CP(clk), .Q(cmd_pipeline_stage_0__pipeline_i_cmd_reg[3])
         );
  DFQD1BWP30P140 cmd_pipeline_stage_0__pipeline_i_cmd_reg_reg_3__2__0_ ( .D(
        i_cmd[36]), .CP(clk), .Q(cmd_pipeline_stage_0__pipeline_i_cmd_reg[2])
         );
  DFQD1BWP30P140 cmd_pipeline_stage_0__pipeline_i_cmd_reg_reg_3__3__1_ ( .D(
        i_cmd[39]), .CP(clk), .Q(cmd_pipeline_stage_0__pipeline_i_cmd_reg[1])
         );
  DFQD1BWP30P140 cmd_pipeline_stage_0__pipeline_i_cmd_reg_reg_3__3__0_ ( .D(
        i_cmd[38]), .CP(clk), .Q(cmd_pipeline_stage_0__pipeline_i_cmd_reg[0])
         );
  DFQD1BWP30P140 cmd_pipeline_stage_1__pipeline_i_cmd_reg_reg_1__0__1_ ( .D(
        cmd_pipeline_stage_0__pipeline_i_cmd_reg[15]), .CP(clk), .Q(
        cmd_pipeline_stage_1__pipeline_i_cmd_reg[15]) );
  DFQD1BWP30P140 cmd_pipeline_stage_1__pipeline_i_cmd_reg_reg_1__0__0_ ( .D(
        cmd_pipeline_stage_0__pipeline_i_cmd_reg[14]), .CP(clk), .Q(
        cmd_pipeline_stage_1__pipeline_i_cmd_reg[14]) );
  DFQD1BWP30P140 cmd_pipeline_stage_1__pipeline_i_cmd_reg_reg_1__1__1_ ( .D(
        cmd_pipeline_stage_0__pipeline_i_cmd_reg[13]), .CP(clk), .Q(
        cmd_pipeline_stage_1__pipeline_i_cmd_reg[13]) );
  DFQD1BWP30P140 cmd_pipeline_stage_1__pipeline_i_cmd_reg_reg_1__1__0_ ( .D(
        cmd_pipeline_stage_0__pipeline_i_cmd_reg[12]), .CP(clk), .Q(
        cmd_pipeline_stage_1__pipeline_i_cmd_reg[12]) );
  DFQD1BWP30P140 cmd_pipeline_stage_1__pipeline_i_cmd_reg_reg_1__2__1_ ( .D(
        cmd_pipeline_stage_0__pipeline_i_cmd_reg[11]), .CP(clk), .Q(
        cmd_pipeline_stage_1__pipeline_i_cmd_reg[11]) );
  DFQD1BWP30P140 cmd_pipeline_stage_1__pipeline_i_cmd_reg_reg_1__2__0_ ( .D(
        cmd_pipeline_stage_0__pipeline_i_cmd_reg[10]), .CP(clk), .Q(
        cmd_pipeline_stage_1__pipeline_i_cmd_reg[10]) );
  DFQD1BWP30P140 cmd_pipeline_stage_1__pipeline_i_cmd_reg_reg_1__3__1_ ( .D(
        cmd_pipeline_stage_0__pipeline_i_cmd_reg[9]), .CP(clk), .Q(
        cmd_pipeline_stage_1__pipeline_i_cmd_reg[9]) );
  DFQD1BWP30P140 cmd_pipeline_stage_1__pipeline_i_cmd_reg_reg_1__3__0_ ( .D(
        cmd_pipeline_stage_0__pipeline_i_cmd_reg[8]), .CP(clk), .Q(
        cmd_pipeline_stage_1__pipeline_i_cmd_reg[8]) );
  DFQD1BWP30P140 cmd_pipeline_stage_1__pipeline_i_cmd_reg_reg_2__0__1_ ( .D(
        cmd_pipeline_stage_0__pipeline_i_cmd_reg[7]), .CP(clk), .Q(
        cmd_pipeline_stage_1__pipeline_i_cmd_reg[7]) );
  DFQD1BWP30P140 cmd_pipeline_stage_1__pipeline_i_cmd_reg_reg_2__0__0_ ( .D(
        cmd_pipeline_stage_0__pipeline_i_cmd_reg[6]), .CP(clk), .Q(
        cmd_pipeline_stage_1__pipeline_i_cmd_reg[6]) );
  DFQD1BWP30P140 cmd_pipeline_stage_1__pipeline_i_cmd_reg_reg_2__1__1_ ( .D(
        cmd_pipeline_stage_0__pipeline_i_cmd_reg[5]), .CP(clk), .Q(
        cmd_pipeline_stage_1__pipeline_i_cmd_reg[5]) );
  DFQD1BWP30P140 cmd_pipeline_stage_1__pipeline_i_cmd_reg_reg_2__1__0_ ( .D(
        cmd_pipeline_stage_0__pipeline_i_cmd_reg[4]), .CP(clk), .Q(
        cmd_pipeline_stage_1__pipeline_i_cmd_reg[4]) );
  DFQD1BWP30P140 cmd_pipeline_stage_1__pipeline_i_cmd_reg_reg_2__2__1_ ( .D(
        cmd_pipeline_stage_0__pipeline_i_cmd_reg[3]), .CP(clk), .Q(
        cmd_pipeline_stage_1__pipeline_i_cmd_reg[3]) );
  DFQD1BWP30P140 cmd_pipeline_stage_1__pipeline_i_cmd_reg_reg_2__2__0_ ( .D(
        cmd_pipeline_stage_0__pipeline_i_cmd_reg[2]), .CP(clk), .Q(
        cmd_pipeline_stage_1__pipeline_i_cmd_reg[2]) );
  DFQD1BWP30P140 cmd_pipeline_stage_1__pipeline_i_cmd_reg_reg_2__3__1_ ( .D(
        cmd_pipeline_stage_0__pipeline_i_cmd_reg[1]), .CP(clk), .Q(
        cmd_pipeline_stage_1__pipeline_i_cmd_reg[1]) );
  DFQD1BWP30P140 cmd_pipeline_stage_1__pipeline_i_cmd_reg_reg_2__3__0_ ( .D(
        cmd_pipeline_stage_0__pipeline_i_cmd_reg[0]), .CP(clk), .Q(
        cmd_pipeline_stage_1__pipeline_i_cmd_reg[0]) );
  DFQD1BWP30P140 cmd_pipeline_stage_2__pipeline_i_cmd_reg_reg_0__3__0_ ( .D(
        cmd_pipeline_stage_1__pipeline_i_cmd_reg[8]), .CP(clk), .Q(
        cmd_pipeline_stage_2__pipeline_i_cmd_reg[8]) );
  DFQD1BWP30P140 cmd_pipeline_stage_2__pipeline_i_cmd_reg_reg_1__0__1_ ( .D(
        cmd_pipeline_stage_1__pipeline_i_cmd_reg[7]), .CP(clk), .Q(
        cmd_pipeline_stage_2__pipeline_i_cmd_reg[7]) );
  DFQD1BWP30P140 cmd_pipeline_stage_2__pipeline_i_cmd_reg_reg_1__0__0_ ( .D(
        cmd_pipeline_stage_1__pipeline_i_cmd_reg[6]), .CP(clk), .Q(
        cmd_pipeline_stage_2__pipeline_i_cmd_reg[6]) );
  DFQD1BWP30P140 cmd_pipeline_stage_2__pipeline_i_cmd_reg_reg_1__1__1_ ( .D(
        cmd_pipeline_stage_1__pipeline_i_cmd_reg[5]), .CP(clk), .Q(
        cmd_pipeline_stage_2__pipeline_i_cmd_reg[5]) );
  DFQD1BWP30P140 cmd_pipeline_stage_2__pipeline_i_cmd_reg_reg_1__1__0_ ( .D(
        cmd_pipeline_stage_1__pipeline_i_cmd_reg[4]), .CP(clk), .Q(
        cmd_pipeline_stage_2__pipeline_i_cmd_reg[4]) );
  DFQD1BWP30P140 cmd_pipeline_stage_2__pipeline_i_cmd_reg_reg_1__2__1_ ( .D(
        cmd_pipeline_stage_1__pipeline_i_cmd_reg[3]), .CP(clk), .Q(
        cmd_pipeline_stage_2__pipeline_i_cmd_reg[3]) );
  DFQD1BWP30P140 cmd_pipeline_stage_2__pipeline_i_cmd_reg_reg_1__2__0_ ( .D(
        cmd_pipeline_stage_1__pipeline_i_cmd_reg[2]), .CP(clk), .Q(
        cmd_pipeline_stage_2__pipeline_i_cmd_reg[2]) );
  DFQD1BWP30P140 cmd_pipeline_stage_2__pipeline_i_cmd_reg_reg_1__3__1_ ( .D(
        cmd_pipeline_stage_1__pipeline_i_cmd_reg[1]), .CP(clk), .Q(
        cmd_pipeline_stage_2__pipeline_i_cmd_reg[1]) );
  DFQD1BWP30P140 cmd_pipeline_stage_2__pipeline_i_cmd_reg_reg_1__3__0_ ( .D(
        cmd_pipeline_stage_1__pipeline_i_cmd_reg[0]), .CP(clk), .Q(
        cmd_pipeline_stage_2__pipeline_i_cmd_reg[0]) );
  DFQD4BWP30P140 cmd_pipeline_stage_0__pipeline_i_cmd_reg_reg_0__2__1_ ( .D(
        i_cmd[13]), .CP(clk), .Q(cmd_pipeline_stage_0__pipeline_i_cmd_reg[27])
         );
  DFQD4BWP30P140 cmd_pipeline_stage_0__pipeline_i_cmd_reg_reg_0__3__1_ ( .D(
        i_cmd[15]), .CP(clk), .Q(cmd_pipeline_stage_0__pipeline_i_cmd_reg[25])
         );
  DFQD4BWP30P140 cmd_pipeline_stage_3__pipeline_i_cmd_reg_reg_0__2__0_ ( .D(
        cmd_pipeline_stage_2__pipeline_i_cmd_reg[2]), .CP(clk), .Q(
        cmd_pipeline_stage_3__pipeline_i_cmd_reg[2]) );
  DFQD4BWP30P140 cmd_pipeline_stage_0__pipeline_i_cmd_reg_reg_0__0__1_ ( .D(
        i_cmd[9]), .CP(clk), .Q(cmd_pipeline_stage_0__pipeline_i_cmd_reg[31])
         );
  DFQD4BWP30P140 cmd_pipeline_stage_0__pipeline_i_cmd_reg_reg_0__1__1_ ( .D(
        i_cmd[11]), .CP(clk), .Q(cmd_pipeline_stage_0__pipeline_i_cmd_reg[29])
         );
  DFQD4BWP30P140 cmd_pipeline_stage_1__pipeline_i_cmd_reg_reg_0__0__1_ ( .D(
        cmd_pipeline_stage_0__pipeline_i_cmd_reg[23]), .CP(clk), .Q(
        cmd_pipeline_stage_1__pipeline_i_cmd_reg[23]) );
  DFQD4BWP30P140 cmd_pipeline_stage_1__pipeline_i_cmd_reg_reg_0__1__1_ ( .D(
        cmd_pipeline_stage_0__pipeline_i_cmd_reg[21]), .CP(clk), .Q(
        cmd_pipeline_stage_1__pipeline_i_cmd_reg[21]) );
  DFQD4BWP30P140 cmd_pipeline_stage_2__pipeline_i_cmd_reg_reg_0__0__1_ ( .D(
        cmd_pipeline_stage_1__pipeline_i_cmd_reg[15]), .CP(clk), .Q(
        cmd_pipeline_stage_2__pipeline_i_cmd_reg[15]) );
  DFQD4BWP30P140 cmd_pipeline_stage_2__pipeline_i_cmd_reg_reg_0__1__1_ ( .D(
        cmd_pipeline_stage_1__pipeline_i_cmd_reg[13]), .CP(clk), .Q(
        cmd_pipeline_stage_2__pipeline_i_cmd_reg[13]) );
  DFQD4BWP30P140 cmd_pipeline_stage_2__pipeline_i_cmd_reg_reg_0__2__1_ ( .D(
        cmd_pipeline_stage_1__pipeline_i_cmd_reg[11]), .CP(clk), .Q(
        cmd_pipeline_stage_2__pipeline_i_cmd_reg[11]) );
  DFQD4BWP30P140 cmd_pipeline_stage_2__pipeline_i_cmd_reg_reg_0__3__1_ ( .D(
        cmd_pipeline_stage_1__pipeline_i_cmd_reg[9]), .CP(clk), .Q(
        cmd_pipeline_stage_2__pipeline_i_cmd_reg[9]) );
  DFQD4BWP30P140 cmd_pipeline_stage_3__pipeline_i_cmd_reg_reg_0__3__1_ ( .D(
        cmd_pipeline_stage_2__pipeline_i_cmd_reg[1]), .CP(clk), .Q(
        cmd_pipeline_stage_3__pipeline_i_cmd_reg[1]) );
  DFQD4BWP30P140 cmd_pipeline_stage_3__pipeline_i_cmd_reg_reg_0__2__1_ ( .D(
        cmd_pipeline_stage_2__pipeline_i_cmd_reg[3]), .CP(clk), .Q(
        cmd_pipeline_stage_3__pipeline_i_cmd_reg[3]) );
  DFQD4BWP30P140 cmd_pipeline_stage_3__pipeline_i_cmd_reg_reg_0__0__1_ ( .D(
        cmd_pipeline_stage_2__pipeline_i_cmd_reg[7]), .CP(clk), .Q(
        cmd_pipeline_stage_3__pipeline_i_cmd_reg[7]) );
  DFQD4BWP30P140 cmd_pipeline_stage_3__pipeline_i_cmd_reg_reg_0__1__1_ ( .D(
        cmd_pipeline_stage_2__pipeline_i_cmd_reg[5]), .CP(clk), .Q(
        cmd_pipeline_stage_3__pipeline_i_cmd_reg[5]) );
  DFQD4BWP30P140 cmd_pipeline_stage_0__pipeline_i_cmd_reg_reg_0__1__0_ ( .D(
        i_cmd[10]), .CP(clk), .Q(cmd_pipeline_stage_0__pipeline_i_cmd_reg[28])
         );
  DFQD4BWP30P140 cmd_pipeline_stage_1__pipeline_i_cmd_reg_reg_0__1__0_ ( .D(
        cmd_pipeline_stage_0__pipeline_i_cmd_reg[20]), .CP(clk), .Q(
        cmd_pipeline_stage_1__pipeline_i_cmd_reg[20]) );
  DFQD4BWP30P140 cmd_pipeline_stage_2__pipeline_i_cmd_reg_reg_0__1__0_ ( .D(
        cmd_pipeline_stage_1__pipeline_i_cmd_reg[12]), .CP(clk), .Q(
        cmd_pipeline_stage_2__pipeline_i_cmd_reg[12]) );
  DFQD1BWP30P140 cmd_pipeline_stage_2__pipeline_i_cmd_reg_reg_0__2__0_ ( .D(
        cmd_pipeline_stage_1__pipeline_i_cmd_reg[10]), .CP(clk), .Q(
        cmd_pipeline_stage_2__pipeline_i_cmd_reg[10]) );
  DFQD1BWP30P140 cmd_pipeline_stage_2__pipeline_i_cmd_reg_reg_0__0__0_ ( .D(
        cmd_pipeline_stage_1__pipeline_i_cmd_reg[14]), .CP(clk), .Q(
        cmd_pipeline_stage_2__pipeline_i_cmd_reg[14]) );
  DFQD1BWP30P140 cmd_pipeline_stage_1__pipeline_i_cmd_reg_reg_0__3__0_ ( .D(
        cmd_pipeline_stage_0__pipeline_i_cmd_reg[16]), .CP(clk), .Q(
        cmd_pipeline_stage_1__pipeline_i_cmd_reg[16]) );
  DFQD1BWP30P140 cmd_pipeline_stage_1__pipeline_i_cmd_reg_reg_0__2__0_ ( .D(
        cmd_pipeline_stage_0__pipeline_i_cmd_reg[18]), .CP(clk), .Q(
        cmd_pipeline_stage_1__pipeline_i_cmd_reg[18]) );
  DFQD1BWP30P140 cmd_pipeline_stage_1__pipeline_i_cmd_reg_reg_0__0__0_ ( .D(
        cmd_pipeline_stage_0__pipeline_i_cmd_reg[22]), .CP(clk), .Q(
        cmd_pipeline_stage_1__pipeline_i_cmd_reg[22]) );
  DFQD1BWP30P140 cmd_pipeline_stage_0__pipeline_i_cmd_reg_reg_0__3__0_ ( .D(
        i_cmd[14]), .CP(clk), .Q(cmd_pipeline_stage_0__pipeline_i_cmd_reg[24])
         );
  DFQD1BWP30P140 cmd_pipeline_stage_0__pipeline_i_cmd_reg_reg_0__2__0_ ( .D(
        i_cmd[12]), .CP(clk), .Q(cmd_pipeline_stage_0__pipeline_i_cmd_reg[26])
         );
  DFQD1BWP30P140 cmd_pipeline_stage_0__pipeline_i_cmd_reg_reg_0__0__0_ ( .D(
        i_cmd[8]), .CP(clk), .Q(cmd_pipeline_stage_0__pipeline_i_cmd_reg[30])
         );
  DFQD2BWP30P140 cmd_pipeline_stage_3__pipeline_i_cmd_reg_reg_0__1__0_ ( .D(
        cmd_pipeline_stage_2__pipeline_i_cmd_reg[4]), .CP(clk), .Q(
        cmd_pipeline_stage_3__pipeline_i_cmd_reg[4]) );
  DFQD2BWP30P140 cmd_pipeline_stage_3__pipeline_i_cmd_reg_reg_0__3__0_ ( .D(
        cmd_pipeline_stage_2__pipeline_i_cmd_reg[0]), .CP(clk), .Q(
        cmd_pipeline_stage_3__pipeline_i_cmd_reg[0]) );
  DFQD2BWP30P140 cmd_pipeline_stage_3__pipeline_i_cmd_reg_reg_0__0__0_ ( .D(
        cmd_pipeline_stage_2__pipeline_i_cmd_reg[6]), .CP(clk), .Q(
        cmd_pipeline_stage_3__pipeline_i_cmd_reg[6]) );
  DFQD2BWP30P140 cmd_pipeline_stage_1__pipeline_i_cmd_reg_reg_0__3__1_ ( .D(
        cmd_pipeline_stage_0__pipeline_i_cmd_reg[17]), .CP(clk), .Q(
        cmd_pipeline_stage_1__pipeline_i_cmd_reg[17]) );
  DFQD2BWP30P140 cmd_pipeline_stage_1__pipeline_i_cmd_reg_reg_0__2__1_ ( .D(
        cmd_pipeline_stage_0__pipeline_i_cmd_reg[19]), .CP(clk), .Q(
        cmd_pipeline_stage_1__pipeline_i_cmd_reg[19]) );
  INVD3BWP30P140 U5 ( .I(n277), .ZN(n260) );
  INVD3BWP30P140 U6 ( .I(n275), .ZN(n263) );
  INVD3BWP30P140 U7 ( .I(n273), .ZN(n266) );
  INVD3BWP30P140 U8 ( .I(n271), .ZN(n269) );
  INVD12BWP30P140 U9 ( .I(n260), .ZN(o_valid[1]) );
  INVD12BWP30P140 U10 ( .I(n263), .ZN(o_valid[3]) );
  INVD12BWP30P140 U11 ( .I(n266), .ZN(o_valid[5]) );
  INVD12BWP30P140 U12 ( .I(n269), .ZN(o_valid[7]) );
  BUFFD12BWP30P140 U13 ( .I(n534), .Z(o_data_bus[0]) );
  BUFFD12BWP30P140 U14 ( .I(n533), .Z(o_data_bus[1]) );
  BUFFD12BWP30P140 U15 ( .I(n532), .Z(o_data_bus[2]) );
  BUFFD12BWP30P140 U16 ( .I(n531), .Z(o_data_bus[3]) );
  BUFFD12BWP30P140 U17 ( .I(n530), .Z(o_data_bus[4]) );
  BUFFD12BWP30P140 U18 ( .I(n529), .Z(o_data_bus[5]) );
  BUFFD12BWP30P140 U19 ( .I(n528), .Z(o_data_bus[6]) );
  BUFFD12BWP30P140 U20 ( .I(n527), .Z(o_data_bus[7]) );
  BUFFD12BWP30P140 U21 ( .I(n526), .Z(o_data_bus[8]) );
  BUFFD12BWP30P140 U22 ( .I(n525), .Z(o_data_bus[9]) );
  BUFFD12BWP30P140 U23 ( .I(n524), .Z(o_data_bus[10]) );
  BUFFD12BWP30P140 U24 ( .I(n523), .Z(o_data_bus[11]) );
  BUFFD12BWP30P140 U25 ( .I(n522), .Z(o_data_bus[12]) );
  BUFFD12BWP30P140 U26 ( .I(n521), .Z(o_data_bus[13]) );
  BUFFD12BWP30P140 U27 ( .I(n520), .Z(o_data_bus[14]) );
  BUFFD12BWP30P140 U28 ( .I(n519), .Z(o_data_bus[15]) );
  BUFFD12BWP30P140 U29 ( .I(n518), .Z(o_data_bus[16]) );
  BUFFD12BWP30P140 U30 ( .I(n517), .Z(o_data_bus[17]) );
  BUFFD12BWP30P140 U31 ( .I(n516), .Z(o_data_bus[18]) );
  BUFFD12BWP30P140 U32 ( .I(n515), .Z(o_data_bus[19]) );
  BUFFD12BWP30P140 U33 ( .I(n514), .Z(o_data_bus[20]) );
  BUFFD12BWP30P140 U34 ( .I(n513), .Z(o_data_bus[21]) );
  BUFFD12BWP30P140 U35 ( .I(n512), .Z(o_data_bus[22]) );
  BUFFD12BWP30P140 U36 ( .I(n511), .Z(o_data_bus[23]) );
  BUFFD12BWP30P140 U37 ( .I(n510), .Z(o_data_bus[24]) );
  BUFFD12BWP30P140 U38 ( .I(n509), .Z(o_data_bus[25]) );
  BUFFD12BWP30P140 U39 ( .I(n508), .Z(o_data_bus[26]) );
  BUFFD12BWP30P140 U40 ( .I(n507), .Z(o_data_bus[27]) );
  BUFFD12BWP30P140 U41 ( .I(n506), .Z(o_data_bus[28]) );
  BUFFD12BWP30P140 U42 ( .I(n505), .Z(o_data_bus[29]) );
  BUFFD12BWP30P140 U43 ( .I(n504), .Z(o_data_bus[30]) );
  BUFFD12BWP30P140 U44 ( .I(n503), .Z(o_data_bus[31]) );
  BUFFD12BWP30P140 U45 ( .I(n502), .Z(o_data_bus[32]) );
  BUFFD12BWP30P140 U46 ( .I(n501), .Z(o_data_bus[33]) );
  BUFFD12BWP30P140 U47 ( .I(n500), .Z(o_data_bus[34]) );
  BUFFD12BWP30P140 U48 ( .I(n499), .Z(o_data_bus[35]) );
  BUFFD12BWP30P140 U49 ( .I(n498), .Z(o_data_bus[36]) );
  BUFFD12BWP30P140 U50 ( .I(n497), .Z(o_data_bus[37]) );
  BUFFD12BWP30P140 U51 ( .I(n496), .Z(o_data_bus[38]) );
  BUFFD12BWP30P140 U52 ( .I(n495), .Z(o_data_bus[39]) );
  BUFFD12BWP30P140 U53 ( .I(n494), .Z(o_data_bus[40]) );
  BUFFD12BWP30P140 U54 ( .I(n493), .Z(o_data_bus[41]) );
  BUFFD12BWP30P140 U55 ( .I(n492), .Z(o_data_bus[42]) );
  BUFFD12BWP30P140 U56 ( .I(n491), .Z(o_data_bus[43]) );
  BUFFD12BWP30P140 U57 ( .I(n490), .Z(o_data_bus[44]) );
  BUFFD12BWP30P140 U58 ( .I(n489), .Z(o_data_bus[45]) );
  BUFFD12BWP30P140 U59 ( .I(n488), .Z(o_data_bus[46]) );
  BUFFD12BWP30P140 U60 ( .I(n487), .Z(o_data_bus[47]) );
  BUFFD12BWP30P140 U61 ( .I(n486), .Z(o_data_bus[48]) );
  BUFFD12BWP30P140 U62 ( .I(n485), .Z(o_data_bus[49]) );
  BUFFD12BWP30P140 U63 ( .I(n484), .Z(o_data_bus[50]) );
  BUFFD12BWP30P140 U64 ( .I(n483), .Z(o_data_bus[51]) );
  BUFFD12BWP30P140 U65 ( .I(n482), .Z(o_data_bus[52]) );
  BUFFD12BWP30P140 U66 ( .I(n481), .Z(o_data_bus[53]) );
  BUFFD12BWP30P140 U67 ( .I(n480), .Z(o_data_bus[54]) );
  BUFFD12BWP30P140 U68 ( .I(n479), .Z(o_data_bus[55]) );
  BUFFD12BWP30P140 U69 ( .I(n478), .Z(o_data_bus[56]) );
  BUFFD12BWP30P140 U70 ( .I(n477), .Z(o_data_bus[57]) );
  BUFFD12BWP30P140 U71 ( .I(n476), .Z(o_data_bus[58]) );
  BUFFD12BWP30P140 U72 ( .I(n475), .Z(o_data_bus[59]) );
  BUFFD12BWP30P140 U73 ( .I(n474), .Z(o_data_bus[60]) );
  BUFFD12BWP30P140 U74 ( .I(n473), .Z(o_data_bus[61]) );
  BUFFD12BWP30P140 U75 ( .I(n472), .Z(o_data_bus[62]) );
  BUFFD12BWP30P140 U76 ( .I(n471), .Z(o_data_bus[63]) );
  BUFFD12BWP30P140 U77 ( .I(n470), .Z(o_data_bus[64]) );
  BUFFD12BWP30P140 U78 ( .I(n469), .Z(o_data_bus[65]) );
  BUFFD12BWP30P140 U79 ( .I(n468), .Z(o_data_bus[66]) );
  BUFFD12BWP30P140 U80 ( .I(n467), .Z(o_data_bus[67]) );
  BUFFD12BWP30P140 U81 ( .I(n466), .Z(o_data_bus[68]) );
  BUFFD12BWP30P140 U82 ( .I(n465), .Z(o_data_bus[69]) );
  BUFFD12BWP30P140 U83 ( .I(n464), .Z(o_data_bus[70]) );
  BUFFD12BWP30P140 U84 ( .I(n463), .Z(o_data_bus[71]) );
  BUFFD12BWP30P140 U85 ( .I(n462), .Z(o_data_bus[72]) );
  BUFFD12BWP30P140 U86 ( .I(n461), .Z(o_data_bus[73]) );
  BUFFD12BWP30P140 U87 ( .I(n460), .Z(o_data_bus[74]) );
  BUFFD12BWP30P140 U88 ( .I(n459), .Z(o_data_bus[75]) );
  BUFFD12BWP30P140 U89 ( .I(n458), .Z(o_data_bus[76]) );
  BUFFD12BWP30P140 U90 ( .I(n457), .Z(o_data_bus[77]) );
  BUFFD12BWP30P140 U91 ( .I(n456), .Z(o_data_bus[78]) );
  BUFFD12BWP30P140 U92 ( .I(n455), .Z(o_data_bus[79]) );
  BUFFD12BWP30P140 U93 ( .I(n454), .Z(o_data_bus[80]) );
  BUFFD12BWP30P140 U94 ( .I(n453), .Z(o_data_bus[81]) );
  BUFFD12BWP30P140 U95 ( .I(n452), .Z(o_data_bus[82]) );
  BUFFD12BWP30P140 U96 ( .I(n451), .Z(o_data_bus[83]) );
  BUFFD12BWP30P140 U97 ( .I(n450), .Z(o_data_bus[84]) );
  BUFFD12BWP30P140 U98 ( .I(n449), .Z(o_data_bus[85]) );
  BUFFD12BWP30P140 U99 ( .I(n448), .Z(o_data_bus[86]) );
  BUFFD12BWP30P140 U100 ( .I(n447), .Z(o_data_bus[87]) );
  BUFFD12BWP30P140 U101 ( .I(n446), .Z(o_data_bus[88]) );
  BUFFD12BWP30P140 U102 ( .I(n445), .Z(o_data_bus[89]) );
  BUFFD12BWP30P140 U103 ( .I(n444), .Z(o_data_bus[90]) );
  BUFFD12BWP30P140 U104 ( .I(n443), .Z(o_data_bus[91]) );
  BUFFD12BWP30P140 U105 ( .I(n442), .Z(o_data_bus[92]) );
  BUFFD12BWP30P140 U106 ( .I(n441), .Z(o_data_bus[93]) );
  BUFFD12BWP30P140 U107 ( .I(n440), .Z(o_data_bus[94]) );
  BUFFD12BWP30P140 U108 ( .I(n439), .Z(o_data_bus[95]) );
  BUFFD12BWP30P140 U109 ( .I(n438), .Z(o_data_bus[96]) );
  BUFFD12BWP30P140 U110 ( .I(n437), .Z(o_data_bus[97]) );
  BUFFD12BWP30P140 U111 ( .I(n436), .Z(o_data_bus[98]) );
  BUFFD12BWP30P140 U112 ( .I(n435), .Z(o_data_bus[99]) );
  BUFFD12BWP30P140 U113 ( .I(n434), .Z(o_data_bus[100]) );
  BUFFD12BWP30P140 U114 ( .I(n433), .Z(o_data_bus[101]) );
  BUFFD12BWP30P140 U115 ( .I(n432), .Z(o_data_bus[102]) );
  BUFFD12BWP30P140 U116 ( .I(n431), .Z(o_data_bus[103]) );
  BUFFD12BWP30P140 U117 ( .I(n430), .Z(o_data_bus[104]) );
  BUFFD12BWP30P140 U118 ( .I(n429), .Z(o_data_bus[105]) );
  BUFFD12BWP30P140 U119 ( .I(n428), .Z(o_data_bus[106]) );
  BUFFD12BWP30P140 U120 ( .I(n427), .Z(o_data_bus[107]) );
  BUFFD12BWP30P140 U121 ( .I(n426), .Z(o_data_bus[108]) );
  BUFFD12BWP30P140 U122 ( .I(n425), .Z(o_data_bus[109]) );
  BUFFD12BWP30P140 U123 ( .I(n424), .Z(o_data_bus[110]) );
  BUFFD12BWP30P140 U124 ( .I(n423), .Z(o_data_bus[111]) );
  BUFFD12BWP30P140 U125 ( .I(n422), .Z(o_data_bus[112]) );
  BUFFD12BWP30P140 U126 ( .I(n421), .Z(o_data_bus[113]) );
  BUFFD12BWP30P140 U127 ( .I(n420), .Z(o_data_bus[114]) );
  BUFFD12BWP30P140 U128 ( .I(n419), .Z(o_data_bus[115]) );
  BUFFD12BWP30P140 U129 ( .I(n418), .Z(o_data_bus[116]) );
  BUFFD12BWP30P140 U130 ( .I(n417), .Z(o_data_bus[117]) );
  BUFFD12BWP30P140 U131 ( .I(n416), .Z(o_data_bus[118]) );
  BUFFD12BWP30P140 U132 ( .I(n415), .Z(o_data_bus[119]) );
  BUFFD12BWP30P140 U133 ( .I(n414), .Z(o_data_bus[120]) );
  BUFFD12BWP30P140 U134 ( .I(n413), .Z(o_data_bus[121]) );
  BUFFD12BWP30P140 U135 ( .I(n412), .Z(o_data_bus[122]) );
  BUFFD12BWP30P140 U136 ( .I(n411), .Z(o_data_bus[123]) );
  BUFFD12BWP30P140 U137 ( .I(n410), .Z(o_data_bus[124]) );
  BUFFD12BWP30P140 U138 ( .I(n409), .Z(o_data_bus[125]) );
  BUFFD12BWP30P140 U139 ( .I(n408), .Z(o_data_bus[126]) );
  BUFFD12BWP30P140 U140 ( .I(n407), .Z(o_data_bus[127]) );
  BUFFD12BWP30P140 U141 ( .I(n406), .Z(o_data_bus[128]) );
  BUFFD12BWP30P140 U142 ( .I(n405), .Z(o_data_bus[129]) );
  BUFFD12BWP30P140 U143 ( .I(n404), .Z(o_data_bus[130]) );
  BUFFD12BWP30P140 U144 ( .I(n403), .Z(o_data_bus[131]) );
  BUFFD12BWP30P140 U145 ( .I(n402), .Z(o_data_bus[132]) );
  BUFFD12BWP30P140 U146 ( .I(n401), .Z(o_data_bus[133]) );
  BUFFD12BWP30P140 U147 ( .I(n400), .Z(o_data_bus[134]) );
  BUFFD12BWP30P140 U148 ( .I(n399), .Z(o_data_bus[135]) );
  BUFFD12BWP30P140 U149 ( .I(n398), .Z(o_data_bus[136]) );
  BUFFD12BWP30P140 U150 ( .I(n397), .Z(o_data_bus[137]) );
  BUFFD12BWP30P140 U151 ( .I(n396), .Z(o_data_bus[138]) );
  BUFFD12BWP30P140 U152 ( .I(n395), .Z(o_data_bus[139]) );
  BUFFD12BWP30P140 U153 ( .I(n394), .Z(o_data_bus[140]) );
  BUFFD12BWP30P140 U154 ( .I(n393), .Z(o_data_bus[141]) );
  BUFFD12BWP30P140 U155 ( .I(n392), .Z(o_data_bus[142]) );
  BUFFD12BWP30P140 U156 ( .I(n391), .Z(o_data_bus[143]) );
  BUFFD12BWP30P140 U157 ( .I(n390), .Z(o_data_bus[144]) );
  BUFFD12BWP30P140 U158 ( .I(n389), .Z(o_data_bus[145]) );
  BUFFD12BWP30P140 U159 ( .I(n388), .Z(o_data_bus[146]) );
  BUFFD12BWP30P140 U160 ( .I(n387), .Z(o_data_bus[147]) );
  BUFFD12BWP30P140 U161 ( .I(n386), .Z(o_data_bus[148]) );
  BUFFD12BWP30P140 U162 ( .I(n385), .Z(o_data_bus[149]) );
  BUFFD12BWP30P140 U163 ( .I(n384), .Z(o_data_bus[150]) );
  BUFFD12BWP30P140 U164 ( .I(n383), .Z(o_data_bus[151]) );
  BUFFD12BWP30P140 U165 ( .I(n382), .Z(o_data_bus[152]) );
  BUFFD12BWP30P140 U166 ( .I(n381), .Z(o_data_bus[153]) );
  BUFFD12BWP30P140 U167 ( .I(n380), .Z(o_data_bus[154]) );
  BUFFD12BWP30P140 U168 ( .I(n379), .Z(o_data_bus[155]) );
  BUFFD12BWP30P140 U169 ( .I(n378), .Z(o_data_bus[156]) );
  BUFFD12BWP30P140 U170 ( .I(n377), .Z(o_data_bus[157]) );
  BUFFD12BWP30P140 U171 ( .I(n376), .Z(o_data_bus[158]) );
  BUFFD12BWP30P140 U172 ( .I(n375), .Z(o_data_bus[159]) );
  BUFFD12BWP30P140 U173 ( .I(n374), .Z(o_data_bus[160]) );
  BUFFD12BWP30P140 U174 ( .I(n373), .Z(o_data_bus[161]) );
  BUFFD12BWP30P140 U175 ( .I(n372), .Z(o_data_bus[162]) );
  BUFFD12BWP30P140 U176 ( .I(n371), .Z(o_data_bus[163]) );
  BUFFD12BWP30P140 U177 ( .I(n370), .Z(o_data_bus[164]) );
  BUFFD12BWP30P140 U178 ( .I(n369), .Z(o_data_bus[165]) );
  BUFFD12BWP30P140 U179 ( .I(n368), .Z(o_data_bus[166]) );
  BUFFD12BWP30P140 U180 ( .I(n367), .Z(o_data_bus[167]) );
  BUFFD12BWP30P140 U181 ( .I(n366), .Z(o_data_bus[168]) );
  BUFFD12BWP30P140 U182 ( .I(n365), .Z(o_data_bus[169]) );
  BUFFD12BWP30P140 U183 ( .I(n364), .Z(o_data_bus[170]) );
  BUFFD12BWP30P140 U184 ( .I(n363), .Z(o_data_bus[171]) );
  BUFFD12BWP30P140 U185 ( .I(n362), .Z(o_data_bus[172]) );
  BUFFD12BWP30P140 U186 ( .I(n361), .Z(o_data_bus[173]) );
  BUFFD12BWP30P140 U187 ( .I(n360), .Z(o_data_bus[174]) );
  BUFFD12BWP30P140 U188 ( .I(n359), .Z(o_data_bus[175]) );
  BUFFD12BWP30P140 U189 ( .I(n358), .Z(o_data_bus[176]) );
  BUFFD12BWP30P140 U190 ( .I(n357), .Z(o_data_bus[177]) );
  BUFFD12BWP30P140 U191 ( .I(n356), .Z(o_data_bus[178]) );
  BUFFD12BWP30P140 U192 ( .I(n355), .Z(o_data_bus[179]) );
  BUFFD12BWP30P140 U193 ( .I(n354), .Z(o_data_bus[180]) );
  BUFFD12BWP30P140 U194 ( .I(n353), .Z(o_data_bus[181]) );
  BUFFD12BWP30P140 U195 ( .I(n352), .Z(o_data_bus[182]) );
  BUFFD12BWP30P140 U196 ( .I(n351), .Z(o_data_bus[183]) );
  BUFFD12BWP30P140 U197 ( .I(n350), .Z(o_data_bus[184]) );
  BUFFD12BWP30P140 U198 ( .I(n349), .Z(o_data_bus[185]) );
  BUFFD12BWP30P140 U199 ( .I(n348), .Z(o_data_bus[186]) );
  BUFFD12BWP30P140 U200 ( .I(n347), .Z(o_data_bus[187]) );
  BUFFD12BWP30P140 U201 ( .I(n346), .Z(o_data_bus[188]) );
  BUFFD12BWP30P140 U202 ( .I(n345), .Z(o_data_bus[189]) );
  BUFFD12BWP30P140 U203 ( .I(n344), .Z(o_data_bus[190]) );
  BUFFD12BWP30P140 U204 ( .I(n343), .Z(o_data_bus[191]) );
  BUFFD12BWP30P140 U205 ( .I(n342), .Z(o_data_bus[192]) );
  BUFFD12BWP30P140 U206 ( .I(n341), .Z(o_data_bus[193]) );
  BUFFD12BWP30P140 U207 ( .I(n340), .Z(o_data_bus[194]) );
  BUFFD12BWP30P140 U208 ( .I(n339), .Z(o_data_bus[195]) );
  BUFFD12BWP30P140 U209 ( .I(n338), .Z(o_data_bus[196]) );
  BUFFD12BWP30P140 U210 ( .I(n337), .Z(o_data_bus[197]) );
  BUFFD12BWP30P140 U211 ( .I(n336), .Z(o_data_bus[198]) );
  BUFFD12BWP30P140 U212 ( .I(n335), .Z(o_data_bus[199]) );
  BUFFD12BWP30P140 U213 ( .I(n334), .Z(o_data_bus[200]) );
  BUFFD12BWP30P140 U214 ( .I(n333), .Z(o_data_bus[201]) );
  BUFFD12BWP30P140 U215 ( .I(n332), .Z(o_data_bus[202]) );
  BUFFD12BWP30P140 U216 ( .I(n331), .Z(o_data_bus[203]) );
  BUFFD12BWP30P140 U217 ( .I(n330), .Z(o_data_bus[204]) );
  BUFFD12BWP30P140 U218 ( .I(n329), .Z(o_data_bus[205]) );
  BUFFD12BWP30P140 U219 ( .I(n328), .Z(o_data_bus[206]) );
  BUFFD12BWP30P140 U220 ( .I(n327), .Z(o_data_bus[207]) );
  BUFFD12BWP30P140 U221 ( .I(n326), .Z(o_data_bus[208]) );
  BUFFD12BWP30P140 U222 ( .I(n325), .Z(o_data_bus[209]) );
  BUFFD12BWP30P140 U223 ( .I(n324), .Z(o_data_bus[210]) );
  BUFFD12BWP30P140 U224 ( .I(n323), .Z(o_data_bus[211]) );
  BUFFD12BWP30P140 U225 ( .I(n322), .Z(o_data_bus[212]) );
  BUFFD12BWP30P140 U226 ( .I(n321), .Z(o_data_bus[213]) );
  BUFFD12BWP30P140 U227 ( .I(n320), .Z(o_data_bus[214]) );
  BUFFD12BWP30P140 U228 ( .I(n319), .Z(o_data_bus[215]) );
  BUFFD12BWP30P140 U229 ( .I(n318), .Z(o_data_bus[216]) );
  BUFFD12BWP30P140 U230 ( .I(n317), .Z(o_data_bus[217]) );
  BUFFD12BWP30P140 U231 ( .I(n316), .Z(o_data_bus[218]) );
  BUFFD12BWP30P140 U232 ( .I(n315), .Z(o_data_bus[219]) );
  BUFFD12BWP30P140 U233 ( .I(n314), .Z(o_data_bus[220]) );
  BUFFD12BWP30P140 U234 ( .I(n313), .Z(o_data_bus[221]) );
  BUFFD12BWP30P140 U235 ( .I(n312), .Z(o_data_bus[222]) );
  BUFFD12BWP30P140 U236 ( .I(n311), .Z(o_data_bus[223]) );
  BUFFD12BWP30P140 U237 ( .I(n310), .Z(o_data_bus[224]) );
  BUFFD12BWP30P140 U238 ( .I(n309), .Z(o_data_bus[225]) );
  BUFFD12BWP30P140 U239 ( .I(n308), .Z(o_data_bus[226]) );
  BUFFD12BWP30P140 U240 ( .I(n307), .Z(o_data_bus[227]) );
  BUFFD12BWP30P140 U241 ( .I(n306), .Z(o_data_bus[228]) );
  BUFFD12BWP30P140 U242 ( .I(n305), .Z(o_data_bus[229]) );
  BUFFD12BWP30P140 U243 ( .I(n304), .Z(o_data_bus[230]) );
  BUFFD12BWP30P140 U244 ( .I(n303), .Z(o_data_bus[231]) );
  BUFFD12BWP30P140 U245 ( .I(n302), .Z(o_data_bus[232]) );
  BUFFD12BWP30P140 U246 ( .I(n301), .Z(o_data_bus[233]) );
  BUFFD12BWP30P140 U247 ( .I(n300), .Z(o_data_bus[234]) );
  BUFFD12BWP30P140 U248 ( .I(n299), .Z(o_data_bus[235]) );
  BUFFD12BWP30P140 U249 ( .I(n298), .Z(o_data_bus[236]) );
  BUFFD12BWP30P140 U250 ( .I(n297), .Z(o_data_bus[237]) );
  BUFFD12BWP30P140 U251 ( .I(n296), .Z(o_data_bus[238]) );
  BUFFD12BWP30P140 U252 ( .I(n295), .Z(o_data_bus[239]) );
  BUFFD12BWP30P140 U253 ( .I(n294), .Z(o_data_bus[240]) );
  BUFFD12BWP30P140 U254 ( .I(n293), .Z(o_data_bus[241]) );
  BUFFD12BWP30P140 U255 ( .I(n292), .Z(o_data_bus[242]) );
  BUFFD12BWP30P140 U256 ( .I(n291), .Z(o_data_bus[243]) );
  BUFFD12BWP30P140 U257 ( .I(n290), .Z(o_data_bus[244]) );
  BUFFD12BWP30P140 U258 ( .I(n289), .Z(o_data_bus[245]) );
  BUFFD12BWP30P140 U259 ( .I(n288), .Z(o_data_bus[246]) );
  BUFFD12BWP30P140 U260 ( .I(n287), .Z(o_data_bus[247]) );
  BUFFD12BWP30P140 U261 ( .I(n286), .Z(o_data_bus[248]) );
  BUFFD12BWP30P140 U262 ( .I(n285), .Z(o_data_bus[249]) );
  BUFFD12BWP30P140 U263 ( .I(n284), .Z(o_data_bus[250]) );
  BUFFD12BWP30P140 U264 ( .I(n283), .Z(o_data_bus[251]) );
  BUFFD12BWP30P140 U265 ( .I(n282), .Z(o_data_bus[252]) );
  BUFFD12BWP30P140 U266 ( .I(n281), .Z(o_data_bus[253]) );
  BUFFD12BWP30P140 U267 ( .I(n280), .Z(o_data_bus[254]) );
  BUFFD12BWP30P140 U268 ( .I(n279), .Z(o_data_bus[255]) );
  BUFFD12BWP30P140 U269 ( .I(n278), .Z(o_valid[0]) );
  BUFFD12BWP30P140 U270 ( .I(n276), .Z(o_valid[2]) );
  BUFFD12BWP30P140 U271 ( .I(n274), .Z(o_valid[4]) );
  BUFFD12BWP30P140 U272 ( .I(n272), .Z(o_valid[6]) );
endmodule

