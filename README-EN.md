# Docker Series
A project to work with many docker container

# Languages

- Language: <a href="README.md">Portuguese Brazil (pt-br)</a> | English

# About

Please use the branch selection to access others environment configurations


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

[Example]
docker exec -it mailhog-ubuntu2004 /bin/bash
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

> Docker Commands To Clear Environment

<pre>
docker network rm ${NETWORK_NAME}
docker-compose down --volumes
docker system prune -a
    WARNING! This will remove:
      - all stopped containers
      - all networks not used by at least one container
      - all images without at least one container associated to them
      - all build cache
    
    Are you sure you want to continue? [y/N] y
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

# How to use

> Access the folder path /self-container in this project to run any container, by example: apache2

- Steps do run

<pre>
git clone https://github.com/huntercodexs/docker-series.git .
cd self-containers/apache2
docker-compose up --build (in first time)
docker-compose start (in the next times)
</pre>

# Dockers Configurations via Docker-Compose

> ![img.png](./self-containers/files/midias/check-green.png) Available
> ![img.png](./self-containers/files/midias/check-silver.png) Pending
> ![img.png](./self-containers/files/midias/unavailable.png) Unavailable

> Web Servers

- <a href="https://github.com/huntercodexs/docker-series/tree/master/self-containers/apache2">Apache2</a> ![img.png](./self-containers/files/midias/check-green.png)
- <a href="https://github.com/huntercodexs/docker-series/tree/master/self-containers/sftp">SFTP</a> ![img.png](./self-containers/files/midias/check-green.png)
- <a href="https://github.com/huntercodexs/docker-series/tree/master/self-containers/proftpd">PROFTPD</a> ![img.png](./self-containers/files/midias/check-green.png)
- <a href="https://github.com/huntercodexs/docker-series/tree/master/self-containers/nginx">Nginx</a> ![img.png](./self-containers/files/midias/check-green.png)
- <a href="https://github.com/huntercodexs/docker-series/tree/master/self-containers/nginx-ssl">Nginx + Let's Encrypt</a> ![img.png](./self-containers/files/midias/check-silver.png)
- <a href="https://github.com/huntercodexs/docker-series/tree/master/self-containers/httpd">HTTPD</a>
  - <a href="https://github.com/huntercodexs/docker-series/tree/master/self-containers/httpd/2.4.54">2.4.54</a> ![img.png](./self-containers/files/midias/check-green.png)
- <a href="https://github.com/huntercodexs/docker-series/tree/master/self-containers/tomcat">Tomcat</a>
  - <a href="https://github.com/huntercodexs/docker-series/tree/master/self-containers/tomcat/9.0">9.0</a> ![img.png](./self-containers/files/midias/check-green.png)
- <a href="https://github.com/huntercodexs/docker-series/tree/master/self-containers/nexus">Nexus</a>
  - <a href="https://github.com/huntercodexs/docker-series/tree/master/self-containers/nexus/nexus3">Nexus 3</a> ![img.png](./self-containers/files/midias/check-green.png)
  - <a href="https://github.com/huntercodexs/docker-series/tree/master/self-containers/nexus/nexus-traefik">Nexus Traefik</a> ![img.png](./self-containers/files/midias/check-silver.png)
- <a href="https://github.com/huntercodexs/docker-series/tree/master/self-containers/artifactory">Artifactory</a> ![img.png](./self-containers/files/midias/check-silver.png)

> Mail Servers

