#!/usr/bin/env bash

if [ $1 ] && [ $2 ] && [ $3 ] && [ $4 ] && [ $5 ] && [ $6 ] && [ $7 ] && [ $8 ] && [ $9 ] && [ ${10} ] && [ ${11} ];
    then
        cd /var/www/html/$1/webroot
        
        bin/magento setup:install \
        --backend-frontname=backend \
        --amqp-host=rabbitmq \
        --amqp-port=5672 \
        --amqp-user=guest \
        --amqp-password=guest \
        --db-host=db \
        --db-name=magento \
        --db-user=magento \
        --db-password=magento \
        --search-engine=opensearch \
        --opensearch-host=127.0.0.1 \
        --opensearch-port=9200 \
        --opensearch-index-prefix=magento2 \
        --opensearch-enable-auth=0 \
        --opensearch-timeout=15 \
        --http-cache-hosts=varnish:80 \
        --session-save=redis \
        --session-save-redis-host=redis \
        --session-save-redis-port=6379 \
        --session-save-redis-db=2 \
        --session-save-redis-max-concurrency=20 \
        --cache-backend=redis \
        --cache-backend-redis-server=redis \
        --cache-backend-redis-db=0 \
        --cache-backend-redis-port=6379 \
        --page-cache=redis \
        --page-cache-redis-server=redis \
        --page-cache-redis-db=1 \
        --page-cache-redis-port=6379

       # php bin/magento setup:install --base-url=$2 \
       # --db-host=$3 --db-name=$4 --db-user=$5 --db-password=$6 \
       # --admin-firstname=Developer --admin-lastname=Developer --admin-email=$7 \
       # --admin-user=$8 --admin-password=$9 --language=${10} \
       # --currency=${11} --timezone=America/Chicago --use-rewrites=1

        php bin/magento deploy:mode:set developer
        php bin/magento cache:disable
        php bin/magento cache:clean
        php bin/magento cache:flush

        find . -type d -exec chmod 770 {} \;
        find . -type f -exec chmod 660 {} \;
        chmod u+x bin/magento
        chown -R :www-data .

        service php-fpm restart
    else
        echo "";
        echo "1st parameter is magento domain";
        echo "2nd parameter is magento domain with http or https";
        echo "3rd parameter is database host";
        echo "4th parameter is database name";
        echo "5th parameter is database user";
        echo "6th parameter is database password";
        echo "7th parameter is admin email";
        echo "8th parameter is admin login name";
        echo "9th parameter is admin login password";
        echo "10th parameter is language code";
        echo "11th parameter is currency code";
        echo "Try this: magento-install.sh mywebshop.com http://mywebshop.com/ localhost magento root secret123 admin@mywebshop.com admin admin123 en_US USD";
        echo "";
fi;
