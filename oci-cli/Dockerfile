FROM        apiaryio/oraclelinux:python36
MAINTAINER  Apiary <sre@apiary.io>

ENV REFRESHED_AT 2020-11-02
ENV LC_ALL en_US.UTF-8

RUN pip3 install oci-cli
RUN useradd -m oci
USER oci

ENTRYPOINT [ "oci" ]
