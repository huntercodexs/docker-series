# NGINX + PHP8 + MYSQL5 + MYSQL8
A quick and single repository to build an environment for PHP with NGINX - OFFLINE DRIVERS

![banner.png](nginx_php8_mysql-offline-drivers/files/medias/banner.png)


# Information

> IMPORTANT NOTE: This project branch is an improving of the branch nginx_php8_mysql-offline-drivers-offline-drivers, but in this case
> all drivers installed in the PHP containers are made directly from the own container (folder) configuration, that
> those are placed in the path php/{PHP-VERSION}/conf/extensions/php-{PHP-VERSION}-compiled-extensions.zip, where all
> of these drivers was compiled and tested in the specific PHP-VERSION in the another time. If you need to check these
> drivers files just do the command tar -xfv {file} and you will see all the files compiled .so type. For more details
> you may give a look in the files php/{PHP-VERSION}/php-{PHP-VERSION}.dockerfile specifically in the section like
> showed below
> showed below

Example

<pre>
COPY ./conf/extensions/php-7.4.0-compiled-extensions.zip $DIR_PHP_EXTENSIONS/
RUN unzip -o $DIR_PHP_EXTENSIONS/php-7.4.0-compiled-extensions.zip -d $DIR_PHP_EXTENSIONS
</pre>

> Please use the branch selector to access others environment configurations


# PHP Version Available

- PHP-7.4.0
- PHP-8.0.0
- PHP-8.1.0
- PHP-8.2.2
- PHP-8.2.13


# Usage

- Access the folder path in this project to run php8 together nginx, as below:

<pre>
user@host:/home/user$ git clone https://github.com/huntercodexs/docker-series.git .
user@host:/home/user$ cd docker-series
user@host:/home/user/docker-series$ git checkout nginx_php8_mysql-offline-drivers
user@host:/home/user/docker-series$ cd nginx_php8_mysql-offline-drivers
user@host:/home/user/docker-series/nginx_php8_mysql-offline-drivers$ docker network create nginx_php8_mysql-offline-drivers_mysql_network
user@host:/home/user/docker-series/nginx_php8_mysql-offline-drivers$ docker-compose up --build (in first time)
user@host:/home/user/docker-series/nginx_php8_mysql-offline-drivers$ [Ctrl+C]
user@host:/home/user/docker-series/nginx_php8_mysql-offline-drivers$ docker-compose start (in the next times)
user@host:/home/user/docker-series/nginx_php8_mysql-offline-drivers$ docker-compose ps (check the containers status)
</pre>

- Before build and start project set the following configurations files:

<pre>
- php.ini (nginx_php8/php/{PHP-VERSION}/conf/)
- nginx.conf (nginx_php8/nginx/)
- php-{PHP-VERSION}.conf (nginx_php8/nginx/conf.d/)
</pre>


# Step by Step

Follow the steps below to quick and easy environment creation

1- Clone the repository
<pre>
user@host:/home/user$ git clone https://github.com/huntercodexs/docker-series.git .
</pre>

2- Access the repository folder
<pre>
user@host:/home/user$ cd docker-series
</pre>

3- Change the current branch
<pre>
user@host:/home/user/docker-series$ git checkout nginx_php8_mysql-offline-drivers
</pre>

4- Access the nginx_php8_mysql-offline-drivers folder
<pre>
user@host:/home/user/docker-series$ cd nginx_php8_mysql-offline-drivers
</pre>

5- Check and set up the .env file, .ini PHP files and all files contained in the path php/{PHP-VERSION}/conf

6- Build the containers

<pre>    
user@host:/home/user/docker-series/nginx_php8_mysql-offline-drivers$ docker network create nginx_php8_mysql-offline-drivers_network
user@host:/home/user/docker-series/nginx_php8_mysql-offline-drivers$ docker-compose up --build
</pre>

Make sure that the result look like this
<pre>
user@host:/home/user/docker-series/nginx_php8_mysql-offline-drivers$ docker-compose ps
   Name                 Command               State                          Ports                       
