
# JAVA (openjdk-8u212)

- To run openjdk-8u212 from this project use

<pre>
git clone https://github.com/huntercodexs/docker-series.git .
cd self-containers/openjdk-8u212
docker-compose up --build openjdk-8u212 (in first time)
docker-compose start openjdk-8u212 (in others case)
</pre>

- Access the openjdk-8u212 application 

> NOTE: JUST USE WITH JAR FILE !

<pre>
After changes in the current project and generated jar file, copy it into docker container openjdk
and run the command "docker-compose up openjdk-8u212" to feature update or execute directly command as

docker exec -it openjdk-8u212 java -jar /home/openjdk8u212/simple-api-demo/SIMPLE-API-DEMO-22.01.1-SNAPSHOT.jar

request sample: [GET] http://${SERVER_IP}:31890/api/simple-api-demo
response: OK, it is working fine !

</pre>

> POSTMAN

JAVA - Simple API Demo.postman_collection.json

> HELP

To install more than one version of the JDKs in your Linux environment develop, use this hints:

- Download the file: jdk-8u212-linux-x64.tar.gz
<pre>
https://www.oracle.com/br/java/technologies/javase/javase8u211-later-archive-downloads.html
** Login is required **
</pre>

- Unzip the file downloaded
<pre>
tar -xvf jdk-8u212-linux-x64.tar.gz
jdk1.8.0_212
</pre>

- Put the folder extracted in a path used by IDE, by example IntelliJ
<pre>
/home/${USER}/.jdks/jdk1.8.0_212
</pre>

- Set the IDE runnable file to compile and execute the jar and java files
<pre>
JDK Home Path: /home/${USER}/.jdks/jdk1.8.0_212
</pre>
