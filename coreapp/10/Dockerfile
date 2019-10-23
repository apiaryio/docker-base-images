FROM        apiaryio/nodejs:10
MAINTAINER  Apiary <sre@apiary.io>

ENV REFRESHED_AT 2019-10-23

USER root

RUN apt-get update \
    && apt-get install -y wget apt-transport-https ca-certificates \
    && wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add - \
    && sh -c 'echo "deb https://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google.list' \
    && wget -q https://packages.sury.org/php/apt.gpg -O- | apt-key add - \
    && sh -c 'echo "deb https://packages.sury.org/php/ jessie main" >> /etc/apt/sources.list.d/php.list' \
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

