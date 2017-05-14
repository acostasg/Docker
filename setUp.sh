#!/bin/sh

echo "$(tput setaf 2) Free ports 8080,17560 y 17561 $(tput sgr 0)"
fuser -k 8080/tcp
fuser -k 17560/tcp
fuser -k 17561/tcp

echo "$(tput setaf 2)Add Compiled binary and Start api POPmessage in local port 8080$(tput sgr 0)"
cd ./API/
docker build -t popmessageapi:latest .
docker run -p 0.0.0.0:8080:8080 --name POPmessage -d popmessageapi

echo "$(tput setaf 2) Start elasticsearch and kibana in port 17560/17561$(tput sgr 0)"
cd ../ElasticSearchCluster/
docker-compose up -d

echo "$(tput setaf 2) Finish setUp success!!!$(tput sgr 0)"