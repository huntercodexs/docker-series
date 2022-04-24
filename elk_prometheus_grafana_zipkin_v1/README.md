# ELK + ZIPKIN USING DOCKER

# Specification

- Stack Version (ELK) : 7.9.2
- Elasticsearch
- Kibana
- Logstash
- Zipkin
- Docker
- Docker-Compose

> Please see the .env file to more details

# Links to access

1. Elasticsearch
<pre>http://localhost:9200/</pre>

2. Kibana
<pre>http://localhost:5601/app/home#/</pre>
<pre>http://localhost:5601/app/dev_tools#/console</pre>

3. Logstash
<pre>http://localhost:8080</pre>

4. Zipkin
<pre>http://localhost:9411</pre>

# Commands

1. Access zipkin container

> docker exec -it ${CONTAINER-ID} sh
