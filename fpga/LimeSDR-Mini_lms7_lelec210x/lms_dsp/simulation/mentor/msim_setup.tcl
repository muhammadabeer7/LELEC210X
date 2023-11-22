
# (C) 2001-2023 Altera Corporation. All rights reserved.
# Your use of Altera Corporation's design tools, logic functions and 
# other software and tools, and its AMPP partner logic functions, and 
# any output files any of the foregoing (including device programming 
# or simulation files), and any associated documentation or information 
# are expressly subject to the terms and conditions of the Altera 
# Program License Subscription Agreement, Altera MegaCore Function 
# License Agreement, or other applicable license agreement, including, 
# without limitation, that your use is for the sole purpose of 
# programming logic devices manufactured by Altera and sold by Altera 
# or its authorized distributors. Please refer to the applicable 
# agreement for further details.

# ----------------------------------------
# Auto-generated simulation script msim_setup.tcl
# ----------------------------------------
# This script provides commands to simulate the following IP detected in
# your Quartus project:
#     lms_dsp
# 
# Altera recommends that you source this Quartus-generated IP simulation
# script from your own customized top-level script, and avoid editing this
# generated script.
# 
# To write a top-level script that compiles Altera simulation libraries and
# the Quartus-generated IP in your project, along with your design and
# testbench files, copy the text from the TOP-LEVEL TEMPLATE section below
# into a new file, e.g. named "mentor.do", and modify the text as directed.
# 
# ----------------------------------------
# # TOP-LEVEL TEMPLATE - BEGIN
# #
# # QSYS_SIMDIR is used in the Quartus-generated IP simulation script to
# # construct paths to the files required to simulate the IP in your Quartus
# # project. By default, the IP script assumes that you are launching the
# # simulator from the IP script location. If launching from another
# # location, set QSYS_SIMDIR to the output directory you specified when you
# # generated the IP script, relative to the directory from which you launch
# # the simulator.
# #
# set QSYS_SIMDIR <script generation output directory>
# #
# # Source the generated IP simulation script.
# source $QSYS_SIMDIR/mentor/msim_setup.tcl
# #
# # Set any compilation options you require (this is unusual).
# set USER_DEFINED_COMPILE_OPTIONS <compilation options>
# set USER_DEFINED_VHDL_COMPILE_OPTIONS <compilation options for VHDL>
# set USER_DEFINED_VERILOG_COMPILE_OPTIONS <compilation options for Verilog>
# #
# # Call command to compile the Quartus EDA simulation library.
# dev_com
# #
# # Call command to compile the Quartus-generated IP simulation files.
# com
# #
# # Add commands to compile all design files and testbench files, including
# # the top level. (These are all the files required for simulation other
# # than the files compiled by the Quartus-generated IP simulation script)
# #
# vlog <compilation options> <design and testbench files>
# #
# # Set the top-level simulation or testbench module/entity name, which is
# # used by the elab command to elaborate the top level.
# #
# set TOP_LEVEL_NAME <simulation top>
# #
# # Set any elaboration options you require.
# set USER_DEFINED_ELAB_OPTIONS <elaboration options>
# #
# # Call command to elaborate your design and testbench.
# elab
# #
# # Run the simulation.
# run -a
# #
# # Report success to the shell.
# exit -code 0
# #
# # TOP-LEVEL TEMPLATE - END
# ----------------------------------------
# 
# IP SIMULATION SCRIPT
# ----------------------------------------
# If lms_dsp is one of several IP cores in your
# Quartus project, you can generate a simulation script
# suitable for inclusion in your top-level simulation
# script by running the following command line:
# 
# ip-setup-simulation --quartus-project=<quartus project>
# 
# ip-setup-simulation will discover the Altera IP
# within the Quartus project, and generate a unified
# script which supports all the Altera IP within the design.
# ----------------------------------------
# ACDS 18.1 625 win32 2023.11.14.12:31:00

