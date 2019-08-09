FROM        apiaryio/nodejs:10
MAINTAINER  Apiary <sre@apiary.io>

ENV REFRESHED_AT 2019-08-09

ENV MONGO_MAJOR 3.4
ENV MONGO_VERSION 3.4.18
ENV MONGO_GPG=EA312927
USER root

RUN apt-get install -y wget \

    && wget -qO - https://www.mongodb.org/static/pgp/server-$MONGO_MAJOR.asc | apt-key add - \
    && sh -c 'echo "deb http://repo.mongodb.org/apt/debian jessie/mongodb-org/$MONGO_MAJOR main" >> /etc/apt/sources.list.d/mongodb-org.list' \
    && wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add - \
    && sh -c 'echo "deb http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google.list' \
    && wget -q https://packages.sury.org/php/apt.gpg -O- | apt-key add - \
    && sh -c 'echo "deb http://packages.sury.org/php/ jessie main" >> /etc/apt/sources.list.d/php.list' \
    && apt-get update \
    && apt-get install -y mongodb-org-shell=$MONGO_VERSION \
                          google-chrome-stable \
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

