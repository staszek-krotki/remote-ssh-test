#!/bin/bash

echo "starting port: $PORT"


IP=`ifconfig eth0 | grep 'inet ' | cut -d':' -f2 | awk '{print $1}'`
INDEX=`dig -x $IP +short | cut  -d'.' -f1 | cut -d'-' -f3`
PORT=$((INDEX+PORT))

echo "IP: $IP, INDEX: $INDEX, Port: $PORT"

curl -v -X GET http://3.76.45.25:$PORT/stream >> /dev/null
