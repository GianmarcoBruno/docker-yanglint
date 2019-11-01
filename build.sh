#!/bin/bash
VERSION="0.6"
docker build \
    -t yanglint:${VERSION} \
    -f Dockerfile  .
