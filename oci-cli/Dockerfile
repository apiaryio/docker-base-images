FROM        apiaryio/oraclelinux:python36
MAINTAINER  Apiary <sre@apiary.io>

ENV REFRESHED_AT 2018-11-06

RUN pip3 install oci-cli

ENTRYPOINT [ "oci", "$@" ]
