
-------------------------------------------------------------------------------
-- Objective
-- Construct a finite impulse response (FIR) filter with 4 coefficients (taps) in HDL along with a test-bench.  
-- Perform synthesis, placement and routing, and static timing analysis.  
-- Input data is assumed to have been digitized from a 16-bit analog-to-digital converter (ADC) at a sample rate of 2000 MHz.  
-- The FPGA logic is operating at a slower rate of 500 MHz.  
-- Output data is assumed to be driving a digital-to-analog converter at a sample rate of 2000 MHz.  
-- A block diagram of the FIR filter and interfaces is shown below:
--
-- Author : Surinder Pal Singh
--
-- Dependencies   : FIR_FIFO1 , FIR_FILTER, IBUFGDS
--
-- Limitation     : Design did not meet the timing requirement. Require advance timing constraint along with logic modification to meet timing 
--                  requirement
-- Implementation : Need four FIFO to buffer up ADC data to provide parallel processing to handle 2000MHz input stream to FPGA 500MHz 
--                  FIR_FILTER processing unit. Each FIFO output data get tied to FIR_FILTER module to handle four input sample in parallel 
--                  chain. Output of each FIR_MOUDLE, then pipelined to provide output stream @2000MHz

-------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.std_logic_unsigned.ALL;

USE work.fir_filter_pkg.ALL;

LIBRARY unisim;
USE unisim.vcomponents.ALL;

ENTITY FIR_FILTER_TOP_TB IS
  -- GENERIC (
  --   C_FIRMWARE_REVISION : STD_LOGIC_VECTOR(31 DOWNTO 0):= x"0424_0000";
  --   SIM_MODE : STRING := "FALSE";
  --   g_Num_Bits : INTEGER := 16
  -- );
  -- --  PORT (
  --   FPGA_CLK_P : IN STD_LOGIC;
  --   FPGA_CLK_N : IN STD_LOGIC;
  --   ADC_CLK_P : IN STD_LOGIC;
  --   ADC_CLK_N : IN STD_LOGIC;
  --   ADC_DATA_P : IN STD_LOGIC_VECTOR(g_NUM_Bits - 1 DOWNTO 0);
  --   ADC_DATA_N : IN STD_LOGIC_VECTOR(g_NUM_Bits - 1 DOWNTO 0);

  --   Valid_in_P : IN STD_LOGIC;
  --   Valid_in_N : IN STD_LOGIC;
  --   DAC_CLK_P : IN STD_LOGIC;
  --   DAC_CLK_N : IN STD_LOGIC;
  --   DAC_DATA_P : OUT STD_LOGIC_VECTOR(g_NUM_Bits - 1 DOWNTO 0);
  --   DAC_DATA_N : OUT STD_LOGIC_VECTOR(g_NUM_Bits - 1 DOWNTO 0);
  --   DAC_VALID_OUT_P : OUT STD_LOGIC;
  --   DAC_VALID_OUT_N : OUT STD_LOGIC;
  --   RESET_P : IN STD_LOGIC;
  --   RESET_N : IN STD_LOGIC
  -- );
