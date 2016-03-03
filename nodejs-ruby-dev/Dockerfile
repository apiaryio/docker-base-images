FROM        apiaryio/base-dev-nodejs-0.12
MAINTAINER  Apiary <sre@apiary.io>

ENV REFRESHED_AT 2016-02-10
ENV RUBY_VERSION 2.2.3
ENV BUNDLER_VERSION 1.10.6

USER root

# Install dependencies
RUN apt-get clean && \
    apt-get update && \
    apt-get install -y libreadline-dev libyaml-dev libxml2-dev libxslt-dev && \
    apt-get autoclean -y && \
    apt-get autoremove -y && \
    rm -rf /usr/share/doc/* && \
    rm -rf /usr/share/locale/* && \
    rm -rf /var/cache/debconf/*-old && \
    rm -rf /var/lib/apt/lists/*

# Run install rbenv and ruby
COPY script.sh /home/ubuntu/script.sh
ENV PATH /home/ubuntu/.rbenv/bin:$PATH
USER ubuntu
RUN /home/ubuntu/script.sh
