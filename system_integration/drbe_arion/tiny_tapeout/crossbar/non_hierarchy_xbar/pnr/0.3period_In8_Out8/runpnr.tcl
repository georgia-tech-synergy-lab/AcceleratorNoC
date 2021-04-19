#######################################################
#                                                     
#  Innovus Command Logging File                     
#  Created on Fri Apr 16 23:25:32 2021                
#                                                     
#######################################################

#@(#)CDS: Innovus v17.16-s058_1 (64bit) 10/23/2018 14:03 (Linux 2.6.18-194.el5)
#@(#)CDS: NanoRoute 17.16-s058_1 NR181012-1114/17_16-UB (database version 2.30, 418.7.1) {superthreading v1.44}
#@(#)CDS: AAE 17.16-s004 (64bit) 10/23/2018 (Linux 2.6.18-194.el5)
#@(#)CDS: CTE 17.16-s010_1 () Sep 23 2018 20:13:56 ( )
#@(#)CDS: SYNTECH 17.16-s003_1 () Aug  6 2018 04:34:02 ( )
#@(#)CDS: CPE v17.16-s009
#@(#)CDS: IQRC/TQRC 16.1.1-s220 (64bit) Fri Aug  4 09:53:48 PDT 2017 (Linux 2.6.18-194.el5)

set_global _enable_mmmc_by_default_flow      $CTE::mmmc_default
suppressMessage ENCEXT-2799
win
set init_design_uniquify 1
set init_verilog ./RTL/crossbar_one_hot_seq.g.v
set init_lef_file {/usr/scratch/DRBE-shared/TSMC-library/IP/TSMC28_STD_CELLS/custom_utils_ck/tsmc_ip/tcbn28hpcplusbwp30p140/tsmcn28_9lm6X1Z1UUTRDL_HVH.tlef /usr/scratch/DRBE-shared/TSMC-library/IP/TSMC28_STD_CELLS/unzipped/tcbn28hpcplusbwp30p140lvt_190a/tcbn28hpcplusbwp30p140lvt_110a_sef/TSMCHOME/digital/Back_End/lef/tcbn28hpcplusbwp30p140lvt_110a/lef/tcbn28hpcplusbwp30p140lvt.lef ./LEF/ts1n28hpcplvtb256x32m4swbaso_180a.lef}
set init_pwr_net VDD
set init_gnd_net VSS
set init_top_cell crossbar_one_hot_seq
create_library_set		-name		curLib \
				-timing	[list /usr/scratch/DRBE-shared/TSMC-library/IP/TSMC28_STD_CELLS/unzipped/tcbn28hpcplusbwp30p140lvt_190a/tcbn28hpcplusbwp30p140lvt_180a_nldm/TSMCHOME/digital/Front_End/timing_power_noise/NLDM/tcbn28hpcplusbwp30p140lvt_180a/tcbn28hpcplusbwp30p140lvttt0p8v25c.lib\
					      ./LIB/ts1n28hpcplvtb256x32m4swbaso_180a_tt1v25c.lib]
create_delay_corner		-name		curDel \
				-library_set	curLib 
create_constraint_mode		-name		curCon \
				-sdc_files	./SDC/crossbar_one_hot_seq.sdc
create_analysis_view		-name		curAna \
				-delay_corner		curDel \
				-constraint_mode	curCon \

