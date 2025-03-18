#!/bin/bash

read -p "Enter number of Users to create:" num

echo "------------------------------------------------------"

for (( i=1; i<=$num; i=i+1)); do

read -p "Enter Username no.$i: " uname

sudo useradd $uname

read -p "Enter password for user no.$i? [Y/N] " flag
if [[ "$flag" == "Y" || "$flag" == "y" ]]; then

sudo passwd $uname

echo "Successfully created New User: $uname with password."

echo "------------------------------------------------------"

else
echo "Successfully created New User: $uname without password."

echo "------------------------------------------------------"

fi
done
