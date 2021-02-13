`timescale 1ns / 1ps
/////////////////////////////////////////////////////////////
// Top Module:  adder_tree [valid signals are not supported yet]
// Data:        Only data width matters.
// Format:      keeping the input format unchange
// Timing:      Combinational Logic
// Dummy Data:  {DATA_WIDTH{1'bx}}
//
// Parameter:   NUM_INPUT_DATA could be arbitrary integer below 1024.
//
// Function:   sum all input together
//   \     /     \     / ... \     /     \     /
//    v   v       v   v  ...  v   v       v   v    
//    |¯¯¯|       |¯¯¯|  ...  |¯¯¯|       |¯¯¯|
//    |___|       |___|  ...  |___|       |___|
//      v           v    ...     v           v
//       \         /     ...      \         /    
//        \       /      ...       \       /
//         \     /       ...        \     /
//          v   v        ...         v   v
//          |¯¯¯|        ...         |¯¯¯|       
//          |___|        ...         |___|       
//            v                        v
//             \                      /     
//              \                    /  
//               ...              ...
//                ...           ...        
//                 ...        ...      
//                    \       /
//                     \     /
//                      v   v
//                      |¯¯¯|           
//                      |___|         
//                        v
//                   o_data_bus(summation of all input data)
//
// Author:      Jianming Tong (jianming.tong@gatech.edu)
/////////////////////////////////////////////////////////////

`define VAR_BIT_ADDER
// if define VAR_BIT_ADDER, the length will increase accordingly with level increasing
// Note: length increases 1 bit when enters 1 more level.


