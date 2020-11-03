FROM        circleci/node:10
MAINTAINER  Apiary <sre@apiary.io>

ENV REFRESHED_AT 2020-11-02
ENV NPM_VERSION 6.4.1

USER root

RUN apt-get update \
    && apt-get install -y --no-install-recommends gawk python-pip python-dev python-setuptools \
    && pip install -U awscli \
    && npm i -g npm@${NPM_VERSION}

USER circleci