# ----------------------------------------
# Initialize variables
if ![info exists SYSTEM_INSTANCE_NAME] { 
  set SYSTEM_INSTANCE_NAME ""
} elseif { ![ string match "" $SYSTEM_INSTANCE_NAME ] } { 
  set SYSTEM_INSTANCE_NAME "/$SYSTEM_INSTANCE_NAME"
}

if ![info exists TOP_LEVEL_NAME] { 
  set TOP_LEVEL_NAME "lms_dsp"
}

if ![info exists QSYS_SIMDIR] { 
  set QSYS_SIMDIR "./../"
}

if ![info exists QUARTUS_INSTALL_DIR] { 
  set QUARTUS_INSTALL_DIR "C:/intelfpga_lite/18.1/quartus/"
}

if ![info exists USER_DEFINED_COMPILE_OPTIONS] { 
  set USER_DEFINED_COMPILE_OPTIONS ""
}
if ![info exists USER_DEFINED_VHDL_COMPILE_OPTIONS] { 
  set USER_DEFINED_VHDL_COMPILE_OPTIONS ""
}
if ![info exists USER_DEFINED_VERILOG_COMPILE_OPTIONS] { 
  set USER_DEFINED_VERILOG_COMPILE_OPTIONS ""
}
if ![info exists USER_DEFINED_ELAB_OPTIONS] { 
  set USER_DEFINED_ELAB_OPTIONS ""
}

# ----------------------------------------
# Initialize simulation properties - DO NOT MODIFY!
set ELAB_OPTIONS ""
set SIM_OPTIONS ""
if ![ string match "*-64 vsim*" [ vsim -version ] ] {
} else {
}

# ----------------------------------------
# Copy ROM/RAM files to simulation directory
alias file_copy {
  echo "\[exec\] file_copy"
}

# ----------------------------------------
# Create compilation libraries
proc ensure_lib { lib } { if ![file isdirectory $lib] { vlib $lib } }
ensure_lib          ./libraries/     
ensure_lib          ./libraries/work/
vmap       work     ./libraries/work/
vmap       work_lib ./libraries/work/
if ![ string match "*ModelSim ALTERA*" [ vsim -version ] ] {
  ensure_lib                  ./libraries/altera_ver/      
  vmap       altera_ver       ./libraries/altera_ver/      
  ensure_lib                  ./libraries/lpm_ver/         
  vmap       lpm_ver          ./libraries/lpm_ver/         
  ensure_lib                  ./libraries/sgate_ver/       
  vmap       sgate_ver        ./libraries/sgate_ver/       
  ensure_lib                  ./libraries/altera_mf_ver/   
  vmap       altera_mf_ver    ./libraries/altera_mf_ver/   
  ensure_lib                  ./libraries/altera_lnsim_ver/
  vmap       altera_lnsim_ver ./libraries/altera_lnsim_ver/
  ensure_lib                  ./libraries/fiftyfivenm_ver/ 
  vmap       fiftyfivenm_ver  ./libraries/fiftyfivenm_ver/ 
  ensure_lib                  ./libraries/altera/          
  vmap       altera           ./libraries/altera/          
  ensure_lib                  ./libraries/lpm/             
  vmap       lpm              ./libraries/lpm/             
  ensure_lib                  ./libraries/sgate/           
  vmap       sgate            ./libraries/sgate/           
  ensure_lib                  ./libraries/altera_mf/       
  vmap       altera_mf        ./libraries/altera_mf/       
  ensure_lib                  ./libraries/altera_lnsim/    
  vmap       altera_lnsim     ./libraries/altera_lnsim/    
  ensure_lib                  ./libraries/fiftyfivenm/     
  vmap       fiftyfivenm      ./libraries/fiftyfivenm/     
}
ensure_lib                             ./libraries/error_adapter_0/            
vmap       error_adapter_0             ./libraries/error_adapter_0/            
ensure_lib                             ./libraries/timing_adapter_1/           
vmap       timing_adapter_1            ./libraries/timing_adapter_1/           
ensure_lib                             ./libraries/timing_adapter_0/           
vmap       timing_adapter_0            ./libraries/timing_adapter_0/           
ensure_lib                             ./libraries/data_format_adapter_0/      
vmap       data_format_adapter_0       ./libraries/data_format_adapter_0/      
ensure_lib                             ./libraries/rst_controller/             
vmap       rst_controller              ./libraries/rst_controller/             
ensure_lib                             ./libraries/avalon_st_adapter_002/      
vmap       avalon_st_adapter_002       ./libraries/avalon_st_adapter_002/      
ensure_lib                             ./libraries/avalon_st_adapter_001/      
vmap       avalon_st_adapter_001       ./libraries/avalon_st_adapter_001/      
ensure_lib                             ./libraries/avalon_st_adapter/          
vmap       avalon_st_adapter           ./libraries/avalon_st_adapter/          
ensure_lib                             ./libraries/packet_presence_detection_0/
vmap       packet_presence_detection_0 ./libraries/packet_presence_detection_0/
ensure_lib                             ./libraries/fir_compiler_ii_0/          
vmap       fir_compiler_ii_0           ./libraries/fir_compiler_ii_0/          
ensure_lib                             ./libraries/FIFO2AVS_0/                 
vmap       FIFO2AVS_0                  ./libraries/FIFO2AVS_0/                 
ensure_lib                             ./libraries/AVS2FIFO_0/                 
vmap       AVS2FIFO_0                  ./libraries/AVS2FIFO_0/                 

