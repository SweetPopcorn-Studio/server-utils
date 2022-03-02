#!/bin/sh

set -o errexit
set -o nounset

IFS=$(printf '\n\t')

# GIT
sudo apt update
sudo apt install git
printf '\nGIT installed successfully\n\n'

# Docker
sudo apt remove --yes docker docker-engine docker.io containerd runc || true
sudo apt update
sudo apt --yes --no-install-recommends install apt-transport-https ca-certificates
wget --quiet --output-document=- https://download.docker.com/linux/debian/gpg | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/debian $(lsb_release -cs) stable"
sudo apt update
sudo apt --yes --no-install-recommends install docker-ce docker-ce-cli containerd.io
sudo usermod --append --groups docker "$USER"
sudo systemctl enable docker
printf '\nDocker installed successfully\n\n'

printf 'Waiting for Docker to start...\n\n'
sleep 5

# Docker Compose
sudo wget --output-document=/usr/local/bin/docker-compose "https://github.com/docker/compose/releases/download/$(wget --quiet --output-document=- https://api.github.com/repos/docker/compose/releases/latest | grep --perl-regexp --only-matching '"tag_name": "\K.*?(?=")')/run.sh"
sudo chmod +x /usr/local/bin/docker-compose
sudo wget --output-document=/etc/bash_completion.d/docker-compose "https://raw.githubusercontent.com/docker/compose/$(docker-compose version --short)/contrib/completion/bash/docker-compose"
printf '\nDocker Compose installed successfully\n\n'

# Certbot
sudo apt update
sudo apt install python3-acme python3-certbot python3-mock python3-openssl python3-pkg-resources python3-pyparsing python3-zope.interface
sudo apt install python3-certbot-nginx
printf '\Certbot installed successfully\n\n'
