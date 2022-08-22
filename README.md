
# NGINX + REVERSE PROXY + JAVA

Dockerized project using Nginx Reverse Proxy and JAVA

-----------------

# About

This branch set up the environment to run NGINX as Webserver with reverse proxy to contact JAVA microservices, below can 
see the diagram that explain with more details:

![img.png](nginx_reverse_proxy_java/files/media/NGINX-REVERSE-PROXY-JAVA-SAMPLE.png)

-----------------

# How to use

- Before build and start project set the following files configurations:

<pre>
- nginx.conf (nginx_reverse_proxy_java/etc/nginx/nginx.conf)
- reverse-proxy-ms-java-server.conf (nginx_reverse_proxy_java/etc/nginx/conf/reverse-proxy-ms-java-server.conf)
- reverse-proxy-java.log (nginx_reverse_proxy_java/etc/nginx/logs/reverse-proxy-java.log)
</pre>

- Access the folder path in this project to run php8 together nginx, as below:

<pre>
$ git clone https://github.com/huntercodexs/docker-series.git .
$ git checkout nginx_reverse_proxy_java
$ cd nginx_reverse_proxy_java
$ docker-compose up --build (in first time)
$ docker-compose start (in others case)
</pre>

- Access and test

<pre>
[GET] http://${WEBSERVER_IP_ADDRESS}:85/api/v1/users
[GET] http://${WEBSERVER_IP_ADDRESS}:85/api/v1/sales
[GET] http://${WEBSERVER_IP_ADDRESS}:85/api/v1/supplies
</pre>

> Use the postman file to make a tests above: NGINX-REVERSE-PROXY-JAVA.postman

> The microservices are placed in this project on folder microservices

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
