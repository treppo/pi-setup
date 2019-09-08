#!/usr/bin/env sh

set -e

sudo addgroup --system --gid 666 web
sudo adduser --system --disabled-password --no-create-home --uid 666 --shell /sbin/nologin --ingroup web --gecos web web
sudo chown -R web:web /tmp/nginx/

/home/pi/.local/bin/docker-compose pull && /home/pi/.local/bin/docker-compose up --detach