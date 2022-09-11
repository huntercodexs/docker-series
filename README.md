
# NGINX + PHP8 + MYSQL5 + MYSQL8
Docker Series - A project to work with many docker container

---

# About

This branch set up the complete environment to run PHP and NGINX as Webserver


---

# How to use

- Before build and start project set the following files configurations:

<pre>
- php.ini (nginx_php8_mysql/php/8.0/conf/php.ini)
- nginx.conf (nginx_php8_mysql/nginx/nginx.conf)
- php80.conf (nginx_php8_mysql/nginx/conf.d/php80.conf)
- php81.conf (nginx_php8_mysql/nginx/conf.d/php81.conf)
</pre>

- Access the folder path in this project to run php8 together nginx, as below:  

<pre>
$ git clone https://github.com/huntercodexs/docker-series.git .
$ git checkout nginx_php8_mysql
$ cd nginx_php8_mysql
$ docker-compose up --build (in first time)
$ docker-compose start (in others case)
</pre>

- Create a Database in mysql container 5.7 and 8.0

<pre>
CREATE DATABASE database CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
</pre>

- Use the script init.sql (nginx_php8_mysql/mysql/init.sql) to populate a database

- Access the application

<pre>
#PHP-8.0
http://192.168.0.174:38080/mysql/5-7/index.php
http://192.168.0.174:38080/mysql/8-0/index.php
#PHP-8.1
http://192.168.0.174:39000/mysql/5-7/index.php
http://192.168.0.174:39000/mysql/8-0/index.php
</pre>

---
# NGINX

- Content
<pre>
/var/www/html: The actual web content, which by default only consists of the default Nginx page you saw earlier, is served out of the /var/www/html directory. This can be changed by altering Nginx configuration files.
</pre>

- Server Configuration
<pre>
/etc/nginx: The Nginx configuration directory. All of the Nginx configuration files reside here.

/etc/nginx/nginx.conf: The main Nginx configuration file. This can be modified to make changes to the Nginx global configuration.

/etc/nginx/sites-available/: The directory where per-site server blocks can be stored. Nginx will not use the configuration files found in this directory unless they are linked to the sites-enabled directory. Typically, all server block configuration is done in this directory, and then enabled by linking to the other directory.

/etc/nginx/sites-enabled/: The directory where enabled per-site server blocks are stored. Typically, these are created by linking to configuration files found in the sites-available directory.

/etc/nginx/snippets: This directory contains configuration fragments that can be included elsewhere in the Nginx configuration. Potentially repeatable configuration segments are good candidates for refactoring into snippets.
</pre>

- Server Logs
<pre>
/var/log/nginx/access.log: Every request to your web server is recorded in this log file unless Nginx is configured to do otherwise.
/var/log/nginx/error.log: Any Nginx errors will be recorded in this log.
</pre>

---

# PHP-8.0

> FEATURES AVAILABLE

- XDEBUG
- OPCACHE
- MBSTRING
- BCMATH
- COMPOSER
- REDIS
- PDO
- MSSQL
- MYSQL
- MONGODB
- POSTGRES
- SQLITE3
- FIREBIRD
- INTERBASE

---

# PHP-8.1

> FEATURES AVAILABLE

- XDEBUG
- OPCACHE
- MBSTRING
- BCMATH
- COMPOSER
- REDIS
- PDO
- MSSQL
- MYSQL
- MONGODB
- POSTGRES
- SQLITE3
- FIREBIRD
- INTERBASE
- ORACLE

---

# MYSQL

> AVAILABLE VERSIONS

- 5.7
- 8.0
