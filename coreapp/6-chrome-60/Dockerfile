FROM        apiaryio/nodejs:6
MAINTAINER  Apiary <sre@apiary.io>

ENV REFRESHED_AT 2017-10-06

ENV MONGO_MAJOR 3.2
ENV MONGO_VERSION 3.2.15
ENV MONGO_GPG=EA312927
USER root

COPY chrome64_60.0.3112.78.deb .

RUN apt-get install -y wget \
    && apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv $MONGO_GPG \
    && echo "deb http://repo.mongodb.org/apt/debian wheezy/mongodb-org/$MONGO_MAJOR main" > /etc/apt/sources.list.d/mongodb-org.list \
    && apt-get update \
    && apt-get install -y mongodb-org-shell=$MONGO_VERSION \
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
                          gconf-service \
                          libasound2 \
                          libatk1.0-0 \
                          libcups2 \
                          libdbus-1-3 \
                          libgconf-2-4 \
                          libgtk-3-0 \
                          libnspr4 \
                          libxss1 \
                          fonts-liberation \
                          libappindicator1 \
                          libnss3 \
                          lsb-release \
                          xdg-utils \
    && dpkg -i chrome64_60.0.3112.78.deb \
    && gem install rest-client \
    && /sbin/ldconfig -v


RUN npm install -g coffee-script@1.11.0 grunt-cli@1.2.0
RUN npm install -g node-gyp
