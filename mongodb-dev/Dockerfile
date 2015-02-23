FROM        ubuntu:14.04
MAINTAINER  Apiary <sre@apiary.io>

ENV REFRESHED_AT 2015-02-23

RUN apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 7F0CEB10
RUN echo 'deb http://downloads-distro.mongodb.org/repo/ubuntu-upstart dist 10gen' | tee /etc/apt/sources.list.d/10gen.list

RUN apt-get update && apt-get install -y mongodb-org=2.6.7 mongodb-org-server=2.6.7 mongodb-org-shell=2.6.7 mongodb-org-mongos=2.6.7 mongodb-org-tools=2.6.7

RUN mkdir -p /data/db

EXPOSE 27017

ENTRYPOINT usr/bin/mongod --smallfiles
