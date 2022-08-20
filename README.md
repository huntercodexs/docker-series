# Docker Series

The project to most containers using docker

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

- <a href="https://github.com/huntercodexs/docker-series/tree/master/self-containers/apache2">Apache2</a> ![img.png](./self-containers/files/midias/check-green.png)
- <a href="https://github.com/huntercodexs/docker-series/tree/master/self-containers/nginx">Nginx</a> ![img.png](./self-containers/files/midias/check-green.png)
- <a href="https://github.com/huntercodexs/docker-series/tree/master/self-containers/httpd">HTTPD</a> 
  - <a href="https://github.com/huntercodexs/docker-series/tree/master/self-containers/httpd/2.4.54">2.4.54</a> ![img.png](./self-containers/files/midias/check-green.png)
- <a href="https://github.com/huntercodexs/docker-series/tree/master/self-containers/tomcat">Tomcat</a>
  - <a href="https://github.com/huntercodexs/docker-series/tree/master/self-containers/tomcat/9.0">9.0</a> ![img.png](./self-containers/files/midias/check-green.png)

> Distro Linux

- <a href="https://github.com/huntercodexs/docker-series/tree/master/self-containers/alpine">Alpine</a> ![img.png](./self-containers/files/midias/check-green.png)
- <a href="https://github.com/huntercodexs/docker-series/tree/master/self-containers/centos">CentOS</a> ![img.png](./self-containers/files/midias/check-green.png)
- <a href="https://github.com/huntercodexs/docker-series/tree/master/self-containers/amazonlinux">Amazon Linux</a> ![img.png](./self-containers/files/midias/check-green.png)
- <a href="https://github.com/huntercodexs/docker-series/tree/master/self-containers/ubuntu">Ubuntu</a>
  - <a href="https://github.com/huntercodexs/docker-series/tree/master/self-containers/ubuntu/ubuntu1804">18.04 LTS</a> ![img.png](./self-containers/files/midias/check-green.png)
  - <a href="https://github.com/huntercodexs/docker-series/tree/master/self-containers/ubuntu/ubuntu2004">20.04 LTS</a> ![img.png](./self-containers/files/midias/check-green.png)

> Databases

- <a href="https://github.com/huntercodexs/docker-series/tree/master/self-containers/mysql">MySQL</a>
  - <a href="https://github.com/huntercodexs/docker-series/tree/master/self-containers/mysql/mysql-57">5.7</a> ![img.png](./self-containers/files/midias/check-green.png)
  - <a href="https://github.com/huntercodexs/docker-series/tree/master/self-containers/mysql/mysql-80">8.0</a> ![img.png](./self-containers/files/midias/check-green.png)
- <a href="https://github.com/huntercodexs/docker-series/tree/master/self-containers/microsoft/mssql">MsSQL</a> ![img.png](./self-containers/files/midias/check-green.png)
- <a href="https://github.com/huntercodexs/docker-series/tree/master/self-containers/oracle">Oracle Linux 19c</a> ![img.png](./self-containers/files/midias/check-green.png)
- <a href="https://github.com/huntercodexs/docker-series/tree/master/self-containers/sqlite3">SQLite3</a> ![img.png](./self-containers/files/midias/check-green.png)
- <a href="https://github.com/huntercodexs/docker-series/tree/master/self-containers/firebird">Firebird</a> ![img.png](./self-containers/files/midias/check-green.png)
- Interbase ![img.png](./self-containers/files/midias/unavailable.png)
- <a href="https://github.com/huntercodexs/docker-series/tree/master/self-containers/mongodb">MongoDB</a> ![img.png](./self-containers/files/midias/check-green.png)
- <a href="https://github.com/huntercodexs/docker-series/tree/master/self-containers/postgres">Postgres</a> ![img.png](./self-containers/files/midias/check-green.png)

> Tools, Logs and Tracer

- <a href="https://github.com/huntercodexs/docker-series/tree/master/self-containers/elasticsearch">Elasticsearch</a> ![img.png](./self-containers/files/midias/check-green.png)
- <a href="https://github.com/huntercodexs/docker-series/tree/master/self-containers/logstash">Logstash</a> ![img.png](./self-containers/files/midias/check-green.png)
- <a href="https://github.com/huntercodexs/docker-series/tree/master/self-containers/kibana">Kibana</a> ![img.png](./self-containers/files/midias/check-green.png)
- <a href="https://github.com/huntercodexs/docker-series/tree/master/self-containers/zipkin">Zipkin</a> ![img.png](./self-containers/files/midias/check-green.png)
- <a href="https://github.com/huntercodexs/docker-series/tree/master/self-containers/prometheus">Prometheus</a> ![img.png](./self-containers/files/midias/check-green.png)

> Dashboards

- <a href="https://github.com/huntercodexs/docker-series/tree/master/self-containers/grafana">Grafana</a> ![img.png](./self-containers/files/midias/check-green.png)
- <a href="https://github.com/huntercodexs/docker-series/tree/master/self-containers/grafana-ubuntu">Grafana Ubuntu</a> ![img.png](./self-containers/files/midias/check-green.png)

> Stack

