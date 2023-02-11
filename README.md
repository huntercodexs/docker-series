# JAVA + ORACLELINUX
Simple Environment to simulate a workflow

# Requisites

- Java 8
- Oraclelinux 19c

# How to use

- Run Container

<pre>
git clone https://github.com/huntercodexs/docker-series.git .
git checkout java_oraclelinux
cd java_oraclelinux
</pre>

- Oraclelinux

> Set the ORACLE EDITION (see .env file):

<pre>
ee - Enterprise Edition
se2 - Standard Edition
xe - Express Edition
</pre>

> <p style="color: red">REQUIRED</p>

- Database file: LINUX.X64_193000_db_home.zip (in this case)
- This file can be downloaded in https://www.oracle.com/database/technologies/oracle-database-software-downloads.html

> <p style="color: orange">STEPS BEFORE BUILD</p>

- Put the LINUX.X64_193000_db_home.zip inside oracle/database before run the docker-compose
- Unzip the oraclelinux-database-scripts-19c.tar.bz2 file inside the oracle/database folder:
<pre>
tar -xvf oraclelinux-database-scripts-19c.tar.bz2
</pre>
- Create the oradata folder in oracle path
- Check if oracle/oradata is empty or just have the dbconfig/ and ORCLCDB/ folders

> <p style="color: red">IMPORTANT</p>

- The path oracle/oradata in current container instance "should be empty"
- Have sure that the oracle/oradata is empty or just have the dbconfig/ and ORCLCDB/ folders
- The builder of this container is very long and need a long time to finish correctly
- Use the command docker-compose up --build to run in first time
- After the first build use docker-compose up -d oraclelinux or docker-compose start oraclelinux

> <p style="color: greenyellow">STEPS AFTER BUILD</p>

- HOST(your machine):

Set Password Administration
<pre>
docker exec -it oraclelinux ./setPassword.sh ${YOUR_ORACLE_PASSWORD}
</pre>

- Access the database container
<pre>
docker exec -it oraclelinux /bin/bash
</pre>

- GUEST(inside oraclelinux):

Create User
<pre>
sqlplus sys/${YOUR_ORACLE_PASSWORD}@ORCLPDB1 as sysdba
CREATE USER DEVEL IDENTIFIED BY ${YOUR_ORACLE_PASSWORD};
GRANT CREATE SESSION, CREATE TABLE TO DEVEL;
ALTER USER DEVEL QUOTA 50m ON SYSTEM;
CREATE SMALLFILE TABLESPACE DEVEL DATAFILE '/opt/oracle/oradata/ORCLCDB/ORCLPDB1/devel.dbf' SIZE 1G;
ALTER DATABASE DEFAULT TABLESPACE DEVEL;
SELECT * FROM ALL_USERS au;
SELECT * FROM ALL_USERS au WHERE au.USERNAME = 'DEVEL';
EXIT;
</pre>

Connect on database using the new user
<pre>
sqlplus devel/${YOUR_ORACLE_PASSWORD}@ORCLPDB1
</pre>

- Access the Database Oracle Linux:

<pre>
Host: ${DATABASE_ORACLE_SERVER_IP}
Port: 1521
Database: ORCLPDB1 [Service Name]
Authentication: Oracle Database Native
Username: DEVEL
Role: Normal
Password: ${YOUR_ORACLE_PASSWORD}
</pre>

> Database Connection Sample

![img.png](./java_oraclelinux/oracle/midias/DBeaver-Oracle-Connection-Details.png)

> Enterprise Manager

![img.png](./java_oraclelinux/oracle/midias/Oracle-Database-EM.png)

- Access the Enterprise Manager:

<pre>
https://${WEBSERVER_ADDRESS}:5500/em
  > username: sys
  > password: ${YOUR_ORACLE_PASSWORD}
  > container name: ORCLPDB1
  ** to get this value exec in the current terminal:
  SQL> show pdbs;
  
  CON_ID CON_NAME			  OPEN MODE  RESTRICTED
  ---------- ------------------------------ ---------- ----------
   3 ORCLPDB1			  READ WRITE NO
  SQL> 
  
</pre>

* All rights reserved to ORACLE - https://www.oracle.com/

- Access JAVA OPENJDK container

<pre>
docker-compose start (in the next times)
docker exec -it java_oraclelinux /bin/bash
</pre>

# Run the sample projects

> Remember, the project is just to demonstration how work this project JAVA + ORACLE

To run the sample projects contained in this project get the project files into folder sample-project, and follow the bellow:

- open each project in your prefer IDE
- run the "mvn package"
- take the generated jar file
- edit the application.properties file with the correct settings
- finally use the result files in the folder app

> TIPS: Use the "JAVA + ORACLE.postman_collection.json" POSTMAN file to make tests

<pre>
./java_oraclelinux/sample-project/java-oraclelinux/JAVA + ORACLELINUX.postman_collection.json
</pre>