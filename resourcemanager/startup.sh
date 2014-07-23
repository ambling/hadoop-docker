#!/bin/bash

# this file is used to start the yarn resourcemanager container from image at the first time,
# and set some necessary configurations for the container.
# You should run this script ONLY ONCE if there is nothing unexpected happened.
# You can just start the container next time if the container is ran from image.

docker run -t -i -h resourcemanager --name resourcemanager --link dnsserver:dnsserver \
--link namenode:namenode --dns 172.17.0.31 --dns-search ambling.org \
-p 8030:8030 -p 8088:8088 -p 8032:8032 -p 8033:8033 -p 8031:8031 \
hadoop-resourcemanager:base /bin/bash
