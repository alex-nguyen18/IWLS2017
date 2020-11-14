#!/bin/bash

FILES="./benchmarks/*"

for f in $FILES
do
	echo "Processing $f"
	file_sanspath=${f##*/}
	file_sansext=${file_sanspath%.*}
	./src/yig2verilog $f ./output/$file_sansext.yig
	#cp $f ./output/$file_sansext.yig
done
