FROM alpine:3.8

MAINTAINER Gianmarco Bruno "gianmarco.bruno@ericsson.com"

# toolchain
RUN apk update && apk add --no-cache binutils cmake make libgcc gcc g++

RUN apk update && apk add --no-cache musl-dev
RUN apk update && apk add --no-cache git
RUN apk update && apk add --no-cache pcre pcre-dev
RUN mkdir /opt && cd /opt && \
    git clone https://github.com/CESNET/libyang.git
RUN cd /opt/libyang && mkdir build && cd build && cmake .. && \
    make && make install

#RUN cd /opt/libyang && \
#    rm -rf .git tests swig src build/CMakefiles

# suppress annoying message at startup
RUN mkdir /root/.yanglint

# to make the build target directory visible
ENV PATH="/opt/libyang/build:${PATH}"

# this is where the volume will be mounted
WORKDIR /opt/yanglint
ENTRYPOINT ["yanglint"]
