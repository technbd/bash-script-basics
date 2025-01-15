#!/bin/bash

## Array:
fruits=(apple banana cherry mango)

#fruits=("apple" "banana" "cherry" "mango")

## Access individual array elements
echo "First elements: ${fruits[0]}"
echo "Second elements: ${fruits[1]}"
echo "Third elements: ${fruits[2]}"
echo "Forth elements: ${fruits[3]}"

echo "----------------"


## Loop Through an Array:
for n in ${fruits[@]} 
do
  echo $n
done
