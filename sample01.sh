#!/bin/bash

echo 'Hello'

echo "script"


# Display UID

echo "UID is ${UID}"

# Display Username

USER_NAME=$(id -un)
echo "Username is ${USER_NAME}"

# Display if user is root or not

if [[ "${UID}" -eq 0 ]]
then
 echo "Root User"
else
 echo "Not Root User"
fi
