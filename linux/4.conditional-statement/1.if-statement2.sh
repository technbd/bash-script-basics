#!/bin/bash

## if Statement:

#a=20
#b=30

read -p "1st value for 'a': " a
read -p "1st value for 'b': " b


if [ $a -lt $b ]
then
  echo "a is less than b"
  echo "$a is less than $b"
fi
