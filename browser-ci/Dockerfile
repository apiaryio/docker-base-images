FROM node:9
MAINTAINER  Apiary <sre@apiary.io>
ENV REFRESHED_AT 2018-02-18

USER root

ADD https://dl-ssl.google.com/linux/linux_signing_key.pub .

RUN apt-key add linux_signing_key.pub && \
    echo 'deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main' | tee /etc/apt/sources.list.d/google-chrome.list && \
    apt-get update && \
    apt-get install -y google-chrome-stable firefox-esr
