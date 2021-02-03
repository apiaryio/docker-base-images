FROM        oraclelinux:7-slim
LABEL       maintainer="Apiary <sre@apiary.io>"

ENV REFRESHED_AT 2021-02-02

USER root

RUN yum install -y yum-utils && yum-config-manager --enable ol7_developer_EPEL && \
    yum install -y scl-utils python36 python36-setuptools && \
    easy_install-3.6 pip

ENTRYPOINT [ "/usr/bin/python3" ]
