FROM        mongo:3.2.11
MAINTAINER  Apiary <sre@apiary.io>

ENV REFRESHED_AT 2017-01-13

RUN chown -R mongodb:mongodb /data/db

ENTRYPOINT ["/usr/bin/mongod", "--smallfiles", "--quiet"]
