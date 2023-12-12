# ELK + ZIPKIN
Using ELK stack together Zipkin for a complete trace environment

![banner.png](elk_zipkin_v1/files/media/banner.png)

> NOTE: This branch offers only a containers


# Information

Please use the branch selection to access others configurations for your need and purposes


# Resources

> Please see the .env file to more details

- Stack Version 7.9.2
- Elasticsearch
- Kibana
- Logstash
- Zipkin



# Usage

<pre>
user@host:/home/user$ git clone https://github.com/huntercodexs/docker-series.git .
user@host:/home/user$ cd docker-series
user@host:/home/user/docker-series$ git checkout elk_zipkin_v1
user@host:/home/user/docker-series$ cd elk_zipkin_v1
user@host:/home/user/docker-series/elk_zipkin_v1$ docker network create elk_zipkin_v1_open_network
user@host:/home/user/docker-series/elk_zipkin_v1$ docker-compose up --build (in first time)
user@host:/home/user/docker-series/elk_zipkin_v1$ [Ctrl+C]
user@host:/home/user/docker-series/elk_zipkin_v1$ docker-compose start (in the next times)
user@host:/home/user/docker-series/elk_zipkin_v1$ docker-compose ps (check the containers status)
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
user@host:/home/user/docker-series$ git checkout elk_zipkin_v1
</pre>

4- Access the elk_zipkin_v1 folder
<pre>
user@host:/home/user/docker-series$ cd elk_zipkin_v1
</pre>

5- Check and set up the .env file

6- Build the containers

<pre>    
user@host:/home/user/docker-series/elk_zipkin_v1$ docker network create elk_zipkin_v1_open_network
user@host:/home/user/docker-series/elk_zipkin_v1$ docker-compose up --build
</pre>

Make sure that the result look like this
<pre>
user@host:/home/user/docker-series/elk_zipkin_v1$ docker-compose ps
     Name                    Command                  State                                             Ports                                       
----------------------------------------------------------------------------------------------------------------------------------------------------
</pre>

7- Test the containers

Elasticsearch
<pre>http://localhost:9200/</pre>

Kibana
<pre>http://localhost:5601/app/home#/</pre>
<pre>http://localhost:5601/app/dev_tools#/console</pre>

Logstash
<pre>http://localhost:8080</pre>

Zipkin
<pre>http://localhost:9411</pre>


# Helper and References

1. Access zipkin container

> docker exec -it ${CONTAINER-ID} sh
