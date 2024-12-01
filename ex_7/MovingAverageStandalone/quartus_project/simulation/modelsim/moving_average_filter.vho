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

-- DATE "11/30/2024 04:11:19"

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
USE IEEE.NUMERIC_STD.ALL;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY 	moving_average_filter IS
    PORT (
	clk_i : IN std_logic;
	rst_i : IN std_logic;
	strb_data_valid_i : IN std_logic;
	strb_data_valid_o : OUT std_logic;
	data_i : IN IEEE.NUMERIC_STD.unsigned(7 DOWNTO 0);
	data_o : OUT IEEE.NUMERIC_STD.unsigned(7 DOWNTO 0)
	);
END moving_average_filter;

-- Design Ports Information
-- strb_data_valid_o	=>  Location: PIN_W22,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- data_o[0]	=>  Location: PIN_AK3,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- data_o[1]	=>  Location: PIN_AJ4,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- data_o[2]	=>  Location: PIN_AA13,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- data_o[3]	=>  Location: PIN_AK2,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- data_o[4]	=>  Location: PIN_AH5,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- data_o[5]	=>  Location: PIN_AJ2,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- data_o[6]	=>  Location: PIN_AE13,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- data_o[7]	=>  Location: PIN_AF13,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- clk_i	=>  Location: PIN_Y27,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- rst_i	=>  Location: PIN_AD12,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- strb_data_valid_i	=>  Location: PIN_AC12,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- data_i[2]	=>  Location: PIN_AG5,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- data_i[3]	=>  Location: PIN_AG11,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- data_i[4]	=>  Location: PIN_AG10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- data_i[5]	=>  Location: PIN_AG2,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- data_i[6]	=>  Location: PIN_AH3,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- data_i[7]	=>  Location: PIN_AF11,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- data_i[1]	=>  Location: PIN_AH9,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- data_i[0]	=>  Location: PIN_AB13,	 I/O Standard: 2.5 V,	 Current Strength: Default


