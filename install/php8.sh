#!/usr/bin/env bash
sudo apt update && sudo apt install -y software-properties-common
#sudo add-apt-repository ppa:ondrej/php
sudo apt update && sudo apt install -y php8.1
apt-get install \
    php8.1-fpm \
    php8.1-mysql \
    mcrypt \
    php8.1-curl \
    php8.1-cli \
    php8.1-gd \
    php8.1-xsl \
    php8.1-common \
    php8.1-intl \
    php8.1-dev \
    php8.1-common \
    php8.1-soap \
    php8.1-mbstring \
    php8.1-zip \
    php8.1-bcmath \
    php8.1-imagick \
    php8.1-bcmath \
    php8.1-xml \
    php8.1-xsl \
    --yes

sudo service php8.1-fpm restart
