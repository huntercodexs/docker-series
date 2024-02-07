# ARTIFACTORY 7.77.3 (by REDHAT)

> NOTE: At moment the port 8081 is not be working well

- How to run artifactory 7.77.3-redhat by Ubuntu 22.04 from this project use

<pre>
user@host:/home/user$ git clone https://github.com/huntercodexs/docker-series.git .
user@host:/home/user$ cd docker-series/self-containers/java/artifactory/7.77.3-redhat
user@host:/home/user/docker-series/self-containers/java/artifactory/7.77.3-redhat$ docker network create open_network
user@host:/home/user/docker-series/self-containers/java/artifactory/7.77.3-redhat$ docker-compose up --build
user@host:/home/user/docker-series/self-containers/java/artifactory/7.77.3-redhat$ docker-compose start
</pre>

The expected result should be like below

![jfrog-artifactory-result.png](media/jfrog-artifactory-result.png)

- Access

<pre>
http://localhost:38082
</pre>

You will be redirected to http://localhost:38082/ui/login

![jfrog-artifactory-login.png](media/jfrog-artifactory-login.png)

- Login

<pre>
Username: admin
Password: password
</pre>

- Configure

Below is the first screen that will be presented for us after login (click em Get Started)

![jfrog-artifactory-configure-1.png](media/jfrog-artifactory-configure-1.png)

Now, you need define or reset a ADMIN password according image below

![jfrog-artifactory-configure-2.png](media/jfrog-artifactory-configure-2.png)

The next screen can be skipped (click in Skip button)

![jfrog-artifactory-configure-3.png](media/jfrog-artifactory-configure-3.png)

After that you can see the Welcome page from Artifactory

![jfrog-artifactory-welcome.png](media/jfrog-artifactory-welcome.png)

- Execute

To execute Artifactory manually

<pre>
/bin/bash /home/artifactory/artifactory-oss-7.77.3-redhat/app/bin/artifactory.sh
</pre>

- Log

<pre>
tail -f /var/opt/jfrog/artifactory/log/artifactory-service.log
</pre>
