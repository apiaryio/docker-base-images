# https://hub.docker.com/r/mhart/alpine-node/
FROM node:carbon-alpine
# If you have native dependencies, you'll need extra tools

MAINTAINER  Apiary <sre@apiary.io>
ENV REFRESHED_AT 2018-04-17

ARG DREDD_VERSION=latest
RUN echo ${DREDD_VERSION}
RUN apk add --no-cache make gcc g++ python git
RUN npm config set loglevel error
RUN npm install dredd@${DREDD_VERSION}
RUN apk del make gcc g++ python
ENV PATH ${PATH}:/node_modules/.bin

CMD ["dredd"]
