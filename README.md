# docker-yanglint
This docker image provides the YANG tool yanglint (https://github.com/CESNET/libyang).

The image is based on alpine and builds yanglint from within the container. 
It turns out to be very small: only 20.6 MB.

Usage: ``build-i`` to build the image and ``run-i`` to start the interactive CLI.  
Alternatively you can alias to the content of ``run-i``.
YANG modules to be processed must be in the directory from where ``run-i`` is executed.

Current version ``0.4`` corresponds to ``v0.16-r3`` of yanglint (https://github.com/CESNET/libyang).
