# PHP-5.6

![unavailable.png](../../files/midias/unavailable.png) DEPRECATED

- How to run php 5.6 from this project use

<pre>
user@host:/home/user$ git clone https://github.com/huntercodexs/docker-series.git .
user@host:/home/user$ cd docker-series/self-containers/php/5.6
user@host:/home/user/docker-series/self-containers/php/5.6$ docker-compose up --build
user@host:/home/user/docker-series/self-containers/php/5.6$ [Ctrl+C]
user@host:/home/user/docker-series/self-containers/php/5.6$ docker-compose start
</pre>

> FEATURES AVAILABLE

- XDEBUG
- OPCACHE
- MBSTRING
- BCMATH
- GD
- COMPOSER
- MYSQL

- Access the webserver and run the command below

<pre>
user@host:/home/user/docker-series/self-containers/php/5.6$ docker exec -it webserver-php56 /bin/bash
root@510ad756e791:/usr/local/apache2# /home/webserver/webserver.sh restart
</pre>

- Access the sample application PHP-5.6

<pre>
http://${WEBSERVER_IP}:38080/sample
</pre>
