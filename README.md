
# NGINX WITH REVERSE PROXY

Dockerized project using Nginx server

-----------------

# About

This branch set up the environment to run NGINX as Webserver with internal reverse proxy, below can see the diagram that 
explain with more details:

![img.png](nginx_reverse_proxy/files/media/NGINX-REVERSE-PROXY-SAMPLE.png)

-----------------

# How to use

- Before build and start project set the following files configurations:

<pre>
- nginx.conf (nginx_reverse_proxy/etc/nginx/nginx.conf)
- nginx.conf (nginx_reverse_proxy/etc/nginx/conf/public-server.conf)
- nginx.conf (nginx_reverse_proxy/etc/nginx/conf/private-server.conf)
</pre>

- Access the folder path in this project to run php8 together nginx, as below:

<pre>
$ git clone https://github.com/huntercodexs/docker-series.git .
$ git checkout nginx_reverse_proxy
$ cd nginx_reverse_proxy
$ docker-compose up --build (in first time)
$ docker-compose start (in others case)
</pre>

- Access and test

<pre>
http://192.168.0.174:38085
http://192.168.0.174:38085/pages/
http://192.168.0.174:38085/page/1/
http://192.168.0.174:38085/page/2/
http://192.168.0.174:38085/page/3/
</pre>

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
