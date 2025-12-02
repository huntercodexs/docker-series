# APACHE KAFKA 5.5.1

- How to run kafka-5.5.1 rpm from this project use

<pre>
user@host:/home/user$ git clone https://github.com/huntercodexs/docker-series.git .
user@host:/home/user$ cd docker-series/self-containers/messenger/kafka-5.5.1
user@host:/home/user/docker-series/self-containers/messenger/kafka-5.5.1$ docker network create open_network
user@host:/home/user/docker-series/self-containers/messenger/kafka-5.5.1$ docker-compose up --build
user@host:/home/user/docker-series/self-containers/messenger/kafka-5.5.1$ [Ctrl+C]
user@host:/home/user/docker-series/self-containers/messenger/kafka-5.5.1$ docker-compose start
</pre>

- Access the Kafka container

<pre>
user@host:/home/user/docker-series/self-containers/messenger/kafka-5.5.1$ docker exec -it kafka-5.5.1 /bin/bash
</pre>


- Control Center

<pre>
http://localhost:9021
</pre>

- Sample Java Producer/Consumer Code

https://github.com/huntercodexs/java-spring-boot-kafka-producer

https://github.com/huntercodexs/java-spring-boot-kafka-consumer

Also try this repo with both Producer and Consumer

https://github.com/huntercodexs/java-spring-boot-integration-sample/tree/kafka-5.5.1-PLAINTEXT ***Private***


