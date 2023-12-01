# PHP8 AND APACHE2
A quick and single repository to build an environment for PHP8 with Apache2

![banner.png](php8-apache/files/medias/banner.png)


# Information

Please use the branch selector to access others environment configurations


# Dockers Configurations Contained

- PHP8-APACHE


# Usage

<pre>
user@host:/home/user$ git clone https://github.com/huntercodexs/docker-series.git .
user@host:/home/user$ cd docker-series
user@host:/home/user/docker-series$ git checkout php8_apache
user@host:/home/user/docker-series$ cd php8_apache
user@host:/home/user/docker-series/php8_apache$ docker network create open_network
user@host:/home/user/docker-series/php8_apache$ docker-compose up --build (in first time)
user@host:/home/user/docker-series/php8_apache$ [Ctrl+C]
user@host:/home/user/docker-series/php8_apache$ docker-compose start (in the next times)
user@host:/home/user/docker-series/php8_apache$ docker-compose ps (check the containers status)
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
user@host:/home/user/docker-series$ git checkout php8_apache
</pre>

4- Access the php8_apache folder
<pre>
user@host:/home/user/docker-series$ cd php8_apache
</pre>

5- Check and set up the .env file, .ini PHP files and all files contained in the path ./php8_apache/conf/php/

6- Build the container
<pre>    
user@host:/home/user/docker-series/php8_apache$ docker network create open_network
user@host:/home/user/docker-series/php8_apache$ docker-compose up --build
user@host:/home/user/docker-series/php8_apache$ [Ctrl+C]
user@host:/home/user/docker-series/php8_apache$ docker-compose start
user@host:/home/user/docker-series/php8_apache$ docker-compose ps
</pre>

Result
<pre>
   Name                  Command               State                                                             Ports                                                           
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
php8-apache   docker-php-entrypoint apac ...   Up      0.0.0.0:38443->443/tcp,:::38443->443/tcp, 0.0.0.0:38080->80/tcp,:::38080->80/tcp, 0.0.0.0:9000->9000/tcp,:::9000->9000/tcp
</pre>

7- Access the applications
<pre>
http://localhost:38080/app1
http://localhost:38080/app2
</pre>