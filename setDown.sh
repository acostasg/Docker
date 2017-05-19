#!/bin/sh

echo "$(tput setaf 2) Stop container 17560/17561$(tput sgr 0)"
docker-compose stop

echo "$(tput setaf 2) Free ports 8080,17560 y 17561 $(tput sgr 0)"
fuser -k 8080/tcp
fuser -k 17560/tcp
fuser -k 17561/tcp

echo "$(tput setaf 2) Delete network $(tput sgr 0)"

docker network rm es-network

echo "$(tput setaf 2) Finish setDown success!!!$(tput sgr 0)"