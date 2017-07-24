FROM        circleci/python
MAINTAINER  Apiary <sre@apiary.io>

ENV REFRESHED_AT 2017-07-24

USER root

RUN apt-get update \
    && apt-get install -y --no-install-recommends gawk \
    && pip install -U awscli

USER circleci
