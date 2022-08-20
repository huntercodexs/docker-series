FROM php:8.1.0-fpm

ENV DIR_WEBSERVER "/var/www/applications"
ENV DIR_PHP_EXTENSIONS "/usr/local/lib/php/extensions/no-debug-non-zts-20210902"
ENV DIR_PHP_INI "/usr/local/etc/php"
ENV DIR_PHP_INI_FILES "/usr/local/etc/php/conf.d"

ENV DIR_MS_ORACLE "/var/www/applications/microservice-oraclelinux"
ENV DIR_MS_MONGODB "/var/www/applications/microservice-mongodb"
ENV DIR_MS_POSTGRES "/var/www/applications/microservice-postgres"
ENV DIR_MS_MSSQL "/var/www/applications/microservice-mssql"
ENV DIR_MS_FIREBIRD "/var/www/applications/microservice-firebird"
ENV DIR_MS_MYSQL57 "/var/www/applications/microservice-mysql57"
ENV DIR_MS_MYSQL80 "/var/www/applications/microservice-mysql80"
ENV DIR_MS_SQLITE "/var/www/applications/microservice-sqlite"

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
#RUN apt install -y ldconfig
#---------------------------------------------------------------------------------------------------------
RUN apt-get install -y libaio1
RUN apt-get install -y tzdata

#---------------------------------------------------------------------------------------------------------
## ESSENTIAL
#---------------------------------------------------------------------------------------------------------
RUN apt-get install -y zstd
RUN apt install -y php-common/stable
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
RUN pecl config-set php_ini $DIR_PHP_INI/php.ini

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
RUN mv php-pgsql-8.1.0-x86_64.pkg.tar.zst usr /opt/postgres/

RUN cd -

#---------------------------------------------------------------------------------------------------------
## MSSQL
#---------------------------------------------------------------------------------------------------------
RUN mkdir -p /opt/microsoft

RUN curl https://packages.microsoft.com/keys/microsoft.asc | apt-key add -
RUN curl https://packages.microsoft.com/config/ubuntu/20.04/prod.list > /etc/apt/sources.list.d/mssql-release.list
RUN apt-get update -y
RUN apt-get upgrade -y
RUN ACCEPT_EULA=Y apt-get install -y msodbcsql17
RUN ACCEPT_EULA=Y apt-get install -y mssql-tools
RUN apt-get install -y unixodbc-dev
RUN pecl config-set php_ini $DIR_PHP_INI/php.ini
RUN pecl install sqlsrv
RUN pecl install pdo_sqlsrv
RUN printf "; priority=20\nextension=sqlsrv.so\n" > $DIR_PHP_INI_FILES/sqlsrv.ini
RUN printf "; priority=30\nextension=pdo_sqlsrv.so\n" > $DIR_PHP_INI_FILES/pdo_sqlsrv.ini
RUN phpenmod sqlsrv pdo_sqlsrv
RUN echo 'export PATH="$PATH:/opt/microsoft/mssql-tools/bin"' >> ~/.bashrc
RUN mv mssql-tools microsoft/

RUN cd -

#---------------------------------------------------------------------------------------------------------
## FIREBIRD [IS NOT AVAILABLE]
#---------------------------------------------------------------------------------------------------------
RUN mkdir -p /opt/firebird

RUN cd /opt/firebird

RUN apt install -y firebird-dev
RUN docker-php-ext-install pdo_firebird
RUN docker-php-ext-configure pdo_firebird --with-pdo-firebird
RUN phpenmod firebird pdo_firebird

COPY ./conf/firebird-client.conf /etc/firebird/3.0/firebird.conf

RUN cd -

#---------------------------------------------------------------------------------------------------------
## INTERBASE [IS NOT AVAILABLE]
#---------------------------------------------------------------------------------------------------------
RUN mkdir -p /opt/interbase

RUN cd /opt/interbase

RUN wget https://github.com/FirebirdSQL/php-firebird/releases/download/v1.1.1/php-8.1.3-interbase-1.1.1-linux-x64.so
RUN cp php-8.1.3-interbase-1.1.1-linux-x64.so $DIR_PHP_EXTENSIONS/interbase.so
RUN printf ";priority=20\nextension=interbase.so\n" > $DIR_PHP_INI_FILES/interbase.ini
RUN printf ";priority=30\nextension=pdo_interbase.so\n" > $DIR_PHP_INI_FILES/pdo_interbase.ini
#RUN docker-php-ext-install pdo_interbase
RUN phpenmod interbase pdo_interbase
RUN mv php-8.1.3-interbase-1.1.1-linux-x64.so /opt/interbase/

RUN cd -

#---------------------------------------------------------------------------------------------------------
## MYSQL
#---------------------------------------------------------------------------------------------------------
RUN mkdir -p /opt/mysql

RUN cd /opt/mysql

RUN docker-php-ext-install pdo_mysql
RUN docker-php-ext-install mysqli && docker-php-ext-enable mysqli
RUN phpenmod mysqli mysql pdo_mysql

RUN cd -

#---------------------------------------------------------------------------------------------------------
## SQLITE (LOCALHOST)
#---------------------------------------------------------------------------------------------------------
RUN mkdir -p /opt/sqlite

RUN cd /opt/sqlite

RUN apt-get install sqlite3 -y
RUN apt-get install libsqlite3-dev -y
RUN docker-php-ext-install pdo_sqlite

RUN cd -

#---------------------------------------------------------------------------------------------------------
## REDIS
#---------------------------------------------------------------------------------------------------------
RUN mkdir -p /opt/redis

RUN cd /opt/redis

RUN pecl install redis
RUN echo "extension=redis.so" > $DIR_PHP_INI_FILES/redis.ini
RUN echo "date.timezone=America/Sao_Paulo" > $DIR_PHP_INI_FILES/timezone_sao_paulo.ini
RUN echo "memory_limit = 1024M" > $DIR_PHP_INI_FILES/memory_limit.ini

RUN cd -

#---------------------------------------------------------------------------------------------------------
## WEBSERVER SETTINGS FINAL
#---------------------------------------------------------------------------------------------------------
RUN mkdir -p $DIR_WEBSERVER
RUN groupadd docker_series -g 999
RUN useradd docker_series -g docker_series -d $DIR_WEBSERVER
RUN chown nobody:nogroup $DIR_WEBSERVER -R

# Share data from container to host
RUN mkdir -p /home/shared/php81-ini
RUN mkdir -p /home/shared/php81-extensions
RUN chown nobody:nogroup /home/shared -R
RUN chmod 777 /home/shared -R

RUN mkdir -p /home/php81/php81-ini
RUN mkdir -p /home/php81/php81-extensions
RUN cp -r $DIR_PHP_INI/ /home/php81/php81-ini/
RUN cp -r $DIR_PHP_EXTENSIONS/ /home/php81/php81-extensions/
RUN chown nobody:nogroup /home/php81 -R
RUN chmod 777 /home/php81 -R

COPY ./conf/php.ini $DIR_PHP_INI/php.ini

EXPOSE 9000
CMD ["php-fpm"]
