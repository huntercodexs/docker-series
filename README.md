# NGINX + PHP-8.X.X (WITH PHP-7.4.0 AS WELL)
A quick and single repository to build an environment for PHP with NGINX - OFFLINE DRIVERS

![banner.png](nginx_php8-offline-drivers/files/medias/banner.png)


# Information

> IMPORTANT NOTE: This project branch is an improving of the branch nginx_php8-offline-drivers, but in this case
> all drivers installed in the PHP containers are made directly from the own container (folder) configuration, that
> those are placed in the path php/{PHP-VERSION}/conf/extensions/php-{PHP-VERSION}-compiled-extensions.zip, where all
> of these drivers was compiled and tested in the specific PHP-VERSION in the another time. If you need to check these
> drivers files just do the command tar -xfv {file} and you will see all the files compiled .so type. For more details
> you may give a look in the files php/{PHP-VERSION}/php-{PHP-VERSION}.dockerfile specifically in the section like
> showed below
> showed below

Example

<pre>
COPY ./conf/extensions/php-7.4.0-compiled-extensions.zip $DIR_PHP_EXTENSIONS/
RUN unzip -o $DIR_PHP_EXTENSIONS/php-7.4.0-compiled-extensions.zip -d $DIR_PHP_EXTENSIONS
</pre>

Please use the branch selector to access others environment configurations

The PHP available in this branch are:

- PHP-7.4.0
- PHP-8.0.0
- PHP-8.1.0
- PHP-8.2.2
- PHP-8.2.13

# Usage

- Access the folder path in this project to run php8 together nginx, as below:  

<pre>
user@host:/home/user$ git clone https://github.com/huntercodexs/docker-series.git .
user@host:/home/user$ cd docker-series
user@host:/home/user/docker-series$ git checkout nginx_php8-offline-drivers
user@host:/home/user/docker-series$ cd nginx_php8-offline-drivers
user@host:/home/user/docker-series/nginx_php8-offline-drivers$ docker network create nginx_php8-offline-drivers_network
user@host:/home/user/docker-series/nginx_php8-offline-drivers$ docker-compose up --build (in first time)
user@host:/home/user/docker-series/nginx_php8-offline-drivers$ [Ctrl+C]
user@host:/home/user/docker-series/nginx_php8-offline-drivers$ docker-compose start (in the next times)
user@host:/home/user/docker-series/nginx_php8-offline-drivers$ docker-compose ps (check the containers status)
</pre>

- Before build and start project set the following configurations files:

<pre>
- php.ini (nginx_php8-offline-drivers/php/{PHP-VERSION}/conf/)
- nginx.conf (nginx_php8-offline-drivers/nginx/)
- php-{PHP-VERSION}.conf (nginx_php8-offline-drivers/nginx/conf.d/)
</pre>

- Access the application

<pre>
http://localhost:38080/php-7.4.0/menu.php
http://localhost:38080/php-7.4.0/content/index.php

http://localhost:38081/php-8.0.0/menu.php
http://localhost:38081/php-8.0.0/content/index.php

http://localhost:38082/php-8.1.0/menu.php
http://localhost:38082/php-8.1.0/content/index.php

http://localhost:38083/php-8.2.2/menu.php
http://localhost:38083/php-8.2.2/content/index.php

http://localhost:38084/php-8.2.13/menu.php
http://localhost:38084/php-8.2.13/content/index.php
</pre>

