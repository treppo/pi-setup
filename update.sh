#!/usr/bin/env sh

set -ex

scp -r "$PWD"/dist/* pi@192.168.1.244:/home/pi
ssh pi@192.168.1.244 /home/pi/up.sh