# ----------------------------------------
# Compile device library files
alias dev_com {
  echo "\[exec\] dev_com"
  if ![ string match "*ModelSim ALTERA*" [ vsim -version ] ] {
    eval  vlog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS     "$QUARTUS_INSTALL_DIR/eda/sim_lib/altera_primitives.v"               -work altera_ver      
    eval  vlog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS     "$QUARTUS_INSTALL_DIR/eda/sim_lib/220model.v"                        -work lpm_ver         
    eval  vlog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS     "$QUARTUS_INSTALL_DIR/eda/sim_lib/sgate.v"                           -work sgate_ver       
    eval  vlog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS     "$QUARTUS_INSTALL_DIR/eda/sim_lib/altera_mf.v"                       -work altera_mf_ver   
    eval  vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QUARTUS_INSTALL_DIR/eda/sim_lib/altera_lnsim.sv"                   -work altera_lnsim_ver
    eval  vlog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS     "$QUARTUS_INSTALL_DIR/eda/sim_lib/fiftyfivenm_atoms.v"               -work fiftyfivenm_ver 
    eval  vlog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS     "$QUARTUS_INSTALL_DIR/eda/sim_lib/mentor/fiftyfivenm_atoms_ncrypt.v" -work fiftyfivenm_ver 
    eval  vcom $USER_DEFINED_VHDL_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS        "$QUARTUS_INSTALL_DIR/eda/sim_lib/altera_syn_attributes.vhd"         -work altera          
    eval  vcom $USER_DEFINED_VHDL_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS        "$QUARTUS_INSTALL_DIR/eda/sim_lib/altera_standard_functions.vhd"     -work altera          
    eval  vcom $USER_DEFINED_VHDL_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS        "$QUARTUS_INSTALL_DIR/eda/sim_lib/alt_dspbuilder_package.vhd"        -work altera          
    eval  vcom $USER_DEFINED_VHDL_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS        "$QUARTUS_INSTALL_DIR/eda/sim_lib/altera_europa_support_lib.vhd"     -work altera          
    eval  vcom $USER_DEFINED_VHDL_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS        "$QUARTUS_INSTALL_DIR/eda/sim_lib/altera_primitives_components.vhd"  -work altera          
    eval  vcom $USER_DEFINED_VHDL_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS        "$QUARTUS_INSTALL_DIR/eda/sim_lib/altera_primitives.vhd"             -work altera          
    eval  vcom $USER_DEFINED_VHDL_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS        "$QUARTUS_INSTALL_DIR/eda/sim_lib/220pack.vhd"                       -work lpm             
    eval  vcom $USER_DEFINED_VHDL_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS        "$QUARTUS_INSTALL_DIR/eda/sim_lib/220model.vhd"                      -work lpm             
    eval  vcom $USER_DEFINED_VHDL_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS        "$QUARTUS_INSTALL_DIR/eda/sim_lib/sgate_pack.vhd"                    -work sgate           
    eval  vcom $USER_DEFINED_VHDL_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS        "$QUARTUS_INSTALL_DIR/eda/sim_lib/sgate.vhd"                         -work sgate           
    eval  vcom $USER_DEFINED_VHDL_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS        "$QUARTUS_INSTALL_DIR/eda/sim_lib/altera_mf_components.vhd"          -work altera_mf       
    eval  vcom $USER_DEFINED_VHDL_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS        "$QUARTUS_INSTALL_DIR/eda/sim_lib/altera_mf.vhd"                     -work altera_mf       
    eval  vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QUARTUS_INSTALL_DIR/eda/sim_lib/mentor/altera_lnsim_for_vhdl.sv"   -work altera_lnsim    
    eval  vcom $USER_DEFINED_VHDL_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS        "$QUARTUS_INSTALL_DIR/eda/sim_lib/altera_lnsim_components.vhd"       -work altera_lnsim    
    eval  vlog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS     "$QUARTUS_INSTALL_DIR/eda/sim_lib/mentor/fiftyfivenm_atoms_ncrypt.v" -work fiftyfivenm     
    eval  vcom $USER_DEFINED_VHDL_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS        "$QUARTUS_INSTALL_DIR/eda/sim_lib/fiftyfivenm_atoms.vhd"             -work fiftyfivenm     
    eval  vcom $USER_DEFINED_VHDL_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS        "$QUARTUS_INSTALL_DIR/eda/sim_lib/fiftyfivenm_components.vhd"        -work fiftyfivenm     
  }
}

