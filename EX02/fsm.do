vlib work
vmap work work

vcom -work work counter_e.vhd
vcom -work work counter_a.vhd
vcom -work work fsm_e.vhd
vcom -work work fsm_a.vhd
vcom -work work fsm_tb.vhd

vsim work.fsm_tb

add wave -r -color Cyan 			-label {CLK} 			/fsm_tb/tb_clk
add wave -r -color Red 				-label {RST} 			/fsm_tb/tb_rst
add wave -r -color {Medium Orchid} 	-label {Start Button} 	/fsm_tb/tb_start_button
add wave -r -color {Lime Green}		-label {LED Output} 	/fsm_tb/tb_led
add wave -r -color Yellow 			-label {Restart Strobe} /fsm_tb/tb_counter_restart_strobe
add wave -r -color Salmon 			-label {Counter} 		/fsm_tb/tb_counter_value
add wave -r -color Orange 			-label {FSM State} 		/fsm_tb/dut_fsm/fsm_state
add wave -r -color Orange 			-label {FSM Next State} /fsm_tb/dut_fsm/next_fsm_state

configure wave -namecolwidth 238
configure wave -valuecolwidth 169

run 2000 ns

WaveRestoreZoom {0 ps} {2000000 ps}	