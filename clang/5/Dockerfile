FROM ubuntu:16.04

ENV CLANG_VERSION=5.0.2

RUN apt-get update && \
    apt-get install -y curl xz-utils python build-essential git-core && \
    curl -sL -o /tmp/clang-$CLANG_VERSION.tar.xz.sig http://releases.llvm.org/$CLANG_VERSION/clang+llvm-$CLANG_VERSION-x86_64-linux-gnu-ubuntu-16.04.tar.xz.sig && \
    curl -sL -o /tmp/clang-$CLANG_VERSION.tar.xz http://releases.llvm.org/$CLANG_VERSION/clang+llvm-$CLANG_VERSION-x86_64-linux-gnu-ubuntu-16.04.tar.xz && \
    gpg --keyserver ha.pool.sks-keyservers.net --recv-keys 474E22316ABF4785A88C6E8EA2C794A986419D8A && \
    gpg --verify /tmp/clang-$CLANG_VERSION.tar.xz.sig && \
    tar xvf /tmp/clang-$CLANG_VERSION.tar.xz -C /opt && \
    rm -fr /tmp/*

ENV CC=clang
ENV CXX=clang++
ENV PATH="/opt/clang+llvm-$CLANG_VERSION-x86_64-linux-gnu-ubuntu-16.04/bin:${PATH}"

CMD bash
