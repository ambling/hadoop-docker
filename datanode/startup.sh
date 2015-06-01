#!/bin/bash

# this file is used to start the datanode and yarn nodemanager container from image at the first time,
# and set some necessary configurations for the container.
# You should run this script ONLY ONCE if there is nothing unexpected happened.
# You can just start the container next time if the container is ran from image.

CONTAINER_NAME=datanode11

if [ $# -gt 0 ]
then
    CONTAINER_NAME=$1
fi

#echo "container name:"
#echo $CONTAINER_NAME

CONID=$(docker run -d -t -i -h $CONTAINER_NAME --name $CONTAINER_NAME --link dnsserver:dnsserver \
--dns 172.17.42.2 --dns-search ambling.org \
hadoop-datanode:base /bin/bash)

sudo pipework br1 $CONID 172.17.1.1/16
#sudo ip addr add 172.17.1.1/16 dev br1