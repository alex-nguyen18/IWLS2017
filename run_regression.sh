#!/bin/bash

FILES="./regression/tests/test_*"
pass=0;
fail=0;
total=0;
outfile=./regression/regression_summary

if [ -f $outfile ]
then
	rm $outfile
fi

for f in $FILES
do
	file_sanspath=${f##*/}
	file_sansext=${file_sanspath%.*}
	#echo "Command invocation: ./src/verilog2yig $f ./regression/out/$file_sansext.yig"
	./src/verilog2yig $f ./regression/out/$file_sansext.yig

	echo "<<<<<<<<<<<<<<<<<<<<<<<< $file_sansext >>>>>>>>>>>>>>>>>>>>>>>>" >> $outfile
	echo "" >> $outfile
	echo "TEST: $file_sansext.v" >> $outfile
	cat $f >> $outfile

	echo "" >> $outfile
	echo "<<<<>>>>" >> $outfile
	echo "" >> $outfile

	echo "OUTPUT YIG: $file_sansext.yig" >> $outfile
	cat ./regression/out/$file_sansext.yig >> $outfile
	echo "" >> $outfile
			
	if [ -f "./regression/check/$file_sansext.yig" ]; then
		if cmp -s ./regression/out/$file_sansext.yig ./regression/check/$file_sansext.yig
		then
			((pass++))
			echo "PASS: $file_sansext.yig"
			echo "PASS: $file_sansext.yig" >> $outfile
		else 
			((fail++))
			echo "FAIL: $file_sansext.yig"
            echo "FAIL: $file_sansext.yig" >> $outfile
		fi
	else 
		echo "No comparison file exists for $file_sansext.yig"
        echo "No comparison file exists for $file_sansext.yig" >> $outfile
	fi
	echo "" >> $outfile

	((total++))
done

echo ""
echo "Passing Tests: $pass/$total"
echo "Failing Tests: $fail/$total"

echo "<<<<<<<<<<<<<<<<<<<<<<<< SUMMARY >>>>>>>>>>>>>>>>>>>>>>>>" >> $outfile
echo "" >> $outfile
echo "Passing Tests: $pass/$total" >> $outfile
echo "Failing Tests: $fail/$total" >> $outfile
