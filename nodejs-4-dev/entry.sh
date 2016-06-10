#!/bin/bash
adduser --disabled-password --gecos '' ubuntu
adduser ubuntu sudo
echo '%sudo ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers

