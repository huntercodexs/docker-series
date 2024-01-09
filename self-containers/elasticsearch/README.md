# ELASTICSEARCH

- How to run elasticsearch from this project use

<pre>
user@host:/home/user$ git clone https://github.com/huntercodexs/docker-series.git .
user@host:/home/user$ cd docker-series/self-containers/elasticsearch
user@host:/home/user/docker-series/self-containers/elasticsearch$ docker-compose up --build (in first time)
user@host:/home/user/docker-series/self-containers/elasticsearch$ docker-compose start (in the next times)
</pre>

# Step by Step

Follow the steps below to quick and easy environment creation

1- Clone the repository
<pre>
user@host:/home/user$ git clone https://github.com/huntercodexs/docker-series.git .
</pre>

2- Access the repository folder
<pre>
user@host:/home/user$ cd docker-series
</pre>

3- Access the elasticsearch folder
<pre>
user@host:/home/user/docker-series$ cd elasticsearch
</pre>

4- Check and set up the .env file and elasticsearch.yml as well to have sure about the correct and complete information's

5- Build the containers

> NOTE: Before build the container make sure that the folder "data" exists in the folder elasticsearch

<pre>    
user@host:/home/user/docker-series/elasticsearch$ docker network create open_network
user@host:/home/user/docker-series/elasticsearch$ docker-compose up --build
</pre>

6- Test the containers

Elasticsearch
<pre>
http://localhost:9200/
ELASTIC_USERNAME
ELASTIC_PASSWORD
</pre>
