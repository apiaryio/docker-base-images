FROM        apiaryio/base-sphinx-doc-dev
MAINTAINER  Apiary <sre@apiary.io>

RUN apt-get update && \
    apt-get install -y npm

RUN ln -s /usr/bin/nodejs /usr/bin/node

RUN npm install -g coffeedoc coffee-script

COPY requirements.txt /tmp/
RUN pip install -r /tmp/requirements.txt

RUN mkdir /mnt/lib

WORKDIR /mnt/lib
VOLUME ["/mnt/lib"]

CMD ["make", "clean", "html"]
