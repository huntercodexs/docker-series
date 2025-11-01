# APACHE KAFKA 7.0.6

- How to run kafka-7.0.6 rpm from this project use

<pre>
user@host:/home/user$ git clone https://github.com/huntercodexs/docker-series.git .
user@host:/home/user$ cd docker-series/self-containers/messenger/kafka-7.0.6
user@host:/home/user/docker-series/self-containers/messenger/kafka-7.0.6$ docker network create open_network
user@host:/home/user/docker-series/self-containers/messenger/kafka-7.0.6$ docker-compose up --build
user@host:/home/user/docker-series/self-containers/messenger/kafka-7.0.6$ [Ctrl+C]
user@host:/home/user/docker-series/self-containers/messenger/kafka-7.0.6$ docker-compose start
</pre>

- Access the Kafka container

<pre>
user@host:/home/user/docker-series/self-containers/messenger/kafka-7.0.6$ docker exec -it kafka-7.0.6 /bin/bash
</pre>