ARCHITECTURE structure OF moving_average_filter IS
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
SIGNAL ww_strb_data_valid_i : std_logic;
SIGNAL ww_strb_data_valid_o : std_logic;
SIGNAL ww_data_i : std_logic_vector(7 DOWNTO 0);
SIGNAL ww_data_o : std_logic_vector(7 DOWNTO 0);
SIGNAL \~QUARTUS_CREATED_GND~I_combout\ : std_logic;
SIGNAL \clk_i~input_o\ : std_logic;
SIGNAL \clk_i~inputCLKENA0_outclk\ : std_logic;
SIGNAL \data_i[2]~input_o\ : std_logic;
SIGNAL \filter_reg[0][2]~feeder_combout\ : std_logic;
SIGNAL \rst_i~input_o\ : std_logic;
SIGNAL \strb_data_valid_i~input_o\ : std_logic;
SIGNAL \filter_reg[0][2]~q\ : std_logic;
SIGNAL \filter_reg[1][2]~q\ : std_logic;
SIGNAL \filter_reg[2][2]~q\ : std_logic;
SIGNAL \filter_reg[3][2]~feeder_combout\ : std_logic;
SIGNAL \filter_reg[3][2]~q\ : std_logic;
SIGNAL \data_i[1]~input_o\ : std_logic;
SIGNAL \filter_reg[0][1]~q\ : std_logic;
SIGNAL \filter_reg[1][1]~feeder_combout\ : std_logic;
SIGNAL \filter_reg[1][1]~q\ : std_logic;
SIGNAL \filter_reg[2][1]~feeder_combout\ : std_logic;
SIGNAL \filter_reg[2][1]~q\ : std_logic;
SIGNAL \filter_reg[3][1]~feeder_combout\ : std_logic;
SIGNAL \filter_reg[3][1]~q\ : std_logic;
SIGNAL \data_i[0]~input_o\ : std_logic;
SIGNAL \filter_reg[0][0]~feeder_combout\ : std_logic;
SIGNAL \filter_reg[0][0]~q\ : std_logic;
SIGNAL \filter_reg[1][0]~q\ : std_logic;
SIGNAL \filter_reg[2][0]~feeder_combout\ : std_logic;
SIGNAL \filter_reg[2][0]~q\ : std_logic;
SIGNAL \filter_reg[3][0]~feeder_combout\ : std_logic;
SIGNAL \filter_reg[3][0]~q\ : std_logic;
SIGNAL \Add1~42_cout\ : std_logic;
SIGNAL \Add1~43\ : std_logic;
SIGNAL \Add1~37_sumout\ : std_logic;
SIGNAL \Add1~38\ : std_logic;
SIGNAL \Add1~39\ : std_logic;
SIGNAL \Add1~33_sumout\ : std_logic;
SIGNAL \Add1~34\ : std_logic;
SIGNAL \Add1~35\ : std_logic;
SIGNAL \Add1~1_sumout\ : std_logic;
SIGNAL \data_i[3]~input_o\ : std_logic;
SIGNAL \filter_reg[0][3]~q\ : std_logic;
SIGNAL \filter_reg[1][3]~q\ : std_logic;
SIGNAL \filter_reg[2][3]~feeder_combout\ : std_logic;
SIGNAL \filter_reg[2][3]~q\ : std_logic;
SIGNAL \filter_reg[3][3]~feeder_combout\ : std_logic;
SIGNAL \filter_reg[3][3]~q\ : std_logic;
SIGNAL \Add1~2\ : std_logic;
SIGNAL \Add1~3\ : std_logic;
SIGNAL \Add1~5_sumout\ : std_logic;
SIGNAL \data_i[4]~input_o\ : std_logic;
SIGNAL \filter_reg[0][4]~q\ : std_logic;
SIGNAL \filter_reg[1][4]~q\ : std_logic;
SIGNAL \filter_reg[2][4]~feeder_combout\ : std_logic;
SIGNAL \filter_reg[2][4]~q\ : std_logic;
SIGNAL \filter_reg[3][4]~feeder_combout\ : std_logic;
SIGNAL \filter_reg[3][4]~q\ : std_logic;
SIGNAL \Add1~6\ : std_logic;
SIGNAL \Add1~7\ : std_logic;
SIGNAL \Add1~9_sumout\ : std_logic;
SIGNAL \data_i[5]~input_o\ : std_logic;
SIGNAL \filter_reg[0][5]~q\ : std_logic;
SIGNAL \filter_reg[1][5]~q\ : std_logic;
SIGNAL \filter_reg[2][5]~feeder_combout\ : std_logic;
SIGNAL \filter_reg[2][5]~q\ : std_logic;
SIGNAL \filter_reg[3][5]~feeder_combout\ : std_logic;
SIGNAL \filter_reg[3][5]~q\ : std_logic;
SIGNAL \Add1~10\ : std_logic;
SIGNAL \Add1~11\ : std_logic;
SIGNAL \Add1~13_sumout\ : std_logic;
SIGNAL \data_i[6]~input_o\ : std_logic;
SIGNAL \filter_reg[0][6]~feeder_combout\ : std_logic;
SIGNAL \filter_reg[0][6]~q\ : std_logic;
SIGNAL \filter_reg[1][6]~feeder_combout\ : std_logic;
SIGNAL \filter_reg[1][6]~q\ : std_logic;
SIGNAL \filter_reg[2][6]~feeder_combout\ : std_logic;
SIGNAL \filter_reg[2][6]~q\ : std_logic;
SIGNAL \filter_reg[3][6]~feeder_combout\ : std_logic;
SIGNAL \filter_reg[3][6]~q\ : std_logic;
SIGNAL \Add1~14\ : std_logic;
SIGNAL \Add1~15\ : std_logic;
SIGNAL \Add1~17_sumout\ : std_logic;
SIGNAL \data_i[7]~input_o\ : std_logic;
SIGNAL \filter_reg[0][7]~q\ : std_logic;
SIGNAL \filter_reg[1][7]~feeder_combout\ : std_logic;
SIGNAL \filter_reg[1][7]~q\ : std_logic;
SIGNAL \filter_reg[2][7]~feeder_combout\ : std_logic;
SIGNAL \filter_reg[2][7]~q\ : std_logic;
SIGNAL \filter_reg[3][7]~feeder_combout\ : std_logic;
SIGNAL \filter_reg[3][7]~q\ : std_logic;
SIGNAL \Add1~18\ : std_logic;
SIGNAL \Add1~19\ : std_logic;
SIGNAL \Add1~21_sumout\ : std_logic;
SIGNAL \Add1~22\ : std_logic;
SIGNAL \Add1~23\ : std_logic;
SIGNAL \Add1~25_sumout\ : std_logic;
SIGNAL \Add1~26\ : std_logic;
SIGNAL \Add1~27\ : std_logic;
SIGNAL \Add1~29_sumout\ : std_logic;
SIGNAL sum : std_logic_vector(9 DOWNTO 0);
SIGNAL \ALT_INV_filter_reg[1][0]~q\ : std_logic;
SIGNAL \ALT_INV_filter_reg[0][1]~q\ : std_logic;
SIGNAL \ALT_INV_filter_reg[0][7]~q\ : std_logic;
SIGNAL \ALT_INV_filter_reg[0][6]~q\ : std_logic;
SIGNAL \ALT_INV_filter_reg[2][0]~q\ : std_logic;
SIGNAL \ALT_INV_filter_reg[1][1]~q\ : std_logic;
SIGNAL \ALT_INV_filter_reg[1][7]~q\ : std_logic;
SIGNAL \ALT_INV_filter_reg[1][6]~q\ : std_logic;
SIGNAL \ALT_INV_filter_reg[1][5]~q\ : std_logic;
SIGNAL \ALT_INV_filter_reg[1][4]~q\ : std_logic;
SIGNAL \ALT_INV_filter_reg[1][3]~q\ : std_logic;
SIGNAL ALT_INV_sum : std_logic_vector(9 DOWNTO 0);
SIGNAL \ALT_INV_filter_reg[3][0]~q\ : std_logic;
SIGNAL \ALT_INV_filter_reg[2][1]~q\ : std_logic;
SIGNAL \ALT_INV_filter_reg[2][7]~q\ : std_logic;
SIGNAL \ALT_INV_filter_reg[2][6]~q\ : std_logic;
SIGNAL \ALT_INV_filter_reg[2][5]~q\ : std_logic;
SIGNAL \ALT_INV_filter_reg[2][4]~q\ : std_logic;
SIGNAL \ALT_INV_filter_reg[2][3]~q\ : std_logic;
SIGNAL \ALT_INV_filter_reg[3][1]~q\ : std_logic;
SIGNAL \ALT_INV_filter_reg[2][2]~q\ : std_logic;
SIGNAL \ALT_INV_filter_reg[3][7]~q\ : std_logic;
SIGNAL \ALT_INV_filter_reg[3][6]~q\ : std_logic;
SIGNAL \ALT_INV_filter_reg[3][5]~q\ : std_logic;
SIGNAL \ALT_INV_filter_reg[3][4]~q\ : std_logic;
SIGNAL \ALT_INV_filter_reg[3][3]~q\ : std_logic;
SIGNAL \ALT_INV_filter_reg[3][2]~q\ : std_logic;
SIGNAL \ALT_INV_data_i[0]~input_o\ : std_logic;
SIGNAL \ALT_INV_data_i[1]~input_o\ : std_logic;
SIGNAL \ALT_INV_data_i[7]~input_o\ : std_logic;
SIGNAL \ALT_INV_data_i[6]~input_o\ : std_logic;
SIGNAL \ALT_INV_data_i[5]~input_o\ : std_logic;
SIGNAL \ALT_INV_data_i[4]~input_o\ : std_logic;
SIGNAL \ALT_INV_data_i[3]~input_o\ : std_logic;
SIGNAL \ALT_INV_data_i[2]~input_o\ : std_logic;
SIGNAL \ALT_INV_rst_i~input_o\ : std_logic;

BEGIN