---------------------------------------------------------------------------------------------------------
mysql57      docker-entrypoint.sh mysqld      Up      0.0.0.0:3705->3306/tcp,:::3705->3306/tcp, 33060/tcp
mysql80      docker-entrypoint.sh mysqld      Up      0.0.0.0:3708->3306/tcp,:::3708->3306/tcp, 33060/tcp
nginx        /docker-entrypoint.sh ngin ...   Up      0.0.0.0:38080->80/tcp,:::38080->80/tcp             
php-7.4.0    docker-php-entrypoint php-fpm    Up      0.0.0.0:9000->9000/tcp,:::9000->9000/tcp           
php-8.0.0    docker-php-entrypoint php-fpm    Up      0.0.0.0:9001->9000/tcp,:::9001->9000/tcp           
php-8.1.0    docker-php-entrypoint php-fpm    Up      0.0.0.0:9002->9000/tcp,:::9002->9000/tcp           
php-8.2.13   docker-php-entrypoint php-fpm    Up      0.0.0.0:9004->9000/tcp,:::9004->9000/tcp           
php-8.2.2    docker-php-entrypoint php-fpm    Up      0.0.0.0:9003->9000/tcp,:::9003->9000/tcp 
</pre>

7- Create database tables

> TIP: Use the script init.sql placed in the mysql folder

<pre>
#MYSQL 5.7
CREATE TABLE `customers` (
    `id` bigint NOT NULL AUTO_INCREMENT,
        `age` int DEFAULT NULL,
        `email` varchar(255) DEFAULT NULL,
        `name` varchar(255) DEFAULT NULL,
        PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

INSERT INTO customers (name, email, age) VALUES ('Amanda Barros', 'amanda@email.com', 33);
INSERT INTO customers (name, email, age) VALUES ('Marcos Silva', 'marcos@email.com', 34);
</pre>

<pre>
#MYSQL 8.0
CREATE TABLE `customers` (
    `id` bigint NOT NULL AUTO_INCREMENT,
        `age` int DEFAULT NULL,
        `email` varchar(255) DEFAULT NULL,
        `name` varchar(255) DEFAULT NULL,
        PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

INSERT INTO customers (name, email, age) VALUES ('Amanda Barros', 'amanda@email.com', 33);
INSERT INTO customers (name, email, age) VALUES ('Marcos Silva', 'marcos@email.com', 34);
</pre>

8- Test the applications to get info from each PHP version
<pre>
http://localhost:{WEBSERVER-PORT}/info/
</pre>

9- Test each sample application that are placed in the folder ./applications
<pre>
http://{WEBSERVER-ADDRESS}:38080/php-7.4.0/index.php
http://{WEBSERVER-ADDRESS}:38080/php-7.4.0/mysql/mysql.php
http://{WEBSERVER-ADDRESS}:38080/php-7.4.0/mysql/5.7/index.php
http://{WEBSERVER-ADDRESS}:38080/php-7.4.0/mysql/8.0/index.php

http://{WEBSERVER-ADDRESS}:38081/php-8.0.0/index.php
http://{WEBSERVER-ADDRESS}:38081/php-8.0.0/mysql/mysql.php
http://{WEBSERVER-ADDRESS}:38081/php-8.0.0/mysql/5.7/index.php
http://{WEBSERVER-ADDRESS}:38081/php-8.0.0/mysql/8.0/index.php

http://{WEBSERVER-ADDRESS}:38082/php-8.1.0/index.php
http://{WEBSERVER-ADDRESS}:38082/php-8.1.0/mysql/mysql.php
http://{WEBSERVER-ADDRESS}:38082/php-8.1.0/mysql/5.7/index.php
http://{WEBSERVER-ADDRESS}:38082/php-8.1.0/mysql/8.0/index.php

http://{WEBSERVER-ADDRESS}:38083/php-8.2.2/index.php
http://{WEBSERVER-ADDRESS}:38083/php-8.2.2/mysql/mysql.php
http://{WEBSERVER-ADDRESS}:38083/php-8.2.2/mysql/5.7/index.php
http://{WEBSERVER-ADDRESS}:38083/php-8.2.2/mysql/8.0/index.php

http://{WEBSERVER-ADDRESS}:38084/php-8.2.13/index.php
http://{WEBSERVER-ADDRESS}:38084/php-8.2.13/mysql/mysql.php
http://{WEBSERVER-ADDRESS}:38084/php-8.2.13/mysql/5.7/index.php
http://{WEBSERVER-ADDRESS}:38084/php-8.2.13/mysql/8.0/index.php
</pre>
