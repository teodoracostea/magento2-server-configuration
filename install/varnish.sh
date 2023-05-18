#!/usr/bin/env bash

sudo apt update && sudo apt -y full-upgrade
sudo apt install debian-archive-keyring curl gnupg apt-transport-https -y
curl -fsSL https://packagecloud.io/varnishcache/varnish70/gpgkey|sudo gpg --dearmor -o /etc/apt/trusted.gpg.d/varnish.gpg
. /etc/os-release
sudo tee /etc/apt/sources.list.d/varnishcache_varnish70.list > /dev/null <<-EOF
deb https://packagecloud.io/varnishcache/varnish70/$ID/ $VERSION_CODENAME main
deb-src https://packagecloud.io/varnishcache/varnish70/$ID/ $VERSION_CODENAME main
EOF

sudo apt update
sudo apt install varnish

sudo cp /lib/systemd/system/varnish.service /etc/systemd/system/
cat /etc/systemd/system/varnish.service

echo "ExecStart=/usr/sbin/varnishd \
	  -a :80 \
	  -a localhost:8443,PROXY \
	  -p feature=+http2 \
	  -f /etc/varnish/default.vcl \
	  -s malloc,2g" > /etc/systemd/system/varnish.service
       
 sudo systemctl daemon-reload
 sudo systemctl start varnish
