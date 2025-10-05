-- Copyright (C) 2020  Intel Corporation. All rights reserved.
-- Your use of Intel Corporation's design tools, logic functions 
-- and other software and tools, and any partner logic 
-- functions, and any output files from any of the foregoing 
-- (including device programming or simulation files), and any 
-- associated documentation or information are expressly subject 
-- to the terms and conditions of the Intel Program License 
-- Subscription Agreement, the Intel Quartus Prime License Agreement,
-- the Intel FPGA IP License Agreement, or other applicable license
-- agreement, including, without limitation, that your use is for
-- the sole purpose of programming logic devices manufactured by
-- Intel and sold by Intel or its authorized distributors.  Please
-- refer to the applicable agreement for further details, at
-- https://fpgasoftware.intel.com/eula.

-- VENDOR "Altera"
-- PROGRAM "Quartus Prime"
-- VERSION "Version 20.1.1 Build 720 11/11/2020 SJ Lite Edition"

-- DATE "11/12/2024 12:20:36"

-- 
-- Device: Altera 5CSXFC6D6F31C6 Package FBGA896
-- 

-- 
-- This VHDL file should be used for ModelSim-Altera (VHDL) only
-- 

LIBRARY ALTERA;
LIBRARY ALTERA_LNSIM;
LIBRARY CYCLONEV;
LIBRARY IEEE;
USE ALTERA.ALTERA_PRIMITIVES_COMPONENTS.ALL;
USE ALTERA_LNSIM.ALTERA_LNSIM_COMPONENTS.ALL;
USE CYCLONEV.CYCLONEV_COMPONENTS.ALL;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY 	blink IS
    PORT (
	clk_i : IN std_logic;
	rst_i : IN std_logic;
	start_button_i : IN std_logic;
	led_o : BUFFER std_logic
	);
END blink;

-- Design Ports Information
-- led_o	=>  Location: PIN_AA15,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- clk_i	=>  Location: PIN_Y27,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- rst_i	=>  Location: PIN_AA14,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- start_button_i	=>  Location: PIN_AK12,	 I/O Standard: 2.5 V,	 Current Strength: Default


