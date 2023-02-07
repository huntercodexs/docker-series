# Docker Series
Um projeto para trabalhar com muitos containers docker

# Idiomas

- Language: Portugues Brazil (pt-br)  |  <a href="README-EN.md">Inglês (en)</a>

# Sobre

Por favor, use o seletor de branchs para acessar outras configurações de ambientes

# Docker Setup

> Instalando o Docker

- Update OS

<pre>
$ sudo apt update
</pre>

- Instale os pre requisitos

<pre>
$ sudo apt install apt-transport-https ca-certificates curl software-properties-common
</pre>

- Adicione a chave GPG do repositório oficial docker

<pre>
$ curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
</pre>

- Adicione o repositório docker APT 

<pre>
$ sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu focal stable"
</pre>

- Certifique-se de que tenha instalado o docker-ce

<pre>
$ apt-cache policy docker-ce
$ sudo apt install docker-ce
</pre>

- Verifique o status do serviço docker

<pre>
$ sudo systemctl status docker
</pre>

- Faça com que o usuário padrão tenha acesso ao comando docker

<pre>
$ sudo usermod -aG docker ${USER}
$ su - ${USER}
$ sudo usermod -aG docker username
</pre>

> Alguns comandos docker

<pre>
docker ps
docker run
docker images ls
docker image ls
docker container ls
docker volumes ls
docker system prune -a
docker rmi -v ${IMAGE_ID}
docker network create ${NETWORK_NAME}

**
docker exec -it ${CONTAINER_NAME} [${COMMAND}[OPTIONS]]
**

[Example]
docker exec -it mailhog-ubuntu2004 /bin/bash
</pre>

> Instalando o docker compose

- Installing the current release of docker-comopse

<pre>
$ sudo curl -L "https://github.com/docker/compose/releases/download/1.26.0/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
</pre>

- Faça com o que o docker-compose fique executável

<pre>
$ sudo chmod +x /usr/local/bin/docker-compose
</pre>

- Verifique a versão do docker-compose instalada

<pre>
$ docker-compose --version
</pre>

> Limpe o ambiente ou a máquina hospedeira caso seja necessário 

<pre>
docker network rm ${NETWORK_NAME}
docker-compose down --volumes
docker system prune -a
    WARNING! This will remove:
      - all stopped containers
      - all networks not used by at least one container
      - all images without at least one container associated to them
      - all build cache
    
    Are you sure you want to continue? [y/N] y
</pre>

> Alguns comandos docker-compose para ajuda

<pre>
docker-compose ps
docker-compose --build
docker-compose up --build
docker-compose up -d
docker-compose up
docker-compose start
docker-compose stop
docker-compose down [--volumes]
docker-compose logs
docker-compose pause
docker-compose unpause
</pre>

# Configurações Docker Contidas

> ![img.png](./self-containers/files/midias/check-green.png) Disponível
> ![img.png](./self-containers/files/midias/check-silver.png) Pendente
> ![img.png](./self-containers/files/midias/unavailable.png) Não Disponível

> Servidores Web

- <a href="https://github.com/huntercodexs/docker-series/tree/master/self-containers/apache2">Apache2</a> ![img.png](./self-containers/files/midias/check-green.png)
- <a href="https://github.com/huntercodexs/docker-series/tree/master/self-containers/nginx">Nginx</a> ![img.png](./self-containers/files/midias/check-green.png)
- <a href="https://github.com/huntercodexs/docker-series/tree/master/self-containers/nginx-ssl">Nginx + Let's Encrypt</a> ![img.png](./self-containers/files/midias/check-silver.png)
- <a href="https://github.com/huntercodexs/docker-series/tree/master/self-containers/httpd">HTTPD</a> 
  - <a href="https://github.com/huntercodexs/docker-series/tree/master/self-containers/httpd/2.4.54">2.4.54</a> ![img.png](./self-containers/files/midias/check-green.png)
- <a href="https://github.com/huntercodexs/docker-series/tree/master/self-containers/tomcat">Tomcat</a>
  - <a href="https://github.com/huntercodexs/docker-series/tree/master/self-containers/tomcat/9.0">9.0</a> ![img.png](./self-containers/files/midias/check-green.png)

> Servidores de Email

- <a href="https://github.com/huntercodexs/docker-series/tree/master/self-containers/mailhog">MailHog</a> ![img.png](./self-containers/files/midias/check-green.png)
- <a href="https://github.com/huntercodexs/docker-series/tree/master/self-containers/postfixadmin">PostFix Admin</a> ![img.png](./self-containers/files/midias/check-green.png)

> Distribuições Linux

- <a href="https://github.com/huntercodexs/docker-series/tree/master/self-containers/alpine">Alpine</a> ![img.png](./self-containers/files/midias/check-green.png)
- <a href="https://github.com/huntercodexs/docker-series/tree/master/self-containers/centos">CentOS</a> ![img.png](./self-containers/files/midias/check-green.png)
- <a href="https://github.com/huntercodexs/docker-series/tree/master/self-containers/amazonlinux">Amazon Linux</a> ![img.png](./self-containers/files/midias/check-green.png)
- <a href="https://github.com/huntercodexs/docker-series/tree/master/self-containers/ubuntu">Ubuntu</a>
  - <a href="https://github.com/huntercodexs/docker-series/tree/master/self-containers/ubuntu/ubuntu1804">18.04 LTS</a> ![img.png](./self-containers/files/midias/check-green.png)
  - <a href="https://github.com/huntercodexs/docker-series/tree/master/self-containers/ubuntu/ubuntu2004">20.04 LTS</a> ![img.png](./self-containers/files/midias/check-green.png)

