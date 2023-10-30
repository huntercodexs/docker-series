# JAVA + MYSQL
Simple environment to simulate a workflow integrating Java + MYSQL

# Requisites

- Java 8
- MYSQL 8

# Usage

> NOTE: Check the configurations inside .env file before build this project

- Run Container

<pre>
user@host:/home/user$ git clone https://github.com/huntercodexs/docker-series.git .
user@host:/home/user$ cd docker-series
user@host:/home/user/docker-series git checkout java_mysql
user@host:/home/user/docker-series$ cd java_mysql
user@host:/home/user/docker-series/java_mysql$ docker-compose up --build (in first time)
user@host:/home/user/docker-series/java_mysql$ docker-compose start
</pre>

- Access the MYSQL database

<pre>
server: localhost
port: 3708
user: root
pass: root123
</pre>

# Run the sample projects

> Remember, the project is just to demonstration how work this project JAVA + MYSQL

To run the sample projects contained in this project get the project files into folder sample-project, and follow the bellow:

- open each project in your prefer IDE
- run the "mvn package"
- take the generated jar file
- edit the application.properties file with the correct settings
- finally use the result files in the folder app

> TIPS: Use the "JAVA_MYSQL.postman_collection.json" POSTMAN file to make tests

<pre>
./java_mysql/sample-project/java-mysql/src/main/resources/JAVA_MYSQL.postman_collection.json
</pre>

# Step by Step

<pre>
1- Clone the repository
    user@host:/home/user$ git clone https://github.com/huntercodexs/docker-series.git .

2- Access the repository folder
    user@host:/home/user$ cd docker-series

3- Change the current branch
    user@host:/home/user/docker-series$ git checkout java_mysql

4- Access the java+mysql folder
    user@host:/home/user/docker-series$ cd java_mysql

5- Set up the .env file on section MYSQL 8.0 SETTINGS

6- Build the containers
    user@host:/home/user/docker-series/java_mysql$ docker network create open_network
    user@host:/home/user/docker-series/java_mysql$ docker-compose up --build
    
    Maybe the openjdk is "openjdk-8u212 exited with code 1", please ignore it !
    Check the folder and files permissions whether any error occurs, example: access denied

7- Create the database, table and insert data inside MYSQL Database

    CREATE TABLE `customers` (
        `id` bigint NOT NULL AUTO_INCREMENT,
        `age` int DEFAULT NULL,
        `email` varchar(255) DEFAULT NULL,
        `name` varchar(255) DEFAULT NULL,
        PRIMARY KEY (`id`)
    ) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
    
    INSERT INTO customers (name, email, age) VALUES ('Amanda Barros', 'amanda@email.com', 33);
    INSERT INTO customers (name, email, age) VALUES ('Marcos Silva', 'marcos@email.com', 34);

8- Press the buttons
    user@host:/home/user/docker-series/java_mysql$ [Ctrl+C]

9- Build the project java-mysql and get the jar file plus application.properties and put the files in app path in this project
    
    Check the file permissions !

10- Start the containers
    user@host:/home/user/docker-series/java_mysql$ docker-compose start

11- Check the status from running containers
    user@host:/home/user/docker-series/java_mysql$ docker-compose ps

        Name                  Command             State                          Ports                       
    ---------------------------------------------------------------------------------------------------------
    mysql-80        docker-entrypoint.sh mysqld   Up      0.0.0.0:3708->3306/tcp,:::3708->3306/tcp, 33060/tcp
    openjdk-8u212   bash                          Up      0.0.0.0:38001->38001/tcp,:::38001->38001/tcp

12- Make tests using POSTMAN JAVA_MYSQL.postman_collection.json
    GET http://localhost:38001/api/v1/customers
    POST http://localhost:38001/api/v1/customers
    {
        "name": "John Smith",
        "email": "john@email.com",
        "age": 39
    }
</pre>
