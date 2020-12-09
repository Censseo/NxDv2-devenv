#!/bin/bash

echo "Provisioning virtual machine..."
apt-get update

echo "Installing Docker..."
curl -fsSL https://get.docker.com -o get-docker.sh
sh get-docker.sh

echo "Installing Docker Compose..."
curl -L "https://github.com/docker/compose/releases/download/1.27.4/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
chmod +x /usr/local/bin/docker-compose

# TODO: INSTALL PORTAINER / WATCHTOWER 

echo "Installing Code-server..."
cd /nextdom/dev-tools/code-server
docker-compose up -d

# TODO
echo "Getting Nextdom Sources..."