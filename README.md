
# APACHE2 + PHP8
A quick repository to build an environment for PHP8

![apache_php8.png](apache2_php8/midias/apache_php8.png)

# Information

Please use the branch selector to access others environment configurations


# Docker Configurations Contained

- Ubuntu/Apache2
- PHP-8.0


# How to use

- Clone this project from GitHub

<pre>
user@host:/home/user$ git clone https://github.com/huntercodexs/docker-series.git .
user@host:/home/user$ cd docker-series
user@host:/home/user/docker-series$ git checkout apache2_php8
user@host:/home/user/docker-series$ cd apache2_php8/
user@host:/home/user/docker-series/apache2_php8$ docker-compose up --build (in first time)
user@host:/home/user/docker-series/apache2_php8$ docker-compose start (in others case)
</pre>

- Create a Network if needed

<pre>
user@host:/home/user/docker-series/apache2_php8$ docker network create open_network
</pre>

- Set up the app configurations (see more details in docker-compose.yml)

<pre>
user@host:/home/user/docker-series/apache2_php8/apache2/conf$ app.local.conf
</pre>

- Set up default configurations (see more details in docker-compose.yml)

<pre>
user@host:/home/user/docker-series/apache2_php8/apache2/conf$ 000-default.local.conf
</pre>

- Set up the applications

<pre>
user@host:/home/user/docker-series/apache2_php8/app$ ls app1 app2
</pre>

- Access the webserver application

<pre>
http://${WEBSERVER_ADDRESS}:38000
</pre>
