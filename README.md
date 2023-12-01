# OPENJDK-8u212 + MYSQL8
Docker Series - A project to work with many docker container

![banner.png](openjdk8_212_mysql8/files/banner.png)


# Information

Please use the branch selection to access others configurations to most need and purposes


# Dockers Configurations Contained

- OpenJDK-8-212
- Mysql 8.0


# Usage

<pre>
user@host:/home/user$ git clone https://github.com/huntercodexs/docker-series.git .
user@host:/home/user$ cd docker-series
user@host:/home/user/docker-series$ git checkout openjdk8_212_mysql8
user@host:/home/user/docker-series$ cd openjdk8_212_mysql8
user@host:/home/user/docker-series/openjdk8_212_mysql8$ docker network create openjdk-net
user@host:/home/user/docker-series/openjdk8_212_mysql8$ docker-compose up --build (in first time)
user@host:/home/user/docker-series/openjdk8_212_mysql8$ [Ctrl+C]
user@host:/home/user/docker-series/openjdk8_212_mysql8$ docker-compose start (in the next times)
user@host:/home/user/docker-series/openjdk8_212_mysql8$ docker-compose ps (check the containers status)
</pre>


# Step by Step

Follow the steps below to quick and easy environment creation

> NOTE: After changes in the current project and generated jar file, copy it inside to docker container openjdk 
> and run the command "docker-compose up openjdk-8u212" to feature update or execute directly command as 
> docker exec -it openjdk-8u212 java -jar /home/openjdk/simple-api-demo/SIMPLE-API-DEMO-22.01.1-SNAPSHOT.jar --spring.config.location=/home/openjdk/simple-api-demo/application.properties

1- Clone the repository
<pre>
user@host:/home/user$ git clone https://github.com/huntercodexs/docker-series.git .
</pre>

2- Access the repository folder
<pre>
user@host:/home/user$ cd docker-series
</pre>

3- Change the current branch
<pre>
user@host:/home/user/docker-series$ git checkout openjdk8_212_mysql8
</pre>

4- Access the openjdk8_212_mysql8 folder
<pre>
user@host:/home/user/docker-series$ cd openjdk8_212_mysql8
</pre>

5- Check and set up the .env file, the application.properties and put the application java (jar file) inside 
the simple-api-demo sample before run the docker-compose up --build

6- Build the container
<pre>    
user@host:/home/user/docker-series/openjdk8_212_mysql8$ docker network create openjdk-net
user@host:/home/user/docker-series/openjdk8_212_mysql8$ docker-compose up --build
user@host:/home/user/docker-series/openjdk8_212_mysql8$ [Ctrl+C]
user@host:/home/user/docker-series/openjdk8_212_mysql8$ docker-compose start
user@host:/home/user/docker-series/openjdk8_212_mysql8$ docker-compose ps
</pre>

Result
<pre>
     Name                   Command             State                          Ports                       
-----------------------------------------------------------------------------------------------------------
mysql-80-to-jdk   docker-entrypoint.sh mysqld   Up      0.0.0.0:3706->3306/tcp,:::3706->3306/tcp, 33060/tcp
openjdk-8u212     bash                          Up      0.0.0.0:31890->31890/tcp,:::31890->31890/tcp       
</pre>

7- Test the sample application
<pre>
Request:
GET http://{IP-ADDRESS}:31890/api/simple-api-demo

Response: 
OK, it is working fine !
</pre>
