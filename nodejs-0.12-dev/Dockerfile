FROM        ubuntu:14.04
MAINTAINER  Apiary <sre@apiary.io>

ENV REFRESHED_AT 2015-11-29
ENV NODE_VERSION v0.12.7
ENV NPM_VERSION 2.14.7

RUN apt-get update

RUN apt-get install -y libc6 libc-dev g++ zlib1g-dev build-essential git  libssl1.0.0 libssl-dev libssl-doc curl libpq-dev python tar

# Create user ubuntu
COPY entry.sh /root/entry.sh
RUN /root/entry.sh
# Run install nvm
COPY script.sh /home/ubuntu/script.sh
ENV PATH /home/ubuntu/.nvm/${NODE_VERSION}/bin:$PATH
USER ubuntu
RUN /home/ubuntu/script.sh
