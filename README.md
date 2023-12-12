# HTTPD + PHP8 (USING DEDICATED CONTAINER)
Using PHP together Apache2 Server - OFFLINE DRIVERS

![banner.png](httpd_php8_separated-offline-drivers/files/media/banner.png)


![unavailable.png](httpd_php8_separated-offline-drivers/files/media/unavailable.png)
***DEPRECATED***

# Information

Please use the branch selection to access others configurations for your need and purposes, this branch offers
a complete environment to development using HTTPD(Apache2) + PHP8.

> IMPORTANT: See the file .env in the root path of this repository to see all details about the application settings


# About project

> IMPORTANT: This repository have a lot of files that has been downloaded from the responsible sources, compiled and
> tested in the environments contained in this repository. You can see these files in the folder
> httpd_php8_separated-offline-drivers/php/{PHP-VERSION}/conf/extensions/php-{PHP-VERSION}-compiled-extensions.zip
> witch will be copied to inside PHP container, unzipped and applied in the container targeted.

> Give a look in the section #References to get more details (don't mess the workdir called extensions)

# Docker Containers Databases

> ![img.png](./httpd_php8_separated-offline-drivers/files/media/check-green.png) Available
> ![img.png](./httpd_php8_separated-offline-drivers/files/media/check-silver.png) Pending
> ![img.png](./httpd_php8_separated-offline-drivers/files/media/unavailable.png) Unavailable

- HTTPD - APACHE2 ![img.png](./httpd_php8_separated-offline-drivers/files/media/check-green.png)
- PHP-7.4.0-FPM ![img.png](./httpd_php8_separated-offline-drivers/files/media/check-green.png)
- PHP-8.0.0-FPM ![img.png](./httpd_php8_separated-offline-drivers/files/media/check-green.png)
- PHP-8.1.0-FPM ![img.png](./httpd_php8_separated-offline-drivers/files/media/check-green.png)
- PHP-8.2.2-FPM ![img.png](./httpd_php8_separated-offline-drivers/files/media/check-green.png)
- PHP-8.2.13-FPM ![img.png](./httpd_php8_separated-offline-drivers/files/media/check-green.png)


# About PHP8

- DOCKERFILE

Set up the php8.dockerfile in the header to refers an application or settings that should be used in all
process, by example DIR_PHP_INI or DIR_WEBSERVER

- PHP INI FILES

Configuration file to PHP server shared between HOST and Container

<pre>
./httpd_php8_separated-offline-drivers/php8/shared/ini/php/php.ini
/usr/local/etc/php/conf.d/
</pre>


# About Webserver HTTPD

The version of HTTP used in this project is:

<pre>
Server version: Apache/2.4.54 (Unix)
Server built:   Jul 12 2022 04:31:28
</pre>

> IMPORTANT: In the first time to run this container, execute the script "webserver.sh prepare" after docker-compose up -d

<pre>
docker exec -it webserver /bin/bash
/home/apache2/webserver.sh prepare
</pre>

Before run the previous step, please edit the files in /httpd_php8_separated-offline-drivers/webserver/conf/ in this project
path [conf|htdocs], these files are responsible to configure the webserver HTTP.

<pre>
httpd.conf
sites-available.conf
</pre>

After the first step (see above) execute again the script "webserver.sh" but pass the "restart" as parameter

<pre>
/home/webserver/webserver.sh restart
</pre>


# Usage

<pre>
user@host:/home/user$ git clone https://github.com/huntercodexs/docker-series.git .
user@host:/home/user$ cd docker-series
user@host:/home/user/docker-series$ git checkout httpd_php8_separated-offline-drivers
user@host:/home/user/docker-series$ cd httpd_php8_separated-offline-drivers
user@host:/home/user/docker-series/httpd_php8_separated-offline-drivers$ docker network create httpd_php8_separated-offline-drivers_network
user@host:/home/user/docker-series/httpd_php8_separated-offline-drivers$ docker-compose up --build (in first time)
user@host:/home/user/docker-series/httpd_php8_separated-offline-drivers$ [Ctrl+C]
user@host:/home/user/docker-series/httpd_php8_separated-offline-drivers$ docker-compose start (in the next times)
user@host:/home/user/docker-series/httpd_php8_separated-offline-drivers$ docker-compose ps (check the containers status)
</pre>


