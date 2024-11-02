onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /delta_adc_tb/tb_clk
add wave -noupdate /delta_adc_tb/tb_rst
add wave -noupdate /delta_adc_tb/tb_PWM
add wave -noupdate /delta_adc_tb/tb_ADC_valid_strobe
add wave -noupdate /delta_adc_tb/tb_ADC_Value
add wave -noupdate /delta_adc_tb/tb_Comparator
add wave -noupdate /delta_adc_tb/delta_adc_dut/sampling_strobe
add wave -noupdate /delta_adc_tb/delta_adc_dut/prev_comp
add wave -noupdate /delta_adc_tb/delta_adc_dut/pwm_ent/Period_counter_val_i
add wave -noupdate /delta_adc_tb/delta_adc_dut/pwm_ent/ON_counter_val_i
add wave -noupdate /delta_adc_tb/delta_adc_dut/pwm_ent/PWM_o
add wave -noupdate /delta_adc_tb/delta_adc_dut/pwm_ent/count
add wave -noupdate /delta_adc_tb/delta_adc_dut/pwm_ent/count_reset_flag
add wave -noupdate /delta_adc_tb/delta_adc_dut/pwm_ent/next_pwm
add wave -noupdate /delta_adc_tb/delta_adc_dut/pwm_ent/counter_ent/counter_o
add wave -noupdate /delta_adc_tb/delta_adc_dut/pwm_ent/counter_ent/next_cnt
add wave -noupdate /delta_adc_tb/delta_adc_dut/sampling_strobe_ent/strb_o
add wave -noupdate /delta_adc_tb/delta_adc_dut/sampling_strobe_ent/next_strobe
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {515000 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 401
configure wave -valuecolwidth 100
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
WaveRestoreZoom {0 ps} {1974 ns}
