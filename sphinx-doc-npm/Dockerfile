FROM        apiaryio/sphinx-doc
MAINTAINER  Apiary <sre@apiary.io>

ENV REFRESHED_AT 2018-05-25

COPY requirements.txt /tmp/

RUN apt-get install -y npm && \
    pip install -r /tmp/requirements.txt

RUN ln -s /usr/bin/nodejs /usr/bin/node

RUN npm install -g coffeedoc coffee-script

RUN mkdir /mnt/lib

WORKDIR /mnt/lib
VOLUME ["/mnt/lib"]

CMD ["make", "clean", "html"]
