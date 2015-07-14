FROM        debian:jessie
MAINTAINER  Apiary <sre@apiary.io>

ENV REFRESHED_AT 2015-07-14

RUN apt-get update

RUN apt-get install -y python-sphinx \
    graphviz \
    make \
    texlive \
    texlive-latex-extra \
    python-pip

COPY requirements.txt /tmp/
RUN pip install -r /tmp/requirements.txt

RUN mkdir /docs

WORKDIR /docs
VOLUME ['/docs']

CMD make clean html latexpdf
