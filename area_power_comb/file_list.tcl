# Change the file list for your design (../ to match dc_script location)
# Top module must be at the first of the list


# For verilog file (no passed parameters)
#read_file -format verilog {../src/topModule.v ../src/module1.v} 
#read_file -format verilog {../src/example_AND.v} 


# For systemverilog files (pass parameters)
analyze -format sverilog {../src/crossbar/c_select_1ofn.v ../src/crossbar/c_interleave.v ../src/crossbar/c_crossbar.v }
elaborate c_crossbar
