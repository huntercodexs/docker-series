# MAILHOG

- How to run mailhog from this project use

<pre>
user@host:/home/user$ git clone https://github.com/huntercodexs/docker-series.git .
user@host:/home/user$ cd docker-series/self-containers/mailhog
user@host:/home/user/docker-series/self-containers/mailhog$ docker-compose up --build (in first time)
user@host:/home/user/docker-series/self-containers/mailhog$ docker-compose start (in the next times)
docker-compose start (in next times)
</pre>

# Details

- How to make access in the MailHog Http Webserver

<pre>
http://${MAIL_SERVER_IP}:${MAILHOG_PORT}

[Example]
http://${WEBSERVER-ADDRESS-IP}:38025 (mailhog)
http://${WEBSERVER-ADDRESS-IP}:48025 (mailhog-ubuntu2004)
</pre>

- How to use MailHog as Mail Server Tests

<pre>
[SMTP HOST]
${MAIL_SERVER_IP}

[SMTP PORT]
${MAILHOG_SMTP_PORT}

[Example (Java Mail Sender)]
spring.mail.host=localhost
spring.mail.port=31025
spring.mail.username=huntercodexs@mail.com
spring.mail.password=
spring.mail.properties.mail.smtp.auth=false
spring.mail.properties.mail.smtp.starttls.enable=true
spring.mail.properties.mail.smtp.connectiontimeout=5000
spring.mail.properties.mail.smtp.timeout=5000
spring.mail.properties.mail.smtp.writetimeout=5000
spring.mail.properties.mail.smtp.socketFactory.port=31025
spring.mail.properties.mail.smtp.socketFactory.class=javax.net.ssl.SSLSocketFactory
</pre>