# FIREBIRD

- How to run firebird from this project use

<pre>
user@host:/home/user$ git clone https://github.com/huntercodexs/docker-series.git .
user@host:/home/user$ cd docker-series/self-containers/firebird
user@host:/home/user/docker-series/self-containers/firebird$ docker-compose up --build
user@host:/home/user/docker-series/self-containers/firebird$ docker-compose start
</pre>


# Documentation and Support

- Version

<pre>3.0.1</pre>

- Settings

Before build the firebird container, use the firebird/data/databases folder path (in this project) to set up the configurations
that should be used in the Server:

<pre>
databases.conf
fbintl.conf
fbtrace.conf
firebird.conf
plugins.conf
SYSDBA.password
</pre>

- Terminal Connection

<pre>
user@host:/home/user/docker-series/databases$ docker exec -it firebird /bin/bash
root@f6c930f8ed06:/etc/firebird/3.0# isql-fb 
Use CONNECT or CREATE DATABASE to specify a database
</pre>

- Create Database and Table

<pre>
SQL> CREATE DATABASE '/etc/firebird/3.0/databases/dbname1.fdb';
SQL> CREATE TABLE users (id INT NOT NULL PRIMARY KEY,name VARCHAR(250) NOT NULL);
SQL> INSERT INTO users (id, name) VALUES ('94734987', 'John Smith Wiz');
SQL> COMMIT;
SQL> SELECT * FROM users;

          ID NAME                                                                                                                                                                                                                                                       
============ =============================================================================== 
    94734987 John Smith Wiz                                                                                                                                                                                                                                             

SQL> QUIT;
</pre>

- Connection SGDB

<pre>
host: 192.168.0.204
port: 33050
path: /etc/firebird/3.0/databases/dbname1.fdb
username: sysdba
password: ${FIREBIRD_PASSWORD} or masterkey
jdbc-url: jdbc:firebirdsql://192.168.0.204:33050//etc/firebird/3.0/databases/dbname1.fdb
Reference library file: Jaybird-3.0.12-JDK_1.8.zip (https://firebirdsql.org/en/jdbc-driver/)
  jaybird-3.0.12.jar
  connector-api-1.5.jar
  antlr-runtime-4.7.jar
</pre>

- Install correct driver in your SGDB tool (example: DBeaver) get the driver in the follow address:

<pre>
https://firebirdsql.org/en/jdbc-driver/
</pre>

> TIP: Use the drivers placed in the local path project

<pre>
./drivers/firebird-3.0.12.zip
</pre>

- Below is the visual sample to Firebird Connection from DBeaver using a correct driver

![img.png](./midias/Firebird-Connection-Details-From-DBeaver.png)


# Step by Step

Follow the steps below to quick and easy environment creation

1- Clone the repository
<pre>
user@host:/home/user$ git clone https://github.com/huntercodexs/docker-series.git .
</pre>

2- Access the repository folder
<pre>
user@host:/home/user$ cd docker-series
</pre>

3- Access the firebird folder
<pre>
user@host:/home/user/docker-series$ cd firebird
</pre>

4- Check and set up the .env file and firebird/data/databases files as well to have sure about the correct and complete information's

Before build the firebird container, use the firebird/data/databases folder path (in this project) to set up the configurations
that should be used in the Server:

<pre>
databases.conf
fbintl.conf
fbtrace.conf
firebird.conf
plugins.conf
SYSDBA.password
</pre>

5- Build the containers

<pre>    
user@host:/home/user/docker-series/firebird$ docker network create open_network
user@host:/home/user/docker-series/firebird$ docker-compose up --build
</pre>

6- Create the database and tables

- Terminal Connection

<pre>
user@host:/home/user/docker-series/databases$ docker exec -it firebird /bin/bash
root@f6c930f8ed06:/etc/firebird/3.0# isql-fb 
Use CONNECT or CREATE DATABASE to specify a database
</pre>

- Create Database and Table

<pre>
SQL> CREATE DATABASE '/etc/firebird/3.0/databases/dbname1.fdb';
SQL> CREATE TABLE users (id INT NOT NULL PRIMARY KEY,name VARCHAR(250) NOT NULL);
SQL> INSERT INTO users (id, name) VALUES ('94734987', 'John Smith Wiz');
SQL> COMMIT;
SQL> SELECT * FROM users;

          ID NAME                                                                                                                                                                                                                                                       
============ =============================================================================== 
    94734987 John Smith Wiz                                                                                                                                                                                                                                             

SQL> QUIT;
</pre>

- SGDB Connection

See the instructions above to get more details about it
