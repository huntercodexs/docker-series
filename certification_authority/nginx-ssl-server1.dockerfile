FROM ubuntu:20.04

ARG NGINX_SSL_1_COUNTRY
ARG NGINX_SSL_1_STATE
ARG NGINX_SSL_1_CITY
ARG NGINX_SSL_1_ORGANIZATION
ARG NGINX_SSL_1_ORGANIZATION_UNIT_NAME
ARG NGINX_SSL_1_COMMON_NAME
ARG NGINX_SSL_1_EMAIL_ADDRESS

ENV NGINXDIR=/etc/nginx
ENV TZ=America/Sao_Paulo
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

# UPDATE
RUN apt-get update -y
RUN apt-get upgrade -y

# ESSENTIALS
RUN apt install build-essential -y \
    checkinstall -y  \
    zlib1g-dev -y

# NGINX
RUN apt-get install nginx -y
RUN adduser nginx
RUN su nginx

# LIBS
RUN apt install openssl -y
RUN apt-get install net-tools -y
RUN apt install openssh-server -y

# GENERATE A CSR CERTIFICATE - REQ
RUN cd /tmp/
WORKDIR /tmp/
RUN openssl genrsa -out $NGINX_SSL_1_COMMON_NAME.key
RUN openssl req -new \
    -key $NGINX_SSL_1_COMMON_NAME.key \
    -out $NGINX_SSL_1_COMMON_NAME.req \
    -subj /C=$NGINX_SSL_1_COUNTRY/ST=$NGINX_SSL_1_STATE/L=$NGINX_SSL_1_CITY/O=$NGINX_SSL_1_ORGANIZATION/OU=$NGINX_SSL_1_ORGANIZATION_UNIT_NAME/CN=$NGINX_SSL_1_COMMON_NAME/emailAddress=$NGINX_SSL_1_EMAIL_ADDRESS
RUN openssl req -in $NGINX_SSL_1_COMMON_NAME.req -noout -subject
RUN chown nginx:nginx /tmp/$NGINX_SSL_1_COMMON_NAME.key
RUN chown nginx:nginx /tmp/$NGINX_SSL_1_COMMON_NAME.req
RUN ls

WORKDIR $NGINXDIR

EXPOSE 80
EXPOSE 443
EXPOSE 8080
EXPOSE 35900

CMD ["nginx", "-g", "daemon off;"]
