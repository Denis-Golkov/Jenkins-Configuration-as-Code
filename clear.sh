#!/bin/bash
docker rm -f $(docker ps -aq)
docker rmi $(docker images | awk '{print $3}' | grep -v ID)