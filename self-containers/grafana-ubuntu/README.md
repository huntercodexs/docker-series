# Grafana Ubuntu

- How to run grafana-ubuntu from this project use

<pre>
user@host:/home/user$ git clone https://github.com/huntercodexs/docker-series.git .
user@host:/home/user$ cd docker-series/self-containers/grafana-ubuntu
user@host:/home/user/docker-series/self-containers/grafana-ubuntu$ docker-compose up --build (in first time)
user@host:/home/user/docker-series/self-containers/grafana-ubuntu$ docker-compose start (in the next times)
</pre>

- Access the grafana web dashboard

<pre>
http://${GRAFANA_UBUNTU_SERVER_IP}:33001
Email or username: admin
Password: 123mudar
</pre>
