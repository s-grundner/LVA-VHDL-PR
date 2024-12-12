onerror {resume}
add list -width 43 /tl_tb/tb_dut/servo_x_ent/encoded_angle_i
add list /tl_tb/tb_dut/servo_y_ent/encoded_angle_i
add list /tl_tb/tb_dut/servo_z_ent/encoded_angle_i
configure list -usestrobe 0
configure list -strobestart {0 ps} -strobeperiod {0 ps}
configure list -usesignaltrigger 1
configure list -delta all
configure list -signalnamewidth 0
configure list -datasetprefix 0
configure list -namelimit 5
