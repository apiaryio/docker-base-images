FROM        node:0.12
MAINTAINER  Apiary <sre@apiary.io>

ENV REFRESHED_AT 2016-10-19
ENV NPM_VERSION=2.15.11

USER root
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
