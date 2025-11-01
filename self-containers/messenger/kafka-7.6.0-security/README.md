# APACHE KAFKA 7.6.0-security

- How to run kafka-7.6.0-security rpm from this project use

<pre>
user@host:/home/user$ git clone https://github.com/huntercodexs/docker-series.git .
user@host:/home/user$ cd docker-series/self-containers/messenger/kafka-7.6.0-security
user@host:/home/user/docker-series/self-containers/messenger/kafka-7.6.0-security$ docker network create open_network
user@host:/home/user/docker-series/self-containers/messenger/kafka-7.6.0-security$ docker-compose up --build
user@host:/home/user/docker-series/self-containers/messenger/kafka-7.6.0-security$ [Ctrl+C]
user@host:/home/user/docker-series/self-containers/messenger/kafka-7.6.0-security$ docker-compose start
</pre>

- Access the Kafka container

<pre>
user@host:/home/user/docker-series/self-containers/messenger/kafka-7.6.0-security$ docker exec -it kafka-7.6.0-security /bin/bash
</pre>
