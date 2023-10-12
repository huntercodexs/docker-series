
# Databases

----

The helpful repository for all databases

# Usage

----

<pre>
user@host:~/home/user$ git clone https://github.com/huntercodexs/docker-series.git .
user@host:~/home/user/docker-series$ cd docker-series
user@host:~/home/user/docker-series$ git checkout databases
user@host:~/home/user/docker-series$ cd databases
user@host:~/home/user/docker-series/databases$ ./pre-requisites.sh
user@host:~/home/user/docker-series/databases$ docker-compose up --build (in first time)
user@host:~/home/user/docker-series/databases$ docker-compose start (in the next times)
user@host:~/home/user/docker-series/databases$ docker-compose ps
    Name                   Command                  State                                                                      Ports                                                                
----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
firebird        firebird                         Up             0.0.0.0:33050->3050/tcp,:::33050->3050/tcp                                                                                          
h2-database     start-h2-database-server         Up             0.0.0.0:35900->35900/tcp,:::35900->35900/tcp, 0.0.0.0:38085->8085/tcp,:::38085->8085/tcp, 0.0.0.0:39095->9095/tcp,:::39095->9095/tcp
mongo           docker-entrypoint.sh mongod      Up             0.0.0.0:27017->27017/tcp,:::27017->27017/tcp                                                                                        
mongo-express   /sbin/tini -- /docker-entr ...   Up             0.0.0.0:38091->8081/tcp,:::38091->8081/tcp                                                                                          
mssql           /opt/mssql/bin/permissions ...   Up             0.0.0.0:1433->1433/tcp,:::1433->1433/tcp                                                                                            
mssql-tools     /bin/sh -c /bin/bash             Up             0.0.0.0:31812->10000/tcp,:::31812->10000/tcp                                                                                        
mysql-57        docker-entrypoint.sh mysqld      Up             0.0.0.0:3357->3306/tcp,:::3357->3306/tcp, 33060/tcp                                                                                 
mysql-80        docker-entrypoint.sh mysqld      Up             0.0.0.0:3708->3306/tcp,:::3708->3306/tcp, 33060/tcp                                                                                 
oraclelinux     /bin/sh -c exec $ORACLE_BA ...   Up (healthy)   0.0.0.0:1521->1521/tcp,:::1521->1521/tcp, 0.0.0.0:5500->5500/tcp,:::5500->5500/tcp                                                  
postgres        docker-entrypoint.sh postgres    Up             0.0.0.0:5432->5432/tcp,:::5432->5432/tcp                                                                                            
redis           docker-entrypoint.sh redis ...   Up             0.0.0.0:6379->6379/tcp,:::6379->6379/tcp                                                                                            
sqlite3         bash                             Up             0.0.0.0:31050->5050/tcp,:::31050->5050/tcp 
</pre>

# Documentation and Support

----

<h3>Firebird</h3>

- Version

<pre>3.0.1</pre>

- Settings

Before build the firebird container, use the firebird/data folder path (in this project) to set up the configurations
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
user@host:~/home/user/docker-series/databases$ docker exec -it firebird /bin/bash
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
host: 192.168.0.174
port: 33050
path: /etc/firebird/3.0/databases/dbname1.fdb
username: sysdba
password: ${FIREBIRD_PASSWORD} or masterkey
jdbc-url: jdbc:firebirdsql://192.168.0.174:33050//etc/firebird/3.0/databases/dbname1.fdb
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
./database/drivers/firebird/firebird-3.0.12.zip
</pre>

- Below is the visual sample to Firebird Connection from DBeaver using a correct driver

![img.png](./databases/firebird/midias/Firebird-Connection-Details-From-DBeaver.png)

<h3>H2</h3>

- Settings to do before run this project

Configure the file .env as shown bellow

> NOTE: Check the version and zip filename in the https://www.h2database.com/html/download.html

![h2-database-download.png](./databases/h2-database/midias/h2-database-download.png)

<pre>
H2DATABASE_VERSION=version-2.1.214
H2DATABASE_ZIPFILE=h2-2022-06-13.zip
</pre>