ww_clk_i <= clk_i;
ww_rst_i <= rst_i;
ww_strb_data_valid_i <= strb_data_valid_i;
strb_data_valid_o <= ww_strb_data_valid_o;
ww_data_i <= IEEE.STD_LOGIC_1164.STD_LOGIC_VECTOR(data_i);
data_o <= IEEE.NUMERIC_STD.UNSIGNED(ww_data_o);
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;
\ALT_INV_filter_reg[1][0]~q\ <= NOT \filter_reg[1][0]~q\;
\ALT_INV_filter_reg[0][1]~q\ <= NOT \filter_reg[0][1]~q\;
\ALT_INV_filter_reg[0][7]~q\ <= NOT \filter_reg[0][7]~q\;
\ALT_INV_filter_reg[0][6]~q\ <= NOT \filter_reg[0][6]~q\;
\ALT_INV_filter_reg[2][0]~q\ <= NOT \filter_reg[2][0]~q\;
\ALT_INV_filter_reg[1][1]~q\ <= NOT \filter_reg[1][1]~q\;
\ALT_INV_filter_reg[1][7]~q\ <= NOT \filter_reg[1][7]~q\;
\ALT_INV_filter_reg[1][6]~q\ <= NOT \filter_reg[1][6]~q\;
\ALT_INV_filter_reg[1][5]~q\ <= NOT \filter_reg[1][5]~q\;
\ALT_INV_filter_reg[1][4]~q\ <= NOT \filter_reg[1][4]~q\;
\ALT_INV_filter_reg[1][3]~q\ <= NOT \filter_reg[1][3]~q\;
ALT_INV_sum(0) <= NOT sum(0);
\ALT_INV_filter_reg[3][0]~q\ <= NOT \filter_reg[3][0]~q\;
\ALT_INV_filter_reg[2][1]~q\ <= NOT \filter_reg[2][1]~q\;
\ALT_INV_filter_reg[2][7]~q\ <= NOT \filter_reg[2][7]~q\;
\ALT_INV_filter_reg[2][6]~q\ <= NOT \filter_reg[2][6]~q\;
\ALT_INV_filter_reg[2][5]~q\ <= NOT \filter_reg[2][5]~q\;
\ALT_INV_filter_reg[2][4]~q\ <= NOT \filter_reg[2][4]~q\;
\ALT_INV_filter_reg[2][3]~q\ <= NOT \filter_reg[2][3]~q\;
ALT_INV_sum(1) <= NOT sum(1);
\ALT_INV_filter_reg[3][1]~q\ <= NOT \filter_reg[3][1]~q\;
\ALT_INV_filter_reg[2][2]~q\ <= NOT \filter_reg[2][2]~q\;
\ALT_INV_filter_reg[3][7]~q\ <= NOT \filter_reg[3][7]~q\;
\ALT_INV_filter_reg[3][6]~q\ <= NOT \filter_reg[3][6]~q\;
\ALT_INV_filter_reg[3][5]~q\ <= NOT \filter_reg[3][5]~q\;
\ALT_INV_filter_reg[3][4]~q\ <= NOT \filter_reg[3][4]~q\;
\ALT_INV_filter_reg[3][3]~q\ <= NOT \filter_reg[3][3]~q\;
\ALT_INV_filter_reg[3][2]~q\ <= NOT \filter_reg[3][2]~q\;
ALT_INV_sum(9) <= NOT sum(9);
ALT_INV_sum(8) <= NOT sum(8);
ALT_INV_sum(7) <= NOT sum(7);
ALT_INV_sum(6) <= NOT sum(6);
ALT_INV_sum(5) <= NOT sum(5);
ALT_INV_sum(4) <= NOT sum(4);
ALT_INV_sum(3) <= NOT sum(3);
ALT_INV_sum(2) <= NOT sum(2);
\ALT_INV_data_i[0]~input_o\ <= NOT \data_i[0]~input_o\;
\ALT_INV_data_i[1]~input_o\ <= NOT \data_i[1]~input_o\;
\ALT_INV_data_i[7]~input_o\ <= NOT \data_i[7]~input_o\;
\ALT_INV_data_i[6]~input_o\ <= NOT \data_i[6]~input_o\;
\ALT_INV_data_i[5]~input_o\ <= NOT \data_i[5]~input_o\;
\ALT_INV_data_i[4]~input_o\ <= NOT \data_i[4]~input_o\;
\ALT_INV_data_i[3]~input_o\ <= NOT \data_i[3]~input_o\;
\ALT_INV_data_i[2]~input_o\ <= NOT \data_i[2]~input_o\;
\ALT_INV_rst_i~input_o\ <= NOT \rst_i~input_o\;

-- Location: IOOBUF_X89_Y8_N22
\strb_data_valid_o~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_strb_data_valid_o);

-- Location: IOOBUF_X20_Y0_N53
\data_o[0]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => sum(2),
	devoe => ww_devoe,
	o => ww_data_o(0));

-- Location: IOOBUF_X22_Y0_N36
\data_o[1]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => sum(3),
	devoe => ww_devoe,
	o => ww_data_o(1));

-- Location: IOOBUF_X20_Y0_N2
\data_o[2]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => sum(4),
	devoe => ww_devoe,
	o => ww_data_o(2));

-- Location: IOOBUF_X20_Y0_N36
\data_o[3]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => sum(5),
	devoe => ww_devoe,
	o => ww_data_o(3));

-- Location: IOOBUF_X14_Y0_N53
\data_o[4]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => sum(6),
	devoe => ww_devoe,
	o => ww_data_o(4));

-- Location: IOOBUF_X14_Y0_N19
\data_o[5]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => sum(7),
	devoe => ww_devoe,
	o => ww_data_o(5));

-- Location: IOOBUF_X22_Y0_N2
\data_o[6]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => sum(8),
	devoe => ww_devoe,
	o => ww_data_o(6));

-- Location: IOOBUF_X22_Y0_N19
\data_o[7]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => sum(9),
	devoe => ww_devoe,
	o => ww_data_o(7));

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

-- Location: IOIBUF_X14_Y0_N35
\data_i[2]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_data_i(2),
	o => \data_i[2]~input_o\);

-- Location: LABCELL_X17_Y1_N42
\filter_reg[0][2]~feeder\ : cyclonev_lcell_comb
-- Equation(s):
-- \filter_reg[0][2]~feeder_combout\ = ( \data_i[2]~input_o\ )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000011111111111111111111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataf => \ALT_INV_data_i[2]~input_o\,
	combout => \filter_reg[0][2]~feeder_combout\);

-- Location: IOIBUF_X16_Y0_N18
\rst_i~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_rst_i,
	o => \rst_i~input_o\);

-- Location: IOIBUF_X16_Y0_N1
\strb_data_valid_i~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_strb_data_valid_i,
	o => \strb_data_valid_i~input_o\);

-- Location: FF_X17_Y1_N44
\filter_reg[0][2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_i~inputCLKENA0_outclk\,
	d => \filter_reg[0][2]~feeder_combout\,
	clrn => \ALT_INV_rst_i~input_o\,
	ena => \strb_data_valid_i~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \filter_reg[0][2]~q\);

-- Location: FF_X17_Y1_N38
\filter_reg[1][2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_i~inputCLKENA0_outclk\,
	asdata => \filter_reg[0][2]~q\,
	clrn => \ALT_INV_rst_i~input_o\,
	sload => VCC,
	ena => \strb_data_valid_i~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \filter_reg[1][2]~q\);

-- Location: FF_X17_Y1_N40
\filter_reg[2][2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_i~inputCLKENA0_outclk\,
	asdata => \filter_reg[1][2]~q\,
	clrn => \ALT_INV_rst_i~input_o\,
	sload => VCC,
	ena => \strb_data_valid_i~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \filter_reg[2][2]~q\);

