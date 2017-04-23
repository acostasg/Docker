#!/bin/sh

echo "Stop api POPmessage in local port 8080"
cd ./API/
docker stop POPmessage

echo "Stop elasticsearch and kibana in port 17560/17561"
cd ../ElasticSearchCluster/
docker-compose stop

echo "Finish setUp succes!!!"