# Grafana Ubuntu

- To run grafana-ubuntu from this project use

<pre>
git clone https://github.com/huntercodexs/docker-series.git .
cd self-containers/grafana-ubuntu
docker-compose up --build grafana-ubuntu (in first time)
docker-compose start grafana-ubuntu (in others case)
</pre>

- Access the grafana web dashboard

<pre>
http://${GRAFANA_UBUNTU_SERVER_IP}:33001
Email or username: admin
Password: 123mudar
</pre>
