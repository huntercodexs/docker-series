# MAILHOG

- To run mailhog from this project use

<pre>
git clone https://github.com/huntercodexs/docker-series.git .
cd self-containers/mailhog
docker-compose up --build (in first time)
docker-compose start (in next times)
</pre>

# Details

- To make access in the MailHog Http Webserver

<pre>
http://${MAIL_SERVER_IP}:${MAILHOG_PORT}

[Example]
http://localhost:38085
</pre>

- To use MailHog as Mail Server Tests

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
spring.mail.properties.mail.smtp.socketFactory.port=1025
spring.mail.properties.mail.smtp.socketFactory.class=javax.net.ssl.SSLSocketFactory
</pre>