#!/usr/bin/env bash

apt-get install \
    build-essential \
    tcl \
    --yes

curl -O https://download.redis.io/releases/redis-7.0.0.tar.gz
tar xzf redis-7.0.0.tar.gz
cd redis-7.0.0/redis-7.0.0
make
#make test
make install
