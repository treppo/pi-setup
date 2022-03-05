#!/usr/bin/env sh

set -e

# add user
sudo addgroup --system --gid 666 transmission
sudo adduser --system --disabled-password --no-create-home --uid 666 --shell /sbin/nologin --ingroup transmission --gecos transmission transmission

# install docker
curl -fsSL https://get.docker.com -o get-docker.sh
sh get-docker.sh

# install docker compose
DOCKER_CONFIG=${DOCKER_CONFIG:-$HOME/.docker}
mkdir -p $DOCKER_CONFIG/cli-plugins
curl -SL https://github.com/docker/compose/releases/download/v2.3.0/docker compose-linux-armv7 -o $DOCKER_CONFIG/cli-plugins/docker compose
chmod +x $DOCKER_CONFIG/cli-plugins/docker compose

# fix time on alpine based images
sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 04EE7237B7D453EC 648ACFD622F3D138
echo 'deb http://httpredir.debian.org/debian buster-backports main contrib non-free' | sudo tee -a /etc/apt/sources.list.d/debian-backports.list
sudo apt update
sudo apt install libseccomp2 -t buster-backports