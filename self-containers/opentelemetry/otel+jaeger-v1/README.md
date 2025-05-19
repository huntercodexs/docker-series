# OPEN TELEMETRY + JAEGER V1

- How to run opentelemety from this project use

<pre>
user@host:/home/user$ git clone https://github.com/huntercodexs/docker-series.git .
user@host:/home/user$ cd docker-series/self-containers/opentelemetry/otel+jaeger-v1
user@host:/home/user/docker-series/self-containers/opentelemetry$ docker-compose up --build
user@host:/home/user/docker-series/self-containers/opentelemetry$ docker-compose start
</pre>

- Access the Jaeger application

```text
http://localhost:16686
```
![jaeger-ui.png](jaeger-ui.png)

- Tip

You can use some java application to run together this opentelemetry sample repository, for example using a Java Agent.
The command below show us how to do it

```shell
java -javaagent:otel/opentelemetry-javaagent.jar -Dotel.service.name=opentelemetry-reactive-sample -Dotel.traces.exporter=otlp -Dotel.metrics.exporter=none -Dotel.exporter.otlp.endpoint=http://localhost:4318 -Dotel.exporter.otlp.protocol=http/protobuf -jar target/*.jar
```
