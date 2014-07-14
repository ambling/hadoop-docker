Dockerfile for hadoop hdfs namenode
====================

This is the Dockerfile and necessary files to build a dockerized hadoop base image. This image is used to prepare the hadoop common environment and to build other hadoop components such as hdfs-namenode, yarn-resourcemanager and others.

*This images is bases on the supervisored image of centos6 in [this repository](https://github.com/ambling/baseimage-docker), you may have to build it and tag it before further steps*

Usage
-----------
Just run the scrips build.sh.
Note: Make some necessary modifications to the scripts and Dockerfile as you like.
