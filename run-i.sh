#!/bin/bash
VERSION="0.3"
docker run \
    --rm -it \
    --mount type=bind,source="$(pwd)",target=/opt/yanglint \
    docker-yanglint-i:${VERSION}
