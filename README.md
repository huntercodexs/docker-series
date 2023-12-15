# NGINX + REVERSE PROXY + PYTHON
Dockerized project using Nginx Reverse Proxy and PYTHON

![banner.png](nginx_reverse_proxy_python/files/media/banner.png)


# Requisites

- Nginx
- Python
- Postman
- Shell Script


# About

This branch set up the environment to run NGINX as Webserver with reverse proxy to contact PYTHON applications, below can 
see the diagram that explain with more details:

> NOTE: Using docker is not possible execute systemctl as a service manager, so give a look in th file 
> nginx_reverse_proxy_python/applications/applications-deploy.sh and see with more details this issue.


# Usage

- Before build and start project set the following files configurations:

<pre>
- nginx.conf (./nginx_reverse_proxy_python/etc/nginx/nginx.conf)
- reverse-proxy-python-server.conf (./nginx_reverse_proxy_python/etc/nginx/conf/reverse-proxy-python-server.conf)
- reverse-proxy-python.log (./nginx_reverse_proxy_python/etc/nginx/logs/reverse-proxy-python.log)
</pre>

- Before build and start project set the python applications in script below

<pre>
- applications-deploy.sh (nginx_reverse_proxy_python/applications/applications-deploy.sh)
</pre>


- Access the folder path in this project to run nginx_reverse_proxy_python, as below:

<pre>
user@host:/home/user$ git clone https://github.com/huntercodexs/docker-series.git .
user@host:/home/user$ cd docker-series
user@host:/home/user/docker-series$ git checkout nginx_reverse_proxy_python
user@host:/home/user/docker-series$ cd nginx_reverse_proxy_python
user@host:/home/user/docker-series/nginx_reverse_proxy_python$ docker network create nginx_reverse_proxy_python_open_network
user@host:/home/user/docker-series/nginx_reverse_proxy_python$ docker-compose up --build (in first time)
user@host:/home/user/docker-series/nginx_reverse_proxy_python$ [Ctrl+C]
user@host:/home/user/docker-series/nginx_reverse_proxy_python$ docker-compose start (in the next times)
user@host:/home/user/docker-series/nginx_reverse_proxy_python$ docker-compose ps (check the containers status)
</pre>

- Run the applications in nginx_uwsgi_python container

> IMPORTANT NOTE: If the automatically deploy not work in the builder will be necessary run the command below 

<pre>
user@host:/home/user/docker-series/nginx_reverse_proxy_python$ docker exec -it nginx_uwsgi_python /bin/bash
root@25f8c997da0a:/home/python/applications# ./applications-deploy.sh
</pre>

# Step by Step

Follow the steps below to quick and easy environment creation

1- Clone the repository
<pre>
user@host:/home/user$ git clone https://github.com/huntercodexs/docker-series.git .
</pre>

2- Access the repository folder
<pre>
user@host:/home/user$ cd docker-series.git
</pre>

3- Change the current branch
<pre>
user@host:/home/user/docker-series$ git checkout nginx_reverse_proxy_python
</pre>

4- Access the nginx_reverse_proxy_python folder
<pre>
user@host:/home/user/docker-series$ cd nginx_reverse_proxy_python
</pre>

5- Check and set up the .env file

6- Build the containers

<pre>    
user@host:/home/user/docker-series/nginx_reverse_proxy_python$ docker network create nginx_reverse_proxy_python_open_network
user@host:/home/user/docker-series/nginx_reverse_proxy_python$ docker-compose up --build
</pre>

Make sure that the result look like this
<pre>
user@host:/home/user/docker-series/nginx_reverse_proxy_python$ docker-compose ps
    Name                   Command               State                       Ports                     
-------------------------------------------------------------------------------------------------------
</pre>

7- Access and test - APIs
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

> Use the postman file to make a tests above: "PYTHON - NGINX REVERSE PROXY.postman_collection.json"

