#!/bin/bash

FILES="./benchmarks/*"

for f in $FILES
do
	file_sanspath=${f##*/}
	file_sansext=${file_sanspath%.*}
	echo "./src/yig2verilog $f ./output/$file_sansext.yig"
	./src/yig2verilog $f ./output/$file_sansext.yig
	#cp $f ./output/$file_sansext.yig
done
