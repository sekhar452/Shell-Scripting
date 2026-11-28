#!/bin/bash

logs_folder="var/log/Shell-Scripting"

logs_file=${logs_folder}/${0}.log


user_id=(id -u)

if [user_id -ne 0 ];then
    
    echo "Please run the script the using the sudo access"

    exit 1

fi

mkdir -p $logs_folder

echo "Script started execution at $(date +"%F %T")" &>> $logs_file


validate(){

    if[ $? -ne 0];then

        echo "${2} Is Failed"
        exit 1
    else
        echo "${2} Is Sucess"

    fi
}

dnf install nginx -y &>> logs_file

validate $? "Nginx"

dnf install mysql -y &>> logs_file

validate $? "mysql"

echo "Script ended execution at $(date +"%F %T")" &>> $logs_file
