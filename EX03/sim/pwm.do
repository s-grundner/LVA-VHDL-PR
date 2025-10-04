vlib work
vmap work work

# Reuse Modules
vcom -work work ../../entities/counter_ea.vhd

# New Modules
vcom -work work ../pwm_e.vhd
vcom -work work ../pwm_a.vhd

# Testbench
vcom -work work ../test/pwm_tb.vhd

vsim work.pwm_tb

add wave -noupdate -color {Cyan} 			-label {CLK} 		/pwm_tb/tb_clk
add wave -noupdate -color {Red} 			-label {RST} 		/pwm_tb/tb_rst
add wave -noupdate -color {Medium Orchid} 	-label {Period} 	/pwm_tb/tb_period_cnt_val
add wave -noupdate -color {Lime Green} 		-label {Duty Cycle} /pwm_tb/tb_on_cnt_val
add wave -noupdate -color {Yellow} 			-label {PWM-Out} 	/pwm_tb/tb_pwm
add wave -noupdate -color {Salmon} 			-label {Count} 		/pwm_tb/pwm_dut/cnt
add wave -noupdate -color {Orange} 			-label {Count RST Flag} /pwm_tb/pwm_dut/sync_rst

configure wave -namecolwidth 119
configure wave -valuecolwidth 48

run 2000 ns

WaveRestoreZoom {0 ps} {2000000 ps}	