#!/bin/bash

for i in {1..9}
do
	for j in $(seq 1 1 $i)
	do
		echo -n "$i"
	done
	echo
done
