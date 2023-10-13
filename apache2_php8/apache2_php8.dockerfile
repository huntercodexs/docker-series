FROM ubuntu/apache2

WORKDIR /var/www/html

ENV DIR_WWW /var/www/html

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
    apt-get install -y zip

## EXTRAS
RUN apt install -y nano
RUN apt install -y wget
RUN apt install -y ufw
RUN apt install -y lsof
RUN apt install -y alien
#RUN apt install -y ldconfig
RUN apt-get install -y libaio1
RUN apt-get install -y tzdata

## PHP INSTALL
RUN apt-get -y install php8.0 libapache2-mod-php8.0
RUN service apache2 restart

## ESSENTIAL
RUN apt-get install -y zstd
RUN apt install -y php-common

## COMPOSER
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

RUN groupadd docker_series -g 999
RUN useradd docker_series -g docker_series -d $DIR_WWW

COPY ./apache2/conf/app.conf /etc/apache2/sites-available/app.conf
COPY ./apache2/conf/000-default.conf /etc/apache2/sites-available/000-default.conf

RUN a2ensite app.conf
RUN a2ensite 000-default.conf

RUN service apache2 restart
RUN a2enmod rewrite

COPY ./app/* /var/www/html/

EXPOSE 80
EXPOSE 8080
EXPOSE 38989
