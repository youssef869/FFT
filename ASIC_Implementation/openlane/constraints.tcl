create_clock -name core_clk -period 18.0 [get_ports clk]

# Uncertainties (units = ns)
set_clock_uncertainty -setup 0.10 [get_clocks core_clk]  ;# 100 ps
set_clock_uncertainty -hold  0.20 [get_clocks core_clk]  ;# 200 ps
