# JAVA + MSSQL
Simple environment to simulate a workflow integrating Java + MSSQL

# Requisites

- Java 8
- MsSQL
- MsSQL Tools

# Usage

> NOTE: Check the configurations inside .env file before build this project

- Run Container

<pre>
user@host:/home/user$ git clone https://github.com/huntercodexs/docker-series.git .
user@host:/home/user$ cd docker-series
user@host:/home/user/docker-series git checkout java_mssql
user@host:/home/user/docker-series$ cd java_mssql
user@host:/home/user/docker-series/java_mssql$ docker-compose up --build (in first time)
user@host:/home/user/docker-series/java_mssql$ docker-compose start
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

> TIPS: Use the "JAVA_MSSQL.postman_collection.json" POSTMAN file to make tests

<pre>
./java_mssql/sample-project/java-mssql/src/main/resources/JAVA_MSSQL.postman_collection.json
</pre>

# Step by Step

<pre>
1- Clone the repository
    user@host:/home/user$ git clone https://github.com/huntercodexs/docker-series.git .

2- Access the repository folder
    user@host:/home/user$ cd docker-series

3- Change the current branch
    user@host:/home/user/docker-series git checkout java_mssql

4- Access the java+mssql folder
    user@host:/home/user/docker-series$ cd java_mssql

5- Set up the .env file on section MSSQL SETTINGS

6- Build the containers
    user@host:/home/user/docker-series/java_mssql$ docker network create open_network
    user@host:/home/user/docker-series/java_mssql$ docker-compose up --build
    
    Maybe the openjdk is "openjdk-8u212 exited with code 1", please ignore it !
    Check the folder and files permissions whether any error occurs, example: access denied

7- Create the database, table and insert data inside MSSQL Database
    CREATE DATABASE demo; (you can use the SGDB to make this)

    CREATE TABLE demo.dbo.customers (
        id bigint IDENTITY(1,1) NOT NULL,
        name varchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
        email varchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
        age int NULL,
        CONSTRAINT PK__customer__3213E83F145A0C82 PRIMARY KEY (id)
    );
    
    INSERT INTO customers (name, email, age) VALUES ('Amanda Barros', 'amanda@email.com', 33);
    INSERT INTO customers (name, email, age) VALUES ('Marcos Silva', 'marcos@email.com', 34);

8- Press the buttons
    user@host:/home/user/docker-series/java_postgres$ [Ctrl+C]

9- Build the project java-mssql and get the jar file plus application.properties and put the files in app path in this project

10- Start the containers
    user@host:/home/user/docker-series/java_mssql$ docker-compose start

11- Check the status from running containers
    user@host:/home/user/docker-series/java_mssql$ docker-compose ps

        Name                   Command               State                      Ports                    
    -----------------------------------------------------------------------------------------------------
    mssql           /opt/mssql/bin/permissions ...   Up      0.0.0.0:1433->1433/tcp,:::1433->1433/tcp    
    mssql-tools     /bin/sh -c /bin/bash             Up      0.0.0.0:31812->10000/tcp,:::31812->10000/tcp
    openjdk-8u212   java -jar /home/openjdk8u2 ...   Up      0.0.0.0:38001->38001/tcp,:::38001->38001/tcp

12- Make tests using POSTMAN JAVA_MSSQL.postman_collection.json
    GET http://localhost:38001/api/v1/customers
    POST http://localhost:38001/api/v1/customers
    {
        "name": "John Smith",
        "email": "john@email.com",
        "age": 39
    }
</pre>
