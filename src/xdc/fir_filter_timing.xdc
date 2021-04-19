create_clock -period 2.00 -name FPGA_CLK_P -waveform {0.00 1.00} [get_ports FPGA_CLK_P]
create_clock -period 0.50 -name ADC_CLK_P -waveform  {0.00 0.25} [get_ports ADC_CLK_P]
create_clock -period 0.50 -name DAC_CLK_P -waveform  {0.00 0.35} [get_ports DAC_CLK_P]

set_property VCCAUX_IO DONTCARE [get_ports ADC_CLK_P]
set_property VCCAUX_IO DONTCARE [get_ports ADC_CLK_N]
set_property VCCAUX_IO DONTCARE [get_ports FPGA_CLK_P]
set_property VCCAUX_IO DONTCARE [get_ports FPGA_CLK_N]
set_property VCCAUX_IO DONTCARE [get_ports DAC_CLK_P]
set_property VCCAUX_IO DONTCARE [get_ports DAC_CLK_N]

set_property PACKAGE_PIN M2  [get_ports {ADC_DATA_P[0]}]
set_property PACKAGE_PIN M1  [get_ports {ADC_DATA_N[0]}]
set_property PACKAGE_PIN K3  [get_ports {ADC_DATA_P[1]}]
set_property PACKAGE_PIN K2  [get_ports {ADC_DATA_N[1]}]
set_property PACKAGE_PIN N3  [get_ports {ADC_DATA_P[2]}]
set_property PACKAGE_PIN N2  [get_ports {ADC_DATA_N[2]}]
set_property PACKAGE_PIN L5  [get_ports {ADC_DATA_P[3]}]
set_property PACKAGE_PIN L4  [get_ports {ADC_DATA_N[3]}]
set_property PACKAGE_PIN P2  [get_ports {ADC_DATA_P[4]}]
set_property PACKAGE_PIN R2  [get_ports {ADC_DATA_N[4]}]
set_property PACKAGE_PIN P1  [get_ports {ADC_DATA_P[5]}]
set_property PACKAGE_PIN R1  [get_ports {ADC_DATA_N[5]}]
set_property PACKAGE_PIN M5  [get_ports {ADC_DATA_P[6]}]
set_property PACKAGE_PIN N4  [get_ports {ADC_DATA_N[6]}]
set_property PACKAGE_PIN T1  [get_ports {ADC_DATA_P[7]}]
set_property PACKAGE_PIN U1  [get_ports {ADC_DATA_N[7]}]
set_property PACKAGE_PIN T4  [get_ports {ADC_DATA_P[8]}]
set_property PACKAGE_PIN U3  [get_ports {ADC_DATA_N[8]}]
set_property PACKAGE_PIN V4  [get_ports {ADC_DATA_P[9]}]
set_property PACKAGE_PIN W4  [get_ports {ADC_DATA_N[9]}]
set_property PACKAGE_PIN U2  [get_ports {ADC_DATA_P[10]}]
set_property PACKAGE_PIN V2  [get_ports {ADC_DATA_N[10]}]
set_property PACKAGE_PIN T5  [get_ports {ADC_DATA_P[11]}]
set_property PACKAGE_PIN U5  [get_ports {ADC_DATA_N[11]}]
set_property PACKAGE_PIN V3  [get_ports {ADC_DATA_P[12]}]
set_property PACKAGE_PIN W2  [get_ports {ADC_DATA_N[12]}]
set_property PACKAGE_PIN N5  [get_ports {ADC_DATA_P[13]}]
set_property PACKAGE_PIN P5  [get_ports {ADC_DATA_N[13]}]
set_property PACKAGE_PIN W5  [get_ports {ADC_DATA_P[14]}]
set_property PACKAGE_PIN Y4  [get_ports {ADC_DATA_N[14]}]
set_property PACKAGE_PIN W1  [get_ports {ADC_DATA_P[15]}]
set_property PACKAGE_PIN Y1  [get_ports {ADC_DATA_N[15]}]
set_property PACKAGE_PIN AA5 [get_ports {DAC_DATA_P[0]}]
set_property PACKAGE_PIN AB5 [get_ports {DAC_DATA_N[0]}]
set_property PACKAGE_PIN AB8 [get_ports {DAC_DATA_P[1]}]
set_property PACKAGE_PIN AB7 [get_ports {DAC_DATA_N[1]}]
set_property PACKAGE_PIN AA6 [get_ports {DAC_DATA_P[2]}]
set_property PACKAGE_PIN AB6 [get_ports {DAC_DATA_N[2]}]
set_property PACKAGE_PIN AA9 [get_ports {DAC_DATA_P[4]}]
set_property PACKAGE_PIN AA8 [get_ports {DAC_DATA_N[4]}]
set_property PACKAGE_PIN W11 [get_ports {DAC_DATA_P[5]}]
set_property PACKAGE_PIN Y11 [get_ports {DAC_DATA_N[5]}]
set_property PACKAGE_PIN W6 [get_ports {DAC_DATA_P[6]}]
set_property PACKAGE_PIN Y6 [get_ports {DAC_DATA_N[6]}]
set_property PACKAGE_PIN R7 [get_ports {DAC_DATA_P[7]}]
set_property PACKAGE_PIN R6 [get_ports {DAC_DATA_N[7]}]
set_property PACKAGE_PIN U8 [get_ports {DAC_DATA_P[8]}]
set_property PACKAGE_PIN V8 [get_ports {DAC_DATA_N[8]}]
set_property PACKAGE_PIN U7 [get_ports {DAC_DATA_P[9]}]
set_property PACKAGE_PIN U6 [get_ports {DAC_DATA_N[9]}]
set_property PACKAGE_PIN V7 [get_ports {DAC_DATA_P[10]}]
set_property PACKAGE_PIN W7 [get_ports {DAC_DATA_N[10]}]
set_property PACKAGE_PIN Y8 [get_ports {DAC_DATA_P[11]}]
set_property PACKAGE_PIN Y7 [get_ports {DAC_DATA_N[11]}]
set_property PACKAGE_PIN W9 [get_ports {DAC_DATA_P[12]}]
set_property PACKAGE_PIN Y9 [get_ports {DAC_DATA_N[12]}]
set_property PACKAGE_PIN U10 [get_ports {DAC_DATA_P[13]}]
set_property PACKAGE_PIN V9 [get_ports {DAC_DATA_N[13]}]
set_property PACKAGE_PIN V10 [get_ports {DAC_DATA_P[14]}]
set_property PACKAGE_PIN W10 [get_ports {DAC_DATA_N[14]}]
set_property PACKAGE_PIN T11 [get_ports {DAC_DATA_P[15]}]
set_property PACKAGE_PIN T10 [get_ports {DAC_DATA_N[15]}]
set_property PACKAGE_PIN U12 [get_ports Valid_in_P]
set_property PACKAGE_PIN U11 [get_ports Valid_in_N]
set_property PACKAGE_PIN T9 [get_ports DAC_VALID_OUT_P]
set_property PACKAGE_PIN T8 [get_ports DAC_VALID_OUT_N]
set_property PACKAGE_PIN AA10 [get_ports {DAC_DATA_P[3]}]
set_property PACKAGE_PIN AB10 [get_ports {DAC_DATA_N[3]}]
set_property PACKAGE_PIN V20 [get_ports ADC_CLK_P]
set_property PACKAGE_PIN W20 [get_ports ADC_CLK_N]
set_property PACKAGE_PIN V19 [get_ports DAC_CLK_P]
set_property PACKAGE_PIN W19 [get_ports DAC_CLK_N]
set_property PACKAGE_PIN Y18 [get_ports FPGA_CLK_P]
set_property PACKAGE_PIN Y19 [get_ports FPGA_CLK_N]
set_property PACKAGE_PIN K1 [get_ports RESET_P]
set_property PACKAGE_PIN L1 [get_ports RESET_N]

