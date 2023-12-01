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
user@host:/home/user/docker-series/php8_apache$ docker network create webserver_network
user@host:/home/user/docker-series/php8_apache$ docker-compose up --build (in first time)
user@host:/home/user/docker-series/php8_apache$ [Ctrl+C]
user@host:/home/user/docker-series/php8_apache$ docker-compose start (in the next times)
user@host:/home/user/docker-series/php8_apache$ docker-compose ps (check the containers status)
</pre>


# Step by Step

