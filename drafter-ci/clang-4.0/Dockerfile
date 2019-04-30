FROM debian:stretch-slim

RUN apt-get update && \
    apt-get install -y clang-4.0 make cmake git-core valgrind ruby ruby-dev ruby-aruba && \
    update-alternatives --install /usr/bin/cc cc /usr/bin/clang-4.0 100 && \
    update-alternatives --install /usr/bin/c++ c++ /usr/bin/clang++-4.0 100

CMD bash

