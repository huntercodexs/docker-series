FROM ubuntu:20.04

#------------------------------------------------------------------------------------------------------
## UPDATE
#------------------------------------------------------------------------------------------------------
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
    libaio-dev

#---------------------------------------------------------------------------------------------------------
## EXTRAS
#---------------------------------------------------------------------------------------------------------
RUN apt install -y nano
RUN apt install -y wget
RUN apt install -y ufw
RUN apt install -y lsof
RUN apt install -y alien
RUN apt install -y vim

#------------------------------------------------------------------------------------------------------
## NGINX
#------------------------------------------------------------------------------------------------------
RUN apt-get install -y nginx

COPY ./etc/nginx/nginx.conf /etc/nginx/nginx.conf
COPY ./etc/nginx/conf.d/ /etc/nginx/conf.d/
COPY ./etc/nginx/sites-available/ /etc/nginx/sites-available/
COPY ./etc/nginx/sites-enabled/ /etc/nginx/sites-enabled/
COPY ./etc/nginx/snippets/ /etc/nginx/snippets/

RUN ln -s /etc/nginx/sites-available/php80.example.com /etc/nginx/sites-enabled/
RUN ln -s /etc/nginx/sites-available/php81.example.com /etc/nginx/sites-enabled/

RUN useradd --no-create-home nginx

EXPOSE 9090
EXPOSE 39000

CMD ["nginx", "-g", "daemon off;"]
