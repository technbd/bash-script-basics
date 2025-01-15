#!/bin/bash 

INSTANCE_NAMES=('master' 'worker1' 'worker2') ## Array:

for instance_name in "${INSTANCE_NAMES[@]}"
do
  echo "Creating EC2 $instance_name, please wait ..."
  
  aws ec2 run-instances \
  --image-id ami-0c7217cdde317cfec \
  --instance-type t2.micro \
  --count 1 \
  --associate-public-ip-address \
  --tag-specifications 'ResourceType=instance,Tags=[{Key=Name,Value='$instance_name'}]';

done

