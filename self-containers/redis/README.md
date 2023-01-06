# REDIS

- How to run redis from this project use

<pre>
git clone https://github.com/huntercodexs/docker-series.git .
cd self-containers/redis
docker-compose up --build (in first time)
docker-compose start (in the next times)
</pre>

# How to use

<pre>
docker exec -it redis /bin/bash
</pre>

<pre>
root@3e760fd49412:/opt# redis-cli 
127.0.0.1:6379>
</pre>

<pre>
root@3e760fd49412:/opt# redis-cli -h 127.0.0.1 -p 6379 -a '123@Mudar!'
Warning: Using a password with '-a' or '-u' option on the command line interface may not be safe.
127.0.0.1:6379> SET redistestkey 123456
OK
127.0.0.1:6379> GET redistestkey
"123456"
127.0.0.1:6379> DEL redistestkey
(integer) 1
127.0.0.1:6379> GET redistestkey
(nil)
127.0.0.1:6379> 
</pre>
