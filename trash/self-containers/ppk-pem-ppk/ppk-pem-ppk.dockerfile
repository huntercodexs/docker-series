FROM ubuntu:20.04

ARG PPK_KEY_NAME
ARG PEM_KEY_NAME

ENV TZ=America/Sao_Paulo
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

# UPDATE
RUN apt-get update -y
RUN apt-get upgrade -y

# PUTTY CONVERTER
RUN apt-get install putty-tools

WORKDIR /home/ppk-pem-ppk/result/

EXPOSE 35900