> Banco de dados

- <a href="https://github.com/huntercodexs/docker-series/tree/master/self-containers/mysql">MySQL</a>
  - <a href="https://github.com/huntercodexs/docker-series/tree/master/self-containers/mysql/mysql-57">5.7</a> ![img.png](./self-containers/files/midias/check-green.png)
  - <a href="https://github.com/huntercodexs/docker-series/tree/master/self-containers/mysql/mysql-80">8.0</a> ![img.png](./self-containers/files/midias/check-green.png)
- <a href="https://github.com/huntercodexs/docker-series/tree/master/self-containers/microsoft/mssql">MsSQL</a> ![img.png](./self-containers/files/midias/check-green.png)
- <a href="https://github.com/huntercodexs/docker-series/tree/master/self-containers/oracle">Oracle Linux 19c</a> ![img.png](./self-containers/files/midias/check-green.png)
- <a href="https://github.com/huntercodexs/docker-series/tree/master/self-containers/sqlite3">SQLite3</a> ![img.png](./self-containers/files/midias/check-green.png)
- <a href="https://github.com/huntercodexs/docker-series/tree/master/self-containers/firebird">Firebird</a> ![img.png](./self-containers/files/midias/check-green.png)
- Interbase ![img.png](./self-containers/files/midias/unavailable.png)
- <a href="https://github.com/huntercodexs/docker-series/tree/master/self-containers/mongodb">MongoDB</a> ![img.png](./self-containers/files/midias/check-green.png)
- <a href="https://github.com/huntercodexs/docker-series/tree/master/self-containers/postgres">Postgres</a> ![img.png](./self-containers/files/midias/check-green.png)

> Ferramentas, Logs e Rastreadores

- <a href="https://github.com/huntercodexs/docker-series/tree/master/self-containers/elasticsearch">Elasticsearch</a> ![img.png](./self-containers/files/midias/check-green.png)
- <a href="https://github.com/huntercodexs/docker-series/tree/master/self-containers/logstash">Logstash</a> ![img.png](./self-containers/files/midias/check-green.png)
- <a href="https://github.com/huntercodexs/docker-series/tree/master/self-containers/kibana">Kibana</a> ![img.png](./self-containers/files/midias/check-green.png)
- <a href="https://github.com/huntercodexs/docker-series/tree/master/self-containers/zipkin">Zipkin</a> ![img.png](./self-containers/files/midias/check-green.png)
- <a href="https://github.com/huntercodexs/docker-series/tree/master/self-containers/prometheus">Prometheus</a> ![img.png](./self-containers/files/midias/check-green.png)

> Dashboards

- <a href="https://github.com/huntercodexs/docker-series/tree/master/self-containers/grafana">Grafana</a> ![img.png](./self-containers/files/midias/check-green.png)
- <a href="https://github.com/huntercodexs/docker-series/tree/master/self-containers/grafana-ubuntu">Grafana Ubuntu</a> ![img.png](./self-containers/files/midias/check-green.png)

> Linguagens

- <a href="https://github.com/huntercodexs/docker-series/tree/master/self-containers/php">PHP</a>
  - <a href="https://github.com/huntercodexs/docker-series/tree/master/self-containers/php/5.6">5.6</a> ![img.png](./self-containers/files/midias/check-green.png)
  - <a href="https://github.com/huntercodexs/docker-series/tree/master/self-containers/php/7.1">7.1</a> ![img.png](./self-containers/files/midias/check-green.png)
  - <a href="https://github.com/huntercodexs/docker-series/tree/master/self-containers/php/7.2">7.2</a> ![img.png](./self-containers/files/midias/check-green.png)
  - <a href="https://github.com/huntercodexs/docker-series/tree/master/self-containers/php/7.4">7.4</a> ![img.png](./self-containers/files/midias/check-green.png)
  - <a href="https://github.com/huntercodexs/docker-series/tree/master/self-containers/php/8.0">8.0</a> ![img.png](./self-containers/files/midias/check-green.png)
  - <a href="https://github.com/huntercodexs/docker-series/tree/master/self-containers/php/8.1">8.1</a> ![img.png](./self-containers/files/midias/check-green.png)
