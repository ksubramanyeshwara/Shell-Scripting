#!/bin/bash

for number in {1..10}
do
	echo "Number is $number"
    sleep 1
done

echo "For loop is completed"

for file in ./*.log
do
    tar -czvf "$file".tar.gz "$file"
done