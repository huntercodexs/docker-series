# Apache 2

- To run apache2 from this project use

<pre>
git clone https://github.com/huntercodexs/docker-series.git .
cd self-containers/apache2
docker-compose up --build apache2 (in first time)
docker-compose start apache2 (in others case)
</pre>

- Access the application web in

<pre>
http://${WEBSERVER_ADDRESS}:38585
</pre>