ARCHITECTURE structure OF blink IS
SIGNAL gnd : std_logic := '0';
SIGNAL vcc : std_logic := '1';
SIGNAL unknown : std_logic := 'X';
SIGNAL devoe : std_logic := '1';
SIGNAL devclrn : std_logic := '1';
SIGNAL devpor : std_logic := '1';
SIGNAL ww_devoe : std_logic;
SIGNAL ww_devclrn : std_logic;
SIGNAL ww_devpor : std_logic;
SIGNAL ww_clk_i : std_logic;
SIGNAL ww_rst_i : std_logic;
SIGNAL ww_start_button_i : std_logic;
SIGNAL ww_led_o : std_logic;
SIGNAL \~QUARTUS_CREATED_GND~I_combout\ : std_logic;
SIGNAL \clk_i~input_o\ : std_logic;
SIGNAL \clk_i~inputCLKENA0_outclk\ : std_logic;
SIGNAL \rst_i~input_o\ : std_logic;
SIGNAL \start_button_i~input_o\ : std_logic;
SIGNAL \sync_ent|sync_chain[3]~DUPLICATE_q\ : std_logic;
SIGNAL \counter_ent|next_cnt[0]~5_combout\ : std_logic;
SIGNAL \counter_ent|curr_cnt[0]~DUPLICATE_q\ : std_logic;
SIGNAL \counter_ent|next_cnt[1]~4_combout\ : std_logic;
SIGNAL \counter_ent|curr_cnt[1]~DUPLICATE_q\ : std_logic;
SIGNAL \counter_ent|next_cnt[2]~3_combout\ : std_logic;
SIGNAL \counter_ent|curr_cnt[2]~DUPLICATE_q\ : std_logic;
SIGNAL \counter_ent|Add0~1_combout\ : std_logic;
SIGNAL \counter_ent|next_cnt[3]~2_combout\ : std_logic;
SIGNAL \counter_ent|curr_cnt[3]~DUPLICATE_q\ : std_logic;
SIGNAL \counter_ent|Add0~0_combout\ : std_logic;
SIGNAL \counter_ent|next_cnt[4]~1_combout\ : std_logic;
SIGNAL \counter_ent|curr_cnt[4]~DUPLICATE_q\ : std_logic;
SIGNAL \counter_ent|next_cnt[5]~0_combout\ : std_logic;
SIGNAL \fsm_ent|Equal0~0_combout\ : std_logic;
SIGNAL \fsm_ent|Selector1~1_combout\ : std_logic;
SIGNAL \fsm_ent|curr_state.LED_ON~q\ : std_logic;
SIGNAL \fsm_ent|Selector1~2_combout\ : std_logic;
SIGNAL \fsm_ent|curr_state.START~q\ : std_logic;
SIGNAL \fsm_ent|Selector2~0_combout\ : std_logic;
SIGNAL \fsm_ent|curr_state.WAIT_ON_CNT~q\ : std_logic;
SIGNAL \fsm_ent|Selector1~0_combout\ : std_logic;
SIGNAL \fsm_ent|curr_state.LED_ON~DUPLICATE_q\ : std_logic;
SIGNAL \counter_ent|curr_cnt\ : std_logic_vector(5 DOWNTO 0);
SIGNAL \sync_ent|sync_chain\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \sync_ent|ALT_INV_sync_chain[3]~DUPLICATE_q\ : std_logic;
SIGNAL \counter_ent|ALT_INV_curr_cnt[0]~DUPLICATE_q\ : std_logic;
SIGNAL \counter_ent|ALT_INV_curr_cnt[1]~DUPLICATE_q\ : std_logic;
SIGNAL \counter_ent|ALT_INV_curr_cnt[2]~DUPLICATE_q\ : std_logic;
SIGNAL \counter_ent|ALT_INV_curr_cnt[3]~DUPLICATE_q\ : std_logic;
SIGNAL \counter_ent|ALT_INV_curr_cnt[4]~DUPLICATE_q\ : std_logic;
SIGNAL \fsm_ent|ALT_INV_curr_state.LED_ON~DUPLICATE_q\ : std_logic;
SIGNAL \ALT_INV_rst_i~input_o\ : std_logic;
SIGNAL \counter_ent|ALT_INV_Add0~1_combout\ : std_logic;
SIGNAL \counter_ent|ALT_INV_Add0~0_combout\ : std_logic;
SIGNAL \fsm_ent|ALT_INV_curr_state.START~q\ : std_logic;
SIGNAL \sync_ent|ALT_INV_sync_chain\ : std_logic_vector(3 DOWNTO 3);
SIGNAL \fsm_ent|ALT_INV_Equal0~0_combout\ : std_logic;
SIGNAL \counter_ent|ALT_INV_curr_cnt\ : std_logic_vector(5 DOWNTO 0);
SIGNAL \fsm_ent|ALT_INV_curr_state.WAIT_ON_CNT~q\ : std_logic;
SIGNAL \fsm_ent|ALT_INV_curr_state.LED_ON~q\ : std_logic;

BEGIN

ww_clk_i <= clk_i;
ww_rst_i <= rst_i;
ww_start_button_i <= start_button_i;
led_o <= ww_led_o;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;
\sync_ent|ALT_INV_sync_chain[3]~DUPLICATE_q\ <= NOT \sync_ent|sync_chain[3]~DUPLICATE_q\;
\counter_ent|ALT_INV_curr_cnt[0]~DUPLICATE_q\ <= NOT \counter_ent|curr_cnt[0]~DUPLICATE_q\;
\counter_ent|ALT_INV_curr_cnt[1]~DUPLICATE_q\ <= NOT \counter_ent|curr_cnt[1]~DUPLICATE_q\;
\counter_ent|ALT_INV_curr_cnt[2]~DUPLICATE_q\ <= NOT \counter_ent|curr_cnt[2]~DUPLICATE_q\;
\counter_ent|ALT_INV_curr_cnt[3]~DUPLICATE_q\ <= NOT \counter_ent|curr_cnt[3]~DUPLICATE_q\;
\counter_ent|ALT_INV_curr_cnt[4]~DUPLICATE_q\ <= NOT \counter_ent|curr_cnt[4]~DUPLICATE_q\;
\fsm_ent|ALT_INV_curr_state.LED_ON~DUPLICATE_q\ <= NOT \fsm_ent|curr_state.LED_ON~DUPLICATE_q\;
\ALT_INV_rst_i~input_o\ <= NOT \rst_i~input_o\;
\counter_ent|ALT_INV_Add0~1_combout\ <= NOT \counter_ent|Add0~1_combout\;
\counter_ent|ALT_INV_Add0~0_combout\ <= NOT \counter_ent|Add0~0_combout\;
\fsm_ent|ALT_INV_curr_state.START~q\ <= NOT \fsm_ent|curr_state.START~q\;
\sync_ent|ALT_INV_sync_chain\(3) <= NOT \sync_ent|sync_chain\(3);
\fsm_ent|ALT_INV_Equal0~0_combout\ <= NOT \fsm_ent|Equal0~0_combout\;
\counter_ent|ALT_INV_curr_cnt\(0) <= NOT \counter_ent|curr_cnt\(0);
\counter_ent|ALT_INV_curr_cnt\(1) <= NOT \counter_ent|curr_cnt\(1);
\counter_ent|ALT_INV_curr_cnt\(2) <= NOT \counter_ent|curr_cnt\(2);
\counter_ent|ALT_INV_curr_cnt\(3) <= NOT \counter_ent|curr_cnt\(3);
\counter_ent|ALT_INV_curr_cnt\(4) <= NOT \counter_ent|curr_cnt\(4);
\counter_ent|ALT_INV_curr_cnt\(5) <= NOT \counter_ent|curr_cnt\(5);
\fsm_ent|ALT_INV_curr_state.WAIT_ON_CNT~q\ <= NOT \fsm_ent|curr_state.WAIT_ON_CNT~q\;
\fsm_ent|ALT_INV_curr_state.LED_ON~q\ <= NOT \fsm_ent|curr_state.LED_ON~q\;

