# NODEJS 18.7.0

- Run nodejs from this project use

<pre>
git clone https://github.com/huntercodexs/docker-series.git .
cd self-containers/nodejs/18.7.0
docker-compose up --build (in first time)
docker-compose start (in the next times)
</pre>

- Modules


<pre>
nodemon
express
</pre>

# How to use

- After the container is up or errors occurs check/run the commands below:

<pre>
$ npm init
$ npm install -g express
$ npm install -g npm@8.15.0
$ npm install -g nodemon
</pre>

- Access and test application

<pre>
http://${SERVER_IP}:33000
</pre>