init_design -setup curAna -hold curAna
getIoFlowFlag
setIoFlowFlag 0
floorPlan -site core -s 150 100 5 5 5 5
uiSetTool select
getIoFlowFlag
fit
setIoFlowFlag 0
floorPlan -site core -s 149.985 30.0 4.995 5.0 4.995 5.0
uiSetTool select
getIoFlowFlag
fit
getPinAssignMode -pinEditInBatch -quiet
setPinAssignMode -pinEditInBatch true
editPin -fixOverlap 1 -unit MICRON -spreadDirection clockwise -side Top -layer 1 -spreadType start -spacing 0.1 -start 0.0 0.0 -pin {{i_cmd[0]} {i_cmd[1]} {i_cmd[2]} {i_cmd[3]} {i_cmd[4]} {i_cmd[5]} {i_cmd[6]} {i_cmd[7]}}
setPinAssignMode -pinEditInBatch false
getPinAssignMode -pinEditInBatch -quiet
setPinAssignMode -pinEditInBatch true
editPin -pinWidth 0.05 -pinDepth 0.23 -fixOverlap 1 -spreadDirection clockwise -edge 1 -layer 1 -spreadType side -pin {{i_cmd[0]} {i_cmd[1]} {i_cmd[2]} {i_cmd[3]} {i_cmd[4]} {i_cmd[5]} {i_cmd[6]} {i_cmd[7]}}
setPinAssignMode -pinEditInBatch false
getPinAssignMode -pinEditInBatch -quiet
setPinAssignMode -pinEditInBatch true
editPin -fixOverlap 1 -spreadDirection clockwise -edge 1 -layer 1 -spreadType side -pin {{i_data_bus[0]} {i_data_bus[1]} {i_data_bus[2]} {i_data_bus[3]} {i_data_bus[4]} {i_data_bus[5]} {i_data_bus[6]} {i_data_bus[7]} {i_data_bus[8]} {i_data_bus[9]} {i_data_bus[10]} {i_data_bus[11]} {i_data_bus[12]} {i_data_bus[13]} {i_data_bus[14]} {i_data_bus[15]} {i_data_bus[16]} {i_data_bus[17]} {i_data_bus[18]} {i_data_bus[19]} {i_data_bus[20]} {i_data_bus[21]} {i_data_bus[22]} {i_data_bus[23]} {i_data_bus[24]} {i_data_bus[25]} {i_data_bus[26]} {i_data_bus[27]} {i_data_bus[28]} {i_data_bus[29]} {i_data_bus[30]} {i_data_bus[31]} {i_data_bus[32]} {i_data_bus[33]} {i_data_bus[34]} {i_data_bus[35]} {i_data_bus[36]} {i_data_bus[37]} {i_data_bus[38]} {i_data_bus[39]} {i_data_bus[40]} {i_data_bus[41]} {i_data_bus[42]} {i_data_bus[43]} {i_data_bus[44]} {i_data_bus[45]} {i_data_bus[46]} {i_data_bus[47]} {i_data_bus[48]} {i_data_bus[49]} {i_data_bus[50]} {i_data_bus[51]} {i_data_bus[52]} {i_data_bus[53]} {i_data_bus[54]} {i_data_bus[55]} {i_data_bus[56]} {i_data_bus[57]} {i_data_bus[58]} {i_data_bus[59]} {i_data_bus[60]} {i_data_bus[61]} {i_data_bus[62]} {i_data_bus[63]} {i_data_bus[64]} {i_data_bus[65]} {i_data_bus[66]} {i_data_bus[67]} {i_data_bus[68]} {i_data_bus[69]} {i_data_bus[70]} {i_data_bus[71]} {i_data_bus[72]} {i_data_bus[73]} {i_data_bus[74]} {i_data_bus[75]} {i_data_bus[76]} {i_data_bus[77]} {i_data_bus[78]} {i_data_bus[79]} {i_data_bus[80]} {i_data_bus[81]} {i_data_bus[82]} {i_data_bus[83]} {i_data_bus[84]} {i_data_bus[85]} {i_data_bus[86]} {i_data_bus[87]} {i_data_bus[88]} {i_data_bus[89]} {i_data_bus[90]} {i_data_bus[91]} {i_data_bus[92]} {i_data_bus[93]} {i_data_bus[94]} {i_data_bus[95]} {i_data_bus[96]} {i_data_bus[97]} {i_data_bus[98]} {i_data_bus[99]} {i_data_bus[100]} {i_data_bus[101]} {i_data_bus[102]} {i_data_bus[103]} {i_data_bus[104]} {i_data_bus[105]} {i_data_bus[106]} {i_data_bus[107]} {i_data_bus[108]} {i_data_bus[109]} {i_data_bus[110]} {i_data_bus[111]} {i_data_bus[112]} {i_data_bus[113]} {i_data_bus[114]} {i_data_bus[115]} {i_data_bus[116]} {i_data_bus[117]} {i_data_bus[118]} {i_data_bus[119]} {i_data_bus[120]} {i_data_bus[121]} {i_data_bus[122]} {i_data_bus[123]} {i_data_bus[124]} {i_data_bus[125]} {i_data_bus[126]} {i_data_bus[127]} {i_data_bus[128]} {i_data_bus[129]} {i_data_bus[130]} {i_data_bus[131]} {i_data_bus[132]} {i_data_bus[133]} {i_data_bus[134]} {i_data_bus[135]} {i_data_bus[136]} {i_data_bus[137]} {i_data_bus[138]} {i_data_bus[139]} {i_data_bus[140]} {i_data_bus[141]} {i_data_bus[142]} {i_data_bus[143]} {i_data_bus[144]} {i_data_bus[145]} {i_data_bus[146]} {i_data_bus[147]} {i_data_bus[148]} {i_data_bus[149]} {i_data_bus[150]} {i_data_bus[151]} {i_data_bus[152]} {i_data_bus[153]} {i_data_bus[154]} {i_data_bus[155]} {i_data_bus[156]} {i_data_bus[157]} {i_data_bus[158]} {i_data_bus[159]} {i_data_bus[160]} {i_data_bus[161]} {i_data_bus[162]} {i_data_bus[163]} {i_data_bus[164]} {i_data_bus[165]} {i_data_bus[166]} {i_data_bus[167]} {i_data_bus[168]} {i_data_bus[169]} {i_data_bus[170]} {i_data_bus[171]} {i_data_bus[172]} {i_data_bus[173]} {i_data_bus[174]} {i_data_bus[175]} {i_data_bus[176]} {i_data_bus[177]} {i_data_bus[178]} {i_data_bus[179]} {i_data_bus[180]} {i_data_bus[181]} {i_data_bus[182]} {i_data_bus[183]} {i_data_bus[184]} {i_data_bus[185]} {i_data_bus[186]} {i_data_bus[187]} {i_data_bus[188]} {i_data_bus[189]} {i_data_bus[190]} {i_data_bus[191]} {i_data_bus[192]} {i_data_bus[193]} {i_data_bus[194]} {i_data_bus[195]} {i_data_bus[196]} {i_data_bus[197]} {i_data_bus[198]} {i_data_bus[199]} {i_data_bus[200]} {i_data_bus[201]} {i_data_bus[202]} {i_data_bus[203]} {i_data_bus[204]} {i_data_bus[205]} {i_data_bus[206]} {i_data_bus[207]} {i_data_bus[208]} {i_data_bus[209]} {i_data_bus[210]} {i_data_bus[211]} {i_data_bus[212]} {i_data_bus[213]} {i_data_bus[214]} {i_data_bus[215]} {i_data_bus[216]} {i_data_bus[217]} {i_data_bus[218]} {i_data_bus[219]} {i_data_bus[220]} {i_data_bus[221]} {i_data_bus[222]} {i_data_bus[223]} {i_data_bus[224]} {i_data_bus[225]} {i_data_bus[226]} {i_data_bus[227]} {i_data_bus[228]} {i_data_bus[229]} {i_data_bus[230]} {i_data_bus[231]} {i_data_bus[232]} {i_data_bus[233]} {i_data_bus[234]} {i_data_bus[235]} {i_data_bus[236]} {i_data_bus[237]} {i_data_bus[238]} {i_data_bus[239]} {i_data_bus[240]} {i_data_bus[241]} {i_data_bus[242]} {i_data_bus[243]} {i_data_bus[244]} {i_data_bus[245]} {i_data_bus[246]} {i_data_bus[247]} {i_data_bus[248]} {i_data_bus[249]} {i_data_bus[250]} {i_data_bus[251]} {i_data_bus[252]} {i_data_bus[253]} {i_data_bus[254]} {i_data_bus[255]}}
setPinAssignMode -pinEditInBatch false
getPinAssignMode -pinEditInBatch -quiet
setPinAssignMode -pinEditInBatch true
editPin -fixOverlap 1 -spreadDirection clockwise -edge 1 -layer 1 -spreadType side -pin {{i_valid[0]} {i_valid[1]} {i_valid[2]} {i_valid[3]} {i_valid[4]} {i_valid[5]} {i_valid[6]} {i_valid[7]}}
setPinAssignMode -pinEditInBatch false
getPinAssignMode -pinEditInBatch -quiet
setPinAssignMode -pinEditInBatch true
editPin -fixOverlap 1 -spreadDirection clockwise -edge 3 -layer 1 -spreadType side -pin {{o_data_bus[0]} {o_data_bus[1]} {o_data_bus[2]} {o_data_bus[3]} {o_data_bus[4]} {o_data_bus[5]} {o_data_bus[6]} {o_data_bus[7]} {o_data_bus[8]} {o_data_bus[9]} {o_data_bus[10]} {o_data_bus[11]} {o_data_bus[12]} {o_data_bus[13]} {o_data_bus[14]} {o_data_bus[15]} {o_data_bus[16]} {o_data_bus[17]} {o_data_bus[18]} {o_data_bus[19]} {o_data_bus[20]} {o_data_bus[21]} {o_data_bus[22]} {o_data_bus[23]} {o_data_bus[24]} {o_data_bus[25]} {o_data_bus[26]} {o_data_bus[27]} {o_data_bus[28]} {o_data_bus[29]} {o_data_bus[30]} {o_data_bus[31]}}
setPinAssignMode -pinEditInBatch false
getPinAssignMode -pinEditInBatch -quiet
setPinAssignMode -pinEditInBatch true
editPin -fixOverlap 1 -unit MICRON -spreadDirection clockwise -edge 3 -layer 1 -spreadType center -spacing 0.1 -pin {{o_valid[0]}}
setPinAssignMode -pinEditInBatch false
getPinAssignMode -pinEditInBatch -quiet
setPinAssignMode -pinEditInBatch true
editPin -fixOverlap 1 -unit MICRON -spreadDirection clockwise -edge 0 -layer 1 -spreadType start -spacing 0.1 -offsetStart 10 -pin rst
setPinAssignMode -pinEditInBatch false
getPinAssignMode -pinEditInBatch -quiet
setPinAssignMode -pinEditInBatch true
editPin -fixOverlap 1 -unit MICRON -spreadDirection clockwise -edge 0 -layer 1 -spreadType start -spacing 0.1 -offsetStart 15 -pin i_en
setPinAssignMode -pinEditInBatch false
getPinAssignMode -pinEditInBatch -quiet
setPinAssignMode -pinEditInBatch true
editPin -fixOverlap 1 -unit MICRON -spreadDirection clockwise -edge 0 -layer 1 -spreadType start -spacing 0.1 -offsetStart 20 -pin clk
setPinAssignMode -pinEditInBatch false
getPinAssignMode -pinEditInBatch -quiet
setPinAssignMode -pinEditInBatch true
setPinAssignMode -pinEditInBatch false
getPinAssignMode -pinEditInBatch -quiet
setPinAssignMode -pinEditInBatch true
setPinAssignMode -pinEditInBatch false
getPinAssignMode -pinEditInBatch -quiet
setPinAssignMode -pinEditInBatch true
setPinAssignMode -pinEditInBatch false
setAddRingMode -stacked_via_top_layer M3 -stacked_via_bottom_layer M1
addRing -spacing 0.3 -width 0.5 -layer_top M1 -layer_bottom M1 -layer_left M2 -layer_right M2 -center 1 -jog_distance 0.32 -offset 0.32 -threshold 0.32 -nets {VSS VDD}
addStripe -nets {VSS VDD} -layer M5 -direction horizontal -width 4 -spacing 4 -number_of_sets 4 -start_from bottom -start_offset 0 -stop_offset 0 -switch_layer_over_obs false -max_same_layer_jog_length 2 -padcore_ring_top_layer_limit M6 -padcore_ring_bottom_layer_limit M1 -block_ring_top_layer_limit M6 -block_ring_bottom_layer_limit M1 -use_wire_group 0 -snap_wire_center_to_grid None -skip_via_on_pin {  standardcell } -skip_via_on_wire_shape {  noshape }
addStripe -nets {VSS VDD} -layer M6 -direction vertical -width 4 -spacing 4 -number_of_sets 6 -start_from left -start_offset 0 -stop_offset 0 -switch_layer_over_obs false -max_same_layer_jog_length 2 -padcore_ring_top_layer_limit M6 -padcore_ring_bottom_layer_limit M1 -block_ring_top_layer_limit M6 -block_ring_bottom_layer_limit M1 -use_wire_group 0 -snap_wire_center_to_grid None -skip_via_on_pin {  standardcell } -skip_via_on_wire_shape {  noshape }
sroute -connect {blockPin padPin padRing corePin floatingStripe} -layerChangeRange {M1 M3} -corePinTarget {blockring ring} -blockPinTarget {nearestRingStripe nearestTarget} -padPinPortConnect {allPort oneGeom} -checkAlignedSecondaryPin 1 -blockPin useLef -allowJogging 1 -crossoverViaBottomLayer M1 -allowLayerChange 1 -targetViaTopLayer M3 -crossoverViaTopLayer M3 -targetViaBottomLayer M1 -nets {VSS VDD}
globalNetConnect VDD -type tiehi -all
globalNetConnect VSS -type tielo -all
globalNetConnect VDD -type pgpin -pin VDD -inst * -module {}
globalNetConnect VSS -type pgpin -pin VSS -inst * -module {}
saveDesign -rc -verilog ./data/dbs/floorplan/crossbar_one_hot_seq.enc -compress
setPlaceMode -wireLenOptEffort high
setPlaceMode -dptFlow true
setPlaceMode -colorAwareLegal true
set_dont_touch [get_cells -hier *UI_*] true
setNanoRouteMode -routeBottomRoutingLayer 2
setNanoRouteMode -routeTopRoutingLayer 5
setNanoRouteMode -routeConcurrentMinimizeViaCountEffort high
setNanoRouteMode -drouteUseMultiCutViaEffort low
setOptMode -powerEffort high
setOptMode -leakageToDynamicRatio 0
setPlaceMode -placeIoPins false
setOptMode -preserveAssertions true
setOptMode -addInstancePrefix placeopt_
setPinAssignMode -minLayer 2 -maxLayer 4
createPinGroup pinG -pin * -optimizeOrder
createPinGuide -edge 0 -pinGroup pinG -layer {2 3 4}
createPinGuide -edge 1 -pinGroup pinG -layer {2 3 4}
createPinGuide -edge 2 -pinGroup pinG -layer {2 3 4}
createPinGuide -edge 3 -pinGroup pinG -layer {2 3 4}
addWellTap -cell TAPCELLBWP30P140 -cellInterval 30 -prefix WELLTAP
place_opt_design
assignPtnPin
saveDesign -rc -verilog ./data/dbs/place/crossbar_one_hot_seq.enc -compress
setOptMode -addInstancePrefix ccpot_
setAnalysisMode -analysisType onChipVariation -cpp both
create_route_type -name top -preferred_routing_layer_effort medium -top_preferred_layer 4 -bottom_preferred_layer 3
create_route_type -name trunk -preferred_routing_layer_effort medium -top_preferred_layer 4 -bottom_preferred_layer 3
create_route_type -name leaf -preferred_routing_layer_effort medium -top_preferred_layer 2 -bottom_preferred_layer 2
set_ccopt_property route_type -net_type top top
set_ccopt_property route_type -net_type trunk trunk
set_ccopt_property route_type -net_type leaf leaf
set_ccopt_property buffer_cells {BUFFD0P7BWP30P140LVT BUFFD0BWP30P140LVT BUFFD12BWP30P140LVT BUFFD16BWP30P140LVT BUFFD1BWP30P140LVT BUFFD1P5BWP30P140LVT BUFFD2BWP30P140LVT BUFFD3BWP30P140LVT BUFFD4BWP30P140LVT BUFFD6BWP30P140LVT BUFFD8BWP30P140LVT CKBD0BWP30P140LVT CKBD12BWP30P140LVT CKBD16BWP30P140LVT CKBD1BWP30P140LVT CKBD20BWP30P140LVT CKBD24BWP30P140LVT CKBD2BWP30P140LVT CKBD3BWP30P140LVT CKBD4BWP30P140LVT CKBD6BWP30P140LVT CKBD8BWP30P140LVT DCCKBD12BWP30P140LVT DCCKBD16BWP30P140LVT DCCKBD20BWP30P140LVT DCCKBD4BWP30P140LVT DCCKBD8BWP30P140LVT}
set_ccopt_property inverter_cells {CKND0BWP30P140LVT CKND12BWP30P140LVT CKND16BWP30P140LVT CKND1BWP30P140LVT CKND20BWP30P140LVT CKND24BWP30P140LVT CKND2BWP30P140LVT CKND3BWP30P140LVT CKND4BWP30P140LVT CKND6BWP30P140LVT CKND8BWP30P140LVT DCCKND12BWP30P140LVT DCCKND16BWP30P140LVT DCCKND20BWP30P140LVT DCCKND4BWP30P140LVT DCCKND8BWP30P140LVT INVD0P7BWP30P140LVT INVD0BWP30P140LVT INVD12BWP30P140LVT INVD15BWP30P140LVT INVD16BWP30P140LVT INVD18BWP30P140LVT INVD1BWP30P140LVT INVD2BWP30P140LVT INVD1P5BWP30P140LVT INVD3BWP30P140LVT INVD4BWP30P140LVT INVD6BWP30P140LVT INVD8BWP30P140LVT INVD9BWP30P140LVT}
set_ccopt_property target_skew 10ps
set_ccopt_property target_max_trans -net_type top 130ps
set_ccopt_property target_max_trans -net_type trunk 130ps
set_ccopt_property target_max_trans -net_type leaf 150ps
set_ccopt_property use_inverters true
create_ccopt_clock_tree_spec -filename ccopt.spec
ccopt_check_and_flatten_ilms_no_restore
create_ccopt_clock_tree -name clk -source clk -no_skew_group
set_ccopt_property clock_period -pin clk 0.3
create_ccopt_skew_group -name clk/curCon -sources clk -auto_sinks
set_ccopt_property include_source_latency -skew_group clk/curCon true
set_ccopt_property extracted_from_clock_name -skew_group clk/curCon clk
set_ccopt_property extracted_from_constraint_mode_name -skew_group clk/curCon curCon
set_ccopt_property extracted_from_delay_corners -skew_group clk/curCon {curDel curDel}
check_ccopt_clock_tree_convergence
get_ccopt_property auto_design_state_for_ilms
ccopt_design
setLimitedAccessFeature legacy_fects_final_release 1
timeDesign -postRoute -pathReports -slackReports -numPaths 50 -prefix crossbar_one_hot_seq_postRoute -outDir timingReports_postRoute_setup
timeDesign -postRoute -hold -pathReports -slackReports -numPaths 50 -prefix crossbar_one_hot_seq_postRoute -outDir timingReports_postRoute_hold
saveDesign final.enc
report_constraint -all_vio > all_vio.rpt
report_power -outfile ./power.rpt
summaryReport -noHtml -outfile summaryReport.rpt
do_extract_model -view curAna -blackbox ./LIB/$top_design.lib
write_lef_abstract -extractBlockObs ./LEF/crossbar_one_hot_seq.lef
setExtractRCMode -effortLevel low -engine postRoute -total_c_th 0 -relative_c_th 0.03 -coupling_c_th 1
extractRC
set lefDefOutVersion 5.7
saveDesign -rc -verilog -def ./data/dbs/postroute/crossbar_one_hot_seq -nocompress
rcOut -spef ./data/dbs/postroute/crossbar_one_hot_seq.dat/crossbar_one_hot_seq.spef
streamOut ./data/dbs/postroute/crossbar_one_hot_seq.gds -mapFile /usr/scratch/DRBE-shared/TSMC-library/IP/TSMC28_STD_CELLS/custom_utils_ck/tsmc_ip/tcbn28hpcplusbwp30p140/gds2.map -libName DesignLib -units 1000 -mode ALL
zoomBox 187.163 45.567 19.325 109.320
