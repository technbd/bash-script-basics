#!/bin/bash 

INSTANCE_NAMES=('m' 'w1' 'w2') #Array elements

for instances_name in ${INSTANCE_NAMES[@]};
do 
  echo $instances_name
done

