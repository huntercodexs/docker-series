# Docker Series

The Docker Series to most containers dockerized

-----------------

# About

Please use the branch selection to access others configurations to most need and purposes

-----------------

# Docker Setup

> Installing Docker

- Update OS

<pre>
$ sudo apt update
</pre>

- Install Pre Requisites

<pre>
$ sudo apt install apt-transport-https ca-certificates curl software-properties-common
</pre>

- Add the GPG Key from official docker repository

<pre>
$ curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
</pre>

- Add the docker repository APT sources

<pre>
$ sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu focal stable"
</pre>

- Make sure thar will be to install the docker-ce

<pre>
$ apt-cache policy docker-ce
$ sudo apt install docker-ce
</pre>

- Check docker status

<pre>
$ sudo systemctl status docker
</pre>

- Make docker command to current user (not root)

<pre>
$ sudo usermod -aG docker ${USER}
$ su - ${USER}
$ sudo usermod -aG docker username
</pre>

> Docker Commands Helper

<pre>
docker ps
docker run
docker images ls
docker image ls
docker container ls
docker volumes ls
docker system prune -a
docker rmi -v ${IMAGE_ID}
docker network create ${NETWORK_NAME}

**
docker exec -it ${CONTAINER_NAME} [${COMMAND}[OPTIONS]]
**
</pre>

> Installing Docker Compose

- Installing the current release of docker-comopse

<pre>
$ sudo curl -L "https://github.com/docker/compose/releases/download/1.26.0/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
</pre>

- Make docker-compose executable

<pre>
$ sudo chmod +x /usr/local/bin/docker-compose
</pre>

- Check the docker-compose version installed

<pre>
$ docker-compose --version
</pre>

> Docker Compose Commands Helper

<pre>
docker-compose ps
docker-compose --build
docker-compose up --build
docker-compose up -d
docker-compose up
docker-compose start
docker-compose stop
docker-compose down [--volumes]
docker-compose logs
docker-compose pause
docker-compose unpause
</pre>

-----------------

# Dockers Configurations Contained

> ![img.png](./self-containers/files/midias/check-green.png) Available
> ![img.png](./self-containers/files/midias/check-silver.png) Pending
> ![img.png](./self-containers/files/midias/unavailable.png) Unavailable

> Servers

- Apache2 ![img.png](./self-containers/files/midias/check-green.png)
- Nginx ![img.png](./self-containers/files/midias/check-green.png)
- HTTPD 
  - 2.4.54 ![img.png](./self-containers/files/midias/check-green.png)

> Distro Linux

- Alpine ![img.png](./self-containers/files/midias/check-green.png)
- CentOS ![img.png](./self-containers/files/midias/check-green.png)
- Amazon Linux ![img.png](./self-containers/files/midias/check-green.png)
- Ubuntu
  - 18.04 LTS ![img.png](./self-containers/files/midias/check-green.png)
  - 20.04 LTS ![img.png](./self-containers/files/midias/check-green.png)

> Databases

- MySQL
  - 5.7 ![img.png](./self-containers/files/midias/check-green.png)
  - 8.0 ![img.png](./self-containers/files/midias/check-green.png)
- MsSQL ![img.png](./self-containers/files/midias/check-green.png)
- Oracle Linux ![img.png](./self-containers/files/midias/check-green.png)
- SQLite3 ![img.png](./self-containers/files/midias/check-green.png)
- Firebird ![img.png](./self-containers/files/midias/check-green.png)
- Interbase ![img.png](./self-containers/files/midias/unavailable.png)
- MongoDB ![img.png](./self-containers/files/midias/check-green.png)
- Postgres ![img.png](./self-containers/files/midias/check-green.png)

> Tools, Logs and Tracer

- Logstash ![img.png](./self-containers/files/midias/check-silver.png)
- Kibana ![img.png](./self-containers/files/midias/check-silver.png)
- Zipkin ![img.png](./self-containers/files/midias/check-silver.png)
- Prometheus ![img.png](./self-containers/files/midias/check-silver.png)
- Elasticsearch ![img.png](./self-containers/files/midias/check-silver.png)

> Dashboards

- Grafana ![img.png](./self-containers/files/midias/check-green.png)
- Grafana Ubuntu ![img.png](./self-containers/files/midias/check-green.png)

> Stack

- PHP
  - 5.6 ![img.png](./self-containers/files/midias/check-green.png)
  - 7.1 ![img.png](./self-containers/files/midias/check-green.png)
  - 7.4 ![img.png](./self-containers/files/midias/check-green.png)
  - 8.0 ![img.png](./self-containers/files/midias/check-green.png)
  - 8.1 ![img.png](./self-containers/files/midias/check-green.png)
- Java
  - openjdk-8u212 ![img.png](./self-containers/files/midias/check-green.png)
  - openjdk-8u221 ![img.png](./self-containers/files/midias/check-silver.png)
  - openjdk-8u231 ![img.png](./self-containers/files/midias/check-silver.png)
  - openjdk-8u333 ![img.png](./self-containers/files/midias/check-silver.png)
  - openjdk-11 ![img.png](./self-containers/files/midias/check-silver.png)
  - openjdk-11.0.6 ![img.png](./self-containers/files/midias/check-silver.png)
  - openjdk-11.0.15 ![img.png](./self-containers/files/midias/check-silver.png)
  - openjdk-11.0.15.1 ![img.png](./self-containers/files/midias/check-silver.png)
  - openjdk-17.0.1 ![img.png](./self-containers/files/midias/check-green.png)
  - openjdk-17.0.2 ![img.png](./self-containers/files/midias/check-silver.png)
  - openjdk-17.0.4 ![img.png](./self-containers/files/midias/check-silver.png)
- Python
  - 2.0 ![img.png](./self-containers/files/midias/check-silver.png)
  - 3.0 ![img.png](./self-containers/files/midias/check-green.png)
- Nodejs
  - 10.1.9 ![img.png](./self-containers/files/midias/check-silver.png)
  - 18.7.0 ![img.png](./self-containers/files/midias/check-green.png)

> Others

- Redis ![img.png](./self-containers/files/midias/check-green.png)
- Swagger ![img.png](./self-containers/files/midias/check-silver.png)
- Jenkins
  - 2.0 (Ubuntu-20.04) ![img.png](./self-containers/files/midias/check-green.png)
  - 2.46.2 (Official) ![img.png](./self-containers/files/midias/unavailable.png)
  - 2.60.3 (Official) ![img.png](./self-containers/files/midias/unavailable.png)
  - 2.190.1 (Official) ![img.png](./self-containers/files/midias/unavailable.png)
  - 2.346.3 (Official) ![img.png](./self-containers/files/midias/check-green.png)

-----------------

# How to use

> Access the folder path in this project to run any self-container, by example: apache2 

- Steps do run

<pre>
git clone https://github.com/huntercodexs/docker-series.git .
cd self-containers/apache2
docker-compose up --build apache2 (in first time)
docker-compose start apache2 (in others case)
</pre>