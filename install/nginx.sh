#!/usr/bin/env bash

apt-get install \
    nginx=1.22 \
    --yes

service nginx restart
