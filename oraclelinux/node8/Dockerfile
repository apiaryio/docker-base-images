FROM        oraclelinux:7-slim
MAINTAINER  Apiary <sre@apiary.io>

ENV REFRESHED_AT 2018-10-10
ENV NPM_VERSION 5.6.0

USER root

RUN yum-config-manager --enable ol7_developer_nodejs8
RUN yum -y install nodejs

COPY . /app
WORKDIR /app

RUN npm i -g npm@${NPM_VERSION}

RUN node -v
RUN npm -v

ENTRYPOINT [ "bash" ]
