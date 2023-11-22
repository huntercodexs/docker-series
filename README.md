# JAVA + POSTGRES
Simple environment to simulate a workflow integrating Java + Postgres

![banner.png](java_postgres/midias/banner.png)

# Requisites

- Java 8
- Postgres

# Usage

Firstly get the project and checkout the correct branch

> NOTE: Check if folder postgres/PostgresSQL exists and is empty

> NOTE: Set up the .env file and after make a builder to mongo database and openjdk (java)

<pre>
user@host:/home/user$ git clone https://github.com/huntercodexs/docker-series.git .
user@host:/home/user$ cd docker-series
user@host:/home/user/docker-series$ git checkout java_postgres
user@host:/home/user/docker-series$ cd java_postgres
user@host:/home/user/docker-series/java_postgres$ mkdir -p postgres/PostgresSQL
user@host:/home/user/docker-series/java_postgres$ docker network create open_network (if required)
user@host:/home/user/docker-series/java_postgres$ docker-compose up --build
user@host:/home/user/docker-series/java_postgres$ Ctrl+C
user@host:/home/user/docker-series/java_postgres$ docker-compose start
</pre>

> NOTE: Copy the jar and application.properties from sample_project to app folder, see more details in 
> "Run the sample projects" section

Get the superuser postgres in CLI container postgres, and open the postgres database terminal:

<pre>
user@host:/home/user/docker-series/java_postgres$ docker exec -it postgres /bin/bash
root@c63de647b32a:/# su - postgres
postgres@c63de647b32a:~$ psql 
psql (14.4 (Debian 14.4-1.pgdg110+1))
Type "help" for help.

postgres=# 
</pre>

- Create one user to manager the database:

<pre>
CREATE USER DEVEL SUPERUSER INHERIT CREATEDB CREATEROLE;
ALTER USER DEVEL PASSWORD '${POSTGRES_PASSWORD}';
</pre>

- List all users

<pre>
\du
</pre>

<pre>
postgres=# \du
                                   List of roles
 Role name |                         Attributes                         | Member of 
-----------+------------------------------------------------------------+-----------
 devel     | Superuser, Create role, Create DB                          | {}
 postgres  | Superuser, Create role, Create DB, Replication, Bypass RLS | {}
</pre>

- Create a table sample:

<pre>
CREATE TABLE customers (
    id serial NOT NULL,
    name VARCHAR(250) NOT NULL,
    email VARCHAR(250) NOT NULL,
    age INTEGER,
    PRIMARY KEY (id)
);

INSERT INTO customers (id, name, email, age) VALUES ('94734987', 'John Smith Wiz', 'john@email.com', 33);
INSERT INTO customers (id, name, email, age) VALUES ('12734983', 'Solange Smart Wow', 'sol@email.com', 34);
SELECT * FROM customers;
</pre>

- Connect to postgres database with DBeaver

<pre>
Host: ${DATABASE_SERVER_ADDRESS}
Port: 5432
Database: postgres
Authentication: Database Native
Username: postgres
Password: ${POSTGRES_PASSWORD}
</pre>

![img.png](./java_postgres/postgres/midias/Postgres-Database-Connection-Sample.png)

Output sample

<pre>
    Name                   Command              State                      Ports                    
----------------------------------------------------------------------------------------------------
openjdk-8u212   bash                            Up      0.0.0.0:38001->38001/tcp,:::38001->38001/tcp
postgres        docker-entrypoint.sh postgres   Up      0.0.0.0:5432->5432/tcp,:::5432->5432/tcp
</pre>

# Run the sample projects

> Remember, the project is just to demonstration how work this project JAVA + POSTGRES

To run the sample projects contained in this project get the project files into folder sample-project, and follow the bellow:

- open each project in your prefer IDE
- run the "mvn package"
- take the generated jar file
- edit the application.properties file with the correct settings
- finally use the result files in the folder app

Application Properties Sample

<pre>
# APPLICATION SETTINGS
#-----------------------------------------------------------------------------------------------------------------------
server.port=38001
api.prefix=/api/v1
server.error.whitelabel.enabled=true
spring.main.allow-bean-definition-overriding=true