- Set up the ports

<pre>
H2DATABASE_HOST_PORT=35900
H2DATABASE_HOST_ADDITIONAL_PORT=35900

H2DATABASE_HOST_TCP_PORT=39095
H2DATABASE_TCP_SERVER_PORT=9095

H2DATABASE_HOST_HTTP_PORT=38085
H2DATABASE_HTTP_SERVER_PORT=8085
</pre>

- Access the H2 Database via HTTP (console)

<pre>
http://{server-address}:38085
</pre>

> TIP: Weather occurs any error, try again ! 

![h2-database-access.png](./databases/h2-database/midias/h2-database-access.png)

- Access the H2 Database via TCP/IP

<pre>
tcp://localhost:39095/~/db-h2-test
</pre>

- Access the H2 Database via Java Application

<pre>
spring.datasource.url=jdbc:h2:tcp://localhost:39095/~/db-h2-test
spring.datasource.jdbcUrl=jdbc:h2:tcp://localhost:39095/~/db-h2-test
</pre>

> TIP: You can customize the script bin/start-h2-database-server to gain more effects in your environment

> TIP: You can also create an initializer sql commands into bin/db-init.sql to charge database from tests in your
> application as showed bellow

<pre>
spring.datasource.url=jdbc:h2:tcp://localhost:39095/~/db-h2-test;INIT=RUNSCRIPT FROM '~/db-init.sql'
spring.datasource.jdbcUrl=jdbc:h2:tcp://localhost:39095/~/db-h2-test;INIT=RUNSCRIPT FROM '~/db-init.sql'
</pre>

<h3>MsSQL</h3>

- Set up the .env file

<pre>
# Set the port to MSSQL
MSSQL_PORT=1433
MSSQL_TOOLS_PORT=31812

# Set database access (strong)
MSSQL_USERNAME=SA
MSSQL_SA_PASSWORD=mssql1Ipw

# Set license accept (Y/N)
MSSQL_ACCEPT_EULA=Y

# Set the current use for this image container
# (Developer, Express, Standard, Enterprise, EnterpriseCore)
MSSQL_EDITION=Express
MSSQL_TRUSTED_CONNECTION=true
</pre>

- Settings

<pre>
server: 192.168.0.174
port: 1433
user: SA
pass: mssql1Ipw
</pre>

- SGDB Configuration

![mssql-connection-sgdb.png](./databases/midias/mssql-connection-sgdb.png)

<h3>MongoDB</h3>

- Settings

Edit the .env file to create correctly to Mongo Express and MongoDB access.

- Access the MongoDB Express

<pre>
http://${WEBSERVER_ADDRESS}:38091/
username: ${MONGO_EXPRESS_USERNAME}
password: ${MONGO_EXPRESS_PASSWORD}
</pre>

![mongo-express-dashboard.png](./databases/midias/mongo-express-dashboard.png)

- Create a database: dbname

- Create a collection: users

- Create a documents(index): id, name

![mongo-express-dashboard-collection.png](./databases/midias/mongo-express-dashboard-collection.png)

<h3>MySQL-5.7</h3>

- Access the database

<pre>
server: 192.168.0.174
port: 3705
user: root
pass: root123
</pre>

<h3>MySQL-8.0</h3>

- Access the database

<pre>
server: 192.168.0.174
port: 3708
user: root
pass: root123
</pre>

<h3>Oracle</h3>

> Definitions and Variables

<pre>
ORACLE-DATABASE-USER: DEVEL (in many cases should be SYS or SYSTEM)
ORACLE-DATABASE-USER-LOWERCASE: devel
ORACLE-DATABASE-PDB: ORCLPDB1
ORACLE-PASSWORD: oracle1Ipw
ORACLE-DATABASE-ROLE: Normal (in many cases can be SYSDBA)
ORACLE-DATABASE-AUTH-MODE: Oracle Database Native
ORACLE-DATABASE-PORT: 1521
ORACLE-DATABASE-TABLESPACE: /opt/oracle/oradata/ORCLCDB/{{ORACLE-DATABASE-PDB}}/{{ORACLE-DATABASE-USER-LOWERCASE}}.dbf
</pre>

