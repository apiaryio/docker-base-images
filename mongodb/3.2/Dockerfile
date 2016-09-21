FROM        mongo:3.2.9
MAINTAINER  Apiary <sre@apiary.io>

ENV REFRESHED_AT 2016-09-20

RUN chown -R mongodb:mongodb /data/db

ENTRYPOINT ["/usr/bin/mongod", "--smallfiles", "--quiet"]
