Dockerfile for a dns server
====================

This is the Dockerfile and necessary files to build a dockerized dns server, the container that is started based on this image should start first and allow other containers link to. It can be attached to shell to change the configuration of the zone file and restart the named service.


Read the HOWTO to config for your cluster environment.

*This images is bases on the supervisored image of centos6 in [this repository](https://github.com/ambling/baseimage-docker), you may have to build it and tag it before further steps*
