FROM alpine:3.8 as mybuilder

MAINTAINER Gianmarco Bruno "gianmarco.bruno@ericsson.com"

ENV VERSION=0.6
ENV LIBYANG_VERSION=v1.0-r2

# toolchain
RUN apk update && apk add binutils cmake make libgcc gcc
RUN apk update && apk add musl-dev git pcre pcre-dev
RUN mkdir /opt && cd /opt && \
    git clone https://github.com/CESNET/libyang.git && \
    cd libyang && git checkout tags/${LIBYANG_VERSION}

# we want that positive validation corresponds to no messages at all
# so to suppress them we remove lines before building yanglint
RUN cd /opt/libyang && git checkout ${LIBYANG_VERSION} -b ${LIBYANG_VERSION} && \
    sed -i '/load_config();/d' tools/lint/main.c && \
    sed -i '/store_config();/d' tools/lint/main.c && \
    mkdir build && cd build && cmake -D CMAKE_BUILD_TYPE:String="Release" .. && \
    make && make install

# builder pattern

FROM alpine:3.8

RUN mkdir -p /home/app/.yanglint/

# to make the build target directory visible
ENV PATH="/opt/libyang/build:${PATH}"

COPY --from=mybuilder /opt/libyang/build/* /opt/libyang/build/

# yanglint libraries
COPY --from=mybuilder /usr/local/lib64/* /usr/local/lib64/
COPY --from=mybuilder /usr/local/lib64/libyang/extensions /usr/local/lib64/libyang/extensions
COPY --from=mybuilder /usr/local/lib64/libyang/user_types /usr/local/lib64/libyang/user_types

# pcre runtime libraries
RUN apk update && apk add pcre pcre-dev

RUN adduser -D -H app
USER app

# target location for bind mount in the run script
WORKDIR /home/app
ENTRYPOINT ["yanglint"]
