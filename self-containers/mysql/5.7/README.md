# MYSQL 5.7

- How to run mysql 5.7 from this project use

<pre>
user@host:/home/user$ git clone https://github.com/huntercodexs/docker-series.git .
user@host:/home/user$ cd docker-series/self-containers/mysql/5.7
user@host:/home/user/docker-series/self-containers/mysql/5.7$ docker-compose up --build
user@host:/home/user/docker-series/self-containers/mysql/5.7$ [Ctrl+C]
user@host:/home/user/docker-series/self-containers/mysql/5.7$ docker-compose start
</pre>

- Set up the .env file as below
<pre>
##############################################################################
#### MYSQL 5.7 SETTINGS
##############################################################################

# Set the port to MYSQL 5
MYSQL57_PORT=3357

# Set database access
MYSQL57_DATABASE=database
MYSQL57_USERNAME=root
MYSQL57_PASSWORD=root123
MYSQL57_ROOT_PASSWORD=root123
</pre>

- Access the database

<pre>
server: 192.168.0.204
port: 3705
user: root
pass: root123
</pre>