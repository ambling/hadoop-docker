#!/bin/bash

# this file is used to start the container from image at the first time,
# and set some necessary configurations for the container.
# You should run this script ONLY ONCE if there is nothing unexpected happened.
# You can just start the container next time if the container is ran from image.

# the variable of --rm is used for testing purposes, delete it in production envrionment
docker run -i -t -h dnsserver --name dnsserver dnsserver:base