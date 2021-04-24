
puts "\nEnter FIRMWARE REVISION ID\n"
gets stdin user_input
set versionNumber $user_input
set TIMING_REPORT ../../place_and_route/fir_filter_01.runs/impl_1/fir_filter_top_utilization_placed.rpt

set xilinx_app_dir C:/Xilinx/Vivado/2020.2/bin
set top_filename fir_filter_top.vhd
set topDir       ../../src
set simDir       ../../place_and_route/fir_filter_01.simDir
set proj_Dir     ../..
set create_mcs_file "TRUE"
set bit_src_dir "../../place_and_route/fir_filter_01.runs/impl_1"

set bit_src_name fir_filter_top
set debug_src_name debug_nets

set load_dir FIRMWARE_LOAD
set file_dir CHANGED_FILES



puts "\nEnter Yes to update git_changes.tcl, else No"
gets stdin select_file

if {$select_file == "yes"} {
    file delete -force git_changes.tcl
    exec echo set changed_files > git_changes.tcl
    cd ../../
    exec git status >> make/bit/git_changes.tcl
    cd make/bit
} else {
    file copy -force ls-files.tcl git_changes.tcl
}

puts "\nFixed this file git_changes.tcl"
gets stdin response

if { $response == "yes"} {
    source git_changes.tcl
    # source ver_number.tcl
    # set versionNumber $VERSION_NUMBER_TCL
    # set TIMING_REPORT $TIMING_REPORT_TCL
    exec echo Revision ID : $versionNumber > bit_log_history_$versionNumber.log
    # exec grep -A 6 "Design Timing Summary" $TIMING_REPORT >> bit_log_history_$versionNumber.log
    exec echo "Design Changes\n" >> bit_log_history_$versionNumber.log
    puts "\n Log design Changes \n"
    gets stdin comment
    exec echo $comment >> bit_log_history_$versionNumber.log
    exec cat bit_log_history_$versionNumber.log >> bit_log_history.txt


    set bit_src_origin [concat [lindex $bit_src_dir/$bit_src_name].bit ]
    set bit_src_new [concat [lindex $load_dir/$bit_src_name]_[lindex $versionNumber].bit ]
    set debug_src_origin [concat [lindex $bit_src_dir/$debug_src_name].ltx ]
    set debug_src_new [concat [lindex $load_dir/$debug_src_name]_[lindex $versionNumber].ltx ]
    set mcs_src [concat [lindex $load_dir/$bit_src_name]_[lindex $versionNumber].mcs ]
    set top_src_new [concat [lindex $load_dir/$bit_src_name]_[lindex $versionNumber].vhd ]


    if {![file exists $load_dir]} {
        puts "creating $load_dir"
        file mkdir $load_dir
    }

    if {![file exists $file_dir]} {
        puts "creating $file_dir"
        file mkdir $file_dir
        file mkdir $file_dir/$versionNumber
    }

    if {[file exists $bit_src_new]} {
        puts "\nbit file already exist in $load_dir"
        return
    }

    puts "\nEnter Yes to copy files to FIRMWARE_LOAD directory\n"

    gets stdin response

    if {$response == "yes"} {
        if {![file exists $bit_src_origin]} {
            puts "bit file do not exist"
        } else {
            file copy -force $bit_src_origin $bit_src_new

        }
        if {![file exists $debug_src_origin]} {
            puts "debug ltx file do not exist"
        } else {
            file copy -force $debug_src_origin $debug_src_new

        }

        #copy changed file list
        foreach fileName $changed_files {
            if {![file exists $proj_Dir/$fileName]} {
                puts "file don not exists $proj_Dir/$fileName"
            } else {
                if { ![file isdirectory [file dirname $file_dir/$versionNumber/$fileName]]} {
                    file mkdir [file dirname $file_dir/$versionNumber/$fileName]
                    file copy -force $proj_Dir/$fileName $file_dir/$versionNumber/$fileName
                }
            }
        }
    }

    if {[string match $create_mcs_file "TRUE"]} {
        if {![file exists $bit_src_new]} {
            puts "bit write operation failed because of missing bit file"
        } else {
            write_cfgmem -force -format mcs -size 128 -interface BPIx16 -checksum -loadbit "up 0x0 $bit_src_new" $mcs_src
        }
    }
}  else {
    puts "Enter yes in terminal once finished with version number setup\n"
}