FROM debian:sid-slim

RUN apt-get update && \
    apt-get install -y gcc g++ cmake git-core valgrind ruby ruby-dev ruby-aruba && \
    update-alternatives --install /usr/bin/cc cc /usr/bin/gcc 100 && \
    update-alternatives --install /usr/bin/c++ c++ /usr/bin/g++ 100

CMD bash

