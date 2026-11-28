#!/bin/bash

logs_folder="var/log/Shell-Scripting"

logs_file=${logs_folder}/${0}.log

R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"


user_id=$(id -u)

if [ $user_id -ne 0 ];then
    
    echo "Please run the script the using the sudo access"

    exit 1

fi

mkdir -p $logs_folder

echo "Script started execution at $(date +"%F %T")" | tee -a $logs_file

for package in $@

do
    dnf list installed $package &>> logs_file
    if [ $? -ne 0 ];then
        echo -e "Going to install: ${package}"
        dnf install $package -y &>> logs_file
        validate $? "Installing:${package}"
    else   
         echo "${package} already installed...SKIPPING"
    fi
    
done

validate(){

    if [ $1 -ne 0 ];then
        
        echo -e "${2}..${R}FAILED${N}" | tee -a $logs_file
        
        exit 1
    else
        echo -e "${2}..${G}SUCCESS${N}" | tee -a $logs_file
    fi
}


for package in $@
do
    dnf list installed $package &>> $logs_file
    if [ $? -ne 0 ]; then
        echo "Going to install: ${package}"
        dnf install $package -y &>> $logs_file
        validate $? "Installing ${package}"
    else
        echo -e "${package} already installed...${Y}SKIPPING${N}"
    fi
done


