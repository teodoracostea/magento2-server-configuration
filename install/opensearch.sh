#!/usr/bin/env bash
curl -o- https://artifacts.opensearch.org/publickeys/opensearch.pgp | sudo apt-key add -

echo "deb https://artifacts.opensearch.org/releases/bundle/opensearch/2.x/apt stable main" | sudo tee /etc/apt/sources.list.d/opensearch-2.x.list

sudo apt update

sudo apt list -a opensearch

sudo apt -y install opensearch=2.5.0

sudo systemctl enable opensearch

sudo systemctl start opensearch
