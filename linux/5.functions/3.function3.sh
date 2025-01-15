#!/bin/bash

# Define a function
add_numbers() {
    result=$(( $1 + $2 ))
    echo "The sum of $1 and $2 is: $result"
}

# Call the function
add_numbers 5 10
