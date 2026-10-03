onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -expand -group {TB SIGNALS} -radix decimal /fft_dif_tb/clk
add wave -noupdate -expand -group {TB SIGNALS} -radix decimal /fft_dif_tb/valid_in
add wave -noupdate -expand -group {TB SIGNALS} -radix decimal /fft_dif_tb/in_r
add wave -noupdate -expand -group {TB SIGNALS} -radix decimal /fft_dif_tb/in_i
add wave -noupdate -expand -group {TB SIGNALS} /fft_dif_tb/valid_out
add wave -noupdate -expand -group {TB SIGNALS} -radix decimal /fft_dif_tb/out_r
add wave -noupdate -expand -group {TB SIGNALS} -radix decimal /fft_dif_tb/out_i
add wave -noupdate -expand -group {TB SIGNALS} -radix decimal /fft_dif_tb/rst_n
add wave -noupdate -expand -group STG1 -radix decimal /fft_dif_tb/dut/fft_stg1/in_r
add wave -noupdate -expand -group STG1 -radix decimal /fft_dif_tb/dut/fft_stg1/in_i
add wave -noupdate -expand -group STG1 /fft_dif_tb/clk
add wave -noupdate -expand -group STG1 -radix decimal /fft_dif_tb/dut/fft_stg1/stg_out_r
add wave -noupdate -expand -group STG1 -radix decimal /fft_dif_tb/dut/fft_stg1/stg_out_i
add wave -noupdate -expand -group STG1 -expand -group {STG1 ROT} -radix decimal /fft_dif_tb/dut/fft_stg1/genblk1/rotator_u0/in_r
add wave -noupdate -expand -group STG1 -expand -group {STG1 ROT} -radix decimal /fft_dif_tb/dut/fft_stg1/genblk1/rotator_u0/in_i
add wave -noupdate -expand -group STG1 -expand -group {STG1 ROT} -radix decimal /fft_dif_tb/dut/fft_stg1/genblk1/rotator_u0/out_r
add wave -noupdate -expand -group STG1 -expand -group {STG1 ROT} -radix decimal /fft_dif_tb/dut/fft_stg1/genblk1/rotator_u0/out_i
add wave -noupdate -expand -group STG1 -expand -group {STG1 ROT} -radix decimal /fft_dif_tb/dut/fft_stg1/genblk1/rotator_u0/rot_en
add wave -noupdate -expand -group STG1 -expand -group {STG1 ROT} -radix unsigned /fft_dif_tb/dut/fft_stg1/genblk1/rotator_u0/twiddle_sel
add wave -noupdate -expand -group STG1 -group {STG1 FIFO} -radix decimal /fft_dif_tb/dut/fft_stg1/fifo_u0/fifo_reg_r
add wave -noupdate -expand -group STG1 -group {STG1 FIFO} -radix decimal /fft_dif_tb/dut/fft_stg1/fifo_u0/fifo_reg_i
add wave -noupdate -expand -group STG1 -expand -group {STG1 FSM} -radix unsigned /fft_dif_tb/dut/fft_stg1/fsm_u0/current_state
add wave -noupdate -expand -group STG1 -expand -group {STG1 FSM} -radix unsigned /fft_dif_tb/dut/fft_stg1/fsm_u0/next_state
add wave -noupdate -expand -group STG1 -group {STG1 BF} -radix decimal /fft_dif_tb/dut/fft_stg1/bf_u0/a_r
add wave -noupdate -expand -group STG1 -group {STG1 BF} /fft_dif_tb/dut/fft_stg1/bf_u0/en
add wave -noupdate -expand -group STG1 -group {STG1 BF} -radix decimal /fft_dif_tb/dut/fft_stg1/bf_u0/a_i
add wave -noupdate -expand -group STG1 -group {STG1 BF} -radix decimal /fft_dif_tb/dut/fft_stg1/bf_u0/b_r
add wave -noupdate -expand -group STG1 -group {STG1 BF} -radix decimal /fft_dif_tb/dut/fft_stg1/bf_u0/b_i
add wave -noupdate -expand -group STG1 -group {STG1 BF} -radix decimal /fft_dif_tb/dut/fft_stg1/bf_u0/diff_r
add wave -noupdate -expand -group STG1 -group {STG1 BF} -radix decimal /fft_dif_tb/dut/fft_stg1/bf_u0/diff_i
add wave -noupdate -expand -group STG1 -group {STG1 BF} -radix decimal /fft_dif_tb/dut/fft_stg1/bf_u0/inter_diff_r
add wave -noupdate -expand -group STG1 -group {STG1 BF} -radix decimal /fft_dif_tb/dut/fft_stg1/bf_u0/inter_diff_i
add wave -noupdate -expand -group STG1 -group {STG1 BF} -radix decimal /fft_dif_tb/dut/fft_stg1/bf_u0/inter_sum_r
add wave -noupdate -expand -group STG1 -group {STG1 BF} -radix decimal /fft_dif_tb/dut/fft_stg1/bf_u0/inter_sum_i
add wave -noupdate -expand -group STG1 -group {STG1 BF} -radix decimal /fft_dif_tb/dut/fft_stg1/bf_u0/sum_r
add wave -noupdate -expand -group STG1 -group {STG1 BF} -radix decimal /fft_dif_tb/dut/fft_stg1/bf_u0/sum_i
add wave -noupdate -expand -group STG2 -radix decimal /fft_dif_tb/dut/fft_stg2/in_r
add wave -noupdate -expand -group STG2 -radix decimal /fft_dif_tb/dut/fft_stg2/in_i
add wave -noupdate -expand -group STG2 /fft_dif_tb/clk
add wave -noupdate -expand -group STG2 -radix decimal /fft_dif_tb/dut/fft_stg2/stg_out_r
add wave -noupdate -expand -group STG2 -radix decimal /fft_dif_tb/dut/fft_stg2/stg_out_i
add wave -noupdate -expand -group STG2 -radix decimal /fft_dif_tb/dut/fft_stg2/out_r
add wave -noupdate -expand -group STG2 -radix decimal /fft_dif_tb/dut/fft_stg2/out_i
add wave -noupdate -expand -group STG2 -group {STG2 FIFO} -radix decimal /fft_dif_tb/dut/fft_stg2/fifo_u0/fifo_reg_r
add wave -noupdate -expand -group STG2 -group {STG2 FIFO} -radix decimal /fft_dif_tb/dut/fft_stg2/fifo_u0/fifo_reg_i
add wave -noupdate -expand -group STG2 -expand -group {STG2 FSM} -radix unsigned /fft_dif_tb/dut/fft_stg2/fsm_u0/current_state
add wave -noupdate -expand -group STG2 -expand -group {STG2 FSM} -radix unsigned /fft_dif_tb/dut/fft_stg2/fsm_u0/next_state
add wave -noupdate -expand -group {STG2 ROT} -radix decimal /fft_dif_tb/dut/fft_stg2/genblk1/rotator_u0/in_r
add wave -noupdate -expand -group {STG2 ROT} -radix decimal /fft_dif_tb/dut/fft_stg2/genblk1/rotator_u0/in_i
add wave -noupdate -expand -group {STG2 ROT} -radix decimal /fft_dif_tb/dut/fft_stg2/genblk1/rotator_u0/out_r
add wave -noupdate -expand -group {STG2 ROT} -radix decimal /fft_dif_tb/dut/fft_stg2/genblk1/rotator_u0/out_i
add wave -noupdate -expand -group {STG2 ROT} -radix decimal /fft_dif_tb/dut/fft_stg2/genblk1/rotator_u0/rot_en
add wave -noupdate -expand -group {STG2 ROT} /fft_dif_tb/dut/fft_stg2/genblk1/rotator_u0/twiddle_sel
add wave -noupdate -group {STG2 BF} -radix decimal /fft_dif_tb/dut/fft_stg2/bf_u0/en
add wave -noupdate -group {STG2 BF} -radix decimal /fft_dif_tb/dut/fft_stg2/bf_u0/a_r
add wave -noupdate -group {STG2 BF} -radix decimal /fft_dif_tb/dut/fft_stg2/bf_u0/a_i
add wave -noupdate -group {STG2 BF} -radix decimal /fft_dif_tb/dut/fft_stg2/bf_u0/b_r
add wave -noupdate -group {STG2 BF} -radix decimal /fft_dif_tb/dut/fft_stg2/bf_u0/b_i
add wave -noupdate -group {STG2 BF} -radix decimal /fft_dif_tb/dut/fft_stg2/bf_u0/diff_r
add wave -noupdate -group {STG2 BF} -radix decimal /fft_dif_tb/dut/fft_stg2/bf_u0/diff_i
add wave -noupdate -group {STG2 BF} -radix decimal /fft_dif_tb/dut/fft_stg2/bf_u0/inter_diff_r
add wave -noupdate -group {STG2 BF} -radix decimal /fft_dif_tb/dut/fft_stg2/bf_u0/inter_diff_i
add wave -noupdate -group {STG2 BF} -radix decimal /fft_dif_tb/dut/fft_stg2/bf_u0/inter_sum_r
add wave -noupdate -group {STG2 BF} -radix decimal /fft_dif_tb/dut/fft_stg2/bf_u0/inter_sum_i
add wave -noupdate -group {STG2 BF} -radix decimal /fft_dif_tb/dut/fft_stg2/bf_u0/sum_r
add wave -noupdate -group {STG2 BF} -radix decimal /fft_dif_tb/dut/fft_stg2/bf_u0/sum_i
add wave -noupdate -group STG3 -expand -group {STG3 INTERFACE} -radix decimal /fft_dif_tb/dut/fft_stg3/stg_out_r
add wave -noupdate -group STG3 -expand -group {STG3 INTERFACE} -radix decimal /fft_dif_tb/dut/fft_stg3/stg_out_i
add wave -noupdate -group STG3 -expand -group {STG3 INTERFACE} -radix decimal /fft_dif_tb/dut/fft_stg3/in_r
add wave -noupdate -group STG3 -expand -group {STG3 INTERFACE} -radix decimal /fft_dif_tb/dut/fft_stg3/in_i
add wave -noupdate -group STG3 -expand -group {STG3 FSM} /fft_dif_tb/dut/fft_stg3/fsm_u0/fill_done
add wave -noupdate -group STG3 -expand -group {STG3 FSM} /fft_dif_tb/dut/fft_stg3/fsm_u0/current_state
add wave -noupdate -group STG3 -expand -group {STG3 FSM} /fft_dif_tb/dut/fft_stg3/fsm_u0/next_state
add wave -noupdate -group STG3 -expand -group STG3 -radix decimal /fft_dif_tb/dut/fft_stg3/fifo_u0/fifo_reg_r
add wave -noupdate -group STG3 -expand -group STG3 -radix decimal /fft_dif_tb/dut/fft_stg3/fifo_u0/fifo_reg_i
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {70137 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 161
configure wave -valuecolwidth 60
configure wave -justifyvalue left
configure wave -signalnamewidth 1
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
WaveRestoreZoom {27947 ps} {194273 ps}
