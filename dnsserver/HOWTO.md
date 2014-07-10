How to configure the necessary environment and build the image
====================================

*This images is bases on the supervisored image of centos6 in [this repository](https://github.com/ambling/baseimage-docker), you may have to build it and tag it before further steps*

Steps
------------

1. change the names as well as contents of the two zone files, and change the value of YOUR_DOMAIN in Dockerfile, too.
2. run build.sh and startup.sh to start the container.
3. run docker inspect of this container to get the ip addresss (usually 172.17.42.x).
4. attach the container and change the content in zone files and restart the service by:

'''
service named restart
'''

5. everytime a new node container is started, link and bind the dns to this container first, then inspect its ip address and update the zone records in this container.
