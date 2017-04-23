#!/bin/sh

echo "## Stop and delete api POPmessage in local port 8080"
cd ./API/
docker stop POPmessage
docker rm POPmessage

echo "## Stop elasticsearch and kibana in port 17560/17561"
cd ../ElasticSearchCluster/
docker-compose stop

echo "## Free ports 8080,17560 y 17561 "
fuser -k 8080/tcp
fuser -k 17560/tcp
fuser -k 17561/tcp

echo "## Finish setUp succes!!!"