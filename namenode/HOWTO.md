How to configure the necessary environment and build the image
====================================

#This images is bases on the supervisored image of centos6 in [this repository](https://github.com/ambling/baseimage-docker), you may have to build it and tag it before further steps#

Steps
------------

1. configure the hostname by edit the HOSTNAME variable in Dockerfile. Change the nginx or apache httpd configuration of host to redirect the network traffic to containers according to the hostname(servername).
2. configure core-site.xml for fs.defaultFS and hdfs-site.xml for dfs.namenode.name.dir.
3. (optinal) map the host filesystm to container to keep data outside the container.