# ----------------------------------------
# Compile the design files in correct order
alias com {
  echo "\[exec\] com"
  eval  vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/lms_dsp_avalon_st_adapter_002_error_adapter_0.sv"                 -work error_adapter_0            
  eval  vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/lms_dsp_avalon_st_adapter_001_timing_adapter_1.sv"                -work timing_adapter_1           
  eval  vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/lms_dsp_avalon_st_adapter_001_timing_adapter_0.sv"                -work timing_adapter_0           
  eval  vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/lms_dsp_avalon_st_adapter_001_error_adapter_0.sv"                 -work error_adapter_0            
  eval  vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/lms_dsp_avalon_st_adapter_001_data_format_adapter_0.sv"           -work data_format_adapter_0      
  eval  vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/lms_dsp_avalon_st_adapter_001_data_format_adapter_0_state_ram.sv" -work data_format_adapter_0      
  eval  vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/lms_dsp_avalon_st_adapter_001_data_format_adapter_0_data_ram.sv"  -work data_format_adapter_0      
  eval  vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/lms_dsp_avalon_st_adapter_timing_adapter_1.sv"                    -work timing_adapter_1           
  eval  vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/lms_dsp_avalon_st_adapter_timing_adapter_0.sv"                    -work timing_adapter_0           
  eval  vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/lms_dsp_avalon_st_adapter_data_format_adapter_0.sv"               -work data_format_adapter_0      
  eval  vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/lms_dsp_avalon_st_adapter_data_format_adapter_0_state_ram.sv"     -work data_format_adapter_0      
  eval  vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/lms_dsp_avalon_st_adapter_data_format_adapter_0_data_ram.sv"      -work data_format_adapter_0      
  eval  vlog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS     "$QSYS_SIMDIR/submodules/altera_reset_controller.v"                                        -work rst_controller             
  eval  vlog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS     "$QSYS_SIMDIR/submodules/altera_reset_synchronizer.v"                                      -work rst_controller             
  eval  vlog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS     "$QSYS_SIMDIR/submodules/lms_dsp_avalon_st_adapter_002.v"                                  -work avalon_st_adapter_002      
  eval  vlog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS     "$QSYS_SIMDIR/submodules/lms_dsp_avalon_st_adapter_001.v"                                  -work avalon_st_adapter_001      
  eval  vlog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS     "$QSYS_SIMDIR/submodules/lms_dsp_avalon_st_adapter.v"                                      -work avalon_st_adapter          
  eval  vlog -sv $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/packet_presence_detection.sv"                                     -work packet_presence_detection_0
  eval  vlog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS     "$QSYS_SIMDIR/submodules/short_shift.v"                                                    -work packet_presence_detection_0
  eval  vlog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS     "$QSYS_SIMDIR/submodules/long_shift.v"                                                     -work packet_presence_detection_0
  eval  vcom $USER_DEFINED_VHDL_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS        "$QSYS_SIMDIR/submodules/dspba_library_package.vhd"                                        -work fir_compiler_ii_0          
  eval  vcom $USER_DEFINED_VHDL_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS        "$QSYS_SIMDIR/submodules/dspba_library.vhd"                                                -work fir_compiler_ii_0          
  eval  vcom $USER_DEFINED_VHDL_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS        "$QSYS_SIMDIR/submodules/auk_dspip_math_pkg_hpfir.vhd"                                     -work fir_compiler_ii_0          
  eval  vcom $USER_DEFINED_VHDL_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS        "$QSYS_SIMDIR/submodules/auk_dspip_lib_pkg_hpfir.vhd"                                      -work fir_compiler_ii_0          
  eval  vcom $USER_DEFINED_VHDL_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS        "$QSYS_SIMDIR/submodules/auk_dspip_avalon_streaming_controller_hpfir.vhd"                  -work fir_compiler_ii_0          
  eval  vcom $USER_DEFINED_VHDL_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS        "$QSYS_SIMDIR/submodules/auk_dspip_avalon_streaming_sink_hpfir.vhd"                        -work fir_compiler_ii_0          
  eval  vcom $USER_DEFINED_VHDL_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS        "$QSYS_SIMDIR/submodules/auk_dspip_avalon_streaming_source_hpfir.vhd"                      -work fir_compiler_ii_0          
  eval  vcom $USER_DEFINED_VHDL_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS        "$QSYS_SIMDIR/submodules/auk_dspip_roundsat_hpfir.vhd"                                     -work fir_compiler_ii_0          
  eval  vlog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS     "$QSYS_SIMDIR/submodules/altera_avalon_sc_fifo.v"                                          -work fir_compiler_ii_0          
  eval  vcom $USER_DEFINED_VHDL_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS        "$QSYS_SIMDIR/submodules/lms_dsp_fir_compiler_ii_0_rtl_core.vhd"                           -work fir_compiler_ii_0          
  eval  vcom $USER_DEFINED_VHDL_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS        "$QSYS_SIMDIR/submodules/lms_dsp_fir_compiler_ii_0_ast.vhd"                                -work fir_compiler_ii_0          
  eval  vcom $USER_DEFINED_VHDL_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS        "$QSYS_SIMDIR/submodules/lms_dsp_fir_compiler_ii_0.vhd"                                    -work fir_compiler_ii_0          
  eval  vcom $USER_DEFINED_VHDL_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS        "$QSYS_SIMDIR/submodules/lms_dsp_fir_compiler_ii_0_tb.vhd"                                 -work fir_compiler_ii_0          
  eval  vlog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS     "$QSYS_SIMDIR/submodules/fifo2avs.v"                                                       -work FIFO2AVS_0                 
  eval  vlog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS     "$QSYS_SIMDIR/submodules/avs2fifo.v"                                                       -work AVS2FIFO_0                 
  eval  vlog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS     "$QSYS_SIMDIR/lms_dsp.v"                                                                                                    
}

