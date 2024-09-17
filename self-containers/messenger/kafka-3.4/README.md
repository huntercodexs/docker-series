# APACHE KAFKA 3.4

- How to run kafka-3.4 rpm from this project use

<pre>
user@host:/home/user$ git clone https://github.com/huntercodexs/docker-series.git .
user@host:/home/user$ cd docker-series/self-containers/messenger/kafka-3.4
user@host:/home/user/docker-series/self-containers/messenger/kafka-3.4$ docker network create open_network
user@host:/home/user/docker-series/self-containers/messenger/kafka-3.4$ docker-compose up --build
user@host:/home/user/docker-series/self-containers/messenger/kafka-3.4$ [Ctrl+C]
user@host:/home/user/docker-series/self-containers/messenger/kafka-3.4$ docker-compose start
</pre>

> NOTE: If occurs some error during the build of container, check if it's the folder lib in the 
> self-containers/messenger/kafka-3.4/lib, maybe must be required delete all content in this folder
> for example:

<pre>
user@host:/home/user/docker-series/self-containers/messenger/kafka-3.4$ cd data_kafka
user@host:/home/user/docker-series/self-containers/messenger/kafka-3.4$ rm -rf .*
user@host:/home/user/docker-series/self-containers/messenger/kafka-3.4$ rm -rf *
</pre>

- Access the Kafka container

<pre>
user@host:/home/user/docker-series/self-containers/messenger/kafka-3.4$ docker exec -it kafka-3.4 /bin/bash
</pre>
