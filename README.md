# JAVA + ORACLELINUX
Simple environment to simulate a workflow integrating Java + Oracle

# Requisites

- Java 8
- Oraclelinux 19c (19.3.0.0.0)

# Usage

> NOTE: As a main tip always start the oraclelinux before that anyone other container

- Run Container

<pre>
user@host:/home/user$ git clone https://github.com/huntercodexs/docker-series.git .
user@host:/home/user$ cd docker-series.git
user@host:/home/user/docker-series git checkout java_oraclelinux
user@host:/home/user/docker-series$ cd java_oraclelinux
user@host:/home/user/docker-series/java_oraclelinux$ docker-compose up --build (in first time)
user@host:/home/user/docker-series/java_oraclelinux$ docker-compose start (in the next times)
</pre>

# About Oraclelinux 19c instance

<h3>Oracle</h3>

- Definitions and Variables

<pre>
ORACLELINUX_USERNAME: DEVEL (if error, try SYS or SYSTEM)
ORACLELINUX_USERNAME_LOWERCASE: devel
ORACLELINUX_PDB: ORCLPDB1
ORACLELINUX_PASSWORD: oracle1Ipw
ORACLELINUX_DATABASE_ROLE: Normal (in many cases can be SYSDBA)
ORACLELINUX_DATABASE_AUTH_MODE: Oracle Database Native
ORACLELINUX_DATABASE_PORT: 1521
ORACLELINUX_TABLESPACE_NAME: DEVEL
ORACLELINUX_DATABASE_TABLESPACE: /opt/oracle/oradata/ORCLCDB/{{ORACLELINUX_PDB}}/{{ORACLELINUX_USERNAME_LOWERCASE}}.dbf
</pre>

> IMPORTANT

- The builder of this container is too long and toke a long time to finish all
- Use the command docker-compose up --build to run on first time
- After the first build use docker-compose up -d oraclelinux or docker-compose start oraclelinux

> ** VERY IMPORTANT **
- The path oracle/oradata in current container instance "should be empty"
- Ensure that the oracle/oradata is empty or just have the dbconfig/ and ORCLCDB/ folders

- ORACLE EDITION (see the .env file):

<pre>
ee - Enterprise Edition
se2 - Standard Edition
xe - Express Edition
</pre>

> REQUIRED

<pre>
Database file: LINUX.X64_193000_db_home.zip (in this case)
This file can be downloaded in https://www.oracle.com/database/technologies/oracle-database-software-downloads.html
</pre>

- BEFORE BUILD

Put the LINUX.X64_193000_db_home.zip inside oracle/database before run the docker-compose

Set up the .env file on section ORACLELINUX SETTINGS

Unzip the oraclelinux-database-scripts-19c.tar.bz2 file inside the oracle/database folder:
<pre>
user@host:/home/user/docker-series/java_oraclelinux/oracle/database$ tar -xvf oraclelinux-database-scripts-19c.tar.bz2
</pre>

Create the oradata folder in oracle path
Check if oracle/oradata is empty or just have the dbconfig/ and ORCLCDB/ folders

Final results from build
<pre>
oraclelinux    | Version 19.3.0.0.0
oraclelinux    | The Oracle base remains unchanged with value /opt/oracle
oraclelinux    | The Oracle base remains unchanged with value /opt/oracle
oraclelinux    | #########################
oraclelinux    | DATABASE IS READY TO USE!
oraclelinux    | #########################
oraclelinux    | The following output is now a tail of the alert.log:
oraclelinux    | ORCLPDB1(3):Completed: ALTER DATABASE DEFAULT TABLESPACE "USERS"
oraclelinux    | 2023-10-12T14:59:47.143786+00:00
oraclelinux    | ALTER SYSTEM SET control_files='/opt/oracle/oradata/ORCLCDB/control01.ctl' SCOPE=SPFILE;
oraclelinux    | 2023-10-12T14:59:47.148098+00:00
oraclelinux    | ALTER SYSTEM SET local_listener='' SCOPE=BOTH;
oraclelinux    |    ALTER PLUGGABLE DATABASE ORCLPDB1 SAVE STATE
oraclelinux    | Completed:    ALTER PLUGGABLE DATABASE ORCLPDB1 SAVE STATE
oraclelinux    | 2023-10-12T14:59:47.721280+00:00
oraclelinux    | 
oraclelinux    | XDB initialized.
</pre>

- AFTER BUILD

Make the follow commands in the HOST(the machine where is installed the instance oraclelinux via docker):

Set Password Administration
<pre>
user@host:/home/user/docker-series/java_oraclelinux docker-compose start oraclelinux
user@host:/home/user/docker-series/java_oraclelinux$ docker exec -it oraclelinux ./setPassword.sh {{YOUR_ORACLE_PASSWORD}}
</pre>

Result
<pre>
user@host:/home/user/docker-series/java_oraclelinux$ docker exec -it oraclelinux ./setPassword.sh oracle1Ipw
The Oracle base remains unchanged with value /opt/oracle

SQL*Plus: Release 19.0.0.0.0 - Production on Thu Oct 12 15:09:12 2023
Version 19.3.0.0.0

Copyright (c) 1982, 2019, Oracle.  All rights reserved.


Connected to:
Oracle Database 19c Enterprise Edition Release 19.0.0.0.0 - Production
Version 19.3.0.0.0

SQL> 
User altered.

SQL> 
User altered.

SQL> 
Session altered.

