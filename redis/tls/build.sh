#!/bin/bash

docker run -v "${PWD}"/redis/tls/:/go/bin apiaryio/golang go get -u github.com/square/ghostunnel

docker build --no-cache -t apiaryio/redis:tls -f redis/tls/Dockerfile redis/tls/
