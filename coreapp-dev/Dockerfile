FROM        apiaryio/base-dev-nodejs
MAINTAINER  Apiary <sre@apiary.io>

USER root
RUN apt-get install -y wget \
    && apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 7F0CEB10 \
    && echo 'deb http://downloads-distro.mongodb.org/repo/ubuntu-upstart dist 10gen' | tee /etc/apt/sources.list.d/10gen.list  \
    && wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add - \
    && sudo sh -c 'echo "deb http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google.list' \
    && dpkg --add-architecture i386 \
    && apt-get update \
    && apt-get install -y mongodb-org-shell=2.6.7 google-chrome-stable libgtk2.0-0:i386 xvfb php5-common \
    && /sbin/ldconfig -v \
    && apt-get install -y redis-tools
