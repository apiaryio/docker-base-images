FROM        debian:jessie
MAINTAINER  Apiary <sre@apiary.io>

ENV REFRESHED_AT 2015-09-10

RUN apt-get clean

RUN apt-get update

RUN apt-get install -y python-sphinx \
    graphviz \
    make \
    texlive \
    texlive-latex-extra \
    texlive-fonts-recommended \
    texlive-fonts-extra \
    python-pip

COPY requirements.txt /tmp/
RUN pip install -r /tmp/requirements.txt

RUN mkdir /docs

WORKDIR /docs
VOLUME ['/docs']

CMD make clean html latexpdf
