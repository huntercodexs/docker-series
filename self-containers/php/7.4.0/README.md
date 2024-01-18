# PHP-7.4.0

- How to run php 7.4.0 from this project use

<pre>
user@host:/home/user$ git clone https://github.com/huntercodexs/docker-series.git .
user@host:/home/user$ cd docker-series/self-containers/php/7.4.0
user@host:/home/user/docker-series/self-containers/php/7.4.0$ docker-compose up --build
user@host:/home/user/docker-series/self-containers/php/7.4.0$ [Ctrl+C]
user@host:/home/user/docker-series/self-containers/php/7.4.0$ docker-compose start
</pre>

> FEATURES AVAILABLE

- XDEBUG
- OPCACHE
- MBSTRING
- BCMATH
- GD
- COMPOSER
- DATABASE CONNECTIONS
    - ORACLELINUX ![img.png](../../files/midias/check-green.png)
    - MONGO ![img.png](../../files/midias/check-green.png)
    - MYSQL ![img.png](../../files/midias/check-green.png)
    - MSSQL ![img.png](../../files/midias/check-green.png)
        - 5.7 ![img.png](../../files/midias/check-green.png)
        - 8.0 ![img.png](../../files/midias/check-green.png)
    - REDIS ![img.png](../../files/midias/check-green.png)
    - SQLITE ![img.png](../../files/midias/check-green.png)
    - POSTGRES ![img.png](../../files/midias/check-green.png)
    - FIREBIRD ![img.png](../../files/midias/unavailable.png)


> HOW TO MAKE A TEST

- Access the webserver and run the command below

<pre>
user@host:/home/user/docker-series/self-containers/php/7.4.0$ docker exec -it webserver-php71 /bin/bash
root@510ad756e791:/usr/local/apache2# /home/webserver/webserver.sh restart
</pre>

- Access the sample application PHP-7.4.0

<pre>
http://${WEBSERVER_IP}:38080/sample
</pre>
