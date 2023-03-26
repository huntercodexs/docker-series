FROM ubuntu:20.04

# UPDATE
RUN apt-get update -y
RUN apt-get upgrade -y
RUN apt install build-essential -y \
    checkinstall -y  \
    zlib1g-dev -y

# LIBS
RUN apt install openssl -y

EXPOSE 35900
