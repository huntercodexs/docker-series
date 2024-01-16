FROM ubuntu:18.04

# UPDATE
RUN apt-get update -y
RUN apt-get upgrade -y

EXPOSE 35900
