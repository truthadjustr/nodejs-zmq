FROM ubuntu:latest
MAINTAINER truthadjustr@gmail.com
LABEL description="nodejs 5.x and zmq support because nodejs 6.x has nan error"

RUN apt-get update && apt-get install -y --no-install-recommends ca-certificates \
    build-essential \
    wget \
    curl \
    git \
    libtool \
    autoconf \
    automake \
    pkg-config \
    python \
    && curl -sL https://deb.nodesource.com/setup_5.x | bash - \
    && apt-get install -y nodejs \
    && git clone https://github.com/zeromq/libzmq \
    && cd libzmq \
    && ./autogen.sh && ./configure && make && make install && ldconfig && cd /root/testapps/ \
    && npm install zmq \
    && mkdir -p /root/testapps/
    && git clone https://github.com/jimbojw/node-zmq-talk.git

COPY dotbashrc /root/.bashrc
COPY welcome.ascii /etc/
