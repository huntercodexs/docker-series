# RABBITMQ 3.12.12

- How to run rabbitmq-3.12.12 rpm from this project use

<pre>
user@host:/home/user$ git clone https://github.com/huntercodexs/docker-series.git .
user@host:/home/user$ cd docker-series/self-containers/messenger/rabbitmq-3.12.12
user@host:/home/user/docker-series/self-containers/messenger/rabbitmq-3.12.12$ docker network create open_network
user@host:/home/user/docker-series/self-containers/messenger/rabbitmq-3.12.12$ docker-compose up --build
user@host:/home/user/docker-series/self-containers/messenger/rabbitmq-3.12.12$ [Ctrl+C]
user@host:/home/user/docker-series/self-containers/messenger/rabbitmq-3.12.12$ docker-compose start
</pre>

> NOTE: If occurs some error during the build of container, check if it's the folder lib in the 
> self-containers/messenger/rabbitmq-3.12.12/lib, maybe must be required delete all content in this folder
> for example:

<pre>
user@host:/home/user/docker-series/self-containers/messenger/rabbitmq-3.12.12$ cd lib
user@host:/home/user/docker-series/self-containers/messenger/rabbitmq-3.12.12$ rm -rf .*
user@host:/home/user/docker-series/self-containers/messenger/rabbitmq-3.12.12$ rm -rf *
</pre>

- Access the RabbitMQ container

<pre>
user@host:/home/user/docker-series/self-containers/messenger/rabbitmq-3.12.12$ docker exec -it rabbitmq-3.12.12 /bin/bash
</pre>

- Manager the RabbitMQ
<pre>
bash-4.2# rabbitmq-server start &
bash-4.2# rabbitmqctl list_users &
bash-4.2# rabbitmq-plugins enable rabbitmq_management &
bash-4.2# rabbitmqctl authenticate_user guest guest &
</pre>  

- Add a new user and give permissions
<pre>
bash-4.2# rabbitmqctl add_user test test
bash-4.2# rabbitmqctl set_user_tags test administrator
bash-4.2# rabbitmqctl set_permissions -p / test ".*" ".*" ".*"
</pre>

- Access the manager from web browser
<pre>
http://{SERVER-IP}:38080/
Username: test
Password: test
</pre>
