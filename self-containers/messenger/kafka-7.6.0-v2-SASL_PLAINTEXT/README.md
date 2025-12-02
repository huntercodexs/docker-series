# APACHE KAFKA 7.6.0-v2-SASL_PLAINTEXT

- How to run kafka-7.6.0-v2-SASL_PLAINTEXT rpm from this project use

<pre>
user@host:/home/user$ git clone https://github.com/huntercodexs/docker-series.git .
user@host:/home/user$ cd docker-series/self-containers/messenger/kafka-7.6.0-v2-SASL_PLAINTEXT
user@host:/home/user/docker-series/self-containers/messenger/kafka-7.6.0-v2-SASL_PLAINTEXT$ docker network create open_network
user@host:/home/user/docker-series/self-containers/messenger/kafka-7.6.0-v2-SASL_PLAINTEXT$ docker-compose up --build
user@host:/home/user/docker-series/self-containers/messenger/kafka-7.6.0-v2-SASL_PLAINTEXT$ [Ctrl+C]
user@host:/home/user/docker-series/self-containers/messenger/kafka-7.6.0-v2-SASL_PLAINTEXT$ docker-compose start
</pre>

- Access the Kafka container

<pre>
user@host:/home/user/docker-series/self-containers/messenger/kafka-7.6.0-v2-SASL_PLAINTEXT$ docker exec -it kafka-7.6.0-v2-SASL_PLAINTEXT /bin/bash
</pre>


- Control Center

<pre>
http://localhost:9021
</pre>

- Sample Java Producer/Consumer Code

https://github.com/huntercodexs/java-spring-boot-kafka-producer

https://github.com/huntercodexs/java-spring-boot-kafka-consumer

Also try this repo with both Producer and Consumer

https://github.com/huntercodexs/java-spring-boot-integration-sample/tree/kafka-7.6.0-v2-SASL_PLAINTEXT ***Private***
