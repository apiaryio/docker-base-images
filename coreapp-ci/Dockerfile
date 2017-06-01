FROM        apiaryio/debian-minimal
MAINTAINER  Apiary <sre@apiary.io>

ENV REFRESHED_AT 2017-05-05

ENV DOCKER_VERSION="17.03.0~ce-0~debian-jessie"
USER root

RUN apt-get update \
    && apt-get install -y --no-install-recommends \
        apt-transport-https \
        ca-certificates \
        curl \
        gnupg2 \
        software-properties-common \
        python-pip \
        libpython-dev \
        gawk \
    && curl -fsSL https://download.docker.com/linux/debian/gpg | apt-key add - \
    && apt-add-repository \
          "deb [arch=amd64] https://download.docker.com/linux/debian \
          jessie \
          stable" \
    && apt-get update \
    && apt-get install -y docker-ce=$DOCKER_VERSION \
    && curl -L https://github.com/docker/compose/releases/download/1.11.2/docker-compose-`uname -s`-`uname -m` > /usr/local/bin/docker-compose \
    && chmod +x /usr/local/bin/docker-compose

RUN pip install six pyopenssl ndg-httpsclient pyasn1 awscli
