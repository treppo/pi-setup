#!/usr/bin/env sh

set -ex

ssh pi@192.168.1.244 /home/pi/down.sh
scp -r "$PWD"/dist/* pi@192.168.1.244:/home/pi
ssh pi@192.168.1.244 /home/pi/up.sh
