# Docker Series

The Docker Series to most containers dockerized

-----------------

# About

Please use the branch selection to access others configurations to most need and purposes

-----------------

# Dockers Configurations Contained

> ![img.png](./self-containers/files/midias/check-green.png) Available
> ![img.png](./self-containers/files/midias/check-silver.png) Pending
> ![img.png](./self-containers/files/midias/unavailable.png) Unavailable

> Servers

- Apache2 ![img.png](./self-containers/files/midias/check-green.png)
- Nginx ![img.png](./self-containers/files/midias/check-green.png)
- Httpd ![img.png](./self-containers/files/midias/check-silver.png)

> Distro Linux

- Ubuntu 20.04 ![img.png](./self-containers/files/midias/check-silver.png)
- Ubuntu 18.04 ![img.png](./self-containers/files/midias/check-silver.png)
- Alpine ![img.png](./self-containers/files/midias/check-silver.png)
- CentOS ![img.png](./self-containers/files/midias/check-silver.png)
- Amazon EC2 ![img.png](./self-containers/files/midias/check-silver.png)

> Databases

- Mysql 5.7 ![img.png](./self-containers/files/midias/check-silver.png)
- Mysql 8.0 ![img.png](./self-containers/files/midias/check-silver.png)
- Mssql ![img.png](./self-containers/files/midias/check-silver.png)
- Oracle ![img.png](./self-containers/files/midias/check-silver.png)
- SQLite3 ![img.png](./self-containers/files/midias/check-silver.png)
- Firebird ![img.png](./self-containers/files/midias/check-silver.png)
- Mongo ![img.png](./self-containers/files/midias/check-silver.png)
- Postgres ![img.png](./self-containers/files/midias/check-silver.png)
- Redis ![img.png](./self-containers/files/midias/check-silver.png)

> Admin Tools and Logs

- Zipkin ![img.png](./self-containers/files/midias/check-silver.png)
- Prometheus ![img.png](./self-containers/files/midias/check-silver.png)
- Elasticsearch ![img.png](./self-containers/files/midias/check-silver.png)
- Logstash ![img.png](./self-containers/files/midias/check-silver.png)
- Kibana ![img.png](./self-containers/files/midias/check-silver.png)

> Dashboards

- Grafana ![img.png](./self-containers/files/midias/check-silver.png)

> Stack

- Java (open-jdk) ![img.png](./self-containers/files/midias/check-silver.png)
- PHP ![img.png](./self-containers/files/midias/check-silver.png)
- Python ![img.png](./self-containers/files/midias/check-silver.png)
- Nodejs ![img.png](./self-containers/files/midias/check-silver.png)

> Others

- Swagger ![img.png](./self-containers/files/midias/check-silver.png)
- Jenkins ![img.png](./self-containers/files/midias/check-silver.png)

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