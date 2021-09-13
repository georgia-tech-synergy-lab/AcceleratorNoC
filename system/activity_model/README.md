# Activity Factor Estimation Tool for Tree-based (Crossbar) ALL-to-ALL network

## Files description

In **test** folder, three functions are offered.
1. Input data generation Script
```
in_data_gen -i <num_of_input_data> 
```

2. Multi-hot command generation tool.
- generate all possible input command considering both multicasting and unicasting under a 
specific input number and output number. 
- generated commands might have some duplications. 
- generated command is stored in **in_cmd.txt**

generate input_file which is used in activity_model_xbar
```
combination -i <num_of_input_data> -o <num_of_output_data> 
```

3. duplication remove script
- remove the duplicated command in **in_cmd.txt** -> generate **in_cmd_unique.txt**
```
rm_duplicate 
```

In **src** folder, 
1. Tree-based (Crossbar) ALL-to-ALL network datapath emulator is implemented in C++
- implement the same functionalities of Verilog based All-to-all network, which consists of *NUM_INPUT_DATA* binary tree (replicate input to multiple mux trees) and *NUM_OUTPUT_DATA* mux tree (select one final input and send it to output port). 
- take the multi-one commands as input
- offer the actived router statistics counting function.
- write the number of actived routers in both the binary_tree.

In **include** folder,
Just the header files for codes inside the src folder.


## Some conclusion
The brute-force command generation for 128 input all-to-all network took more than 2 hours and still didn't finish. So I use a 8-input-4-output all-to-all network to find the pattern of the worst case, then use the same pattern for getting statistics out of 128-input-8-output all-to-all network.

For a 8-input-4-output all-to-all network, the worst case is the a single input going out to all output ports. 

So I implement broadcasting of a single input data out of 128 input data and get the number:
- number of actived router in binary tree = 120  
- number of actived router in mux tree = 120  
