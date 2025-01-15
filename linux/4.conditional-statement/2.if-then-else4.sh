#!/bin/bash

file="instance_id"

#if [ -f "$file" ]

if [ -e "$file" ]
then
  echo "$file is exists"
  cat "$file"
else
  echo "$file does not exists"
fi
