`timescale 1ns / 1ps
/////////////////////////////////////////////////////////////
// Top Module:  tb_adder_tree_seq
// Data:        Only data width matters.
// Format:      keeping the input format unchange
// Timing:      Sequential Logic
// Reset:       Synchronized Reset [High Reset]
// Latency:     # of LEVEL(every LEVEL is a pipeline stage)
//
// Dummy Data:  {DATA_WIDTH{1'b0}}
//
// Parameter:   NUM_INPUT_DATA_INPUT_DATA could be arbitrary integer below 1024.
//
// Function:    Unicast  or  Multicast(Not arbitrary Multicast)
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
//                   o_data_bus(summation of all input data
//
// Author:      Jianming Tong (jianming.tong@gatech.edu)
/////////////////////////////////////////////////////////////

module tb_adder_tree_seq();
    
    parameter NUM_INPUT_DATA = 15;
    parameter DATA_WIDTH = 4;

    // timing signals
    reg                                         clk;
    reg                                         rst;
    
    // interface
	reg   [NUM_INPUT_DATA-1:0]                  i_valid;             
	reg   [NUM_INPUT_DATA*DATA_WIDTH-1:0]       i_data_bus;
	
	wire                                        o_valid;             
	wire  [DATA_WIDTH-1:0]                      o_data_bus; //{o_data_a, o_data_b}

	reg                                         i_en;
    
    // inner logic
    reg signed [DATA_WIDTH-1:0] i_data_bus_inner[NUM_INPUT_DATA-1:0]; 

    integer i;
    initial begin
        // rst
        i_en = 1'b1;
        rst = 1'b1;
        #20
        rst = 1'b0;
        #20
        i_en = 1'b1;
        i_valid = {NUM_INPUT_DATA{1'b1}};
        clk = 0;
        i_data_bus = 0;
        for (i=0; i<NUM_INPUT_DATA; i=i+1) 
        begin
            i_data_bus_inner[i] = 1;
        end
        
        for (i = 0; i < NUM_INPUT_DATA; i = i + 1) begin
            i_data_bus = {i_data_bus,i_data_bus_inner[i]}; 
        end
        #1000
        $stop;
    end
    

    // instantiate DUT (device under test)
    adder_tree_seq#(
        .NUM_INPUT_DATA(NUM_INPUT_DATA), 
        .DATA_WIDTH(DATA_WIDTH)) 
    dut(
        .clk(clk),
        .rst(rst),
		.i_valid(i_valid),
		.i_data_bus(i_data_bus),
		.o_valid(o_valid),
		.o_data_bus(o_data_bus),
		.i_en(i_en)
	);

    always #5 clk=~clk;
    
endmodule
