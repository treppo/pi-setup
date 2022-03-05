#!/usr/bin/env sh

set -e

docker compose pull && docker compose up --detach
