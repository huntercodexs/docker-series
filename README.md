# ELK + PROMETHEUS + GRAFANA + ZIPKIN + MYSQL
Complete trace environment

![banner.png](elk_prometheus_grafana_zipkin_mysql_v1/files/media/banner.png)

> NOTE: If you want to be more fast goto step by step in this documentation
> <a href="#step-by-step">Step by Step</a>

Summary

- <a href="#information">Information</a>
- <a href="#resources">Resources</a>
- <a href="#quick-usage">Quick Usage</a>
- <a href="#purpose">Purpose</a>
- <a href="#environment">Environment</a>
- <a href="#samples-microservices-Java-Project">Samples Microservices (Java Project)</a>
- <a href="#configurations">Configurations</a>
- <a href="#grafana">Grafana</a>
- <a href="#prometheus">Prometheus</a>
- <a href="#logstash">Logstash</a>
- <a href="#step-by-step">Step by Step</a>
- <a href="#helper-and-references">Helper and References</a>

# Information

Please use the branch selection to access others configurations for your need and purposes


# Resources

> NOTE: Its highest recommended to use the same stack version to ELK

- Stack Version (ELK) : 7.9.2
- Elasticsearch
- Kibana
- Logstash
- Zipkin
- Prometheus
- Grafana
- Mysql 5.7
- Mysql 8.0
- Java 8 or later
- Amazonlinux 2 (EC2)

Please see the .env file to more details


# Quick Usage

<pre>
user@host:/home/user$ git clone https://github.com/huntercodexs/docker-series.git .
user@host:/home/user$ cd docker-series
user@host:/home/user/docker-series$ git checkout elk_prometheus_grafana_zipkin_mysql_v1
user@host:/home/user/docker-series$ cd elk_prometheus_grafana_zipkin_mysql_v1
user@host:/home/user/docker-series/elk_prometheus_grafana_zipkin_mysql_v1$ docker network create elk_prometheus_grafana_zipkin_mysql_v1_open_network
user@host:/home/user/docker-series/elk_prometheus_grafana_zipkin_mysql_v1$ docker-compose up --build (in first time)
user@host:/home/user/docker-series/elk_prometheus_grafana_zipkin_mysql_v1$ [Ctrl+C]
user@host:/home/user/docker-series/elk_prometheus_grafana_zipkin_mysql_v1$ docker-compose start (in the next times)
user@host:/home/user/docker-series/elk_prometheus_grafana_zipkin_mysql_v1$ docker-compose ps (check the containers status)
</pre>


# Purpose

This project aims to offer a development environment with production concepts for managing
microservices. In this case, an example project made in Java will be offered, but nothing prevents the environment from being
used for other languages such as Python, PHP, among others.

Like any microservices architecture, since its size is scalable and dependent on demand and therefore
Since this can be very large, we need to have effective monitoring and management tools. At this point we have
to separate these needs by scope and functionality.

Starting from the point where we need to manage our architecture and its resources, we need to separate the needs into
specific subjects and that at least address the following questions:

- Monitoring via log
- Monitoring of hardware resources
- Monitoring the health of applications

Therefore, we are aware that the environment must offer resources or tools that facilitate this work
which actually refers more to DevOps than development itself. In situations like this we can then
work with the tools presented here, namely: Zipkin, Prometheus, ELK and Grafana, being able to divide the topics into:

- Monitoring via log
    - Elasticsearch
    - Logstash
    - Kibana

- Monitoring of hardware resources
    - Prometheus
    - Grafana

- Monitoring the health of applications
    - Zipkin
    - Prometheus
    - Eureka Service Discovery

A flow diagram is presented below to illustrate this entire environment, notice how the tools are connected
between themselves and how they communicate essential for a well-controlled and stable environment.

![purpose-diagram.png](elk_prometheus_grafana_zipkin_mysql_v1/files/media/purpose-diagram.png)


# Environment

To simulate the Java microservices environment will be used one container for each service by amazonlinux 2 (EC2), the 
EC2-AWS machine, witch will be used to run the applications/microservices previously generated from each Java project, 
to be more clear and direct the jar files. 

Only as an example will be presented and inserted in this project/repository 5 containers to exemplify how to work 
the environment "ELK + PROMETHEUS + GRAFANA + ZIPKIN + MYSQL" in the practice. These containers are Amazonlinux 2, and 
have a single and exclusive functionality to demonstrate a possible situation to use it.

