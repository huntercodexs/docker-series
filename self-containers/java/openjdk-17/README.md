# JAVA (openjdk-17)

- How to run openjdk-17 from this project use

<pre>
user@host:/home/user$ git clone https://github.com/huntercodexs/docker-series.git .
user@host:/home/user$ cd docker-series/self-containers/java/openjdk-17
user@host:/home/user/docker-series/self-containers/java/openjdk-17$ docker-compose up --build
user@host:/home/user/docker-series/self-containers/java/openjdk-17$ docker-compose start
</pre>

- Before build and start project set the microservices in script below

<pre>
- microservices-start.sh (self-containers/java/openjdk-17/microservices/microservices-start.sh)
</pre>

- Run the microservices in openjdk-17 container

<pre>
user@host:/home/user/docker-series/self-containers/java/openjdk-17$ docker exec -it openjdk-17 ./microservices-start.sh
</pre>

or

<pre>
user@host:/home/user/docker-series/self-containers/java/openjdk-17$ docker exec -it openjdk-17 /bin/bash
root@25f8c997da0a:/home/openjdk17# ./microservices-start.sh
root@25f8c997da0a:/home/openjdk17# ps -ef
UID          PID    PPID  C STIME TTY          TIME CMD
root           1       0  0 12:48 pts/0    00:00:00 bash
root           7       0  0 12:48 pts/1    00:00:00 /bin/bash
root          15       1 63 12:49 pts/1    00:00:17 java -jar SIMPLE-API-USERS-0.0.1-SNAPSHOT.jar
</pre>

> Use the postman file to make a tests above: "JAVA - OPENJDK-17.postman_collection.json"

> The microservices are localized in this project on folder self-containers/java/openjdk-17/microservices


# Support

To install more than one version of the JDKs in your Linux environment develop, use this hints:

- Download the file: jdk-17-linux-x64.tar.gz
<pre>
** Login is required **
https://www.oracle.com/java/technologies/javase/jdk17-archive-downloads.html
</pre>

- Unzip the file downloaded
<pre>
tar -xvf jdk-17-linux-x64.tar.gz
jdk-17
</pre>

- Put the folder extracted in a path used by IDE, by example IntelliJ
<pre>
/home/${USER}/.jdks/jdk-17
</pre>

- Set the IDE runnable file to compile and execute the jar and java files
<pre>
JDK Home Path: /home/${USER}/.jdks/jdk-17
</pre>

