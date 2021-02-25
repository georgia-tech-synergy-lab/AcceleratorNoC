#-------------------------------------------------------------------------
#constraints file
#-------------------------------------------------------------------------
#
# This file contains various constraints for your chip including the
# target clock period, fanout, transition time and any
# input/output delay constraints.
#

# set clock period [ns]

#For NanGate15nm Library

create_clock -period $Clock_Period -name clk_input $Clock_Name

# set clock jitter [%]
set_clock_uncertainty -setup 0.002 clk_input
set_clock_uncertainty -hold  0.002 clk_input

# set input and output delay [ns]
#set_input_delay  0.05 -clock clk_input [remove_from_collection [all_inputs] clk]
#set_output_delay 0.05 -clock clk_input [all_outputs]

# set input and output delay [unit: follows the clock time unit]
set_input_delay  $IO_Delay -clock clk_input [remove_from_collection [all_inputs] clk]
set_output_delay $IO_Delay -clock clk_input [all_outputs]

# set wire load model
#set_wire_load_model -name "SMALL" 

# set output capacitive load [pF]
#set_load 0.015 [all_outputs]

# set output capacitive load [fF]
set_load 15 [all_outputs]
