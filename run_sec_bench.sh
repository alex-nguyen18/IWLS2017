#!/bin/bash

filename="$1"

$CTEPATH/tools/SixthSense/prod/bin-64/sec.pl \
        -no_default_optconf  \
        -verilog_old $filename.v \
        -verilog_new $filename.v \
        -verilog_path_old ./benchmarks/ \
        -verilog_path_new ../spool/IWLS2017/output_verilog/ \
        -work_dir ./sec_results/sec_$filename \
        -nmz_old \
        -nmz_new \
        -no_check_output_toggle \
        -use_initialv_old \
        -use_initialv_new
