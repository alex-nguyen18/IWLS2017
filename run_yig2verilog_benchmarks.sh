#!/bin/bash

FILES="./output_yigs/*"

for f in $FILES
do
	file_sanspath=${f##*/}
	file_sansext=${file_sanspath%.*}
	echo "./verif/yig2verilog < $f > ./output_verilog/$file_sansext.v"
	./verif/yig2verilog < $f > ./output_verilog/$file_sansext.v


done
