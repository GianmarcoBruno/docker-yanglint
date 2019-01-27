# docker-yanglint
This docker image provides the YANG tool yanglint (https://github.com/CESNET/libyang).

The image is based on alpine and builds yanglint from within the container. 

Usage: ``docker run --rm -it -v `pwd`:`pwd` docker-yanglint``
