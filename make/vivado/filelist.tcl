set ip_script "
$modDir/ip/scripts/FIR_FIFO1.tcl
"


set hdl_srcs "
$topDir/hdl/LFSR.vhd
$topDir/hdl/fir_filter.vhd
$topDir/hdl/fir_filter_pkg.vhd
$topDir/fir_filter_top.vhd
$topDir/fir_filter_top_TB.vhd
"


set xdc_srcs "
$topDir/xdc/fir_filter_timing.xdc
"
set xci_srcs "

"