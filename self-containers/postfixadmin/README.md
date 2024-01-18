# POSTFIX ADMIN

> NOTE: Set the ./config/config.local.php before run this project

- How to run postfixadmin from this project use

<pre>
user@host:/home/user$ git clone https://github.com/huntercodexs/docker-series.git .
user@host:/home/user$ cd docker-series/self-containers/postfixadmin
user@host:/home/user/docker-series/self-containers/postfixadmin$ docker-compose up --build
user@host:/home/user/docker-series/self-containers/postfixadmin$ docker-compose start
user@host:/home/user/docker-series/self-containers/postfixadmin$ docker exec -u rpmuser -it postfixadmin /bin/bash
</pre>

- How to configure the Postfix Admin in the first time

After "docker-compose up --build", access the Postfix via Web Browser

<pre>
http://localhost:38080, http://example.com/38080, http://192.168.0.204:38080
</pre>

You should be redirected to /login.php, but is not done yet, so put in the URL an uri /setup.php 

<pre>
http://localhost:38080/setup.php, http://example.com/38080/setup.php, http://192.168.0.204:38080/setup.php
</pre>

In this point you can "Generate setup_password" or "Login with setup_password", but before you needed has been a 
correct password to create an Administrator Account, and put it inside the .env dot file or in config.local.php.

- Login with setup_password

Put your password and click in Login, before you will be redirected to another step where you can create an Administrator 
Account in "Add Superadmin Account"

<pre>
- Put the current "Setup password"
    (try 123mudar$)
- Put the Administrador Email 
    (try admin@email.com)
- Create a Password to Administrador Account 
    (try 123mudar$)
</pre>

After these configurations you can access /login.php in the root path from the installation /var/www/html into Postfix

<pre>
http://localhost:38080/login.php, http://example.com/38080/login.php, http://192.168.0.204:38080/login.php
</pre>

Put your credentials to Administrator Account and click in Sign/Enter

***Welcome to Postfix Admin Panel***

- How to make access in the POSTFIX ADMIN Webserver

<pre>
http://${MAIL_SERVER_IP}:${POSTFIXADMIN_PORT}

[Example]
http://${WEBSERVER-ADDRESS-IP}:38080 (postfixadmin)
</pre>

- How to use Postfix Admin as Mail Server Tests

<pre>
[SMTP HOST]
${MAIL_SERVER_IP}

[SMTP PORT]
${POSTFIXADMIN_SMTP_PORT}

[Example (Java Mail Sender)]
spring.mail.host=localhost
spring.mail.port=30025
spring.mail.username=huntercodexs@mail.com
spring.mail.password=
spring.mail.properties.mail.smtp.auth=false
spring.mail.properties.mail.smtp.starttls.enable=true
spring.mail.properties.mail.smtp.connectiontimeout=5000
spring.mail.properties.mail.smtp.timeout=5000
spring.mail.properties.mail.smtp.writetimeout=5000
spring.mail.properties.mail.smtp.socketFactory.port=30025
spring.mail.properties.mail.smtp.socketFactory.class=javax.net.ssl.SSLSocketFactory
</pre>