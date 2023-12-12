# PHP8 AND APACHE2
A quick and single repository to build an environment for PHP8 with Apache2 - OFFLINE DRIVERS

![banner.png](php8-apache/files/medias/banner.png)


# Information

> IMPORTANT NOTE: This project branch is an improving of the branch php8_apache-offline-drivers, but in this case
> all drivers installed in the PHP containers are made directly from the own container (folder) configuration, that
> those are placed in the path php/{PHP-VERSION}/conf/extensions/php-{PHP-VERSION}-compiled-extensions.zip, where all
> of these drivers was compiled and tested in the specific PHP-VERSION in the another time. If you need to check these
> drivers files just do the command tar -xfv {file} and you will see all the files compiled .so type. For more details
> you may give a look in the files php/{PHP-VERSION}/php-{PHP-VERSION}.dockerfile specifically in the section like
> showed below
> showed below

<pre>
COPY ./conf/php/extensions/php-8.0.0-compiled-extensions.zip $DIR_PHP_EXTENSIONS/
RUN unzip -o $DIR_PHP_EXTENSIONS/php-8.0.0-compiled-extensions.zip -d $DIR_PHP_EXTENSIONS
</pre>

Please use the branch selector to access others environment configurations


# Dockers Configurations Contained

- PHP8-APACHE


# Database drivers

- Oraclelinux - 19c
- MongoDB
- Mysql
- MsSql
- Postgres
- Firebird
- Redis
- Sqlite


# Usage

<pre>
user@host:/home/user$ git clone https://github.com/huntercodexs/docker-series.git .
user@host:/home/user$ cd docker-series
user@host:/home/user/docker-series$ git checkout php8_apache-offline-drivers
user@host:/home/user/docker-series$ cd php8_apache-offline-drivers
user@host:/home/user/docker-series/php8_apache-offline-drivers$ docker network create open_network
user@host:/home/user/docker-series/php8_apache-offline-drivers$ docker-compose up --build (in first time)
user@host:/home/user/docker-series/php8_apache-offline-drivers$ [Ctrl+C]
user@host:/home/user/docker-series/php8_apache-offline-drivers$ docker-compose start (in the next times)
user@host:/home/user/docker-series/php8_apache-offline-drivers$ docker-compose ps (check the containers status)
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
user@host:/home/user/docker-series$ git checkout php8_apache-offline-drivers
</pre>

4- Access the php8_apache-offline-drivers folder
<pre>
user@host:/home/user/docker-series$ cd php8_apache-offline-drivers
</pre>

5- Check and set up the .env file, .ini PHP files and all files contained in the path ./php8_apache-offline-drivers/conf/php/

6- Build the container
<pre>    
user@host:/home/user/docker-series/php8_apache-offline-drivers$ docker network create open_network
user@host:/home/user/docker-series/php8_apache-offline-drivers$ docker-compose up --build
user@host:/home/user/docker-series/php8_apache-offline-drivers$ [Ctrl+C]
user@host:/home/user/docker-series/php8_apache-offline-drivers$ docker-compose start
user@host:/home/user/docker-series/php8_apache-offline-drivers$ docker-compose ps
</pre>

Result
<pre>
   Name                  Command               State                                                             Ports                                                           
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
php8-apache   docker-php-entrypoint apac ...   Up      0.0.0.0:38443->443/tcp,:::38443->443/tcp, 0.0.0.0:38080->80/tcp,:::38080->80/tcp, 0.0.0.0:9000->9000/tcp,:::9000->9000/tcp
</pre>

7- Access the applications to make a test
<pre>
http://localhost:38080/app1
http://localhost:38080/app2
</pre>