Each Java project will be executed inside each container, witch are listed bellow:

- ec2-service-discovery: EC2 Service Discovery
- ec2-api-gateway: EC2 Api Gateway
- ec2-client: EC2 Client
- ec2-microservice-order: EC2 Microservice Order
- ec2-microservice-product: EC2 Microservice Product

> IMPORTANT NOTE:<br />
> Each one of theses EC2 machines (Amazonlinux 2) were added in the docker-compose yml file, being each one a docker
> container, which in turn will run the jar files, that was previously generated and are already to run. Just for get 
> more organized and separate the repositories/projects, these java projects should be got in the GitHub repository
> https://github.com/huntercodexs/elk-prometheus-grafana-zipkin-demo, after that, compiled, built-in and deployed inside 
> each folder refer to each microservice. These folder can be viewed  in the path ec2/app/{java-project-name}

The relationship of the applications mentioned above can be seen in the diagram below

![environment-diagram.png](elk_prometheus_grafana_zipkin_mysql_v1/files/media/environment-diagram.png)


#  Samples Microservices (Java Project)

Another important point for running and testing the environment of this project is to have an adequate set of services in
Java to demonstrate how it all works. To facilitate and speed up the learning process about how to operate
of this project I have the repository https://github.com/huntercodexs/elk-prometheus-grafana-zipkin-demo which contains a
set of microservices to simulate the environment. This repository offers the following features:

- Eureka Server
- Eureka Client
- Zuul Server (Open Feign)
- Zuul Client
- Zipkin
- Logback Core
- Prometheus
- Mysql Connector
- JPA
- Hibernate

All microservices need to be correctly configured in the log4j2.xml and application.properties files


# Configurations

> Details

para utilizar esse ambiente completamente é preciso seguir as seguinte regras:

- linguagem JAVA
- ter um ambiente de microserviços
- utilizar o serviço discovery EUREKA da Netflix
- utilizar o API GATEWAY da Netflix Zull (Feign)
  - existirão duas versão de API GATEWAY uma com rotas no arquivo de propriedades e outra através de um client
- ter os serviços registrados no service discovery corretamente
- saber o local exato onde esta sendo gerado o log do service discovery EUREKA, pois ele sera utilizado para extrair os detalhes de cada serviço registrado no service discovery
- usar as configurações corretas para o arquivo de propriedades no projeto JAVA
- usar as configurações corretas para o arquivo de log xml no projeto JAVA

antes de rodar esse projeto, certifique-se de colocar nas pastas
elk_prometheus_grafana_zipkin_mysql_v1/ec2/app/api-gateway
elk_prometheus_grafana_zipkin_mysql_v1/ec2/app/client
elk_prometheus_grafana_zipkin_mysql_v1/ec2/app/microservice-order
elk_prometheus_grafana_zipkin_mysql_v1/ec2/app/microservice-product
elk_prometheus_grafana_zipkin_mysql_v1/ec2/app/service-discovery
todos os arquivos jar gerados no projeto https://github.com/huntercodexs/elk-prometheus-grafana-zipkin-demo

No IntelliJ siga as seguintes instruções

1) File -> Project Structure -> Project Settings -> Artifacts -> Clique no "+" -> Jar -> From modules with dependencies... > selecione qual é a classe Main > OK

2) Configurado o artefato vá em Build > Build Artifact > Build

o JAR será gerado no output directory configurado no passo 1

- Java Projects
  - Application Properties
- Prometheus
  - YML Configuration
  - JSON Targets
- Logstash
  - YML Configuration
  - Pipelineio
- Kibana


# grafana

After creating the entire environment, we can connect grafana to prometheus according to the information below

Dashboards

![grafana-dashboards.png](elk_prometheus_grafana_zipkin_mysql_v1/files/media/grafana-dashboards.png)

- Connect Grafana to Prometheus

![grafana-datasources.png](elk_prometheus_grafana_zipkin_mysql_v1/files/media/grafana-datasources.png)

- Connect Grafa to Prometheus using the Spring Boot Statistics plugin

Get the plugin ID from the Grafana website at the following link https://grafana.com/grafana/dashboards/6756-spring-boot-statistics/.
Insert the dashboard ID into Grafana in Dashboard->import

Result

![grafana-spring-boot-statistics-dashboard-import.png](elk_prometheus_grafana_zipkin_mysql_v1/files/media/grafana-spring-boot-statistics-dashboard-import.png)


