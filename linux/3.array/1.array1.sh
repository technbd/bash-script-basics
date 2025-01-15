#!/bin/bash

## Array:
fruits=("apple" "banana" "cherry" "mango")


## Access all elements in the array
echo "All fruits: ${fruits[@]}"


## Loop Through an Array:
for fruit in "${fruits[@]}"; do
    echo "$fruit"
done

