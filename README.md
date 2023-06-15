# H2 + MYSQL + ORACLE LINUX + SFTP + MAIL HOG
Base project to homologation and tests environment

# REQUISITES

- H2 DATABASE
- Mysql 8
- ORACLELINUX
- SFTP
- MAILHOG

# USAGE

<pre>
git clone https://github.com/huntercodexs/docker-series.git .
git checkout h2_mysql_oracle_sftp_mailhog
cd h2_mysql_oracle_sftp_mailhog
docker-compose up --build (in first time)
docker-compose start (in the next times)
docker-compose ps (check the containers status)
</pre>

Result should be
![docker-compose-ps.png](./h2_mysql_oracle_sftp_mailhog/files/docker-compose-ps.png)

# H2 DATABASE (JAVA)

- Tip

> To use more easily this project you can use together the Spring H2 Database Demo from
> https://github.com/huntercodexs/spring-h2-database-demo

- Settings to do before run this project

Configure the file .env as bellow

> NOTE: Get the version and zip filename in the https://www.h2database.com/html/download.html

![h2-database-download.png](./h2_mysql_oracle_sftp_mailhog/h2-database/midias/h2-database-download.png)

<pre>
H2DATABASE_VERSION=version-2.1.214
H2DATABASE_ZIPFILE=h2-2022-06-13.zip
</pre>

Set up the ports

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

![h2-database-access.png](./h2_mysql_oracle_sftp_mailhog/h2-database/midias/h2-database-access.png)

- Access the H2 Database via TCP/IP

<pre>
tcp://localhost:39095/~/db-h2-test
</pre>

- Access the H2 Database via Java Application

<pre>
spring.datasource.url=jdbc:h2:tcp://localhost:39095/~/db-h2-test
spring.datasource.jdbcUrl=jdbc:h2:tcp://localhost:39095/~/db-h2-test
</pre>

> You can customize the script bin/start-h2-database-server to gain more effects in your environment

> You can also create an initializer sql commands into bin/db-init.sql to charge database from tests in your
> application as showed bellow

<pre>
spring.datasource.url=jdbc:h2:tcp://localhost:39095/~/db-h2-test;INIT=RUNSCRIPT FROM '~/db-init.sql'
spring.datasource.jdbcUrl=jdbc:h2:tcp://localhost:39095/~/db-h2-test;INIT=RUNSCRIPT FROM '~/db-init.sql'
</pre>

# MYSQL-80

- Access the database

<pre>
server: 192.168.0.174 (Use the current IP from your machine)
port: 3708
user: root
pass: root123
</pre>

# ORACLE-LINUX 19c

# How to use Oracle

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
docker exec -it oraclelinux ./setPassword.sh ${YOUR_ORACLE_PASSWORD}
</pre>

- Access the database container
<pre>
docker exec -it oraclelinux /bin/bash
</pre>

- GUEST(inside oraclelinux):

Create User
<pre>
sqlplus sys/${YOUR_ORACLE_PASSWORD_}@ORCLPDB1 as sysdba
CREATE USER DEVEL IDENTIFIED BY ${YOUR_ORACLE_PASSWORD_};
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
sqlplus devel/${YOUR_ORACLE_PASSWORD_}@ORCLPDB1
</pre>

- Access the Database Oracle Linux:

<pre>
Host: ${DATABASE_ORACLE_SERVER_IP}
Port: 1521
Database: ORCLPDB1 [Service Name]
Authentication: Oracle Database Native
Username: DEVEL
Role: Normal
Password: ${YOUR_ORACLE_PASSWORD_}
</pre>

> Database Connection Sample

![img.png](./h2_mysql_oracle_sftp_mailhog/oracle/midias/DBeaver-Oracle-Connection-Details.png)

> Enterprise Manager

![img.png](./h2_mysql_oracle_sftp_mailhog/oracle/midias/Oracle-Database-EM.png)

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

-------------

# SFTP SERVER

- Filezilla Connection Example

![sftp-filezilla-setup-1.png](./h2_mysql_oracle_sftp_mailhog/sftp/midias/sftp-filezilla-setup-1.png)

![sftp-filezilla-setup-1.png](./h2_mysql_oracle_sftp_mailhog/sftp/midias/sftp-filezilla-setup-2.png)


# MAILHOG

- How to make access in the MailHog Http Webserver

<pre>
http://${MAIL_SERVER_IP}:${MAILHOG_PORT}

[Example]
http://${WEBSERVER-ADDRESS-IP}:38025 (mailhog)
http://${WEBSERVER-ADDRESS-IP}:48025 (mailhog-ubuntu2004)
</pre>

- How to use MailHog as Mail Server Tests

<pre>
[SMTP HOST]
${MAIL_SERVER_IP}

[SMTP PORT]
${MAILHOG_SMTP_PORT}

[Example (Java Mail Sender)]
spring.mail.host=localhost
spring.mail.port=31025
spring.mail.username=huntercodexs@mail.com
spring.mail.password=
spring.mail.properties.mail.smtp.auth=false
spring.mail.properties.mail.smtp.starttls.enable=true
spring.mail.properties.mail.smtp.connectiontimeout=5000
spring.mail.properties.mail.smtp.timeout=5000
spring.mail.properties.mail.smtp.writetimeout=5000
spring.mail.properties.mail.smtp.socketFactory.port=31025
spring.mail.properties.mail.smtp.socketFactory.class=javax.net.ssl.SSLSocketFactory
</pre>
