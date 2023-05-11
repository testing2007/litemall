#!/bin/bash

# cd /home/ubuntu/docker
cd /Users/zander/Documents/workspace/litemall/docker
sudo docker-compose down
sudo docker-compose build
sudo docker image prune -f
sudo docker-compose up -d
