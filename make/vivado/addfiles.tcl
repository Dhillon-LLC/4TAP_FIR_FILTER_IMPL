set vhdl "vhd"
set blockd "v"
set script "tcl"
set constr "xdc"
set sverilog "sv"
set svheader "svh"
set blockd "bd"
set ipcore "xci"

foreach line $hdl_srcs {
    set hdlLine [split $line "."]

    if {[string match [lindex $hdlLine end] $vhdl]} {read_vhdl $line}
    if {[string match [lindex $hdlLine end] $blockd]} {read_bd $line}
    if {[string match [lindex $hdlLine end] $blockd]} {read_verilog $line}
}

foreach line $xdc_srcs {
    set hdlLine [split $line "."]
    if {[string match [lindex $hdlLine end] $constr]} {read_xdc $line}
}

foreach line $ip_script {
    set hdlLine [split $line "."]
    if {[string match [lindex $hdlLine end] $script]} {source $line}
}

foreach line $xci_srcs {
    set hdlLine [split $line "."]
    if {[string match [lindex $hdlLine end] $ipcore]} {read_ip $line}
}