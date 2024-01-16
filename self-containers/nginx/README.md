# Nginx

- How to run nginx from this project use

<pre>
user@host:/home/user$ git clone https://github.com/huntercodexs/docker-series.git .
user@host:/home/user$ cd docker-series/self-containers/nginx
user@host:/home/user/docker-series/self-containers/nginx$ docker network create open_network
user@host:/home/user/docker-series/self-containers/nginx$ docker-compose up --build
user@host:/home/user/docker-series/self-containers/nginx$ docker-compose start
</pre>

- Access the application web in

<pre>
http://${WEBSERVER_ADDRESS}:38787
</pre>