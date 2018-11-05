FROM        oraclelinux:7-slim
MAINTAINER  Apiary <sre@apiary.io>

ENV REFRESHED_AT 2018-10-31

USER root

RUN yum install -y yum-utils && yum-config-manager --enable ol7_developer_EPEL
RUN yum install -y python36

ENTRYPOINT [ "python36" ]
