FROM        node:boron
MAINTAINER  Apiary <sre@apiary.io>

ENV REFRESHED_AT 2018-04-16

RUN npm install -g aglio
USER root
RUN mkdir -p /doc

RUN apt-get update -qqy && \
    apt-get install -y software-properties-common python-software-properties && \
    echo "deb http://ftp.us.debian.org/debian unstable main contrib non-free" > /etc/apt/sources.list.d/unstable.list && \
    apt-get update -y && \
    apt-get install -y   \
      gcc-5 \
      gdb \
      build-essential \
      git-core \
      ruby \
      ruby-dev \
      bundler && \
    apt-get clean

RUN echo "gem: --no-ri --no-rdoc" > ~/.gemrc

RUN git clone --recursive https://github.com/apiaryio/drafter.git /tmp/drafter
RUN cd /tmp/drafter && ./configure && make install

CMD ["bash"]
