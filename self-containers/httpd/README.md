# Apache 2

- To run httpd from this project use

<pre>
git clone https://github.com/huntercodexs/docker-series.git .
cd self-containers/httpd
docker-compose up --build httpd (in first time)
docker-compose start httpd (in others case)
</pre>

- Access the application web in

<pre>
http://${WEBSERVER_ADDRESS}:38989
</pre>