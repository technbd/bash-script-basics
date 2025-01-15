#!/bin/bash

## if Statement:

read -p "Enter your age: " age

if [ $age -gt 18 ]
then
  echo "You are Teenager age plus."
  echo "You age is: $age"
fi
