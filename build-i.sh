#!/bin/bash
VERSION="0.5"
docker build \
    -t docker-yanglint-i:${VERSION} \
    -f Dockerfile-i  .
