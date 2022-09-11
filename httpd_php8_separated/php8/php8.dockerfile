FROM php:8.0-fpm

ENV DIR_WWW "/var/www/webserver"

WORKDIR $DIR_WWW

## UPDATE
RUN apt-get update && apt-get upgrade -y \
	libonig-dev \
	libmcrypt-dev \
	zlib1g-dev \
	libpng-dev \
	libxml2-dev

## LIBRARIES
RUN apt-get install -y \
    libcurl4-openssl-dev \
    pkg-config \
    libssl-dev

## ZIP
RUN apt-get install -y libzip-dev && \
    apt-get install -y zip && \
    docker-php-ext-install zip

## EXTRAS
RUN apt install -y nano
RUN apt install -y wget
RUN apt install -y ufw
RUN apt install -y lsof
RUN apt install -y alien
#RUN apt install -y ldconfig
RUN apt-get install -y libaio1
RUN apt-get install -y tzdata

## ESSENTIAL
RUN apt-get install -y zstd
RUN apt install -y php-common/stable

## PDO
#RUN docker-php-ext-install pdo
#RUN docker-php-ext-install pdo pdo_mysql

## GD
RUN docker-php-ext-configure gd
RUN docker-php-ext-install gd
RUN docker-php-ext-install gd mysqli
RUN docker-php-ext-install dom
RUN docker-php-ext-install intl

## PHP LIBRARIES
RUN docker-php-ext-install opcache
RUN docker-php-ext-install bcmath
RUN docker-php-ext-install mbstring

## XDEBUG
#RUN pecl install xdebug
#RUN docker-php-ext-enable xdebug
#RUN echo "xdebug.client_port=9000" >> /usr/local/etc/php/conf.d/xdebug.ini
#RUN echo "xdebug.mode=develop,coverage,debug,gcstats,profile,trace" >> /usr/local/etc/php/conf.d/xdebug.ini
#RUN echo "xdebug.discover_client_host=true" >> /usr/local/etc/php/conf.d/xdebug.ini

## COMPOSER
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

RUN groupadd docker_series -g 999
RUN useradd docker_series -g docker_series -d $DIR_WWW

EXPOSE 9000
CMD ["php-fpm"]
