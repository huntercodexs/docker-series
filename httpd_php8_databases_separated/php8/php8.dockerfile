FROM php:8.1.0-fpm

ENV DIR_WWW "/var/www/webserver"

WORKDIR "/data/oracle_files/"

## UPDATE
RUN apt-get update && apt-get upgrade -y \
	libonig-dev \
	libmcrypt-dev \
	zlib1g-dev \
	libpng-dev \
	libxml2-dev \
    build-essential  \
    libaio1

## LIBRARIES
RUN apt-get install -y \
    libcurl4-openssl-dev \
    pkg-config \
    libssl-dev

## NODE
#RUN apt-get install -y gnupg2
#RUN rm -rf /var/lib/apt/lists/ && \
#    curl -sL https://deb.nodesource.com/setup_12.x | bash -
#RUN apt-get install nodejs -y

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

## MYSQL
RUN docker-php-ext-install pdo pdo_mysql
#RUN docker-php-ext-install mysqli && docker-php-ext-enable mysqli

## PDO-SQLSRV (MSSQL) (Ubuntu 20.04)
#RUN curl https://packages.microsoft.com/keys/microsoft.asc | apt-key add -
#RUN curl https://packages.microsoft.com/config/ubuntu/20.04/prod.list > /etc/apt/sources.list.d/mssql-release.list
#RUN apt-get update && apt-get upgrade -y
#RUN ACCEPT_EULA=Y apt-get install -y msodbcsql17
#RUN ACCEPT_EULA=Y apt-get install -y mssql-tools
##RUN echo 'export PATH="$PATH:/opt/mssql-tools/bin"' >> ~/.bashrc
##RUN source ~/.bashrc
#RUN apt-get install -y unixodbc-dev
#RUN pecl config-set php_ini /usr/local/etc/php/conf.d/php.ini
#RUN pecl install sqlsrv
#RUN pecl install pdo_sqlsrv
#RUN printf "; priority=20\nextension=sqlsrv.so\n" > /usr/local/etc/php/conf.d/sqlsrv.ini
#RUN printf "; priority=30\nextension=pdo_sqlsrv.so\n" > /usr/local/etc/php/conf.d/pdo_sqlsrv.ini
#RUN phpenmod sqlsrv pdo_sqlsrv

## POSTGRES
#RUN apt install -y postgresql postgresql-contrib
#RUN wget https://archlinux.org/packages/extra/x86_64/php-pgsql/download -O php-pgsql-8.0.10-1-x86_64.pkg.tar.zst
#RUN tar -I zstd -xvf php-pgsql-8.0.10-1-x86_64.pkg.tar.zst
#RUN cp usr/lib/php/modules/pgsql.so /usr/local/lib/php/extensions/no-debug-non-zts-20200930/
#RUN cp usr/lib/php/modules/pdo_pgsql.so /usr/local/lib/php/extensions/no-debug-non-zts-20200930/
#RUN printf "; priority=40\nextension=pgsql.so\n" > /usr/local/etc/php/conf.d/pgsql.ini
#RUN printf "; priority=50\nextension=pdo_pgsql.so\n" > /usr/local/etc/php/conf.d/pdo_pgsql.ini
#RUN phpenmod pgsql pdo_pgsql
#RUN docker-php-ext-install pdo pdo_pgsql

## MONGODB
#RUN pecl install mongodb
#RUN printf "; priority=60\nextension=mongodb.so\n" > /usr/local/etc/php/conf.d/mongodb.ini
#RUN phpenmod mongodb
#RUN pecl config-set php_ini /usr/local/etc/php/conf.d/php.ini
#RUN mkdir -p $DIR_WWW
#RUN chmod 777 $DIR_WWW
#RUN cd $DIR_WWW
#RUN composer require mongodb/mongodb

## ORACLE
#LINK: https://rosemberg.net.br/pt/php7-com-pdo_oci-e-oci8-no-docker/
#LINK: https://github.com/rosemberg-al/docker-php7-pdo_oci-oci8/blob/master/Dockerfile
#LINK: https://medium.com/@gabrielveigalima/trabalhando-com-python-oracle-database-e-docker-1cb04fc82b46
#LINK: https://github.com/gabrielveigalima/python-oracle-databse-docker/blob/master/Dockerfile
#LINK: https://diegofranca.dev/2020/05/05/configurando-o-oci8-e-pdo_oci-no-php7/

#wget https://www.php.net/distributions/php-8.1.0.tar.gz
#tar -xvf php-8.1.0.tar.gz
#cp php-8.1.0/ext/oci8 >
#cp php-8.1.0/ext/pdo_oci >

#https://download.oracle.com/otn_software/linux/instantclient/1916000/instantclient-sdk-linux.x64-19.16.0.0.0dbru.zip
#https://download.oracle.com/otn_software/linux/instantclient/1916000/instantclient-basic-linux.x64-19.16.0.0.0dbru.zip

ENV LD_LIBRARY_PATH="/usr/lib/oracle/11.2/client64/lib/:$LD_LIBRARY_PATH"
ENV ORACLE_HOME="/usr/lib/oracle/11.2/client64/"
ENV PATH="/usr/lib/oracle/11.2/:$PATH"

RUN mkdir -p /data/oracle_files/
COPY ./php-drivers/oracle/instantclient/*.rpm /data/oracle_files/
COPY ./php-drivers/oracle/lib /data/oracle_files/

RUN alien -i /data/oracle_files/oracle-instantclient11.2-basic-11.2.0.4.0-1.x86_64.rpm
RUN alien -i /data/oracle_files/oracle-instantclient11.2-sqlplus-11.2.0.4.0-1.x86_64.rpm
RUN alien -i /data/oracle_files/oracle-instantclient11.2-devel-11.2.0.4.0-1.x86_64.rpm
RUN echo "/usr/lib/oracle/11.2/client64/lib" > /etc/ld.so.conf.d/oracle.conf
RUN ldconfig
RUN export ORACLE_HOME
RUN export LD_LIBRARY_PATH
RUN export PATH
RUN C_INCLUDE_PATH=/usr/include/oracle/11.2/client64 pecl install oci8

#COPY ./php-drivers/oracle/lib/oci8/* /data/oracle_files/
# Make install
#RUN ls
#RUN pwd
#RUN phpize
#RUN ./configure --with-oci8=/usr/lib/oracle/11.2/client64/
#RUN make
#RUN make install

#COPY ./php-drivers/oracle/lib/pdo_oci/* /data/oracle_files/
#RUN ls
#RUN phpize
#RUN ./configure --with-pdo-oci=/usr/lib/oracle/11.2/client64/lib
#RUN make
#RUN make install

#RUN a2enmod rewrite
RUN phpenmod oci8 pdo_oci
RUN printf "; priority=70\nextension=oci8.so\n" > /usr/local/etc/php/conf.d/oci8.ini
RUN printf "; priority=80\nextension=pdo_oci.so\n" > /usr/local/etc/php/conf.d/pdo_oci.ini
#RUN rm -rf /data/oracle_files

## REDIS
#RUN pecl install redis
#RUN echo "extension=redis.so" > /usr/local/etc/php/conf.d/redis.ini
#RUN echo "date.timezone=America/Sao_Paulo" > /usr/local/etc/php/conf.d/timezone_sao_paulo.ini
#RUN echo "memory_limit = 1024M" > /usr/local/etc/php/conf.d/memory_limit.ini

RUN groupadd docker_series -g 999
RUN useradd docker_series -g docker_series -d $DIR_WWW

EXPOSE 9000
CMD ["php-fpm"]
