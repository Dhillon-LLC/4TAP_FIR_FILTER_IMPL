
Q
Command: %s
53*	vivadotcl2 
route_design2default:defaultZ4-113h px? 
?
@Attempting to get a license for feature '%s' and/or device '%s'
308*common2"
Implementation2default:default2
xc7k70t2default:defaultZ17-347h px? 
?
0Got license for feature '%s' and/or device '%s'
310*common2"
Implementation2default:default2
xc7k70t2default:defaultZ17-349h px? 
P
Running DRC with %s threads
24*drc2
22default:defaultZ23-27h px? 
V
DRC finished with %s
79*	vivadotcl2
0 Errors2default:defaultZ4-198h px? 
e
BPlease refer to the DRC report (report_drc) for more information.
80*	vivadotclZ4-199h px? 
p
,Running DRC as a precondition to command %s
22*	vivadotcl2 
route_design2default:defaultZ4-22h px? 
P
Running DRC with %s threads
24*drc2
22default:defaultZ23-27h px? 
V
DRC finished with %s
79*	vivadotcl2
0 Errors2default:defaultZ4-198h px? 
e
BPlease refer to the DRC report (report_drc) for more information.
80*	vivadotclZ4-199h px? 
V

Starting %s Task
103*constraints2
Routing2default:defaultZ18-103h px? 
}
BMultithreading enabled for route_design using a maximum of %s CPUs17*	routeflow2
22default:defaultZ35-254h px? 
p

Phase %s%s
101*constraints2
1 2default:default2#
Build RT Design2default:defaultZ18-101h px? 
B
-Phase 1 Build RT Design | Checksum: c3ab8423
*commonh px? 
?

%s
*constraints2p
\Time (s): cpu = 00:00:08 ; elapsed = 00:00:06 . Memory (MB): peak = 2035.176 ; gain = 96.2772default:defaulth px? 
v

Phase %s%s
101*constraints2
2 2default:default2)
Router Initialization2default:defaultZ18-101h px? 
o

Phase %s%s
101*constraints2
2.1 2default:default2 
Create Timer2default:defaultZ18-101h px? 
A
,Phase 2.1 Create Timer | Checksum: c3ab8423
*commonh px? 
?

%s
*constraints2p
\Time (s): cpu = 00:00:08 ; elapsed = 00:00:06 . Memory (MB): peak = 2035.184 ; gain = 96.2852default:defaulth px? 
{

Phase %s%s
101*constraints2
2.2 2default:default2,
Fix Topology Constraints2default:defaultZ18-101h px? 
M
8Phase 2.2 Fix Topology Constraints | Checksum: c3ab8423
*commonh px? 
?

%s
*constraints2q
]Time (s): cpu = 00:00:08 ; elapsed = 00:00:06 . Memory (MB): peak = 2041.188 ; gain = 102.2892default:defaulth px? 
t

Phase %s%s
101*constraints2
2.3 2default:default2%
Pre Route Cleanup2default:defaultZ18-101h px? 
F
1Phase 2.3 Pre Route Cleanup | Checksum: c3ab8423
*commonh px? 
?

%s
*constraints2q
]Time (s): cpu = 00:00:08 ; elapsed = 00:00:06 . Memory (MB): peak = 2041.188 ; gain = 102.2892default:defaulth px? 
p

Phase %s%s
101*constraints2
2.4 2default:default2!
Update Timing2default:defaultZ18-101h px? 
C
.Phase 2.4 Update Timing | Checksum: 177d5ebd4
*commonh px? 
?

%s
*constraints2q
]Time (s): cpu = 00:00:09 ; elapsed = 00:00:07 . Memory (MB): peak = 2059.188 ; gain = 120.2892default:defaulth px? 
?
Intermediate Timing Summary %s164*route2L
8| WNS=-0.891 | TNS=-169.996| WHS=-0.220 | THS=-120.230|
2default:defaultZ35-416h px? 
I
4Phase 2 Router Initialization | Checksum: 166122be3
*commonh px? 
?

%s
*constraints2q
]Time (s): cpu = 00:00:10 ; elapsed = 00:00:07 . Memory (MB): peak = 2064.340 ; gain = 125.4412default:defaulth px? 
p

