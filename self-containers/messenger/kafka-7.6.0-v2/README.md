# APACHE KAFKA 7.6.0-v2

- How to run kafka-7.6.0-v2 rpm from this project use

<pre>
user@host:/home/user$ git clone https://github.com/huntercodexs/docker-series.git .
user@host:/home/user$ cd docker-series/self-containers/messenger/kafka-7.6.0-v2
user@host:/home/user/docker-series/self-containers/messenger/kafka-7.6.0-v2$ docker network create open_network
user@host:/home/user/docker-series/self-containers/messenger/kafka-7.6.0-v2$ docker-compose up --build
user@host:/home/user/docker-series/self-containers/messenger/kafka-7.6.0-v2$ [Ctrl+C]
user@host:/home/user/docker-series/self-containers/messenger/kafka-7.6.0-v2$ docker-compose start
</pre>

- Access the Kafka container

<pre>
user@host:/home/user/docker-series/self-containers/messenger/kafka-7.6.0-v2$ docker exec -it kafka-7.6.0-v2 /bin/bash
</pre>


- Control Center

<pre>
http://localhost:9021
</pre>

- Sample Java Producer/Consumer Code

https://github.com/huntercodexs/java-spring-boot-kafka-producer

https://github.com/huntercodexs/java-spring-boot-kafka-consumer

