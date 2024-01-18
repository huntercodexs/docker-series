# JENKINS 2.346.3

- How to run jenkins 2.346.3 from this project use

<pre>
user@host:/home/user$ git clone https://github.com/huntercodexs/docker-series.git .
user@host:/home/user$ cd docker-series/self-containers/jenkins/2.346.3
user@host:/home/user/docker-series/self-containers/jenkins/2.346.3$ docker-compose up --build
user@host:/home/user/docker-series/self-containers/jenkins/2.346.3$ docker-compose start
</pre>

# Step by Step

Follow the steps below to quick and easy environment creation

1- Clone the repository
<pre>
user@host:/home/user$ git clone https://github.com/huntercodexs/docker-series.git .
</pre>

2- Access the repository folder
<pre>
user@host:/home/user$ cd docker-series
</pre>

3- Access the jenkins folder
<pre>
user@host:/home/user/docker-series$ cd self-containers/jenkins/2.346.3
</pre>

4- Check and set up the .env file

5- Build the containers
<pre>    
user@host:/home/user/docker-series/jenkins/2.346.3$ docker network create open_network
user@host:/home/user/docker-series/jenkins/2.346.3$ docker-compose up --build
</pre>

6- Check if jenkins is running and access the container
<pre>
user@host:/home/user/docker-series/jenkins/2.346.3$ docker exec -it jenkins /bin/bash
</pre>

7- Run jenkins in a first time to initiate configuration

> NOTE: If occurs any error please ignore it

<pre>
$ jenkins
</pre>

See the screen where jenkins is running to get the password generated (look like as bellow)
<pre>
2022-08-16 17:39:54.591+0000 [id=36]	INFO	jenkins.install.SetupWizard#init: 

*************************************************************
*************************************************************
*************************************************************

Jenkins initial setup is required. An admin user has been created and a password generated.
Please use the following password to proceed to installation:

501552fb90ee40fd80a18b94615491e3

This may also be found at: /root/.jenkins/secrets/initialAdminPassword

*************************************************************
*************************************************************
*************************************************************
</pre>

8- Open the web browser and start the configuration

<pre>
http://${WEBSERVER_ADDRESS}:39090
** Inform the password generated previously (501552fb90ee40fd80a18b94615491e3) **
</pre>

9- Install plugins

<pre>
Suggested plugins or Select one by one
** Getting Started Screen **
</pre>

10- Create the first user
<pre>
Username: admin
Password: admin
Name: Administrator
Email: admin@email.com
</pre>

11- Test Instance Settings

<pre>
Jenkins URL: http://${WEBSERVER_ADDRESS}:39090/

** You have skipped the setup of an admin user. **
** To log in, use the username: "admin" and the administrator password you used to access the setup wizard. **
</pre>

12- Login
<pre>
http://localhost:39090/login
</pre>


# Documentation and Support

> https://hub.docker.com/_/jenkins

> https://www.cloudbees.com/blog/how-to-install-and-run-jenkins-with-docker-compose
