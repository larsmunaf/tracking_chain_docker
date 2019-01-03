#!/bin/bash

# clear old docker data
docker rmi -f trackingchain

echo "cleaned up!"

# create and init only ONE genesis block
./init_genesis_block.sh
docker build -t trackingchain .
echo "genesis block initialized!"

i="0"
while [ $i -lt 4 ];
do
    docker run trackingchain &
    echo "started container"
    i=$[$i+1]
done