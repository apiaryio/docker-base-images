FROM        node:10.15.3-stretch
MAINTAINER  Apiary <sre@apiary.io>

ENV REFRESHED_AT 2019-08-13
ENV NPM_VERSION=6.4.1

USER root

# due to https://github.com/nodejs/docker-node/commit/4a722c29c0e52624af8b72b4711ebeba8ea39463
RUN userdel node

RUN apt-get update && \
    apt-get -y upgrade && \
    apt-get clean -y && \
    apt-get autoclean -y && \
    apt-get autoremove -y && \
    rm -rf /usr/share/locale/* && \
    rm -rf /var/cache/debconf/*-old && \
    rm -rf /var/lib/apt/lists/* && \
    rm -rf /usr/share/doc/*

RUN npm install -g npm@$NPM_VERSION
