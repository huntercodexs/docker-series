# Nginx

- To run nginx from this project use

<pre>
git clone https://github.com/huntercodexs/docker-series.git .
cd self-containers/nginx
docker-compose up --build nginx (in first time)
docker-compose start nginx (in others case)
</pre>

- Access the application web in

<pre>
http://${WEBSERVER_ADDRESS}:38787
</pre>