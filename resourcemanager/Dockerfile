# you may have to build this baseimage first from this repository:
# https://github.com/ambling/baseimage-docker
FROM hadoop-base:base
MAINTAINER Ambling <ambling07@gmail.com>

# variables
#ENV key val

# add chd5 yum repo for centos6 and install hadoop
RUN mkdir /build
ADD . /build
RUN yum install -y hadoop-yarn-resourcemanager

# config hadoop
# you have to configure hostname and ssh public keys first
RUN cp -r /build/conf.cluster /etc/hadoop/
RUN alternatives --install /etc/hadoop/conf hadoop-conf /etc/hadoop/conf.cluster 50 
RUN alternatives --set hadoop-conf /etc/hadoop/conf.cluster

# change user 
#USER yarn

# make necessary directories for yarn
RUN mkdir -p /var/lib/hadoop-yarn/data/yarn/local /var/lib/hadoop-yarn/data/yarn/logs
RUN chown -R yarn:yarn /var/lib/hadoop-yarn/data/yarn/local /var/lib/hadoop-yarn/data/yarn/logs
RUN chmod -R 755 /var/lib/hadoop-yarn/data/yarn/local /var/lib/hadoop-yarn/data/yarn/logs

# ports for resourcemanager (also need to use -p in docker run command, see startup.sh)
# yarn.resourcemanager.scheduler.address TCP
EXPOSE 8030
# yarn.resourcemanager.webapp.address TCP
EXPOSE 8088
# yarn.resourcemanager.address TCP
EXPOSE 8032
# yarn.resourcemanager.admin.address TCP
EXPOSE 8033
# yarn.resourcemanager.resource-tracker.address TCP
EXPOSE 8031

# change user back to boot
#USER root

# config supervisor
RUN mv /build/supervisord.conf /etc/

# clean up
RUN rm -rf /build

# run the supervisor to start service
CMD supervisord