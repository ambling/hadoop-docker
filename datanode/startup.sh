#!/bin/bash

# this file is used to start the datanode and yarn nodemanager container from image at the first time,
# and set some necessary configurations for the container.
# You should run this script ONLY ONCE if there is nothing unexpected happened.
# You can just start the container next time if the container is ran from image.

docker run -t -i -h datanode --name datanode --link dnsserver:dnsserver \
--link namenode:namenode --link resourcemanager:resourcemanager \
--dns 172.17.0.4 --dns-search ambling.org \
hadoop-datanode:base /bin/bash