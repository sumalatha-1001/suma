#!/bin/bash

USERID=$(id -u)
LOG_FOLDER="/var/log/shell-script"
LOG_FILE="/var/log/shell-script/$0.log"

if [ $USERID -ne 0 ]; then
    echo "please execute this script with root user access" | tee -a $LOG_FILE
    exit 1    
fi

mkdir -p $LOG_FOLDER

# by defaulf shell will not execute, when we call it will execute

validate(){
    if [ $1 -ne 0 ]; then
        echo "$2...FAILURE" | tee -a $LOG_FILE
        exit 1
    else   
        echo "$2...SUCCESS" | tee -a $LOG_FILE
    fi
}

for package in $@ # sudo sh 15-loop.sh nginx mysql node.js
do
    dnf install $package -y &>>$LOG_FILE
    validate $? "$pakacge installation"
done