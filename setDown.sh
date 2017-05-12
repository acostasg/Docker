#!/bin/sh

echo "$(tput setaf 2) Stop and delete api POPmessage in local port 8080$(tput sgr 0)"
cd ./API/
docker stop POPmessage
docker rm POPmessage

echo "$(tput setaf 2) Stop elasticsearch and kibana in port 17560/17561$(tput sgr 0)"
cd ../ElasticSearchCluster/
docker-compose stop

echo "$(tput setaf 2) Free ports 8080,17560 y 17561 $(tput sgr 0)"
fuser -k 8080/tcp
fuser -k 17560/tcp
fuser -k 17561/tcp

echo "$(tput setaf 2) Finish setDown succes!!!$(tput sgr 0)"