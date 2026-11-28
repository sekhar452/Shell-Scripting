#!/bin/bash

logs_folder="var/log/Shell-Scripting"

logs_file=${logs_folder}/${0}.log


user_id=$(id -u)

if [ $user_id -ne 0 ];then
    
    echo "Please run the script the using the sudo access"

    exit 1

fi

mkdir -p $logs_folder

echo "Script started execution at $(date +"%F %T")" | tee -a $logs_file


validate(){

    if [ $1 -ne 0 ];then
        
        echo "$2 is failed" | tee -a $logs_file
        
        exit 1
        
    else
        echo "$2 is sucess" | tee -a $logs_file
    fi
}


for package in $@

do
    echo "Going to install: ${package}"
    dnf install nginx -y &>> logs_file
    validate $? "Installing:${package}"

done