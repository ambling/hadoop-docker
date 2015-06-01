#!/bin/bash

# this file is used to start the datanode and yarn nodemanager container from image at the first time,
# and set some necessary configurations for the container.
# You should run this script ONLY ONCE if there is nothing unexpected happened.
# You can just start the container next time if the container is ran from image.

CONTAINER_NAME=datanode

for RACK in `seq 1 2`;
do
    echo "RACK:$RACK"
    for NODE in `seq 1 2`;
    do
	NAME=$CONTAINER_NAME$RACK$NODE

	echo $NAME
	CONID=$(docker run -d -t -i -h $NAME --name $NAME  \
	    --dns 172.27.42.1 --dns-search ambling.org \
	    hadoop-datanode:base /bin/bash)

	sudo pipework br1 $CONID 172.27.$RACK.$NODE/16@172.27.42.1

    done
done 
