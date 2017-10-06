FROM        apiaryio/nodejs:6
MAINTAINER  Apiary <sre@apiary.io>

ENV REFRESHED_AT 2017-12-15

ENV MONGO_MAJOR 3.2
ENV MONGO_VERSION 3.2.15
ENV MONGO_GPG=EA312927
ENV CHROME_VERSION=59.0.3071.86
USER root

COPY chrome64_$CHROME_VERSION.deb .

RUN apt-get install -y wget \
    && apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv $MONGO_GPG \
    && echo "deb http://repo.mongodb.org/apt/debian wheezy/mongodb-org/$MONGO_MAJOR main" > /etc/apt/sources.list.d/mongodb-org.list \
    && wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add - \
    && sh -c 'echo "deb http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google.list' \
    && apt-get update \
    && apt-get install -y mongodb-org-shell=$MONGO_VERSION \
                          google-chrome-stable \
                          xvfb \
                          php5-common \
                          php5-cli \
                          php5-curl \
                          libkrb5-dev \
                          ruby \
                          ruby-dev \
                          build-essential \
                          libssl-dev \
                          redis-tools \
                          vnc4server \
    && dpkg -i chrome64_$CHROME_VERSION.deb \
    && gem install rest-client \
    && /sbin/ldconfig -v

RUN npm install -g coffee-script@1.11.0 grunt-cli@1.2.0
RUN npm install -g node-gyp
