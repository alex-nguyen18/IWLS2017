#!/bin/bash

FILES="./benchmarks/*"

for f in $FILES
do
	file_sanspath=${f##*/}
	file_sansext=${file_sanspath%.*}
	echo "./src/verilog2yig $f ./output_yigs/$file_sansext.yig"
	./src/verilog2yig $f ./output_yigs/$file_sansext.yig
	echo "    Y Gates in $file_sansext: " `grep -c "Y" ./output_yigs/$file_sansext.yig`
done