Phase %s%s
101*constraints2
3 2default:default2#
Initial Routing2default:defaultZ18-101h px? 
q

Phase %s%s
101*constraints2
3.1 2default:default2"
Global Routing2default:defaultZ18-101h px? 
D
/Phase 3.1 Global Routing | Checksum: 166122be3
*commonh px? 
?

%s
*constraints2q
]Time (s): cpu = 00:00:10 ; elapsed = 00:00:07 . Memory (MB): peak = 2067.230 ; gain = 128.3322default:defaulth px? 
C
.Phase 3 Initial Routing | Checksum: 130253cd3
*commonh px? 
?

%s
*constraints2q
]Time (s): cpu = 00:00:12 ; elapsed = 00:00:09 . Memory (MB): peak = 2094.457 ; gain = 155.5592default:defaulth px? 
?
>Design has %s pins with tight setup and hold constraints.

%s
244*route2
2012default:default2?
?The top 5 pins with tight setup and hold constraints:

+--------------------------+--------------------------+----------------------------------------------------------------------------------------------------------+
|       Launch Clock       |      Capture Clock       |                                                 Pin                                                      |
+--------------------------+--------------------------+----------------------------------------------------------------------------------------------------------+
|                DAC_CLK_P |                DAC_CLK_P |                                                                                      DAC_DATA_IN_reg[0]/D|
|                DAC_CLK_P |                DAC_CLK_P |                                                                                     DAC_DATA_IN_reg[11]/D|
|                DAC_CLK_P |                DAC_CLK_P |                                                                                     DAC_DATA_IN_reg[14]/D|
|                DAC_CLK_P |                DAC_CLK_P |                                                                                      DAC_DATA_IN_reg[3]/D|
|                DAC_CLK_P |                DAC_CLK_P |                                                                                      DAC_DATA_IN_reg[4]/D|
+--------------------------+--------------------------+----------------------------------------------------------------------------------------------------------+

File with complete list of pins: tight_setup_hold_pins.txt
2default:defaultZ35-580h px? 
s

Phase %s%s
101*constraints2
4 2default:default2&
Rip-up And Reroute2default:defaultZ18-101h px? 
u

Phase %s%s
101*constraints2
4.1 2default:default2&
Global Iteration 02default:defaultZ18-101h px? 
?
Intermediate Timing Summary %s164*route2K
7| WNS=-0.979 | TNS=-183.155| WHS=N/A    | THS=N/A    |
2default:defaultZ35-416h px? 
H
3Phase 4.1 Global Iteration 0 | Checksum: 161a24058
*commonh px? 
?

%s
*constraints2q
]Time (s): cpu = 00:01:09 ; elapsed = 00:01:06 . Memory (MB): peak = 2104.902 ; gain = 166.0042default:defaulth px? 
u

Phase %s%s
101*constraints2
4.2 2default:default2&
Global Iteration 12default:defaultZ18-101h px? 
?
Intermediate Timing Summary %s164*route2K
7| WNS=-0.942 | TNS=-184.260| WHS=N/A    | THS=N/A    |
2default:defaultZ35-416h px? 
H
3Phase 4.2 Global Iteration 1 | Checksum: 1daa534a8
*commonh px? 
?

%s
*constraints2q
]Time (s): cpu = 00:01:10 ; elapsed = 00:01:07 . Memory (MB): peak = 2104.902 ; gain = 166.0042default:defaulth px? 
u

Phase %s%s
101*constraints2
4.3 2default:default2&
Global Iteration 22default:defaultZ18-101h px? 
?
Intermediate Timing Summary %s164*route2K
7| WNS=-0.942 | TNS=-184.377| WHS=N/A    | THS=N/A    |
2default:defaultZ35-416h px? 
H
3Phase 4.3 Global Iteration 2 | Checksum: 1bcaa0ce9
*commonh px? 
?

%s
*constraints2q
]Time (s): cpu = 00:01:11 ; elapsed = 00:01:07 . Memory (MB): peak = 2104.902 ; gain = 166.0042default:defaulth px? 
F
1Phase 4 Rip-up And Reroute | Checksum: 1bcaa0ce9
*commonh px? 
?

