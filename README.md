
# Docker Series

The Docker Series to most containers dockerized

-------------

# Information

Please use the branch selection to access others configurations to most need and purposes, this branch offers a complete
environment to development using HTTP(Apache2) + PHP + Databases(see bellow).

-------------

# Dockers Containers Databases

- HTTPD
- PHP8-FPM
- DATABASES
  - MYSQL
  - MSSQL
  - PGSQL
  - MONGO
  - FIREBIRD
  - ORACLE (All right reserved to oracle.com - &copy; 2022 Oracle) (oraclelinux)
  - SQLITE
  - REDIS

> <p style="color: orange">IMPORTANT</p>

See the file .env in the root path of this project

-------------

# About PHP8

> PHP INI FILES

Configuration file to PHP server shared between HOST and Container

<pre>
/usr/local/etc/php/php.ini
/usr/local/etc/php/conf.d/
</pre>

> EXTENSIONS

Extension directory shared between HOST and Container

<pre>
/usr/local/lib/php/extensions/no-debug-non-zts-20210902/
</pre>

> <p style="color: orange">IMPORTANT</p>

Edit the /usr/local/etc/php/php.ini file and restart the service or container php8, by example

from 
<pre>
;extension=pdo_oci
</pre>

to
<pre>
extension=pdo_oci
</pre>

------------

# How to use Webserver HTTPD

The version of HTTP used in this project is:

<pre>
Server version: Apache/2.4.54 (Unix)
Server built:   Jul 12 2022 04:31:28
</pre>

> <p style="color: orange">IMPORTANT</p>

In the first time to run this container, execute the script "webserver.sh prepare" after docker-compose up -d

<pre>
docker exec -it webserver /bin/bash
/home/apache2/webserver.sh prepare
</pre>

Before run the previous step, please edit the files in /httpd_php8_separated/webserver/conf/ in this project 
path [conf|htdocs], these files are responsible to configure the webserver HTTP.

<pre>
httpd.conf
sites-available.conf
</pre>

After the first step (see above) execute again the script "webserver.sh" but pass the "restart" as parameter

<pre>
/home/webserver/webserver.sh restart
</pre>

-------------

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

- Database file: LINUX.X64_193000_db_home.zip
- This file can be downloaded in https://www.oracle.com/database/technologies/oracle-database-software-downloads.html
- Put the LINUX.X64_193000_db_home.zip inside oracle/database before run the docker-compose

> STEPS BEFORE BUILD

- Unzip the oraclelinux-database-scripts-19c.tar.bz2 file inside the oracle/database folder:
<pre>
tar -xvf oraclelinux-database-scripts-19c.tar.bz2
</pre>
- Check if oracle/oradata is empty or just have the dbconfig/ and ORCLCDB/ folders

> STEPS AFTER BUILD

- HOST(your machine):

Set Password Administration
<pre>
docker exec -it oraclelinux ./setPassword.sh _YOUR_ORACLE_PASSWORD_
</pre>

- Access the database container
<pre>
docker exec -it oraclelinux /bin/bash
</pre>

- GUEST(inside oraclelinux):

Create User
<pre>
sqlplus sys/_YOUR_ORACLE_PASSWORD_@ORCLPDB1 as sysdba
CREATE USER DEVEL IDENTIFIED BY _YOUR_ORACLE_PASSWORD_;
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
sqlplus devel/_YOUR_ORACLE_PASSWORD_@ORCLPDB1;
</pre>

- Access the microservice Oracle Linux: 

<pre>
http://192.168.0.174:38080/microservice-oraclelinux/
</pre>

> Database Connection Sample

![img.png](httpd_php8_databases_separated/oracle/midias/DBeaver-Oracle-Connection-Details.png)

> Enterprise Manager

![img.png](httpd_php8_databases_separated/oracle/midias/Oracle-Database-EM.png)

- Access the Enterprise Manager:
 
<pre>
https://192.168.0.174:5500/em
  > username: sys
  > password: _YOUR_ORACLE_PASSWORD_
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

# How to use MongoDB

> <p style="color: orange">IMPORTANT</p>

- Check if mongo module is available in /usr/local/etc/php/php.ini and /usr/local/etc/php/conf.d/mongodb.ini
- Restart the webserver using the command /home/webserver/webserver.sh restart

> AFTER BUILD

- Access the container php8 in application folder and run the command

<pre>
cd /var/www/webserver/microservice-mongodb composer require mongodb/mongodb or copy the file that are placed in 
/opt/mongodb to application root path or run the command inside container: /home/shared/setup.sh
</pre>

- Access the MongoDB Express

<pre>
http://192.168.0.174:8090/
  username: devel
  password: _YOU_PASSWORD_MONGO_EXPRESS_
</pre>

- Create a database: dbname
- Create a collection: users
- Create a documents(index): id, name
- Finally, access the application local url:

<pre>
http://192.168.0.174:38080/microservice-mongodb/
</pre>

---------------