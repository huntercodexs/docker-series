
# APACHE2 + PHP8
Docker Series - A project to work with many docker container

-------------------

# Information

Please use the branch selection to access others environment configurations

-------------------

# Dockers Configurations Contained

- Ubuntu/Apache2
- PHP-8.0

-------------------

# How to use

- Clone this project from GitHub

<pre>
user@host$ git clone https://github.com/huntercodexs/docker-series.git .
user@host$ git checkout apache2_php8
user@host$ cd apache2_php8/
user@host$ docker-compose up --build (in first time)
user@host$ docker-compose start (in others case)
</pre>

- Set up the apache2 server configurations (see more details in docker-compose.yml)

<pre>
app.local.conf
</pre>

-------------------
