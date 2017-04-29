# Docker POPmessage

POPmessage development environment

First of all, you need to install Docker & Docker Compose (I suppose you know how :)

[Install Docker](https://docs.docker.com/engine/installation/)

[Install Docker Composer](https://docs.docker.com/compose/install/)

Remember add your user to admin group docker:

```sh
sudo usermod -aG docker $USER
```

Docker automates the repetitive tasks of setting up and configuring development environments so that developers can focus on what matters: building great software.

- [API gateway](https://github.com/acostasg/Docker/tree/master/API)
- [ElasticSearch Cluster](https://github.com/acostasg/Docker/blob/master/ElasticSearchCluster/README.md)

Start environment:

```sh
./setUp.sh 
```

Stop environment:

```sh
./setDown.sh 
```

Restart only API before to compile jar:

```sh
./restartAPI.sh 
```
