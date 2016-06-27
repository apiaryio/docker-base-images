FROM        apiaryio/base-dev-nodejs-0.12
MAINTAINER  Apiary <sre@apiary.io>

ENV REFRESHED_AT 2010-06-24

USER root
RUN apt-get update && apt-get install -y wget apt-utils \
    && apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 7F0CEB10 \
    && echo "deb http://repo.mongodb.org/apt/debian wheezy/mongodb-org/3.0 main" | tee /etc/apt/sources.list.d/mongodb-org-3.0.list \
    && wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add - \
    && sh -c 'echo "deb http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google.list' \
    && apt-get update --fix-missing \
    && apt-get install -y mongodb-org-shell=3.0.8 google-chrome-stable xvfb php5-common php5-cli php5-curl libkrb5-dev ruby ruby-dev build-essential libssl-dev \
    && /sbin/ldconfig -v \
    && gem install rest-client \
    && apt-get install -y redis-tools
