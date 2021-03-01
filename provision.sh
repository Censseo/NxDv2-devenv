#!/bin/bash

echo "Provisioning virtual machine..."
apt-get update

echo "Installing Git..."
apt-get install git

echo "Installing NodeJs..."
node -v > /dev/null
if ! node -v &> /dev/null
then
  curl -sL https://deb.nodesource.com/setup_15.x | bash -
  apt-get install -y nodejs
fi

echo "Installing Docker..."
curl -fsSL https://get.docker.com -o get-docker.sh
sh get-docker.sh
usermod -aG docker vagrant

echo "Installing Docker Compose..."
curl -L "https://github.com/docker/compose/releases/download/1.27.4/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
chmod +x /usr/local/bin/docker-compose

echo "Installing Portainer..."
docker volume create portainer_data
docker run -d -p 8000:8000 -p 9000:9000 --name=portainer --restart=always -v /var/run/docker.sock:/var/run/docker.sock -v portainer_data:/data portainer/portainer-ce

echo "Installing Watchtower..."
docker run -d --name watchtower -v /var/run/docker.sock:/var/run/docker.sock containrrr/watchtower

# TODO: install local + import config
# echo "Installing Code-server..."
# cd /nextdom/dev-tools/code-server
# docker-compose up -d

# TODO
echo "Getting Nextdom Sources..."
cd /nextdom
git clone https://github.com/Sylvaner/NxDv2-global.git
cd NxDv2-global/
./prepare.sh
docker-compose up -d