%s
*constraints2q
]Time (s): cpu = 00:01:11 ; elapsed = 00:01:07 . Memory (MB): peak = 2104.902 ; gain = 166.0042default:defaulth px? 
|

Phase %s%s
101*constraints2
5 2default:default2/
Delay and Skew Optimization2default:defaultZ18-101h px? 
p

Phase %s%s
101*constraints2
5.1 2default:default2!
Delay CleanUp2default:defaultZ18-101h px? 
r

Phase %s%s
101*constraints2
5.1.1 2default:default2!
Update Timing2default:defaultZ18-101h px? 
E
0Phase 5.1.1 Update Timing | Checksum: 17dde9729
*commonh px? 
?

%s
*constraints2q
]Time (s): cpu = 00:01:11 ; elapsed = 00:01:07 . Memory (MB): peak = 2104.902 ; gain = 166.0042default:defaulth px? 
?
Intermediate Timing Summary %s164*route2K
7| WNS=-0.847 | TNS=-152.497| WHS=N/A    | THS=N/A    |
2default:defaultZ35-416h px? 
C
.Phase 5.1 Delay CleanUp | Checksum: 112e9c173
*commonh px? 
?

%s
*constraints2q
]Time (s): cpu = 00:01:11 ; elapsed = 00:01:07 . Memory (MB): peak = 2104.902 ; gain = 166.0042default:defaulth px? 
z

Phase %s%s
101*constraints2
5.2 2default:default2+
Clock Skew Optimization2default:defaultZ18-101h px? 
M
8Phase 5.2 Clock Skew Optimization | Checksum: 112e9c173
*commonh px? 
?

%s
*constraints2q
]Time (s): cpu = 00:01:11 ; elapsed = 00:01:07 . Memory (MB): peak = 2104.902 ; gain = 166.0042default:defaulth px? 
O
:Phase 5 Delay and Skew Optimization | Checksum: 112e9c173
*commonh px? 
?

%s
*constraints2q
]Time (s): cpu = 00:01:11 ; elapsed = 00:01:07 . Memory (MB): peak = 2104.902 ; gain = 166.0042default:defaulth px? 
n

Phase %s%s
101*constraints2
6 2default:default2!
Post Hold Fix2default:defaultZ18-101h px? 
p

Phase %s%s
101*constraints2
6.1 2default:default2!
Hold Fix Iter2default:defaultZ18-101h px? 
r

Phase %s%s
101*constraints2
6.1.1 2default:default2!
Update Timing2default:defaultZ18-101h px? 
E
0Phase 6.1.1 Update Timing | Checksum: 19261f696
*commonh px? 
?

%s
*constraints2q
]Time (s): cpu = 00:01:11 ; elapsed = 00:01:07 . Memory (MB): peak = 2104.902 ; gain = 166.0042default:defaulth px? 
?
Intermediate Timing Summary %s164*route2K
7| WNS=-0.847 | TNS=-151.913| WHS=0.055  | THS=0.000  |
2default:defaultZ35-416h px? 
C
.Phase 6.1 Hold Fix Iter | Checksum: 19261f696
*commonh px? 
?

%s
*constraints2q
]Time (s): cpu = 00:01:11 ; elapsed = 00:01:07 . Memory (MB): peak = 2104.902 ; gain = 166.0042default:defaulth px? 
A
,Phase 6 Post Hold Fix | Checksum: 19261f696
*commonh px? 
?

%s
*constraints2q
]Time (s): cpu = 00:01:11 ; elapsed = 00:01:07 . Memory (MB): peak = 2104.902 ; gain = 166.0042default:defaulth px? 
o

Phase %s%s
101*constraints2
7 2default:default2"
Route finalize2default:defaultZ18-101h px? 
B
-Phase 7 Route finalize | Checksum: 11b3d179f
*commonh px? 
?

%s
*constraints2q
]Time (s): cpu = 00:01:11 ; elapsed = 00:01:08 . Memory (MB): peak = 2104.902 ; gain = 166.0042default:defaulth px? 
v

Phase %s%s
101*constraints2
8 2default:default2)
Verifying routed nets2default:defaultZ18-101h px? 
I
4Phase 8 Verifying routed nets | Checksum: 11b3d179f
*commonh px? 
?

