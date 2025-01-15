#!/bin/bash

file='book.txt'

#while read line_read
while read -r line_read

do
  echo $line_read

done < $file

