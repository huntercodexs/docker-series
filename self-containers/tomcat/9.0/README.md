# TOMCAT 9.0

- How to run tomcat 9.0 from this project use

<pre>
user@host:/home/user$ git clone https://github.com/huntercodexs/docker-series.git .
user@host:/home/user$ cd docker-series/self-containers/tomcat/9.0
user@host:/home/user/docker-series/self-containers/tomcat/9.0$ docker-compose up --build
user@host:/home/user/docker-series/self-containers/tomcat/9.0$ docker-compose start
</pre>

## HotFix

<pre>
user:host/tomcat/9.0$ docker exec -it tomcat /bin/bash
root@5ad6bad8dfe8:/usr/local/tomcat# ls -ltr
total 160
drwxr-xr-x 7 root   root    4096 Oct  3 19:44 webapps
-rw-r--r-- 1 root   root   16538 Oct  3 19:44 RUNNING.txt
-rw-r--r-- 1 root   root    6901 Oct  3 19:44 RELEASE-NOTES
-rw-r--r-- 1 root   root    3283 Oct  3 19:44 README.md
-rw-r--r-- 1 root   root    2333 Oct  3 19:44 NOTICE
-rw-r--r-- 1 root   root   57092 Oct  3 19:44 LICENSE
-rw-r--r-- 1 root   root    6166 Oct  3 19:44 CONTRIBUTING.md
-rw-r--r-- 1 root   root   20913 Oct  3 19:44 BUILDING.txt
drwxr-xr-x 2 root   root    4096 Oct 24 01:58 webapps2
drwxrwxrwt 2 root   root    4096 Oct 24 01:58 temp
drwxr-xr-x 2 root   root    4096 Oct 24 01:58 lib
drwxr-xr-x 2 root   root    4096 Oct 24 01:59 native-jni-lib
drwxr-xr-x 2 root   root    4096 Oct 24 01:59 bin
drwxrwxrwx 3 ubuntu ubuntu  4096 Nov  8 12:49 conf
drwxrwxrwt 1 root   root    4096 Nov  8 12:49 logs
drwxrwxrwt 1 root   root    4096 Nov  8 12:59 work
root@5ad6bad8dfe8:/usr/local/tomcat# mv webapps webapps2
root@5ad6bad8dfe8:/usr/local/tomcat# mv webapps.dist/ webapps
</pre>