# prometheus

> Important Note:

This script only export microservices from Eureka Service Discovery Log, it means say that
all microservices and only these microservices registered in the Eureka will be exported from the
current log produced by Eureka. Therefore, you need to inform the current and correct path to
Eureka Service where all the microservices has been registered. The log record that will be seek in the
log look like something like that:
Registered instance NEW-MICROSERVICE-DEMO/192.168.0.204:new-microservice-demo:31315 with status UP (replication=true)

> How to execute:

./targets-export.sh /home/user/logs/EUREKA-SERVICE-DISCOVERY.log /home/prometheus/targets/ [--reload: optional]

Reload Prometheus YML Configurations (SIGHUP)
pgrep prometheus -> 1
kill -HUP 1
You can use the script prometheus-reload.sh to make it more easily

> Step by step:

1) Build Prometheus container: docker-compose up --build prometheus
2) Export targets to prometheus without reload prometheus:
   2.1) ./targets-export.sh /home/user/logs/EUREKA-SERVICE-DISCOVERY.log /home/prometheus/targets/
3) Export targets to prometheus with reload prometheus:
   3.1) ./targets-export.sh /home/user/logs/EUREKA-SERVICE-DISCOVERY.log /home/prometheus/targets/ --reload


# logstash

- apagar indices do kibana se necessario
- configurar pipelineio.conf do logstash
- rodar o comando docker-compose up --build logstash (os indices serão automaticamente no kibana)
    - o resultado deve ser algo parecido como abaixo
<pre>
logstash          | [2024-01-29T00:03:24,299][INFO ][logstash.javapipeline    ][.monitoring-logstash] Pipeline Java execution initialization time {"seconds"=>0.55}
logstash          | [2024-01-29T00:03:24,342][INFO ][logstash.javapipeline    ][.monitoring-logstash] Pipeline started {"pipeline.id"=>".monitoring-logstash"}
logstash          | [2024-01-29T00:03:24,373][INFO ][logstash.javapipeline    ][main] Pipeline Java execution initialization time {"seconds"=>0.61}
logstash          | [2024-01-29T00:03:24,521][INFO ][logstash.javapipeline    ][main] Pipeline started {"pipeline.id"=>"main"}
logstash          | [2024-01-29T00:03:24,527][INFO ][logstash.inputs.http     ][main][ccb448981609b2f871d0e355d2ef5059aac13af82f623e7d3f2a8b9d0fdfc3e7] Starting http input listener {:address=>"0.0.0.0:8080", :ssl=>"false"}
logstash          | [2024-01-29T00:03:24,528][INFO ][logstash.inputs.tcp      ][main][ed9ed8f66d0cdf852b2df787cac8694d32f71b9d340b0b7b822994b97c3d35b8] Starting tcp input listener {:address=>"0.0.0.0:5000", :ssl_enable=>"false"}
logstash          | [2024-01-29T00:03:24,584][INFO ][logstash.agent           ] Pipelines running {:count=>2, :running_pipelines=>[:".monitoring-logstash", :main], :non_running_pipelines=>[]}
logstash          | [2024-01-29T00:03:24,765][INFO ][logstash.agent           ] Successfully started Logstash API endpoint {:port=>9600}
</pre>
- criar indice no kibana em
  http://localhost:5601/app/home#/
  http://localhost:5601/app/management/
  http://localhost:5601/app/management/kibana/indexPatterns/
  http://localhost:5601/app/management/kibana/indexPatterns/create
  colocar o nome do indice no input text box, clicar em Next step, selecionar um valor em "Time field" e clicar em Create index pattern
  se necessário, é possível configurar um indice como padrão
- executar requisição no postman para a url http://localhost:31301/client-demo/orders
    - o endpoint esta dentro de um microserviço previamente configurado para comunicação com o logstash via config
- verificar o status do log no kibana em
  http://localhost:5601/app/discover
  selecionar o indice no lado esquerdo da tela e analisar o log
- ![kibana-discover-log-sample.png](elk_prometheus_grafana_zipkin_mysql_v1/files/media/kibana-discover-log-sample.png)
- ![kibana-discover-log-sample.png](elk_prometheus_grafana_zipkin_mysql_v1/files/media/kibana-discover-log-index.png)
- usar o dev tools para analisar logs em http://localhost:5601/app/dev_tools#/console conforme exemplos abaixo

<pre>
GET _search
{
  "query": {
    "match_all": {}
  }
}

