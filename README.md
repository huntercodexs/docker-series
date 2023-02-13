
# JAVA (openjdk-8u212)

- How to run openjdk-8u212 from this project use

<pre>
git clone https://github.com/huntercodexs/docker-series.git .
cd self-containers/openjdk-8u212
docker-compose up --build (in first time)
docker-compose start (in the next times)
</pre>

- Access the openjdk-8u212 application

> NOTE: BEFORE RUN GENERATE THE JAR FILE FROM PROJECT simple-api-demo !

<pre>
After changes in the current project and generated jar file, copy it into docker container openjdk-8u212
and run the command "docker-compose up openjdk-8u212" to feature update or execute directly command as

docker exec -it openjdk-8u212 java -jar /home/openjdk8u212/simple-api-demo/SIMPLE-API-DEMO-22.01.1-SNAPSHOT.jar

request sample: [GET] http://${SERVER_IP}:31890/api/simple-api-demo
response: OK, it is working fine !

</pre>

- POSTMAN FILE

JAVA - Simple API Demo.postman_collection.json

- HELP

To install more than one version of the JDKs in your Linux environment develop, use this hints:

- Download the file: jdk-8u212-linux-x64.tar.gz
<pre>
** Login is required **
https://www.oracle.com/br/java/technologies/javase/javase8u211-later-archive-downloads.html
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

# MONGODB

- BEFORE RUN

Edit the .env file to create correctly to Mongo Express and MongoDB access.

- BUILD AND RUN

<pre>
git clone https://github.com/huntercodexs/docker-series.git .
cd self-containers/mongodb
docker-compose up --build (in first time)
docker-compose start (in the next times)
</pre>

- AFTER BUILD

> Access the MongoDB Express

<pre>
http://${WEBSERVER_ADDRESS}:38091/
username: ${MONGO_EXPRESS_USERNAME}
password: ${MONGO_EXPRESS_PASSWORD}
</pre>

- Create a database: dbname

![img.png](./midias/Mongo-Express-Dashboard.png)

- Create a collection: users
- Create a documents(index): id, name

Enjoy !
