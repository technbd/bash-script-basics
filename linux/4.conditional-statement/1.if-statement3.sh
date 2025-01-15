#!/bin/bash

#num=8

read -p "Enter your number: " num

if [ $((num % 2)) -eq 0 ]
then
    echo "$num is an even number"
fi
