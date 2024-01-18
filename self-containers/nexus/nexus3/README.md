# NEXUS 3

- How to run nexus3 from this project use

<pre>
user@host:/home/user$ git clone https://github.com/huntercodexs/docker-series.git .
user@host:/home/user$ cd docker-series/self-containers/nexus/nexus3
user@host:/home/user/docker-series/self-containers/nexus/nexus3$ docker network create open_network
user@host:/home/user/docker-series/self-containers/nexus/nexus3$ docker-compose up --build
user@host:/home/user/docker-series/self-containers/nexus/nexus3$ docker-compose start
</pre>

- How to access Sonatype Nexus Repository Manager

Access the url
<pre>
http://192.168.0.204:38081
</pre>

Inform the current user and password
<pre>
user: admin
password: (see in the file ./nexus-data/admin.password to first login and then change it)
</pre>

Follow the Setup steps from wizard clicking int the Next button, inform a new password and click in Next
