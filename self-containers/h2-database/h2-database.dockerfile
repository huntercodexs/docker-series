FROM ubuntu:20.04

ARG H2DATABASE_DBNAME
ARG H2DATABASE_USERNAME
ARG H2DATABASE_GROUP
ARG H2DATABASE_HOME
ARG H2DATABASE_VERSION
ARG H2DATABASE_ZIPFILE
ARG H2DATABASE_ADMIN_PASSWORD
ARG H2DATABASE_HOST_PORT
ARG H2DATABASE_HOST_PORT
ARG H2DATABASE_HOST_ADDITIONAL_PORT
ARG H2DATABASE_HOST_TCP_PORT
ARG H2DATABASE_TCP_SERVER_PORT
ARG H2DATABASE_HOST_HTTP_PORT
ARG H2DATABASE_HTTP_SERVER_PORT

ENV H2DATABASE_DBNAME ${H2DATABASE_DBNAME}
ENV H2DATABASE_USERNAME ${H2DATABASE_USERNAME}
ENV H2DATABASE_GROUP ${H2DATABASE_GROUP}
ENV H2DATABASE_HOME ${H2DATABASE_HOME}
ENV H2DATABASE_VERSION ${H2DATABASE_VERSION}
ENV H2DATABASE_ZIPFILE ${H2DATABASE_ZIPFILE}
ENV H2DATABASE_ADMIN_PASSWORD ${H2DATABASE_ADMIN_PASSWORD}
ENV H2DATABASE_HOST_PORT ${H2DATABASE_HOST_PORT}
ENV H2DATABASE_TCP_SERVER_PORT ${H2DATABASE_TCP_SERVER_PORT}
ENV H2DATABASE_HTTP_SERVER_PORT ${H2DATABASE_HTTP_SERVER_PORT}

# DO NOT CHANGE THIS ENV
# Use just /usr, the result will be /usr/bin/java inside container from script build.sh
ENV JAVA_HOME "/usr"

ENV TZ=America/Sao_Paulo
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

# UPDATE
RUN apt-get update -y
RUN apt-get upgrade -y

# TOOLS
RUN apt install -y wget
RUN apt-get install zip -y
RUN apt install -y ufw
RUN apt install -y vim

# UPDATE
RUN apt-get update -y
RUN apt-get upgrade -y

# JAVA
RUN apt-get install openjdk-8-jdk -y

# H2 DATABASE
RUN groupadd $H2DATABASE_GROUP -g 999
RUN useradd $H2DATABASE_USERNAME -g $H2DATABASE_GROUP -d $H2DATABASE_HOME
RUN mkdir -p $H2DATABASE_HOME/database
RUN chown $H2DATABASE_USERNAME:$H2DATABASE_GROUP $H2DATABASE_HOME -R
RUN chmod 777 $H2DATABASE_HOME -R
USER h2-user
RUN cd $H2DATABASE_HOME/database
WORKDIR $H2DATABASE_HOME/database
RUN wget https://github.com/h2database/h2database/releases/download/$H2DATABASE_VERSION/$H2DATABASE_ZIPFILE
RUN unzip $H2DATABASE_ZIPFILE
RUN ls
RUN pwd
RUN cd h2/
RUN touch $H2DATABASE_HOME/$H2DATABASE_DBNAME.mv.db

COPY ./bin/start-h2-database-server /usr/local/bin/start-h2-database-server
COPY ./bin/db-init.sql $H2DATABASE_HOME/db-init.sql

EXPOSE $H2DATABASE_HOST_ADDITIONAL_PORT
EXPOSE $H2DATABASE_TCP_SERVER_PORT
EXPOSE $H2DATABASE_HTTP_SERVER_PORT

ENTRYPOINT ["start-h2-database-server"]