FROM ubuntu:20.04

WORKDIR /home/ubuntu/rpm_debian_converter

# UPDATE
RUN apt-get update -y
RUN apt-get upgrade -y

EXPOSE 35900
