FROM php:8.2.13-fpm

ENV DIR_WEBSERVER "/var/www/webserver"
ENV DIR_PHP_EXTENSIONS "/usr/local/lib/php/extensions/no-debug-non-zts-20220829"
ENV DIR_PHP_INI "/usr/local/etc/php"
ENV DIR_PHP_INI_FILES "/usr/local/etc/php/conf.d"
ENV DIR_PHP_HOME "/home/php"

ENV DIR_APP_ORACLE "/var/www/webserver/application-oraclelinux"
ENV DIR_APP_MONGODB "/var/www/webserver/application-mongodb"
ENV DIR_APP_POSTGRES "/var/www/webserver/application-postgres"
ENV DIR_APP_MSSQL "/var/www/webserver/application-mssql"
ENV DIR_APP_FIREBIRD "/var/www/webserver/application-firebird"
ENV DIR_APP_MYSQL57 "/var/www/webserver/application-mysql57"
ENV DIR_APP_MYSQL80 "/var/www/webserver/application-mysql80"
ENV DIR_APP_SQLITE "/var/www/webserver/application-sqlite"

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

RUN apt update

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
## ORACLE
#---------------------------------------------------------------------------------------------------------
RUN mkdir -p /opt/oracle

RUN cd /opt/oracle

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

RUN cd -

#---------------------------------------------------------------------------------------------------------
## MONGODB
#---------------------------------------------------------------------------------------------------------
RUN mkdir -p /opt/mongodb

RUN cd /opt/mongodb

RUN composer --ignore-platform-req=ext-mongodb require mongodb/mongodb

RUN mkdir -p $DIR_APP_MONGODB
RUN chown nobody:nogroup $DIR_APP_MONGODB -R
RUN chmod 777 $DIR_APP_MONGODB -R
RUN cp -r vendor /opt/mongodb/
RUN cp composer.* /opt/mongodb/
RUN cp -r vendor $DIR_APP_MONGODB/
RUN cp composer.* $DIR_APP_MONGODB/
RUN rm -r vendor
RUN rm /opt/composer.*

RUN cd -

#---------------------------------------------------------------------------------------------------------
## MSSQL
#---------------------------------------------------------------------------------------------------------
RUN mkdir -p /opt/microsoft

RUN cd /opt/microsoft

RUN curl https://packages.microsoft.com/keys/microsoft.asc | apt-key add -
RUN curl https://packages.microsoft.com/config/ubuntu/20.04/prod.list > /etc/apt/sources.list.d/mssql-release.list
RUN apt-get update -y
RUN apt-get upgrade -y
RUN ACCEPT_EULA=Y apt-get install -y msodbcsql17
RUN ACCEPT_EULA=Y apt-get install -y mssql-tools
RUN apt-get install -y unixodbc-dev
RUN mv mssql-tools microsoft/

RUN cd -

#---------------------------------------------------------------------------------------------------------
## MYSQL
#---------------------------------------------------------------------------------------------------------
RUN mkdir -p /opt/mysql

#---------------------------------------------------------------------------------------------------------
## REDIS
#---------------------------------------------------------------------------------------------------------
RUN mkdir -p /opt/redis

#---------------------------------------------------------------------------------------------------------
## SQLITE (LOCALHOST)
#---------------------------------------------------------------------------------------------------------
RUN mkdir -p /opt/sqlite

#---------------------------------------------------------------------------------------------------------
## POSTGRES [IT IS NOT AVAILABLE YET]
#---------------------------------------------------------------------------------------------------------
RUN mkdir -p /opt/postgres

RUN cd /opt/postgres

RUN apt install -y postgresql postgresql-contrib

RUN cd -

#---------------------------------------------------------------------------------------------------------
## FIREBIRD [IT IS NOT AVAILABLE YET]
#---------------------------------------------------------------------------------------------------------
RUN mkdir -p /opt/firebird

RUN cd /opt/firebird

RUN apt install -y firebird-dev

COPY ./conf/config/firebird-client.conf /etc/firebird/3.0/firebird.conf

RUN cd -

#---------------------------------------------------------------------------------------------------------
## INTERBASE [IT IS NOT AVAILABLE YET]
#---------------------------------------------------------------------------------------------------------
RUN mkdir -p /opt/interbase

#---------------------------------------------------------------------------------------------------------
## WEBSERVER SETTINGS FINAL
#---------------------------------------------------------------------------------------------------------
RUN mkdir -p $DIR_WEBSERVER
RUN groupadd docker_series -g 999
RUN useradd docker_series -g docker_series -d $DIR_WEBSERVER
RUN chown nobody:nogroup $DIR_WEBSERVER -R

COPY ./conf/ini/php/php.ini $DIR_PHP_INI/php.ini
COPY ./conf/ini/*.ini $DIR_PHP_INI_FILES/

COPY ./conf/extensions/php-8.2.13-compiled-extensions.zip $DIR_PHP_EXTENSIONS/
RUN unzip -o $DIR_PHP_EXTENSIONS/php-8.2.13-compiled-extensions.zip -d $DIR_PHP_EXTENSIONS

EXPOSE 9000
CMD ["php-fpm"]