-- Location: LABCELL_X18_Y1_N39
\filter_reg[3][2]~feeder\ : cyclonev_lcell_comb
-- Equation(s):
-- \filter_reg[3][2]~feeder_combout\ = ( \filter_reg[2][2]~q\ )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000011111111111111111111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataf => \ALT_INV_filter_reg[2][2]~q\,
	combout => \filter_reg[3][2]~feeder_combout\);

-- Location: FF_X18_Y1_N40
\filter_reg[3][2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_i~inputCLKENA0_outclk\,
	d => \filter_reg[3][2]~feeder_combout\,
	clrn => \ALT_INV_rst_i~input_o\,
	ena => \strb_data_valid_i~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \filter_reg[3][2]~q\);

-- Location: IOIBUF_X18_Y0_N92
\data_i[1]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_data_i(1),
	o => \data_i[1]~input_o\);

-- Location: FF_X18_Y1_N1
\filter_reg[0][1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_i~inputCLKENA0_outclk\,
	asdata => \data_i[1]~input_o\,
	clrn => \ALT_INV_rst_i~input_o\,
	sload => VCC,
	ena => \strb_data_valid_i~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \filter_reg[0][1]~q\);

-- Location: LABCELL_X19_Y1_N42
\filter_reg[1][1]~feeder\ : cyclonev_lcell_comb
-- Equation(s):
-- \filter_reg[1][1]~feeder_combout\ = ( \filter_reg[0][1]~q\ )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000011111111111111111111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataf => \ALT_INV_filter_reg[0][1]~q\,
	combout => \filter_reg[1][1]~feeder_combout\);

-- Location: FF_X19_Y1_N44
\filter_reg[1][1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_i~inputCLKENA0_outclk\,
	d => \filter_reg[1][1]~feeder_combout\,
	clrn => \ALT_INV_rst_i~input_o\,
	ena => \strb_data_valid_i~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \filter_reg[1][1]~q\);

-- Location: LABCELL_X19_Y1_N45
\filter_reg[2][1]~feeder\ : cyclonev_lcell_comb
-- Equation(s):
-- \filter_reg[2][1]~feeder_combout\ = ( \filter_reg[1][1]~q\ )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000011111111111111111111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataf => \ALT_INV_filter_reg[1][1]~q\,
	combout => \filter_reg[2][1]~feeder_combout\);

-- Location: FF_X19_Y1_N47
\filter_reg[2][1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_i~inputCLKENA0_outclk\,
	d => \filter_reg[2][1]~feeder_combout\,
	clrn => \ALT_INV_rst_i~input_o\,
	ena => \strb_data_valid_i~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \filter_reg[2][1]~q\);

-- Location: LABCELL_X18_Y1_N54
\filter_reg[3][1]~feeder\ : cyclonev_lcell_comb
-- Equation(s):
-- \filter_reg[3][1]~feeder_combout\ = ( \filter_reg[2][1]~q\ )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000011111111111111111111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataf => \ALT_INV_filter_reg[2][1]~q\,
	combout => \filter_reg[3][1]~feeder_combout\);

-- Location: FF_X18_Y1_N56
\filter_reg[3][1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_i~inputCLKENA0_outclk\,
	d => \filter_reg[3][1]~feeder_combout\,
	clrn => \ALT_INV_rst_i~input_o\,
	ena => \strb_data_valid_i~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \filter_reg[3][1]~q\);

-- Location: IOIBUF_X20_Y0_N18
\data_i[0]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_data_i(0),
	o => \data_i[0]~input_o\);

-- Location: LABCELL_X19_Y1_N54
\filter_reg[0][0]~feeder\ : cyclonev_lcell_comb
-- Equation(s):
-- \filter_reg[0][0]~feeder_combout\ = ( \data_i[0]~input_o\ )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000011111111111111111111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataf => \ALT_INV_data_i[0]~input_o\,
	combout => \filter_reg[0][0]~feeder_combout\);

-- Location: FF_X19_Y1_N56
\filter_reg[0][0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_i~inputCLKENA0_outclk\,
	d => \filter_reg[0][0]~feeder_combout\,
	clrn => \ALT_INV_rst_i~input_o\,
	ena => \strb_data_valid_i~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \filter_reg[0][0]~q\);

-- Location: FF_X19_Y1_N28
\filter_reg[1][0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_i~inputCLKENA0_outclk\,
	asdata => \filter_reg[0][0]~q\,
	clrn => \ALT_INV_rst_i~input_o\,
	sload => VCC,
	ena => \strb_data_valid_i~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \filter_reg[1][0]~q\);

-- Location: LABCELL_X19_Y1_N24
\filter_reg[2][0]~feeder\ : cyclonev_lcell_comb
-- Equation(s):
-- \filter_reg[2][0]~feeder_combout\ = ( \filter_reg[1][0]~q\ )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000011111111111111111111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataf => \ALT_INV_filter_reg[1][0]~q\,
	combout => \filter_reg[2][0]~feeder_combout\);

-- Location: FF_X19_Y1_N26
\filter_reg[2][0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_i~inputCLKENA0_outclk\,
	d => \filter_reg[2][0]~feeder_combout\,
	clrn => \ALT_INV_rst_i~input_o\,
	ena => \strb_data_valid_i~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \filter_reg[2][0]~q\);

-- Location: LABCELL_X18_Y1_N42
\filter_reg[3][0]~feeder\ : cyclonev_lcell_comb
-- Equation(s):
-- \filter_reg[3][0]~feeder_combout\ = ( \filter_reg[2][0]~q\ )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000011111111111111111111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataf => \ALT_INV_filter_reg[2][0]~q\,
	combout => \filter_reg[3][0]~feeder_combout\);

-- Location: FF_X18_Y1_N44
\filter_reg[3][0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_i~inputCLKENA0_outclk\,
	d => \filter_reg[3][0]~feeder_combout\,
	clrn => \ALT_INV_rst_i~input_o\,
	ena => \strb_data_valid_i~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \filter_reg[3][0]~q\);

-- Location: LABCELL_X18_Y1_N0
\Add1~42\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add1~42_cout\ = CARRY(( GND ) + ( !VCC ) + ( !VCC ))
-- \Add1~43\ = SHARE(VCC)

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000000000000",
	shared_arith => "on")
-- pragma translate_on
PORT MAP (
	cin => GND,
	sharein => GND,
	cout => \Add1~42_cout\,
	shareout => \Add1~43\);