- <a href="https://github.com/huntercodexs/docker-series/tree/master/self-containers/java">Java</a>
  - <a href="https://github.com/huntercodexs/docker-series/tree/master/self-containers/java/openjdk-8u212">openjdk-8u212</a> ![img.png](./self-containers/files/midias/check-green.png)
  - openjdk-8u221 ![img.png](./self-containers/files/midias/check-silver.png)
  - openjdk-8u231 ![img.png](./self-containers/files/midias/check-silver.png)
  - openjdk-8u333 ![img.png](./self-containers/files/midias/check-silver.png)
  - openjdk-11 ![img.png](./self-containers/files/midias/check-silver.png)
  - openjdk-11.0.6 ![img.png](./self-containers/files/midias/check-silver.png)
  - openjdk-11.0.15 ![img.png](./self-containers/files/midias/check-silver.png)
  - openjdk-11.0.15.1 ![img.png](./self-containers/files/midias/check-silver.png)
  - <a href="https://github.com/huntercodexs/docker-series/tree/master/self-containers/java/openjdk-17.0.1">openjdk-17.0.1</a> ![img.png](./self-containers/files/midias/check-green.png)
  - openjdk-17.0.2 ![img.png](./self-containers/files/midias/check-silver.png)
  - openjdk-17.0.4 ![img.png](./self-containers/files/midias/check-silver.png)
- <a href="https://github.com/huntercodexs/docker-series/tree/master/self-containers/python">Python</a>
  - <a href="https://github.com/huntercodexs/docker-series/tree/master/self-containers/python/2.0">2.0</a> ![img.png](./self-containers/files/midias/check-silver.png)
  - <a href="https://github.com/huntercodexs/docker-series/tree/master/self-containers/python/3.0">3.0</a> ![img.png](./self-containers/files/midias/check-green.png)
- <a href="https://github.com/huntercodexs/docker-series/tree/master/self-containers/nodejs">Nodejs</a>
  - 10.1.9 ![img.png](./self-containers/files/midias/check-silver.png)
  - <a href="https://github.com/huntercodexs/docker-series/tree/master/self-containers/nodejs/18.7.0">18.7.0</a> ![img.png](./self-containers/files/midias/check-green.png)

> Outros

- <a href="https://github.com/huntercodexs/docker-series/tree/master/self-containers/redis">Redis</a> ![img.png](./self-containers/files/midias/check-green.png)
- <a href="https://github.com/huntercodexs/docker-series/tree/master/self-containers/swagger">Swagger</a> 
  - <a href="https://github.com/huntercodexs/docker-series/tree/master/self-containers/swagger/swagger-ui">Swagger UI</a> ![img.png](./self-containers/files/midias/check-green.png)
  - <a href="https://github.com/huntercodexs/docker-series/tree/master/self-containers/swagger/swagger-editor">Editor</a> ![img.png](./self-containers/files/midias/check-green.png)
  - <a href="https://github.com/huntercodexs/docker-series/tree/master/self-containers/swagger/swagger-generator">Generator</a> ![img.png](./self-containers/files/midias/check-green.png)
- <a href="https://github.com/huntercodexs/docker-series/tree/master/self-containers/jenkins">Jenkins</a>
  - <a href="https://github.com/huntercodexs/docker-series/tree/master/self-containers/jenkins/2.0">2.0 (Ubuntu-20.04)</a> ![img.png](./self-containers/files/midias/check-green.png)
  - <a href="https://github.com/huntercodexs/docker-series/tree/master/self-containers/jenkins/2.46.2">2.46.2 (Official)</a> ![img.png](./self-containers/files/midias/unavailable.png)
  - <a href="https://github.com/huntercodexs/docker-series/tree/master/self-containers/jenkins/2.60.3">2.60.3 (Official)</a> ![img.png](./self-containers/files/midias/unavailable.png)
  - <a href="https://github.com/huntercodexs/docker-series/tree/master/self-containers/jenkins/2.190.1">2.190.1 (Official)</a> ![img.png](./self-containers/files/midias/unavailable.png)
  - <a href="https://github.com/huntercodexs/docker-series/tree/master/self-containers/jenkins/2.346.3">2.346.3 (Official)</a> ![img.png](./self-containers/files/midias/check-green.png)
- <a href="https://github.com/huntercodexs/docker-series/tree/master/self-containers/rpm">RPM</a>
  - <a href="https://github.com/huntercodexs/docker-series/tree/master/self-containers/rpm/amazonlinux">Amazonlinux</a> ![img.png](./self-containers/files/midias/check-green.png)
  - <a href="https://github.com/huntercodexs/docker-series/tree/master/self-containers/rpm/centos">Centos</a> ![img.png](./self-containers/files/midias/check-green.png)
  - <a href="https://github.com/huntercodexs/docker-series/tree/master/self-containers/rpm/fedora">Fedora</a> ![img.png](./self-containers/files/midias/check-green.png)
  - <a href="https://github.com/huntercodexs/docker-series/tree/master/self-containers/rpm/redhat">Redhat</a> ![img.png](./self-containers/files/midias/check-green.png)
  - <a href="https://github.com/huntercodexs/docker-series/tree/master/self-containers/rpm/rockylinux">Rockylinux</a> ![img.png](./self-containers/files/midias/check-green.png)


# Como usar este projeto
 
> Acesse a pasta /self-container deste projeto para rodar algum container, exemplo: apache2

- Etapas para rodar o container

<pre>
git clone https://github.com/huntercodexs/docker-series.git .
cd self-containers/apache2
docker-compose up --build (in first time)
docker-compose start (in the next times)
</pre>