- <a href="https://github.com/huntercodexs/docker-series/tree/master/self-containers/mailhog">MailHog</a> ![img.png](./self-containers/files/midias/check-green.png)
- <a href="https://github.com/huntercodexs/docker-series/tree/master/self-containers/postfixadmin">PostFix Admin</a> ![img.png](./self-containers/files/midias/check-green.png)

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
- <a href="https://github.com/huntercodexs/docker-series/tree/master/self-containers/h2-database">H2 Database</a> ![img.png](./self-containers/files/midias/check-green.png)

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
- <a href="https://github.com/huntercodexs/docker-series/tree/master/self-containers/jenkins">Jenkins</a>
  - <a href="https://github.com/huntercodexs/docker-series/tree/master/self-containers/jenkins/2.0">2.0 (Ubuntu-20.04)</a> ![img.png](./self-containers/files/midias/check-green.png)
  - <a href="https://github.com/huntercodexs/docker-series/tree/master/self-containers/jenkins/2.46.2">2.46.2 (Official)</a> ![img.png](./self-containers/files/midias/unavailable.png)
  - <a href="https://github.com/huntercodexs/docker-series/tree/master/self-containers/jenkins/2.60.3">2.60.3 (Official)</a> ![img.png](./self-containers/files/midias/unavailable.png)
  - <a href="https://github.com/huntercodexs/docker-series/tree/master/self-containers/jenkins/2.190.1">2.190.1 (Official)</a> ![img.png](./self-containers/files/midias/unavailable.png)
  - <a href="https://github.com/huntercodexs/docker-series/tree/master/self-containers/jenkins/2.346.3">2.346.3 (Official)</a> ![img.png](./self-containers/files/midias/check-green.png)
- <a href="https://github.com/huntercodexs/docker-series/tree/master/self-containers/rpm">RPM</a>
  - <a href="https://github.com/huntercodexs/docker-series/tree/master/self-containers/rpm/amazonlinux">Amazonlinux</a> ![img.png](./self-containers/files/midias/check-green.png)
  - <a href="https://github.com/huntercodexs/docker-series/tree/master/self-containers/rpm/centos">Centos</a> ![img.png](./self-containers/files/midias/check-green.png)
  - <a href="https://github.com/huntercodexs/docker-series/tree/master/self-containers/rpm/fedora">Fedora</a> ![img.png](./self-containers/files/midias/check-green.png)
  - <a href="https://github.com/huntercodexs/docker-series/tree/master/self-containers/rpm/redhat">Redhat</a> ![img.png](./self-containers/files/midias/check-green.png)
  - <a href="https://github.com/huntercodexs/docker-series/tree/master/self-containers/rpm/rockylinux">Rockylinux</a> ![img.png](./self-containers/files/midias/check-green.png)
- <a href="https://github.com/huntercodexs/docker-series/tree/master/self-containers/messenger">Message Broker</a>
  - <a href="https://github.com/huntercodexs/docker-series/tree/master/self-containers/messenger/rabbitmq-3.6.10">RabbitMQ 3.6.10 (Amazonlinux)</a> ![img.png](./self-containers/files/midias/check-green.png)
  - <a href="https://github.com/huntercodexs/docker-series/tree/master/self-containers/messenger/rabbitmq-3.9.8">RabbitMQ 3.9.8 (Official)</a> ![img.png](./self-containers/files/midias/check-green.png)
- <a href="https://github.com/huntercodexs/docker-series/tree/master/self-containers/ssl-generator">SSL Generator</a> ![img.png](./self-containers/files/midias/check-green.png)
- <a href="https://github.com/huntercodexs/docker-series/tree/master/self-containers/ppk-pem-ppk">PPK & PEM Converter</a> ![img.png](./self-containers/files/midias/check-green.png)

# Pre-Configured Environments

