FROM        apiaryio/debian-minimal
MAINTAINER  Apiary <sre@apiary.io>

ENV REFRESHED_AT 2016-07-18

COPY requirements.txt /tmp/

RUN apt-get update &&\
    apt-get install -y --no-install-recommends \
        python-sphinx \
        python-yaml \
        graphviz \
        make \
        python-pip && \
    pip install -r /tmp/requirements.txt

RUN mkdir /mnt/docs

WORKDIR /mnt/docs
VOLUME ["/mnt/docs"]

CMD ["make", "clean", "html"]
