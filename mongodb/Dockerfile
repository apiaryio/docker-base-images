FROM        mongo:3.0.12
MAINTAINER  Apiary <sre@apiary.io>

ENV REFRESHED_AT 2016-07-18

RUN chown -R mongodb:mongodb /data/db

ENTRYPOINT ["/usr/bin/mongod", "--smallfiles", "--quiet"]