# ----------------------------------------
# Elaborate top level design
alias elab {
  echo "\[exec\] elab"
  eval vsim -t ps $ELAB_OPTIONS $USER_DEFINED_ELAB_OPTIONS -L work -L work_lib -L error_adapter_0 -L timing_adapter_1 -L timing_adapter_0 -L data_format_adapter_0 -L rst_controller -L avalon_st_adapter_002 -L avalon_st_adapter_001 -L avalon_st_adapter -L packet_presence_detection_0 -L fir_compiler_ii_0 -L FIFO2AVS_0 -L AVS2FIFO_0 -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver -L fiftyfivenm_ver -L altera -L lpm -L sgate -L altera_mf -L altera_lnsim -L fiftyfivenm $TOP_LEVEL_NAME
}

# ----------------------------------------
# Elaborate the top level design with novopt option
alias elab_debug {
  echo "\[exec\] elab_debug"
  eval vsim -novopt -t ps $ELAB_OPTIONS $USER_DEFINED_ELAB_OPTIONS -L work -L work_lib -L error_adapter_0 -L timing_adapter_1 -L timing_adapter_0 -L data_format_adapter_0 -L rst_controller -L avalon_st_adapter_002 -L avalon_st_adapter_001 -L avalon_st_adapter -L packet_presence_detection_0 -L fir_compiler_ii_0 -L FIFO2AVS_0 -L AVS2FIFO_0 -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver -L fiftyfivenm_ver -L altera -L lpm -L sgate -L altera_mf -L altera_lnsim -L fiftyfivenm $TOP_LEVEL_NAME
}

