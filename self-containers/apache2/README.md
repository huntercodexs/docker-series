# Apache 2

- How to run apache2 from this project use

<pre>
user@host:/home/user$ git clone https://github.com/huntercodexs/docker-series.git .
user@host:/home/user$ cd docker-series/self-containers/apache2
user@host:/home/user/docker-series/self-containers/apache2$ docker-compose up --build (in first time)
user@host:/home/user/docker-series/self-containers/apache2$ docker-compose start (in the next times)
</pre>

- Access the application web in

<pre>
http://${WEBSERVER_ADDRESS}:38585
</pre>