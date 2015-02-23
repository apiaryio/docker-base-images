FROM        ubuntu:14.04
MAINTAINER  Apiary <sre@apiary.io>

ENV REFRESHED_AT 2015-02-23

RUN apt-get update && apt-get install -y redis-server

EXPOSE 6379

ENTRYPOINT  ["/usr/bin/redis-server"]
