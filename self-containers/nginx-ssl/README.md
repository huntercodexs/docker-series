# Nginx + SSL

- How to run nginx-ssl from this project use

<pre>
user@server: git clone https://github.com/huntercodexs/docker-series.git .
user@server: cd self-containers/nginx-ssl
user@server: docker-compose up --build (in first time)
user@server: docker network create open_network (if network error)
user@server: docker-compose start (in the next times)
</pre>

- Create a SSL CA

<pre>
user@server: docker exec -it nginx-ssl /bin/bash
</pre>

<pre>
root@d8cd7de07835: cd /etc/nginx/ssl
root@d8cd7de07835: openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/nginx/ssl/huntercodexs.key -out /etc/nginx/ssl/huntercodexs.crt
</pre>

Example

<pre>
Generating a RSA private key
...........................................................................................................+++++
...............................................................................................+++++
writing new private key to '/etc/nginx/ssl/huntercodexs.key'
-----
You are about to be asked to enter information that will be incorporated
into your certificate request.
What you are about to enter is what is called a Distinguished Name or a DN.
There are quite a few fields but you can leave some blank
For some fields there will be a default value,
If you enter '.', the field will be left blank.
-----
Country Name (2 letter code) [AU]:BR
State or Province Name (full name) [Some-State]:Sao Paulo
Locality Name (eg, city) []:Taubate
Organization Name (eg, company) [Internet Widgits Pty Ltd]:Huntercodexs
Organizational Unit Name (eg, section) []:Software
Common Name (e.g. server FQDN or YOUR name) []:huntercodexs.com
Email Address []:huntercodexs@gmail.com
</pre>

Get the certificate generated

<pre>
root@d8cd7de07835:/etc/nginx/ssl# ls -ltr
total 8
-rw------- 1 root root 1708 Mar 26 23:15 huntercodexs.key
-rw-r--r-- 1 root root 1566 Mar 26 23:18 huntercodexs.crt
</pre>

Configure Nginx

<pre>
    server_name huntercodexs.com;
	listen 443 ssl default_server;
	listen [::]:443 ssl default_server;
	ssl_certificate /etc/nginx/ssl/huntercodexs.crt;
	ssl_certificate_key /etc/nginx/ssl/nginx.key;
</pre>

Restart Nginx

<pre>
service nginx restart
</pre>
