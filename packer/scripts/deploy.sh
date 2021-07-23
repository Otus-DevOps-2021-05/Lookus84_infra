#!/bin/bash
sleep 20
sudo apt-get -y  install git
git clone -b monolith https://github.com/express42/reddit.git
gem install bundler
cd reddit && sudo bundle install

sudo systemctl start puma
sudo systemctl enable puma
