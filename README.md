# ELK + ZIPKIN USING DOCKER
Docker Series - A project to work with many docker container

---

# Specification

- Stack Version 7.9.2
- Elasticsearch
- Kibana
- Logstash
- Zipkin
- Docker
- Docker-Compose

> Please see the .env file to more details

---

# How to use

- Clone this project from GitHub

<pre>
user@host$ git clone https://github.com/huntercodexs/docker-series.git .
user@host$ git checkout elk_zipkin_v1
user@host$ cd elk_zipkin_v1/
user@host$ docker-compose up --build (in first time)
user@host$ docker-compose start (in others case)
</pre>

- Create a network if needed

<pre>
docker network create open_network
</pre>

- Links to access

1. Elasticsearch
<pre>http://localhost:9200/</pre>

2. Kibana
<pre>http://localhost:5601/app/home#/</pre>
<pre>http://localhost:5601/app/dev_tools#/console</pre>

3. Logstash
<pre>http://localhost:8080</pre>

4. Zipkin
<pre>http://localhost:9411</pre>

----

# Commands

1. Access zipkin container

> docker exec -it ${CONTAINER-ID} sh