# ----------------------------------------
# Compile all the design files and elaborate the top level design
alias ld "
  dev_com
  com
  elab
"

# ----------------------------------------
# Compile all the design files and elaborate the top level design with -novopt
alias ld_debug "
  dev_com
  com
  elab_debug
"

# ----------------------------------------
# Print out user commmand line aliases
alias h {
  echo "List Of Command Line Aliases"
  echo
  echo "file_copy                                         -- Copy ROM/RAM files to simulation directory"
  echo
  echo "dev_com                                           -- Compile device library files"
  echo
  echo "com                                               -- Compile the design files in correct order"
  echo
  echo "elab                                              -- Elaborate top level design"
  echo
  echo "elab_debug                                        -- Elaborate the top level design with novopt option"
  echo
  echo "ld                                                -- Compile all the design files and elaborate the top level design"
  echo
  echo "ld_debug                                          -- Compile all the design files and elaborate the top level design with -novopt"
  echo
  echo 
  echo
  echo "List Of Variables"
  echo
  echo "TOP_LEVEL_NAME                                    -- Top level module name."
  echo "                                                     For most designs, this should be overridden"
  echo "                                                     to enable the elab/elab_debug aliases."
  echo
  echo "SYSTEM_INSTANCE_NAME                              -- Instantiated system module name inside top level module."
  echo
  echo "QSYS_SIMDIR                                       -- Platform Designer base simulation directory."
  echo
  echo "QUARTUS_INSTALL_DIR                               -- Quartus installation directory."
  echo
  echo "USER_DEFINED_COMPILE_OPTIONS                      -- User-defined compile options, added to com/dev_com aliases."
  echo
  echo "USER_DEFINED_ELAB_OPTIONS                         -- User-defined elaboration options, added to elab/elab_debug aliases."
  echo
  echo "USER_DEFINED_VHDL_COMPILE_OPTIONS                 -- User-defined vhdl compile options, added to com/dev_com aliases."
  echo
  echo "USER_DEFINED_VERILOG_COMPILE_OPTIONS              -- User-defined verilog compile options, added to com/dev_com aliases."
}
file_copy
h
