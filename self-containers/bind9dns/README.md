# BIND9 + DNS UTILS
This project is useful to test a complete environment web using DNS redirects

- How to run bind9dns from this project use

<pre>
user@host: git clone https://github.com/huntercodexs/docker-series.git .
user@host: cd self-containers/bind9dns
user@host: docker network create open_network
user@host: docker-compose up --build (in first time)
user@host: docker-compose start (in the next times)
</pre>

