#!/usr/bin/env bash

apt-get install \
    php-fpm \
    php-mysql \
    php-mcrypt \
    php-curl \
    php-cli \
    php-gd \
    php8.1-xsl \
    php-json \
    php-intl \
    php-pear \
    php-dev \
    php-common \
    php-soap \
    php-mbstring \
    php-zip \
    php8.1-bcmath \
    php-imagick \
    bcmath \
    php-ctype \
    php-dom \
    php-fileinfo \
    php-filter \
    php-hash \
    php-iconv \
    php-libxml \
    php-openssl \
    php-pcre \
    php-pdo_mysql \
    php-simplexml \
    php-sockets \
    php-sodium \
    php-tokenizer \
    php-xmlwriter \
    php-xsl \
    php-zlib \
    lib-libxml \
    --yes

service php-fpm restart
