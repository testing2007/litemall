#!/bin/bash

# cd /home/ubuntu/docker

# cd ../
# sudo docker-compose down
# sudo docker-compose build
# sudo docker image prune -f
# sudo docker-compose up -d

cd ../
docker-compose down
docker-compose build
docker image prune -f
docker-compose up -d
