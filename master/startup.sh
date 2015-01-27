#!/bin/bash

# this file is used to start the namenode container from image at the first time,
# and set some necessary configurations for the container.
# You should run this script ONLY ONCE if there is nothing unexpected happened.
# You can just start the container next time if the container is ran from image.

docker run -t -i -h hadoopmaster --name hadoopmaster --link dnsserver:dnsserver \
--dns 172.17.0.31 --dns-search ambling.org \
-p 8020:8020 -p 50070:50070 -p 50470:50470 \
-p 8030:8030 -p 8088:8088 -p 8032:8032 -p 8033:8033 -p 8031:8031 \
-p 7077:7077 -p 7078:7078 -p 18080:18080 -p 18081:18081 \
hadoop-master:base /bin/bash
