# Design
set ::env(DESIGN_NAME) "fft8_dif"

# All RTL source files
set ::env(VERILOG_FILES) "\
    $::env(DESIGN_DIR)/src/fft8_dif.v \
    $::env(DESIGN_DIR)/src/fft_sdf_stg.v \
    $::env(DESIGN_DIR)/src/fifo.v \
    $::env(DESIGN_DIR)/src/dff.v \
    $::env(DESIGN_DIR)/src/butterfly_unit.v \
    $::env(DESIGN_DIR)/src/modulo_N_counter.v \
    $::env(DESIGN_DIR)/src/rotator.v \
    $::env(DESIGN_DIR)/src/stg_fsm.v \
    $::env(DESIGN_DIR)/src/stg_mux.v \
    $::env(DESIGN_DIR)/src/valid_out_gen.v"

# Clock definition
set ::env(CLOCK_PORT) "clk"
set ::env(CLOCK_NET)   $::env(CLOCK_PORT)
set ::env(CLOCK_PERIOD) 25.0
set ::env(SDC_FILE)    "$::env(DESIGN_DIR)/constraints.sdc"
set ::env(SYNTH_MAX_FANOUT) 24



# Include cell library config if it exists
set filename $::env(DESIGN_DIR)/$::env(PDK)_$::env(STD_CELL_LIBRARY)_config.tcl
if { [file exists $filename] == 1 } {
    source $filename
}