set_property IOSTANDARD LVDS [get_ports RESET_P]
set_property IOSTANDARD LVDS [get_ports RESET_N]

#set_property DIRECTION IN [get_ports {ADC_DATA_P[0]}]
set_property IOSTANDARD LVDS [get_ports {ADC_DATA_P[0]}]
#set_property DIRECTION IN [get_ports {ADC_DATA_P[1]}]
set_property IOSTANDARD LVDS [get_ports {ADC_DATA_P[1]}]
#set_property DIRECTION IN [get_ports {ADC_DATA_P[2]}]
set_property IOSTANDARD LVDS [get_ports {ADC_DATA_P[2]}]
#set_property DIRECTION IN [get_ports {ADC_DATA_P[3]}]
set_property IOSTANDARD LVDS [get_ports {ADC_DATA_P[3]}]
#set_property DIRECTION IN [get_ports {ADC_DATA_P[4]}]
set_property IOSTANDARD LVDS [get_ports {ADC_DATA_P[4]}]
#set_property DIRECTION IN [get_ports {ADC_DATA_P[5]}]
set_property IOSTANDARD LVDS [get_ports {ADC_DATA_P[5]}]
#set_property DIRECTION IN [get_ports {ADC_DATA_P[6]}]
set_property IOSTANDARD LVDS [get_ports {ADC_DATA_P[6]}]
#set_property DIRECTION IN [get_ports {ADC_DATA_P[7]}]
set_property IOSTANDARD LVDS [get_ports {ADC_DATA_P[7]}]
#set_property DIRECTION IN [get_ports {ADC_DATA_P[8]}]
set_property IOSTANDARD LVDS [get_ports {ADC_DATA_P[8]}]
#set_property DIRECTION IN [get_ports {ADC_DATA_P[9]}]
set_property IOSTANDARD LVDS [get_ports {ADC_DATA_P[9]}]
#set_property DIRECTION IN [get_ports {ADC_DATA_P[10]}]
set_property IOSTANDARD LVDS [get_ports {ADC_DATA_P[10]}]
#set_property DIRECTION IN [get_ports {ADC_DATA_P[11]}]
set_property IOSTANDARD LVDS [get_ports {ADC_DATA_P[11]}]
#set_property DIRECTION IN [get_ports {ADC_DATA_P[12]}]
set_property IOSTANDARD LVDS [get_ports {ADC_DATA_P[12]}]
#set_property DIRECTION IN [get_ports {ADC_DATA_P[13]}]
set_property IOSTANDARD LVDS [get_ports {ADC_DATA_P[13]}]
#set_property DIRECTION IN [get_ports {ADC_DATA_P[14]}]
set_property IOSTANDARD LVDS [get_ports {ADC_DATA_P[14]}]
#set_property DIRECTION IN [get_ports {ADC_DATA_P[15]}]
set_property IOSTANDARD LVDS [get_ports {ADC_DATA_P[15]}]
#set_property DIRECTION IN [get_ports {ADC_DATA_N[0]}]
set_property IOSTANDARD LVDS [get_ports {ADC_DATA_N[0]}]
#set_property DIRECTION IN [get_ports {ADC_DATA_N[1]}]
set_property IOSTANDARD LVDS [get_ports {ADC_DATA_N[1]}]
#set_property DIRECTION IN [get_ports {ADC_DATA_N[2]}]
set_property IOSTANDARD LVDS [get_ports {ADC_DATA_N[2]}]
#set_property DIRECTION IN [get_ports {ADC_DATA_N[3]}]
set_property IOSTANDARD LVDS [get_ports {ADC_DATA_N[3]}]
#set_property DIRECTION IN [get_ports {ADC_DATA_N[4]}]
set_property IOSTANDARD LVDS [get_ports {ADC_DATA_N[4]}]
#set_property DIRECTION IN [get_ports {ADC_DATA_N[5]}]
set_property IOSTANDARD LVDS [get_ports {ADC_DATA_N[5]}]
#set_property DIRECTION IN [get_ports {ADC_DATA_N[6]}]
set_property IOSTANDARD LVDS [get_ports {ADC_DATA_N[6]}]
#set_property DIRECTION IN [get_ports {ADC_DATA_N[7]}]
set_property IOSTANDARD LVDS [get_ports {ADC_DATA_N[7]}]
#set_property DIRECTION IN [get_ports {ADC_DATA_N[8]}]
set_property IOSTANDARD LVDS [get_ports {ADC_DATA_N[8]}]
#set_property DIRECTION IN [get_ports {ADC_DATA_N[9]}]
set_property IOSTANDARD LVDS [get_ports {ADC_DATA_N[9]}]
#set_property DIRECTION IN [get_ports {ADC_DATA_N[10]}]
set_property IOSTANDARD LVDS [get_ports {ADC_DATA_N[10]}]
#set_property DIRECTION IN [get_ports {ADC_DATA_N[11]}]
set_property IOSTANDARD LVDS [get_ports {ADC_DATA_N[11]}]
#set_property DIRECTION IN [get_ports {ADC_DATA_N[12]}]
set_property IOSTANDARD LVDS [get_ports {ADC_DATA_N[12]}]
#set_property DIRECTION IN [get_ports {ADC_DATA_N[13]}]
set_property IOSTANDARD LVDS [get_ports {ADC_DATA_N[13]}]
#set_property DIRECTION IN [get_ports {ADC_DATA_N[14]}]
set_property IOSTANDARD LVDS [get_ports {ADC_DATA_N[14]}]
#set_property DIRECTION IN [get_ports {ADC_DATA_N[15]}]
set_property IOSTANDARD LVDS [get_ports {ADC_DATA_N[15]}]
#set_property DIRECTION OUT [get_ports {DAC_DATA_P[0]}]
set_property IOSTANDARD LVDS [get_ports {DAC_DATA_P[0]}]
#set_property DIRECTION OUT [get_ports {DAC_DATA_P[1]}]
set_property IOSTANDARD LVDS [get_ports {DAC_DATA_P[1]}]
#set_property DIRECTION OUT [get_ports {DAC_DATA_P[2]}]
set_property IOSTANDARD LVDS [get_ports {DAC_DATA_P[2]}]
#set_property DIRECTION OUT [get_ports {DAC_DATA_P[3]}]
set_property IOSTANDARD LVDS [get_ports {DAC_DATA_P[3]}]
#set_property DIRECTION OUT [get_ports {DAC_DATA_P[4]}]
set_property IOSTANDARD LVDS [get_ports {DAC_DATA_P[4]}]
#set_property DIRECTION OUT [get_ports {DAC_DATA_P[5]}]
set_property IOSTANDARD LVDS [get_ports {DAC_DATA_P[5]}]
#set_property DIRECTION OUT [get_ports {DAC_DATA_P[6]}]
set_property IOSTANDARD LVDS [get_ports {DAC_DATA_P[6]}]
#set_property DIRECTION OUT [get_ports {DAC_DATA_P[7]}]
set_property IOSTANDARD LVDS [get_ports {DAC_DATA_P[7]}]
#set_property DIRECTION OUT [get_ports {DAC_DATA_P[8]}]
set_property IOSTANDARD LVDS [get_ports {DAC_DATA_P[8]}]
#set_property DIRECTION OUT [get_ports {DAC_DATA_P[9]}]
set_property IOSTANDARD LVDS [get_ports {DAC_DATA_P[9]}]
#set_property DIRECTION OUT [get_ports {DAC_DATA_P[10]}]
set_property IOSTANDARD LVDS [get_ports {DAC_DATA_P[10]}]
#set_property DIRECTION OUT [get_ports {DAC_DATA_P[11]}]
set_property IOSTANDARD LVDS [get_ports {DAC_DATA_P[11]}]
#set_property DIRECTION OUT [get_ports {DAC_DATA_P[12]}]
set_property IOSTANDARD LVDS [get_ports {DAC_DATA_P[12]}]
#set_property DIRECTION OUT [get_ports {DAC_DATA_P[13]}]
set_property IOSTANDARD LVDS [get_ports {DAC_DATA_P[13]}]
#set_property DIRECTION OUT [get_ports {DAC_DATA_P[14]}]
set_property IOSTANDARD LVDS [get_ports {DAC_DATA_P[14]}]
#set_property DIRECTION OUT [get_ports {DAC_DATA_P[15]}]
set_property IOSTANDARD LVDS [get_ports {DAC_DATA_P[15]}]
#set_property DIRECTION OUT [get_ports {DAC_DATA_N[0]}]
set_property IOSTANDARD LVDS [get_ports {DAC_DATA_N[0]}]
#set_property DIRECTION OUT [get_ports {DAC_DATA_N[1]}]
set_property IOSTANDARD LVDS [get_ports {DAC_DATA_N[1]}]
#set_property DIRECTION OUT [get_ports {DAC_DATA_N[2]}]
set_property IOSTANDARD LVDS [get_ports {DAC_DATA_N[2]}]
#set_property DIRECTION OUT [get_ports {DAC_DATA_N[3]}]
set_property IOSTANDARD LVDS [get_ports {DAC_DATA_N[3]}]
#set_property DIRECTION OUT [get_ports {DAC_DATA_N[4]}]
set_property IOSTANDARD LVDS [get_ports {DAC_DATA_N[4]}]
#set_property DIRECTION OUT [get_ports {DAC_DATA_N[5]}]
set_property IOSTANDARD LVDS [get_ports {DAC_DATA_N[5]}]
#set_property DIRECTION OUT [get_ports {DAC_DATA_N[6]}]
set_property IOSTANDARD LVDS [get_ports {DAC_DATA_N[6]}]
#set_property DIRECTION OUT [get_ports {DAC_DATA_N[7]}]
set_property IOSTANDARD LVDS [get_ports {DAC_DATA_N[7]}]
#set_property DIRECTION OUT [get_ports {DAC_DATA_N[8]}]
set_property IOSTANDARD LVDS [get_ports {DAC_DATA_N[8]}]
#set_property DIRECTION OUT [get_ports {DAC_DATA_N[9]}]
set_property IOSTANDARD LVDS [get_ports {DAC_DATA_N[9]}]
#set_property DIRECTION OUT [get_ports {DAC_DATA_N[10]}]
set_property IOSTANDARD LVDS [get_ports {DAC_DATA_N[10]}]
#set_property DIRECTION OUT [get_ports {DAC_DATA_N[11]}]
set_property IOSTANDARD LVDS [get_ports {DAC_DATA_N[11]}]
#set_property DIRECTION OUT [get_ports {DAC_DATA_N[12]}]
set_property IOSTANDARD LVDS [get_ports {DAC_DATA_N[12]}]
#set_property DIRECTION OUT [get_ports {DAC_DATA_N[13]}]
set_property IOSTANDARD LVDS [get_ports {DAC_DATA_N[13]}]
#set_property DIRECTION OUT [get_ports {DAC_DATA_N[14]}]
set_property IOSTANDARD LVDS [get_ports {DAC_DATA_N[14]}]
#set_property DIRECTION OUT [get_ports {DAC_DATA_N[15]}]
set_property IOSTANDARD LVDS [get_ports {DAC_DATA_N[15]}]
#set_property DIRECTION IN [get_ports Valid_in_P]
set_property IOSTANDARD LVDS [get_ports Valid_in_P]
#set_property DIRECTION IN [get_ports Valid_in_N]
set_property IOSTANDARD LVDS [get_ports Valid_in_N]
#set_property DIRECTION OUT [get_ports DAC_VALID_OUT_P]
set_property IOSTANDARD LVDS [get_ports DAC_VALID_OUT_P]
#set_property DIRECTION OUT [get_ports DAC_VALID_OUT_N]
set_property IOSTANDARD LVDS [get_ports DAC_VALID_OUT_N]
#set_property DIRECTION IN [get_ports DAC_CLK_P]
set_property IOSTANDARD DIFF_HSTL_II [get_ports DAC_CLK_P]
#set_property DIRECTION IN [get_ports DAC_CLK_N]
set_property IOSTANDARD DIFF_HSTL_II [get_ports DAC_CLK_N]
#set_property DIRECTION IN [get_ports FPGA_CLK_P]
set_property IOSTANDARD DIFF_HSTL_II [get_ports FPGA_CLK_P]
#set_property DIRECTION IN [get_ports FPGA_CLK_N]
set_property IOSTANDARD DIFF_HSTL_II [get_ports FPGA_CLK_N]
#set_property DIRECTION IN [get_ports ADC_CLK_P]
set_property IOSTANDARD DIFF_HSTL_II [get_ports ADC_CLK_P]
#set_property DIRECTION IN [get_ports ADC_CLK_N]
set_property IOSTANDARD DIFF_HSTL_II [get_ports ADC_CLK_N]
#revert back to original instance
current_instance -quiet


## Asynchronous PATH between FPGA_CLK_P ADC_CLK_P AND DAC_CLK_P CPACKAGE_PINks
set_clock_groups -asynchronous -group [get_clocks ADC_CLK_P] -group [get_clocks FPGA_CLK_P]
set_clock_groups -asynchronous -group [get_clocks FPGA_CLK_P] -group [get_clocks DAC_CLK_P]
set_false_path -from [get_clocks FPGA_CLK_P] -to [get_clocks DAC_CLK_P]
set_false_path -from [get_clocks ADC_CLK_P] -to [get_clocks FPGA_CLK_P]