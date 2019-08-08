FROM        apiaryio/nodejs:10
MAINTAINER  Apiary <sre@apiary.io>

ENV REFRESHED_AT 2019-08-08

USER root

RUN apt-get install -y wget \
    && wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add - \
    && echo "deb http://ftp.debian.org/debian jessie-backports main" >> /etc/apt/sources.list.d/jessie.backports.list \
    && sh -c 'echo "deb http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google.list' \
    && apt-get update \
    && apt-get install -y google-chrome-stable \
                          xvfb \
                          php-common \
                          php-cli \
                          php-curl \
                          libkrb5-dev \
                          ruby \
                          ruby-dev \
                          build-essential \
                          libssl-dev \
                          redis-tools \
                          vnc4server \
    && gem install rest-client \
    && /sbin/ldconfig -v

RUN npm install -g coffee-script@1.11.0 grunt-cli@1.2.0
RUN npm install -g node-gyp
