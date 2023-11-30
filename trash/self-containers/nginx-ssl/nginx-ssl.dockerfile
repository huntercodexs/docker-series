FROM ubuntu:20.04

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

# LIBS
RUN apt install openssl -y

# COMMANDS
RUN mkdir -p /etc/nginx/ssl

EXPOSE 80
EXPOSE 443
EXPOSE 8080
EXPOSE 35900

CMD ["nginx", "-g", "daemon off;"]
