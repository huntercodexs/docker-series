
# HTTPD + PHP8 (USING DEDICATED CONTAINER)
Docker Series - A project to work with many docker container

-------------

# Information

Please use the branch selection to access others environment configurations

-------------

# Dockers Configurations Contained

- HTTPD
- PHP-FPM

-------------

# How to use


- Clone this project from GitHub

<pre>
user@host$ git clone https://github.com/huntercodexs/docker-series.git .
user@host$ git checkout httpd_php8_separated
user@host$ cd httpd_php8_separated/
user@host$ docker-compose up --build (in first time)
user@host$ docker-compose start (in others case)
</pre>

- Create a Network if needed

<pre>
docker network create open_network
</pre>

- Set up the apache2 server configurations (see more details in docker-compose.yml)

<pre>
app.local.conf
</pre>

- Access the webserver application

<pre>
http://${WEBSERVER_ADDRESS}:38080/app1/
http://${WEBSERVER_ADDRESS}:38080/app2/
</pre>

- Fix Bug

If occurs any problem or bug try to use the hints below: 

<pre>
# Server version: Apache/2.4.54 (Unix)
# Server built:   Jul 12 2022 04:31:28
#
# Execute the script "webserver.sh prepare" after docker-compose up -d
#   > docker exec -it webserver /bin/bash
#   > /home/apache2/webserver.sh prepare
# Edit the files in /httpd_php8_separated/webserver/conf/ in this project path [conf|htdocs]
#   > httpd.conf
#   > sites-available.conf
# Execute again the script "webserver.sh restart"
#   > /home/webserver/webserver.sh restart
# Restart apache service: "service webserver restart"
# Check if a2enmod is ok: "a2enmod rewrite"
# If needed check virtualhost name is ok: "a2ensite app.local.conf"
</pre>

-------------

