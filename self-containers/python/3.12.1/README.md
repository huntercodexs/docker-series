# PYTHON 3.12.1

- Run python 3.12.1 from this project use

<pre>
user@host:/home/user$ git clone https://github.com/huntercodexs/docker-series.git .
user@host:/home/user$ cd docker-series/self-containers/python/3.12.1
user@host:/home/user/docker-series/self-containers/python/3.12.1$ docker network create open_network
user@host:/home/user/docker-series/self-containers/python/3.12.1$ docker-compose up --build
user@host:/home/user/docker-series/self-containers/python/3.12.1$ docker-compose start
</pre>

- Make a test using POSTMAN file: "PYTHON-3.12.1.postman_collection.json"

<pre>
[GET] http://localhost:38085/app1/
[RESPONSE]
{
  "message": "Everything fine !",
  "response": "Welcome to APP1",
  "status": 200
}

[GET] http://localhost:38085/app2/
[RESPONSE]
{
    "message": "Everything fine !",
    "response": "Welcome to APP2",
    "status": 200
}
</pre>

