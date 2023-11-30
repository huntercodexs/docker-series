# PHP-7.1

- How to run php71 from this project use

<pre>
git clone https://github.com/huntercodexs/docker-series.git .
cd self-containers/php/7.1
docker-compose up --build (in first time)
docker-compose start (in the next times)
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
user@ubuntu:$ docker exec -it webserver-php71 /bin/bash
root@510ad756e791:/usr/local/apache2# /home/webserver/webserver.sh restart
</pre>

- Access the sample application PHP-7.1

<pre>
http://${WEBSERVER_IP}:38080/sample
</pre>
