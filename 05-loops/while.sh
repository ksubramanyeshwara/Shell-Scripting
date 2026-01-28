#!/bin/bash

num=1

while [ $num -le 5 ]
do
    echo $num
    ((num++))
    sleep 1
done

# Contineously check for a file and exit the loop when file is not found

echo "Enter a filename to search: "
read -r filename

while [ -f ~/"$filename" ]
do
    echo "As of $(date), the file you are looking for exist"
    sleep 5
done

echo "As of $(date), the file you are looking for doesn't exist"