# Step by Step

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
user@host:/home/user/docker-series$ git checkout httpd_php8_separated-offline-drivers
</pre>

4- Access the httpd_php8_separated-offline-drivers folder
<pre>
user@host:/home/user/docker-series$ cd httpd_php8_separated-offline-drivers
</pre>

5- Check and set up the .env file, .ini PHP files and all files contained in the path php/{PHP-VERSION}/conf, also 
check and configure the httpd.conf file with the correct ports
<pre>
#Listen 12.34.56.78:80
Listen 80
Listen 81
Listen 82
Listen 83
Listen 84
</pre>

6- Build the containers

> NOTE: Check the folder permissions mainly the databases/oracle/database and databases/oracle/oradata, if you
> don't know what must be used, use 0x777

<pre>    
user@host:/home/user/docker-series/httpd_php8_separated-offline-drivers$ docker network create httpd_php8_separated-offline-drivers_network
user@host:/home/user/docker-series/httpd_php8_separated-offline-drivers$ docker-compose up --build
</pre>

Make sure that the result look like this
<pre>
user@host:/home/user/docker-series/httpd_php8_separated-offline-drivers$ docker-compose ps
     Name                    Command                  State                                             Ports                                       
----------------------------------------------------------------------------------------------------------------------------------------------------
php-7.4.0         docker-php-entrypoint php-fpm    Up             0.0.0.0:9000->9000/tcp,:::9000->9000/tcp                                          
php-8.0.0         docker-php-entrypoint php-fpm    Up             0.0.0.0:9001->9000/tcp,:::9001->9000/tcp                                          
php-8.1.0         docker-php-entrypoint php-fpm    Up             0.0.0.0:9002->9000/tcp,:::9002->9000/tcp                                          
php-8.2.2         docker-php-entrypoint php-fpm    Up             0.0.0.0:9003->9000/tcp,:::9003->9000/tcp                                          
webserver-7.4.0   httpd-foreground                 Up             0.0.0.0:40443->443/tcp,:::40443->443/tcp, 0.0.0.0:33074->80/tcp,:::33074->80/tcp  
webserver-8.0.0   httpd-foreground                 Up             0.0.0.0:41443->443/tcp,:::41443->443/tcp, 0.0.0.0:33800->80/tcp,:::33800->80/tcp  
webserver-8.1.0   httpd-foreground                 Up             0.0.0.0:42443->443/tcp,:::42443->443/tcp, 0.0.0.0:33810->80/tcp,:::33810->80/tcp  
webserver-8.2.2   httpd-foreground                 Up             0.0.0.0:43443->443/tcp,:::43443->443/tcp, 0.0.0.0:33822->80/tcp,:::33822->80/tcp
</pre>

7- Edit the webserver file settings in the path httpd_php8_separated-offline-drivers/webserver/{PHP-VERSION}/conf

> NOTE: See all the file in this folder to more details

<pre>
user@host:/home/user/docker-series/httpd_php8_separated-offline-drivers/webserver/{PHP-VERSION}/conf$ httpd.conf
user@host:/home/user/docker-series/httpd_php8_separated-offline-drivers/webserver/{PHP-VERSION}/conf$ webserver.conf
user@host:/home/user/docker-series/httpd_php8_separated-offline-drivers/webserver/{PHP-VERSION}/conf/htdocs$ index.html
</pre>

8- Restart the webserver targeted

> NOTE: Whether you need, change this script

<pre>
user@host:/home/user/docker-series/httpd_php8_separated-offline-drivers$ docker exec -it webserver-{PHP-VERSION} /bin/bash
root@9fdf75782c1e:/usr/local/apache2# /home/webserver/conf/webserver-apply-changes-and-restart.sh
</pre>


9- Test the applications to get info from each PHP version
<pre>
http://localhost:{WEBSERVER-PORT}/info/
</pre>

10- Test each sample application that are placed in the folder ./applications
<pre>
http://localhost:33074/php-7.4.0/menu.php
http://localhost:33800/php-8.0.0/menu.php
http://localhost:33810/php-8.1.0/menu.php
http://localhost:33822/php-8.2.2/menu.php
http://localhost:33813/php-8.2.13/menu.php
</pre>
