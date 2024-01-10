# KIBANA

- How to run kibana from this project use

<pre>
user@host:/home/user$ git clone https://github.com/huntercodexs/docker-series.git .
user@host:/home/user$ cd docker-series/self-containers/kibana
user@host:/home/user/docker-series/self-containers/kibana$ docker-compose up --build (in first time)
user@host:/home/user/docker-series/self-containers/kibana$ docker-compose start (in the next times)
</pre>

Kibana
<pre>
http://localhost:5601/app/home#/
http://localhost:5601/app/dev_tools#/console
ELASTIC_USERNAME
ELASTIC_PASSWORD
</pre>

Query Sample
<pre>
GET index/_search
</pre>