END ENTITY FIR_FILTER_TOP_TB;
ARCHITECTURE behave OF FIR_FILTER_TOP_TB IS
  COMPONENT FIR_FIFO1
    PORT (
      clk : IN STD_LOGIC;
      srst : IN STD_LOGIC;
      din : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
      wr_en : IN STD_LOGIC;
      rd_en : IN STD_LOGIC;
      dout : OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
      full : OUT STD_LOGIC;
      empty : OUT STD_LOGIC;
      data_count : OUT STD_LOGIC_VECTOR(ADC_FIFO_SIZE - 1 DOWNTO 0)
    );
  END COMPONENT;

  COMPONENT FIR_FILTER IS
    GENERIC (
      NUM_OF_TAPS : INTEGER := 4;
      C_COEFS_LENGTH : INTEGER := 16;
      C_MULT_LENGTH : INTEGER := 32;
      C_ADD_LENGTH : INTEGER := 33;
      C_DATA_IN_LENGTH : INTEGER := 16;
      C_DATA_OUT_LENGTH : INTEGER := 16
    );
    PORT (
      i_clk : IN STD_LOGIC;
      i_rstb : IN STD_LOGIC;
      -- coefficient
      i_coeff_0 : IN STD_LOGIC_VECTOR(C_COEFS_LENGTH - 1 DOWNTO 0);
      i_coeff_1 : IN STD_LOGIC_VECTOR(C_COEFS_LENGTH - 1 DOWNTO 0);
      i_coeff_2 : IN STD_LOGIC_VECTOR(C_COEFS_LENGTH - 1 DOWNTO 0);
      i_coeff_3 : IN STD_LOGIC_VECTOR(C_COEFS_LENGTH - 1 DOWNTO 0);
      -- data input
      i_data : IN STD_LOGIC_VECTOR(C_DATA_IN_LENGTH - 1 DOWNTO 0);
      -- filtered data 
      o_data : OUT STD_LOGIC_VECTOR(C_DATA_OUT_LENGTH - 1 DOWNTO 0));
  END COMPONENT;
  COMPONENT IBUFGDS
    GENERIC (
      CAPACITANCE : STRING := "DONT_CARE";
      DIFF_TERM : BOOLEAN := FALSE;
      IBUF_DELAY_VALUE : STRING := "0";
      IBUF_LOW_PWR : BOOLEAN := TRUE;
      IOSTANDARD : STRING := "DEFAULT");

    PORT (
      O : OUT STD_LOGIC;
      I : IN STD_LOGIC;
      IB : IN STD_LOGIC
    );
  END COMPONENT;
  SIGNAL fir_data_in : STD_LOGIC_VECTOR(c_NUM_BITS - 1 DOWNTO 0);
  SIGNAL DAC_DATA_IN : STD_LOGIC_VECTOR(c_NUM_BITS - 1 DOWNTO 0);

  SIGNAL w_LFSR_Done : STD_LOGIC;
  SIGNAL i_Enable : STD_LOGIC;

  -- seed related
  SIGNAL i_Seed_DV : STD_LOGIC;
  SIGNAL i_Seed_Data : STD_LOGIC_VECTOR(c_NUM_BITS - 1 DOWNTO 0);
  SIGNAL seed_counter : STD_LOGIC_VECTOR(c_SEED_COUNTER_BITS - 1 DOWNTO 0) := (OTHERS => '0');

  --reset 
  SIGNAL RST_N : STD_LOGIC := '0';
  SIGNAL reset_counter : STD_LOGIC_VECTOR(11 DOWNTO 0) := (OTHERS => '0');
  SIGNAL d_valid_counter : STD_LOGIC_VECTOR(IN_STREAM_DIVIDER DOWNTO 0) := (OTHERS => '1');
  SIGNAL d_valid_counter_en : STD_LOGIC;

  SIGNAL d_read_counter : STD_LOGIC_VECTOR(1 DOWNTO 0) := (OTHERS => '1');
  SIGNAL d_read_counter_en : STD_LOGIC;
  SIGNAL d_wr_counter, d_rd_counter : STD_LOGIC_VECTOR(1 DOWNTO 0) := (OTHERS => '1');
  SIGNAL d_wr_counter_en, d_rd_counter_en : STD_LOGIC;

  -- clk
  SIGNAL FPGA_CLK : STD_LOGIC;
  SIGNAL ADC_CLK : STD_LOGIC;
  SIGNAL DAC_CLK : STD_LOGIC;

  SIGNAL stop_reset_timer : STD_LOGIC;

  SIGNAL INT_FPGA_CLK_P : STD_LOGIC := '0';
  SIGNAL INT_FPGA_CLK_N : STD_LOGIC := '0';
  SIGNAL INT_ADC_CLK_P : STD_LOGIC := '0';
  SIGNAL INT_ADC_CLK_N : STD_LOGIC := '0';
  SIGNAL INT_DAC_CLK_P : STD_LOGIC := '0';
  SIGNAL INT_DAC_CLK_N : STD_LOGIC := '0';
  SIGNAL MULT : MULT_TYPE;
  SIGNAL ADD : ADD_TYPE;

  SIGNAL fifo_data_valid : STD_LOGIC;

  SIGNAL Valid_in, Valid_toggle : STD_LOGIC;
  SIGNAL Valid_in_cnt : STD_LOGIC_VECTOR(3 DOWNTO 0);
  SIGNAL Valid_toggle_cnt : STD_LOGIC_VECTOR(7 DOWNTO 0);

  SIGNAL s_adc_data_Valid : STD_LOGIC_VECTOR(c_NUM_BITS - 1 DOWNTO 0);
  -- fir fifo 

  SIGNAL adc_fifo_din : FIR_FILTER_DATA_TYPE;
  SIGNAL adc_fifo_wr_en : FIR_FILTER_LOGIC_TYPE;
  SIGNAL adc_fifo_rd_en : FIR_FILTER_LOGIC_TYPE;
  SIGNAL adc_fifo_dout : FIR_FILTER_DATA_TYPE;
  SIGNAL adc_fifo_rst : FIR_FILTER_LOGIC_TYPE;
  SIGNAL adc_fifo_empty, adc_fifo_empty_Q : FIR_FILTER_LOGIC_TYPE;
  SIGNAL adc_fifo_data_count : ADC_FIFO_DATA_CNT_TYPE;

  -- register to store input adc stream 
  SIGNAL d_trig_strb_Q : STD_LOGIC;

  SIGNAL d_strb_1Q, d_strb_2Q, d_strb_3Q, d_strb_4Q,
  d_strb_5Q, d_strb_6Q, d_strb_7Q, d_strb_8Q : FIR_FILTER_LOGIC_TYPE;
  SIGNAL d_1Q, d_2Q, d_3Q, d_4Q,
  d_5Q, d_6Q, d_7Q, d_8Q : FIR_FILTER_DATA_TYPE;

  -- FILTER IN & OUT
  SIGNAL FIR_FILTER_IN : FIR_FILTER_DATA_TYPE;
  SIGNAL FIR_FILTER_OUT : FIR_FILTER_DATA_TYPE;

  -- multipurpose shift register to handle clock crossing
  SIGNAL s_fir_data_in, s_fir_data_out : STD_LOGIC_VECTOR(IN_STREAM_DIVIDER - 1 DOWNTO 0);
