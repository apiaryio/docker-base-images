FROM        debian:jessie
MAINTAINER  Apiary <sre@apiary.io>

ENV REFRESHED_AT 2015-07-02

RUN apt-get update

RUN apt-get install -y python-sphinx \
    graphviz \
    make \
    pandoc \
    texlive \
    texlive-latex-extra \
    sphinx_rtd_theme

RUN mkdir /docs

WORKDIR /docs
VOLUME ['/docs']

CMD make clean convert html latexpdf
