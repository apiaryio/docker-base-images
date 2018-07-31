FROM python:alpine

RUN apk --no-cache update && \
    pip --no-cache-dir install awscli && \
    rm -rf /var/cache/apk/*
