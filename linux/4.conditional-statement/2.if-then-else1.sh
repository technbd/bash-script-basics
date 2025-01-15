#!/bin/bash

## if then else statement:

#num=100

read -p "Enter your number: " num

if [ $num -eq 100 ]
then
 echo "Number is equal to 100"
 
else
 echo "Number is not equal to 100"
fi
