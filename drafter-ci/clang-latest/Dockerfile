FROM debian:sid-slim

RUN apt-get update && \
    apt-get install -y clang-8 cmake git-core valgrind ruby ruby-dev ruby-aruba && \
    update-alternatives --install /usr/bin/cc cc /usr/bin/clang-8 100 && \
    update-alternatives --install /usr/bin/c++ c++ /usr/bin/clang++-8 100

CMD bash

