#!/bin/bash
create_user() {
    username=$1
    password=$2

    
    sudo useradd -m -s /bin/bash $username
r
    echo "$username:$password" | sudo chpasswd

    sudo chmod 400 $HOME/website.txt
}

if [[ -f "user_info.txt" ]]; then
    while IFS="," read -r username password; do
        create_user $username $password
    done < user_info.txt
else
    read -p "Enter username: " username
    read -s -p "Enter password: " password
    echo

    create_user $username $password
fi
