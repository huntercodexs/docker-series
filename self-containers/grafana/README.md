# Grafana

- To run grafana from this project use

<pre>
git clone https://github.com/huntercodexs/docker-series.git .
cd self-containers/grafana
docker-compose up --build (in first time)
docker-compose start (in others case)
</pre>

- Access the grafana web dashboard

<pre>
http://${GRAFANA_SERVER_IP}:33000
Email or username: admin
Password: 123mudar
</pre>
