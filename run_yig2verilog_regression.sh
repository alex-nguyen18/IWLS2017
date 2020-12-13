#!/bin/bash

FILES="./regression/out/test*"

for f in $FILES
do
	file_sanspath=${f##*/}
	file_sansext=${file_sanspath%.*}
	echo "./verif/yig2verilog < $f > ./regression/out_verilog/$file_sansext.v"
	./verif/yig2verilog < $f > ./regression/out_verilog/$file_sansext.v

    echo "./process_output_verilog.sh ./regression/out_verilog/$file_sansext.v"
    ./process_output_verilog.sh ./regression/out_verilog/$file_sansext.v

    echo "./run_sec.sh $file_sansext"
    ./run_sec.sh $file_sansext

    echo ""
done
