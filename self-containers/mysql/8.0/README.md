# MYSQL 8.0

- How to run mysql 8.0 from this project use

<pre>
user@host:/home/user$ git clone https://github.com/huntercodexs/docker-series.git .
user@host:/home/user$ cd docker-series/self-containers/mysql/8.0
user@host:/home/user/docker-series/self-containers/mysql/8.0$ docker-compose up --build
user@host:/home/user/docker-series/self-containers/mysql/8.0$ [Ctrl+C]
user@host:/home/user/docker-series/self-containers/mysql/8.0$ docker-compose start
</pre>

- Set up the .env file as below
<pre>
##############################################################################
#### MYSQL 8.0 SETTINGS
##############################################################################

# Set the port to MYSQL 8
MYSQL80_PORT=3708

# Set database access
MYSQL80_DATABASE=database
MYSQL80_USERNAME=root
MYSQL80_PASSWORD=root123
MYSQL80_ROOT_PASSWORD=root123
</pre>

- Access the database

<pre>
server: 192.168.0.204
port: 3708
user: root
pass: root123
</pre>