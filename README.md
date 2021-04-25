1. Project Repo : https://github.com/Dhillon-LLC/4TAP_FIR_FILTER_IMPL.git

2. open project in vivado
        a. double click _run_vivado.bat from project dir. This will open vivado in tcl mode
        b. source project.tcl. This will create new project under make/pnr dir and open up vivado GUI
        c. run simulation, synthesis, implementation from vivado GUI

NOTE: To run simulation, select this as top file FIR_FILTER_TOP_TB.vhd        

3. FILTER COEFFICIENT CONVERSION TO 16 BIT TWOs COMPLEMENT :
        src/matlab/generate_coeff.m is used to convert filter coeffs. 

4. One TAP IIR FILTER BLOCK DIAGRAM. The data rate is 2000 MHz and the FPGA logic is 500 MHz:
    doc/IIR_BLOCK_DIAGRAM.JPG