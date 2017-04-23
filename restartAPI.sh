#!/bin/sh

echo "## Stop and delete api POPmessage in local port 8080"
cd ./API/
docker stop POPmessage
docker rm POPmessage

echo "## Free port 808"
fuser -k 8080/tcp

echo "## Add Compiled binary and Start api POPmessage in local port 8080"
cd ./API/
docker build -t popmessageapi:latest .
docker run -p 127.0.0.1:8080:8080 --name POPmessage -d popmessageapi
