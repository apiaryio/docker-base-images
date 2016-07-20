FROM        debian:jessie
MAINTAINER  Apiary <sre@apiary.io>

ENV REFRESHED_AT 2016-02-15

RUN apt-get update && \
  apt-get upgrade -y && \
  apt-get clean -y && \
  apt-get autoclean -y && \
  apt-get autoremove -y && \
  rm -rf /usr/share/locale/* && \
  rm -rf /var/cache/debconf/*-old && \
  rm -rf /var/lib/apt/lists/* && \
  rm -rf /usr/share/doc/*
