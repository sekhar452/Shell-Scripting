#!bin/bash

#!/bin/bash

user_id=$(id -u)

if [ $user_id -ne 0 ]; then
   
    echo "Please run this script with sudo access.."
    
    exit 1
fi

echo "proceeding...."

dnf install nginx -y

validate(){
    
    if [ $1 -ne 0 ];then
        
        echo "$2 is failed"
        
        exit 1
        
    else
        echo "$2 is sucess"
    fi
    
}
echo "Installed nginx and now going to install mysql"

validate $? "Install nginx"

dnf install mysql -y

validate $? "Install mysql"

echo "everything is installed like mysql and nginx"

