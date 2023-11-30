# RABBITMQ 3.9.8

- How to run rabbitmq-3-9-8 rpm from this project use

<pre>
git clone https://github.com/huntercodexs/docker-series.git .
cd self-containers/messenger/rabbitmq-3.9.8
docker-compose up --build (in first time)
docker-compose start (in the next times)
docker exec -it rabbitmq-3-9-8 /bin/bash
</pre>

When inside container run the command 

<pre>
rabbitmq-plugins enable rabbitmq_management
</pre>

Access the manager from web browser

<pre>
http://{IP}:{PORT}

EXAMPLE
http://192.168.0.174:38080/
</pre>
