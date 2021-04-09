`timescale 1ns / 1ps
/////////////////////////////////////////////////////////////
// Top Module:  and_tree_comb
// Data:        Only data width matters.
// Format:      keeping the input format unchange
// Timing:      Combinational Logic
// Dummy Data:  {DATA_WIDTH{1'b0}}
//
// Parameter:   NUM_INPUT_DATA could be arbitrary integer
//
// Function:    AND all bit of input together
//  MSB                                        LSB
//   \     /     \     / ... \     /     \     / i_data_latch[0]
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
//                        |       
//                        v
//                   o_data_bus(logic AND of all bits of input data)
//
// Author:      Jianming Tong (jianming.tong@gatech.edu)
/////////////////////////////////////////////////////////////


module and_tree_comb#(
    parameter NUM_INPUT_DATA = 16,
    parameter DATA_WIDTH = 1
)(
    // data signals
	i_valid,        // valid input data signal
	i_data_bus,     // input a vector with DATA_WIDTH in length
	
	o_valid,        // output valid
    o_data_bus,     // output logic AND of all bits inside the input vector.

	// control signals
	i_en            // distribute switch enable
);

	// interface
	input                                        i_valid;             
	input  [NUM_INPUT_DATA-1:0]                  i_data_bus;

	output                                       o_valid;             
	output                                       o_data_bus; // {o_data_a, o_data_b}

	input                                        i_en;

    // inner parameter and logic
    localparam   NUM_LEVEL = $clog2(NUM_INPUT_DATA); // Note: inner ceiling: e.g. $clog2(18) = 5, (2^5=32).
    // use ceiling to add 1 extra level to support all possible input cases (input not exactly 2^n).
    // If the input is exactly 2^n, then the num_switch in the last level will be 0.
    
    // define output wire for all switches of different level.
    genvar i,j;
    generate
    for (i =0; i< NUM_LEVEL+1; i=i+1)
    begin: AND_Tree_level
        // calculate # of switch in level i
        // non power of 2 version is also taken into consideration
        localparam NUM_SWITCH_SHIFT =  NUM_INPUT_DATA >> i;
        localparam NOT_ADD_EXTRA_SWITCH_THIS_LEVEL = ((NUM_INPUT_DATA - ((NUM_INPUT_DATA >> i) << i)) == 0);
        localparam NUM_SWITCH_LEVEL = (NOT_ADD_EXTRA_SWITCH_THIS_LEVEL)? NUM_SWITCH_SHIFT: (NUM_SWITCH_SHIFT + 1); 
        
        // define the output wire for switches of level i
        reg                                     i_data_latch[0:NUM_SWITCH_LEVEL-1];
        reg                                     i_valid_latch[0:NUM_SWITCH_LEVEL-1];
    end

    // output latch
    reg                                          o_data_bus_inner;
    reg                                          o_valid_inner;

    // connect i_data_bus to input of AND_gate tree.
    for (j = 0; j< NUM_INPUT_DATA; j=j+1)
    begin: assign_first_stage_wire
        always@(*)
        begin
            AND_Tree_level[0].i_data_latch[j] = i_data_bus[j+:1];
            AND_Tree_level[0].i_valid_latch[j] = i_valid;
        end
    end

    //instantiate AND_gate tree
    for (i = 0; i< NUM_LEVEL; i=i+1)
    begin: AND_tree_level
        for (j = 0; j< AND_Tree_level[i+1].NUM_SWITCH_LEVEL; j=j+1)
        begin: AND_gate_in_level
            if( j==(AND_Tree_level[i+1].NUM_SWITCH_LEVEL -1) && ((AND_Tree_level[i].NUM_SWITCH_LEVEL >> 1) != AND_Tree_level[i+1].NUM_SWITCH_LEVEL) )
            begin
                always@(*)
                begin:AND_GATE_edge
                    if(AND_Tree_level[i].i_valid_latch[2*j])
                    begin
                        AND_Tree_level[i+1].i_valid_latch[j] = 1'b1;
                        AND_Tree_level[i+1].i_data_latch[j] = AND_Tree_level[i].i_data_latch[2*j];
                    end
                    else
                    begin
                        AND_Tree_level[i+1].i_valid_latch[j] = 1'b0;
                        AND_Tree_level[i+1].i_data_latch[j] = 1'b0;
                    end
                end
            end 
            else
            begin
                always@(*)
                begin:AND_GATE
                    if(AND_Tree_level[i].i_valid_latch[2*j+1] & AND_Tree_level[i].i_valid_latch[2*j])
                    begin
                        AND_Tree_level[i+1].i_valid_latch[j] = 1'b1;
                        AND_Tree_level[i+1].i_data_latch[j] = AND_Tree_level[i].i_data_latch[2*j+1] & AND_Tree_level[i].i_data_latch[2*j];
                    end
                    else
                    begin
                        AND_Tree_level[i+1].i_valid_latch[j] = 1'b0;
                        AND_Tree_level[i+1].i_data_latch[j] = 1'b0;
                    end
                end
            end
        end
    end

    endgenerate

    // output logic
    assign o_data_bus = AND_Tree_level[NUM_LEVEL].i_data_latch[0];
    assign o_valid =  AND_Tree_level[NUM_LEVEL].i_valid_latch[0];
endmodule