FROM alpine
MAINTAINER sre@apiary.io

ENV REFRESHED_AT 2016-12-14

RUN apk update && \
    apk add alpine-sdk \
      gcc \
      g++ \
      gdb \
      git \
      ruby \
      ruby-dev \
      ruby-bundler \
      build-base libffi-dev

RUN echo "gem: --no-ri --no-rdoc" > ~/.gemrc
