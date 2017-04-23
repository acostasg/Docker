#!/bin/sh

echo "## Free ports 8080,17560 y 17561 "
fuser -k 8080/tcp
fuser -k 17560/tcp
fuser -k 17561/tcp

echo "## Add Compiled binary and Start api POPmessage in local port 8080"
cd ./API/
docker build -t popmessageapi:latest .
docker run -p 127.0.0.1:8080:8080 --name POPmessage -d popmessageapi

echo "## Start elasticsearch and kibana in port 17560/17561"
cd ../ElasticSearchCluster/
docker-compose up -d

echo "## Finish setUp succes!!!"