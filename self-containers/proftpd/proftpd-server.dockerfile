FROM ubuntu:20.04

ARG PROFTPD_HOST_PORT
ARG PROFTPD_PORT
ARG PROFTPD_GROUP
ARG PROFTPD_USER
ARG PROFTPD_PASS
ARG PROFTPD_UID
ARG PROFTPD_PATH
ARG PROFTPD_SHELL

ENV PROFTPD_HOST_PORT $PROFTPD_HOST_PORT
ENV PROFTPD_PORT $PROFTPD_PORT
ENV PROFTPD_GROUP $PROFTPD_GROUP
ENV PROFTPD_USER $PROFTPD_USER
ENV PROFTPD_PASS $PROFTPD_PASS
ENV PROFTPD_UID $PROFTPD_UID
ENV PROFTPD_PATH $PROFTPD_PATH
ENV PROFTPD_SHELL $PROFTPD_SHELL

ENV TZ=America/Sao_Paulo
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

# UPDATE
RUN apt-get update -y
RUN apt-get upgrade -y

# PROFTPD
RUN apt install proftpd -y

# OPENSSH
RUN apt install openssh-server -y

COPY ./bin/create-proftpd-user /usr/local/bin/create-proftpd-user

EXPOSE $PROFTPD_PORT

ENTRYPOINT ["create-proftpd-user"]
