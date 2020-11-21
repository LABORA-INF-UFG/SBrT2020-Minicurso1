#!/bin/bash

sudo docker-compose down
sudo rm -rf dbdata/
sudo docker-compose up -d
./config-vSBrT2020/subscribers.sh
sudo docker-compose exec my5gcore-n3iwf cat /sys/class/net/eth0/iflink
