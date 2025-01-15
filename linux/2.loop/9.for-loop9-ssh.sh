#!/bin/bash

for s in server1 server2 server3
do
    echo "Server ${s}: $(ssh root@${s} uptime)"
done
