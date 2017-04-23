#!/bin/sh

echo "$(tput setaf 2) Stop and delete api POPmessage in local port 8080$(tput sgr 0)"
cd ./API/
docker stop POPmessage
docker rm POPmessage

echo "$(tput setaf 2) Free port 8080$(tput sgr 0)"
fuser -k 8080/tcp

echo "$(tput setaf 2) Add Compiled binary and Start api POPmessage in local port 8080$(tput sgr 0)"
cd ./API/
docker build -t popmessageapi:latest .
docker run -p 127.0.0.1:8080:8080 --name POPmessage -d popmessageapi