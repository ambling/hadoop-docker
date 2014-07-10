#!/bin/bash

# this file is used to start the namenode container from image at the first time,
# and set some necessary configurations for the container.
# You should run this script ONLY ONCE if there is nothing unexpected happened.
# You can just start the container next time if the container is ran from image.

docker run -h namenode --name namenode -p 8020:8020 -p 50070:50070 -p 50470:50470 --dns 127.0.0.1 --dns-search ambling.org hadoop-namenode:base