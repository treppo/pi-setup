#/bin/bash

set -ex

ssh pi@192.168.1.128 /home/pi/.local/bin/docker-compose down
scp docker-compose.yaml *.env pi@192.168.1.128:/home/pi
ssh pi@192.168.1.128 /home/pi/.local/bin/docker-compose up --detach
