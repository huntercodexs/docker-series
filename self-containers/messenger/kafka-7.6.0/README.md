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

> NOTE: If occurs some error during the build of container, check if it's the folder lib in the 
> self-containers/messenger/kafka-7.0.6/lib, maybe must be required delete all content in this folder
> for example:

<pre>
user@host:/home/user/docker-series/self-containers/messenger/kafka-7.0.6$ cd data_kafka
user@host:/home/user/docker-series/self-containers/messenger/kafka-7.0.6$ rm -rf .*
user@host:/home/user/docker-series/self-containers/messenger/kafka-7.0.6$ rm -rf *
</pre>

- Access the Kafka container

<pre>
user@host:/home/user/docker-series/self-containers/messenger/kafka-7.0.6$ docker exec -it kafka-7.0.6 /bin/bash
</pre>

# TODO

Check and fix the error below

<pre>
kafka-7.0.6        | [2024-09-18 18:15:18,818] ERROR Had an exception in BecomeZkControllerEvent (org.apache.kafka.metadata.migration.KRaftMigrationDriver)
kafka-7.0.6        | java.lang.IllegalStateException: Cannot register KRaft controller 1010 as the active controller since there is no ZK controller epoch present.
kafka-7.0.6        | 	at kafka.zk.KafkaZkClient.tryRegisterKRaftControllerAsActiveController(KafkaZkClient.scala:201)
kafka-7.0.6        | 	at kafka.zk.ZkMigrationClient.claimControllerLeadership(ZkMigrationClient.scala:60)
kafka-7.0.6        | 	at org.apache.kafka.metadata.migration.KRaftMigrationDriver.apply(KRaftMigrationDriver.java:143)
kafka-7.0.6        | 	at org.apache.kafka.metadata.migration.KRaftMigrationDriver.access$800(KRaftMigrationDriver.java:57)
kafka-7.0.6        | 	at org.apache.kafka.metadata.migration.KRaftMigrationDriver$BecomeZkControllerEvent.run(KRaftMigrationDriver.java:357)
kafka-7.0.6        | 	at org.apache.kafka.queue.KafkaEventQueue$EventContext.run(KafkaEventQueue.java:121)
kafka-7.0.6        | 	at org.apache.kafka.queue.KafkaEventQueue$EventHandler.handleEvents(KafkaEventQueue.java:201)
kafka-7.0.6        | 	at org.apache.kafka.queue.KafkaEventQueue$EventHandler.run(KafkaEventQueue.java:175)
kafka-7.0.6        | 	at java.base/java.lang.Thread.run(Thread.java:840)
</pre>