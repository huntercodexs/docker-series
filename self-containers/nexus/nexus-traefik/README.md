# NEXUS + LETS ENCRYPT + TRAEFIK

- How to run nexus3 with traefik from this project use

<pre>
user@host:/home/user$ git clone https://github.com/huntercodexs/docker-series.git .
user@host:/home/user$ cd docker-series/self-containers/nexus/nexus-traefik
user@host:/home/user/docker-series/self-containers/nexus/nexus-traefik$ docker network create open_network
user@host:/home/user/docker-series/self-containers/nexus/nexus-traefik$ docker-compose up --build
user@host:/home/user/docker-series/self-containers/nexus/nexus-traefik$ docker-compose start
</pre>
