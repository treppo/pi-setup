#!/usr/bin/env sh

set -ex

scp -r "$PWD"/dist/* pi@192.168.1.128:/home/pi
ssh pi@192.168.1.128 /home/pi/up.sh
