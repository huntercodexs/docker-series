FROM ubuntu:20.04

ENV DIR_APPS "/home/python3/applications"

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

COPY ./nginx/nginx.conf /etc/nginx/nginx.conf
COPY ./nginx/proxy.conf /etc/nginx/proxy.conf
COPY ./nginx/fastcgi.conf /etc/nginx/fastcgi.conf
COPY ./nginx/mime.types /etc/nginx/mime.types
COPY ./nginx/conf.d/ /etc/nginx/conf.d/
COPY ./nginx/sites-available/ /etc/nginx/sites-available/
COPY ./nginx/sites-enabled/ /etc/nginx/sites-enabled/
COPY ./nginx/logs/ /var/log/nginx/
COPY ./nginx/htdocs/ /var/www/htdocs/
COPY ./applications/ $DIR_APPS/

RUN useradd --no-create-home nginx

#------------------------------------------------------------------------------------------------------
## PYTHON-3
#------------------------------------------------------------------------------------------------------
RUN apt install -y python3-pip python3-dev build-essential libssl-dev libffi-dev python3-setuptools
RUN apt install -y python3-venv

# TRY START APPLICATIONS
COPY ./applications/applications-deploy.sh /usr/bin/applications-deploy
RUN /usr/bin/applications-deploy

#------------------------------------------------------------------------------------------------------
## FINISHED SETTINGS
#------------------------------------------------------------------------------------------------------

EXPOSE 85
EXPOSE 8585

CMD ["nginx", "-g", "daemon off;"]
