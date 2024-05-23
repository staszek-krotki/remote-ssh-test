#!/bin/bash

echo "starting IP: $STARTIP"

IP=`ifconfig eth0 | grep 'inet ' | awk '{print $2}'`
INDEX=`dig -x $IP +short | cut  -d'.' -f1 | cut -d'-' -f3`
PORT=$((INDEX+STARTIP))
echo "Port: $PORT"
ssh -NTf -oStrictHostKeyChecking=no -i "net-stability.pem" -N -R $PORT:127.0.0.1:7861  ubuntu@ec2-3-76-45-25.eu-central-1.compute.amazonaws.com

fallocate -l 1M img.png

flask run --port 7861
