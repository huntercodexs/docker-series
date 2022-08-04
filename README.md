
# Docker Series

The Docker Series to most containers dockerized

-------------

# Information

Please use the branch selection to access others configurations to most need and purposes

-------------

# Dockers Configurations Contained

- HTTPD
- PHP8-FPM
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

# About PHP8

<pre>
  Ini files: 
    /usr/local/etc/php/php.ini
    /usr/local/etc/php/conf.d/
  Extensions: 
    /usr/local/lib/php/extensions/no-debug-non-zts-20210902/
  
  ** IMPORTANT **
  - Edit the /usr/local/etc/php/php.ini file and restart the service or container php8
</pre>

------------

# How to use Webserver HTTPD

<pre>
Server version: Apache/2.4.54 (Unix)
Server built:   Jul 12 2022 04:31:28

Execute the script "webserver.sh prepare" after docker-compose up -d
  - docker exec -it webserver /bin/bash
  - /home/apache2/webserver.sh prepare

Edit the files in /httpd_php8_separated/webserver/conf/ in this project path [conf|htdocs]
  - httpd.conf
  - sites-available.conf

Execute again the script "webserver.sh restart"
  - /home/webserver/webserver.sh restart
</pre>

-------------

# How to use Oracle

<pre>

  IMPORTANT:
  - The builder of this container is very long and need a long time to finish correctly
  - Use the command docker-compose up --build to run in first time
  - After the first build use docker-compose up -d oraclelinux or docker-compose start oraclelinux
  ** VERY IMPORTANT **
    > The path oracle/oradata in current container instance "should be empty"
    > Have sure that the oracle/oradata is empty or just have the dbconfig/ and ORCLCDB/ folders
  
  REQUIRED:
  Database file: LINUX.X64_193000_db_home.zip
  This file can be downloaded in https://www.oracle.com/database/technologies/oracle-database-software-downloads.html
  Important: Put the LINUX.X64_193000_db_home.zip inside oracle/database before run the docker-compose
  
  EDITION (see .env file):
  ee - Enterprise Edition
  se2 - Standard Edition
  xe - Express Edition

  STEPS BEFORE BUILD:
  - Unzip the oraclelinux-database-scripts-19c.tar.bz2 file inside the oracle/database folder
    tar -xvf oraclelinux-database-scripts-19c.tar.bz2
  - Check if oracle/oradata is empty or just have the dbconfig/ and ORCLCDB/ folders
  
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
    GRANT CREATE SESSION, CREATE TABLE TO DEVEL;
    ALTER USER DEVEL QUOTA 50m ON SYSTEM;
    CREATE SMALLFILE TABLESPACE DEVEL DATAFILE '/opt/oracle/oradata/ORCLCDB/ORCLPDB1/devel.dbf' SIZE 1G;
    ALTER DATABASE DEFAULT TABLESPACE DEVEL;
    SELECT * FROM ALL_USERS au;
    SELECT * FROM ALL_USERS au WHERE au.USERNAME = 'DEVEL';
    EXIT;
  - Connect on database using the new user
    GUEST(inside oraclelinux):
    sqlplus devel/_YOUR_ORACLE_PASSWORD_@ORCLPDB1;
    * Please see the details to connection from SGBD DBeaver in folder oracle/midias/DBeaver-Oracle-Connection-Details.png

  - Access the microservice Oracle Linux: 
    - http://192.168.0.174:38080/microservice-oraclelinux/

  - Access the Enterprise Manager: 
    - https://192.168.0.174:5500/em
    - username: sys
    - password: _YOUR_ORACLE_PASSWORD_
    - container name: ORCLPDB1
      to get this value exec in the current terminal:
        SQL> show pdbs;
        
            CON_ID CON_NAME			  OPEN MODE  RESTRICTED
        ---------- ------------------------------ ---------- ----------
             3 ORCLPDB1			  READ WRITE NO
        SQL> 

  ** All rights reserved to ORACLE - oracle.com
</pre>

> Database Connection Sample
![img.png](httpd_php8_databases_separated/oracle/midias/DBeaver-Oracle-Connection-Details.png)
![img.png](httpd_php8_databases_separated/oracle/midias/Oracle-Database-EM.png)

-------------

# How to use MongoDB

<pre> 
  IMPORTANT:
  - Check if mongo module is available in /usr/local/etc/php/php.ini and /usr/local/etc/php/conf.d/mongodb.ini
  - Restart the webserver using the command /home/webserver/webserver.sh restart

  AFTER BUILD:
  - Access the container php8 in application folder and run the command
    cd /var/www/webserver/microservice-mongodb
    composer require mongodb/mongodb
  or copy the file that are placed in /opt/mongodb to application root path
  or run the command inside container: /home/shared/setup.sh
  - Access the MongoDB Express: http://192.168.0.174:8090/
    username: devel
    password: _YOU_PASSWORD_MONGO_EXPRESS_
  - Create a database: dbname
  - Create a collection: users
  - Create a documents(index): id, name
  - Finally access the application local url: http://192.168.0.174:38080/microservice-mongodb/
</pre>

---------------