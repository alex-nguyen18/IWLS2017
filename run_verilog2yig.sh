#!/bin/bash

FILES="./benchmarks/y*"
BASELINE=(8136 5326 2893 2832 1991 7002 744 1235 1186 772)
i=0
total=0;

for f in $FILES
do
	file_sanspath=${f##*/}
	file_sansext=${file_sanspath%.*}
	echo "Command invocation: ./src/verilog2yig $f ./output_yigs/$file_sansext.yig"
	./src/verilog2yig $f ./output_yigs/$file_sansext.yig
	gates=`grep -c "Y" ./output_yigs/$file_sansext.yig`
	echo "    Y Gates in $file_sansext: $gates"
	awk "BEGIN {new_gates=${BASELINE[$i]}-$gates; imp=new_gates/${BASELINE[$i]}; perc=imp*100; print \"    % improvement from baseline: \", perc}"
	((i++))
	((total = $total + $gates))
done

echo ""
echo "TOTAL GATES: $total"
