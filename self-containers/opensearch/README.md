# OPENSEARCH

- How to run opentelemety from this project use

<pre>
user@host:/home/user$ git clone https://github.com/huntercodexs/docker-series.git .
user@host:/home/user$ cd docker-series/self-containers/opentelemetry/opensearch
user@host:/home/user/docker-series/self-containers/opentelemetry$ docker-compose up --build
user@host:/home/user/docker-series/self-containers/opentelemetry$ docker-compose start
</pre>

- Access the application

http://localhost:5601

Username: admin (this is the initial username)
Password: (the same defined in the .env file: OPENSEARCH_INITIAL_ADMIN_PASSWORD)

- Setup (Administration)

You can navigate to http://localhost:5601/app/management/opensearch-dashboards/settings to make many kind of 
configurations according you like.
