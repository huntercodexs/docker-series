# JENKINS 2.60.3

> BUILD jenkins-2-60-3

<pre>
git clone https://github.com/huntercodexs/docker-series.git .
cd self-containers/jenkins/2.60.3
docker-compose up --build jenkins-2-60-3
docker-compose start jenkins-2-60-3
</pre>

> AFTER BUILD

- Check if jenkins is running

- Access the jenkins container

<pre>
docker exec -it jenkins-2-60-3 /bin/bash
</pre>

- Run jenkins in a first time to initiate configuration

<pre>
$ jenkins
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

- Open the web browser and start the configuration

<pre>
http://${WEBSERVER_ADDRESS}:39090
** Inform the password generated previously (501552fb90ee40fd80a18b94615491e3) **
</pre>

- Install plugins

<pre>
Suggested plugins or Select one by one
** Getting Started Screen **
</pre>

- Create the first user

- Instance Settings

<pre>
Jenkins URL: http://${WEBSERVER_ADDRESS}:38090/

** You have skipped the setup of an admin user. **
** To log in, use the username: "admin" and the administrator password you used to access the setup wizard. **
</pre>

> https://hub.docker.com/_/jenkins
