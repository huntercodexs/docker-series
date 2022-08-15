# PYTHON 3

> Run python 3 from this project use

<pre>
git clone https://github.com/huntercodexs/docker-series.git .
cd self-containers/python/3.0
docker-compose up --build (in first time)
docker-compose start (in others case)
</pre>

> How to use

- After up container check/run the commands below:

<pre>
root@docker# /usr/local/bin/python -m pip install --upgrade pip
root@docker# pip3 install
root@docker# pip3 install flask
root@docker# pip3 install -U flask-cors
</pre>

- Make a test using POSTMAN file: "PYTHON3 - PYSIMPLE.postman_collection.json"

<pre>
GET http://${SERVER_IP}:35000/api/welcome
POST http://${SERVER_IP}:35000/api/article {"name": "Tester"}
</pre>

