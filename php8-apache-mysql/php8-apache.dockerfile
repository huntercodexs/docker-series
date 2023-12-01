FROM php:8.0-apache

ENV DIR_WEBSERVER "/var/www/webserver"
ENV DIR_PHP_EXTENSIONS "/usr/local/lib/php/extensions/no-debug-non-zts-20200930"
ENV DIR_PHP_INI "/usr/local/etc/php"
ENV DIR_PHP_INI_FILES "/usr/local/etc/php/conf.d"
ENV DIR_PHP_HOME "/home/php"

WORKDIR "/opt"

#---------------------------------------------------------------------------------------------------------
## UPDATE
#---------------------------------------------------------------------------------------------------------
RUN apt update
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
## ZIP
#---------------------------------------------------------------------------------------------------------
RUN apt-get install -y libzip-dev && \
    apt-get install -y zip && \
    docker-php-ext-install zip

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
# OTHERS
#---------------------------------------------------------------------------------------------------------
RUN apt-get install -y libaio1
RUN apt-get install -y tzdata
#RUN apt install -y ldconfig

#---------------------------------------------------------------------------------------------------------
## ESSENTIAL
#---------------------------------------------------------------------------------------------------------
RUN apt-get install -y zstd
RUN apt-get install -y gnupg2

#---------------------------------------------------------------------------------------------------------
## GD
#---------------------------------------------------------------------------------------------------------
RUN docker-php-ext-configure gd
RUN docker-php-ext-install gd
RUN docker-php-ext-install gd mysqli
RUN docker-php-ext-install dom
RUN docker-php-ext-install intl

#---------------------------------------------------------------------------------------------------------
## PHP LIBRARIES
#---------------------------------------------------------------------------------------------------------
RUN docker-php-ext-install opcache
RUN docker-php-ext-install bcmath
RUN docker-php-ext-install mbstring

#---------------------------------------------------------------------------------------------------------
## XDEBUG
#---------------------------------------------------------------------------------------------------------
#RUN pecl install xdebug
#RUN docker-php-ext-enable xdebug
#RUN echo "xdebug.client_port=9000" >> $DIR_PHP_INI_FILES/xdebug.ini
#RUN echo "xdebug.mode=develop,coverage,debug,gcstats,profile,trace" >> $DIR_PHP_INI_FILES/xdebug.ini
#RUN echo "xdebug.discover_client_host=true" >> $DIR_PHP_INI_FILES/xdebug.ini

#---------------------------------------------------------------------------------------------------------
## COMPOSER
#---------------------------------------------------------------------------------------------------------
RUN ls
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

#---------------------------------------------------------------------------------------------------------
## PDO
#---------------------------------------------------------------------------------------------------------
RUN docker-php-ext-install pdo

#---------------------------------------------------------------------------------------------------------
## MYSQL
#---------------------------------------------------------------------------------------------------------
RUN mkdir -p /opt/mysql

RUN cd /opt/mysql

RUN docker-php-ext-install pdo_mysql
RUN docker-php-ext-install mysqli && docker-php-ext-enable mysqli

RUN cd -

#---------------------------------------------------------------------------------------------------------
## WEBSERVER SETTINGS FINAL
#---------------------------------------------------------------------------------------------------------
RUN mkdir -p $DIR_WEBSERVER
RUN chown nobody:nogroup $DIR_WEBSERVER -R

#PHP INI FILES
COPY ./conf/php/ini/php.ini $DIR_PHP_INI/php.ini
COPY ./conf/php/ini/files/*.ini $DIR_PHP_INI_FILES/

#APACHE2 WEBSERVER
COPY ./conf/apache2/sites-available/ /etc/apache2/sites-available/
COPY ./conf/apache2/sites-enabled/ /etc/apache2/sites-enabled/
COPY ./conf/apache2/apache2.conf /etc/apache2/apache2.conf
COPY ./conf/apache2/ports.conf /etc/apache2/ports.conf

EXPOSE 9000
