#!/bin/bash

# Define a function
get_input () {

    read -p "Enter your name: " name
    echo "Hello, $name!"
}

# Call the function
get_input

