# docker-yanglint
This docker image provides the YANG tool yanglint (https://github.com/CESNET/libyang).

The image is based on alpine and turns out to be really small: currently slightly more than 20MB.

Usage: ``build`` to build the image and ``run`` to start the interactive CLI.  
Alternatively you can alias to the content of ``run``.

| version | yanglint | notes |
| ------- | -------- | ------|
| 0.6     | 1.0-rc2  | host current directory is mounted to /home/app in the container. Image renamed simply yanglint:0.6 |
| 0.5     | 1.0-rc2  |  -    |