-- Location: IOOBUF_X36_Y0_N19
\led_o~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \fsm_ent|curr_state.LED_ON~DUPLICATE_q\,
	devoe => ww_devoe,
	o => ww_led_o);

-- Location: IOIBUF_X89_Y25_N21
\clk_i~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_clk_i,
	o => \clk_i~input_o\);

-- Location: CLKCTRL_G10
\clk_i~inputCLKENA0\ : cyclonev_clkena
-- pragma translate_off
GENERIC MAP (
	clock_type => "global clock",
	disable_mode => "low",
	ena_register_mode => "always enabled",
	ena_register_power_up => "high",
	test_syn => "high")
-- pragma translate_on
PORT MAP (
	inclk => \clk_i~input_o\,
	outclk => \clk_i~inputCLKENA0_outclk\);

-- Location: IOIBUF_X36_Y0_N1
\rst_i~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_rst_i,
	o => \rst_i~input_o\);

-- Location: IOIBUF_X36_Y0_N35
\start_button_i~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_start_button_i,
	o => \start_button_i~input_o\);

-- Location: FF_X36_Y1_N5
\sync_ent|sync_chain[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_i~inputCLKENA0_outclk\,
	asdata => \start_button_i~input_o\,
	clrn => \ALT_INV_rst_i~input_o\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \sync_ent|sync_chain\(0));

-- Location: FF_X36_Y1_N10
\sync_ent|sync_chain[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_i~inputCLKENA0_outclk\,
	asdata => \sync_ent|sync_chain\(0),
	clrn => \ALT_INV_rst_i~input_o\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \sync_ent|sync_chain\(1));

-- Location: FF_X36_Y1_N16
\sync_ent|sync_chain[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_i~inputCLKENA0_outclk\,
	asdata => \sync_ent|sync_chain\(1),
	clrn => \ALT_INV_rst_i~input_o\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \sync_ent|sync_chain\(2));

-- Location: FF_X36_Y1_N49
\sync_ent|sync_chain[3]~DUPLICATE\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_i~inputCLKENA0_outclk\,
	asdata => \sync_ent|sync_chain\(2),
	clrn => \ALT_INV_rst_i~input_o\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \sync_ent|sync_chain[3]~DUPLICATE_q\);

-- Location: FF_X36_Y1_N46
\counter_ent|curr_cnt[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_i~inputCLKENA0_outclk\,
	d => \counter_ent|next_cnt[0]~5_combout\,
	clrn => \ALT_INV_rst_i~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \counter_ent|curr_cnt\(0));

-- Location: LABCELL_X36_Y1_N45
\counter_ent|next_cnt[0]~5\ : cyclonev_lcell_comb
-- Equation(s):
-- \counter_ent|next_cnt[0]~5_combout\ = ( \fsm_ent|Equal0~0_combout\ & ( (!\fsm_ent|curr_state.START~q\ & (!\sync_ent|sync_chain[3]~DUPLICATE_q\ & !\counter_ent|curr_cnt\(0))) ) ) # ( !\fsm_ent|Equal0~0_combout\ & ( (!\counter_ent|curr_cnt\(0) & 
-- ((!\sync_ent|sync_chain[3]~DUPLICATE_q\) # (\fsm_ent|curr_state.START~q\))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1111010100000000111101010000000010100000000000001010000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \fsm_ent|ALT_INV_curr_state.START~q\,
	datac => \sync_ent|ALT_INV_sync_chain[3]~DUPLICATE_q\,
	datad => \counter_ent|ALT_INV_curr_cnt\(0),
	dataf => \fsm_ent|ALT_INV_Equal0~0_combout\,
	combout => \counter_ent|next_cnt[0]~5_combout\);

