set init_design_uniquify 	1
### name of top module
set top_design			crossbar_one_hot_seq

set core_supply 		VDD
set default_ground		VSS

set gds_map_file		/usr/scratch/DRBE-shared/TSMC-library/IP/TSMC28_STD_CELLS/custom_utils_ck/tsmc_ip/tcbn28hpcplusbwp30p140/gds2.map

# Add the path to post SYN / Gate level netlist(s) 
set init_verilog		[list	\
					./RTL/crossbar_one_hot_seq.g.v \
				]

# Follow same guidelines as in dc_setup.tcl file if you want to change library files for LEF/LIB/CAPTABLE (if available)
# Add the path for tech, std cells and macro lefs
set init_lef_file		[list	\
					/usr/scratch/DRBE-shared/TSMC-library/IP/TSMC28_STD_CELLS/custom_utils_ck/tsmc_ip/tcbn28hpcplusbwp30p140/tsmcn28_9lm6X1Z1UUTRDL_HVH.tlef\
					/usr/scratch/DRBE-shared/TSMC-library/IP/TSMC28_STD_CELLS/unzipped/tcbn28hpcplusbwp30p140lvt_190a/tcbn28hpcplusbwp30p140lvt_110a_sef/TSMCHOME/digital/Back_End/lef/tcbn28hpcplusbwp30p140lvt_110a/lef/tcbn28hpcplusbwp30p140lvt.lef\
					./LEF/ts1n28hpcplvtb256x32m4swbaso_180a.lef\

				]

set init_pwr_net		$core_supply
set init_gnd_net		$default_ground

set init_top_cell		$top_design

# Add captable and temperature for RC corner if captable file is available
#create_rc_corner		-name	curRC \
#				-T		25 \
#				-cap_table <path to captable>

# Add timing libs for std cells and macros
create_library_set		-name		curLib \
				-timing	[list /usr/scratch/DRBE-shared/TSMC-library/IP/TSMC28_STD_CELLS/unzipped/tcbn28hpcplusbwp30p140lvt_190a/tcbn28hpcplusbwp30p140lvt_180a_nldm/TSMCHOME/digital/Front_End/timing_power_noise/NLDM/tcbn28hpcplusbwp30p140lvt_180a/tcbn28hpcplusbwp30p140lvttt0p8v25c.lib\
					      ./LIB/ts1n28hpcplvtb256x32m4swbaso_180a_tt1v25c.lib]

create_delay_corner		-name		curDel \
				-library_set	curLib 
#				-rc_corner	curRC

# Add either post SYN sdc or create a custom sdc file
create_constraint_mode		-name		curCon \
				-sdc_files	./SDC/crossbar_one_hot_seq.sdc

create_analysis_view		-name		curAna \
				-delay_corner		curDel \
				-constraint_mode	curCon \

init_design			-setup		curAna \
				-hold		curAna
