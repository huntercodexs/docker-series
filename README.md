# ELK + PROMETHEUS + GRAFANA + ZIPKIN
Complete trace environment without database

![banner.png](elk_prometheus_grafana_zipkin_v1/files/media/banner.png)


# Information

Please use the branch selection to access others configurations for your need and purposes

# Resources

> NOTE: Use the same stack version to ELK (recommended)

- Stack Version (ELK) : 7.9.2
- Elasticsearch
- Kibana
- Logstash
- Zipkin
- Prometheus
- Grafana

> Please see the .env file to more details


# Usage

<pre>
user@host:/home/user$ git clone https://github.com/huntercodexs/docker-series.git .
user@host:/home/user$ cd docker-series
user@host:/home/user/docker-series$ git checkout elk_prometheus_grafana_zipkin_v1
user@host:/home/user/docker-series$ cd elk_prometheus_grafana_zipkin_v1
user@host:/home/user/docker-series/elk_prometheus_grafana_zipkin_v1$ docker network create elk_prometheus_grafana_zipkin_v1_open_network
user@host:/home/user/docker-series/elk_prometheus_grafana_zipkin_v1$ docker-compose up --build (in first time)
user@host:/home/user/docker-series/elk_prometheus_grafana_zipkin_v1$ [Ctrl+C]
user@host:/home/user/docker-series/elk_prometheus_grafana_zipkin_v1$ docker-compose start (in the next times)
user@host:/home/user/docker-series/elk_prometheus_grafana_zipkin_v1$ docker-compose ps (check the containers status)
</pre>


# Step by Step

Follow the steps below to quick and easy environment creation

1- Clone the repository
<pre>
user@host:/home/user$ git clone https://github.com/huntercodexs/docker-series.git .
</pre>

2- Access the repository folder
<pre>
user@host:/home/user$ cd docker-series.git
</pre>

3- Change the current branch
<pre>
user@host:/home/user/docker-series$ git checkout elk_prometheus_grafana_zipkin_v1
</pre>

4- Access the elk_prometheus_grafana_zipkin_v1 folder
<pre>
user@host:/home/user/docker-series$ cd elk_prometheus_grafana_zipkin_v1
</pre>

5- Check and set up the .env file also check and edit the files YML and pipelineio.conf
<pre>
elk_prometheus_grafana_zipkin_v1/elasticsearch/config/elasticsearch.yml
elk_prometheus_grafana_zipkin_v1/kibana/config/kibana.yml
elk_prometheus_grafana_zipkin_v1/logstash/config/logstash.yml
elk_prometheus_grafana_zipkin_v1/logstash/pipeline/pipelineio.conf
elk_prometheus_grafana_zipkin_v1/prometheus/prometheus.yml
</pre>

6- Build the containers

<pre>    
user@host:/home/user/docker-series/elk_prometheus_grafana_zipkin_v1$ docker network create elk_prometheus_grafana_zipkin_v1_open_network
user@host:/home/user/docker-series/elk_prometheus_grafana_zipkin_v1$ docker-compose up --build
</pre>

Make sure that the result look like this
<pre>
user@host:/home/user/docker-series/elk_prometheus_grafana_zipkin_v1$ docker-compose ps
    Name                   Command                   State                                                                                                             Ports                                                                                                      
----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
elasticsearch    /tini -- /usr/local/bin/do ...   Up               0.0.0.0:9200->9200/tcp,:::9200->9200/tcp, 0.0.0.0:9300->9300/tcp,:::9300->9300/tcp                                                                                                                              
grafana          /run.sh                          Up               0.0.0.0:3000->3000/tcp,:::3000->3000/tcp                                                                                                                                                                        
grafana-ubuntu   /run.sh                          Up               0.0.0.0:3001->3000/tcp,:::3001->3000/tcp                                                                                                                                                                        
kibana           /usr/local/bin/dumb-init - ...   Up               0.0.0.0:5601->5601/tcp,:::5601->5601/tcp                                                                                                                                                                        
logstash         /usr/local/bin/docker-entr ...   Up               0.0.0.0:5000->5000/tcp,:::5000->5000/tcp, 0.0.0.0:5000->5000/udp,:::5000->5000/udp, 0.0.0.0:5044->5044/tcp,:::5044->5044/tcp, 0.0.0.0:8080->8080/tcp,:::8080->8080/tcp, 0.0.0.0:9600->9600/tcp,:::9600->9600/tcp
prometheus       /bin/prometheus --config.f ...   Up               0.0.0.0:9090->9090/tcp,:::9090->9090/tcp                                                                                                                                                                        
zipkin           start-zipkin                     Up (unhealthy)   9410/tcp, 0.0.0.0:9411->9411/tcp,:::9411->9411/tcp                                                                                                                                                              
</pre>

7- Test the containers

Elasticsearch
<pre>
http://localhost:9200/
ELASTIC_USERNAME
ELASTIC_PASSWORD
</pre>

Kibana
<pre>
http://localhost:5601/app/home#/
http://localhost:5601/app/dev_tools#/console
ELASTIC_USERNAME
ELASTIC_PASSWORD
</pre>

Example
![kibana-dashboard-dev-tools-example.png](elk_prometheus_grafana_zipkin_v1/files/media/kibana-dashboard-dev-tools-example.png)

Queries
<pre>
GET tcp-logstash-docker-elk_prometheus_grafana_zipkin_demo/_search
GET http-logstash-docker-elk_prometheus_grafana_zipkin_demo/_search
GET postman-tests-elk_prometheus_grafana_zipkin_demo/_search
</pre>

Indexes
<pre>
elk_prometheus_grafana_zipkin_v1/logstash/pipeline/pipelineio.conf
</pre>

Logstash
<pre>
http://localhost:8080
</pre>

Zipkin
<pre>
http://localhost:9411
</pre>

Prometheus
<pre>
http://localhost:9090
</pre>

Grafana
<pre>
http://localhost:3001/login
</pre>

Grafana Ubuntu
<pre>
http://localhost:3000/login
</pre>


# Helper and References

Access zipkin container
<pre>
user@host:/home/user/docker-series/elk_prometheus_grafana_zipkin_v1$ docker exec -it zipkin sh
</pre>

Make a query in the Kibana Dashboard
<pre>
GET tcp-logstash-docker-elk_prometheus_grafana_zipkin_demo/_search

GET http-logstash-docker-elk_prometheus_grafana_zipkin_demo/_search

GET postman-tests-elk_prometheus_grafana_zipkin_demo/_search
</pre>


# Sample Usage (Java Project)

Use the follow repository https://github.com/huntercodexs/elk-prometheus-grafana-zipkin-demo to create tests
