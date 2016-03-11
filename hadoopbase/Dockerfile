# you may have to build this baseimage first from this repository:
# https://github.com/ambling/baseimage-docker
FROM centos:supervisor

# variables
#ENV key val

# add chd5 yum repo for centos6 and install hadoop basic repositories
ADD . /tmp
RUN mv /tmp/cloudera-cdh5.repo /etc/yum.repos.d/ && yum install -y openssh openssh-clients java-1.8.0-openjdk-devel hadoop hadoop-hdfs hadoop-mapreduce hadoop-yarn spark-core
# remove the limit that reject the container to su
RUM rm -f /etc/security/limits.d/hdfs.conf /etc/security/limits.d/mapreduce.conf /etc/security/limits.d/yarn.conf

# config supervisor
RUN mv /tmp/supervisord.conf /etc/

# clean up
RUN rm -rf /tmp/*

# run the supervisor to start service
CMD supervisord