-- Location: LABCELL_X18_Y1_N3
\Add1~37\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add1~37_sumout\ = SUM(( !\data_i[0]~input_o\ $ (!\filter_reg[3][0]~q\ $ (!sum(0))) ) + ( \Add1~43\ ) + ( \Add1~42_cout\ ))
-- \Add1~38\ = CARRY(( !\data_i[0]~input_o\ $ (!\filter_reg[3][0]~q\ $ (!sum(0))) ) + ( \Add1~43\ ) + ( \Add1~42_cout\ ))
-- \Add1~39\ = SHARE((!\data_i[0]~input_o\ & (!\filter_reg[3][0]~q\ & sum(0))) # (\data_i[0]~input_o\ & ((!\filter_reg[3][0]~q\) # (sum(0)))))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000010100001111010100000000000000001010010101011010",
	shared_arith => "on")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_data_i[0]~input_o\,
	datac => \ALT_INV_filter_reg[3][0]~q\,
	datad => ALT_INV_sum(0),
	cin => \Add1~42_cout\,
	sharein => \Add1~43\,
	sumout => \Add1~37_sumout\,
	cout => \Add1~38\,
	shareout => \Add1~39\);

-- Location: FF_X18_Y1_N5
\sum[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_i~inputCLKENA0_outclk\,
	d => \Add1~37_sumout\,
	clrn => \ALT_INV_rst_i~input_o\,
	ena => \strb_data_valid_i~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => sum(0));

-- Location: LABCELL_X18_Y1_N6
\Add1~33\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add1~33_sumout\ = SUM(( !\data_i[1]~input_o\ $ (!\filter_reg[3][1]~q\ $ (!sum(1))) ) + ( \Add1~39\ ) + ( \Add1~38\ ))
-- \Add1~34\ = CARRY(( !\data_i[1]~input_o\ $ (!\filter_reg[3][1]~q\ $ (!sum(1))) ) + ( \Add1~39\ ) + ( \Add1~38\ ))
-- \Add1~35\ = SHARE((!\data_i[1]~input_o\ & (!\filter_reg[3][1]~q\ & sum(1))) # (\data_i[1]~input_o\ & ((!\filter_reg[3][1]~q\) # (sum(1)))))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000010100001111010100000000000000001010010101011010",
	shared_arith => "on")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_data_i[1]~input_o\,
	datac => \ALT_INV_filter_reg[3][1]~q\,
	datad => ALT_INV_sum(1),
	cin => \Add1~38\,
	sharein => \Add1~39\,
	sumout => \Add1~33_sumout\,
	cout => \Add1~34\,
	shareout => \Add1~35\);

-- Location: FF_X18_Y1_N7
\sum[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_i~inputCLKENA0_outclk\,
	d => \Add1~33_sumout\,
	clrn => \ALT_INV_rst_i~input_o\,
	ena => \strb_data_valid_i~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => sum(1));

-- Location: LABCELL_X18_Y1_N9
\Add1~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add1~1_sumout\ = SUM(( !\data_i[2]~input_o\ $ (!sum(2) $ (!\filter_reg[3][2]~q\)) ) + ( \Add1~35\ ) + ( \Add1~34\ ))
-- \Add1~2\ = CARRY(( !\data_i[2]~input_o\ $ (!sum(2) $ (!\filter_reg[3][2]~q\)) ) + ( \Add1~35\ ) + ( \Add1~34\ ))
-- \Add1~3\ = SHARE((!\data_i[2]~input_o\ & (sum(2) & !\filter_reg[3][2]~q\)) # (\data_i[2]~input_o\ & ((!\filter_reg[3][2]~q\) # (sum(2)))))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000001111110000001100000000000000001100001100111100",
	shared_arith => "on")
-- pragma translate_on
PORT MAP (
	datab => \ALT_INV_data_i[2]~input_o\,
	datac => ALT_INV_sum(2),
	datad => \ALT_INV_filter_reg[3][2]~q\,
	cin => \Add1~34\,
	sharein => \Add1~35\,
	sumout => \Add1~1_sumout\,
	cout => \Add1~2\,
	shareout => \Add1~3\);

-- Location: FF_X18_Y1_N11
\sum[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_i~inputCLKENA0_outclk\,
	d => \Add1~1_sumout\,
	clrn => \ALT_INV_rst_i~input_o\,
	ena => \strb_data_valid_i~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => sum(2));

-- Location: IOIBUF_X18_Y0_N58
\data_i[3]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_data_i(3),
	o => \data_i[3]~input_o\);

-- Location: FF_X17_Y1_N5
\filter_reg[0][3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_i~inputCLKENA0_outclk\,
	asdata => \data_i[3]~input_o\,
	clrn => \ALT_INV_rst_i~input_o\,
	sload => VCC,
	ena => \strb_data_valid_i~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \filter_reg[0][3]~q\);

-- Location: FF_X17_Y1_N35
\filter_reg[1][3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_i~inputCLKENA0_outclk\,
	asdata => \filter_reg[0][3]~q\,
	clrn => \ALT_INV_rst_i~input_o\,
	sload => VCC,
	ena => \strb_data_valid_i~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \filter_reg[1][3]~q\);

-- Location: LABCELL_X17_Y1_N30
\filter_reg[2][3]~feeder\ : cyclonev_lcell_comb
-- Equation(s):
-- \filter_reg[2][3]~feeder_combout\ = ( \filter_reg[1][3]~q\ )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000011111111111111111111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataf => \ALT_INV_filter_reg[1][3]~q\,
	combout => \filter_reg[2][3]~feeder_combout\);

-- Location: FF_X17_Y1_N31
\filter_reg[2][3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_i~inputCLKENA0_outclk\,
	d => \filter_reg[2][3]~feeder_combout\,
	clrn => \ALT_INV_rst_i~input_o\,
	ena => \strb_data_valid_i~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \filter_reg[2][3]~q\);

-- Location: LABCELL_X18_Y1_N51
\filter_reg[3][3]~feeder\ : cyclonev_lcell_comb
-- Equation(s):
-- \filter_reg[3][3]~feeder_combout\ = ( \filter_reg[2][3]~q\ )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000011111111111111111111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataf => \ALT_INV_filter_reg[2][3]~q\,
	combout => \filter_reg[3][3]~feeder_combout\);

-- Location: FF_X18_Y1_N53
\filter_reg[3][3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_i~inputCLKENA0_outclk\,
	d => \filter_reg[3][3]~feeder_combout\,
	clrn => \ALT_INV_rst_i~input_o\,
	ena => \strb_data_valid_i~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \filter_reg[3][3]~q\);

