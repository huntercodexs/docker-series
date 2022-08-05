FROM php:8.1.0-fpm

ENV DIR_WEBSERVER "/var/www/webserver"
ENV DIR_PHP_EXTENSIONS "/usr/local/lib/php/extensions/no-debug-non-zts-20210902"
ENV DIR_PHP_INI "/usr/local/etc/php"
ENV DIR_PHP_INI_FILES "/usr/local/etc/php/conf.d"

ENV DIR_MS_ORACLE "/var/www/webserver/microservice-oraclelinux"
ENV DIR_MS_MONGODB "/var/www/webserver/microservice-mongodb"
ENV DIR_MS_POSTGRES "/var/www/webserver/microservice-postgres"

WORKDIR "/opt"

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

#RUN apt install -y ldconfig
#---------------------------------------------------------------------------------------------------------
RUN apt-get install -y libaio1
RUN apt-get install -y tzdata

#---------------------------------------------------------------------------------------------------------
## ESSENTIAL
#---------------------------------------------------------------------------------------------------------
RUN apt-get install -y zstd
RUN apt install -y php-common/stable

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
## ORACLE
#---------------------------------------------------------------------------------------------------------
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

#---------------------------------------------------------------------------------------------------------
## MONGODB
#---------------------------------------------------------------------------------------------------------
RUN mkdir -p /opt/mongodb

RUN pecl install mongodb
RUN printf ";priority=60\nextension=mongodb.so\n" > $DIR_PHP_INI_FILES/mongodb.ini
RUN phpenmod mongodb
RUN pecl config-set php_ini /usr/local/etc/php/php.ini

RUN cd /opt/mongodb
RUN composer require mongodb/mongodb

RUN mkdir -p $DIR_MS_MONGODB
RUN chown nobody:nogroup $DIR_MS_MONGODB -R
RUN chmod 777 $DIR_MS_MONGODB -R
RUN cp -r vendor /opt/mongodb/
RUN cp composer.* /opt/mongodb/
RUN cp -r vendor $DIR_MS_MONGODB/
RUN cp composer.* $DIR_MS_MONGODB/
RUN rm -r vendor
RUN rm /opt/composer.*

RUN cd -

#---------------------------------------------------------------------------------------------------------
## POSTGRES
#---------------------------------------------------------------------------------------------------------
RUN mkdir -p /opt/postgres

RUN cd /opt/postgres

RUN apt install -y postgresql postgresql-contrib
RUN wget https://archlinux.org/packages/extra/x86_64/php-pgsql/download -O php-pgsql-8.1.0-x86_64.pkg.tar.zst
RUN tar -I zstd -xvf php-pgsql-8.1.0-x86_64.pkg.tar.zst
RUN cp usr/lib/php/modules/pgsql.so $DIR_PHP_EXTENSIONS/
RUN cp usr/lib/php/modules/pdo_pgsql.so $DIR_PHP_EXTENSIONS/
RUN printf ";priority=40\nextension=pgsql.so\n" > $DIR_PHP_INI_FILES/pgsql.ini
RUN printf ";priority=50\nextension=pdo_pgsql.so\n" > $DIR_PHP_INI_FILES/pdo_pgsql.ini
RUN phpenmod pgsql pdo_pgsql

RUN cd -

#---------------------------------------------------------------------------------------------------------
## WEBSERVER SETTINGS FINAL
#---------------------------------------------------------------------------------------------------------
RUN mkdir -p $DIR_WEBSERVER
RUN groupadd docker_series -g 999
RUN useradd docker_series -g docker_series -d $DIR_WEBSERVER
RUN chown nobody:nogroup $DIR_WEBSERVER -R

# Share data from container to host
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
