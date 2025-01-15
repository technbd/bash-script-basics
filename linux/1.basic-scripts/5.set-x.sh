#!/bin/bash

## Enable Debugging:
set -x

echo "Starting the script"

name="Alice"
echo "Hello, $name"

ls non_existent_file.txt


## Disable Debugging:
set +x

ls nonexistent_directory

echo "End of script"

