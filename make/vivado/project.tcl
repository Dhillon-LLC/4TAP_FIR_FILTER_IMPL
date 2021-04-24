
# close_project -delete
###################################################################
# define directories
###################################################################
set projDir ../pnr
set modDir  ../../modules
set topDir  ../../src

###################################################################
# project information
###################################################################
set part            xc7k70tfbg484-3
set projName        adc_fir
set topModuleName   fir_filter_top
set updateTopFile   $topDir/fir_filter_top.vhd


###################################################################
# create vivado project
###################################################################
create_project $projName $projDir -part $part -force
set_property target_language VHDL [current_project]


###################################################################
# source additional tcl files 
###################################################################
# contains a list of all hdl files
source filelist.tcl
# add file from file list
source addfiles.tcl

set_property top $topModuleName [current_fileset]

# delete_runs "synth_3"
create_run synth_3 -flow {Vivado Synthesis 2020}
current_run [get_runs synth_3]

# delete_runs "impl_4"
create_run impl_4 -parent_run synth_3 -flow {Vivado Implementation 2020}
current_run [get_runs impl_4]


set_property source_mgmt_mode displayonly [current_project]

set_property VHDL_version vhdl_2008 [current_fileset]

set_property generic C_FIRMWARE_REVISION=32'h0420_0000 [current_fileset]


###################################################################
# open gui
###################################################################
start_gui