#!/bin/bash

for i in file{1..3}
    do
        for x in node{1..3}
            do
                echo "Copying $i to server $x"
                scp $i $x:/tmp
        done

done
