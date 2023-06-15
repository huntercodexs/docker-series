# ORACLE-LINUX 19c

# How to use Oracle

- Definitions and Variables

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

![img.png](./midias/DBeaver-Oracle-Connection-Details.png)

> Enterprise Manager

![img.png](./midias/Oracle-Database-EM.png)

- Access the Enterprise Manager:

<pre>
https://{{WEBSERVER_ADDRESS}}:5500/em
  > username: sys
  > password: {{YOUR_ORACLE_PASSWORD}}
  > container name: {{ORACLE-DATABASE-PDB}}
</pre>

* All rights reserved to ORACLE - https://www.oracle.com/

-------------