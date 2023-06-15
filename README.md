# JAVA + ORACLELINUX
Simple Environment to simulate a workflow

# Requisites

- Java 8
- Oraclelinux 19c

# How to use

> NOTE: As a main tip always start the oraclelinux before that anyone other container

- Run Container

<pre>
git clone https://github.com/huntercodexs/docker-series.git .
git checkout java_oraclelinux
cd java_oraclelinux
</pre>

# ORACLE-LINUX 19c

# How to use Oracle

- Definitions and Variables

ORACLE-DATABASE-USER: DEVEL (in many cases should be SYS or SYSTEM)
ORACLE-DATABASE-USER-LOWERCASE: devel
ORACLE-DATABASE-PDB: ORCLPDB1
ORACLE-PASSWORD: oracle1Ipw
ORACLE-DATABASE-ROLE: Normal (in many cases can be SYSDBA)
ORACLE-DATABASE-AUTH-MODE: Oracle Database Native
ORACLE-DATABASE-PORT: 1521
ORACLE-DATABASE-TABLESPACE: /opt/oracle/oradata/ORCLCDB/{{ORACLE-DATABASE-PDB}}/{{ORACLE-DATABASE-USER-LOWERCASE}}.dbf

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

![img.png](./h2_mysql_oracle_sftp_mailhog/oracle/midias/DBeaver-Oracle-Connection-Details.png)

> Enterprise Manager

![img.png](./h2_mysql_oracle_sftp_mailhog/oracle/midias/Oracle-Database-EM.png)

- Access the Enterprise Manager:

<pre>
https://{{WEBSERVER_ADDRESS}}:5500/em
  > username: sys
  > password: {{YOUR_ORACLE_PASSWORD}}
  > container name: {{ORACLE-DATABASE-PDB}}
</pre>

* All rights reserved to ORACLE - https://www.oracle.com/

-------------

# JAVA OPENJDK

<pre>
docker exec -it openjdk-8u212 /bin/bash
</pre>

- Final Result

<pre>
user@host$ docker-compose ps
    Name                   Command                  State                                             Ports                                       
--------------------------------------------------------------------------------------------------------------------------------------------------
openjdk-8u212   java -jar /home/openjdk8u2 ...   Up             0.0.0.0:38001->38001/tcp,:::38001->38001/tcp                                      
oraclelinux     /bin/sh -c exec $ORACLE_BA ...   Up (healthy)   0.0.0.0:1521->1521/tcp,:::1521->1521/tcp, 0.0.0.0:5500->5500/tcp,:::5500->5500/tcp
</pre>

# About the sample project

> Remember, the sample project is just to demonstration how work this project JAVA + ORACLE

To run the sample projects contained in this project get the project files into folder sample-project, and follow the bellow:

- open the project in your prefer IDE
- run the "mvn package"
- take the generated jar file
- edit the application.properties file with the correct settings
- finally put the resulted jar file and application.properties in the folder app/

> TIPS: Use the "JAVA + ORACLE.postman_collection.json" POSTMAN file to make tests

<pre>
./java_oraclelinux/sample-project/java-oraclelinux/JAVA + ORACLELINUX.postman_collection.json
</pre>