BEGIN
  i_Seed_Data <= x"DEAD";

  -- G_DIFF_OBUF : FOR I IN 0 TO 15 GENERATE
  --   DIFF_OBUF : OBUFDS PORT MAP(
  --     I => DAC_DATA_IN(I),
  --     O => DAC_DATA_P(I),
  --     OB => DAC_DATA_N(I)
  --   );
  -- END GENERATE G_DIFF_OBUF;

  -- G_SNGL_IBUG : FOR I IN 0 TO 15 GENERATE
  --   SNGL_IBUF : IBUFGDS PORT MAP(
  --     O => fir_data_in(I),
  --     I => ADC_DATA_P(I),
  --     IB => ADC_DATA_N(I)
  --   );
  -- END GENERATE G_SNGL_IBUG;

  -- dac_valid_ibuf : OBUFDS PORT MAP(
  --   I => DAC_VALID_OUT,
  --   O => DAC_VALID_OUT_P,
  --   OB => DAC_VALID_OUT_N
  -- );

  -- RST_ibuf : IBUFGDS
  -- GENERIC MAP(
  --   DIFF_TERM => FALSE,
  --   IBUF_LOW_PWR => FALSE)

  -- PORT MAP(
  --   O => RST,
  --   I => RESET_P,
  --   IB => RESET_N
  -- );
  -- RST_N <= RST;
  -- adc_valid_ibuf : IBUFGDS
  -- GENERIC MAP(
  --   DIFF_TERM => FALSE,
  --   IBUF_LOW_PWR => FALSE)

  -- PORT MAP(
  --   O => Valid_in,
  --   I => Valid_in_P,
  --   IB => Valid_in_N
  -- );
  -- GENERATE SINGLE ENDED ADC CLK FROM DIFFERENTIAL INPUT

  adc_ibuf : IBUFGDS
  GENERIC MAP(
    DIFF_TERM => FALSE,
    IBUF_LOW_PWR => FALSE)
  PORT MAP(
    O => adc_clk,
    I => INT_ADC_CLK_P,
    IB => INT_ADC_CLK_N
  );

  -- GENERATE SINGLE ENDED dac CLK FROM DIFFERENTIAL INPUT
  dac_clk_ibuf : IBUFGDS
  GENERIC MAP(
    DIFF_TERM => FALSE,
    IBUF_LOW_PWR => FALSE)
  PORT MAP(
    O => DAC_CLK,
    I => INT_DAC_CLK_P,
    IB => INT_DAC_CLK_N
  );

  -- GENERATE SINGLE ENDED fpga CLK FROM DIFFERENTIAL INPUT
  fpga_clk_ibuf : IBUFGDS
  GENERIC MAP(
    DIFF_TERM => FALSE,
    IBUF_LOW_PWR => FALSE)
  PORT MAP(
    O => FPGA_CLK,
    I => INT_FPGA_CLK_P,
    IB => INT_FPGA_CLK_N
  );
  INT_FPGA_CLK_P <= NOT INT_FPGA_CLK_P AFTER (adc_CLK_PERIOD * IN_STREAM_DIVIDER)/2;
  INT_FPGA_CLK_N <= NOT INT_FPGA_CLK_P;
  INT_ADC_CLK_P <= NOT INT_ADC_CLK_P AFTER adc_CLK_PERIOD/2;
  INT_ADC_CLK_N <= NOT INT_ADC_CLK_P;
  INT_DAC_CLK_P <= NOT INT_DAC_CLK_P AFTER adc_CLK_PERIOD/2;
  INT_DAC_CLK_N <= NOT INT_DAC_CLK_P;

  G_ADC_FIFO : FOR I IN 0 TO IN_STREAM_DIVIDER - 1 GENERATE
    U_FIR_FIFO1 : FIR_FIFO1
    PORT MAP(
      clk => FPGA_CLK,
      srst => adc_fifo_rst(I),
      din => adc_fifo_din(I),
      wr_en => adc_fifo_wr_en(I),
      rd_en => adc_fifo_rd_en(I),
      dout => adc_fifo_dout(I),
      full => OPEN,
      empty => adc_fifo_empty(I),
      data_count => adc_fifo_data_count(I)
    );
  END GENERATE G_ADC_FIFO;

  -- Generate Fake Valid strb every 16th sample
  p_valid : PROCESS (adc_clk, RST_N)
  BEGIN
    IF (RST_N = '0') THEN
      Valid_in <= '0';
      Valid_toggle <= '0';
      Valid_in_cnt <= (OTHERS => '0');
      Valid_toggle_cnt <= (OTHERS => '1');
    ELSIF rising_edge(adc_clk) THEN

      Valid_in <= '0';
      IF (Valid_in_cnt = 0 AND Valid_toggle = '1') THEN
        Valid_in <= '1';
        Valid_in_cnt <= (OTHERS => '1');
      ELSE
        Valid_in_cnt <= Valid_in_cnt - b"1";
      END IF;

      IF (Valid_toggle_cnt = 0) THEN
        Valid_toggle <= NOT Valid_toggle;
        Valid_toggle_cnt <= (OTHERS => '1');
      ELSE
        Valid_toggle_cnt <= Valid_toggle_cnt - b"1";
      END IF;
    END IF;
  END PROCESS p_valid;

  p_reset : PROCESS (adc_clk, stop_reset_timer)
  BEGIN
    IF rising_edge(adc_clk) THEN
      RST_N <= reset_counter(11);
      IF (stop_reset_timer = '0') THEN
        reset_counter <= reset_counter + b"1";
      END IF;
    END IF;
  END PROCESS p_reset;

  stop_reset_timer <= reset_counter(11);

  p_Seed : PROCESS (adc_clk, RST_N)
  BEGIN
    IF (RST_N = '0') THEN
      i_Seed_DV <= '1';
      i_Enable <= '0';
    ELSIF rising_edge(adc_clk) THEN
      --default
      i_Seed_DV <= '0';
      i_Enable <= '1';
      -- seed counter
      IF (seed_counter = 0) THEN
        i_Seed_DV <= '1';
        seed_counter <= (OTHERS => '1');
      ELSE
        seed_counter <= seed_counter - b"1";
      END IF;
    END IF;
  END PROCESS p_Seed;

  p_store_adc_data : PROCESS (adc_clk, RST_N)
  BEGIN
    IF (RST_N = '0') THEN
      d_valid_counter_en <= '0';
      d_valid_counter <= x"00" & b"1";
      s_adc_data_Valid <= (OTHERS => '0');
    ELSIF rising_edge(adc_clk) THEN

      adc_fifo_rst(0) <= NOT RST_N;
      adc_fifo_rst(1) <= NOT RST_N;
      adc_fifo_rst(2) <= NOT RST_N;
      adc_fifo_rst(3) <= NOT RST_N;
      adc_fifo_rst(4) <= NOT RST_N;
      adc_fifo_rst(5) <= NOT RST_N;
      adc_fifo_rst(6) <= NOT RST_N;
      adc_fifo_rst(7) <= NOT RST_N;

      -- adc data acquisation into fir fifo cntrl
      IF (Valid_in = '1') THEN
        s_adc_data_Valid <= x"0001";
        d_trig_strb_Q <= '0';
      ELSE
        s_adc_data_Valid <= s_adc_data_Valid(c_NUM_BITS - 2 DOWNTO 0) & b"0";
      END IF;
      -- determine where to load incoming adc data 
      d_strb_1Q(0) <= Valid_in OR s_adc_data_Valid(7);
      d_strb_1Q(1) <= s_adc_data_Valid(0) OR s_adc_data_Valid(8);
      d_strb_1Q(2) <= s_adc_data_Valid(1) OR s_adc_data_Valid(9);
      d_strb_1Q(3) <= s_adc_data_Valid(2) OR s_adc_data_Valid(10);
      d_strb_1Q(4) <= s_adc_data_Valid(3) OR s_adc_data_Valid(11);
      d_strb_1Q(5) <= s_adc_data_Valid(4) OR s_adc_data_Valid(12);
      d_strb_1Q(6) <= s_adc_data_Valid(5) OR s_adc_data_Valid(13);
      d_strb_1Q(7) <= s_adc_data_Valid(6) OR s_adc_data_Valid(14);

      -- TRIGGER FIFO ENABLE LOGIC AFTER LAST VALID REGISTER WR AND HOLD IT HIGH FOR VALID DATA PERIOD
      IF (d_strb_1Q(7) = '1') THEN
        d_trig_strb_Q <= '1';
        d_valid_counter_en <= '1';
      ELSIF (d_valid_counter(IN_STREAM_DIVIDER) = '1') THEN
        d_trig_strb_Q <= '0';
        d_valid_counter_en <= '0';
      END IF;

      IF (d_valid_counter_en = '0') THEN
        d_valid_counter <= x"00" & b"1";
      ELSE
        d_valid_counter <= d_valid_counter + b"1";
      END IF;

      -- direct incoming adc data into four different register for parallelism to save and process it at slower clock rate
      IF (d_strb_1Q(0) = '1') THEN
        d_1Q(0) <= fir_data_in;
      END IF;

      IF (d_strb_1Q(1) = '1') THEN
        d_1Q(1) <= fir_data_in;
      END IF;

      IF (d_strb_1Q(2) = '1') THEN
        d_1Q(2) <= fir_data_in;
      END IF;

      IF (d_strb_1Q(3) = '1') THEN
        d_1Q(3) <= fir_data_in;
      END IF;

      IF (d_strb_1Q(4) = '1') THEN
        d_1Q(4) <= fir_data_in;
      END IF;

      IF (d_strb_1Q(5) = '1') THEN
        d_1Q(5) <= fir_data_in;
      END IF;

      IF (d_strb_1Q(6) = '1') THEN
        d_1Q(6) <= fir_data_in;
      END IF;

      IF (d_strb_1Q(7) = '1') THEN
        d_1Q(7) <= fir_data_in;
      END IF;

      -- 8 times buffer first register 
      d_2Q(0) <= d_1Q(0);
      d_3Q(0) <= d_2Q(0);
      d_4Q(0) <= d_3Q(0);
      d_5Q(0) <= d_4Q(0);
      d_6Q(0) <= d_5Q(0);
      d_7Q(0) <= d_6Q(0);
      d_8Q(0) <= d_7Q(0);
      -- 7 times buffer SECOND register 
      d_2Q(1) <= d_1Q(1);
      d_3Q(1) <= d_2Q(1);
      d_4Q(1) <= d_3Q(1);
      d_5Q(1) <= d_4Q(1);
      d_6Q(1) <= d_5Q(1);
      d_7Q(1) <= d_6Q(1);
      -- 6 times buffer THIRD register 
      d_2Q(2) <= d_1Q(2);
      d_3Q(2) <= d_2Q(2);
      d_4Q(2) <= d_3Q(2);
      d_5Q(2) <= d_4Q(2);
      d_6Q(2) <= d_5Q(2);
      -- 5 times buffer FOURTH register 
      d_2Q(3) <= d_1Q(3);
      d_3Q(3) <= d_2Q(3);
      d_4Q(3) <= d_3Q(3);
      d_5Q(3) <= d_4Q(3);
      d_6Q(3) <= d_5Q(3);
      -- 4 times buffer FIFTH register 
      d_2Q(4) <= d_1Q(4);
      d_3Q(4) <= d_2Q(4);
      d_4Q(4) <= d_3Q(4);
      d_5Q(4) <= d_4Q(4);
      -- 3 times buffer SIXTH register 
      d_2Q(5) <= d_1Q(5);
      d_3Q(5) <= d_2Q(5);
      d_4Q(5) <= d_3Q(5);
      -- 2 times buffer SIXTH register 
      d_2Q(6) <= d_1Q(6);
      d_3Q(6) <= d_2Q(6);
      -- 1 times buffer SIXTH register 
      d_2Q(7) <= d_1Q(7);
    END IF;
  END PROCESS p_store_adc_data;

  p_load_adc_fifo : PROCESS (FPGA_CLK, RST_N)
  BEGIN
    IF (RST_N = '0') THEN
      adc_fifo_din <= (OTHERS => x"DEAD");
      adc_fifo_wr_en <= (OTHERS => '0');
    ELSIF rising_edge(FPGA_CLK) THEN
      --default values 
      adc_fifo_wr_en <= (OTHERS => '0');

      -- GENERATE WR STRB FOR FIR FIFO
      IF (d_trig_strb_Q = '1') THEN
        adc_fifo_din(0) <= d_8Q(0);
        adc_fifo_wr_en(0) <= '1';

        adc_fifo_din(1) <= d_7Q(1);
        adc_fifo_wr_en(1) <= '1';

        adc_fifo_din(2) <= d_6Q(2);
        adc_fifo_wr_en(2) <= '1';

        adc_fifo_din(3) <= d_5Q(3);
        adc_fifo_wr_en(3) <= '1';

        adc_fifo_din(4) <= d_4Q(4);
        adc_fifo_wr_en(4) <= '1';

        adc_fifo_din(5) <= d_3Q(5);
        adc_fifo_wr_en(5) <= '1';

        adc_fifo_din(6) <= d_2Q(6);
        adc_fifo_wr_en(6) <= '1';

        adc_fifo_din(7) <= d_1Q(7);
        adc_fifo_wr_en(7) <= '1';
      END IF;
    END IF;
  END PROCESS p_load_adc_fifo;

  p_fetch_fifo : PROCESS (FPGA_CLK, RST_N)
  BEGIN
    IF (RST_N = '0') THEN
      adc_fifo_rd_en <= (OTHERS => '0');
      d_read_counter <= (OTHERS => '1');

      FIR_FILTER_IN <= (OTHERS => (OTHERS => '0'));
    ELSIF rising_edge(FPGA_CLK) THEN
      --default values 
      adc_fifo_rd_en <= (OTHERS => '0');

      FIR_FILTER_IN(0) <= adc_fifo_dout(0);
      FIR_FILTER_IN(1) <= adc_fifo_dout(1);
      FIR_FILTER_IN(2) <= adc_fifo_dout(2);
      FIR_FILTER_IN(3) <= adc_fifo_dout(3);
      FIR_FILTER_IN(4) <= adc_fifo_dout(4);
      FIR_FILTER_IN(5) <= adc_fifo_dout(5);
      FIR_FILTER_IN(6) <= adc_fifo_dout(6);
      FIR_FILTER_IN(7) <= adc_fifo_dout(7);

      fifo_data_valid <= NOT (adc_fifo_empty(0) OR adc_fifo_empty(1) OR adc_fifo_empty(2) OR adc_fifo_empty(3));
      adc_fifo_empty_Q <= adc_fifo_empty;

      IF (fifo_data_valid = '1') THEN
        adc_fifo_rd_en <= (OTHERS => '1');
      END IF;
    END IF;
  END PROCESS p_fetch_fifo;

  p_pipeline_dac_data : PROCESS (DAC_CLK, RST_N)
  BEGIN
    IF (RST_N = '0') THEN
      s_fir_data_out <= x"01";
    ELSIF rising_edge(DAC_CLK) THEN

      -- synchronize FPGA clock with DAC clk for shift register operation
      IF (fifo_data_valid = '1') THEN
        s_fir_data_out <= s_fir_data_out(IN_STREAM_DIVIDER - 2 DOWNTO 0) & b"0";
      END IF;

      IF (adc_fifo_empty_Q(0) = '0') THEN     
        IF (s_fir_data_out(0) = '1') THEN
          DAC_DATA_IN <= FIR_FILTER_OUT(0);
        END IF;

        IF (s_fir_data_out(1) = '1') THEN
          DAC_DATA_IN <= FIR_FILTER_OUT(1);
        END IF;

        IF (s_fir_data_out(2) = '1') THEN
          DAC_DATA_IN <= FIR_FILTER_OUT(2);
        END IF;

        IF (s_fir_data_out(3) = '1') THEN
          DAC_DATA_IN <= FIR_FILTER_OUT(3);
        END IF;

        IF (s_fir_data_out(4) = '1') THEN
          DAC_DATA_IN <= FIR_FILTER_OUT(4);
        END IF;

        IF (s_fir_data_out(5) = '1') THEN
          DAC_DATA_IN <= FIR_FILTER_OUT(5);
        END IF;

        IF (s_fir_data_out(6) = '1') THEN
          DAC_DATA_IN <= FIR_FILTER_OUT(6);
        END IF;

        IF (s_fir_data_out(7) = '1') THEN
          DAC_DATA_IN <= FIR_FILTER_OUT(7);
          s_fir_data_out <= x"01";
        END IF;
      END IF;
    END IF;
  END PROCESS p_pipeline_dac_data;

  LFSR_1 : ENTITY work.LFSR
    GENERIC MAP(
      g_Num_Bits => c_NUM_BITS)
    PORT MAP(
      i_Clk => adc_clk,
      i_Enable => i_Enable,
      i_Seed_DV => i_Seed_DV,
      i_Seed_Data => i_Seed_Data,
      o_LFSR_Data => fir_data_in,
      o_LFSR_Done => w_LFSR_Done
    );

  G_FIR_FILTER : FOR I IN 0 TO IN_STREAM_DIVIDER - 1 GENERATE
    U_FIR_FILTER : FIR_FILTER
    GENERIC MAP(
      NUM_OF_TAPS => NUM_OF_TAPS,
      C_COEFS_LENGTH => C_COEFS_LENGTH,
      C_MULT_LENGTH => C_MULT_LENGTH,
      C_ADD_LENGTH => C_ADD_LENGTH,
      C_DATA_IN_LENGTH => C_DATA_IN_LENGTH,
      C_DATA_OUT_LENGTH => C_DATA_OUT_LENGTH)
    PORT MAP(
      i_clk => FPGA_CLK,
      i_rstb => RST_N,
      -- coefficient
      i_coeff_0 => C_FIR_COEFS(0),
      i_coeff_1 => C_FIR_COEFS(1),
      i_coeff_2 => C_FIR_COEFS(2),
      i_coeff_3 => C_FIR_COEFS(3),
      -- data input
      i_data => FIR_FILTER_IN(I),
      -- filtered data 
      o_data => FIR_FILTER_OUT(I)
    );
  END GENERATE G_FIR_FILTER;

END ARCHITECTURE behave;