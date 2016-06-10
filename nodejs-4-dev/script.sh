#!/bin/bash
curl https://raw.githubusercontent.com/creationix/nvm/v0.31.1/install.sh | bash
echo "[[ -s $HOME/.nvm/nvm.sh ]] && source $HOME/.nvm/nvm.sh" >> ~/.profile
. ~/.nvm/nvm.sh
nvm install ${NODE_VERSION}
nvm alias default ${NODE_VERSION}
npm -g install npm@${NPM_VERSION}
npm -g install coffee-script@1.10.0 grunt-cli@1.2.0
