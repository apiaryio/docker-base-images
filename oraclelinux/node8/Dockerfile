FROM        oraclelinux:7-slim
MAINTAINER  Apiary <sre@apiary.io>

ENV REFRESHED_AT 2019-11-20
ENV NODEJS_VERSION_MAJOR 8
ENV NPM_VERSION 5.6.0

USER root

USER root

RUN yum install -y oracle-nodejs-release-el7 \
    && yum-config-manager --enable ol7_developer_nodejs${NODEJS_VERSION_MAJOR} \
    && yum install -y nodejs \
    && npm i -g npm@${NPM_VERSION} \
    && mkdir -p /app

WORKDIR /app

RUN node -v
RUN npm -v

ENTRYPOINT [ "bash" ]
