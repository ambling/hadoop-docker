#!/bin/bash

# this file is used to start the container from image at the first time,
# and set some necessary configurations for the container.
# You should run this script ONLY ONCE if there is nothing unexpected happened.
# You can just start the container next time if the container is ran from image.

docker run -d -t -h dnsserver --name dnsserver dnsserver:base