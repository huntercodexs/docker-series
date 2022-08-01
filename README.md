
# Docker Series

The Docker Series to most containers dockerized

-------------

# Information

Please use the branch selection to access others configurations to most need and purposes

-------------

# Dockers Configurations Contained

- HTTPD
- PHP-FPM
- DATABASES
  - MYSQL
  - MSSQL
  - PGSQL
  - MONGO
  - FIREBIRD
  - ORACLE (All right reserved to oracle.com - &copy; 2022 Oracle)
  - SQLITE
  - REDIS

-------------

# How to use

<pre>
# Server version: Apache/2.4.54 (Unix)
# Server built:   Jul 12 2022 04:31:28
#
# Execute the script "webserver.sh prepare" after docker-compose up -d
#   > docker exec -it webserver /bin/bash
#   > /home/apache2/webserver.sh prepare
# Edit the files in /httpd_php8_separated/webserver/conf/ in this project path [conf|htdocs]
#   > httpd.conf
#   > sites-available.conf
# Execute again the script "webserver.sh restart"
#   > /home/webserver/webserver.sh restart
# Restart apache service: "service webserver restart"
# Check if a2enmod is ok: "a2enmod rewrite"
# If needed check virtualhost name is ok: "a2ensite app.local.conf"
</pre>

-------------

# Oracle

<pre>

   IMPORTANT:
     The builder of this container is very long and need a long time to finish correctly
     Use the command docker-compose up --build to run in first time
     After the first build use docker-compose up -d oraclelinux

   REQUIRED:
     Database file: LINUX.X64_193000_db_home.zip
     This file can be downloaded in https://www.oracle.com/database/technologies/oracle-database-software-downloads.html

   EDITION:
     ee - Enterprise Edition
     se2 - Standard Edition
     xe - Express Edition

   STEPS AFTER BUILD:
     - Set Password Administration
         HOST(your machine):
             docker exec -it oraclelinux ./setPassword.sh _YOUR_ORACLE_PASSWORD_
     - Access the database CLI
         HOST(your machine):
             docker exec -it oraclelinux /bin/bash
         GUEST(inside oraclelinux):
             sqlplus sys/_YOUR_ORACLE_PASSWORD_@ORCLPDB1 as sysdba
     - Create User
         GUEST(inside oraclelinux):
             CREATE USER DEVEL IDENTIFIED BY _YOUR_ORACLE_PASSWORD_;
             GRANT CREATE SESSION, CREATE TABLE TO devel;
             ALTER USER devel QUOTA 50m ON SYSTEM;
             CREATE SMALLFILE TABLESPACE DEVEL DATAFILE '/opt/oracle/oradata/ORCLCDB/ORCLPDB1/devel.dbf' SIZE 1G;
             ALTER DATABASE DEFAULT TABLESPACE DEVEL;
             SELECT * FROM ALL_USERS au;
             SELECT * FROM ALL_USERS au WHERE au.USERNAME = 'DEVEL';
             EXIT;
     - Connect on database using the new user
         GUEST(inside oraclelinux):
             sqlplus devel/_YOUR_ORACLE_PASSWORD_@ORCLPDB1;
             * Please see the details to connection from SGBD DBeaver in folder oracle/midias/DBeaver-Oracle-Connection-Details.png

   ** All rights reserved to ORACLE - oracle.com

</pre>

> Database Connection Sample
![img.png](httpd_php8_databases_separated/oracle/midias/DBeaver-Oracle-Connection-Details.png)

---------------