# Nginx with SSL (Let's Encrypt)

- To run nginx from this project use

<pre>
git clone https://github.com/huntercodexs/docker-series.git .
cd self-containers/nginx-ssl
docker-compose up --build (in first time)
docker-compose start (in others case)
</pre>

- Access the application web in

<pre>
http://${WEBSERVER_ADDRESS}:38787
</pre>