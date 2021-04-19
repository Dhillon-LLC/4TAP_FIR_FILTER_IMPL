1. Project Repo : https://github.com/Dhillon-LLC/4TAP_FIR_FILTER_IMPL.git

2. project_file_structure
        ├───doc/IIR_BLOCK_DIAGRAM.JPG
        ├───modules
        │   └───ip
        │       └───scripts/FIR_FIFO1.tcl
        ├───place_and_route
        │   └───fir_filter_01.sim
        │       └───sim_1
        │           └───behav
        │               └───xsim/FIR_FILTER_TOP_TB.wcfg
        └───src
            ├───hdl/LFSR.vhd
            ├───hdl/fir_filter.vhd
            ├───hdl/fir_filter_pkg.vhd
            ├───hdl/fir_filter_top.vhd
            ├───hdl/fir_filter_top_TB.vhd
            ├───matlab/generate_coeff.m
            └───xdc/fir_filter_timing.xdc

3. FILTER COEFFICIENT CONVERSION TO 16 BIT TWOs COMPLEMENT :
        src/matlab/generate_coeff.m is used to convert filter coeffs. 



4. One TAP IIR FILTER BLOCK DIAGRAM. The data rate is 2000 MHz and the FPGA logic is 500 MHz:
    doc/IIR_BLOCK_DIAGRAM.JPG