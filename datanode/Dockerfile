# you may have to build this baseimage first from this repository:
# https://github.com/ambling/baseimage-docker
FROM hadoop-base:base
MAINTAINER Ambling <ambling07@gmail.com>

# variables
#ENV key val

# add chd5 yum repo for centos6 and install hadoop
ADD . /tmp
RUN yum install -y hadoop-hdfs-datanode hadoop-yarn-nodemanager

# config hadoop
# you have to configure hostname and ssh public keys first
RUN cp -r /build/conf.cluster /etc/hadoop/
RUN alternatives --install /etc/hadoop/conf hadoop-conf /etc/hadoop/conf.cluster 50 
RUN alternatives --set hadoop-conf /etc/hadoop/conf.cluster

# change user 
USER hdfs

# make necessary directories for hdfs
RUN mkdir -p /var/lib/hadoop-hdfs/cache/hdfs/dfs/data
RUN chmod -R 700 /var/lib/hadoop-hdfs/cache/hdfs/dfs

# change user 
USER yarn

# make necessary directories for yarn
RUN mkdir -p /var/lib/hadoop-yarn/data/yarn/local /var/lib/hadoop-yarn/data/yarn/logs
RUN chmod -R 755 /var/lib/hadoop-yarn/data/yarn/local /var/lib/hadoop-yarn/data/yarn/logs

# ports for datanode and tasktracker (also need to use -p in docker run command, see startup.sh)
# dfs.datanode.address TCP
EXPOSE 50010 1004	
# dfs.datanode.address TCP
EXPOSE 50075 1006	
# dfs.datanode.ipc.address TCP
EXPOSE 50020
# yarn.nodemanager.localizer.address TCP
EXPOSE 8040
# yarn.nodemanager.webapp.address TCP
EXPOSE 8042
# yarn.nodemanager.address TCP
EXPOSE 8041

# change user back to boot
USER root

# config supervisor
RUN mv /build/supervisord.conf /etc/

# clean up
RUN rm -rf /tmp/*

# run the supervisor to start service
CMD supervisord