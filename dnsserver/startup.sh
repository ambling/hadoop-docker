#!/bin/bash

# this file is used to start the container from image at the first time,
# and set some necessary configurations for the container.
# You should run this script ONLY ONCE if there is nothing unexpected happened.
# You can just start the container next time if the container is ran from image.

DNSSERVER=$(docker run -d -i -t -P -h dnsserver --name dnsserver dnsserver:base /bin/bash)
sudo pipework br1 $DNSSERVER 172.17.42.2/16@172.17.42.1
#sudo ip addr add 172.17.42.2/16 dev br1
