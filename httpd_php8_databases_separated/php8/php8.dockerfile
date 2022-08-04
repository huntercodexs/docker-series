FROM php:8.1.0-fpm

ENV DIR_WWW "/var/www/webserver"

WORKDIR "/opt"

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
    libssl-dev \
    build-essential \
    libaio1  \
    libaio-dev

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
RUN apt install -y vim

#RUN apt install -y ldconfig
RUN apt-get install -y libaio1
RUN apt-get install -y tzdata

## ESSENTIAL
RUN apt-get install -y zstd
RUN apt install -y php-common/stable

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
RUN ls
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

## PDO
RUN docker-php-ext-install pdo

## ORACLE
RUN mkdir -p /opt/oracle

RUN wget https://download.oracle.com/otn_software/linux/instantclient/193000/instantclient-sdk-linux.x64-19.3.0.0.0dbru.zip
RUN wget https://download.oracle.com/otn_software/linux/instantclient/193000/instantclient-basic-linux.x64-19.3.0.0.0dbru.zip
RUN wget https://download.oracle.com/otn_software/linux/instantclient/193000/instantclient-sqlplus-linux.x64-19.3.0.0.0dbru.zip

RUN unzip instantclient-sdk-linux.x64-19.3.0.0.0dbru.zip
RUN unzip instantclient-basic-linux.x64-19.3.0.0.0dbru.zip
RUN unzip instantclient-sqlplus-linux.x64-19.3.0.0.0dbru.zip

RUN mv /opt/instantclient_19_3 /opt/oracle/instantclient
RUN mv /opt/instantclient*.zip /opt/oracle/

ENV ORACLE_SID ORCLCDB
ENV ORACLE_HOME /opt/oracle/instantclient
ENV PATH /opt/oracle/instantclient/:$PATH
ENV TNS_ADMIN /opt/oracle/instantclient/network/admin
ENV LD_LIBRARY_PATH /opt/oracle/instantclient/:$LD_LIBRARY_PATH

RUN export PATH
RUN export TNS_ADMIN
RUN export ORACLE_SID
RUN export ORACLE_HOME
RUN export LD_LIBRARY_PATH

RUN ldconfig

RUN pecl channel-update pecl.php.net

RUN docker-php-ext-configure pdo_oci --with-pdo-oci=instantclient,/opt/oracle/instantclient,19.3 \
&& echo 'instantclient,/opt/oracle/instantclient/' | pecl install oci8 \
&& docker-php-ext-install \
        pdo_oci \
&& docker-php-ext-enable \
        oci8

RUN mkdir $DIR_WWW
RUN groupadd docker_series -g 999
RUN useradd docker_series -g docker_series -d $DIR_WWW
RUN chown nobody:nogroup $DIR_WWW -R

# Share data from oracle files
RUN mkdir -p /home/shared/php8-ini
RUN mkdir -p /home/shared/php8-extensions
RUN chown nobody:nogroup /home/shared -R
RUN chmod 777 /home/shared -R

RUN mkdir -p /home/php8/php8-ini
RUN mkdir -p /home/php8/php8-extensions
RUN cp -r /usr/local/etc/php/ /home/php8/php8-ini/
RUN cp -r /usr/local/lib/php/extensions/no-debug-non-zts-20210902/ /home/php8/php8-extensions/
RUN chown nobody:nogroup /home/php8 -R
RUN chmod 777 /home/php8 -R

COPY ./shared/php8-ini/php/php.ini /usr/local/etc/php/php.ini

EXPOSE 9000
CMD ["php-fpm"]
