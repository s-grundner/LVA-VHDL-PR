onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -color Cyan -label CLK /pwm_tb/tb_clk
add wave -noupdate -color Red -label RST /pwm_tb/tb_rst
add wave -noupdate -color {Medium Orchid} -label Period /pwm_tb/tb_Period_counter_val
add wave -noupdate -color {Lime Green} -label {Duty Cycle} /pwm_tb/tb_ON_counter_val
add wave -noupdate -color Yellow -label PWM-Out /pwm_tb/tb_PWM_pin
add wave -noupdate -color Salmon -label Count /pwm_tb/pwm_dut/count
add wave -noupdate -color Orange -label {Count RST Flag} /pwm_tb/pwm_dut/count_reset_flag
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {99061 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 119
configure wave -valuecolwidth 48
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
WaveRestoreZoom {0 ps} {2409906 ps}
