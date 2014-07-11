# you may have to build this baseimage first from this repository:
# https://github.com/ambling/baseimage-docker
FROM centos:supervisor

# variables
ENV key val

# add chd5 yum repo for centos6 and install hadoop
RUN mkdir /build
ADD . /build
RUN mv /build/cloudera-cdh5.repo /etc/yum.repos.d/ && yum install -y openssh java-1.6.0-openjdk-devel hadoop-hdfs-namenode

# config hadoop
# you have to configure hostname and ssh public keys first
RUN cp -r /build/conf.cluster /etc/hadoop/
RUN alternatives --install /etc/hadoop/conf hadoop-conf /etc/hadoop/conf.cluster 50 
RUN alternatives --set hadoop-conf /etc/hadoop/conf.cluster

# change user 
# RUN adduser -M hadoop
# RUN adduser -M hdfs  # the installation will automatically add the user of hdfs
USER hdfs

# make necessary directories
RUN mkdir -p /var/lib/hadoop-hdfs/cache/hdfs/dfs/name
# RUN chown -R hdfs:hadoop /var/lib/hadoop-hdfs/cache/hdfs
RUN chmod -R 700 /var/lib/hadoop-hdfs/cache/hdfs/dfs

# format the hdfs
RUN hdfs namenode -format

# ports for namenode (deprecated, use -p in docker run command, see startup.sh)
# fs.default.name/fs.defaultFS TCP
EXPOSE 8020	
# dfs.http.address/dfs.namenode.http-address TCP
EXPOSE 50070	
# dfs.https.address/dfs.namenode.https-address TCP
EXPOSE 50470	

# change user back to boot
USER root

# config supervisor
RUN mv /build/supervisord.conf /etc/

# clean up
RUN rm -rf /build

# run the supervisor to start service
CMD supervisord