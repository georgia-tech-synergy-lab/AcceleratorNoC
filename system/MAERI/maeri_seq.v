`timescale 1ns / 1ps
/////////////////////////////////////////////////////////////
// Top Module:  maeri_seq
// Data:        Only data width matters.
// Format:      keeping the reg format unchange
// Timing:      Sequential Logic
// Reset:       Synchronized Reset [High Reset]
// Pipeline:    the system consist of three separate parts
//              For benes constructed with sequential switches, every stage is a pipeline stage
//              Total latency = # stages (cycle)  
// Dummy Data:  {DATA_WIDTH{1'b0}}
// 
// Function:     For 8 multiplier; 
//                                                                                                                                         
//                                                                                                         |------->|¯¯¯|                                      
//                                                                                                         |        |_x_|---\                                              
//                                                                                                         |          |      \-------->|¯¯¯|-----------------------------------> o_data_bus                                               
//                                                                                                         |          v      /-------->|_+_|---\                                 [0*DW+:DW]                                    
//                                                                                                         | |----->|¯¯¯|---/              0    \                                  
//                                                                                                         | |      |_x_|                        \                                      
//                                                                                                         | |        |                           \-->|¯¯¯|--------------------> o_data_bus                                
//                                                                                                         | |        v                           /-->|_+_|--\                   [1*DW+:DW]                   
//                                                                                                         | | |--->|¯¯¯|                        /        1   \                                 
//                                                                                                         | | |    |_x_|---\                   /              \                                 
//    i_data_bus[0*DATA_WIDTH+:DATA_WIDTH]  -->|¯¯¯|-------->|¯¯¯|------->|¯¯¯|------->|¯¯¯|-------->|¯¯¯|-| | |      |      \-------->|¯¯¯|---/                \                                
//    i_data_bus[1*DATA_WIDTH+:DATA_WIDTH]  -->|___|-\ /---->|___|--\ /-->|___|--\ /-->|___|----\ /->|___|---| |      v      /-------->|_+_|---------------------X-------------> o_data_bus                                                     
//                                     ID:       0    X        4     X      8     X      12      X     16      | |->|¯¯¯|---/            | 2                      \              [2*DW+:DW]                                          
//    i_data_bus[2*DATA_WIDTH+:DATA_WIDTH]  -->|¯¯¯|-/ \/--->|¯¯¯|--/ \-->|¯¯¯|--/ \-->|¯¯¯|---\/ \->|¯¯¯|-----| |  |_x_|                |                         \                           
//    i_data_bus[3*DATA_WIDTH+:DATA_WIDTH]  -->|___|-\ /\ /->|___|------->|___|------->|___|-\ /\ /->|___|-------|    |                  |                          \--|¯¯¯|                
//                                     ID:       1    X  X     5            9            13   X  X     17             |                  |                             | + |---> o_data_bus     
//    i_data_bus[4*DATA_WIDTH+:DATA_WIDTH]  -->|¯¯¯|-/ \/ \->|¯¯¯|------->|¯¯¯|------->|¯¯¯|-/ \/ \->|¯¯¯|-------|    v                  |                          /--|___|     [3*DW+:DW]                
//    i_data_bus[5*DATA_WIDTH+:DATA_WIDTH]  -->|___|-\ /\--->|___|--\ /-->|___|--\ /-->|___|---/\ /->|___|-----| |  |¯¯¯|                |                         /      3                   
//                                     ID:       2    X        6     X      10    X      14      X     18      | |->|_x_|---\            v                        /                                     
//    i_data_bus[6*DATA_WIDTH+:DATA_WIDTH]  -->|¯¯¯|-/ \---->|¯¯¯|--/ \-->|¯¯¯|--/ \-->|¯¯¯|----/ \->|¯¯¯|---| |      |      \-------->|¯¯¯|---------------------X-------------> o_data_bus                                                               
//    i_data_bus[7*DATA_WIDTH+:DATA_WIDTH]  -->|___|-------->|___|------->|___|------->|___|-------->|___|-| | |      v      /-------->|_+_|---\                /                [4*DW+:DW]                                                          
//                                     ID:       3             7            11           15            19  | | |    |¯¯¯|---/              4    \              /                                                
//       CONNECTION FUNCTION                   INVERSE SHUFFLE      ,,         SHUFFLE       SHUFFLE       | | |--->|_x_|                        \            /                                                 
//      CONNECTION GROUP SIZE                         8             4             4             8          | |        |                           \-->|¯¯¯|--/                                     
//                                                                                                         | |        v                           /-->|_+_|--------------------> o_data_bus                                     
//                                                                                                         | |      |¯¯¯|                        /        5                      [5*DW+:DW]                                                 
//                                                                                                         | |----->|_x_|---\                   /                                                              
//                                                                                                         |          |      \-------->|¯¯¯|---/                                                               
//                                                                                                         |          v      /-------->|_+_|-----------------------------------> o_data_bus                                                               
//                                                                                                         |        |¯¯¯|---/              6                                     [6*DW+:DW]                                            
//                                                                                                         |------->|_x_|                                                                         
//                                                                                                                                                                              
//                                                                                                                 
//                                                            BENES Network                                   1D Multiplier                   Augmented Reduction Tree
//                                                                                                     DW stands for MAX_DATA_WIDTH                 
//
//
//                                                                                    
//                                                                                 
//                                                                                 |     |¯¯¯|
//                                                                                 v     |_+_|
//            |¯¯¯|                    |¯¯¯|                 |¯¯¯|               |¯¯¯|     |       
//            |___|                    |_x_|                 |_+_|               |_+_|     v       
//    distribute_2x2_simple       multiplier_seq       single_reduce_seq      single_reduce_forward_seq  
//                                                          
// Author:      Jianming Tong (jianming.tong@gatech.edu)
/////////////////////////////////////////////////////////////


module maeri_seq#(
	parameter DATA_WIDTH = 32,      // could be arbitrary number
	parameter COMMAND_WIDTH  = 2,   // specify the command needed for a single switch of BENES
	parameter NUM_INPUT_DATA = 8,   // the number of input data should be power of 2.
	parameter IN_COMMAND_WIDTH = 32 // Total length of command for a single row of BENES network + a single multiplier
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
	i_en,           // distribute switch enable
	i_cmd,          // input command 
);



endmodule