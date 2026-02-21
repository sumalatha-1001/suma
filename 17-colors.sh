#!/bin/bash

USERID=$(id -u)
LOG_FOLDER="/var/log/shell-script"
LOG_FILE="/var/log/shell-script/$0.log"

R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

if [ $USERID -ne 0 ]; then
    echo "please execute this script with root user access" | tee -a $LOG_FILE
    exit 1    
fi

mkdir -p $LOG_FOLDER

# by defaulf shell will not execute, when we call it will execute

validate(){
    if [ $1 -ne 0 ]; then
        echo -e "$2...$R FAILURE $N" | tee -a $LOG_FILE
        exit 1
    else   
        echo -e "$2...$G SUCCESS $N" | tee -a $LOG_FILE
    fi
}

for package in $@ # sudo sh 15-loop.sh nginx mysql node.js
do
    dnf list installed $package &>>$LOG_FILE
    if [ $? -ne 0 ]; then
        echo "$package not installed, installing now"
        dnf install $package -y &>>$LOG_FILE
        validate $? "$package installation"
    else
        echo -e "$package already installed, $Y skipping $N"
    fi
done