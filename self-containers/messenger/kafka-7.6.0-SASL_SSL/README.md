# APACHE KAFKA 7.6.0-SASL_SSL

- How to run kafka-7.6.0-SASL_SSL rpm from this project use

<pre>
user@host:/home/user$ git clone https://github.com/huntercodexs/docker-series.git .
user@host:/home/user$ cd docker-series/self-containers/messenger/kafka-7.6.0-SASL_SSL
user@host:/home/user/docker-series/self-containers/messenger/kafka-7.6.0-SASL_SSL$ ./cleanup.sh
user@host:/home/user/docker-series/self-containers/messenger/kafka-7.6.0-SASL_SSL$ ./generate-certs.sh
user@host:/home/user/docker-series/self-containers/messenger/kafka-7.6.0-SASL_SSL$ docker network create open_network
user@host:/home/user/docker-series/self-containers/messenger/kafka-7.6.0-SASL_SSL$ docker-compose up --build
user@host:/home/user/docker-series/self-containers/messenger/kafka-7.6.0-SASL_SSL$ [Ctrl+C]
user@host:/home/user/docker-series/self-containers/messenger/kafka-7.6.0-SASL_SSL$ docker-compose start
</pre>

- Access the Kafka container

<pre>
user@host:/home/user/docker-series/self-containers/messenger/kafka-7.6.0-SASL_SSL$ docker exec -it kafka-7.6.0-SASL_SSL /bin/bash
</pre>

- Sample Java Producer/Consumer Code

https://github.com/huntercodexs/java-spring-boot-kafka-producer

https://github.com/huntercodexs/java-spring-boot-kafka-consumer

Also try this repo with both Producer and Consumer

https://github.com/huntercodexs/java-spring-boot-integration-sample/tree/kafka-7.6.0-SASL_SSL ***Private***
