#!/usr/bin/env bash

apt-get install \
     apt-transport-https \
     --yes
     
curl https://repo.varnish-cache.org/GPG-key.txt | apt-key add -

echo "deb https://repo.varnish-cache.org/ubuntu/ trusty varnish-7.1" \
     >> /etc/apt/sources.list.d/varnish-cache.list

apt-get update

apt-get install varnish
