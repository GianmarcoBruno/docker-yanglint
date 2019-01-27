FROM alpine:3.8

MAINTAINER Gianmarco Bruno "gianmarco.bruno@ericsson.com"

# not /opt/libyang otherwise git refuses to clone ..
WORKDIR /opt

# toolchain
RUN apk update && apk add binutils cmake make libgcc gcc g++

RUN apk update && apk add musl-dev
RUN apk update && apk add git
RUN apk update && apk add pcre pcre-dev
RUN cd /opt && \
    git clone https://github.com/CESNET/libyang.git
RUN cd libyang && mkdir build && cd build && cmake .. && \
    make && make install

# suppress annoying message at startup
RUN mkdir /root/.yanglint

# to make the build target directory visible
ENV PATH="/opt/libyang/build:${PATH}"

ENTRYPOINT ["yanglint"]
