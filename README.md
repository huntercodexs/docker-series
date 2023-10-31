# JAVA + FIREBIRD
Simple environment to simulate a workflow integrating Java + FIREBIRD

# Requisites

- Java 8
- FIREBIRD 3.0

# Usage

> NOTE: Check the configurations inside .env file before build this project

- Run Container

<pre>
user@host:/home/user$ git clone https://github.com/huntercodexs/docker-series.git .
user@host:/home/user$ cd docker-series
user@host:/home/user/docker-series git checkout java_firebird
user@host:/home/user/docker-series$ cd java_firebird
user@host:/home/user/docker-series/java_firebird$ docker-compose up --build (in first time)
user@host:/home/user/docker-series/java_firebird$ docker-compose start
</pre>

# Run the sample projects

> Remember, the project is just to demonstration how work this project JAVA + FIREBIRD

To run the sample projects contained in this project get the project files into folder sample-project, and follow the bellow:

- open each project in your prefer IDE
- run the "mvn package"
- take the generated jar file
- edit the application.properties file with the correct settings
- finally use the result files in the folder app

> TIPS: Use the "JAVA_FIREBIRD.postman_collection.json" POSTMAN file to make tests

<pre>
./java_firebird/sample-project/java-firebird/src/main/resources/JAVA_FIREBIRD.postman_collection.json
</pre>

# Step by Step

<pre>
1- Clone the repository
    user@host:/home/user$ git clone https://github.com/huntercodexs/docker-series.git .

2- Access the repository folder
    user@host:/home/user$ cd docker-series

3- Change the current branch
    user@host:/home/user/docker-series$ git checkout java_firebird

4- Access the java+firebird folder
    user@host:/home/user/docker-series$ cd java_firebird

5- Set up the .env file on section FIREBIRD 8.0 SETTINGS

6- Build the containers
    user@host:/home/user/docker-series/java_firebird$ docker network create open_network
    user@host:/home/user/docker-series/java_firebird$ docker-compose up --build
    
    Maybe the openjdk is "openjdk-8u212 exited with code 1", please ignore it !
    Check the folder and files permissions whether any error occurs, example: access denied

7- Terminal Connection

    user@host:/home/user/docker-series/java_firebird$ [Ctrl+C]
    user@host:/home/user/docker-series/java_firebird$ docker-compose start firebird
    user@host:/home/user/docker-series/java_firebird$ docker exec -it firebird /bin/bash
    root@f6c930f8ed06:/etc/firebird/3.0# isql-fb 
    Use CONNECT or CREATE DATABASE to specify a database
    
8- Create Database and Table

    SQL> CREATE DATABASE '/etc/firebird/3.0/databases/dbname1.fdb';
    SQL> CREATE TABLE customers (
        id numeric(18,0) not null,
        age integer,
        email varchar(255),
        name varchar(255),
        primary key (id)
    );
    SQL> INSERT INTO customers (id, name, email, age) VALUES ('94734987', 'John Smith Wiz', 'john@email.com', 33);
    SQL> INSERT INTO customers (id, name, email, age) VALUES ('95734987', 'Mayra Smith Wiz', 'mayra@email.com', 35);
    SQL> COMMIT;
    SQL> SELECT * FROM customers;
    
              ID NAME                EMAIL            AGE 
    ============ =================== ================ ============ 
        94734987 John Smith Wiz      john@email.com   33
        95734987 Mayra Smith Wiz     mayra@email.com  35

    SQL> QUIT;

9- Press the buttons and stop containers
    user@host:/home/user/docker-series/java_firebird$ [Ctrl+D]
    user@host:/home/user/docker-series/java_firebird$ docker-compose stop

10- Build the project java-firebird and get the jar file plus application.properties and put the files in app path in this project
    
    Check the file permissions !

11- Start the containers
    user@host:/home/user/docker-series/java_firebird$ docker-compose start

12- Check the status from running containers
    user@host:/home/user/docker-series/java_firebird$ docker-compose ps

        Name                   Command               State                      Ports                    
    -----------------------------------------------------------------------------------------------------
    firebird        firebird                         Up      0.0.0.0:33050->3050/tcp,:::33050->3050/tcp  
    openjdk-8u212   java -jar /home/openjdk8u2 ...   Up      0.0.0.0:38001->38001/tcp,:::38001->38001/tcp

13- Make tests using POSTMAN JAVA_FIREBIRD.postman_collection.json
    GET http://localhost:38001/api/v1/customers
    POST http://localhost:38001/api/v1/customers
    {
        "name": "John Smith",
        "email": "john@email.com",
        "age": 39
    }
</pre>
