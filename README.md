# NGINX + REVERSE PROXY + PYTHON + UWSGI (SERVICE) + RESTRICT SERVER
Dockerized project using Nginx Reverse Proxy and PYTHON

![banner.png](nginx_reverse_proxy_python_wsgi/files/media/banner.png)

> IMPORTANT: Check the sample service in the path files/sample/app1-sample-unix-socket-nginx.zip, it can be used to get
> more details about the UNIX SOCKET protocol and understand in the better way how to use this resource

> NOTE: This project can be used in production and development environment without issues big troubles, just ensure and have
> careful with the configuration and the target infrastructure, because one of the NGINX server should be protected by an
> internal LAN.

# Requisites

- Nginx
- Python
- Postman
- Shell Script


# Step by Step

Follow the steps below to quick and easy environment creation

> This step by step uses two applications as example, but you can use how applications you need

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
user@host:/home/user/docker-series$ git checkout nginx_reverse_proxy_python_wsgi
</pre>

4- Access the nginx_reverse_proxy_python_wsgi folder
<pre>
user@host:/home/user/docker-series$ cd nginx_reverse_proxy_python_wsgi
</pre>

5- Check and set up the .env file
<pre>
NGINX_PORT=38085
RESTRICT_SERVER_IP=${RESTRICT_SERVER_IP}
</pre>

6- Configure the nginx file in the nginx-reverse-proxy folder, by example:

nginx-reverse-proxy/conf.d/reverse-proxy.conf
<pre>
server {
    listen 85;
    server_name nginx_reverse_proxy_python_wsgi nginx_reverse_proxy_python_wsgi.local;
    include proxy.conf;

    # [GET] http://localhost:38085/app1/
    location /app1/ {
        # [GET] http://{RESTRICT-SERVER-IP}:80/app1/api/welcome/
        proxy_pass http://{RESTRICT-SERVER-IP}:80/app1/api/welcome/;
    }

    # [GET] http://localhost:38085/app2/
    location /app2/ {
        # [GET] http://{RESTRICT-SERVER-IP}:80/app2/api/welcome/
        proxy_pass http://{RESTRICT-SERVER-IP}:80/app2/api/welcome/;
    }
}
</pre>

7- Configure the nginx file in the nginx-reverse-proxy folder, by example:

nginx-reverse-proxy/sites-available/applications-server
<pre>
server {
    listen 85;
    server_name nginx_reverse_proxy_python_wsgi nginx_reverse_proxy_python_wsgi.local;
    include proxy.conf;

    location /app1/ {
        proxy_pass http://{RESTRICT-SERVER-IP}:80/app1/api/welcome/;
    }

    location /app2/ {
        proxy_pass http://{RESTRICT-SERVER-IP}:80/app2/api/welcome/;
    }
}
</pre>

8- Configure the nginx file in the restrict-server folder, by example:

restrict-server/nginx/conf.d/applications.conf
<pre>
server {
    listen 80;
    server_name nginx_python_wsgi nginx_python_wsgi.local;
    include proxy.conf;

    # [GET] http://{RESTRICT-SERVER-IP}:80/app1/api/welcome/
    location /app1/api/welcome/ {
        proxy_pass http://unix:{APPS_PATH}/app1/app1.sock;
    }

    # [GET] http://{RESTRICT-SERVER-IP}:80/app2/api/welcome/
    location /app2/api/welcome/ {
        proxy_pass http://unix:{APPS_PATH}/app2/app2.sock;
    }
}
</pre>

9- Put the python applications in the correct folder
<pre>
nginx_reverse_proxy_python_wsgi/restrict-server/applications/{APP_NAME}
</pre>

10- Configure the services files, by example:

nginx_reverse_proxy_python_wsgi/restrict-server/applications/app1/app1.service
<pre>
[Unit]
Description=Gunicorn instance to serve App1
After=network.target

[Service]
User={USER}
Group={USER}
WorkingDirectory={APPS_PATH}/app1
Environment="PATH={APPS_PATH}/app1/.app1env/bin"
ExecStart={APPS_PATH}/app1/.app1env/bin/gunicorn --workers 3 --bind unix:{APP_NAME}.sock -m 007 wsgi:app

[Install]
WantedBy=multi-user.target
</pre>

11- Install the container and applications

<pre>    
user@host:/home/user/docker-series/nginx_reverse_proxy_python_wsgi$ ./install.sh
</pre>

Make sure that the result look like this
<pre>
user@host:/home/user/docker-series/nginx_reverse_proxy_python_wsgi$ docker-compose ps
       Name                      Command               State                       Ports                     
-------------------------------------------------------------------------------------------------------------
nginx-reverse-proxy   /docker-entrypoint.sh ngin ...   Up      80/tcp, 0.0.0.0:38085->85/tcp,:::38085->85/tcp 
</pre>

12- Access and test - APIs
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

