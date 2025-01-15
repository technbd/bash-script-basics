#!/bin/bash

ssh="22"
http="80"
https="443"

for port in $ssh $http $https
do
   echo $port
done