`ifdef VAR_BIT_ADDER
module adder_tree_comb#(
    parameter NUM_INPUT_DATA = 300,
    parameter DATA_WIDTH = 16,
    parameter LEVEL = $clog2(NUM_INPUT_DATA) 
)(
    // data signals
	i_valid,        // valid input data signal
	i_data_bus,     // input data bus coming into distribute switch
	
	o_valid,        // output valid
    o_data_bus,     // output data 

	// control signals
	i_en,           // distribute switch enable
);

    // Computer the NUM_INPUT_DATAber of comparator for each level.
    // And store initial address in a var.
    // START_LEVELx             store the initial index of the input at LEVELx 
    // NUM_INPUT_DATA_INPUT_LEVELx         store the total # of the input wire at LEVELx
    // IS_ODD_NUM_INPUT_DATA_INPUT_LEVELx  store whether the total # of the input wire is odd?
    // DIV2_NUM_INPUT_DATA_LEVELx          right shift of # of input wire at LEVELx (intermediate parameter)
    // NUM_INPUT_DATA_ADDER_LEVELx         store # of ADDER at LEVELx (also # of input wire at LEVEL(x+1))

    localparam   START_LEVEL0                        =  0;
    localparam   NUM_INPUT_DATA_INPUT_LEVEL0         =  NUM_INPUT_DATA;
    localparam   IS_ODD_NUM_INPUT_DATA_INPUT_LEVEL0  =  NUM_INPUT_DATA_INPUT_LEVEL0[0]==1?1:0;
    localparam   DIV2_NUM_INPUT_DATA_INPUT_LEVEL0    =  NUM_INPUT_DATA_INPUT_LEVEL0>>1;
    localparam   NUM_INPUT_DATA_ADDER_LEVEL0         =  (NUM_INPUT_DATA_INPUT_LEVEL0==1)?0:DIV2_NUM_INPUT_DATA_INPUT_LEVEL0 + IS_ODD_NUM_INPUT_DATA_INPUT_LEVEL0;
    
    localparam   START_LEVEL1                        =  START_LEVEL0 + NUM_INPUT_DATA_INPUT_LEVEL0*DATA_WIDTH;
    localparam   NUM_INPUT_DATA_INPUT_LEVEL1         =  NUM_INPUT_DATA_ADDER_LEVEL0;
    localparam   IS_ODD_NUM_INPUT_DATA_INPUT_LEVEL1  =  NUM_INPUT_DATA_INPUT_LEVEL1[0]==1?1:0;
    localparam   DIV2_NUM_INPUT_DATA_INPUT_LEVEL1    =  NUM_INPUT_DATA_INPUT_LEVEL1>>1;
    localparam   NUM_INPUT_DATA_ADDER_LEVEL1         =  (NUM_INPUT_DATA_INPUT_LEVEL1==1)?0:DIV2_NUM_INPUT_DATA_INPUT_LEVEL1 + IS_ODD_NUM_INPUT_DATA_INPUT_LEVEL1;
    
    localparam   START_LEVEL2                        =  START_LEVEL1 + NUM_INPUT_DATA_INPUT_LEVEL1*(DATA_WIDTH+1);
    localparam   NUM_INPUT_DATA_INPUT_LEVEL2         =  NUM_INPUT_DATA_ADDER_LEVEL1;
    localparam   IS_ODD_NUM_INPUT_DATA_INPUT_LEVEL2  =  NUM_INPUT_DATA_INPUT_LEVEL2[0]==1?1:0;
    localparam   DIV2_NUM_INPUT_DATA_INPUT_LEVEL2    =  NUM_INPUT_DATA_INPUT_LEVEL2>>1;
    localparam   NUM_INPUT_DATA_ADDER_LEVEL2         =  (NUM_INPUT_DATA_INPUT_LEVEL2==1)?0:DIV2_NUM_INPUT_DATA_INPUT_LEVEL2 + IS_ODD_NUM_INPUT_DATA_INPUT_LEVEL2;
    
    localparam   START_LEVEL3                        =  START_LEVEL2 + NUM_INPUT_DATA_INPUT_LEVEL2*(DATA_WIDTH+2);
    localparam   NUM_INPUT_DATA_INPUT_LEVEL3         =  NUM_INPUT_DATA_ADDER_LEVEL2;
    localparam   IS_ODD_NUM_INPUT_DATA_INPUT_LEVEL3  =  NUM_INPUT_DATA_INPUT_LEVEL3[0]==1?1:0;
    localparam   DIV2_NUM_INPUT_DATA_INPUT_LEVEL3    =  NUM_INPUT_DATA_INPUT_LEVEL3>>1;
    localparam   NUM_INPUT_DATA_ADDER_LEVEL3         =  (NUM_INPUT_DATA_INPUT_LEVEL3==1)?0:DIV2_NUM_INPUT_DATA_INPUT_LEVEL3 + IS_ODD_NUM_INPUT_DATA_INPUT_LEVEL3;
    
    localparam   START_LEVEL4                        =  START_LEVEL3 + NUM_INPUT_DATA_INPUT_LEVEL3*(DATA_WIDTH+3);
    localparam   NUM_INPUT_DATA_INPUT_LEVEL4         =  NUM_INPUT_DATA_ADDER_LEVEL3;
    localparam   IS_ODD_NUM_INPUT_DATA_INPUT_LEVEL4  =  NUM_INPUT_DATA_INPUT_LEVEL4[0]==1?1:0;
    localparam   DIV2_NUM_INPUT_DATA_INPUT_LEVEL4    =  NUM_INPUT_DATA_INPUT_LEVEL4>>1;
    localparam   NUM_INPUT_DATA_ADDER_LEVEL4         =  (NUM_INPUT_DATA_INPUT_LEVEL4==1)?0:DIV2_NUM_INPUT_DATA_INPUT_LEVEL4 + IS_ODD_NUM_INPUT_DATA_INPUT_LEVEL4;
    
    localparam   START_LEVEL5                        =  START_LEVEL4 + NUM_INPUT_DATA_INPUT_LEVEL4*(DATA_WIDTH+4);
    localparam   NUM_INPUT_DATA_INPUT_LEVEL5         =  NUM_INPUT_DATA_ADDER_LEVEL4;
    localparam   IS_ODD_NUM_INPUT_DATA_INPUT_LEVEL5  =  NUM_INPUT_DATA_INPUT_LEVEL5[0]==1?1:0;
    localparam   DIV2_NUM_INPUT_DATA_INPUT_LEVEL5    =  NUM_INPUT_DATA_INPUT_LEVEL5>>1;
    localparam   NUM_INPUT_DATA_ADDER_LEVEL5         =  (NUM_INPUT_DATA_INPUT_LEVEL5==1)?0:DIV2_NUM_INPUT_DATA_INPUT_LEVEL5 + IS_ODD_NUM_INPUT_DATA_INPUT_LEVEL5;
    
    localparam   START_LEVEL6                        =  START_LEVEL5 + NUM_INPUT_DATA_INPUT_LEVEL5*(DATA_WIDTH+5);
    localparam   NUM_INPUT_DATA_INPUT_LEVEL6         =  NUM_INPUT_DATA_ADDER_LEVEL5;
    localparam   IS_ODD_NUM_INPUT_DATA_INPUT_LEVEL6  =  NUM_INPUT_DATA_INPUT_LEVEL6[0]==1?1:0;
    localparam   DIV2_NUM_INPUT_DATA_INPUT_LEVEL6    =  NUM_INPUT_DATA_INPUT_LEVEL6>>1;
    localparam   NUM_INPUT_DATA_ADDER_LEVEL6         =  (NUM_INPUT_DATA_INPUT_LEVEL6==1)?0:DIV2_NUM_INPUT_DATA_INPUT_LEVEL6 + IS_ODD_NUM_INPUT_DATA_INPUT_LEVEL6;
    
    localparam   START_LEVEL7                        =  START_LEVEL6 + NUM_INPUT_DATA_INPUT_LEVEL6*(DATA_WIDTH+6);
    localparam   NUM_INPUT_DATA_INPUT_LEVEL7         =  NUM_INPUT_DATA_ADDER_LEVEL6;
    localparam   IS_ODD_NUM_INPUT_DATA_INPUT_LEVEL7  =  NUM_INPUT_DATA_INPUT_LEVEL7[0]==1?1:0;
    localparam   DIV2_NUM_INPUT_DATA_INPUT_LEVEL7    =  NUM_INPUT_DATA_INPUT_LEVEL7>>1;
    localparam   NUM_INPUT_DATA_ADDER_LEVEL7         =  (NUM_INPUT_DATA_INPUT_LEVEL7==1)?0:DIV2_NUM_INPUT_DATA_INPUT_LEVEL7 + IS_ODD_NUM_INPUT_DATA_INPUT_LEVEL7;
    
    localparam   START_LEVEL8                        =  START_LEVEL7 + NUM_INPUT_DATA_INPUT_LEVEL7*(DATA_WIDTH+7);
    localparam   NUM_INPUT_DATA_INPUT_LEVEL8         =  NUM_INPUT_DATA_ADDER_LEVEL7;
    localparam   IS_ODD_NUM_INPUT_DATA_INPUT_LEVEL8  =  NUM_INPUT_DATA_INPUT_LEVEL8[0]==1?1:0;
    localparam   DIV2_NUM_INPUT_DATA_INPUT_LEVEL8    =  NUM_INPUT_DATA_INPUT_LEVEL8>>1;
    localparam   NUM_INPUT_DATA_ADDER_LEVEL8         =  (NUM_INPUT_DATA_INPUT_LEVEL8==1)?0:DIV2_NUM_INPUT_DATA_INPUT_LEVEL8 + IS_ODD_NUM_INPUT_DATA_INPUT_LEVEL8;
    
    localparam   START_LEVEL9                        =  START_LEVEL8 + NUM_INPUT_DATA_INPUT_LEVEL8*(DATA_WIDTH+8);
    localparam   NUM_INPUT_DATA_INPUT_LEVEL9         =  NUM_INPUT_DATA_ADDER_LEVEL8;
    localparam   IS_ODD_NUM_INPUT_DATA_INPUT_LEVEL9  =  NUM_INPUT_DATA_INPUT_LEVEL9[0]==1?1:0;
    localparam   DIV2_NUM_INPUT_DATA_INPUT_LEVEL9    =  NUM_INPUT_DATA_INPUT_LEVEL9>>1;
    localparam   NUM_INPUT_DATA_ADDER_LEVEL9         =  (NUM_INPUT_DATA_INPUT_LEVEL9==1)?0:DIV2_NUM_INPUT_DATA_INPUT_LEVEL9 + IS_ODD_NUM_INPUT_DATA_INPUT_LEVEL9;
    
    localparam   DATA_WIDTH_LAST_LEVEL               =  DATA_WIDTH+LEVEL;      
    
    localparam   START_LEVEL10                       =  START_LEVEL9  + NUM_INPUT_DATA_INPUT_LEVEL9*(DATA_WIDTH+9);
    localparam   TOTAL_BIT                           =  START_LEVEL10 + DATA_WIDTH_LAST_LEVEL;
    

	// interface
	input  [NUM_INPUT_DATA-1:0]                  i_valid;             
	input  [NUM_INPUT_DATA*DATA_WIDTH-1:0]       i_data_bus;
	
	output                                       o_valid;             
    output [DATA_WIDTH_LAST_LEVEL-1:0]           o_data_bus;

	input                                        i_en;
    
    // inner logic
    reg    [DATA_WIDTH-1:0]                      i_data_bus_inner[NUM_INPUT_DATA-1:0]; 
    reg                                          o_valid_inner;
    reg    [DATA_WIDTH_LAST_LEVEL-1:0]           o_data_bus_inner;
    wire   [START_LEVEL10-1:0]                   wire_inner;                // this extra line is used for ultimate output.
    

    // functional logic
    genvar i;
    generate
    for ( i = 0; i < NUM_INPUT_DATA ; i = i + 1)
    begin
        always@(*)
        begin
            if(i_en&i_valid[i])
            begin
                i_data_bus_inner[i]=i_data_bus[(i+1)*DATA_WIDTH-1:i*DATA_WIDTH];
            end
            else
            begin
                i_data_bus_inner[i] = {DATA_WIDTH{1'b0}};
            end
        end
    end
    endgenerate

    for (i = 0; i < NUM_INPUT_DATA_INPUT_LEVEL0; i = i + 1) 
    begin
       assign wire_inner[(i+1)*DATA_WIDTH-1:i*DATA_WIDTH] = i_data_bus_inner[i];
    end
    
    genvar index_NUM_INPUT_DATA;
    generate
        
    for (index_NUM_INPUT_DATA = 0; index_NUM_INPUT_DATA < NUM_INPUT_DATA_ADDER_LEVEL0-IS_ODD_NUM_INPUT_DATA_INPUT_LEVEL0; index_NUM_INPUT_DATA = index_NUM_INPUT_DATA + 1)
    begin
        adder_var#(.DATA_WIDTH(DATA_WIDTH)) level0(.a(wire_inner[START_LEVEL0+(2*index_NUM_INPUT_DATA+1)*DATA_WIDTH-1:START_LEVEL0+(2*index_NUM_INPUT_DATA)*DATA_WIDTH]),.b(wire_inner[START_LEVEL0+(2*index_NUM_INPUT_DATA+2)*DATA_WIDTH-1:START_LEVEL0+(2*index_NUM_INPUT_DATA+1)*DATA_WIDTH]),.out(wire_inner[START_LEVEL1+(index_NUM_INPUT_DATA+1)*(DATA_WIDTH+1)-1:START_LEVEL1+index_NUM_INPUT_DATA*(DATA_WIDTH+1)]),.out_valid());
    end
    if(IS_ODD_NUM_INPUT_DATA_INPUT_LEVEL0 && (NUM_INPUT_DATA_ADDER_LEVEL0>0))
        adder_var#(.DATA_WIDTH(DATA_WIDTH)) level0_last(.a(wire_inner[START_LEVEL0+(2*(NUM_INPUT_DATA_ADDER_LEVEL0-1)+1)*DATA_WIDTH-1:START_LEVEL0+(2*(NUM_INPUT_DATA_ADDER_LEVEL0-1))*DATA_WIDTH]),.b({DATA_WIDTH{1'b0}}),.out(wire_inner[START_LEVEL1+((NUM_INPUT_DATA_ADDER_LEVEL0 - 1)+1)*(DATA_WIDTH+1)-1:START_LEVEL1+((NUM_INPUT_DATA_ADDER_LEVEL0-1))*(DATA_WIDTH+1)]),.out_valid());
    
    for (index_NUM_INPUT_DATA = 0; index_NUM_INPUT_DATA < NUM_INPUT_DATA_ADDER_LEVEL1-IS_ODD_NUM_INPUT_DATA_INPUT_LEVEL1; index_NUM_INPUT_DATA = index_NUM_INPUT_DATA + 1)
    begin
        adder_var#(.DATA_WIDTH(DATA_WIDTH+1)) level1(.a(wire_inner[START_LEVEL1+(2*index_NUM_INPUT_DATA+1)*(DATA_WIDTH+1)-1:START_LEVEL1+(2*index_NUM_INPUT_DATA)*(DATA_WIDTH+1)]),.b(wire_inner[START_LEVEL1+(2*index_NUM_INPUT_DATA+2)*(DATA_WIDTH+1)-1:START_LEVEL1+(2*index_NUM_INPUT_DATA+1)*(DATA_WIDTH+1)]),.out(wire_inner[START_LEVEL2+(index_NUM_INPUT_DATA+1)*(DATA_WIDTH+2)-1:START_LEVEL2+index_NUM_INPUT_DATA*(DATA_WIDTH+2)]),.out_valid());
    end
    if(IS_ODD_NUM_INPUT_DATA_INPUT_LEVEL1 && (NUM_INPUT_DATA_ADDER_LEVEL1>0))
        adder_var#(.DATA_WIDTH(DATA_WIDTH+1)) level1_last(.a(wire_inner[START_LEVEL1+(2*(NUM_INPUT_DATA_ADDER_LEVEL1-1)+1)*(DATA_WIDTH+1)-1:START_LEVEL1+(2*(NUM_INPUT_DATA_ADDER_LEVEL1-1))*(DATA_WIDTH+1)]),.b({(DATA_WIDTH+1){1'b0}}),.out(wire_inner[START_LEVEL2+((NUM_INPUT_DATA_ADDER_LEVEL1 - 1)+1)*(DATA_WIDTH+2)-1:START_LEVEL2+((NUM_INPUT_DATA_ADDER_LEVEL1-1))*(DATA_WIDTH+2)]),.out_valid());
    
    for (index_NUM_INPUT_DATA = 0; index_NUM_INPUT_DATA < NUM_INPUT_DATA_ADDER_LEVEL2-IS_ODD_NUM_INPUT_DATA_INPUT_LEVEL2; index_NUM_INPUT_DATA = index_NUM_INPUT_DATA + 1)
    begin
        adder_var#(.DATA_WIDTH(DATA_WIDTH+2)) level2(.a(wire_inner[START_LEVEL2+(2*index_NUM_INPUT_DATA+1)*(DATA_WIDTH+2)-1:START_LEVEL2+(2*index_NUM_INPUT_DATA)*(DATA_WIDTH+2)]),.b(wire_inner[START_LEVEL2+(2*index_NUM_INPUT_DATA+2)*(DATA_WIDTH+2)-1:START_LEVEL2+(2*index_NUM_INPUT_DATA+1)*(DATA_WIDTH+2)]),.out(wire_inner[START_LEVEL3+(index_NUM_INPUT_DATA+1)*(DATA_WIDTH+3)-1:START_LEVEL3+index_NUM_INPUT_DATA*(DATA_WIDTH+3)]),.out_valid());
    end
    if(IS_ODD_NUM_INPUT_DATA_INPUT_LEVEL2 && (NUM_INPUT_DATA_ADDER_LEVEL2>0))
        adder_var#(.DATA_WIDTH(DATA_WIDTH+2)) level2_last(.a(wire_inner[START_LEVEL2+(2*(NUM_INPUT_DATA_ADDER_LEVEL2-1)+1)*(DATA_WIDTH+2)-1:START_LEVEL2+(2*(NUM_INPUT_DATA_ADDER_LEVEL2-1))*(DATA_WIDTH+2)]),.b({(DATA_WIDTH+2){1'b0}}),.out(wire_inner[START_LEVEL3+((NUM_INPUT_DATA_ADDER_LEVEL2 - 1)+1)*(DATA_WIDTH+3)-1:START_LEVEL3+((NUM_INPUT_DATA_ADDER_LEVEL2-1))*(DATA_WIDTH+3)]),.out_valid());
    
    for (index_NUM_INPUT_DATA = 0; index_NUM_INPUT_DATA < NUM_INPUT_DATA_ADDER_LEVEL3-IS_ODD_NUM_INPUT_DATA_INPUT_LEVEL3; index_NUM_INPUT_DATA = index_NUM_INPUT_DATA + 1)
    begin
        adder_var#(.DATA_WIDTH(DATA_WIDTH+3)) level3(.a(wire_inner[START_LEVEL3+(2*index_NUM_INPUT_DATA+1)*(DATA_WIDTH+3)-1:START_LEVEL3+(2*index_NUM_INPUT_DATA)*(DATA_WIDTH+3)]),.b(wire_inner[START_LEVEL3+(2*index_NUM_INPUT_DATA+2)*(DATA_WIDTH+3)-1:START_LEVEL3+(2*index_NUM_INPUT_DATA+1)*(DATA_WIDTH+3)]),.out(wire_inner[START_LEVEL4+(index_NUM_INPUT_DATA+1)*(DATA_WIDTH+4)-1:START_LEVEL4+index_NUM_INPUT_DATA*(DATA_WIDTH+4)]),.out_valid());
    end
    if(IS_ODD_NUM_INPUT_DATA_INPUT_LEVEL3 && (NUM_INPUT_DATA_ADDER_LEVEL3>0))
        adder_var#(.DATA_WIDTH(DATA_WIDTH+3)) level3_last(.a(wire_inner[START_LEVEL3+(2*(NUM_INPUT_DATA_ADDER_LEVEL3-1)+1)*(DATA_WIDTH+3)-1:START_LEVEL3+(2*(NUM_INPUT_DATA_ADDER_LEVEL3-1))*(DATA_WIDTH+3)]),.b({(DATA_WIDTH+3){1'b0}}),.out(wire_inner[START_LEVEL4+((NUM_INPUT_DATA_ADDER_LEVEL3 - 1)+1)*(DATA_WIDTH+4)-1:START_LEVEL4+((NUM_INPUT_DATA_ADDER_LEVEL3-1))*(DATA_WIDTH+4)]),.out_valid());
    
    for (index_NUM_INPUT_DATA = 0; index_NUM_INPUT_DATA < NUM_INPUT_DATA_ADDER_LEVEL4-IS_ODD_NUM_INPUT_DATA_INPUT_LEVEL4; index_NUM_INPUT_DATA = index_NUM_INPUT_DATA + 1)
    begin
        adder_var#(.DATA_WIDTH(DATA_WIDTH+4)) level4(.a(wire_inner[START_LEVEL4+(2*index_NUM_INPUT_DATA+1)*(DATA_WIDTH+4)-1:START_LEVEL4+(2*index_NUM_INPUT_DATA)*(DATA_WIDTH+4)]),.b(wire_inner[START_LEVEL4+(2*index_NUM_INPUT_DATA+2)*(DATA_WIDTH+4)-1:START_LEVEL4+(2*index_NUM_INPUT_DATA+1)*(DATA_WIDTH+4)]),.out(wire_inner[START_LEVEL5+(index_NUM_INPUT_DATA+1)*(DATA_WIDTH+5)-1:START_LEVEL5+index_NUM_INPUT_DATA*(DATA_WIDTH+5)]),.out_valid());
    end
    if(IS_ODD_NUM_INPUT_DATA_INPUT_LEVEL4 && (NUM_INPUT_DATA_ADDER_LEVEL4>0))
        adder_var#(.DATA_WIDTH(DATA_WIDTH+4)) level4_last(.a(wire_inner[START_LEVEL4+(2*(NUM_INPUT_DATA_ADDER_LEVEL4-1)+1)*(DATA_WIDTH+4)-1:START_LEVEL4+(2*(NUM_INPUT_DATA_ADDER_LEVEL4-1))*(DATA_WIDTH+4)]),.b({(DATA_WIDTH+4){1'b0}}),.out(wire_inner[START_LEVEL5+((NUM_INPUT_DATA_ADDER_LEVEL4 - 1)+1)*(DATA_WIDTH+5)-1:START_LEVEL5+((NUM_INPUT_DATA_ADDER_LEVEL4-1))*(DATA_WIDTH+5)]),.out_valid());
    
    for (index_NUM_INPUT_DATA = 0; index_NUM_INPUT_DATA < NUM_INPUT_DATA_ADDER_LEVEL5-IS_ODD_NUM_INPUT_DATA_INPUT_LEVEL5; index_NUM_INPUT_DATA = index_NUM_INPUT_DATA + 1)
    begin
        adder_var#(.DATA_WIDTH(DATA_WIDTH+5)) level5(.a(wire_inner[START_LEVEL5+(2*index_NUM_INPUT_DATA+1)*(DATA_WIDTH+5)-1:START_LEVEL5+(2*index_NUM_INPUT_DATA)*(DATA_WIDTH+5)]),.b(wire_inner[START_LEVEL5+(2*index_NUM_INPUT_DATA+2)*(DATA_WIDTH+5)-1:START_LEVEL5+(2*index_NUM_INPUT_DATA+1)*(DATA_WIDTH+5)]),.out(wire_inner[START_LEVEL6+(index_NUM_INPUT_DATA+1)*(DATA_WIDTH+6)-1:START_LEVEL6+index_NUM_INPUT_DATA*(DATA_WIDTH+6)]),.out_valid());
    end
    if(IS_ODD_NUM_INPUT_DATA_INPUT_LEVEL5 && (NUM_INPUT_DATA_ADDER_LEVEL5>0))
        adder_var#(.DATA_WIDTH(DATA_WIDTH+5)) level5_last(.a(wire_inner[START_LEVEL5+(2*(NUM_INPUT_DATA_ADDER_LEVEL5-1)+1)*(DATA_WIDTH+5)-1:START_LEVEL5+(2*(NUM_INPUT_DATA_ADDER_LEVEL5-1))*(DATA_WIDTH+5)]),.b({(DATA_WIDTH+5){1'b0}}),.out(wire_inner[START_LEVEL6+((NUM_INPUT_DATA_ADDER_LEVEL5 - 1)+1)*(DATA_WIDTH+6)-1:START_LEVEL6+((NUM_INPUT_DATA_ADDER_LEVEL5-1))*(DATA_WIDTH+6)]),.out_valid());
    
    for (index_NUM_INPUT_DATA = 0; index_NUM_INPUT_DATA < NUM_INPUT_DATA_ADDER_LEVEL6-IS_ODD_NUM_INPUT_DATA_INPUT_LEVEL6; index_NUM_INPUT_DATA = index_NUM_INPUT_DATA + 1)
    begin
        adder_var#(.DATA_WIDTH(DATA_WIDTH+6)) level6(.a(wire_inner[START_LEVEL6+(2*index_NUM_INPUT_DATA+1)*(DATA_WIDTH+6)-1:START_LEVEL6+(2*index_NUM_INPUT_DATA)*(DATA_WIDTH+6)]),.b(wire_inner[START_LEVEL6+(2*index_NUM_INPUT_DATA+2)*(DATA_WIDTH+6)-1:START_LEVEL6+(2*index_NUM_INPUT_DATA+1)*(DATA_WIDTH+6)]),.out(wire_inner[START_LEVEL7+(index_NUM_INPUT_DATA+1)*(DATA_WIDTH+7)-1:START_LEVEL7+index_NUM_INPUT_DATA*(DATA_WIDTH+7)]),.out_valid());
    end
    if(IS_ODD_NUM_INPUT_DATA_INPUT_LEVEL6 && (NUM_INPUT_DATA_ADDER_LEVEL6>0))
        adder_var#(.DATA_WIDTH(DATA_WIDTH+6)) level6_last(.a(wire_inner[START_LEVEL6+(2*(NUM_INPUT_DATA_ADDER_LEVEL6-1)+1)*(DATA_WIDTH+6)-1:START_LEVEL6+(2*(NUM_INPUT_DATA_ADDER_LEVEL6-1))*(DATA_WIDTH+6)]),.b({(DATA_WIDTH+6){1'b0}}),.out(wire_inner[START_LEVEL7+((NUM_INPUT_DATA_ADDER_LEVEL6 - 1)+1)*(DATA_WIDTH+7)-1:START_LEVEL7+((NUM_INPUT_DATA_ADDER_LEVEL6-1))*(DATA_WIDTH+7)]),.out_valid());
    
    for (index_NUM_INPUT_DATA = 0; index_NUM_INPUT_DATA < NUM_INPUT_DATA_ADDER_LEVEL7-IS_ODD_NUM_INPUT_DATA_INPUT_LEVEL7; index_NUM_INPUT_DATA = index_NUM_INPUT_DATA + 1)
    begin
        adder_var#(.DATA_WIDTH(DATA_WIDTH+7)) level7(.a(wire_inner[START_LEVEL7+(2*index_NUM_INPUT_DATA+1)*(DATA_WIDTH+7)-1:START_LEVEL7+(2*index_NUM_INPUT_DATA)*(DATA_WIDTH+7)]),.b(wire_inner[START_LEVEL7+(2*index_NUM_INPUT_DATA+2)*(DATA_WIDTH+7)-1:START_LEVEL7+(2*index_NUM_INPUT_DATA+1)*(DATA_WIDTH+7)]),.out(wire_inner[START_LEVEL8+(index_NUM_INPUT_DATA+1)*(DATA_WIDTH+8)-1:START_LEVEL8+index_NUM_INPUT_DATA*(DATA_WIDTH+8)]),.out_valid());
    end
    if(IS_ODD_NUM_INPUT_DATA_INPUT_LEVEL7 && (NUM_INPUT_DATA_ADDER_LEVEL7>0))
        adder_var#(.DATA_WIDTH(DATA_WIDTH+7)) level7_last(.a(wire_inner[START_LEVEL7+(2*(NUM_INPUT_DATA_ADDER_LEVEL7-1)+1)*(DATA_WIDTH+7)-1:START_LEVEL7+(2*(NUM_INPUT_DATA_ADDER_LEVEL7-1))*(DATA_WIDTH+7)]),.b({(DATA_WIDTH+7){1'b0}}),.out(wire_inner[START_LEVEL8+((NUM_INPUT_DATA_ADDER_LEVEL7 - 1)+1)*(DATA_WIDTH+8)-1:START_LEVEL8+((NUM_INPUT_DATA_ADDER_LEVEL7-1))*(DATA_WIDTH+8)]),.out_valid());
    
    for (index_NUM_INPUT_DATA = 0; index_NUM_INPUT_DATA < NUM_INPUT_DATA_ADDER_LEVEL8-IS_ODD_NUM_INPUT_DATA_INPUT_LEVEL8; index_NUM_INPUT_DATA = index_NUM_INPUT_DATA + 1)
    begin
        adder_var#(.DATA_WIDTH(DATA_WIDTH+8)) level8(.a(wire_inner[START_LEVEL8+(2*index_NUM_INPUT_DATA+1)*(DATA_WIDTH+8)-1:START_LEVEL8+(2*index_NUM_INPUT_DATA)*(DATA_WIDTH+8)]),.b(wire_inner[START_LEVEL8+(2*index_NUM_INPUT_DATA+2)*(DATA_WIDTH+8)-1:START_LEVEL8+(2*index_NUM_INPUT_DATA+1)*(DATA_WIDTH+8)]),.out(wire_inner[START_LEVEL9+(index_NUM_INPUT_DATA+1)*(DATA_WIDTH+9)-1:START_LEVEL9+index_NUM_INPUT_DATA*(DATA_WIDTH+9)]),.out_valid());
    end
    if(IS_ODD_NUM_INPUT_DATA_INPUT_LEVEL8 && (NUM_INPUT_DATA_ADDER_LEVEL8>0))
        adder_var#(.DATA_WIDTH(DATA_WIDTH+8)) level8_last(.a(wire_inner[START_LEVEL8+(2*(NUM_INPUT_DATA_ADDER_LEVEL8-1)+1)*(DATA_WIDTH+8)-1:START_LEVEL8+(2*(NUM_INPUT_DATA_ADDER_LEVEL8-1))*(DATA_WIDTH+8)]),.b({(DATA_WIDTH+8){1'b0}}),.out(wire_inner[START_LEVEL9+((NUM_INPUT_DATA_ADDER_LEVEL8 - 1)+1)*(DATA_WIDTH+9)-1:START_LEVEL9+((NUM_INPUT_DATA_ADDER_LEVEL8-1))*(DATA_WIDTH+9)]),.out_valid());
    
    for (index_NUM_INPUT_DATA = 0; index_NUM_INPUT_DATA < NUM_INPUT_DATA_ADDER_LEVEL9-IS_ODD_NUM_INPUT_DATA_INPUT_LEVEL9; index_NUM_INPUT_DATA = index_NUM_INPUT_DATA + 1)
    begin
        adder_var#(.DATA_WIDTH(DATA_WIDTH+9)) level9(.a(wire_inner[START_LEVEL9+(2*index_NUM_INPUT_DATA+1)*(DATA_WIDTH+9)-1:START_LEVEL9+(2*index_NUM_INPUT_DATA)*(DATA_WIDTH+9)]),.b(wire_inner[START_LEVEL9+(2*index_NUM_INPUT_DATA+2)*(DATA_WIDTH+9)-1:START_LEVEL9+(2*index_NUM_INPUT_DATA+1)*(DATA_WIDTH+9)]),.out(wire_inner[START_LEVEL10+(index_NUM_INPUT_DATA+1)*(DATA_WIDTH+10)-1:START_LEVEL10+index_NUM_INPUT_DATA*(DATA_WIDTH+10)]),.out_valid());
    end
    if(IS_ODD_NUM_INPUT_DATA_INPUT_LEVEL9 && (NUM_INPUT_DATA_ADDER_LEVEL9>0))
        adder_var#(.DATA_WIDTH(DATA_WIDTH+9)) level9_last(.a(wire_inner[START_LEVEL9+(2*(NUM_INPUT_DATA_ADDER_LEVEL9-1)+1)*(DATA_WIDTH+9)-1:START_LEVEL9+(2*(NUM_INPUT_DATA_ADDER_LEVEL9-1))*(DATA_WIDTH+9)]),.b({(DATA_WIDTH+9){1'b0}}),.out(wire_inner[START_LEVEL10+((NUM_INPUT_DATA_ADDER_LEVEL9 - 1)+1)*(DATA_WIDTH+10)-1:START_LEVEL10+((NUM_INPUT_DATA_ADDER_LEVEL9-1))*(DATA_WIDTH+10)]),.out_valid());
    
    endgenerate
    
    always@*
    begin
        o_data_bus_inner = wire_inner[START_LEVEL10-1:START_LEVEL10-DATA_WIDTH_LAST_LEVEL];
    end
    
    assign o_data_bus = o_data_bus_inner;
    
endmodule


module adder_var#(parameter DATA_WIDTH = 16)(
    input  [DATA_WIDTH-1:0] a,
    input  [DATA_WIDTH-1:0] b,
    output [DATA_WIDTH:0]  out,
    output                 out_valid
    );
    
    reg    [DATA_WIDTH:0]  out_inner;
    reg                    out_valid_inner;
    
    always@*
    begin
        out_inner = a + b;
        out_valid_inner = 1'b1;
    end
    
    assign out = out_inner;
    assign out_valid = out_valid_inner;
    
endmodule


`else
module adder_tree_comb#(
    parameter NUM_INPUT_DATA = 300,
    parameter DATA_WIDTH = 16,
    parameter LEVEL = $clog2(NUM_INPUT_DATA) 
)(
    // data signals
	i_valid,        // valid input data signal
	i_data_bus,     // input data bus coming into distribute switch
	
	o_valid,        // output valid
    o_data_bus,     // output data 

	// control signals
	i_en,           // distribute switch enable
);

	// interface
	input  [NUM_INPUT_DATA-1:0]                  i_valid;             
	input  [NUM_INPUT_DATA*DATA_WIDTH-1:0]       i_data_bus;
	
	output                                       o_valid;             
	output [DATA_WIDTH-1:0]                      o_data_bus; //{o_data_a, o_data_b}

	input                                        i_en;

    
    wire   [DATA_WIDTH-1:0]                      i_data_bus_inner[NUM_INPUT_DATA-1:0]; 
    reg    [DATA_WIDTH-1:0]                      o_data_bus_inner;
    
    genvar i;
    for ( i = 0; i < NUM_INPUT_DATA ; i = i + 1)
    begin
        assign i_data_bus_inner[i]=i_data_bus[(i+1)*DATA_WIDTH-1:i*DATA_WIDTH];
    end
    // English Notation
    // Computer the NUM_INPUT_DATAber of comparator for each level.
    // And store initial address in a var.
    // START_LEVELx             store the initial index of the input at LEVELx 
    // NUM_INPUT_DATA_INPUT_LEVELx         store the total # of the input wire at LEVELx
    // IS_ODD_NUM_INPUT_DATA_INPUT_LEVELx  store whether the total # of the input wire is odd?
    // DIV2_NUM_INPUT_DATA_LEVELx          right shift of # of input wire at LEVELx (intermediate parameter)
    // NUM_INPUT_DATA_ADDER_LEVELx         store # of ADDER at LEVELx (also # of input wire at LEVEL(x+1))

    localparam   START_LEVEL0             =  0;
    localparam   NUM_INPUT_DATA_INPUT_LEVEL0         =  NUM_INPUT_DATA;
    localparam   IS_ODD_NUM_INPUT_DATA_INPUT_LEVEL0  =  NUM_INPUT_DATA_INPUT_LEVEL0[0]==1?1:0;
    localparam   DIV2_NUM_INPUT_DATA_INPUT_LEVEL0    =  NUM_INPUT_DATA_INPUT_LEVEL0>>1;
    localparam   NUM_INPUT_DATA_ADDER_LEVEL0         =  (NUM_INPUT_DATA_INPUT_LEVEL0==1)?0:DIV2_NUM_INPUT_DATA_INPUT_LEVEL0 + IS_ODD_NUM_INPUT_DATA_INPUT_LEVEL0;
    
    localparam   START_LEVEL1             =  START_LEVEL0 + NUM_INPUT_DATA_INPUT_LEVEL0*DATA_WIDTH;
    localparam   NUM_INPUT_DATA_INPUT_LEVEL1         =  NUM_INPUT_DATA_ADDER_LEVEL0;
    localparam   IS_ODD_NUM_INPUT_DATA_INPUT_LEVEL1  =  NUM_INPUT_DATA_INPUT_LEVEL1[0]==1?1:0;
    localparam   DIV2_NUM_INPUT_DATA_INPUT_LEVEL1    =  NUM_INPUT_DATA_INPUT_LEVEL1>>1;
    localparam   NUM_INPUT_DATA_ADDER_LEVEL1         =  (NUM_INPUT_DATA_INPUT_LEVEL1==1)?0:DIV2_NUM_INPUT_DATA_INPUT_LEVEL1 + IS_ODD_NUM_INPUT_DATA_INPUT_LEVEL1;
    
    localparam   START_LEVEL2             =  START_LEVEL1 + NUM_INPUT_DATA_INPUT_LEVEL1*(DATA_WIDTH+1);
    localparam   NUM_INPUT_DATA_INPUT_LEVEL2         =  NUM_INPUT_DATA_ADDER_LEVEL1;
    localparam   IS_ODD_NUM_INPUT_DATA_INPUT_LEVEL2  =  NUM_INPUT_DATA_INPUT_LEVEL2[0]==1?1:0;
    localparam   DIV2_NUM_INPUT_DATA_INPUT_LEVEL2    =  NUM_INPUT_DATA_INPUT_LEVEL2>>1;
    localparam   NUM_INPUT_DATA_ADDER_LEVEL2         =  (NUM_INPUT_DATA_INPUT_LEVEL2==1)?0:DIV2_NUM_INPUT_DATA_INPUT_LEVEL2 + IS_ODD_NUM_INPUT_DATA_INPUT_LEVEL2;
    
    localparam   START_LEVEL3             =  START_LEVEL2 + NUM_INPUT_DATA_INPUT_LEVEL2;
    localparam   NUM_INPUT_DATA_INPUT_LEVEL3         =  NUM_INPUT_DATA_ADDER_LEVEL2;
    localparam   IS_ODD_NUM_INPUT_DATA_INPUT_LEVEL3  =  NUM_INPUT_DATA_INPUT_LEVEL3[0]==1?1:0;
    localparam   DIV2_NUM_INPUT_DATA_INPUT_LEVEL3    =  NUM_INPUT_DATA_INPUT_LEVEL3>>1;
    localparam   NUM_INPUT_DATA_ADDER_LEVEL3         =  (NUM_INPUT_DATA_INPUT_LEVEL3==1)?0:DIV2_NUM_INPUT_DATA_INPUT_LEVEL3 + IS_ODD_NUM_INPUT_DATA_INPUT_LEVEL3;
    
    localparam   START_LEVEL4             =  START_LEVEL3 + NUM_INPUT_DATA_INPUT_LEVEL3;
    localparam   NUM_INPUT_DATA_INPUT_LEVEL4         =  NUM_INPUT_DATA_ADDER_LEVEL3;
    localparam   IS_ODD_NUM_INPUT_DATA_INPUT_LEVEL4  =  NUM_INPUT_DATA_INPUT_LEVEL4[0]==1?1:0;
    localparam   DIV2_NUM_INPUT_DATA_INPUT_LEVEL4    =  NUM_INPUT_DATA_INPUT_LEVEL4>>1;
    localparam   NUM_INPUT_DATA_ADDER_LEVEL4         =  (NUM_INPUT_DATA_INPUT_LEVEL4==1)?0:DIV2_NUM_INPUT_DATA_INPUT_LEVEL4 + IS_ODD_NUM_INPUT_DATA_INPUT_LEVEL4;
    
    localparam   START_LEVEL5             =  START_LEVEL4 + NUM_INPUT_DATA_INPUT_LEVEL4;
    localparam   NUM_INPUT_DATA_INPUT_LEVEL5         =  NUM_INPUT_DATA_ADDER_LEVEL4;
    localparam   IS_ODD_NUM_INPUT_DATA_INPUT_LEVEL5  =  NUM_INPUT_DATA_INPUT_LEVEL5[0]==1?1:0;
    localparam   DIV2_NUM_INPUT_DATA_INPUT_LEVEL5    =  NUM_INPUT_DATA_INPUT_LEVEL5>>1;
    localparam   NUM_INPUT_DATA_ADDER_LEVEL5         =  (NUM_INPUT_DATA_INPUT_LEVEL5==1)?0:DIV2_NUM_INPUT_DATA_INPUT_LEVEL5 + IS_ODD_NUM_INPUT_DATA_INPUT_LEVEL5;
    
    localparam   START_LEVEL6             =  START_LEVEL5 + NUM_INPUT_DATA_INPUT_LEVEL5;
    localparam   NUM_INPUT_DATA_INPUT_LEVEL6         =  NUM_INPUT_DATA_ADDER_LEVEL5;
    localparam   IS_ODD_NUM_INPUT_DATA_INPUT_LEVEL6  =  NUM_INPUT_DATA_INPUT_LEVEL6[0]==1?1:0;
    localparam   DIV2_NUM_INPUT_DATA_INPUT_LEVEL6    =  NUM_INPUT_DATA_INPUT_LEVEL6>>1;
    localparam   NUM_INPUT_DATA_ADDER_LEVEL6         =  (NUM_INPUT_DATA_INPUT_LEVEL6==1)?0:DIV2_NUM_INPUT_DATA_INPUT_LEVEL6 + IS_ODD_NUM_INPUT_DATA_INPUT_LEVEL6;
    
    localparam   START_LEVEL7             =  START_LEVEL6 + NUM_INPUT_DATA_INPUT_LEVEL6;
    localparam   NUM_INPUT_DATA_INPUT_LEVEL7         =  NUM_INPUT_DATA_ADDER_LEVEL6;
    localparam   IS_ODD_NUM_INPUT_DATA_INPUT_LEVEL7  =  NUM_INPUT_DATA_INPUT_LEVEL7[0]==1?1:0;
    localparam   DIV2_NUM_INPUT_DATA_INPUT_LEVEL7    =  NUM_INPUT_DATA_INPUT_LEVEL7>>1;
    localparam   NUM_INPUT_DATA_ADDER_LEVEL7         =  (NUM_INPUT_DATA_INPUT_LEVEL7==1)?0:DIV2_NUM_INPUT_DATA_INPUT_LEVEL7 + IS_ODD_NUM_INPUT_DATA_INPUT_LEVEL7;
    
    localparam   START_LEVEL8             =  START_LEVEL7 + NUM_INPUT_DATA_INPUT_LEVEL7;
    localparam   NUM_INPUT_DATA_INPUT_LEVEL8         =  NUM_INPUT_DATA_ADDER_LEVEL7;
    localparam   IS_ODD_NUM_INPUT_DATA_INPUT_LEVEL8  =  NUM_INPUT_DATA_INPUT_LEVEL8[0]==1?1:0;
    localparam   DIV2_NUM_INPUT_DATA_INPUT_LEVEL8    =  NUM_INPUT_DATA_INPUT_LEVEL8>>1;
    localparam   NUM_INPUT_DATA_ADDER_LEVEL8         =  (NUM_INPUT_DATA_INPUT_LEVEL8==1)?0:DIV2_NUM_INPUT_DATA_INPUT_LEVEL8 + IS_ODD_NUM_INPUT_DATA_INPUT_LEVEL8;
    
    localparam   START_LEVEL9             =  START_LEVEL8 + NUM_INPUT_DATA_INPUT_LEVEL8;
    localparam   NUM_INPUT_DATA_INPUT_LEVEL9         =  NUM_INPUT_DATA_ADDER_LEVEL8;
    localparam   IS_ODD_NUM_INPUT_DATA_INPUT_LEVEL9  =  NUM_INPUT_DATA_INPUT_LEVEL9[0]==1?1:0;
    localparam   DIV2_NUM_INPUT_DATA_INPUT_LEVEL9    =  NUM_INPUT_DATA_INPUT_LEVEL9>>1;
    localparam   NUM_INPUT_DATA_ADDER_LEVEL9         =  (NUM_INPUT_DATA_INPUT_LEVEL9==1)?0:DIV2_NUM_INPUT_DATA_INPUT_LEVEL9 + IS_ODD_NUM_INPUT_DATA_INPUT_LEVEL9;
    
    localparam   START_LEVEL10            =  START_LEVEL9 + NUM_INPUT_DATA_INPUT_LEVEL9;
        
    wire [DATA_WIDTH-1:0] wire_inner[START_LEVEL10-1:0]; //this extra line is used for ultimate output.
    
    for (i = 0; i < NUM_INPUT_DATA_INPUT_LEVEL0; i = i + 1) 
    begin
       assign wire_inner[i] = i_data_bus_inner[i];
    end
    
    genvar index_NUM_INPUT_DATA;
    generate
        
    for (index_NUM_INPUT_DATA = 0; index_NUM_INPUT_DATA < NUM_INPUT_DATA_ADDER_LEVEL0-IS_ODD_NUM_INPUT_DATA_INPUT_LEVEL0; index_NUM_INPUT_DATA = index_NUM_INPUT_DATA + 1)
    begin
        adder#(.DATA_WIDTH(DATA_WIDTH)) level0(.a(wire_inner[START_LEVEL0 + 2*index_NUM_INPUT_DATA]),.b(wire_inner[START_LEVEL0+2*index_NUM_INPUT_DATA+1]),.out(wire_inner[START_LEVEL1+index_NUM_INPUT_DATA]));
    end
    if(IS_ODD_NUM_INPUT_DATA_INPUT_LEVEL0 && (NUM_INPUT_DATA_ADDER_LEVEL0>0))
        adder#(.DATA_WIDTH(DATA_WIDTH)) level0_last(.a(wire_inner[START_LEVEL0+2*(NUM_INPUT_DATA_ADDER_LEVEL0-1)]),.b({DATA_WIDTH{1'b0}}),.out(wire_inner[START_LEVEL1+NUM_INPUT_DATA_ADDER_LEVEL0 - 1]));
    
    for (index_NUM_INPUT_DATA = 0; index_NUM_INPUT_DATA < NUM_INPUT_DATA_ADDER_LEVEL1-IS_ODD_NUM_INPUT_DATA_INPUT_LEVEL1; index_NUM_INPUT_DATA = index_NUM_INPUT_DATA + 1)
    begin
        adder#(.DATA_WIDTH(DATA_WIDTH)) level1(.a(wire_inner[START_LEVEL1+2*index_NUM_INPUT_DATA]),.b(wire_inner[START_LEVEL1+2*index_NUM_INPUT_DATA+1]),.out(wire_inner[START_LEVEL2+index_NUM_INPUT_DATA]));
    end
    if(IS_ODD_NUM_INPUT_DATA_INPUT_LEVEL1 && (NUM_INPUT_DATA_ADDER_LEVEL1>0))
        adder#(.DATA_WIDTH(DATA_WIDTH)) level1_last(.a(wire_inner[START_LEVEL1+2*(NUM_INPUT_DATA_ADDER_LEVEL1-1)]),.b({DATA_WIDTH{1'b0}}),.out(wire_inner[START_LEVEL2+NUM_INPUT_DATA_ADDER_LEVEL1 - 1]));
    
    for (index_NUM_INPUT_DATA = 0; index_NUM_INPUT_DATA < NUM_INPUT_DATA_ADDER_LEVEL2-IS_ODD_NUM_INPUT_DATA_INPUT_LEVEL2; index_NUM_INPUT_DATA = index_NUM_INPUT_DATA + 1)
    begin
        adder#(.DATA_WIDTH(DATA_WIDTH)) level2(.a(wire_inner[START_LEVEL2+2*index_NUM_INPUT_DATA]),.b(wire_inner[START_LEVEL2+2*index_NUM_INPUT_DATA+1]),.out(wire_inner[START_LEVEL3+index_NUM_INPUT_DATA]));
    end
    if(IS_ODD_NUM_INPUT_DATA_INPUT_LEVEL2 && (NUM_INPUT_DATA_ADDER_LEVEL2>0))
        adder#(.DATA_WIDTH(DATA_WIDTH)) level2_last(.a(wire_inner[START_LEVEL2+2*(NUM_INPUT_DATA_ADDER_LEVEL2-1)]),.b({DATA_WIDTH{1'b0}}),.out(wire_inner[START_LEVEL3+NUM_INPUT_DATA_ADDER_LEVEL2 - 1]));
    
    for (index_NUM_INPUT_DATA = 0; index_NUM_INPUT_DATA < NUM_INPUT_DATA_ADDER_LEVEL3-IS_ODD_NUM_INPUT_DATA_INPUT_LEVEL3; index_NUM_INPUT_DATA = index_NUM_INPUT_DATA + 1)
    begin
        adder#(.DATA_WIDTH(DATA_WIDTH)) level3(.a(wire_inner[START_LEVEL3+2*index_NUM_INPUT_DATA]),.b(wire_inner[START_LEVEL3+2*index_NUM_INPUT_DATA+1]),.out(wire_inner[START_LEVEL4+index_NUM_INPUT_DATA]));
    end
    if(IS_ODD_NUM_INPUT_DATA_INPUT_LEVEL3 && (NUM_INPUT_DATA_ADDER_LEVEL3>0))
        adder#(.DATA_WIDTH(DATA_WIDTH)) level3_last(.a(wire_inner[START_LEVEL3+2*(NUM_INPUT_DATA_ADDER_LEVEL3-1)]),.b({DATA_WIDTH{1'b0}}),.out(wire_inner[START_LEVEL4+NUM_INPUT_DATA_ADDER_LEVEL3 - 1]));
    
    for (index_NUM_INPUT_DATA = 0; index_NUM_INPUT_DATA < NUM_INPUT_DATA_ADDER_LEVEL4-IS_ODD_NUM_INPUT_DATA_INPUT_LEVEL4; index_NUM_INPUT_DATA = index_NUM_INPUT_DATA + 1)
    begin
        adder#(.DATA_WIDTH(DATA_WIDTH)) level4(.a(wire_inner[START_LEVEL4+2*index_NUM_INPUT_DATA]),.b(wire_inner[START_LEVEL4+2*index_NUM_INPUT_DATA+1]),.out(wire_inner[START_LEVEL5+index_NUM_INPUT_DATA]));
    end
    if(IS_ODD_NUM_INPUT_DATA_INPUT_LEVEL4 && (NUM_INPUT_DATA_ADDER_LEVEL4>0))
        adder#(.DATA_WIDTH(DATA_WIDTH)) level4_last(.a(wire_inner[START_LEVEL4+2*(NUM_INPUT_DATA_ADDER_LEVEL4-1)]),.b({DATA_WIDTH{1'b0}}),.out(wire_inner[START_LEVEL5+NUM_INPUT_DATA_ADDER_LEVEL4 - 1]));
    
    for (index_NUM_INPUT_DATA = 0; index_NUM_INPUT_DATA < NUM_INPUT_DATA_ADDER_LEVEL5-IS_ODD_NUM_INPUT_DATA_INPUT_LEVEL5; index_NUM_INPUT_DATA = index_NUM_INPUT_DATA + 1)
    begin
        adder#(.DATA_WIDTH(DATA_WIDTH)) level5(.a(wire_inner[START_LEVEL5+2*index_NUM_INPUT_DATA]),.b(wire_inner[START_LEVEL5+2*index_NUM_INPUT_DATA+1]),.out(wire_inner[START_LEVEL6+index_NUM_INPUT_DATA]));
    end
    if(IS_ODD_NUM_INPUT_DATA_INPUT_LEVEL5 && (NUM_INPUT_DATA_ADDER_LEVEL5>0))
        adder#(.DATA_WIDTH(DATA_WIDTH)) level5_last(.a(wire_inner[START_LEVEL5+2*(NUM_INPUT_DATA_ADDER_LEVEL5-1)]),.b({DATA_WIDTH{1'b0}}),.out(wire_inner[START_LEVEL6+NUM_INPUT_DATA_ADDER_LEVEL5 - 1]));
    
    for (index_NUM_INPUT_DATA = 0; index_NUM_INPUT_DATA < NUM_INPUT_DATA_ADDER_LEVEL6-IS_ODD_NUM_INPUT_DATA_INPUT_LEVEL6; index_NUM_INPUT_DATA = index_NUM_INPUT_DATA + 1)
    begin
        adder#(.DATA_WIDTH(DATA_WIDTH)) level6(.a(wire_inner[START_LEVEL6+2*index_NUM_INPUT_DATA]),.b(wire_inner[START_LEVEL6+2*index_NUM_INPUT_DATA+1]),.out(wire_inner[START_LEVEL7+index_NUM_INPUT_DATA]));
    end
    if(IS_ODD_NUM_INPUT_DATA_INPUT_LEVEL6 && (NUM_INPUT_DATA_ADDER_LEVEL6>0))
        adder#(.DATA_WIDTH(DATA_WIDTH)) level6_last(.a(wire_inner[START_LEVEL6+2*(NUM_INPUT_DATA_ADDER_LEVEL6-1)]),.b({DATA_WIDTH{1'b0}}),.out(wire_inner[START_LEVEL7+NUM_INPUT_DATA_ADDER_LEVEL6 - 1]));
    
    for (index_NUM_INPUT_DATA = 0; index_NUM_INPUT_DATA < NUM_INPUT_DATA_ADDER_LEVEL7-IS_ODD_NUM_INPUT_DATA_INPUT_LEVEL7; index_NUM_INPUT_DATA = index_NUM_INPUT_DATA + 1)
    begin
        adder#(.DATA_WIDTH(DATA_WIDTH)) level7(.a(wire_inner[START_LEVEL7+2*index_NUM_INPUT_DATA]),.b(wire_inner[START_LEVEL7+2*index_NUM_INPUT_DATA+1]),.out(wire_inner[START_LEVEL8+index_NUM_INPUT_DATA]));
    end
    if(IS_ODD_NUM_INPUT_DATA_INPUT_LEVEL7 && (NUM_INPUT_DATA_ADDER_LEVEL7>0))
        adder#(.DATA_WIDTH(DATA_WIDTH)) level7_last(.a(wire_inner[START_LEVEL7+2*(NUM_INPUT_DATA_ADDER_LEVEL7-1)]),.b({DATA_WIDTH{1'b0}}),.out(wire_inner[START_LEVEL8+NUM_INPUT_DATA_ADDER_LEVEL7 - 1]));
    
    for (index_NUM_INPUT_DATA = 0; index_NUM_INPUT_DATA < NUM_INPUT_DATA_ADDER_LEVEL8-IS_ODD_NUM_INPUT_DATA_INPUT_LEVEL8; index_NUM_INPUT_DATA = index_NUM_INPUT_DATA + 1)
    begin
        adder#(.DATA_WIDTH(DATA_WIDTH)) level8(.a(wire_inner[START_LEVEL8+2*index_NUM_INPUT_DATA]),.b(wire_inner[START_LEVEL8+2*index_NUM_INPUT_DATA+1]),.out(wire_inner[START_LEVEL9+index_NUM_INPUT_DATA]));
    end
    if(IS_ODD_NUM_INPUT_DATA_INPUT_LEVEL8 && (NUM_INPUT_DATA_ADDER_LEVEL8>0))
        adder#(.DATA_WIDTH(DATA_WIDTH)) level8_last(.a(wire_inner[START_LEVEL8+2*(NUM_INPUT_DATA_ADDER_LEVEL8-1)]),.b({DATA_WIDTH{1'b0}}),.out(wire_inner[START_LEVEL9+NUM_INPUT_DATA_ADDER_LEVEL8 - 1]));
    
    for (index_NUM_INPUT_DATA = 0; index_NUM_INPUT_DATA < NUM_INPUT_DATA_ADDER_LEVEL9-IS_ODD_NUM_INPUT_DATA_INPUT_LEVEL9; index_NUM_INPUT_DATA = index_NUM_INPUT_DATA + 1)
    begin
        adder#(.DATA_WIDTH(DATA_WIDTH)) level9(.a(wire_inner[START_LEVEL9+2*index_NUM_INPUT_DATA]),.b(wire_inner[START_LEVEL9+2*index_NUM_INPUT_DATA+1]),.out(wire_inner[START_LEVEL10+index_NUM_INPUT_DATA]));
    end
    if(IS_ODD_NUM_INPUT_DATA_INPUT_LEVEL9 && (NUM_INPUT_DATA_ADDER_LEVEL9>0))
        adder#(.DATA_WIDTH(DATA_WIDTH)) level9_last(.a(wire_inner[START_LEVEL9+2*(NUM_INPUT_DATA_ADDER_LEVEL9-1)]),.b({DATA_WIDTH{1'b0}}),.out(wire_inner[START_LEVEL10+NUM_INPUT_DATA_ADDER_LEVEL9 - 1]));
    endgenerate
    
    always@*
    begin
        o_data_bus_inner = wire_inner[START_LEVEL10-1];
    end
    
    assign o_data_bus = o_data_bus_inner;
endmodule



module adder#(parameter DATA_WIDTH = 16)(
    input  [DATA_WIDTH-1:0] a,
    input  [DATA_WIDTH-1:0] b,
    output [DATA_WIDTH-1:0]  out
    );
    reg  [DATA_WIDTH-1:0]  out_inner;
    always@*
    begin
        out_inner = a + b;
    end
    
    assign out = out_inner;
endmodule


`endif