- <a href="https://github.com/huntercodexs/docker-series/tree/master/self-containers/php">PHP</a>
  - <a href="https://github.com/huntercodexs/docker-series/tree/master/self-containers/php/5.6">5.6</a> ![img.png](./self-containers/files/midias/check-green.png)
  - <a href="https://github.com/huntercodexs/docker-series/tree/master/self-containers/php/7.1">7.1</a> ![img.png](./self-containers/files/midias/check-green.png)
  - <a href="https://github.com/huntercodexs/docker-series/tree/master/self-containers/php/7.2">7.2</a> ![img.png](./self-containers/files/midias/check-green.png)
  - <a href="https://github.com/huntercodexs/docker-series/tree/master/self-containers/php/7.4">7.4</a> ![img.png](./self-containers/files/midias/check-green.png)
  - <a href="https://github.com/huntercodexs/docker-series/tree/master/self-containers/php/8.0">8.0</a> ![img.png](./self-containers/files/midias/check-green.png)
  - <a href="https://github.com/huntercodexs/docker-series/tree/master/self-containers/php/8.1">8.1</a> ![img.png](./self-containers/files/midias/check-green.png)
- <a href="https://github.com/huntercodexs/docker-series/tree/master/self-containers/java">Java</a>
  - <a href="https://github.com/huntercodexs/docker-series/tree/master/self-containers/java/openjdk-8u212">openjdk-8u212</a> ![img.png](./self-containers/files/midias/check-green.png)
  - openjdk-8u221 ![img.png](./self-containers/files/midias/check-silver.png)
  - openjdk-8u231 ![img.png](./self-containers/files/midias/check-silver.png)
  - openjdk-8u333 ![img.png](./self-containers/files/midias/check-silver.png)
  - openjdk-11 ![img.png](./self-containers/files/midias/check-silver.png)
  - openjdk-11.0.6 ![img.png](./self-containers/files/midias/check-silver.png)
  - openjdk-11.0.15 ![img.png](./self-containers/files/midias/check-silver.png)
  - openjdk-11.0.15.1 ![img.png](./self-containers/files/midias/check-silver.png)
  - <a href="https://github.com/huntercodexs/docker-series/tree/master/self-containers/java/openjdk-17.0.1">openjdk-17.0.1</a> ![img.png](./self-containers/files/midias/check-green.png)
  - openjdk-17.0.2 ![img.png](./self-containers/files/midias/check-silver.png)
  - openjdk-17.0.4 ![img.png](./self-containers/files/midias/check-silver.png)
- <a href="https://github.com/huntercodexs/docker-series/tree/master/self-containers/python">Python</a>
  - <a href="https://github.com/huntercodexs/docker-series/tree/master/self-containers/python/2.0">2.0</a> ![img.png](./self-containers/files/midias/check-silver.png)
  - <a href="https://github.com/huntercodexs/docker-series/tree/master/self-containers/python/3.0">3.0</a> ![img.png](./self-containers/files/midias/check-green.png)
- <a href="https://github.com/huntercodexs/docker-series/tree/master/self-containers/nodejs">Nodejs</a>
  - 10.1.9 ![img.png](./self-containers/files/midias/check-silver.png)
  - <a href="https://github.com/huntercodexs/docker-series/tree/master/self-containers/nodejs/18.7.0">18.7.0</a> ![img.png](./self-containers/files/midias/check-green.png)

> Others

- <a href="https://github.com/huntercodexs/docker-series/tree/master/self-containers/redis">Redis</a> ![img.png](./self-containers/files/midias/check-green.png)
- <a href="https://github.com/huntercodexs/docker-series/tree/master/self-containers/swagger">Swagger</a> 
  - <a href="https://github.com/huntercodexs/docker-series/tree/master/self-containers/swagger/swagger-ui">Swagger UI</a> ![img.png](./self-containers/files/midias/check-green.png)
  - <a href="https://github.com/huntercodexs/docker-series/tree/master/self-containers/swagger/swagger-editor">Editor</a> ![img.png](./self-containers/files/midias/check-green.png)
  - <a href="https://github.com/huntercodexs/docker-series/tree/master/self-containers/swagger/swagger-generator">Generator</a> ![img.png](./self-containers/files/midias/check-green.png)
- <a href="https://github.com/huntercodexs/docker-series/tree/master/self-containers/jenkins">Jenkins</a> ![img.png](./self-containers/files/midias/check-green.png)
  - <a href="https://github.com/huntercodexs/docker-series/tree/master/self-containers/jenkins/2.0">2.0 (Ubuntu-20.04)</a> ![img.png](./self-containers/files/midias/check-green.png)
  - <a href="https://github.com/huntercodexs/docker-series/tree/master/self-containers/jenkins/2.46.2">2.46.2 (Official)</a> ![img.png](./self-containers/files/midias/unavailable.png)
  - <a href="https://github.com/huntercodexs/docker-series/tree/master/self-containers/jenkins/2.60.3">2.60.3 (Official)</a> ![img.png](./self-containers/files/midias/unavailable.png)
  - <a href="https://github.com/huntercodexs/docker-series/tree/master/self-containers/jenkins/2.190.1">2.190.1 (Official)</a> ![img.png](./self-containers/files/midias/unavailable.png)
  - <a href="https://github.com/huntercodexs/docker-series/tree/master/self-containers/jenkins/2.346.3">2.346.3 (Official)</a> ![img.png](./self-containers/files/midias/check-green.png)

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