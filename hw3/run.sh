#!/bin/bash

T()
{
	if [ $1 -ge 2 ]
	then
		echo  $(( 2*$(T $[$1/2] $2)+$1*$2 ))
	else
		echo $2
	fi
}

for (( i=2; i<32; i=i*2 ))
do
	for j in $(seq 1 20)
	do
		printf "%02d,%02d" $i $j > in.txt
		#cat in.txt
		#echo ""
		spim -file hw3.s > /dev/null
		cat out.txt
		echo ""
		
		printf "%04d\n" $(T $i $j)
	done
done
