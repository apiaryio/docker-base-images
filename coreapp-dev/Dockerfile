FROM        apiaryio/base-dev-nodejs
MAINTAINER  Apiary <sre@apiary.io>

ENV REFRESHED_AT 2010-02-05

USER root
RUN apt-get install -y wget \
    && apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 7F0CEB10 \
    && echo "deb http://repo.mongodb.org/apt/ubuntu trusty/mongodb-org/3.0 multiverse" | tee /etc/apt/sources.list.d/mongodb-org-3.0.list \
    && wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add - \
    && sh -c 'echo "deb http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google.list' \
    && dpkg --add-architecture i386 \
    && apt-get update \
    && apt-get install -y mongodb-org-shell=3.0.8 google-chrome-stable libgtk2.0-0:i386 xvfb php5-common php5-cli php5-curl libkrb5-dev ruby-dev build-essential libssl-dev \
    && /sbin/ldconfig -v \
    && gem install rest-client \
    && apt-get install -y redis-tools
