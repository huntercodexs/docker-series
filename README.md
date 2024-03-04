# RPM DEBIAN CONVERTER
Create a rpm and debian packages quickly


# Information

Please use the branch selector to access others environment configurations


# How to use

- Clone this project from GitHub

<pre>
user@host:/home/user$ git clone https://github.com/huntercodexs/docker-series.git .
user@host:/home/user$ cd docker-series
user@host:/home/user/docker-series$ git checkout rpm_debian_converter
user@host:/home/user/docker-series$ cd rpm_debian_converter/
user@host:/home/user/docker-series/rpm_debian_converter$ docker network create open_network
user@host:/home/user/docker-series/rpm_debian_converter$ docker-compose up --build
user@host:/home/user/docker-series/rpm_debian_converter$ [Ctrl+C]
user@host:/home/user/docker-series/rpm_debian_converter$ docker-compose start
user@host:/home/user/docker-series/rpm_debian_converter$ docker-compose ps
</pre>

- Result should be

<pre>
        Name            Command    State                                                                Ports                                                              
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------
rpm_debian_converter   /bin/bash   Up      0.0.0.0:38989->38989/tcp,:::38989->38989/tcp, 0.0.0.0:38000->80/tcp,:::38000->80/tcp, 0.0.0.0:38080->8080/tcp,:::38080->8080/tcp
</pre>

- Get DEBIAN package from RPM
<pre>
user@host:/home/user/docker-series/rpm_debian_converter$ docker exec -it rpm_debian_converter bash converter.sh deb ${FILENAME}
</pre>

- Get RPM package from DEBIAN
<pre>
user@host:/home/user/docker-series/rpm_debian_converter$ docker exec -it rpm_debian_converter bash converter.sh deb ${FILENAME}
</pre>
