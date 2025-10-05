vlib work
vmap work work

vcom -work work counter_ea.vhd
vcom -work work fsm_ea.vhd
vcom -work work sync_ea.vhd
vcom -work work blink_board_ea.vhd
vcom -work work blink_board_tb.vhd

vsim work.blink_board_tb

add wave -noupdate -color Cyan -label CLK /blink_board_tb/tb_clk
add wave -noupdate -color Red -label RST /blink_board_tb/tb_rst
add wave -noupdate -label {Start Button (Async)} /blink_board_tb/tb_start_button
add wave -noupdate -label {Start Button (Sync)} /blink_board_tb/dut_blink/sync_start_button
add wave -noupdate -color Yellow -label {LED Output} /blink_board_tb/tb_led
add wave -noupdate -color Orange -label {CNT RST} /blink_board_tb/dut_blink/counter_rst_strobe
add wave -noupdate -color {Medium Aquamarine} -label CNT -radix unsigned /blink_board_tb/dut_blink/counter
add wave -noupdate -label {FSM State} /blink_board_tb/dut_blink/fsm_ent/curr_state
add wave -noupdate -label {FSM Next State} /blink_board_tb/dut_blink/fsm_ent/next_state

run 20000 ns

WaveRestoreZoom {0 ps} {5000000 ps}	