- <a href="https://github.com/huntercodexs/docker-series/tree/apache2_php8">Apache2 + PHP8</a> ![img.png](./self-containers/files/midias/check-green.png)
- <a href="https://github.com/huntercodexs/docker-series/tree/certificate_authorities">Certificate Authorities</a> ![img.png](./self-containers/files/midias/check-green.png)
- <a href="https://github.com/huntercodexs/docker-series/tree/ec2_java_mysql_rabbitmq">EC2 Java + Mysql + Rabbit</a> ![img.png](./self-containers/files/midias/check-green.png)
- <a href="https://github.com/huntercodexs/docker-series/tree/elk_prometheus_grafana_v1">ELK + Prometheus + Grafana</a> ![img.png](./self-containers/files/midias/check-green.png)
- <a href="https://github.com/huntercodexs/docker-series/tree/elk_prometheus_grafana_zipkin_mysql_v1">ELK + Prometheus + Grafana + Zipkin + Mysql</a> ![img.png](./self-containers/files/midias/check-green.png)
- <a href="https://github.com/huntercodexs/docker-series/tree/elk_prometheus_grafana_zipkin_v1">ELK + Prometheus + Grafana + Zipkin</a> ![img.png](./self-containers/files/midias/check-green.png)
- <a href="https://github.com/huntercodexs/docker-series/tree/elk_zipkin_v1">ELK + Zipkin</a> ![img.png](./self-containers/files/midias/check-green.png)
- <a href="https://github.com/huntercodexs/docker-series/tree/httpd_php8_databases_separated">HTTPD + PHP8 + DATABASES</a> ![img.png](./self-containers/files/midias/check-green.png)
- <a href="https://github.com/huntercodexs/docker-series/tree/httpd_php8_reverse_proxy">HTTPD + PHP8 + REVERSE_PROXY</a> ![img.png](./self-containers/files/midias/check-green.png)
- <a href="https://github.com/huntercodexs/docker-series/tree/httpd_php8_separated">HTTPD + PHP8</a> ![img.png](./self-containers/files/midias/check-green.png)
- <a href="https://github.com/huntercodexs/docker-series/tree/java_mongodb">JAVA + MONGODB</a> ![img.png](./self-containers/files/midias/check-green.png)
- <a href="https://github.com/huntercodexs/docker-series/tree/java_mssql">JAVA + MSSQL</a> ![img.png](./self-containers/files/midias/check-green.png)
- <a href="https://github.com/huntercodexs/docker-series/tree/java_oraclelinux">JAVA + ORACLE</a> ![img.png](./self-containers/files/midias/check-green.png)
- <a href="https://github.com/huntercodexs/docker-series/tree/java_postgres">JAVA + POSTGRES</a> ![img.png](./self-containers/files/midias/check-green.png)
- <a href="https://github.com/huntercodexs/docker-series/tree/nginx_php8_mysql">NGINX + PHP8 + MYSQL</a> ![img.png](./self-containers/files/midias/check-green.png)
- <a href="https://github.com/huntercodexs/docker-series/tree/nginx_php8">NGINX + PHP8</a> ![img.png](./self-containers/files/midias/check-green.png)
- <a href="https://github.com/huntercodexs/docker-series/tree/nginx_reverse_proxy_java">NGINX WITH REVERSE PROXY + JAVA</a> ![img.png](./self-containers/files/midias/check-green.png)
- <a href="https://github.com/huntercodexs/docker-series/tree/nginx_reverse_proxy_nodejs">NGINX WITH REVERSE PROXY + NODEJS</a> ![img.png](./self-containers/files/midias/check-green.png)
- <a href="https://github.com/huntercodexs/docker-series/tree/nginx_reverse_proxy_php8">NGINX WITH REVERSE PROXY + PHP8</a> ![img.png](./self-containers/files/midias/check-green.png)
- <a href="https://github.com/huntercodexs/docker-series/tree/nginx_reverse_proxy_python">NGINX WITH REVERSE PROXY + PYTHON</a> ![img.png](./self-containers/files/midias/check-green.png)
- <a href="https://github.com/huntercodexs/docker-series/tree/nginx_reverse_proxy">NGINX WITH REVERSE PROXY</a> ![img.png](./self-containers/files/midias/check-green.png)
- <a href="https://github.com/huntercodexs/docker-series/tree/openjdk8_212_mysql8">OPENJDK8 + MYSQL8</a> ![img.png](./self-containers/files/midias/check-green.png)
- <a href="https://github.com/huntercodexs/docker-series/tree/php8_apache_mysql">PHP8 + APACHE + MYSQL</a> ![img.png](./self-containers/files/midias/check-green.png)
- <a href="https://github.com/huntercodexs/docker-series/tree/php8_apache">PHP8 + APACHE</a> ![img.png](./self-containers/files/midias/check-green.png)
- <a href="https://github.com/huntercodexs/docker-series/tree/h2_mysql_oracle_sftp_mailhog">H2 + MYSQL8 + ORACLELINUX + SFTP + MAILHOG</a> ![img.png](./self-containers/files/midias/check-green.png)