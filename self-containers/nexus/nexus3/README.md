# NEXUS 3

- How to run nexus3 from this project use

<pre>
git clone https://github.com/huntercodexs/docker-series.git .
cd self-containers/nexus/nexus3
docker-compose up --build (in first time)
docker network create open_network (IF NETWORK ERROR)
docker-compose start (in the next times)
</pre>

- How to access Sonatype Nexus Repository Manager

Access the url
<pre>
http://192.168.0.174:38081
</pre>

Inform the current user and password
<pre>
user: admin
password: (see in the file ./nexus-data/admin.password to first login and then change it)
</pre>

Follow the Setup steps from wizard clicking int the Next button, inform a new password and click in Next
