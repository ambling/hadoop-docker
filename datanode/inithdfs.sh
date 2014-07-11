#!/bin/bash

# This script is used to initialize the hdfs directory after the hdfs is started.
# These directories are used by yarn.
# This operations are consistant with the CDH5 documents at:
# http://www.cloudera.com/content/cloudera-content/cloudera-docs/CDH5/latest/CDH5-Installation-Guide/cdh5ig_hdfs_cluster_deploy.html?scroll=concept_xty_s3h_nj_unique_1

# Create the history Directory and Set Permissions and Owner
sudo -u hdfs hadoop fs -mkdir -p /user/history
sudo -u hdfs hadoop fs -chmod -R 1777 /user/history
sudo -u hdfs hadoop fs -chown mapred:hadoop /user/history

# Create Log Directories
sudo -u hdfs hadoop fs -mkdir -p /var/log/hadoop-yarn
sudo -u hdfs hadoop fs -chown yarn:mapred /var/log/hadoop-yarn

# Create a Home Directory for each MapReduce User (take ambling as an example)
sudo -u hdfs hadoop fs -mkdir  /user/ambling
sudo -u hdfs hadoop fs -chown ambling /user/ambling

# Verify the HDFS File Structure
sudo -u hdfs hadoop fs -ls -R /