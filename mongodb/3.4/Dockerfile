# do not upgrade to versions >3.4.18 as they are under the SSPL which is not OSS
FROM        mongo:3.4.18
MAINTAINER  Apiary <sre@apiary.io>

ENV REFRESHED_AT 2019-07-25

RUN chown -R mongodb:mongodb /data/db

ENTRYPOINT ["/usr/bin/mongod", "--smallfiles", "--quiet"]
