# APACHE KAFKA 7.6.0-prod-simulation

- How to run kafka-7.6.0-prod-simulation rpm from this project use

<pre>
user@host:/home/user$ git clone https://github.com/huntercodexs/docker-series.git .
user@host:/home/user$ cd docker-series/self-containers/messenger/kafka-7.6.0-prod-simulation
user@host:/home/user/docker-series/self-containers/messenger/kafka-7.6.0-prod-simulation$ docker network create open_network
user@host:/home/user/docker-series/self-containers/messenger/kafka-7.6.0-prod-simulation$ docker-compose up --build
user@host:/home/user/docker-series/self-containers/messenger/kafka-7.6.0-prod-simulation$ [Ctrl+C]
user@host:/home/user/docker-series/self-containers/messenger/kafka-7.6.0-prod-simulation$ docker-compose start
</pre>

- Access the Kafka container

<pre>
user@host:/home/user/docker-series/self-containers/messenger/kafka-7.6.0-prod-simulation$ docker exec -it kafka-7.6.0-prod-simulation /bin/bash
</pre>
