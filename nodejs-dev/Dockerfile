FROM        ubuntu:14.04
MAINTAINER  Apiary <sre@apiary.io>

ENV REFRESHED_AT 2015-04-16
ENV NODE_VERSION v0.10.37

RUN apt-get update

RUN apt-get install -y libc6 libc-dev g++ zlib1g-dev build-essential git  libssl1.0.0 libssl-dev libssl-doc curl libpq-dev python tar

# Create user ubuntu
ADD entry.sh /root/entry.sh
RUN /root/entry.sh
# Run install nvm
ADD script.sh /home/ubuntu/script.sh
ENV PATH /home/ubuntu/.nvm/${NODE_VERSION}/bin:$PATH
USER ubuntu
RUN /home/ubuntu/script.sh
