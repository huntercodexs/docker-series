# CERTIFICATION AUTHORITY


# Information

![ssl-project-demo.png](./certification_authority/midias/ssl-project-demo.png)


# How to use

Run the container

<pre>
user@host: docker-compose up --build (in first time)
user@host: docker-compose start (in the next time)
user@host: docker network create open_network (if required)
</pre>

Access the CA SERVER and execute the procedures below

<pre>
user@host: docker-compose start
user@host: docker exec -it caserver /bin/bash
</pre>

Get the ca.crt file in the CA SERVER

> Note: The docker-compose up --build will generate the ca.crt file automatically

<pre>
causer@caserver: ls /tmp/ca.crt
causer@caserver: cp /tmp/ca.crt /home/causer/share/easy-rsa/
</pre>

Copy the /share/caserver/easy-rsa/ca.crt to /share/nginx-ssl-1/ca.crt locally

Get access to NGINX SERVER

<pre>
user@host: docker exec -it nginx-ssl-server1 /bin/bash
</pre>

Put the ca.crt file in the folder and run the command

<pre>
nginx@nginx-ssl-server-1: cp /home/nginx/ca.crt /usr/local/share/ca-certificates/ca.crt
nginx@nginx-ssl-server-1: ls /usr/local/share/ca-certificates/
nginx@nginx-ssl-server-1: sudo update-ca-certificates
</pre>

Get the req file generated to copy into CA SERVER

<pre>
nginx@nginx-ssl-server-1: cp /tmp/$NGINX_SSL_1_COMMON_NAME.req /home/nginx/
</pre>

Copy the /share/nginx-ssl-1/$NGINX_SSL_1_COMMON_NAME.req to /share/caserver/easy-rsa/$NGINX_SSL_1_COMMON_NAME.req locally

Get access to the folder easy-rsa on CA SERVER

<pre>
user@host: docker exec -it caserver /bin/bash
</pre>

<pre>
# access
causer@caserver: cd /home/causer/share/easy-rsa
causer@caserver: cp $NGINX_SSL_1_COMMON_NAME.req /tmp/$NGINX_SSL_1_COMMON_NAME.req

# import
causer@caserver: cd /home/causer/easy-rsa
causer@caserver: ./easyrsa import-req /tmp/$NGINX_SSL_1_COMMON_NAME.req $NGINX_SSL_1_COMMON_NAME

# asign
causer@caserver: ./easyrsa sign-req server $NGINX_SSL_1_COMMON_NAME

# resulted
causer@caserver: ls /home/causer/easy-rsa/pki/ca.crt
causer@caserver: ls /home/causer/easy-rsa/pki/issued/$NGINX_SSL_1_COMMON_NAME.crt

causer@caserver: cp /home/causer/easy-rsa/pki/ca.crt /home/causer/share/easy-rsa/
causer@caserver: cp /home/causer/easy-rsa/pki/issued/$NGINX_SSL_1_COMMON_NAME.crt /home/causer/share/easy-rsa/
</pre>

Copy the /share/caserver/easy-rsa/ca.crt to /share/nginx-ssl-1/ca.crt to locally
Copy the /share/caserver/easy-rsa/$NGINX_SSL_1_COMMON_NAME.crt to /share/nginx-ssl-1/$NGINX_SSL_1_COMMON_NAME.crt to locally

Set up the webserver (NGINX)

<pre>
user@host: docker exec -it nginx-ssl-server1 /bin/bash
</pre>

<pre>
causer@caserver: su nginx
causer@caserver: cp /home/nginx/ca.crt /etc/nginx/ssl/
causer@caserver: cp /home/nginx/$NGINX_SSL_1_COMMON_NAME.crt /etc/nginx/ssl/
causer@caserver: cp /tmp/$NGINX_SSL_1_COMMON_NAME.key /etc/nginx/ssl/
causer@caserver: cd /etc/nginx/ssl/
causer@caserver: cat /etc/nginx/ssl/$NGINX_SSL_1_COMMON_NAME.crt /etc/nginx/ssl/ca.crt >> /etc/nginx/ssl/$NGINX_SSL_1_COMMON_NAME.chained.crt
causer@caserver: chmod 755 -R /etc/nginx/ssl/
</pre>

Set up the NGINX Server

<pre>

local path: /certification_authority/nginx-ssl-server-1/sites-enabled/$NGINX_SSL_1_COMMON_NAME

server {
    listen 443;
    listen [::]:443;
    server_name $NGINX_SSL_1_COMMON_NAME;
    client_max_body_size 20M;

    #uncomment these line
    #ssl on;
    #ssl_certificate /etc/nginx/ssl/$NGINX_SSL_1_COMMON_NAME.chained.crt;
    #ssl_certificate_key /etc/nginx/ssl/$NGINX_SSL_1_COMMON_NAME.key;
    #ssl_protocols TLSv1 TLSv1.1 TLSv1.2; 
    #ssl_prefer_server_ciphers on;
    #ssl_ciphers 'EECDH+AESGCM:EDH+AESGCM:AES256+EECDH:AES256+EDH';
}

nginx@nginx-ssl-server-1: nginx -t
nginx@nginx-ssl-server-1: sudo service nginx restart
</pre>

<pre>
user@host: docker-compose stop
user@host: docker-compose start
user@host: docker-compose ps
</pre>

Edit the /etc/hosts

<pre>
{IP-ADDRESS}	{DOMAIN-NAME} #Example: huntercodexs.local
</pre>

Get access to app running in NGINX

<pre>
https://{ADDRESS}:{PORT}
</pre>

If needed revoke the CA use

<pre>
user@host: docker exec -it caserver /bin/bash
causer@caserver: cd /home/causer/easy-rsa
causer@caserver: ./easyrsa revoke $NGINX_SSL_1_COMMON_NAME
</pre>