GET tcp-elk_prometheus_grafana_zipkin_mysql_v1_demo/_search
{
  "query": {
    "match": {
      "message": "POST add orders in API is calling"
    }
  }
}

GET tcp-elk_prometheus_grafana_zipkin_mysql_v1_demo/_search
{
  "query": {
    "match": {
      "message": "OrderRequestDTO"
    }
  }
}

GET http-elk_prometheus_grafana_zipkin_mysql_v1_demo/_search
{
  "query": {
    "match": {
      "message": "POST add orders in API is calling"
    }
  }
}

GET tcp-elk_prometheus_grafana_zipkin_mysql_v1_demo/_search
{
  "query": {
    "match": {
      "message": "OrderRequestDTO"
    }
  }
}
</pre>
![kibana-dashboard-dev-tools-example.png](elk_prometheus_grafana_zipkin_mysql_v1/files/media/kibana-dashboard-dev-tools-example.png)

- caso seja necessario alterar as configurações do pipelineio do logstash é preciso reiniciar o serviço da seguinte forma
<pre>
docker exec -it logstash /bin/bash

bash-4.2$ ps -ef
UID          PID    PPID  C STIME TTY          TIME CMD
logstash       1       0  5 21:17 ?        00:02:49 /bin/java -Xms1g -Xmx1g -XX:+UseConcMarkSweepGC -XX:CMSInitiatingOccupancyFraction=75 -XX:+UseCMSInitiatingOccupancyOnly -Djava.awt.headless=true -Dfile.encoding=UTF-8 -Djruby.compile.invokedynamic=true -Djruby.jit.threshold=0 -Dj
logstash     302       0  0 22:10 pts/0    00:00:00 /bin/bash
logstash     308     302  0 22:10 pts/0    00:00:00 ps -ef

bash-4.2$ kill -HUP 1 (isso reinicia o serviço logstash automaticamente)
</pre>

ou simplesmente use o script logstash-reload.sh que esta dentro do container logstash em /home/logstash o qual pode ser
executado com o seguinte comando

<pre>
docker exec -it logstash sh /home/logstash/logstash-reload.sh 
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
user@host:/home/user/docker-series$ git checkout elk_prometheus_grafana_zipkin_mysql_v1
</pre>

4- Access the elk_prometheus_grafana_zipkin_mysql_v1 folder
<pre>
user@host:/home/user/docker-series$ cd elk_prometheus_grafana_zipkin_mysql_v1
</pre>

5- Check and set up the .env file also check and edit the files YML and pipelineio.conf
<pre>
elk_prometheus_grafana_zipkin_mysql_v1/elasticsearch/config/elasticsearch.yml
elk_prometheus_grafana_zipkin_mysql_v1/kibana/config/kibana.yml
elk_prometheus_grafana_zipkin_mysql_v1/logstash/config/logstash.yml
elk_prometheus_grafana_zipkin_mysql_v1/logstash/pipeline/pipelineio.conf
elk_prometheus_grafana_zipkin_mysql_v1/prometheus/prometheus.yml
</pre>

6- Build the containers

<pre>    
user@host:/home/user/docker-series/elk_prometheus_grafana_zipkin_mysql_v1$ docker network create elk_prometheus_grafana_zipkin_mysql_v1_open_network
user@host:/home/user/docker-series/elk_prometheus_grafana_zipkin_mysql_v1$ docker-compose up --build
</pre>

Make sure that the result look like this
<pre>
user@host:/home/user/docker-series/elk_prometheus_grafana_zipkin_mysql_v1$ docker-compose ps
     Name                   Command                   State                                                                                                             Ports                                                                                                      
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
elasticsearch    /tini -- /usr/local/bin/do ...   Up               0.0.0.0:9200->9200/tcp,:::9200->9200/tcp, 0.0.0.0:9300->9300/tcp,:::9300->9300/tcp                                                                                                                              
grafana          /run.sh                          Up               0.0.0.0:3000->3000/tcp,:::3000->3000/tcp                                                                                                                                                                        
grafana-ubuntu   /run.sh                          Up               0.0.0.0:3001->3000/tcp,:::3001->3000/tcp                                                                                                                                                                        
kibana           /usr/local/bin/dumb-init - ...   Up               0.0.0.0:5601->5601/tcp,:::5601->5601/tcp                                                                                                                                                                        
logstash         /usr/local/bin/docker-entr ...   Up               0.0.0.0:5000->5000/tcp,:::5000->5000/tcp, 0.0.0.0:5000->5000/udp,:::5000->5000/udp, 0.0.0.0:5044->5044/tcp,:::5044->5044/tcp, 0.0.0.0:8080->8080/tcp,:::8080->8080/tcp, 0.0.0.0:9600->9600/tcp,:::9600->9600/tcp
mysql57          docker-entrypoint.sh mysqld      Up               0.0.0.0:3606->3306/tcp,:::3606->3306/tcp, 33060/tcp                                                                                                                                                             
mysql80          docker-entrypoint.sh mysqld      Up               0.0.0.0:3706->3306/tcp,:::3706->3306/tcp, 33060/tcp                                                                                                                                                             
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

