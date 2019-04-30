FROM debian:jessie-slim

RUN apt-get update && \
    apt-get install -y gcc g++ make git-core valgrind ruby ruby-dev ruby-aruba wget && \
    update-alternatives --install /usr/bin/cc cc /usr/bin/gcc 100 && \
    update-alternatives --install /usr/bin/c++ c++ /usr/bin/g++ 100 && \
    wget -O cmake-installer.sh https://github.com/Kitware/CMake/releases/download/v3.13.4/cmake-3.13.4-Linux-x86_64.sh && \
    chmod +x cmake-installer.sh && \
    ./cmake-installer.sh --skip-license --prefix=/usr/local

CMD bash

