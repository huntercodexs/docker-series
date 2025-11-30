# APACHE KAFKA 7.6.0-v2-security

- How to run kafka-7.6.0-v2-security rpm from this project use

<pre>
user@host:/home/user$ git clone https://github.com/huntercodexs/docker-series.git .
user@host:/home/user$ cd docker-series/self-containers/messenger/kafka-7.6.0-v2-security
user@host:/home/user/docker-series/self-containers/messenger/kafka-7.6.0-v2-security$ docker network create open_network
user@host:/home/user/docker-series/self-containers/messenger/kafka-7.6.0-v2-security$ docker-compose up --build
user@host:/home/user/docker-series/self-containers/messenger/kafka-7.6.0-v2-security$ [Ctrl+C]
user@host:/home/user/docker-series/self-containers/messenger/kafka-7.6.0-v2-security$ docker-compose start
</pre>

- Access the Kafka container

<pre>
user@host:/home/user/docker-series/self-containers/messenger/kafka-7.6.0-v2-security$ docker exec -it kafka-7.6.0-v2-security /bin/bash
</pre>


- Control Center

<pre>
http://localhost:9021
</pre>

- Sample Java Producer/Consumer Code

https://github.com/huntercodexs/java-spring-boot-kafka-producer

https://github.com/huntercodexs/java-spring-boot-kafka-consumer