# SPRING JPA CONFIG
#-------------------------------------------------------------------------------------------------------------------
spring.datasource.url=jdbc:postgresql://192.168.0.204:5432/postgres
spring.datasource.username=postgres
spring.datasource.password=pgsql1Ipw
spring.jpa.hibernate.ddl-auto=update
spring.jpa.show-sql=true
spring.jpa.properties.hibernate.format_sql=true
spring.jpa.properties.hibernate.dialect=org.hibernate.dialect.PostgreSQL9Dialect
spring.jpa.properties.hibernate.temp.use_jdbc_metadata_defaults=false
</pre>

> TIPS: Use the "JAVA_POSTGRES.postman_collection.json" POSTMAN file to make tests

<pre>
./java_postgres/sample-project/java-postgres/JAVA_POSTGRES.postman_collection.json
</pre>

# Step by Step

1- Clone the repository
<pre>
user@host:/home/user$ git clone https://github.com/huntercodexs/docker-series.git .
</pre>

2- Access the repository folder
<pre>
suser@host:/home/user$ cd docker-series
</pre>

3- Change the current branch
<pre>
user@host:/home/user/docker-series git checkout java_postgres
</pre>

4- Access the java+postgres folder
<pre>
user@host:/home/user/docker-series$ cd java_postgres
</pre>

5- Set up the .env file on section POSTGRES SETTINGS

6- Ensure thar the folder PostgresSQL exists (check the permissions)
<pre>
user@host:/home/user/docker-series/java_postgres$ mkdir -p postgres/PostgresSQL
</pre>

7- Create a network to containers (if required)
<pre>
user@host:/home/user/docker-series/java_postgres$ docker network create open_network
</pre>

8- Build the containers 
<pre>
user@host:/home/user/docker-series/java_postgres$ docker-compose up --build
Maybe the openjdk is "openjdk-8u212 exited with code 1", please ignore it !
</pre>

9- Press the buttons
<pre>
user@host:/home/user/docker-series/java_postgres$ [Ctrl+C]
</pre>

10- Build the project java-postgres and get the jar file plus application.properties and put the files in app path in this project

11- Execute and access the postgres container
<pre>
user@host:/home/user/docker-series/java_postgres$ docker-compose start postgres
user@host:/home/user/docker-series/java_postgres$ docker exec -it postgres /bin/bash
root@c63de647b32a:/# su - postgres
postgres@c63de647b32a:~$ psql 
psql (14.4 (Debian 14.4-1.pgdg110+1))
Type "help" for help.
    
postgres=#
</pre>

12- Create User
<pre>
CREATE USER DEVEL SUPERUSER INHERIT CREATEDB CREATEROLE;
ALTER USER DEVEL PASSWORD '${POSTGRES_PASSWORD}';
</pre>

13- Create Table
<pre>
CREATE TABLE customers (
    id serial NOT NULL,
    name VARCHAR(250) NOT NULL,
    email VARCHAR(250) NOT NULL,
    age INTEGER,
    PRIMARY KEY (id)
);
</pre>

14- Insert Data
<pre>
INSERT INTO customers (id, name, email, age) VALUES ('94734987', 'John Smith Wiz', 'john@email.com', 33);
INSERT INTO customers (id, name, email, age) VALUES ('12734983', 'Solange Smart Wow', 'sol@email.com', 34);
SELECT * FROM customers;
</pre>

15- Connect to postgres database from a SGDB (example: DBeaver), see the section above
    
16- Start the containers again (First of all, quit the container postgres pressing times the [Ctrl+D])
<pre>
user@host:/home/user/docker-series/java_postgres$ docker-compose start
</pre>

17- Check the status for both container
<pre>
user@host:/home/user/docker-series/java_postgres$ docker-compose ps

    Name                   Command               State                      Ports                    
-----------------------------------------------------------------------------------------------------
openjdk-8u212   java -jar /home/openjdk8u2 ...   Up      0.0.0.0:38001->38001/tcp,:::38001->38001/tcp
postgres        docker-entrypoint.sh postgres    Up      0.0.0.0:5432->5432/tcp,:::5432->5432/tcp  
</pre>

18- Make tests using POSTMAN JAVA_POSTGRES.postman_collection.json
<pre>
GET http://localhost:38001/api/v1/customers
POST http://localhost:38001/api/v1/customers
{
    "name": "marcos",
    "email": "marcos@email.com",
    "age": 39
}
</pre>