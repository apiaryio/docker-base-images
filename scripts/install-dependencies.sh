#!/bin/bash
wget https://github.com/jwilder/docker-squash/releases/download/v0.2.0/docker-squash-linux-amd64-v0.2.0.tar.gz -O /tmp/docker-squash.tar
sudo tar -C /usr/local/bin -xzvf /tmp/docker-squash.tar
npm -g install dockerlint