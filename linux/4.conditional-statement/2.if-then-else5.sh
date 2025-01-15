#!/bin/bash

names=(m2 w3 w4)  # Array: 

#for name in m w1 w2 
for name in ${names[@]}
do
    if [ ! -z "$name" ]
    then
        echo "Delete: $name"
        echo "$name is terminated"
    else
        echo "Not found: $name"
    fi
done