-- Location: FF_X36_Y1_N47
\counter_ent|curr_cnt[0]~DUPLICATE\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_i~inputCLKENA0_outclk\,
	d => \counter_ent|next_cnt[0]~5_combout\,
	clrn => \ALT_INV_rst_i~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \counter_ent|curr_cnt[0]~DUPLICATE_q\);

-- Location: FF_X36_Y1_N50
\sync_ent|sync_chain[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_i~inputCLKENA0_outclk\,
	asdata => \sync_ent|sync_chain\(2),
	clrn => \ALT_INV_rst_i~input_o\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \sync_ent|sync_chain\(3));

-- Location: FF_X36_Y1_N40
\counter_ent|curr_cnt[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_i~inputCLKENA0_outclk\,
	d => \counter_ent|next_cnt[1]~4_combout\,
	clrn => \ALT_INV_rst_i~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \counter_ent|curr_cnt\(1));

-- Location: LABCELL_X36_Y1_N39
\counter_ent|next_cnt[1]~4\ : cyclonev_lcell_comb
-- Equation(s):
-- \counter_ent|next_cnt[1]~4_combout\ = ( \counter_ent|curr_cnt\(1) & ( \fsm_ent|Equal0~0_combout\ & ( (!\fsm_ent|curr_state.START~q\ & (!\counter_ent|curr_cnt[0]~DUPLICATE_q\ & !\sync_ent|sync_chain\(3))) ) ) ) # ( !\counter_ent|curr_cnt\(1) & ( 
-- \fsm_ent|Equal0~0_combout\ & ( (!\fsm_ent|curr_state.START~q\ & (\counter_ent|curr_cnt[0]~DUPLICATE_q\ & !\sync_ent|sync_chain\(3))) ) ) ) # ( \counter_ent|curr_cnt\(1) & ( !\fsm_ent|Equal0~0_combout\ & ( (!\counter_ent|curr_cnt[0]~DUPLICATE_q\ & 
-- ((!\sync_ent|sync_chain\(3)) # (\fsm_ent|curr_state.START~q\))) ) ) ) # ( !\counter_ent|curr_cnt\(1) & ( !\fsm_ent|Equal0~0_combout\ & ( (\counter_ent|curr_cnt[0]~DUPLICATE_q\ & ((!\sync_ent|sync_chain\(3)) # (\fsm_ent|curr_state.START~q\))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000111100000101111100000101000000001010000000001010000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \fsm_ent|ALT_INV_curr_state.START~q\,
	datac => \counter_ent|ALT_INV_curr_cnt[0]~DUPLICATE_q\,
	datad => \sync_ent|ALT_INV_sync_chain\(3),
	datae => \counter_ent|ALT_INV_curr_cnt\(1),
	dataf => \fsm_ent|ALT_INV_Equal0~0_combout\,
	combout => \counter_ent|next_cnt[1]~4_combout\);

-- Location: FF_X36_Y1_N41
\counter_ent|curr_cnt[1]~DUPLICATE\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_i~inputCLKENA0_outclk\,
	d => \counter_ent|next_cnt[1]~4_combout\,
	clrn => \ALT_INV_rst_i~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \counter_ent|curr_cnt[1]~DUPLICATE_q\);

