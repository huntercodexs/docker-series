FROM php:7.2.1-fpm

ENV DIR_WEBSERVER "/var/www/webserver"
ENV DIR_PHP_EXTENSIONS "/usr/local/lib/php/extensions/no-debug-non-zts-20160303"
ENV DIR_PHP_INI "/usr/local/etc/php"
ENV DIR_PHP_INI_FILES "/usr/local/etc/php/conf.d"

WORKDIR "/opt"

#---------------------------------------------------------------------------------------------------------
## PREPARE
#---------------------------------------------------------------------------------------------------------
RUN echo 'deb http://httpredir.debian.org/debian jessie contrib' >> /etc/apt/sources.list

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
    libbz2-dev \
    libpq-dev \
    libicu-dev

RUN docker-php-ext-install bz2
#---------------------------------------------------------------------------------------------------------
## EXTRAS
#---------------------------------------------------------------------------------------------------------
RUN apt install -y nano
RUN apt install -y wget
RUN apt install -y ufw
RUN apt install -y lsof
RUN apt install -y alien
RUN apt install -y vim
#RUN apt install -y ldconfig
RUN apt-get install -y libaio1
RUN apt-get install -y tzdata

#---------------------------------------------------------------------------------------------------------
## ESSENTIAL
#---------------------------------------------------------------------------------------------------------
RUN apt-get install -y zstd
#RUN apt install -y php-common/stable
RUN apt-get install -y gnupg2

#---------------------------------------------------------------------------------------------------------
## ZIP
#---------------------------------------------------------------------------------------------------------
RUN apt-get install -y \
    libzip-dev \
    zip \
    && docker-php-ext-install zip

#---------------------------------------------------------------------------------------------------------
## PDO
#---------------------------------------------------------------------------------------------------------
RUN docker-php-ext-install pdo
RUN docker-php-ext-install pdo pdo_mysql

#---------------------------------------------------------------------------------------------------------
## GD
#---------------------------------------------------------------------------------------------------------
RUN apt-get install -y libfreetype6-dev libjpeg62-turbo-dev libpng16-16
RUN docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/
RUN docker-php-ext-install gd
RUN docker-php-ext-install gd mysqli
RUN docker-php-ext-install dom
RUN docker-php-ext-install intl

#---------------------------------------------------------------------------------------------------------
## PHP LIBRARIES
#---------------------------------------------------------------------------------------------------------
RUN apt-get update
RUN export DEBIAN_FRONTEND=noninteractive
RUN apt-get install -y --force-yes  \
    libssl-dev  \
    curl  \
    libcurl4-gnutls-dev  \
    libxml2-dev  \
    libicu-dev  \
    libmcrypt4  \
    libmemcached11  \
    openssl

RUN docker-php-ext-install opcache
RUN docker-php-ext-install bcmath
RUN docker-php-ext-install mbstring
RUN pecl install apcu-5.1.5 && docker-php-ext-enable apcu

#---------------------------------------------------------------------------------------------------------
## XDEBUG
#---------------------------------------------------------------------------------------------------------
#RUN pecl install xdebug
#RUN docker-php-ext-enable xdebug
#RUN echo "xdebug.client_port=9000" >> $DIR_PHP_INI_FILES/xdebug.ini
#RUN echo "xdebug.mode=develop,coverage,debug,gcstats,profile,trace" >> $DIR_PHP_INI_FILES/xdebug.ini
#RUN echo "xdebug.discover_client_host=true" >> $DIR_PHP_INI_FILES/xdebug.ini

#---------------------------------------------------------------------------------------------------------
## REDIS
#---------------------------------------------------------------------------------------------------------
RUN pecl install redis
RUN echo "extension=redis.so" > $DIR_PHP_INI_FILES/redis.ini
RUN echo "date.timezone=America/Sao_Paulo" > $DIR_PHP_INI_FILES/timezone_sao_paulo.ini
RUN echo "memory_limit = 1024M" > $DIR_PHP_INI_FILES/memory_limit.ini

#---------------------------------------------------------------------------------------------------------
## COMPOSER
#---------------------------------------------------------------------------------------------------------
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

#---------------------------------------------------------------------------------------------------------
## WEBSERVER SETTINGS FINAL
#---------------------------------------------------------------------------------------------------------
RUN mkdir -p $DIR_WEBSERVER
RUN groupadd docker_series -g 999
RUN useradd docker_series -g docker_series -d $DIR_WEBSERVER
RUN chown nobody:nogroup $DIR_WEBSERVER -R

COPY ./conf/php.ini $DIR_PHP_INI/php.ini

EXPOSE 9000
CMD ["php-fpm"]