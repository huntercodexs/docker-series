# SONARQUBE

- How to run sonarqube from this project use

<pre>
user@host:/home/user$ git clone https://github.com/huntercodexs/docker-series.git .
user@host:/home/user$ cd docker-series/self-containers/sonar
user@host:/home/user/docker-series/self-containers/sonar$ docker-compose up --build
user@host:/home/user/docker-series/self-containers/sonar$ docker-compose start
</pre>

## Plugins

- Vulnerabilities checking

> Releases: github.com/dependency-check/dependency-check-sonar-plugin/releases

[Example]
https://github.com/dependency-check/dependency-check-sonar-plugin/releases/download/5.0.0/sonar-dependency-check-plugin-5.0.0.jar

## Access

http://localhost:39000
<pre>
Login: admin
Password: admin
</pre>

## Troubleshooting

If any problem occurs when you try to run this container check the memory limit and try to fix this problem 
using the following command

<pre>
sysctl -w vm.max_map_count=524288
sysctl -w fs.file-max=131072
ulimit -n 131072
ulimit -u 8192
</pre>