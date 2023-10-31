FROM ubuntu:20.04

#---------------------------------------------------------------------------------------------------------
## UPDATE
#---------------------------------------------------------------------------------------------------------
RUN apt-get update && apt-get upgrade -y \
	libonig-dev \
	libmcrypt-dev \
	zlib1g-dev \
	libpng-dev \
	libxml2-dev

#---------------------------------------------------------------------------------------------------------
## LIBRARIES
#---------------------------------------------------------------------------------------------------------
RUN apt-get install -y \
    libcurl4-openssl-dev \
    pkg-config \
    libssl-dev \
    build-essential \
    libaio1  \
    libaio-dev \
    libstdc++5 \
    libncurses5  \
    libtommath1 \
    apt-utils

#---------------------------------------------------------------------------------------------------------
## ZIP
#---------------------------------------------------------------------------------------------------------
RUN apt-get install -y libzip-dev && apt-get install -y zip

#---------------------------------------------------------------------------------------------------------
## EXTRAS
#---------------------------------------------------------------------------------------------------------
RUN apt install -y nano
RUN apt install -y wget
RUN apt install -y ufw
RUN apt install -y lsof
RUN apt install -y alien
RUN apt install -y vim

#---------------------------------------------------------------------------------------------------------
#RUN apt install -y ldconfig
#---------------------------------------------------------------------------------------------------------
RUN apt-get install -y libaio1
RUN apt-get install -y tzdata

#---------------------------------------------------------------------------------------------------------
## FIREBIRD SERVER DATABASE
#---------------------------------------------------------------------------------------------------------
ARG TZ
ARG ISC_PASSWORD
ARG FIREBIRD_USER
ARG FIREBIRD_DBNAME

ENV TZ $TZ
ENV ISC_PASSWORD $ISC_PASSWORD
ENV FIREBIRD_USER $FIREBIRD_USER
ENV FIREBIRD_DBNAME $FIREBIRD_DBNAME
ENV DEBIAN_FRONTEND noninteractive

RUN export TZ
RUN export ISC_PASSWORD
RUN export FIREBIRD_USER
RUN export FIREBIRD_DBNAME
RUN export DEBIAN_FRONTEND

RUN ldconfig

RUN apt-get update -y
RUN apt-get install -y firebird-dev firebird3.0 firebird3.0-common firebird3.0-server
#RUN apt-get install firebird3.0-server -y
RUN dpkg-preconfigure firebird3.0-server

EXPOSE 3050

WORKDIR /etc/firebird/3.0

CMD ["firebird"]