-- Location: LABCELL_X18_Y1_N12
\Add1~5\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add1~5_sumout\ = SUM(( !sum(3) $ (!\filter_reg[3][3]~q\ $ (!\data_i[3]~input_o\)) ) + ( \Add1~3\ ) + ( \Add1~2\ ))
-- \Add1~6\ = CARRY(( !sum(3) $ (!\filter_reg[3][3]~q\ $ (!\data_i[3]~input_o\)) ) + ( \Add1~3\ ) + ( \Add1~2\ ))
-- \Add1~7\ = SHARE((!sum(3) & (!\filter_reg[3][3]~q\ & \data_i[3]~input_o\)) # (sum(3) & ((!\filter_reg[3][3]~q\) # (\data_i[3]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000001100001111001100000000000000001100001100111100",
	shared_arith => "on")
-- pragma translate_on
PORT MAP (
	datab => ALT_INV_sum(3),
	datac => \ALT_INV_filter_reg[3][3]~q\,
	datad => \ALT_INV_data_i[3]~input_o\,
	cin => \Add1~2\,
	sharein => \Add1~3\,
	sumout => \Add1~5_sumout\,
	cout => \Add1~6\,
	shareout => \Add1~7\);

-- Location: FF_X18_Y1_N14
\sum[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_i~inputCLKENA0_outclk\,
	d => \Add1~5_sumout\,
	clrn => \ALT_INV_rst_i~input_o\,
	ena => \strb_data_valid_i~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => sum(3));

-- Location: IOIBUF_X18_Y0_N75
\data_i[4]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_data_i(4),
	o => \data_i[4]~input_o\);

-- Location: FF_X18_Y1_N34
\filter_reg[0][4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_i~inputCLKENA0_outclk\,
	asdata => \data_i[4]~input_o\,
	clrn => \ALT_INV_rst_i~input_o\,
	sload => VCC,
	ena => \strb_data_valid_i~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \filter_reg[0][4]~q\);

-- Location: FF_X19_Y1_N50
\filter_reg[1][4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_i~inputCLKENA0_outclk\,
	asdata => \filter_reg[0][4]~q\,
	clrn => \ALT_INV_rst_i~input_o\,
	sload => VCC,
	ena => \strb_data_valid_i~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \filter_reg[1][4]~q\);

-- Location: LABCELL_X19_Y1_N51
\filter_reg[2][4]~feeder\ : cyclonev_lcell_comb
-- Equation(s):
-- \filter_reg[2][4]~feeder_combout\ = ( \filter_reg[1][4]~q\ )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000011111111111111111111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataf => \ALT_INV_filter_reg[1][4]~q\,
	combout => \filter_reg[2][4]~feeder_combout\);

-- Location: FF_X19_Y1_N53
\filter_reg[2][4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_i~inputCLKENA0_outclk\,
	d => \filter_reg[2][4]~feeder_combout\,
	clrn => \ALT_INV_rst_i~input_o\,
	ena => \strb_data_valid_i~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \filter_reg[2][4]~q\);

-- Location: LABCELL_X18_Y1_N57
\filter_reg[3][4]~feeder\ : cyclonev_lcell_comb
-- Equation(s):
-- \filter_reg[3][4]~feeder_combout\ = ( \filter_reg[2][4]~q\ )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000011111111111111111111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataf => \ALT_INV_filter_reg[2][4]~q\,
	combout => \filter_reg[3][4]~feeder_combout\);

-- Location: FF_X18_Y1_N59
\filter_reg[3][4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_i~inputCLKENA0_outclk\,
	d => \filter_reg[3][4]~feeder_combout\,
	clrn => \ALT_INV_rst_i~input_o\,
	ena => \strb_data_valid_i~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \filter_reg[3][4]~q\);

-- Location: LABCELL_X18_Y1_N15
\Add1~9\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add1~9_sumout\ = SUM(( !\data_i[4]~input_o\ $ (!sum(4) $ (!\filter_reg[3][4]~q\)) ) + ( \Add1~7\ ) + ( \Add1~6\ ))
-- \Add1~10\ = CARRY(( !\data_i[4]~input_o\ $ (!sum(4) $ (!\filter_reg[3][4]~q\)) ) + ( \Add1~7\ ) + ( \Add1~6\ ))
-- \Add1~11\ = SHARE((!\data_i[4]~input_o\ & (sum(4) & !\filter_reg[3][4]~q\)) # (\data_i[4]~input_o\ & ((!\filter_reg[3][4]~q\) # (sum(4)))))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000010111110000010100000000000000001010010101011010",
	shared_arith => "on")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_data_i[4]~input_o\,
	datac => ALT_INV_sum(4),
	datad => \ALT_INV_filter_reg[3][4]~q\,
	cin => \Add1~6\,
	sharein => \Add1~7\,
	sumout => \Add1~9_sumout\,
	cout => \Add1~10\,
	shareout => \Add1~11\);

-- Location: FF_X18_Y1_N17
\sum[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_i~inputCLKENA0_outclk\,
	d => \Add1~9_sumout\,
	clrn => \ALT_INV_rst_i~input_o\,
	ena => \strb_data_valid_i~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => sum(4));

-- Location: IOIBUF_X16_Y0_N35
\data_i[5]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_data_i(5),
	o => \data_i[5]~input_o\);

-- Location: FF_X16_Y1_N8
\filter_reg[0][5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_i~inputCLKENA0_outclk\,
	asdata => \data_i[5]~input_o\,
	clrn => \ALT_INV_rst_i~input_o\,
	sload => VCC,
	ena => \strb_data_valid_i~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \filter_reg[0][5]~q\);

-- Location: FF_X16_Y1_N25
\filter_reg[1][5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_i~inputCLKENA0_outclk\,
	asdata => \filter_reg[0][5]~q\,
	clrn => \ALT_INV_rst_i~input_o\,
	sload => VCC,
	ena => \strb_data_valid_i~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \filter_reg[1][5]~q\);

-- Location: LABCELL_X17_Y1_N15
\filter_reg[2][5]~feeder\ : cyclonev_lcell_comb
-- Equation(s):
-- \filter_reg[2][5]~feeder_combout\ = ( \filter_reg[1][5]~q\ )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000011111111111111111111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataf => \ALT_INV_filter_reg[1][5]~q\,
	combout => \filter_reg[2][5]~feeder_combout\);

-- Location: FF_X17_Y1_N16
\filter_reg[2][5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_i~inputCLKENA0_outclk\,
	d => \filter_reg[2][5]~feeder_combout\,
	clrn => \ALT_INV_rst_i~input_o\,
	ena => \strb_data_valid_i~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \filter_reg[2][5]~q\);

