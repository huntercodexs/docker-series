# EC2 (Amazonlinux) + JAVA + MYSQL + RABBITMQ
Simple Environment to simulate a workflow


# Requisites

- Amazonlinux
- Java 8
- RabbitMQ 3.6.10
- Mysql 8

# About

UPDATE

- sudo yum update

MYSQL

- sudo yum install mysql

RABBITMQ

- sudo yum install -y https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm
- sudo yum-config-manager --enable epel
- sudo yum install erlang --enablerepo=epel
- sudo yum install yum-plugin-versionlock
- sudo yum versionlock gcc-*
- sudo yum install -y socat
- sudo yum install logrotate
- curl -s https://packagecloud.io/install/repositories/rabbitmq/erlang/script.rpm.sh | sudo bash
- curl -s https://packagecloud.io/install/repositories/rabbitmq/rabbitmq-server/script.rpm.sh | sudo bash
- wget https://github.com/rabbitmq/rabbitmq-server/releases/download/rabbitmq_v3_6_10/rabbitmq-server-3.6.10-1.el6.noarch.rpm
- sudo rpm -Uvh rabbitmq-server-3.6.10-1.el6.noarch.rpm
- sudo rabbitmq-plugins enable rabbitmq_management
- sudo chkconfig rabbitmq-server on

JAVA

> see https://www.oracle.com/sa/java/technologies/javase/javase8u211-later-archive-downloads.html

- sudo rpm -ivh jre-8u212-linux-x64.rpm


# How to use

- Run

<pre>
git clone https://github.com/huntercodexs/docker-series.git .
cd ec2_java_mysql_rabbitmq
docker-compose up --build (in first time)
docker-compose start (in the next times)
docker exec -it ec2_java_rabbitmq /bin/bash
</pre>

- Mysql

If you get the follow error

> ERROR 2059 (HY000): Authentication plugin 'caching_sha2_password' cannot be loaded: /usr/lib64/mysql/plugin/caching_sha2_password.so: cannot open shared object file: No such file or directory

<pre>
USE mysql;
ALTER USER 'root'@'%' IDENTIFIED WITH mysql_native_password BY 'root123';
FLUSH PRIVILEGES;
</pre>

- RabbitMQ

Next step to run rabbitmq inside ec2_java_rabbitmq container

<pre>
rabbitmq-plugins enable rabbitmq_management &
rabbitmq-server start &
rabbitmqctl list_users
rabbitmqctl authenticate_user guest guest
</pre>

In the rabbitmq container everything is fine, so you can use as is, however you can still enable few plugins, as example: 

<pre>
rabbitmq-plugins enable rabbitmq_management
</pre>

Use "rabbitmq-plugins list" commando to view a complete list of plugins

# Run the sample projects

