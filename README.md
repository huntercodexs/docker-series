# NGINX + PHP8
Docker Series - A project to work with many docker container

---

# About

This branch set up the complete environment to run PHP and NGINX as Webserver


---

# How to use

- Access the folder path in this project to run php8 together nginx, as below:  

<pre>
$ git clone https://github.com/huntercodexs/docker-series.git .
$ git checkout nginx_php8
$ cd nginx_php8
$ docker-compose up --build (in first time)
$ docker-compose start (in others case)
</pre>

- Before build and start project set the following files configurations:

<pre>
- php.ini (nginx_php8/php/8.0/conf/php.ini)
- nginx.conf (nginx_php8/nginx/nginx.conf)
- php80.conf (nginx_php8/nginx/conf.d/php80.conf)
- php81.conf (nginx_php8/nginx/conf.d/php81.conf)
</pre>

- Access the application

<pre>
http://192.168.0.174:38080/php80/index.php
http://192.168.0.174:38080/php81/index.php
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


