#!/bin/bash

# this file is used to start the yarn resourcemanager container from image at the first time,
# and set some necessary configurations for the container.
# You should run this script ONLY ONCE if there is nothing unexpected happened.
# You can just start the container next time if the container is ran from image.

docker run -t -d -h resourcemanager --name resourcemanager --link dnsserver:dnsserver \
--link namenode:namenode \
--dns 172.17.0.4 --dns-search ambling.org \
hadoop-resourcemanager:base