-- Location: LABCELL_X18_Y1_N36
\filter_reg[3][5]~feeder\ : cyclonev_lcell_comb
-- Equation(s):
-- \filter_reg[3][5]~feeder_combout\ = ( \filter_reg[2][5]~q\ )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000011111111111111111111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataf => \ALT_INV_filter_reg[2][5]~q\,
	combout => \filter_reg[3][5]~feeder_combout\);

-- Location: FF_X18_Y1_N38
\filter_reg[3][5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_i~inputCLKENA0_outclk\,
	d => \filter_reg[3][5]~feeder_combout\,
	clrn => \ALT_INV_rst_i~input_o\,
	ena => \strb_data_valid_i~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \filter_reg[3][5]~q\);

-- Location: LABCELL_X18_Y1_N18
\Add1~13\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add1~13_sumout\ = SUM(( !\data_i[5]~input_o\ $ (!sum(5) $ (!\filter_reg[3][5]~q\)) ) + ( \Add1~11\ ) + ( \Add1~10\ ))
-- \Add1~14\ = CARRY(( !\data_i[5]~input_o\ $ (!sum(5) $ (!\filter_reg[3][5]~q\)) ) + ( \Add1~11\ ) + ( \Add1~10\ ))
-- \Add1~15\ = SHARE((!\data_i[5]~input_o\ & (sum(5) & !\filter_reg[3][5]~q\)) # (\data_i[5]~input_o\ & ((!\filter_reg[3][5]~q\) # (sum(5)))))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000010111110000010100000000000000001010010101011010",
	shared_arith => "on")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_data_i[5]~input_o\,
	datac => ALT_INV_sum(5),
	datad => \ALT_INV_filter_reg[3][5]~q\,
	cin => \Add1~10\,
	sharein => \Add1~11\,
	sumout => \Add1~13_sumout\,
	cout => \Add1~14\,
	shareout => \Add1~15\);

-- Location: FF_X18_Y1_N20
\sum[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_i~inputCLKENA0_outclk\,
	d => \Add1~13_sumout\,
	clrn => \ALT_INV_rst_i~input_o\,
	ena => \strb_data_valid_i~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => sum(5));

-- Location: IOIBUF_X16_Y0_N52
\data_i[6]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_data_i(6),
	o => \data_i[6]~input_o\);

-- Location: LABCELL_X17_Y1_N6
\filter_reg[0][6]~feeder\ : cyclonev_lcell_comb
-- Equation(s):
-- \filter_reg[0][6]~feeder_combout\ = ( \data_i[6]~input_o\ )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000011111111111111111111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataf => \ALT_INV_data_i[6]~input_o\,
	combout => \filter_reg[0][6]~feeder_combout\);

-- Location: FF_X17_Y1_N8
\filter_reg[0][6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_i~inputCLKENA0_outclk\,
	d => \filter_reg[0][6]~feeder_combout\,
	clrn => \ALT_INV_rst_i~input_o\,
	ena => \strb_data_valid_i~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \filter_reg[0][6]~q\);

-- Location: LABCELL_X17_Y1_N21
\filter_reg[1][6]~feeder\ : cyclonev_lcell_comb
-- Equation(s):
-- \filter_reg[1][6]~feeder_combout\ = ( \filter_reg[0][6]~q\ )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000011111111111111111111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataf => \ALT_INV_filter_reg[0][6]~q\,
	combout => \filter_reg[1][6]~feeder_combout\);

-- Location: FF_X17_Y1_N22
\filter_reg[1][6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_i~inputCLKENA0_outclk\,
	d => \filter_reg[1][6]~feeder_combout\,
	clrn => \ALT_INV_rst_i~input_o\,
	ena => \strb_data_valid_i~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \filter_reg[1][6]~q\);

-- Location: LABCELL_X17_Y1_N18
\filter_reg[2][6]~feeder\ : cyclonev_lcell_comb
-- Equation(s):
-- \filter_reg[2][6]~feeder_combout\ = ( \filter_reg[1][6]~q\ )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000011111111111111111111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataf => \ALT_INV_filter_reg[1][6]~q\,
	combout => \filter_reg[2][6]~feeder_combout\);

-- Location: FF_X17_Y1_N19
\filter_reg[2][6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_i~inputCLKENA0_outclk\,
	d => \filter_reg[2][6]~feeder_combout\,
	clrn => \ALT_INV_rst_i~input_o\,
	ena => \strb_data_valid_i~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \filter_reg[2][6]~q\);

-- Location: LABCELL_X18_Y1_N48
\filter_reg[3][6]~feeder\ : cyclonev_lcell_comb
-- Equation(s):
-- \filter_reg[3][6]~feeder_combout\ = ( \filter_reg[2][6]~q\ )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000011111111111111111111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataf => \ALT_INV_filter_reg[2][6]~q\,
	combout => \filter_reg[3][6]~feeder_combout\);

-- Location: FF_X18_Y1_N49
\filter_reg[3][6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_i~inputCLKENA0_outclk\,
	d => \filter_reg[3][6]~feeder_combout\,
	clrn => \ALT_INV_rst_i~input_o\,
	ena => \strb_data_valid_i~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \filter_reg[3][6]~q\);

-- Location: LABCELL_X18_Y1_N21
\Add1~17\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add1~17_sumout\ = SUM(( !\data_i[6]~input_o\ $ (!\filter_reg[3][6]~q\ $ (!sum(6))) ) + ( \Add1~15\ ) + ( \Add1~14\ ))
-- \Add1~18\ = CARRY(( !\data_i[6]~input_o\ $ (!\filter_reg[3][6]~q\ $ (!sum(6))) ) + ( \Add1~15\ ) + ( \Add1~14\ ))
-- \Add1~19\ = SHARE((!\data_i[6]~input_o\ & (!\filter_reg[3][6]~q\ & sum(6))) # (\data_i[6]~input_o\ & ((!\filter_reg[3][6]~q\) # (sum(6)))))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000001100001111001100000000000000001100001100111100",
	shared_arith => "on")
-- pragma translate_on
PORT MAP (
	datab => \ALT_INV_data_i[6]~input_o\,
	datac => \ALT_INV_filter_reg[3][6]~q\,
	datad => ALT_INV_sum(6),
	cin => \Add1~14\,
	sharein => \Add1~15\,
	sumout => \Add1~17_sumout\,
	cout => \Add1~18\,
	shareout => \Add1~19\);

