###############################################################################

		########## PNR_SCRIPT.TCL ########## 

###############################################################################

# setup variables
source ../variables.tcl

set syn_path "../SYNTH"
set pnr_path "../PNR"

# Reading Verilog / LEF / Library Files
set init_verilog		$syn_path/$project-synthesized.v
set init_lef_file		[list	\
					../lib/NanGate_15nm_OCL.tech.lef \
					../lib/NanGate_15nm_OCL.macro.lef \
				]

create_rc_corner		-name	curRC \
				-T		25 \
				-cap_table	../lib/Nangate15.capTbl
create_library_set		-name		curLib \
				-timing	../lib/NanGate_15nm_OCL_typical_conditional_nldm.lib
create_delay_corner		-name		curDel \
				-library_set	curLib \
				-rc_corner	curRC
create_constraint_mode		-name		curCon \
				-sdc_files	$syn_path/$project-synthesized.sdc
create_analysis_view		-name		curAna \
				-constraint_mode	curCon \
				-delay_corner	curDel
init_design			-setup		curAna \
				-hold		curAna

# Setting Floorplan values

floorplan		-r	1 $fp_util 1 1 1 1

setPlaceMode		-wireLenOptEffort	high
setPlaceMode		-dptFlow		true
setPlaceMode		-colorAwareLegal	true
setNanoRouteMode	-routeBottomRoutingLayer	1
setNanoRouteMode	-routeTopRoutingLayer		6
setNanoRouteMode	-routeConcurrentMinimizeViaCountEffort	high
setNanoRouteMode	-drouteUseMultiCutViaEffort	low
setOptMode		-powerEffort		high
setOptMode		-leakageToDynamicRatio	0
setPlaceMode		-placeIoPins		true
setOptMode		-preserveAssertions	true
setOptMode		-addInstancePrefix	placeopt_
setPinAssignMode	-minLayer	1 \
			-maxLayer	6
createPinGroup		pinG		\
			-pin	*	\
			-optimizeOrder
createPinGuide		-edge		0		\
			-pinGroup	pinG		\
			-layer		{1 2 3 4 5 6}
createPinGuide		-edge		1		\
			-pinGroup	pinG		\
			-layer		{1 2 3 4 5 6}
createPinGuide		-edge		2		\
			-pinGroup	pinG		\
			-layer		{1 2 3 4 5 6}
createPinGuide		-edge		3		\
			-pinGroup	pinG		\
			-layer		{1 2 3 4 5 6}
place_opt_design
assignPtnPin
set vars(tech,cts_buffer_cells) [list   \
												BUF_X1 \
												BUF_X12 \
												BUF_X16 \
												BUF_X2 \
												BUF_X4 \
												BUF_X8 \
												CLKBUF_X1 \
												CLKBUF_X12 \
												CLKBUF_X16 \
												CLKBUF_X2 \
												CLKBUF_X4 \
												CLKBUF_X8 \
                                        ]
set vars(tech,cts_inverter_cells)       [list   \
												INV_X1 \
												INV_X12 \
												INV_X16 \
												INV_X2 \
												INV_X4 \
												INV_X8 \
                                        ]

setOptMode		-addInstancePrefix	ccpot_
setAnalysisMode		-analysisType		onChipVariation \
			-cpp			both
create_route_type	-name				top	\
			-preferred_routing_layer_effort	medium	\
			-top_preferred_layer		6	\
			-bottom_preferred_layer		5
create_route_type	-name				trunk	\
			-preferred_routing_layer_effort	medium	\
			-top_preferred_layer		4	\
			-bottom_preferred_layer		3
create_route_type	-name				leaf	\
			-preferred_routing_layer_effort	medium	\
			-top_preferred_layer		2	\
			-bottom_preferred_layer		1
set_ccopt_property	route_type	-net_type	top	top
set_ccopt_property	route_type	-net_type	trunk	trunk
set_ccopt_property	route_type	-net_type	leaf	leaf
set_ccopt_property      buffer_cells    $vars(tech,cts_buffer_cells)
set_ccopt_property      inverter_cells  $vars(tech,cts_inverter_cells)
set_ccopt_property	target_skew					auto
set_ccopt_property	target_max_trans	-net_type	top	auto
set_ccopt_property	target_max_trans	-net_type	trunk	auto
set_ccopt_property	target_max_trans	-net_type	leaf	auto
set_ccopt_property	use_inverters		true
create_ccopt_clock_tree_spec		-immediate
ccoptDesign
optDesign		-postCTS	-hold
setOptMode		-fixHoldAllowSetupTnsDegrade	false	\
			-ignorePathGroupsForHold	{default}
setOptMode		-addInstancePrefix		postctshold_
set_global		timing_disable_library_data_to_data_checks	1
set_global		timing_disable_user_data_to_data_checks		1
optDesign		-postCTS	-hold
setNanoRouteMode	-droutePostRouteSpreadWire	false
setNanoRouteMode	-drouteUseMultiCutViaEffort	low
setDelayCalMode		-SIAware	true
setExtractRCMode	-engine	postRoute	\
			-effortLevel	low
setDelayCalMode		-SIAware	true
setAnalysisMode		-analysisType	onChipVariation
routeDesign -globalDetail
routeDesign -detail
setExtractRCMode	-effortLevel	low		\
			-engine		postRoute	\
			-total_c_th	0		\
			-relative_c_th	0.03		\
			-coupling_c_th	1
optDesign		-postRoute	-hold

# Ouput PNR files
saveDesign		-rc	$pnr_path/data/dbs/$project-pnr.enc
extractRC
rcOut			-spef	$pnr_path/data/dbs/$project-pnr.enc.dat/$project-pnr.spef.gz
set lefDefOutVersion	5.7
defOut			-floorplan	\
			-netlist	$pnr_path/data/dbs/$project-pnr.enc.dat/$project-pnr.def

summaryReport -noHtml -outfile summaryReport.rpt

timeDesign -postRoute -pathReports -drvReports -slackReports -numPaths 50 -prefix bfp16add_postRoute -outDir setupReport
redirect -quiet {set honorDomain [getAnalysisMode -honorClockDomains]} > /dev/null
timeDesign -postRoute -hold -pathReports -slackReports -numPaths 50 -prefix bfp16add_postRoute -outDir holdReport

saveNetlist $project-pnr.v

report_power -outfile ./power.rpt

write_sdf $project-pnr.sdf
write_sdc $project-pnr.sdc

exit

