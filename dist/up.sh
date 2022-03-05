#!/usr/bin/env sh

set -e

sudo addgroup --system --gid 666 web
sudo adduser --system --disabled-password --no-create-home --uid 666 --shell /sbin/nologin --ingroup web --gecos web web

PATH=/home/pi/.local/bin:$PATH

docker-compose pull && docker-compose down && docker-compose up --detach
