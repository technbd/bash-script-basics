#!/bin/bash

## using Backticks (``):
current_date=`date`
echo "Today's date is: $current_date"

## using $():
date=`date`
current_time=$(date +%H:%M:%S)

echo "Current date is: $date and Time is: $current_time"
