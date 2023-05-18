#!/usr/bin/env bash
curl -O https://artifacts.opensearch.org/GPG-KEY-opensearch | sudo apt-key add -
echo "deb https://artifacts.opensearch.org/releases/bundle/opensearch/2.5/apt stable main" | sudo tee -a /etc/apt/sources.list.d/opensearch-2.5.list
sudo apt-get update
sudo apt list -a opensearch
sudo apt-get install opensearch=2.5.0
#Update the following fields for a minimum unsecured running state (single node)
echo \
	"cluster.name: graylog
	node.name: ${HOSTNAME}
	path.data: /var/lib/opensearch
	path.logs: /var/log/opensearch
	discovery.type: single-node
	network.host: 0.0.0.0
	action.auto_create_index: false
	plugins.security.disabled: true" > /etc/opensearch/opensearch.yml

#Configure the kernel parameters at runtime
sudo sysctl -w vm.max_map_count=262144
sudo echo 'vm.max_map_count=262144' >> /etc/sysctl.conf

#Enable the system service
sudo systemctl daemon-reload
sudo systemctl enable opensearch.service
sudo systemctl start opensearch.service
sudo systemctl status opensearch.service