-- Location: LABCELL_X36_Y1_N0
\counter_ent|next_cnt[2]~3\ : cyclonev_lcell_comb
-- Equation(s):
-- \counter_ent|next_cnt[2]~3_combout\ = ( \counter_ent|curr_cnt\(2) & ( \fsm_ent|Equal0~0_combout\ & ( (!\fsm_ent|curr_state.START~q\ & (!\sync_ent|sync_chain\(3) & ((!\counter_ent|curr_cnt[0]~DUPLICATE_q\) # (!\counter_ent|curr_cnt[1]~DUPLICATE_q\)))) ) ) 
-- ) # ( !\counter_ent|curr_cnt\(2) & ( \fsm_ent|Equal0~0_combout\ & ( (!\fsm_ent|curr_state.START~q\ & (\counter_ent|curr_cnt[0]~DUPLICATE_q\ & (!\sync_ent|sync_chain\(3) & \counter_ent|curr_cnt[1]~DUPLICATE_q\))) ) ) ) # ( \counter_ent|curr_cnt\(2) & ( 
-- !\fsm_ent|Equal0~0_combout\ & ( (!\fsm_ent|curr_state.START~q\ & (!\sync_ent|sync_chain\(3) & ((!\counter_ent|curr_cnt[0]~DUPLICATE_q\) # (!\counter_ent|curr_cnt[1]~DUPLICATE_q\)))) # (\fsm_ent|curr_state.START~q\ & 
-- ((!\counter_ent|curr_cnt[0]~DUPLICATE_q\) # ((!\counter_ent|curr_cnt[1]~DUPLICATE_q\)))) ) ) ) # ( !\counter_ent|curr_cnt\(2) & ( !\fsm_ent|Equal0~0_combout\ & ( (\counter_ent|curr_cnt[0]~DUPLICATE_q\ & (\counter_ent|curr_cnt[1]~DUPLICATE_q\ & 
-- ((!\sync_ent|sync_chain\(3)) # (\fsm_ent|curr_state.START~q\)))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000110001111101011100010000000000001000001010000010000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \fsm_ent|ALT_INV_curr_state.START~q\,
	datab => \counter_ent|ALT_INV_curr_cnt[0]~DUPLICATE_q\,
	datac => \sync_ent|ALT_INV_sync_chain\(3),
	datad => \counter_ent|ALT_INV_curr_cnt[1]~DUPLICATE_q\,
	datae => \counter_ent|ALT_INV_curr_cnt\(2),
	dataf => \fsm_ent|ALT_INV_Equal0~0_combout\,
	combout => \counter_ent|next_cnt[2]~3_combout\);

-- Location: FF_X36_Y1_N2
\counter_ent|curr_cnt[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_i~inputCLKENA0_outclk\,
	d => \counter_ent|next_cnt[2]~3_combout\,
	clrn => \ALT_INV_rst_i~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \counter_ent|curr_cnt\(2));

-- Location: FF_X36_Y1_N1
\counter_ent|curr_cnt[2]~DUPLICATE\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_i~inputCLKENA0_outclk\,
	d => \counter_ent|next_cnt[2]~3_combout\,
	clrn => \ALT_INV_rst_i~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \counter_ent|curr_cnt[2]~DUPLICATE_q\);

-- Location: LABCELL_X36_Y1_N42
\counter_ent|Add0~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \counter_ent|Add0~1_combout\ = ( \counter_ent|curr_cnt[3]~DUPLICATE_q\ & ( (!\counter_ent|curr_cnt[1]~DUPLICATE_q\) # ((!\counter_ent|curr_cnt\(0)) # (!\counter_ent|curr_cnt[2]~DUPLICATE_q\)) ) ) # ( !\counter_ent|curr_cnt[3]~DUPLICATE_q\ & ( 
-- (\counter_ent|curr_cnt[1]~DUPLICATE_q\ & (\counter_ent|curr_cnt\(0) & \counter_ent|curr_cnt[2]~DUPLICATE_q\)) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000011000000000000001111111111111111001111111111111100",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \counter_ent|ALT_INV_curr_cnt[1]~DUPLICATE_q\,
	datac => \counter_ent|ALT_INV_curr_cnt\(0),
	datad => \counter_ent|ALT_INV_curr_cnt[2]~DUPLICATE_q\,
	dataf => \counter_ent|ALT_INV_curr_cnt[3]~DUPLICATE_q\,
	combout => \counter_ent|Add0~1_combout\);

-- Location: LABCELL_X36_Y1_N57
\counter_ent|next_cnt[3]~2\ : cyclonev_lcell_comb
-- Equation(s):
-- \counter_ent|next_cnt[3]~2_combout\ = ( \fsm_ent|Equal0~0_combout\ & ( (!\fsm_ent|curr_state.START~q\ & (\counter_ent|Add0~1_combout\ & !\sync_ent|sync_chain[3]~DUPLICATE_q\)) ) ) # ( !\fsm_ent|Equal0~0_combout\ & ( (\counter_ent|Add0~1_combout\ & 
-- ((!\sync_ent|sync_chain[3]~DUPLICATE_q\) # (\fsm_ent|curr_state.START~q\))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000111100000101000011110000010100001010000000000000101000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \fsm_ent|ALT_INV_curr_state.START~q\,
	datac => \counter_ent|ALT_INV_Add0~1_combout\,
	datad => \sync_ent|ALT_INV_sync_chain[3]~DUPLICATE_q\,
	dataf => \fsm_ent|ALT_INV_Equal0~0_combout\,
	combout => \counter_ent|next_cnt[3]~2_combout\);

-- Location: FF_X36_Y1_N58
\counter_ent|curr_cnt[3]~DUPLICATE\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_i~inputCLKENA0_outclk\,
	d => \counter_ent|next_cnt[3]~2_combout\,
	clrn => \ALT_INV_rst_i~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \counter_ent|curr_cnt[3]~DUPLICATE_q\);

-- Location: LABCELL_X36_Y1_N27
\counter_ent|Add0~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \counter_ent|Add0~0_combout\ = ( \counter_ent|curr_cnt[3]~DUPLICATE_q\ & ( (\counter_ent|curr_cnt[0]~DUPLICATE_q\ & (\counter_ent|curr_cnt\(1) & \counter_ent|curr_cnt\(2))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000000110000000000000011",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \counter_ent|ALT_INV_curr_cnt[0]~DUPLICATE_q\,
	datac => \counter_ent|ALT_INV_curr_cnt\(1),
	datad => \counter_ent|ALT_INV_curr_cnt\(2),
	dataf => \counter_ent|ALT_INV_curr_cnt[3]~DUPLICATE_q\,
	combout => \counter_ent|Add0~0_combout\);

-- Location: LABCELL_X36_Y1_N21
\counter_ent|next_cnt[4]~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \counter_ent|next_cnt[4]~1_combout\ = ( \counter_ent|curr_cnt\(4) & ( \fsm_ent|Equal0~0_combout\ & ( (!\fsm_ent|curr_state.START~q\ & (!\counter_ent|Add0~0_combout\ & !\sync_ent|sync_chain\(3))) ) ) ) # ( !\counter_ent|curr_cnt\(4) & ( 
-- \fsm_ent|Equal0~0_combout\ & ( (!\fsm_ent|curr_state.START~q\ & (\counter_ent|Add0~0_combout\ & !\sync_ent|sync_chain\(3))) ) ) ) # ( \counter_ent|curr_cnt\(4) & ( !\fsm_ent|Equal0~0_combout\ & ( (!\counter_ent|Add0~0_combout\ & 
-- ((!\sync_ent|sync_chain\(3)) # (\fsm_ent|curr_state.START~q\))) ) ) ) # ( !\counter_ent|curr_cnt\(4) & ( !\fsm_ent|Equal0~0_combout\ & ( (\counter_ent|Add0~0_combout\ & ((!\sync_ent|sync_chain\(3)) # (\fsm_ent|curr_state.START~q\))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000111100000101111100000101000000001010000000001010000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \fsm_ent|ALT_INV_curr_state.START~q\,
	datac => \counter_ent|ALT_INV_Add0~0_combout\,
	datad => \sync_ent|ALT_INV_sync_chain\(3),
	datae => \counter_ent|ALT_INV_curr_cnt\(4),
	dataf => \fsm_ent|ALT_INV_Equal0~0_combout\,
	combout => \counter_ent|next_cnt[4]~1_combout\);

-- Location: FF_X36_Y1_N23
\counter_ent|curr_cnt[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_i~inputCLKENA0_outclk\,
	d => \counter_ent|next_cnt[4]~1_combout\,
	clrn => \ALT_INV_rst_i~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \counter_ent|curr_cnt\(4));

-- Location: FF_X36_Y1_N59
\counter_ent|curr_cnt[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_i~inputCLKENA0_outclk\,
	d => \counter_ent|next_cnt[3]~2_combout\,
	clrn => \ALT_INV_rst_i~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \counter_ent|curr_cnt\(3));

-- Location: FF_X36_Y1_N22
\counter_ent|curr_cnt[4]~DUPLICATE\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_i~inputCLKENA0_outclk\,
	d => \counter_ent|next_cnt[4]~1_combout\,
	clrn => \ALT_INV_rst_i~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \counter_ent|curr_cnt[4]~DUPLICATE_q\);

-- Location: LABCELL_X36_Y1_N6
\counter_ent|next_cnt[5]~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \counter_ent|next_cnt[5]~0_combout\ = ( \counter_ent|curr_cnt\(5) & ( \counter_ent|curr_cnt[4]~DUPLICATE_q\ & ( (!\counter_ent|Add0~0_combout\ & ((!\fsm_ent|curr_state.START~q\ & (!\sync_ent|sync_chain\(3))) # (\fsm_ent|curr_state.START~q\ & 
-- ((!\fsm_ent|Equal0~0_combout\))))) ) ) ) # ( !\counter_ent|curr_cnt\(5) & ( \counter_ent|curr_cnt[4]~DUPLICATE_q\ & ( (\counter_ent|Add0~0_combout\ & ((!\fsm_ent|curr_state.START~q\ & (!\sync_ent|sync_chain\(3))) # (\fsm_ent|curr_state.START~q\ & 
-- ((!\fsm_ent|Equal0~0_combout\))))) ) ) ) # ( \counter_ent|curr_cnt\(5) & ( !\counter_ent|curr_cnt[4]~DUPLICATE_q\ & ( (!\fsm_ent|curr_state.START~q\ & (!\sync_ent|sync_chain\(3))) # (\fsm_ent|curr_state.START~q\ & ((!\fsm_ent|Equal0~0_combout\))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111101011010000000110001001000001100010010000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \fsm_ent|ALT_INV_curr_state.START~q\,
	datab => \counter_ent|ALT_INV_Add0~0_combout\,
	datac => \sync_ent|ALT_INV_sync_chain\(3),
	datad => \fsm_ent|ALT_INV_Equal0~0_combout\,
	datae => \counter_ent|ALT_INV_curr_cnt\(5),
	dataf => \counter_ent|ALT_INV_curr_cnt[4]~DUPLICATE_q\,
	combout => \counter_ent|next_cnt[5]~0_combout\);

