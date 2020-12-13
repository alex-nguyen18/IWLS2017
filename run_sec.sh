#!/bin/bash

filename="$1"

$CTEPATH/tools/SixthSense/prod/bin-64/sec.pl \
        -no_default_optconf  \
        -verilog_old $filename.v \
        -verilog_new $filename.v \
        -verilog_path_old ./regression/tests/ \
        -verilog_path_new ./regression/out_verilog/ \
        -work_dir ./sec_$filename \
        -nmz_old \
        -nmz_new \
        -no_check_output_toggle \
        -use_initialv_old \
        -use_initialv_new
