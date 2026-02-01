#!/bin/bash

NUMBER=$1

# -gt --- is greater than 
# -lt --- is less than
# -eq --- is equal to
# -ne --- is not equal to

if [ $NUMBER -gt 20 ]; then
    echo "given number $NUMBER is greater than 20"
fi    