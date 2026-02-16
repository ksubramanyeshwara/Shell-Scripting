#!/bin/bash

# Single number menu

echo "Enter a number between 1 and 5:"
read -r num

case "$num" in
    1)
        echo "You entered 1"
        ;;
    2)
        echo "You entered 2"
        ;;
    3)
        echo "You entered 3"
        ;;
    4)
        echo "You entered 4"
        ;;
    5)
        echo "You entered 5"
        ;;
    *)
        echo "You did not enter a number between 1 and 5"
        ;;
esac

# Multiple pattern menu

echo "Enter Y or N:"
read -r answer

case $answer in 
    Y|y)
        echo "You entered Y"
        ;;
    N|n)
        echo "You entered N"
        ;;
    *)
        echo "You did not enter Y or N"
        ;;
esac

# Using wildcards

echo "Enter a filename"
read -r filename

case $filename in
    *.txt)
        echo "You entered a text file"
        ;;
    *.sh)
        echo "You entered a shell script"
        ;;
    *)
        echo "You entered a file with an unknown extension"
        ;;
esac