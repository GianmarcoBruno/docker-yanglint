#!/bin/bash
VERSION="0.6"
docker run \
    --rm -it \
    --mount type=bind,source="$(pwd)",target=/home/app \
    yanglint:${VERSION}
