#!/bin/bash

MARKS=$1

if [ $MARKS -ge 90 ]; then
    echo "Grade A"
elif [ $MARKS -ge 75 ]; then
    echo "Grade B"
elif [ $MARKS -ge 60 ]; then
    echo "Grade C"
elif [ $MARKS -le 35 ]; then
    echo "Grade C"    
else
    echo "Grade failed"
fi
