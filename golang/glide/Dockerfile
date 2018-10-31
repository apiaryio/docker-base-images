FROM golang
MAINTAINER sre@apiary.io

ENV REFRESHED_AT 2018-10-31

RUN curl -L -o glide.tar.gz https://github.com/Masterminds/glide/releases/download/v0.13.1/glide-v0.13.1-linux-amd64.tar.gz \
    && tar -zxf glide.tar.gz \
    && mv linux-amd64/glide ~/glide
