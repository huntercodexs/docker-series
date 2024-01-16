# NODEJS

> NOTE: The current version used in this repository is 18.7.0

- How to run nodejs from this project use

<pre>
user@host:/home/user$ git clone https://github.com/huntercodexs/docker-series.git .
user@host:/home/user$ cd docker-series/self-containers/nodejs/18.7.0
user@host:/home/user/docker-series/self-containers/nodejs/18.7.0$ docker network create open_network
user@host:/home/user/docker-series/self-containers/nodejs/18.7.0$ docker-compose up --build
user@host:/home/user/docker-series/self-containers/nodejs/18.7.0$ [Ctrl+C]
user@host:/home/user/docker-series/self-containers/nodejs/18.7.0$ docker-compose start
</pre>

- Modules

<pre>
nodemon
express
</pre>

- After the container is up or errors occurs check/run the commands below:

<pre>
user@host:/home/user/docker-series/self-containers/nodejs/18.7.0$ docker exec -it nodejs /bin/bash
root@b292f61e4ec5:/home/nodejs/app# npm init
root@b292f61e4ec5:/home/nodejs/app# [Enter+Enter+Enter...]
root@b292f61e4ec5:/home/nodejs/app# npm install -g express
root@b292f61e4ec5:/home/nodejs/app# npm install -g npm@8.15.0
root@b292f61e4ec5:/home/nodejs/app# npm install -g nodemon
</pre>

- Access and test application

<pre>
http://${SERVER_IP}:33000
</pre>

