FROM        debian:jessie
MAINTAINER  Apiary <sre@apiary.io>

ENV REFRESHED_AT 2015-11-03

COPY requirements.txt /tmp/

RUN apt-get clean && \
    apt-get update && \
    apt-get install -y --no-install-recommends python-sphinx \
    graphviz \
    make \
    texlive \
    texlive-latex-extra \
    texlive-fonts-recommended \
    texlive-fonts-extra \
    python-pip && \
    pip install -r /tmp/requirements.txt && \
    rm -rf /usr/share/doc/* && \
    rm -rf /usr/share/locale/* && \
    rm -rf /var/cache/debconf/*-old && \
    rm -rf /var/lib/apt/lists/* && \
    apt-get autoclean -y && \
    apt-get autoremove -y

RUN mkdir /mnt/docs

WORKDIR /mnt/docs
VOLUME ['/mnt/docs']

CMD make clean html latexpdf