#!/bin/bash

git clone https://github.com/sstephenson/rbenv.git ~/.rbenv
git clone https://github.com/sstephenson/ruby-build.git ~/.rbenv/plugins/ruby-build

echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.bashrc
echo 'eval "$(rbenv init -)"' >> ~/.bashrc

eval "$(rbenv init -)"

rbenv install -v $RUBY_VERSION
rbenv global $RUBY_VERSION

gem install bundler --version $BUNDLER_VERSION
