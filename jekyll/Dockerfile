FROM        apiaryio/debian-minimal
MAINTAINER  Apiary <sre@apiary.io>

ENV REFRESHED_AT 2018-07-13

# Requirements for installing using bundler
# nodejs intentional as it is required as a javascript runtime for some ruby packages
RUN apt-get update && \
    apt-get install -y \
    locales curl autoconf bison \
    build-essential libssl-dev libyaml-dev libreadline6-dev zlib1g-dev libncurses5-dev libffi-dev libgdbm3 libgdbm-dev \
    git bundler ruby ruby-libxml nodejs

RUN apt-get clean -y && \
    apt-get autoclean -y && \
    apt-get autoremove -y

# Prepare UTF-8 environment, otehrwise jekyll will not run
RUN locale-gen --purge C.UTF-8 && \
    update-locale LC_ALL="C.UTF-8"

# Set up user, and allow sudo as some bundler packages need it
RUN mkdir -p /srv/jekyll && \
    useradd -m jekyll

WORKDIR /srv/jekyll
