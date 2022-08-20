# PHP-5.6

- To run php56 from this project use

<pre>
git clone https://github.com/huntercodexs/docker-series.git .
cd self-containers/php56
docker-compose up --build php56 (in first time)
docker-compose start php56 (in others case)
</pre>

> FEATURES AVAILABLE

- XDEBUG
- OPCACHE
- MBSTRING
- BCMATH
- GD
- COMPOSER
- MYSQL

> HOW TO MAKE A TEST

- Access the webserver and run the command below

<pre>
user@ubuntu:$ docker exec -it webserver-php56 /bin/bash
root@510ad756e791:/usr/local/apache2# /home/webserver/webserver.sh restart
</pre>

- Access the sample application PHP-5.6

<pre>
http://${WEBSERVER_IP}:38080/sample
</pre>
