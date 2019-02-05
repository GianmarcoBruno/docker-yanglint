#!/bin/bash
VERSION="v0.16-r3"
docker run \
    --rm -it \
    --mount type=bind,source="$(pwd)",target=/opt/yanglint \
    docker-yanglint-i:${VERSION}