> <p style="color: orange">IMPORTANT</p>    

- The builder of this container is very long and need a long time to finish correctly
- Use the command docker-compose up --build to run in first time
- After the first build use docker-compose up -d oraclelinux or docker-compose start oraclelinux

>** VERY IMPORTANT **
- The path oracle/oradata in current container instance "should be empty"
- Have sure that the oracle/oradata is empty or just have the dbconfig/ and ORCLCDB/ folders

> ORACLE EDITION (see .env file):

<pre>
ee - Enterprise Edition
se2 - Standard Edition
xe - Express Edition
</pre>

> <p style="color: red">REQUIRED</p>

- Database file: LINUX.X64_193000_db_home.zip (in this case)
- This file can be downloaded in https://www.oracle.com/database/technologies/oracle-database-software-downloads.html

> STEPS BEFORE BUILD

- Put the LINUX.X64_193000_db_home.zip inside oracle/database before run the docker-compose
- Unzip the oraclelinux-database-scripts-19c.tar.bz2 file inside the oracle/database folder:
<pre>
tar -xvf oraclelinux-database-scripts-19c.tar.bz2
</pre>
- Create the oradata folder in oracle path
- Check if oracle/oradata is empty or just have the dbconfig/ and ORCLCDB/ folders

> STEPS AFTER BUILD

- HOST(your machine):

Set Password Administration
<pre>
docker-compose start oraclelinux
docker exec -it oraclelinux ./setPassword.sh {{YOUR_ORACLE_PASSWORD}}
</pre>

- Access the database container
<pre>
docker exec -it oraclelinux /bin/bash
</pre>

- GUEST(inside oraclelinux):

- Create User
<pre>
sqlplus sys/{{ORACLE-PASSWORD}}@{{ORACLE-DATABASE-PDB}} as sysdba
CREATE USER {{ORACLE-DATABASE-USER}} IDENTIFIED BY {{ORACLE-PASSWORD}};
GRANT CREATE SESSION, CREATE TABLE TO {{ORACLE-DATABASE-USER}};
ALTER USER {{ORACLE-DATABASE-USER}} QUOTA 50m ON SYSTEM;
CREATE SMALLFILE TABLESPACE {{ORACLE-DATABASE-USER}} DATAFILE '{{ORACLE-DATABASE-TABLESPACE}}' SIZE 1G;
ALTER DATABASE DEFAULT TABLESPACE {{ORACLE-DATABASE-USER}};
SELECT * FROM ALL_USERS au;
SELECT * FROM ALL_USERS au WHERE au.USERNAME = '{{ORACLE-DATABASE-USER}}';
EXIT;
</pre>

- Add user

<pre>
docker exec -it oraclelinux /bin/bash
sqlplus sys/{{ORACLE-PASSWORD}}@{{ORACLE-DATABASE-PDB}} as sysdba
CREATE USER {{ORACLE-DATABASE-USER}} IDENTIFIED BY {{ORACLE-PASSWORD}};
GRANT CREATE SESSION, CREATE TABLE TO {{ORACLE-DATABASE-USER}};
ALTER USER {{ORACLE-DATABASE-USER}} QUOTA UNLIMITED ON SYSTEM;
CREATE SMALLFILE TABLESPACE {{ORACLE-DATABASE-USER}} DATAFILE '{{ORACLE-DATABASE-TABLESPACE}}' SIZE 1G;
ALTER DATABASE DEFAULT TABLESPACE {{ORACLE-DATABASE-USER}};
ALTER USER {{ORACLE-DATABASE-USER}} QUOTA UNLIMITED ON SYSTEM;
GRANT ALL PRIVILEGES TO {{ORACLE-DATABASE-USER}};
SELECT * FROM ALL_USERS au;
SELECT * FROM ALL_USERS au WHERE au.USERNAME = '{{ORACLE-DATABASE-USER}}';
EXIT;
</pre>

- Get ORACLE-DATABASE-PDB available from oracle

