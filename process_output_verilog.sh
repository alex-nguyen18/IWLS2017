#!/bin/bash

file="$1"

#Fix module name
file_sanspath=${file##*/}
file_sansext=${file_sanspath%.*}
sed -i "s/top/$file_sansext/g" $file

#Fix input pin names
temp=`grep input $file`
inputs=${temp%%;}
IFS=', ' read -r -a in_array <<< "$inputs"

for i in "${in_array[@]:1}"
do
    num=${i:1}
    index=$(($num-1))
    pis="pi"$index
    sed -i "s/$i/$pis/g" $file
done

#Fix output pin names
temp2=`grep output $file`
outputs=${temp2%%;}
IFS=', ' read -r -a out_array <<< "$outputs"

for i in "${out_array[@]:1}"
do
    num=${i:1}
    index=$(($num-1))
    pos="po"$index
    sed -i "s/$i/$pos/g" $file
done
