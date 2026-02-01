#!/bin/bash

START_TIME=$(date +%s)
END_TIME=$(date +%s)
TOTAL_TIME=$(($END_TIME-$START_TIME))

echo "script executed at: $START_TIME"

sleep 10

echo "script executed in $TOTAL_TIME Seconds"