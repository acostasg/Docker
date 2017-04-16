### Install

First of all, you need to install Docker & Docker Compose (I suppose you know how :)

[Install Docker](https://docs.docker.com/engine/installation/)

Remember add your user to admin group docker:

```sh
sudo usermod -aG docker $USER
```

In current directory:

```sh
cd /API
```

Now, once you have it, you can set up all the environment. 

```sh
docker build . 
```