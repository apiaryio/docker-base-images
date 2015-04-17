#!/bin/bash
curl https://raw.githubusercontent.com/creationix/nvm/v0.23.0/install.sh | bash
echo "[[ -s $HOME/.nvm/nvm.sh ]] && source $HOME/.nvm/nvm.sh" >> ~/.profile
. ~/.nvm/nvm.sh
nvm install v0.10.37
nvm alias default v0.10.37
npm -g install npm@2.7.6
npm -g install coffee-script@1.8.0 grunt-cli@0.1.13
