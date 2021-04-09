`timescale 1ns / 1ps
/////////////////////////////////////////////////////////////
// Top Module:  dst_tag_expand4multicast_comb
// Data:        Only data width matters.
// Format:      keeping the input format unchange
// Timing:      Combinational Logic
// Latency:     Total latency = processing delay of an single control
// Dummy Data:  {DATA_WIDTH{1'b0}}
// 
// Function:    Expand input destination tags to support multicasting.
// Example:     4 cores in total -> 4-bit one hots -> 2log2(4) = 4-bit dst-tag control, each switch consume 2 bit dst tags. 
//    input one-hot dst  ->           multiple dst-tags          -> dst-tag contorl for unfolded butterfly     
//       unicasting
//        4'b0001        ->                 2'b00                -> {2'b00, 2'b00}
//        4'b0010        ->                 2'b01                -> {2'b00, 2'b01}
//        4'b0100        ->                 2'b10                -> {2'b01, 2'b00}
//        4'b1000        ->                 2'b11                -> {2'b01, 2'b01}
//      multicasting  
//        4'b0011        ->               2'b00,2'b01            -> {2'b00, 2'b11}
//        4'b1100        ->               2'b11,2'b10            -> {2'b01, 2'b11}
//        4'b1111        ->        2'b00,2'b01,2'b10,2'b11       -> {2'b11, 2'b11}
//
//      unicasting
//      8'b00000001      ->                3'b000                -> {2'b00, 2'b00, 2'b00}
//      8'b00000010      ->                3'b001                -> {2'b00, 2'b00, 2'b01}
//      8'b00000100      ->                3'b010                -> {2'b00, 2'b10, 2'b00}
//      8'b00001000      ->                3'b011                -> {2'b00, 2'b01, 2'b01}
//      8'b00010000      ->                3'b100                -> {2'b01, 2'b00, 2'b00}
//      8'b00100000      ->                3'b101                -> {2'b01, 2'b00, 2'b01}
//      8'b01000000      ->                3'b110                -> {2'b01, 2'b01, 2'b00}
//      8'b10000000      ->                3'b111                -> {2'b01, 2'b01, 2'b01}
//
//      multicasting
//      8'b11000000      ->            3'b111,3'b110             -> {2'b01, 2'b01, 2'b11}
//      8'b00110000      ->            3'b101,3'b100             -> {2'b01, 2'b00, 2'b11}
//      8'b00001100      ->            3'b011,3'b010             -> {2'b00, 2'b01, 2'b11}
//      8'b00000011      ->            3'b001,3'b000             -> {2'b00, 2'b00, 2'b11}
//      8'b11110000      ->        3'b{111,110,101,100}          -> {2'b01, 2'b11, 2'b11}
//      8'b00001111      ->        3'b{011,010,001,000}          -> {2'b00, 2'b11, 2'b11}
//      8'b11111111      -> 3'b{111,110,101,100,011,010,001,000} -> {2'b11, 2'b11, 2'b11}
//
// Illustartion: Take input 8'b11111111 as an example. 
//
//         multicasting bit: whether a 2x2 switch should multicast this input data. 1 indicates multicast. 
//          |      |      |
//      {2'b11, 2'b11, 2'b11}
//           |      |      |
//           v      v      v
//         original dst tag bit. here it is 3'b111, the highest destination tag of the group 3'b{111,110,101,100,011,010,001,000}.
//
// Multicasting bit generation: The one-hot("oh" below) is sent to an AND Tree with [$clog2(NUM_OUTPUT_DATA)] level.
// oh[MSB]                        oh[LSB+1] oh[LSB]
//   \     /   \     / ...  |   |    \     /
//    v   v     v   v  ...  v   v     v   v    
//    |¯¯¯|     |¯¯¯|  ...  |¯¯¯|     |¯¯¯|
//    |___|     |___|  ...  |___|     |___|
//      v         v    ...    v         v
//      |         |    ...    |         |    
//       \       /      ...    \       /
//        \     /       ...     \     /
//         v   v        ...      v   v
//         |¯¯¯|        ...      |¯¯¯|       ---> AND all inputs of this level -> the LSB multicasting bit.
//         |___|        ...      |___|       
//           v                     v
//           |                     |         
//            \                   /             .
//             ...              ...             .
//              ...           ...               .
//               ...        ...                 .
//                  \       /
//                   \     /
//                    v   v
//                    |¯¯¯|                  ---> AND all iuputs of this level -> the MSB-1 multicasting bit.
//                    |___|   
//                      |       
//                      v
//             MSB multicasting bit. 
//         
// Destination Bit generation: The one-hot("oh" below) is sent to an OR Tree with [$clog2(NUM_OUTPUT_DATA)-1] level.
// oh[MSB]                       oh[LSB+1]oh[LSB]
//    |   |     |   |  ...  |   |     |   |    
//    v   v     v   v  ...  v   v     v   v    
//    |¯¯¯|     |¯¯¯|  ...  |¯¯¯|     |¯¯¯|  ---> OR all odd number (LSB starts at 0) input ->the LSB dstination bit.
//    |___|     |___|  ...  |___|     |___|
//      v         v    ...    v         v
//      |         |    ...    |         |     
//       \       /      ...    \       /
//        \     /       ...     \     /
//         v   v        ...      v   v
//         |¯¯¯|        ...      |¯¯¯|       ---> OR all odd number (LSB starts at 0) input ->the LSB+1 dstination bit. 
//         |___|        ...      |___|       
//           v                     v
//           |                     |         
//            \                   /  
//             ...              ...
//              ...           ...        
//               ...        ...      
//                |          |
//                v          v               ---> OR all odd number input (starts at 0) ->the MSB dstination bit.
//         MSB of dst tag  
//                           
// Intuitive Understanding:
//      1. dst tag is the largest dst tag among all targets.
//      2. multicasting depend on the length of the consecutive 1 -- add all 1 in the one-hot vector. assume all 1s are consecutive.
//  
// Critical Path: the generation of the multicasting bit -- #$clog2(NUM_OUTPUT_DATA) level + 1 logic.
//
// Author:      Jianming Tong (jianming.tong@gatech.edu)
/////////////////////////////////////////////////////////////

module dst_tag_expand4multicast_comb#(
	parameter DATA_WIDTH = 32,     // could be arbitrary number
	parameter NUM_INPUT_DATA = 8,  // must be 2^n
	parameter NUM_OUTPUT_DATA = 4, // must be 2^n
	parameter DESTINATION_TAG_WIDTH = 2  // length of the destination tag consumed per data per stage.
)(
	// timeing signals
	clk,
	rst,

    // data signals
	i_valid,        // valid input data signal
	i_data_bus,     // input data bus coming into distribute switch

	o_valid,        // output valid
    o_data_bus,     // output data 

	// control signals
	i_en,           // distribute switch enable.
	i_cmd           // Input one-hot command.
	o_cmd           // output destination tag command.
);

	// interface
    input                                        clk;
    input                                        rst;
    
	input  [NUM_INPUT_DATA-1:0]                  i_valid;             
	input  [NUM_INPUT_DATA*DATA_WIDTH-1:0]       i_data_bus;
	
	output [NUM_INPUT_DATA-1:0]                  o_valid;             
	output [NUM_INPUT_DATA-1:0]                  o_data_bus; //{o_data_a, o_data_b}

	input                                        i_en;
	input  [NUM_OUTPUT_DATA-1:0]                 i_cmd;
	output [NUM_OUTPUT_DATA-1:0]                 o_cmd;

   
endmodule
