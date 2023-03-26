FROM ubuntu:20.04

ENV DIR_APPS "/home/nodejs/applications"

RUN mkdir -p $DIR_APPS
RUN chmod 777 $DIR_APPS
RUN chown nobody:nogroup $DIR_APPS

WORKDIR $DIR_APPS

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
RUN apt install -y curl

#------------------------------------------------------------------------------------------------------
## NGINX
#------------------------------------------------------------------------------------------------------
RUN apt-get install -y nginx

COPY ./server/etc/nginx/nginx.conf /etc/nginx/nginx.conf
COPY ./server/etc/nginx/proxy.conf /etc/nginx/proxy.conf
COPY ./server/etc/nginx/fastcgi.conf /etc/nginx/fastcgi.conf
COPY ./server/etc/nginx/mime.types /etc/nginx/mime.types
COPY ./server/etc/nginx/conf.d/ /etc/nginx/conf.d/
COPY ./server/etc/nginx/sites-available/ /etc/nginx/sites-available/
COPY ./server/etc/nginx/sites-enabled/ /etc/nginx/sites-enabled/
COPY ./server/etc/nginx/logs/ /var/log/nginx/
COPY ./server/htdocs/ /var/www/htdocs/
COPY ./applications/ $DIR_APPS/

RUN useradd --no-create-home nginx

#------------------------------------------------------------------------------------------------------
## FINISHED SETTINGS
#------------------------------------------------------------------------------------------------------

WORKDIR $DIR_APPS

EXPOSE 85
EXPOSE 8585

CMD ["nginx", "-g", "daemon off;"]
