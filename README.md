# PHP8-APACHE + MYSQL8
A quick and single repository to build an environment for PHP8 with Apache2 and MYSQL8

![banner.png](php8-apache-mysql/files/medias/banner.png)


# Information

Please use the branch selector to access others environment configurations


# Dockers Configurations Contained

- PHP8-APACHE
- MYSQL8


# Usage

<pre>
user@host:/home/user$ git clone https://github.com/huntercodexs/docker-series.git .
user@host:/home/user$ cd docker-series
user@host:/home/user/docker-series$ git checkout php8_apache_mysql
user@host:/home/user/docker-series$ cd php8_apache_mysql
user@host:/home/user/docker-series/php8_apache_mysql$ docker network create open_network
user@host:/home/user/docker-series/php8_apache_mysql$ docker-compose up --build (in first time)
user@host:/home/user/docker-series/php8_apache_mysql$ [Ctrl+C]
user@host:/home/user/docker-series/php8_apache_mysql$ docker-compose start (in the next times)
user@host:/home/user/docker-series/php8_apache_mysql$ docker-compose ps (check the containers status)
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
user@host:/home/user/docker-series$ git checkout php8_apache_mysql
</pre>

4- Access the php8_apache_mysql folder
<pre>
user@host:/home/user/docker-series$ cd php8_apache_mysql
</pre>

5- Check and set up the .env file, .ini PHP files and all files contained in the path ./php8_apache_mysql/conf/php/

6- Build the container
<pre>    
user@host:/home/user/docker-series/php8_apache_mysql$ docker network create open_network
user@host:/home/user/docker-series/php8_apache_mysql$ docker-compose up --build
user@host:/home/user/docker-series/php8_apache_mysql$ [Ctrl+C]
user@host:/home/user/docker-series/php8_apache_mysql$ docker-compose start
user@host:/home/user/docker-series/php8_apache_mysql$ docker-compose ps
</pre>

Result
<pre>
    Name                  Command               State                                                             Ports                                                           
----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
mysql80        docker-entrypoint.sh mysqld      Up      0.0.0.0:3806->3306/tcp,:::3806->3306/tcp, 33060/tcp                                                                       
php8-apache2   docker-php-entrypoint apac ...   Up      0.0.0.0:38443->443/tcp,:::38443->443/tcp, 0.0.0.0:38080->80/tcp,:::38080->80/tcp, 0.0.0.0:9000->9000/tcp,:::9000->9000/tcp
</pre>

7- Access the applications
<pre>
http://localhost:38080/app1
http://localhost:38080/app2
http://localhost:38080/app3
</pre>