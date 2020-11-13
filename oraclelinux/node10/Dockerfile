FROM        oraclelinux:7-slim
MAINTAINER  Apiary <sre@apiary.io>

ENV REFRESHED_AT 2020-11-13
ENV NODEJS_VERSION_MAJOR 10
ENV NPM_VERSION 6.4.1

USER root

RUN yum install -y oracle-nodejs-release-el7 \
    && yum-config-manager --enable ol7_developer_nodejs${NODEJS_VERSION_MAJOR} \
    && yum install -y nodejs-${NODEJS_VERSION_MAJOR}.* \
    && yum install -y gcc gcc-c++ autoconf automake make \
    && npm i -g npm@${NPM_VERSION} \
    && yum clean all \
    && mkdir -p /app

WORKDIR /app

RUN node -v
RUN npm -v

ENTRYPOINT [ "bash" ]
