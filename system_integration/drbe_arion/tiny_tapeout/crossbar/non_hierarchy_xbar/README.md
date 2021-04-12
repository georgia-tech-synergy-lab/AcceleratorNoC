1. Sequential circuits should only use non-blocking assignment to get correct results						
2. Combinational circuits could either use non-blocking assignment or blocking assignment -- both share the same overhead and timing					

The RTL files are 
non_blocking_assignment_non_hierarchy_xbar/RTL/crossbar_one_hot_comb.v
non_blocking_assignment_non_hierarchy_xbar/RTL/crossbar_one_hot_comb_wrapper_seq.v
non_blocking_assignment_non_hierarchy_xbar/RTL/crossbar_one_hot_seq.v
