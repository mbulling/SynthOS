# run_synthesis.tcl

# arguments passed from the bash script
set SYNTHESIS_FLAGS [lindex $argv 0]

# create new Vivado HLS project
open_project hls_proj

# set top-level function
set_top matrix_multiplication

# add source files
add_files -cflags "$SYNTHESIS_FLAGS" matrix_multiplication.cpp
add_files -tb -cflags "$SYNTHESIS_FLAGS" matrix_multiplication_test.cpp

# add header file
add_files matrix_multiplication.h

# specify target part
set_part {xc7z020clg484-1}

# create solution and set the synthesis options
open_solution "solution1"
set_directive_unroll -factor 16 "matrix_multiplication/matrix_multiplication_loop"
create_clock -period 10 -name default

# run C synthesis
csynth_design

# run RTL co-simulation (optional)
cosim_design

# export RTL design
export_design

# close project
close_project