-- Location: FF_X18_Y1_N23
\sum[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_i~inputCLKENA0_outclk\,
	d => \Add1~17_sumout\,
	clrn => \ALT_INV_rst_i~input_o\,
	ena => \strb_data_valid_i~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => sum(6));

-- Location: IOIBUF_X18_Y0_N41
\data_i[7]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_data_i(7),
	o => \data_i[7]~input_o\);

-- Location: FF_X17_Y1_N28
\filter_reg[0][7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_i~inputCLKENA0_outclk\,
	asdata => \data_i[7]~input_o\,
	clrn => \ALT_INV_rst_i~input_o\,
	sload => VCC,
	ena => \strb_data_valid_i~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \filter_reg[0][7]~q\);

-- Location: LABCELL_X17_Y1_N48
\filter_reg[1][7]~feeder\ : cyclonev_lcell_comb
-- Equation(s):
-- \filter_reg[1][7]~feeder_combout\ = ( \filter_reg[0][7]~q\ )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000011111111111111111111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataf => \ALT_INV_filter_reg[0][7]~q\,
	combout => \filter_reg[1][7]~feeder_combout\);

-- Location: FF_X17_Y1_N50
\filter_reg[1][7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_i~inputCLKENA0_outclk\,
	d => \filter_reg[1][7]~feeder_combout\,
	clrn => \ALT_INV_rst_i~input_o\,
	ena => \strb_data_valid_i~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \filter_reg[1][7]~q\);

-- Location: LABCELL_X17_Y1_N51
\filter_reg[2][7]~feeder\ : cyclonev_lcell_comb
-- Equation(s):
-- \filter_reg[2][7]~feeder_combout\ = ( \filter_reg[1][7]~q\ )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000011111111111111111111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataf => \ALT_INV_filter_reg[1][7]~q\,
	combout => \filter_reg[2][7]~feeder_combout\);

-- Location: FF_X17_Y1_N52
\filter_reg[2][7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_i~inputCLKENA0_outclk\,
	d => \filter_reg[2][7]~feeder_combout\,
	clrn => \ALT_INV_rst_i~input_o\,
	ena => \strb_data_valid_i~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \filter_reg[2][7]~q\);

-- Location: LABCELL_X18_Y1_N45
\filter_reg[3][7]~feeder\ : cyclonev_lcell_comb
-- Equation(s):
-- \filter_reg[3][7]~feeder_combout\ = ( \filter_reg[2][7]~q\ )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000011111111111111111111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataf => \ALT_INV_filter_reg[2][7]~q\,
	combout => \filter_reg[3][7]~feeder_combout\);

-- Location: FF_X18_Y1_N47
\filter_reg[3][7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_i~inputCLKENA0_outclk\,
	d => \filter_reg[3][7]~feeder_combout\,
	clrn => \ALT_INV_rst_i~input_o\,
	ena => \strb_data_valid_i~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \filter_reg[3][7]~q\);

-- Location: LABCELL_X18_Y1_N24
\Add1~21\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add1~21_sumout\ = SUM(( !\data_i[7]~input_o\ $ (!sum(7) $ (!\filter_reg[3][7]~q\)) ) + ( \Add1~19\ ) + ( \Add1~18\ ))
-- \Add1~22\ = CARRY(( !\data_i[7]~input_o\ $ (!sum(7) $ (!\filter_reg[3][7]~q\)) ) + ( \Add1~19\ ) + ( \Add1~18\ ))
-- \Add1~23\ = SHARE((!\data_i[7]~input_o\ & (sum(7) & !\filter_reg[3][7]~q\)) # (\data_i[7]~input_o\ & ((!\filter_reg[3][7]~q\) # (sum(7)))))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000010111110000010100000000000000001010010101011010",
	shared_arith => "on")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_data_i[7]~input_o\,
	datac => ALT_INV_sum(7),
	datad => \ALT_INV_filter_reg[3][7]~q\,
	cin => \Add1~18\,
	sharein => \Add1~19\,
	sumout => \Add1~21_sumout\,
	cout => \Add1~22\,
	shareout => \Add1~23\);

-- Location: FF_X18_Y1_N26
\sum[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_i~inputCLKENA0_outclk\,
	d => \Add1~21_sumout\,
	clrn => \ALT_INV_rst_i~input_o\,
	ena => \strb_data_valid_i~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => sum(7));

-- Location: LABCELL_X18_Y1_N27
\Add1~25\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add1~25_sumout\ = SUM(( !\data_i[7]~input_o\ $ (!\filter_reg[3][7]~q\ $ (!sum(8))) ) + ( \Add1~23\ ) + ( \Add1~22\ ))
-- \Add1~26\ = CARRY(( !\data_i[7]~input_o\ $ (!\filter_reg[3][7]~q\ $ (!sum(8))) ) + ( \Add1~23\ ) + ( \Add1~22\ ))
-- \Add1~27\ = SHARE((!\data_i[7]~input_o\ & (!\filter_reg[3][7]~q\ & sum(8))) # (\data_i[7]~input_o\ & ((!\filter_reg[3][7]~q\) # (sum(8)))))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000010100001111010100000000000000001010010101011010",
	shared_arith => "on")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_data_i[7]~input_o\,
	datac => \ALT_INV_filter_reg[3][7]~q\,
	datad => ALT_INV_sum(8),
	cin => \Add1~22\,
	sharein => \Add1~23\,
	sumout => \Add1~25_sumout\,
	cout => \Add1~26\,
	shareout => \Add1~27\);

-- Location: FF_X18_Y1_N29
\sum[8]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_i~inputCLKENA0_outclk\,
	d => \Add1~25_sumout\,
	clrn => \ALT_INV_rst_i~input_o\,
	ena => \strb_data_valid_i~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => sum(8));

-- Location: LABCELL_X18_Y1_N30
\Add1~29\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add1~29_sumout\ = SUM(( !\data_i[7]~input_o\ $ (!sum(9) $ (!\filter_reg[3][7]~q\)) ) + ( \Add1~27\ ) + ( \Add1~26\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000000001001100101100110",
	shared_arith => "on")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_data_i[7]~input_o\,
	datab => ALT_INV_sum(9),
	datad => \ALT_INV_filter_reg[3][7]~q\,
	cin => \Add1~26\,
	sharein => \Add1~27\,
	sumout => \Add1~29_sumout\);

-- Location: FF_X18_Y1_N32
\sum[9]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_i~inputCLKENA0_outclk\,
	d => \Add1~29_sumout\,
	clrn => \ALT_INV_rst_i~input_o\,
	ena => \strb_data_valid_i~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => sum(9));

-- Location: LABCELL_X43_Y35_N0
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


