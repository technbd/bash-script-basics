#!/bin/bash

## Enables the "exit on error"
set -e

echo "Start of the script"

## This command fails:
ls non_existent_file.txt

echo "This line will NOT execute, because the script stops after the above failure."

