# PHP-7.2

![unavailable.png](../../files/midias/unavailable.png) LEGACY

- How to run php 7.2 from this project use

<pre>
user@host:/home/user$ git clone https://github.com/huntercodexs/docker-series.git .
user@host:/home/user$ cd docker-series/self-containers/php/7.2
user@host:/home/user/docker-series/self-containers/php/7.2$ docker-compose up --build
user@host:/home/user/docker-series/self-containers/php/7.2$ [Ctrl+C]
user@host:/home/user/docker-series/self-containers/php/7.2$ docker-compose start
</pre>

> FEATURES AVAILABLE

- XDEBUG
- OPCACHE
- MBSTRING
- BCMATH
- GD
- COMPOSER
- MYSQL
- REDIS

> HOW TO MAKE A TEST

- Access the webserver and run the command below

<pre>
user@host:/home/user/docker-series/self-containers/php/7.2$ docker exec -it webserver-php71 /bin/bash
root@510ad756e791:/usr/local/apache2# /home/webserver/webserver.sh restart
</pre>

- Access the sample application PHP-7.2

<pre>
http://${WEBSERVER_IP}:38080/sample
</pre>