%s
*constraints2q
]Time (s): cpu = 00:01:11 ; elapsed = 00:01:08 . Memory (MB): peak = 2104.902 ; gain = 166.0042default:defaulth px? 
r

Phase %s%s
101*constraints2
9 2default:default2%
Depositing Routes2default:defaultZ18-101h px? 
E
0Phase 9 Depositing Routes | Checksum: 1dd350771
*commonh px? 
?

%s
*constraints2q
]Time (s): cpu = 00:01:11 ; elapsed = 00:01:08 . Memory (MB): peak = 2104.902 ; gain = 166.0042default:defaulth px? 
t

Phase %s%s
101*constraints2
10 2default:default2&
Post Router Timing2default:defaultZ18-101h px? 
?
Estimated Timing Summary %s
57*route2K
7| WNS=-0.847 | TNS=-151.913| WHS=0.055  | THS=0.000  |
2default:defaultZ35-57h px? 
B
!Router estimated timing not met.
128*routeZ35-328h px? 
G
2Phase 10 Post Router Timing | Checksum: 1dd350771
*commonh px? 
?

%s
*constraints2q
]Time (s): cpu = 00:01:11 ; elapsed = 00:01:08 . Memory (MB): peak = 2104.902 ; gain = 166.0042default:defaulth px? 
@
Router Completed Successfully
2*	routeflowZ35-16h px? 
?

%s
*constraints2q
]Time (s): cpu = 00:01:11 ; elapsed = 00:01:08 . Memory (MB): peak = 2104.902 ; gain = 166.0042default:defaulth px? 
Z
Releasing license: %s
83*common2"
Implementation2default:defaultZ17-83h px? 
?
G%s Infos, %s Warnings, %s Critical Warnings and %s Errors encountered.
28*	vivadotcl2
2002default:default2
222default:default2
02default:default2
02default:defaultZ4-41h px? 
^
%s completed successfully
29*	vivadotcl2 
route_design2default:defaultZ4-42h px? 
?
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2"
route_design: 2default:default2
00:01:132default:default2
00:01:092default:default2
2104.9022default:default2
166.0042default:defaultZ17-268h px? 
H
&Writing timing data to binary archive.266*timingZ38-480h px? 
D
Writing placer database...
1603*designutilsZ20-1893h px? 
=
Writing XDEF routing.
211*designutilsZ20-211h px? 
J
#Writing XDEF routing logical nets.
209*designutilsZ20-209h px? 
J
#Writing XDEF routing special nets.
210*designutilsZ20-210h px? 
?
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2)
Write XDEF Complete: 2default:default2
00:00:012default:default2 
00:00:00.2822default:default2
2104.9022default:default2
0.0002default:defaultZ17-268h px? 
?
 The %s '%s' has been generated.
621*common2

checkpoint2default:default2?
lC:/Users/surin/Documents/project/4TAP_FIR_FILTER_IMPL/make/pnr/adc_fir.runs/impl_4/fir_filter_top_routed.dcp2default:defaultZ17-1381h px? 
?
%s4*runtcl2?
Executing : report_drc -file fir_filter_top_drc_routed.rpt -pb fir_filter_top_drc_routed.pb -rpx fir_filter_top_drc_routed.rpx
2default:defaulth px? 
?
Command: %s
53*	vivadotcl2?
rreport_drc -file fir_filter_top_drc_routed.rpt -pb fir_filter_top_drc_routed.pb -rpx fir_filter_top_drc_routed.rpx2default:defaultZ4-113h px? 
>
IP Catalog is up to date.1232*coregenZ19-1839h px? 
P
Running DRC with %s threads
24*drc2
22default:defaultZ23-27h px? 
?
#The results of DRC are in file %s.
168*coretcl2?
pC:/Users/surin/Documents/project/4TAP_FIR_FILTER_IMPL/make/pnr/adc_fir.runs/impl_4/fir_filter_top_drc_routed.rptpC:/Users/surin/Documents/project/4TAP_FIR_FILTER_IMPL/make/pnr/adc_fir.runs/impl_4/fir_filter_top_drc_routed.rpt2default:default8Z2-168h px? 
\
%s completed successfully
29*	vivadotcl2

