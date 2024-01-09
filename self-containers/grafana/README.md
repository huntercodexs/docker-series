# GRAFANA

- How to run grafana from this project use

<pre>
user@host:/home/user$ git clone https://github.com/huntercodexs/docker-series.git .
user@host:/home/user$ cd docker-series/self-containers/grafana
user@host:/home/user/docker-series/self-containers/grafana$ docker-compose up --build (in first time)
user@host:/home/user/docker-series/self-containers/grafana$ docker-compose start (in the next times)
</pre>

- Access the grafana web dashboard

<pre>
http://${GRAFANA_SERVER_IP}:33000
Email or username: admin
Password: 123mudar
</pre>
