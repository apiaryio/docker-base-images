FROM        mongo:3.2.15
MAINTAINER  Apiary <sre@apiary.io>

ENV REFRESHED_AT 2017-07-24

RUN chown -R mongodb:mongodb /data/db

ENTRYPOINT ["/usr/bin/mongod", "--smallfiles", "--quiet"]
