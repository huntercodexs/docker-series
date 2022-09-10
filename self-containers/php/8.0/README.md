# PHP-8.0

- To run php80 from this project use

<pre>
git clone https://github.com/huntercodexs/docker-series.git .
cd self-containers/php/8.0
docker-compose up --build (in first time)
docker-compose start (in others case)
</pre>

> FEATURES AVAILABLE

- XDEBUG
- OPCACHE
- MBSTRING
- BCMATH
- COMPOSER
- REDIS
- PDO
- MSSQL
- MYSQL
- MONGODB
- POSTGRES
- SQLITE3
- FIREBIRD
- INTERBASE
- ORACLE [no]

> HOW TO MAKE A TEST

- Access the webserver and run the command below

<pre>
user@ubuntu:$ docker exec -it webserver-php80 /bin/bash
root@510ad756e791:/usr/local/apache2# /home/webserver/webserver.sh restart
</pre>

- Access the sample application PHP-8.0

<pre>
http://${WEBSERVER_IP}:38080/sample
</pre>
