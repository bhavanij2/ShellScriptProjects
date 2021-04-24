#!/bin/bash

# Test if current user is root, else exit

if [[ "${UID}" -ne 0 ]]
then
 echo "Login as root user to execute this script"
 exit 1
fi

echo "Start Account Creation Process"

echo "Enter Username"
read -p "Enter Username: " USER_NAME

echo "Enter Full name of user account"
read -p "Enter User Full Name: " FULL_NAME 

echo "Enter User account password"
read -p "Enter Password: " PASSWORD

echo "Create User account"
useradd -c "${FULL_NAME}" "${USER_NAME}"

if [[ $? -ne 0 ]]; then
 echo "User Account Creation Failed"
 exit 1
fi

echo "Change Password of the User Account"
echo "${PASSWORD}" | passwd --std-in "${USER_NAME}"

# Expire the password; force the user to enter the password on first login
passwd -e "${USER_NAME}"

echo "Account Created successfully"
echo "Username: ${USER_NAME}"
echo "Full Name: ${FULL_NAME}"
echo "Pasword: ${PASSWORD}"
echo "Hostname: " 
exit 0




