vlog -sv +acc +cover -covercells *.v
vsim -voptargs=+acc work.fft_dif_tb -cover
do wave.do
coverage save fft_dif_tb.ucdb -onexit
run -all
# vcover report fft_dif_tb.ucdb -details -annotate -output fft_dif_coverage_report.txt