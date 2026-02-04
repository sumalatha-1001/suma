#!/bin/bash

USERID=$(id -u)

if [ $USERID -ne 0 ]; then
    echo "please execute this script with root user access"
    exit 1    
fi

# by defaulf shell will not execute, when we call it will execute

VALIDATE(){
    if [ $1 -ne 0 ]; then
        echo "$2...FAILURE"
        exit 1
    else   
        echo "$2...SUCCESS"
    fi
}

dnf install nginx -y
validate $? "Installing Nginx"

dnf install mysql -y
validate $? "Installing mysql"

dnf install nodejs -y
validate $? "Installing nodejs"
