#!/bin/bash

## if then else statement:

#var1=1
#var2=2

read -p "Enter your variable1: " var1
read -p "Enter your variable2: " var2

#if [ $var1 -eq $var2 ]

if [ $var1 == $var2 ]
then
    echo "Both variables are the same"
else
    echo "Both variables are different"
fi

