# JAVA (openjdk-11.0.4)

- How to run openjdk-11.0.4 from this project use

<pre>
user@host:/home/user$ git clone https://github.com/huntercodexs/docker-series.git .
user@host:/home/user$ cd docker-series/self-containers/openjdk-11.0.4
user@host:/home/user/docker-series/self-containers/openjdk-11.0.4$ docker-compose up --build
user@host:/home/user/docker-series/self-containers/openjdk-11.0.4$ docker-compose start
</pre>

- Before build and start project set the microservices in script below

<pre>
- microservices-start.sh (self-containers/java/openjdk-11.0.4/microservices/microservices-start.sh)
</pre>

- Run the microservices in openjdk-11.0.4 container

<pre>
user@host:/home/user/docker-series/self-containers/java/openjdk-11.0.4$ docker exec -it openjdk-11.0.4 ./microservices-start.sh
</pre>

or

<pre>
user@host:/home/user/docker-series/self-containers/java/openjdk-11.0.4$ docker exec -it openjdk-11.0.4 /bin/bash
root@25f8c997da0a:/home/openjdk-11.0.4.0.1# ./microservices-start.sh
root@25f8c997da0a:/home/openjdk-11.0.4.0.1# ps -ef
UID          PID    PPID  C STIME TTY          TIME CMD
root           1       0  0 12:48 pts/0    00:00:00 bash
root           7       0  0 12:48 pts/1    00:00:00 /bin/bash
root          15       1 63 12:49 pts/1    00:00:11 java -jar SIMPLE-API-USERS-0.0.1-SNAPSHOT.jar
</pre>

> Use the postman file to make a tests above: "JAVA - openjdk-11.0.4.postman_collection.json"

> The microservices are localized in this project on folder self-containers/java/openjdk-11.0.4/microservices


# Support

To install more than one version of the JDKs in your Linux environment develop, use this hints:

- Download the file: jdk-11.0.4-linux-x64.tar.gz
<pre>
** Login is required **
https://www.oracle.com/br/java/technologies/javase/jdk11-archive-downloads.html
</pre>

- Unzip the file downloaded
<pre>
tar -xvf jdk-11.0.4-linux-x64.tar.gz
jdk1.8.0_212
</pre>

- Put the folder extracted in a path used by IDE, by example IntelliJ
<pre>
/home/${USER}/.jdks/jdk-11.0.4
</pre>

- Set the IDE runnable file to compile and execute the jar and java files
<pre>
JDK Home Path: /home/${USER}/.jdks/jdk-11.0.4
</pre>
