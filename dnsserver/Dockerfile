# you may have to build this baseimage first from this repository:
# https://github.com/ambling/baseimage-docker
FROM centos:supervisor
MAINTAINER Ambling <ambling07@gmail.com>

# variables, you can change it according to your purpose
ENV YOUR_DOMAIN ambling.org

# copy necessary files and install bind
RUN mkdir /build
ADD . /build
RUN yum install -y bind

# config bind
RUN cd /etc/named && mkdir -p zones/master && cd zones/master && cp /build/db.$YOUR_DOMAIN . && cp /build/db.172.17 . && mv /build/named.conf /etc/
RUN chown -R root:named /etc/named*
EXPOSE 53

# config supervisor
RUN mv /build/supervisord.conf /etc/

# clean up
RUN rm -rf /build

# start the service and run the bash to allow reconfigure the named zones
CMD service named restart && /bin/bash