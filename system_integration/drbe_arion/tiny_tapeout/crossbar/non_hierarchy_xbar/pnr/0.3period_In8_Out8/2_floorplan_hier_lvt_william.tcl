######################## Floorplan params ##############################
# custom size
set core_width 			2200
#set core_width 			65
set core_height 		100
set IO_dist 			3
# aspect ratio and utilization based
set aspect_ratio 		1
set util			0.75
####################### End of floorplan params ########################

####################### Power Planning Params ########################
set core_ring_width 		0.5
set core_ring_spacing	 	0.3
set core_ring_offset 		0.32
set core_ring_vert_layer	M2
set core_ring_horz_layer	M1

set core_stripe_horz_width	5
set core_stripe_vert_width	5
set core_stripe_horz_spacing	4
set core_stripe_vert_spacing	4
set core_stripe_horz_layer	M5
set core_stripe_vert_layer	M6
set core_stripe_horz_count	4
set core_stripe_vert_count	6
####################### End of powerplanning params ###################

# aspect ratio and util based floorplan
#floorplan		-r	$aspect_ratio $util $IO_dist $IO_dist $IO_dist $IO_dist
#floorplan 		-site 	$core_width $core_height $IO_dist $IO_dist $IO_dist $IO_dist

####################### Add Macros ######################### 052519_DH
#addHaloToBlock 2 2 2 2 -allMacro

#floorplan -d $core_width $core_height 10 10 10 10
#placeInstance  inst_cont  100 20 
#placeInstance  UI_dut_mem   23 5 R180 



########## Add Core Ring #########
setAddRingMode -stacked_via_top_layer M3 -stacked_via_bottom_layer M1
addRing -spacing $core_ring_spacing -width $core_ring_width -layer_top $core_ring_horz_layer -layer_bottom $core_ring_horz_layer -layer_left $core_ring_vert_layer -layer_right $core_ring_vert_layer -center 1 -jog_distance 0.32 -offset $core_ring_offset -threshold 0.32 -nets [list $default_ground $core_supply]

########## Add core stripes/grids ######
#horizontal M5 stripes 
addStripe -nets [list $default_ground $core_supply] -layer $core_stripe_horz_layer -direction horizontal -width $core_stripe_horz_width -spacing $core_stripe_horz_spacing -number_of_sets $core_stripe_horz_count -start_from bottom -start_offset 0 -stop_offset 0 -switch_layer_over_obs false -max_same_layer_jog_length 2 -padcore_ring_top_layer_limit M6 -padcore_ring_bottom_layer_limit M1 -block_ring_top_layer_limit M6 -block_ring_bottom_layer_limit M1 -use_wire_group 0 -snap_wire_center_to_grid None -skip_via_on_pin {  standardcell } -skip_via_on_wire_shape {  noshape }

#vertical M6 stripes 
addStripe -nets [list $default_ground $core_supply] -layer $core_stripe_vert_layer -direction vertical -width $core_stripe_vert_width -spacing $core_stripe_vert_spacing -number_of_sets $core_stripe_vert_count -start_from left -start_offset 0 -stop_offset 0 -switch_layer_over_obs false -max_same_layer_jog_length 2 -padcore_ring_top_layer_limit M6 -padcore_ring_bottom_layer_limit M1 -block_ring_top_layer_limit M6 -block_ring_bottom_layer_limit M1 -use_wire_group 0 -snap_wire_center_to_grid None -skip_via_on_pin {  standardcell } -skip_via_on_wire_shape {  noshape }
##

######### Add HardMacro BlockRing ########
#set HM_Ring_Width 0.6
#set HM_Ring_Space 0.6
#addRing -nets [list $default_ground $core_supply] -type block_rings -around each_block -layer_top $core_ring_horz_layer -layer_bottom $core_ring_horz_layer -layer_left $core_ring_vert_layer -layer_right $core_ring_vert_layer -width {top 0.4 bottom 0.4 left 0.36 right 0.36} -spacing {top 0.5 bottom 0.5 left 0.5 right 0.5} -offset {top 0.5 bottom 0.5 left 0.5 right 0.5} -center 0 -extend_corner {} -threshold 0 -jog_distance 0 -snap_wire_center_to_grid None



sroute -connect {blockPin padPin padRing corePin floatingStripe} -layerChangeRange {M1 M3} -corePinTarget {blockring ring} -blockPinTarget {nearestRingStripe nearestTarget} -padPinPortConnect {allPort oneGeom} -checkAlignedSecondaryPin 1 -blockPin useLef -allowJogging 1 -crossoverViaBottomLayer M1 -allowLayerChange 1 -targetViaTopLayer M3 -crossoverViaTopLayer M3 -targetViaBottomLayer M1 -nets [list $default_ground $core_supply]

globalNetConnect $core_supply -type tiehi -all
globalNetConnect $default_ground -type tielo -all
globalNetConnect $core_supply -type pgpin -pin $core_supply  -inst * -module {}
globalNetConnect $default_ground -type pgpin -pin $default_ground -inst * -module {}

saveDesign		-rc -verilog	./data/dbs/floorplan/$top_design.enc \
			-compress

