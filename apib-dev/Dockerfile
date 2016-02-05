FROM        apiaryio/base-dev-nodejs
MAINTAINER  Apiary <sre@apiary.io>

ENV REFRESHED_AT 2015-09-21

RUN npm install -g aglio
USER root
RUN mkdir -p /doc

RUN apt-get update -qqy && \
    apt-get install -y software-properties-common python-software-properties && \
    add-apt-repository -y ppa:ubuntu-toolchain-r/test && \
    apt-get update -y && \
    apt-get install -y   \
      gcc-4.7 \
      g++-4.7 \
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
