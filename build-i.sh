#!/bin/bash
VERSION="v0.16-r3"
docker build \
    --add-host dl-cdn.alpinelinux.org:151.101.36.249 \
    --add-host github.com:140.82.118.3 \
    -t docker-yanglint-i:${VERSION} \
    -f Dockerfile-i  .
