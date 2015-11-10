FROM        apiaryio/base-sphinx-doc-dev
MAINTAINER  Apiary <sre@apiary.io>

ENV REFRESHED_AT 2015-11-03

RUN apt-get clean && \
    apt-get update && \
    apt-get install -y --no-install-recommends texlive \
    texlive-latex-extra \
    texlive-fonts-recommended \
    texlive-fonts-extra && \
    rm -rf /usr/share/doc/* && \
    rm -rf /usr/share/locale/* && \
    rm -rf /var/cache/debconf/*-old && \
    rm -rf /var/lib/apt/lists/* && \
    apt-get autoclean -y && \
    apt-get autoremove -y

CMD make clean html latexpdf