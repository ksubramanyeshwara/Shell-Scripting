#!/bin/bash

if [ -f ~/learn ] # -f checks if the regular file exists, ~ is the home directory
then
    echo "File exist!"
else
    echo "File doesn't exist!"
fi