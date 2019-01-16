#!/bin/bash

# clear old docker data
docker stop $(docker ps -aq)
docker rm -f $(docker ps -aq)
#docker rmi -f $(docker images -q)

echo "cleaned up!"

# create and init only ONE genesis block
./init_genesis_block.sh
docker build -t trackingchain .
echo "genesis block initialized!"

docker run --name mybootnode trackingchain &
echo "started bootnode"

sleep 2

ENODE=$(echo "enode://$(docker exec -it mybootnode bootnode -nodekey boot_node.key --writeaddress)" | tr -d '\r')
USER="172.17.0.2:30303"
i="0"
while [ $i -lt $1 ];
do
    docker run --env BOOTENODE="$ENODE@$USER" trackingchain &
    echo "started container"
    i=$[$i+1]
    sleep 2
done