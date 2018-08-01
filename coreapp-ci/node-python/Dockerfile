FROM        circleci/node:8
MAINTAINER  Apiary <sre@apiary.io>

ENV REFRESHED_AT 2018-08-01
ENV NPM_VERSION 4.6.1

USER root

RUN apt-get update \
    && apt-get install -y --no-install-recommends gawk python-pip python-dev \
    && pip install -U awscli \
    && npm i -g npm@${NPM_VERSION}

USER circleci
