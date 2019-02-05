# docker-yanglint
This docker image provides the YANG tool yanglint (https://github.com/CESNET/libyang).

The image is based on alpine and builds yanglint from within the container. 

Usage: ``build-i`` to build the image and ``run-i`` to start the interactive CLI.  
Alternatively you can alias to the content of ``run-i``.
YANG modules to be processed must be in the directory from where ``run-i`` is executed.

The tagging follows the yanglint (https://github.com/CESNET/libyang) one.
