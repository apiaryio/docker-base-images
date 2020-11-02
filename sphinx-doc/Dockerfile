FROM        debian:stable-slim
MAINTAINER  Apiary <sre@apiary.io>

ENV REFRESHED_AT 2020-11-02

COPY requirements.txt /tmp/

RUN apt-get update && \
    apt-get install -y --no-install-recommends \
        python-sphinx \
        python-yaml \
        python-setuptools \
        graphviz \
        make \
        python-pip \
        git && \
    pip install --upgrade pip setuptools wheel && \
    pip install -r /tmp/requirements.txt

RUN mkdir /mnt/docs

WORKDIR /mnt/docs
VOLUME ["/mnt/docs"]

CMD ["make", "clean", "html"]
