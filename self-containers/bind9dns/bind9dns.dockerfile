FROM ubuntu:20.04

ENV TZ=America/Sao_Paulo
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

# UPDATE
RUN apt-get update -y
RUN apt-get upgrade -y
RUN apt update -y
RUN apt upgrade -y

# ESSENTIALS
RUN apt install build-essential -y \
    checkinstall -y  \
    zlib1g-dev -y
RUN apt-get install net-tools -y

# UPDATE
RUN apt-get update -y
RUN apt-get upgrade -y
RUN apt update -y
RUN apt upgrade -y

# FIREWALL
RUN apt-get install ufw -y

# OPENSSL
RUN apt install openssl -y

# OPENSSH
RUN apt install openssh-server -y

# IPTABLES
RUN apt-get install --reinstall iptables

# BIND9
RUN apt install bind9 -y
RUN apt install bind9utils -y
RUN apt install bind9-doc dnsutils -y

# DNS UTILS
RUN apt-get install dnsutils -y

WORKDIR /etc/bind/

EXPOSE 35900
