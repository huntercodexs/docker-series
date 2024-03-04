FROM ubuntu:20.04

ENV TZ=America/Sao_Paulo
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

WORKDIR /home/ubuntu/rpm_debian_converter

# UPDATE
RUN apt-get update -y
RUN apt-get upgrade -y

# ALIEN X RPM
#RUN add-apt-repository universe
RUN apt update -y
RUN apt install -y alien rpm

EXPOSE 80
EXPOSE 8080
EXPOSE 38989
