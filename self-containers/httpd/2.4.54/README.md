# Httpd 2.4.54

- How to run httpd from this project use

<pre>
user@host:/home/user$ git clone https://github.com/huntercodexs/docker-series.git .
user@host:/home/user$ cd docker-series/self-containers/httpd/2.4.54
user@host:/home/user/docker-series/self-containers/httpd/2.4.54$ docker-compose up --build
user@host:/home/user/docker-series/self-containers/httpd/2.4.54$ docker-compose start
</pre>

- Access the application web in

<pre>
http://${WEBSERVER_ADDRESS}:38989
</pre>