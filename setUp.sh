#!/bin/sh

echo "Start api POPmessage in local port 8080"
cd ./API/
docker run -d -p 127.0.0.1:8080:8080 --name POPmessage popmessageapi

echo "Start elasticsearch and kibana in port 17560/17561"
cd ../ElasticSearchCluster/
docker-compose up -d

echo "Finish setUp succes!!!"