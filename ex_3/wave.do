onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /pwm_tb/tb_clk
add wave -noupdate /pwm_tb/tb_rst
add wave -noupdate /pwm_tb/tb_Period_counter_val
add wave -noupdate /pwm_tb/tb_ON_counter_val
add wave -noupdate /pwm_tb/tb_PWM_pin
add wave -noupdate /pwm_tb/pwm_dut/clk_i
add wave -noupdate /pwm_tb/pwm_dut/rst_i
add wave -noupdate /pwm_tb/pwm_dut/Period_counter_val_i
add wave -noupdate /pwm_tb/pwm_dut/ON_counter_val_i
add wave -noupdate /pwm_tb/pwm_dut/PWM_pin_o
add wave -noupdate /pwm_tb/pwm_dut/count
add wave -noupdate /pwm_tb/pwm_dut/count_reset_flag
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {109215 ps} 0}
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
WaveRestoreZoom {0 ps} {2 us}