SQL> 
User altered.

SQL> Disconnected from Oracle Database 19c Enterprise Edition Release 19.0.0.0.0 - Production
Version 19.3.0.0.0
</pre>

Access the database container
<pre>
user@host:/home/user/docker-series/java_oraclelinux$ docker exec -it oraclelinux /bin/bash
</pre>

- Make the follow commands inside oraclelinux instance via docker (GUEST):

Create User
<pre>
sqlplus sys/{{ORACLELINUX_PASSWORD}}@{{ORACLELINUX_PDB}} as sysdba
CREATE USER {{ORACLELINUX_USERNAME}} IDENTIFIED BY {{ORACLELINUX_PASSWORD}};
GRANT CREATE SESSION, CREATE TABLE TO {{ORACLELINUX_USERNAME}};
ALTER USER {{ORACLELINUX_USERNAME}} QUOTA 50m ON SYSTEM;
CREATE SMALLFILE TABLESPACE {{ORACLELINUX_USERNAME}} DATAFILE '{{ORACLELINUX_DATABASE_TABLESPACE}}' SIZE 1G;
ALTER DATABASE DEFAULT TABLESPACE {{ORACLELINUX_USERNAME}};
ALTER USER {{ORACLELINUX_USERNAME}} QUOTA UNLIMITED ON SYSTEM;
ALTER USER {{ORACLELINUX_USERNAME}} QUOTA UNLIMITED ON {{ORACLELINUX_TABLESPACE_NAME}};
SELECT * FROM ALL_USERS au;
SELECT * FROM ALL_USERS au WHERE au.USERNAME = '{{ORACLELINUX_USERNAME}}';
EXIT;
</pre>

> TIP: User the script init.sql to make a test in the current oraclelinux instance via docker

[init.sql](./java_oraclelinux/oracle/scripts/init.sql)

Get ORACLELINUX_PDB available from oracle
<pre>
** to get this value exec in the current terminal:
SQL> show pdbs;

    CON_ID CON_NAME			  OPEN MODE  RESTRICTED
---------- ------------------------------ ---------- ----------
	 3 ORCLPDB1			  READ WRITE NO

SQL>EXIT;
</pre>

Connect on database using the new user
<pre>
sqlplus {{ORACLELINUX_USERNAME}}/{{ORACLELINUX_PASSWORD}}@{{ORACLELINUX_PDB}}
</pre>

- Configuration to access the Database Oracle Linux:

<pre>
Host: {{DATABASE_ORACLE_SERVER_IP}}
Port: {{ORACLELINUX_DATABASE_PORT}}
Database: {{ORACLELINUX_PDB}} [Service Name]
Authentication:{{ORACLELINUX_DATABASE_AUTH_MODE}}
Username: {{ORACLELINUX_USERNAME}}
Role: {{ORACLELINUX_DATABASE_ROLE}}
Password: {{ORACLELINUX_PASSWORD}}
</pre>

- Database Connection Sample (User: SYS, SYSDBA)

![oracle-connection-sys-sample.png](./java_oraclelinux/oracle/midias/oracle-connection-sys-sample.png)

- Database Connection Sample (User: DEVEL)

![oracle-connection-sys-sample.png](./java_oraclelinux/oracle/midias/oracle-connection-devel-sample.png)

![oracle-connection-devel-query-sample.png](./java_oraclelinux/oracle/midias/oracle-connection-devel-query-sample.png)

- Enterprise Manager

![img.png](./java_oraclelinux/oracle/midias/Oracle-Database-EM.png)

- Access the Enterprise Manager:

<pre>
https://{{WEBSERVER_ADDRESS}}:5500/em
  > username: sys
  > password: {{ORACLELINUX_PASSWORD}}
  > container name: {{ORACLELINUX_PDB}}
</pre>

![oracle-enterprise-manager.png](./java_oraclelinux/oracle/midias/oracle-enterprise-manager.png)

* All rights reserved to ORACLE - https://www.oracle.com/

# Java Openjdk

<pre>
user@host:/home/user/docker-series/java_oraclelinux$ docker exec -it openjdk-8u212 /bin/bash
</pre>

# Result

<pre>
user@host:/home/user/docker-series/java_oraclelinux$ docker-compose ps
    Name                   Command                  State                                             Ports                                       
--------------------------------------------------------------------------------------------------------------------------------------------------
openjdk-8u212   java -jar /home/openjdk8u2 ...   Up             0.0.0.0:38001->38001/tcp,:::38001->38001/tcp                                      
oraclelinux     /bin/sh -c exec $ORACLE_BA ...   Up (healthy)   0.0.0.0:1521->1521/tcp,:::1521->1521/tcp, 0.0.0.0:5500->5500/tcp,:::5500->5500/tcp
</pre>

# About the sample project

> Remember, the sample project is just a demonstration how to work the project JAVA + ORACLE

To run the sample projects contained in this project get the project files into folder sample-project, and follow the bellow:

- open the project in your prefer IDE (by example IntelliJ - JetBrains)
- run the "mvn package"
- take the generated jar file
- edit the application.properties file with the correct settings
- finally put the resulted jar file and application.properties in the folder app/

> TIPS: Use the "JAVA_ORACLELINUX.postman_collection.json" POSTMAN file to make tests

<pre>
./java_oraclelinux/sample-project/java-oraclelinux/src/main/resources/JAVA_ORACLELINUX.postman_collection.json
</pre>