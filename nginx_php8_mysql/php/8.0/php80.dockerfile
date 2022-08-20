FROM php:8.0-fpm

ENV DIR_WEBSERVER "/var/www/applications"
ENV DIR_PHP_EXTENSIONS "/usr/local/lib/php/extensions/no-debug-non-zts-20200930"
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

COPY ./drivers/instantclient.tar.bz2 /opt/oracle/

WORKDIR "/opt/oracle"
RUN cd /opt/oracle

RUN tar -xvf instantclient.tar.bz2
RUN alien -i /opt/oracle/oracle-instantclient11.2-basic-11.2.0.4.0-1.x86_64.rpm
RUN alien -i /opt/oracle/oracle-instantclient11.2-sqlplus-11.2.0.4.0-1.x86_64.rpm
RUN alien -i /opt/oracle/oracle-instantclient11.2-devel-11.2.0.4.0-1.x86_64.rpm
RUN echo "/usr/lib/oracle/11.2/client64/lib" > /etc/ld.so.conf.d/oracle.conf
RUN ldconfig

ENV ORACLE_SID ORCLCDB
ENV PATH="/usr/lib/oracle/11.2/:$PATH"
ENV ORACLE_HOME="/usr/lib/oracle/11.2/client64/"
ENV TNS_ADMIN "/usr/lib/oracle/11.2/client64/network/admin"
ENV LD_LIBRARY_PATH="/usr/lib/oracle/11.2/client64/lib/:$LD_LIBRARY_PATH"

RUN export ORACLE_HOME
RUN export LD_LIBRARY_PATH
RUN export PATH

#RUN C_INCLUDE_PATH=/usr/include/oracle/11.2/client64 pecl install oci8
#RUN pecl install oci8
#RUN pecl install pdo_oci

RUN cd -
WORKDIR "/opt"

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
RUN wget https://archlinux.org/packages/extra/x86_64/php-pgsql/download -O php-pgsql-8.0.10-1-x86_64.pkg.tar.zst
RUN tar -I zstd -xvf php-pgsql-8.0.10-1-x86_64.pkg.tar.zst
RUN cp usr/lib/php/modules/pgsql.so $DIR_PHP_EXTENSIONS/
RUN cp usr/lib/php/modules/pdo_pgsql.so $DIR_PHP_EXTENSIONS/
RUN printf ";priority=40\nextension=pgsql.so\n" > $DIR_PHP_INI_FILES/pgsql.ini
RUN printf ";priority=50\nextension=pdo_pgsql.so\n" > $DIR_PHP_INI_FILES/pdo_pgsql.ini
RUN phpenmod pgsql pdo_pgsql
RUN mv php-pgsql-8.0.10-1-x86_64.pkg.tar.zst usr /opt/postgres/

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

RUN wget https://github.com/FirebirdSQL/php-firebird/releases/download/v1.1.1/php-8.0.1-interbase-1.1.1-linux-x64.so
RUN cp php-8.0.1-interbase-1.1.1-linux-x64.so $DIR_PHP_EXTENSIONS/interbase.so
RUN printf ";priority=20\nextension=interbase.so\n" > $DIR_PHP_INI_FILES/interbase.ini
RUN printf ";priority=30\nextension=pdo_interbase.so\n" > $DIR_PHP_INI_FILES/pdo_interbase.ini
#RUN docker-php-ext-install pdo_interbase
RUN phpenmod interbase pdo_interbase
RUN mv php-8.0.1-interbase-1.1.1-linux-x64.so /opt/interbase/

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
RUN mkdir -p /home/shared/php80-ini
RUN mkdir -p /home/shared/php80-extensions
RUN chown nobody:nogroup /home/shared -R
RUN chmod 777 /home/shared -R

RUN mkdir -p /home/php80/php80-ini
RUN mkdir -p /home/php80/php80-extensions
RUN cp -r $DIR_PHP_INI/ /home/php80/php80-ini/
RUN cp -r $DIR_PHP_EXTENSIONS/ /home/php80/php80-extensions/
RUN chown nobody:nogroup /home/php80 -R
RUN chmod 777 /home/php80 -R

COPY ./conf/php.ini $DIR_PHP_INI/php.ini

EXPOSE 9000
CMD ["php-fpm"]
