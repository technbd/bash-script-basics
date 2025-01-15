#!/bin/bash

## Basic loop:

for char in a b c
do
echo $char
done

echo "------------"


## Loop Through a List of Values: 

for items in apple banana cherry; do
    echo "Fruit name: $items"
done


echo "------------"


## Loop Through a List of Values:

for n in 1 2 3 4 5
do
echo "Number $n"
done

echo "------------"


## Loop Through a Range of Numbers:

for i in {1..10}
do
echo "Number $i"
done
