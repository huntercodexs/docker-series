# JAVA + POSTGRES
Simple Environment to simulate a workflow

# Requisites

- Java 8
- Postgres

# How to use

<pre>
git clone https://github.com/huntercodexs/docker-series.git .
git checkout java_postgres
cd java_postgres
docker-compose up --build (in first time)
docker-compose start (in the next times)
docker exec -it java_postgres /bin/bash
</pre>

# Postgres

- Get the superuser postgres in CLI container postgres, and open the postgres database terminal:

<pre>
user@ubuntu:$ docker exec -it postgres /bin/bash
root@c63de647b32a:/# su - postgres
postgres@c63de647b32a:~$ psql 
psql (14.4 (Debian 14.4-1.pgdg110+1))
Type "help" for help.

postgres=# 
</pre>

- Create one user to manager the database:

<pre>
CREATE USER devel SUPERUSER INHERIT CREATEDB CREATEROLE;
ALTER USER devel PASSWORD '${POSTGRES_PASSWORD}';
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
CREATE TABLE users (
    id serial NOT NULL,
    name VARCHAR(250) NOT NULL,
    age INTEGER,
    PRIMARY KEY (id)
);

INSERT INTO users (id, name, age) VALUES ('94734987', 'John Smith Wiz', 33);
INSERT INTO users (id, name, age) VALUES ('12734983', 'Solange Smart Wow', 34);
SELECT * FROM users;
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
./java_postgres/sample-project/java-mssql/JAVA + POSTGRES.postman_collection.json
</pre>

