
# JAVA (openjdk-1701)

- How to run openjdk-1701 from this project use

<pre>
git clone https://github.com/huntercodexs/docker-series.git .
cd self-containers/openjdk-1701
docker-compose up --build (in first time)
docker-compose start (in the next times)
</pre>

- Access the openjdk-1701 application 

> NOTE: BEFORE RUN GENERATE THE JAR FILE FROM PROJECT simple-api-demo !

<pre>
After changes in the current project and generated jar file, copy it into docker container openjdk
and run the command "docker-compose up openjdk-1701" to feature update or execute directly command as

docker exec -it openjdk-1701 java -jar /home/openjdk1701/simple-api-demo/SIMPLE-API-DEMO-22.01.1-SNAPSHOT.jar

request sample: [GET] http://${SERVER_IP}:31890/api/simple-api-demo
response: OK, it is working fine !

</pre>

- POSTMAN FILE

JAVA - Simple API Demo.postman_collection.json

- HELP

To install more than one version of the JDKs in your Linux environment develop, use this hints:

- Download the file: jdk-17.0.1_linux-x64_bin.tar.gz
<pre>
** Login is required **
https://www.oracle.com/br/java/technologies/javase/javase8u211-later-archive-downloads.html
</pre>

- Unzip the file downloaded
<pre>
tar -xvf jdk-17.0.1_linux-x64_bin.tar.gz
jdk-17.0.1
</pre>

- Put the folder extracted in a path used by IDE, by example IntelliJ
<pre>
/home/${USER}/.jdks/jdk-17.0.1
</pre>

- Set the IDE runnable file to compile and execute the jar and java files
<pre>
JDK Home Path: /home/${USER}/.jdks/jdk-17.0.1
</pre>

