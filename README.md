
# ELK + PROMETHEUS + GRAFANA + ZIPKIN + MYSQL USING DOCKER

---
Docker Series - A project to work with many docker container

# Specification

---

> NOTE: Use the same stack version to ELK (recommended) 

- Stack Version (ELK) : 7.9.2
- Elasticsearch
- Kibana
- Logstash
- Zipkin
- Prometheus
- Grafana
- Docker
- Docker-Compose

> Please see the .env file to more details

# How to use

---

- Clone this project from GitHub

<pre>
user@host$ git clone https://github.com/huntercodexs/docker-series.git .
user@host$ git checkout elk_prometheus_grafana_zipkin_mysql_v1
user@host$ cd elk_prometheus_grafana_zipkin_mysql_v1/
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

5. Prometheus
<pre>http://localhost:9090</pre>

6. Grafana
<pre>http://localhost:3001/login</pre>

7. Grafana Ubuntu
<pre>http://localhost:3000/login</pre>

# Commands

---

1. Access zipkin container

<pre>
docker exec -it ${CONTAINER-ID|CONTAINER-NAME} sh
</pre>

# Container Services

---

<pre>
NAME                COMMAND                  SERVICE             STATUS              PORTS
elasticsearch       "/tini -- /usr/local…"   elasticsearch       running             0.0.0.0:9200->9200/tcp, 0.0.0.0:9300->9300/tcp
grafana             "/run.sh"                grafana             running             0.0.0.0:3000->3000/tcp
grafana-ubuntu      "/run.sh"                grafana-ubuntu      running             0.0.0.0:3001->3000/tcp
kibana              "/usr/local/bin/dumb…"   kibana              running             0.0.0.0:5601->5601/tcp
logstash            "/usr/local/bin/dock…"   logstash            running             0.0.0.0:5000->5000/tcp, 0.0.0.0:5000->5000/udp, 0.0.0.0:5044->5044/tcp, 0.0.0.0:8080->8080/tcp, 0.0.0.0:9600->9600/tcp
prometheus          "/bin/prometheus --c…"   prometheus          running             0.0.0.0:9090->9090/tcp
zipkin              "start-zipkin"           zipkin              running (healthy)   0.0.0.0:9411->9411/tcp
</pre>