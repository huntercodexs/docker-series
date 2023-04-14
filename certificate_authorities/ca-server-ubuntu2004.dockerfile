FROM ubuntu:20.04

# SERVER SETTINGS (ENV)
ARG CA_SERVER_COUNTRY
ARG CA_SERVER_PROVINCE
ARG CA_SERVER_CITY
ARG CA_SERVER_ORG
ARG CA_SERVER_EMAIL
ARG CA_SERVER_ORGANIZATION_UNIT_NAME
ARG CA_SERVER_ALGORITHM
ARG CA_SERVER_DIGEST
ENV HOMEDIR=/home/causer
ENV CADIR=$HOMEDIR/easy-rsa

ENV TZ=America/Sao_Paulo
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

# UPDATE
RUN apt-get update -y
RUN apt-get upgrade -y

# ESSENTIALS
RUN apt install build-essential -y \
    checkinstall -y  \
    zlib1g-dev -y
RUN apt-get install net-tools -y

# UPDATE
RUN apt-get update -y
RUN apt-get upgrade -y

# FIREWALL
RUN apt-get install ufw -y

# OPENSSL
RUN apt install openssl -y

# OPENSSH
RUN apt install openssh-server -y

# IPTABLES
RUN apt-get install --reinstall iptables

# CREATE USER
RUN adduser causer
RUN usermod -aG sudo causer
RUN chown causer:causer -R $HOMEDIR
RUN mkdir -p $CADIR

# EASY RSA
RUN echo "EASY RSA STARTED"
RUN apt install easy-rsa -y
RUN su causer
RUN mkdir -p $CADIR
WORKDIR $CADIR/
RUN ln -s /usr/share/easy-rsa/* $CADIR/
RUN chmod 700 $CADIR
RUN cd $CADIR/
RUN ./easyrsa init-pki
RUN touch vars
RUN ls

RUN echo 'set_var EASYRSA_REQ_COUNTRY    "$CA_SERVER_COUNTRY"' > varsx
RUN echo 'set_var EASYRSA_REQ_PROVINCE   "$CA_SERVER_PROVINCE"' >> vars
RUN echo 'set_var EASYRSA_REQ_CITY       "$CA_SERVER_CITY"' >> vars
RUN echo 'set_var EASYRSA_REQ_ORG        "$CA_SERVER_ORG"' >> vars
RUN echo 'set_var EASYRSA_REQ_EMAIL      "$CA_SERVER_EMAIL"' >> vars
RUN echo 'set_var EASYRSA_REQ_OU         "$CA_SERVER_ORGANIZATION_UNIT_NAME"' >> vars
RUN echo 'set_var EASYRSA_ALGO           "$CA_SERVER_ALGORITHM"' >> vars
RUN echo 'set_var EASYRSA_DIGEST         "$CA_SERVER_DIGEST"' >> vars

RUN echo "$CA_SERVER_ORG\n" | ./easyrsa build-ca nopass

# Share the ca file in tmp folder path
RUN cat $CADIR/pki/ca.crt >> /tmp/ca.crt
RUN chmod 700 -R $CADIR
RUN chown causer:causer -R $CADIR
RUN chown causer:causer /tmp/ca.crt
RUN ls
RUN echo "EASY RSA FINISHED"

EXPOSE 80
EXPOSE 443
EXPOSE 8080
EXPOSE 35900
