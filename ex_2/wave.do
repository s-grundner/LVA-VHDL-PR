onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -color Cyan -label CLK /fsm_tb/tb_clk
add wave -noupdate -color Red -label RST /fsm_tb/tb_rst
add wave -noupdate -color {Medium Orchid} -label {Start Button} /fsm_tb/tb_start_button
add wave -noupdate -color {Lime Green} -label {LED Output} /fsm_tb/tb_led
add wave -noupdate -color Yellow -label {Restart Strobe} /fsm_tb/tb_counter_restart_strobe
add wave -noupdate -color Salmon -label Counter /fsm_tb/tb_counter_value
add wave -noupdate -color Orange -label {FSM State} /fsm_tb/dut_fsm/fsm_state
add wave -noupdate -color Orange -label {FSM Next State} /fsm_tb/dut_fsm/next_fsm_state
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 2} {91733 ps} 0} {{Cursor 3} {22104 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 238
configure wave -valuecolwidth 169
configure wave -justifyvalue left
configure wave -signalnamewidth 0
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ps
update
WaveRestoreZoom {0 ps} {2326481 ps}
