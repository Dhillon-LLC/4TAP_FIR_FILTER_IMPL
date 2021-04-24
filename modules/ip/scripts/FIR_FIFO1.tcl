
set ip_name "FIR_FIFO1"
set ip_dir  "../../modules/ip"


create_ip -name fifo_generator -vendor xilinx.com -library ip -version 13.2 -module_name $ip_name -dir $ip_dir

set_property -dict [list CONFIG.INTERFACE_TYPE {Native} \
                            CONFIG.Performance_Options {First_Word_Fall_Through} \
                            CONFIG.Input_Data_Width {16} \
                            CONFIG.Input_Depth {256} \
                            CONFIG.Output_Depth {256} \
                            CONFIG.Output_Data_Width {16} \
                            CONFIG.Reset_Type {Synchronous_Reset} \
                            CONFIG.Use_Extra_Logic {true} \
                            CONFIG.Data_Count {true} \
                            CONFIG.Enable_Safety_Circuit {false}] [get_ips $ip_name]


generate_target all [get_files  */$ip_name.xci]