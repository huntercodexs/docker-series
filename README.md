
# NGINX + REVERSE PROXY + PYTHON

Dockerized project using Nginx Reverse Proxy and PYTHON

-----------------

# Requisites

- Nginx
- Python
- Postman
- Shell Script
- ** Linux Knowledge

-----------------

# About

This branch set up the environment to run NGINX as Webserver with reverse proxy to contact PYTHON microservices, below can 
see the diagram that explain with more details:

> NOTE: Using docker is not possible execute systemctl as a service manager, so give a look in th file 
> nginx_reverse_proxy_python/applications/applications-deploy.sh and see with more details this issue.

-----------------

# How to use

> CONFIGURATION

- Before build and start project set the following files configurations:

<pre>
- nginx.conf (nginx_reverse_proxy_python/etc/nginx/nginx.conf)
- reverse-proxy-python-server.conf (nginx_reverse_proxy_python/etc/nginx/conf/reverse-proxy-python-server.conf)
- reverse-proxy-python.log (nginx_reverse_proxy_python/etc/nginx/logs/reverse-proxy-python.log)
</pre>

> SERVICES

- Before build and start project set the microservices in script below

<pre>
- applications-deploy.sh (nginx_reverse_proxy_python/microservices/applications-deploy.sh)
</pre>


> RUN AND TEST

- Access the folder path in this project to run nginx_reverse_proxy_python, as below:

<pre>
$ git clone https://github.com/huntercodexs/docker-series.git .
$ git checkout nginx_reverse_proxy_python
$ cd nginx_reverse_proxy_python
$ docker-compose up --build (in first time)
$ docker-compose start (in others case)
</pre>

- Run the microservices in nginx_uwsgi_python container

<pre>
$ docker exec -it nginx_uwsgi_python /bin/bash
</pre>

<pre>
root@25f8c997da0a:/home/python/applications# applications-deploy
</pre>

- Access and test - API

<pre>
[GET] http://${WEBSERVER_IP_ADDRESS}:38085/app1/
[GET] http://${WEBSERVER_IP_ADDRESS}:38085/app2/
</pre>

> Use the postman file to make a tests above: "PYTHON - NGINX REVERSE PROXY.postman_collection.json"

-----------------
# About NGINX

- Content
<pre>
/var/www/html: The actual web content, which by default only consists of the default Nginx page you saw earlier, 
is served out of the /var/www/html directory. This can be changed by altering Nginx configuration files.
</pre>

- Server Configuration
<pre>
/etc/nginx: The Nginx configuration directory. All of the Nginx configuration files reside here.

/etc/nginx/nginx.conf: The main Nginx configuration file. This can be modified to make changes to the Nginx global configuration.

/etc/nginx/sites-available/: The directory where per-site server blocks can be stored. Nginx will not use the configuration files found in this directory unless they are linked to the sites-enabled directory. Typically, all server block configuration is done in this directory, and then enabled by linking to the other directory.

/etc/nginx/sites-enabled/: The directory where enabled per-site server blocks are stored. Typically, these are created by linking to configuration files found in the sites-available directory.

/etc/nginx/snippets: This directory contains configuration fragments that can be included elsewhere in the Nginx configuration. Potentially repeatable configuration segments are good candidates for refactoring into snippets.
</pre>

- Server Logs
<pre>
/var/log/nginx/access.log: Every request to your web server is recorded in this log file unless Nginx is configured to do otherwise.
/var/log/nginx/error.log: Any Nginx errors will be recorded in this log.
</pre>