Logstash
<pre>
http://localhost:8080
</pre>

Indexes Logstash
<pre>
elk_prometheus_grafana_zipkin_mysql_v1/logstash/pipeline/pipelineio.conf
</pre>

Kibana
<pre>
http://localhost:5601/app/home#/
http://localhost:5601/app/dev_tools#/console
ELASTIC_USERNAME
ELASTIC_PASSWORD
</pre>
![kibana-dashboard-dev-tools-example.png](elk_prometheus_grafana_zipkin_mysql_v1/files/media/kibana-dashboard-dev-tools-example.png)

Create the index in Kibana (according logstash configuration - pipelineio.conf)
<pre>
http://localhost:5601/app/management/kibana/indexPatterns/create
</pre>
![kibana-dashboard-dev-tools-example.png](elk_prometheus_grafana_zipkin_mysql_v1/files/media/kibana-dashboard-dev-tools-example.png)

Check the log at Kibana Discover (the created index stay at left side of screen)
<pre>
http://localhost:5601/app/discover
</pre>
![kibana-dashboard-dev-tools-example.png](elk_prometheus_grafana_zipkin_mysql_v1/files/media/kibana-dashboard-dev-tools-example.png)

Sample Queries
<pre>
GET tcp-elk_prometheus_grafana_zipkin_mysql_v1_demo/_search
GET http-elk_prometheus_grafana_zipkin_mysql_v1_demo/_search
GET postman-tests-elk_prometheus_grafana_zipkin_mysql_v1_demo/_search
</pre>
![kibana-dashboard-dev-tools-example.png](elk_prometheus_grafana_zipkin_mysql_v1/files/media/kibana-dashboard-dev-tools-example.png)

Zipkin
<pre>
http://localhost:9411
</pre>
![kibana-dashboard-dev-tools-example.png](elk_prometheus_grafana_zipkin_mysql_v1/files/media/kibana-dashboard-dev-tools-example.png)

Zipkin Details
<pre>
</pre>

Prometheus
<pre>
http://localhost:9090
</pre>
![kibana-dashboard-dev-tools-example.png](elk_prometheus_grafana_zipkin_mysql_v1/files/media/kibana-dashboard-dev-tools-example.png)

Prometheus Settings (targets)

> NOTE: It is recommended use a specific tool or process to create dynamically the targets and then put the result
> in one json or yaml file, the manual process is not indicated

<pre>
elk_prometheus_grafana_zipkin_mysql_v1/prometheus/prometheus.yml
</pre>

Grafana
<pre>
http://localhost:3001/login
</pre>
![kibana-dashboard-dev-tools-example.png](elk_prometheus_grafana_zipkin_mysql_v1/files/media/kibana-dashboard-dev-tools-example.png)

Grafana Prometheus Integration
<pre>
</pre>

Grafana Ubuntu
<pre>
http://localhost:3000/login
</pre>
![kibana-dashboard-dev-tools-example.png](elk_prometheus_grafana_zipkin_mysql_v1/files/media/kibana-dashboard-dev-tools-example.png)

Grafana Ubuntu Prometheus Integration
<pre>
</pre>


# Helper and References

Access zipkin container
<pre>
user@host:/home/user/docker-series/elk_prometheus_grafana_zipkin_mysql_v1$ docker exec -it zipkin sh
</pre>

Make a query in the Kibana Dashboard
<pre>
GET tcp-elk_prometheus_grafana_zipkin_mysql_v1_demo/_search

GET http-elk_prometheus_grafana_zipkin_mysql_v1_demo/_search

GET postman-tests-elk_prometheus_grafana_zipkin_mysql_v1_demo/_search
</pre>