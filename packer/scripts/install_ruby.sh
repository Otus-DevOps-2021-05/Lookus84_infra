#!/bin/bash
echo "Sleep 20 sec"; sleep 30s; echo "start ruby install"
apt-get update
apt-get  install -y ruby-full ruby-bundler build-essential
