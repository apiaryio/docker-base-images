FROM        circleci/python
MAINTAINER  Apiary <sre@apiary.io>

ENV REFRESHED_AT 2019-05-10

USER root

RUN apt-get update \
  && apt-get install -y --no-install-recommends gawk \
  && pip install -U awscli oci-cli

USER circleci
