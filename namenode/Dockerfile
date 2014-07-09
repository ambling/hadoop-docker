# you may have to build this baseimage first from this repository:
# https://github.com/ambling/baseimage-docker
FROM centos:supervisor

# variables
ENV key val

# add chd5 yum repo for centos6 and install hadoop
RUN mkdir /build
ADD . /build
#RUN rpm -Uvh /build/cloudera-cdh-5-0.x86_64.rpm
RUN rpm -Uvh http://archive.cloudera.com/cdh5/one-click-install/redhat/6/x86_64/cloudera-cdh-5-0.x86_64.rpm
RUN yum install -y openssh hadoop-hdfs-namenode

# config hadoop
# you have to configure hostname and ssh public keys first
RUN cp -r /build/conf.cluster /etc/hadoop/
RUN alternatives --install /etc/hadoop/conf hadoop-conf /etc/hadoop/conf.cluster 50 
RUN alternatives --set hadoop-conf /etc/hadoop/conf.cluster

# add necessary user
# RUN adduser -M hadoop
# RUN adduser -M hdfs  # the installation will automatically add the user of hdfs

# make necessary directories
RUN mkdir -p /var/lib/hadoop-hdfs/cache/hdfs/dfs/name
RUN chown -R hdfs:hdfs /var/lib/hadoop-hdfs/cache/hdfs
RUN chmod -R 700 /var/lib/hadoop-hdfs/cache/hdfs/dfs

# format the hdfs
RUN sudo -u hdfs hdfs namenode -format

# ports for namenode
EXPOSE 8020	# fs.default.name/fs.defaultFS TCP
EXPOSE 50070	# dfs.http.address/dfs.namenode.http-address TCP
EXPOSE 50470	# dfs.https.address/dfs.namenode.https-address TCP

# config supervisor
RUN mv /build/supervisord.conf /etc/

# clean up
RUN rm -rf /build

# run the supervisor to start service
CMD supervisord -c /etc/supervisord.conf