-- Location: FF_X36_Y1_N8
\counter_ent|curr_cnt[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_i~inputCLKENA0_outclk\,
	d => \counter_ent|next_cnt[5]~0_combout\,
	clrn => \ALT_INV_rst_i~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \counter_ent|curr_cnt\(5));

-- Location: LABCELL_X36_Y1_N12
\fsm_ent|Equal0~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \fsm_ent|Equal0~0_combout\ = ( !\counter_ent|curr_cnt[0]~DUPLICATE_q\ & ( \counter_ent|curr_cnt\(5) & ( (!\counter_ent|curr_cnt\(2) & (\counter_ent|curr_cnt[1]~DUPLICATE_q\ & (\counter_ent|curr_cnt\(4) & !\counter_ent|curr_cnt\(3)))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000010000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \counter_ent|ALT_INV_curr_cnt\(2),
	datab => \counter_ent|ALT_INV_curr_cnt[1]~DUPLICATE_q\,
	datac => \counter_ent|ALT_INV_curr_cnt\(4),
	datad => \counter_ent|ALT_INV_curr_cnt\(3),
	datae => \counter_ent|ALT_INV_curr_cnt[0]~DUPLICATE_q\,
	dataf => \counter_ent|ALT_INV_curr_cnt\(5),
	combout => \fsm_ent|Equal0~0_combout\);

-- Location: LABCELL_X36_Y1_N51
\fsm_ent|Selector1~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \fsm_ent|Selector1~1_combout\ = ( \fsm_ent|curr_state.WAIT_ON_CNT~q\ & ( \fsm_ent|Equal0~0_combout\ & ( !\fsm_ent|curr_state.LED_ON~DUPLICATE_q\ $ (((!\fsm_ent|curr_state.START~q\ & \sync_ent|sync_chain[3]~DUPLICATE_q\))) ) ) ) # ( 
-- !\fsm_ent|curr_state.WAIT_ON_CNT~q\ & ( \fsm_ent|Equal0~0_combout\ & ( !\fsm_ent|curr_state.LED_ON~DUPLICATE_q\ $ (((!\sync_ent|sync_chain[3]~DUPLICATE_q\) # (\fsm_ent|curr_state.START~q\))) ) ) ) # ( \fsm_ent|curr_state.WAIT_ON_CNT~q\ & ( 
-- !\fsm_ent|Equal0~0_combout\ & ( (!\fsm_ent|curr_state.START~q\ & \sync_ent|sync_chain[3]~DUPLICATE_q\) ) ) ) # ( !\fsm_ent|curr_state.WAIT_ON_CNT~q\ & ( !\fsm_ent|Equal0~0_combout\ & ( (!\fsm_ent|curr_state.START~q\ & \sync_ent|sync_chain[3]~DUPLICATE_q\) 
-- ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000101000001010000010100000101000111001001110011100011011000110",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \fsm_ent|ALT_INV_curr_state.START~q\,
	datab => \fsm_ent|ALT_INV_curr_state.LED_ON~DUPLICATE_q\,
	datac => \sync_ent|ALT_INV_sync_chain[3]~DUPLICATE_q\,
	datae => \fsm_ent|ALT_INV_curr_state.WAIT_ON_CNT~q\,
	dataf => \fsm_ent|ALT_INV_Equal0~0_combout\,
	combout => \fsm_ent|Selector1~1_combout\);

-- Location: FF_X36_Y1_N31
\fsm_ent|curr_state.LED_ON\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_i~inputCLKENA0_outclk\,
	d => \fsm_ent|Selector1~0_combout\,
	clrn => \ALT_INV_rst_i~input_o\,
	ena => \fsm_ent|Selector1~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \fsm_ent|curr_state.LED_ON~q\);

-- Location: LABCELL_X36_Y1_N24
\fsm_ent|Selector1~2\ : cyclonev_lcell_comb
-- Equation(s):
-- \fsm_ent|Selector1~2_combout\ = ( \fsm_ent|Equal0~0_combout\ & ( !\fsm_ent|curr_state.LED_ON~q\ ) ) # ( !\fsm_ent|Equal0~0_combout\ )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1111111111111111111111111111111111110000111100001111000011110000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \fsm_ent|ALT_INV_curr_state.LED_ON~q\,
	dataf => \fsm_ent|ALT_INV_Equal0~0_combout\,
	combout => \fsm_ent|Selector1~2_combout\);

-- Location: FF_X36_Y1_N26
\fsm_ent|curr_state.START\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_i~inputCLKENA0_outclk\,
	d => \fsm_ent|Selector1~2_combout\,
	clrn => \ALT_INV_rst_i~input_o\,
	ena => \fsm_ent|Selector1~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \fsm_ent|curr_state.START~q\);

-- Location: LABCELL_X36_Y1_N54
\fsm_ent|Selector2~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \fsm_ent|Selector2~0_combout\ = ( \fsm_ent|Equal0~0_combout\ & ( (!\fsm_ent|curr_state.START~q\ & \sync_ent|sync_chain\(3)) ) ) # ( !\fsm_ent|Equal0~0_combout\ & ( (!\fsm_ent|curr_state.START~q\ & (\sync_ent|sync_chain\(3))) # 
-- (\fsm_ent|curr_state.START~q\ & ((\fsm_ent|curr_state.WAIT_ON_CNT~q\))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000101001011111000010100101111100001010000010100000101000001010",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \fsm_ent|ALT_INV_curr_state.START~q\,
	datac => \sync_ent|ALT_INV_sync_chain\(3),
	datad => \fsm_ent|ALT_INV_curr_state.WAIT_ON_CNT~q\,
	dataf => \fsm_ent|ALT_INV_Equal0~0_combout\,
	combout => \fsm_ent|Selector2~0_combout\);

-- Location: FF_X36_Y1_N56
\fsm_ent|curr_state.WAIT_ON_CNT\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_i~inputCLKENA0_outclk\,
	d => \fsm_ent|Selector2~0_combout\,
	clrn => \ALT_INV_rst_i~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \fsm_ent|curr_state.WAIT_ON_CNT~q\);

-- Location: LABCELL_X36_Y1_N30
\fsm_ent|Selector1~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \fsm_ent|Selector1~0_combout\ = ( \fsm_ent|curr_state.WAIT_ON_CNT~q\ & ( \fsm_ent|Equal0~0_combout\ ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000000001111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datae => \fsm_ent|ALT_INV_curr_state.WAIT_ON_CNT~q\,
	dataf => \fsm_ent|ALT_INV_Equal0~0_combout\,
	combout => \fsm_ent|Selector1~0_combout\);

-- Location: FF_X36_Y1_N32
\fsm_ent|curr_state.LED_ON~DUPLICATE\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_i~inputCLKENA0_outclk\,
	d => \fsm_ent|Selector1~0_combout\,
	clrn => \ALT_INV_rst_i~input_o\,
	ena => \fsm_ent|Selector1~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \fsm_ent|curr_state.LED_ON~DUPLICATE_q\);

-- Location: LABCELL_X10_Y56_N3
\~QUARTUS_CREATED_GND~I\ : cyclonev_lcell_comb
-- Equation(s):

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
;
END structure;