report_drc2default:defaultZ4-42h px? 
?
%s4*runtcl2?
?Executing : report_methodology -file fir_filter_top_methodology_drc_routed.rpt -pb fir_filter_top_methodology_drc_routed.pb -rpx fir_filter_top_methodology_drc_routed.rpx
2default:defaulth px? 
?
Command: %s
53*	vivadotcl2?
?report_methodology -file fir_filter_top_methodology_drc_routed.rpt -pb fir_filter_top_methodology_drc_routed.pb -rpx fir_filter_top_methodology_drc_routed.rpx2default:defaultZ4-113h px? 
E
%Done setting XDC timing constraints.
35*timingZ38-35h px? 
Y
$Running Methodology with %s threads
74*drc2
22default:defaultZ23-133h px? 
?
2The results of Report Methodology are in file %s.
450*coretcl2?
|C:/Users/surin/Documents/project/4TAP_FIR_FILTER_IMPL/make/pnr/adc_fir.runs/impl_4/fir_filter_top_methodology_drc_routed.rpt|C:/Users/surin/Documents/project/4TAP_FIR_FILTER_IMPL/make/pnr/adc_fir.runs/impl_4/fir_filter_top_methodology_drc_routed.rpt2default:default8Z2-1520h px? 
d
%s completed successfully
29*	vivadotcl2&
report_methodology2default:defaultZ4-42h px? 
?
%s4*runtcl2?
?Executing : report_power -file fir_filter_top_power_routed.rpt -pb fir_filter_top_power_summary_routed.pb -rpx fir_filter_top_power_routed.rpx
2default:defaulth px? 
?
Command: %s
53*	vivadotcl2?
?report_power -file fir_filter_top_power_routed.rpt -pb fir_filter_top_power_summary_routed.pb -rpx fir_filter_top_power_routed.rpx2default:defaultZ4-113h px? 
E
%Done setting XDC timing constraints.
35*timingZ38-35h px? 
K
,Running Vector-less Activity Propagation...
51*powerZ33-51h px? 
P
3
Finished Running Vector-less Activity Propagation
1*powerZ33-1h px? 
?
G%s Infos, %s Warnings, %s Critical Warnings and %s Errors encountered.
28*	vivadotcl2
2122default:default2
222default:default2
02default:default2
02default:defaultZ4-41h px? 
^
%s completed successfully
29*	vivadotcl2 
report_power2default:defaultZ4-42h px? 
?
%s4*runtcl2}
iExecuting : report_route_status -file fir_filter_top_route_status.rpt -pb fir_filter_top_route_status.pb
2default:defaulth px? 
?
%s4*runtcl2?
?Executing : report_timing_summary -max_paths 10 -file fir_filter_top_timing_summary_routed.rpt -pb fir_filter_top_timing_summary_routed.pb -rpx fir_filter_top_timing_summary_routed.rpx -warn_on_violation 
2default:defaulth px? 
r
UpdateTimingParams:%s.
91*timing29
% Speed grade: -3, Delay Type: min_max2default:defaultZ38-91h px? 
|
CMultithreading enabled for timing update using a maximum of %s CPUs155*timing2
22default:defaultZ38-191h px? 
?
rThe design failed to meet the timing requirements. Please see the %s report for details on the timing violations.
188*timing2"
timing summary2default:defaultZ38-282h px? 
?
%s4*runtcl2k
WExecuting : report_incremental_reuse -file fir_filter_top_incremental_reuse_routed.rpt
2default:defaulth px? 
g
BIncremental flow is disabled. No incremental reuse Info to report.423*	vivadotclZ4-1062h px? 
?
%s4*runtcl2k
WExecuting : report_clock_utilization -file fir_filter_top_clock_utilization_routed.rpt
2default:defaulth px? 
?
%s4*runtcl2?
?Executing : report_bus_skew -warn_on_violation -file fir_filter_top_bus_skew_routed.rpt -pb fir_filter_top_bus_skew_routed.pb -rpx fir_filter_top_bus_skew_routed.rpx
2default:defaulth px? 
r
UpdateTimingParams:%s.
91*timing29
% Speed grade: -3, Delay Type: min_max2default:defaultZ38-91h px? 
|
CMultithreading enabled for timing update using a maximum of %s CPUs155*timing2
22default:defaultZ38-191h px? 


End Record