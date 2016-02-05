FROM        ubuntu:14.04
MAINTAINER  Apiary <sre@apiary.io>

ENV REFRESHED_AT 2016-01-25

USER root
RUN apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 7F0CEB10
RUN echo "deb http://repo.mongodb.org/apt/ubuntu trusty/mongodb-org/3.0 multiverse" | tee /etc/apt/sources.list.d/mongodb-org-3.0.list

RUN apt-get update && apt-get install -y mongodb-org=3.0.8 mongodb-org-server=3.0.8 mongodb-org-shell=3.0.8 mongodb-org-mongos=3.0.8 mongodb-org-tools=3.0.8

RUN mkdir -p /data/db

EXPOSE 27017

ENTRYPOINT ["/usr/bin/mongod", "--smallfiles", "--quiet"]
