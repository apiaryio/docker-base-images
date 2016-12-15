FROM alpine
MAINTAINER sre@apiary.io

ENV REFRESHED_AT 2016-12-13

RUN mkdir -p /go/bin && chmod -R 777 /go
ENV GOPATH /go
ENV PATH /go/bin:$PATH

COPY ghostunnel /go/bin

RUN apk add --update redis ca-certificates

# Configure redis to listen on UNIX socket
RUN \
  sed -i 's/^\(bind .*\)$/# \1/' /etc/redis.conf && \
  sed -i 's/^\(daemonize .*\)$/# \1/' /etc/redis.conf && \
  sed -i 's/^\(dir .*\)$/dir \/data/' /etc/redis.conf && \
  sed -i 's/^\(logfile .*\)$/# \1/' /etc/redis.conf && \
  sed -i 's/^\(port .*\)$/port 0/' /etc/redis.conf && \
  sed -i 's/^# \(unixsocket .*\)$/\1/' /etc/redis.conf && \
  sed -i 's/^# \(unixsocketperm .*\)$/\1/' /etc/redis.conf && \
  mkdir -p /data && mkdir -p /data/secrets && \
  chown -R redis:redis /data &&  chown -R redis:redis /data/secrets

# Define mountable directories.
VOLUME ["/data"]
VOLUME ["/data/secrets"]

WORKDIR /data

COPY entry.sh /entry.sh
ENTRYPOINT ["/entry.sh"]

EXPOSE 6379

# To run, with given arguments to terminate TLS connections (for example):
#     docker run \
#       --name redis-tls \
#       -p 6379:6379 \
#       -v $SECRETS_PATH:/secrets \
#       redis-tls \
#       --keystore=/secrets/server-keystore.p12 \
#       --cacert=/secrets/ca-bundle.crt \
#       --allow-cn client
