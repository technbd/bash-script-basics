#!/bin/bash

## if then else statement:

#num=10

read -p "Enter your number: " num


if [ $((num % 2)) -eq 0 ]

then
  echo "The number is even."
else
  echo "The number is odd."
fi

