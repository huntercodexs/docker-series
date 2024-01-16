# REDIS

- How to run redis from this project use

<pre>
user@host:/home/user$ git clone https://github.com/huntercodexs/docker-series.git .
user@host:/home/user$ cd docker-series/self-containers/redis
user@host:/home/user/docker-series/self-containers/redis$ docker network create open_network
user@host:/home/user/docker-series/self-containers/redis$ docker-compose up --build
user@host:/home/user/docker-series/self-containers/redis$ [Ctrl+C]
user@host:/home/user/docker-series/self-containers/redis$ docker-compose start
</pre>

- Access, execute, and test redis

<pre>
user@host:/home/user/docker-series/self-containers/redis$ docker exec -it redis /bin/bash
root@3e760fd49412:/opt# redis-cli 
127.0.0.1:6379>[Ctrl+D]
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
