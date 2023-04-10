FROM ubuntu:20.04

ENV CADIR=/home/causer/easy-rsa
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
RUN mkdir -p $CADIR

# EASY RSA
RUN echo "EASY RSA STARTED........................................................."
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
RUN echo 'set_var EASYRSA_REQ_COUNTRY    "BR"' > varsx
RUN echo 'set_var EASYRSA_REQ_PROVINCE   "SaoPaulo"' >> vars
RUN echo 'set_var EASYRSA_REQ_CITY       "Taubate"' >> vars
RUN echo 'set_var EASYRSA_REQ_ORG        "Huntercodexs"' >> vars
RUN echo 'set_var EASYRSA_REQ_EMAIL      "huntercodexs@gmail.com"' >> vars
RUN echo 'set_var EASYRSA_REQ_OU         "Software"' >> vars
RUN echo 'set_var EASYRSA_ALGO           "ec"' >> vars
RUN echo 'set_var EASYRSA_DIGEST         "sha512"' >> vars
RUN echo -ne '.\n' | ./easyrsa build-ca nopass
# Share the ca file in tmp folder path
RUN cat $CADIR/pki/ca.crt >> /tmp/ca.crt
RUN chmod 700 -R $CADIR
RUN chown causer:causer -R $CADIR
RUN ls
RUN echo "EASY RSA FINISHED........................................................."

EXPOSE 80
EXPOSE 443
EXPOSE 8080
EXPOSE 35900
