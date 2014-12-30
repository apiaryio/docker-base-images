FROM ubuntu:14.04
MAINTAINER Lukas Linhart "lukas@apiary.io"

ENV REFRESHED_AT 2014-12-30

RUN apt-get update -qqy && \
    apt-get install -y software-properties-common python-software-properties && \
    add-apt-repository -y ppa:ubuntu-toolchain-r/test && \
    apt-get update -y && \
    apt-get install -y   \
      gcc-4.7 \
      g++-4.7 \
      gdb \
      build-essential \
      git-core \
      ruby \
      ruby-dev \
      bundler && \
    apt-get clean

RUN echo "gem: --no-ri --no-rdoc" > ~/.gemrc
