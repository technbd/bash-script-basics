#!/bin/bash

# Check if input file is provided
if [ "$#" -ne 1 ]; then
    echo "Usage: $0 <input_file>"
    echo "Input file format: username:password"
    exit 1
fi

input_file=$1

# Check if input file exists
if [ ! -f "$input_file" ]; then
    echo "Error: File '$input_file' not found!"
    exit 2
fi

echo "------------------------------------------------------"
while IFS=: read -r username password; do
    if id "$username" &>/dev/null; then
        echo "User '$username' already exists. Skipping..."
    else
        # Create the user
        sudo useradd "$username"
        if [ -n "$password" ]; then
            echo "$username:$password" | sudo chpasswd
            echo "Successfully created user '$username' with password."
        else
            echo "Successfully created user '$username' without password."
        fi
    fi
    echo "------------------------------------------------------"

done < "$input_file"

echo "All tasks completed."
