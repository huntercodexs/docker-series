# JAVA + MSSQL
Simple Environment to simulate a workflow

# Requisites

- Java 8
- MsSQL

# How to use

- Run Container

<pre>
git clone https://github.com/huntercodexs/docker-series.git .
git checkout java_mssql
cd java_mssql
docker-compose up --build (in first time)
docker-compose start (in the next times)
docker exec -it java_mssql /bin/bash
</pre>

- Access the MSSQL database

<pre>
server: 192.168.0.174
port: 1433
user: SA
pass: mssql1Ipw
</pre>

# Run the sample projects

> Remember, the project is just to demonstration how work this project JAVA + MSSQL

To run the sample projects contained in this project get the project files into folder sample-project, and follow the bellow:

- open each project in your prefer IDE
- run the "mvn package"
- take the generated jar file
- edit the application.properties file with the correct settings
- finally use the result files in the folder app

> TIPS: Use the "JAVA + MSSQL.postman_collection.json" POSTMAN file to make tests

<pre>
./java_mssql/sample-project/java-mssql/JAVA + MSSQL.postman_collection.json
</pre>