<pre>
** to get this value exec in the current terminal:
SQL> show pdbs;

CON_ID CON_NAME			  OPEN MODE  RESTRICTED
---------- ------------------------------ ---------- ----------
3 ORCLORACLE-DATABASE-PDB1			  READ WRITE NO
SQL>EXIT;
</pre>

- Connect on database using the new user
<pre>
sqlplus {{ORACLE-DATABASE-USER}}/{{ORACLE-PASSWORD}}@{{ORACLE-DATABASE-PDB}}
</pre>

- Access the Database Oracle Linux:

<pre>
Host: {{DATABASE_ORACLE_SERVER_IP}}
Port: {{ORACLE-DATABASE-PORT}}
Database: {{ORACLE-DATABASE-PDB}} [Service Name]
Authentication:{{ORACLE-DATABASE-AUTH-MODE}}
Username: {{ORACLE-DATABASE-USER}}
Role: {{ORACLE-DATABASE-ROLE}}
Password: {{ORACLE-PASSWORD}}
</pre>

> Database Connection Sample

![img.png](./databases/oracle/midias/DBeaver-Oracle-Connection-Details.png)

> Enterprise Manager

![img.png](./databases/oracle/midias/Oracle-Database-EM.png)

- Access the Enterprise Manager:

<pre>
https://{{WEBSERVER_ADDRESS}}:5500/em
  > username: sys
  > password: {{YOUR_ORACLE_PASSWORD}}
  > container name: {{ORACLE-DATABASE-PDB}}
</pre>

* All rights reserved to ORACLE - https://www.oracle.com/

<h3>Postgres</h3>

> Get the superuser postgres in CLI container postgres, and open the postgres database terminal:

<pre>
user@ubuntu:$ docker exec -it postgres /bin/bash
root@c63de647b32a:/# su - postgres
postgres@c63de647b32a:~$ psql 
psql (14.4 (Debian 14.4-1.pgdg110+1))
Type "help" for help.

postgres=# 
</pre>

> Create one user to manager the database:

<pre>
CREATE USER devel SUPERUSER INHERIT CREATEDB CREATEROLE;
ALTER USER devel PASSWORD '${POSTGRES_PASSWORD}';
</pre>

> List all users

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

> Create a table sample:

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

> Connect to postgres database with DBeaver

<pre>
Host: ${DATABASE_SERVER_ADDRESS}
Port: 5432
Database: postgres
Authentication: Database Native
Username: postgres
Password: ${POSTGRES_PASSWORD}
</pre>

![img.png](./databases/postgres/midias/Postgres-Database-Connection-Sample.png)

<h3>Redis</h3>

<pre>
docker exec -it redis /bin/bash
</pre>

<pre>
root@3e760fd49412:/opt# redis-cli 
127.0.0.1:6379>
</pre>

<pre>
root@3e760fd49412:/opt# redis-cli -h 127.0.0.1 -p 6379 -a '123@Mudar!'
Warning: Using a password with '-a' or '-u' option on the command line interface may not be safe.
127.0.0.1:6379> SET redistestkey 123456
OK
127.0.0.1:6379> GET redistestkey
"123456"
127.0.0.1:6379> DEL redistestkey
(integer) 1
127.0.0.1:6379> GET redistestkey
(nil)
127.0.0.1:6379> 
</pre>

<h3>SQLite3</h3>

<pre>
user@ubuntu-desktop:~/Server/Devel/docker-series/self-containers/sqlite3$ docker exec -it sqlite3 /bin/bash
root@0fe895af4841:/opt/sqlite3# cd /root/db/
root@0fe895af4841:/opt/db# sqlite3 dbname1.db
SQLite version 3.34.1 2021-01-20 14:10:07
Enter ".help" for usage hints.
sqlite> CREATE TABLE users(
    id INT PRIMARY KEY NOT NULL UNIQUE,
    name TEXT NOT NULL
);
sqlite> INSERT INTO users(id, name) VALUES (1, 'John Smith Wiz');
sqlite> SELECT * FROM users;
1|John Smith Wiz
sqlite> .quit
</pre>

